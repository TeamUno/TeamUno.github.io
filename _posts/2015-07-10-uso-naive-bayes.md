---
layout: post
title: Naive Bayes como herramienta contra la agregación y la segregación de datos
---

Dos de los problemas más importantes que nos hemos encontrado durante el desarrollo de la palicación tienen que ver con el hecho de que los datos estuvieran agregados y que además diferentes informaciones que queríamos utilizar para la aplicación se encontraran en distintas tablas que debíamos combinar para poder realizar una recomendación más precisa.

A pesar de que en un principio el desarrollo de la aplicación se planteó como un problema de filtraje de datos y presentación de resultados, hemos querido añadir el uso del modelo de Naive Bayes para realizar una clasificación de los códigos postales por la probabilidad de que el perfil del usuario de la aplicación los frecuente.

De este modo obtenemos dos beneficios:

1.- Permite agregar datos de diferentes tablas, con lo que con este sistema podríamos agregar selección de usuario para cualquier dato que tengamos en las tablas, como podría ser hora del día o código postal de procedencia del cliente, que se encuentran en dos tablas distintas.

2.- Permite asignar una probabilidad a CP’s que, por agregación, no aparecen en la tabla `demographics`, que es con la que estamos trabajando desde un principio con el método del filtraje.

A continuación se detalla la evolución del motor de clasificación una vez se determinó el uso de Naive Bayes como método clasificador.

Recordemos que lo que lo que pretendemos con la aplicación es determinar la probabilidad de que, por ejemplo, un **hombre** de **45-54 años**, de **Poble Sec**, un **martes**, fuera a **almorzar, comer o cenar** a Les **Corts**. Esto lo podemos expresar utilizando un modelo de Naive Bayes como

\begin{align}
p(\text{zipcode}|\text{selection}) =& p(\text{gender}|\text{zipcode})\times p(\text{age_interval}|\text{zipcode})\\\
&\times p(\text{customerzipcode}|\text{zipcode})\times p(\text{weekday}|\text{zipcode}),
\end{align}

donde cada probabilidad está normalizada para el **conjunto** de zipcodes con la corrección de Laplace correspondiente en cada caso. Recordemos que la corrección de Laplace se basa en la asignación de una probabilidad no nula para que una hipotética probabilidad nula en el productorio anule por completo la probabilidad final. Teniendo cada $$p$$ un origen frecuentista ($$p=\text{cuentas}/\text{total}$$), la probabilidad corregida por el método de Laplace es
\\[
\hat{p}=\frac{cuentas+1}{total+k},
\\]
siendo $$k$$ el número de clases posibles. 

Bueno, pues una vez aplicada la corrección de Laplace, el método de Naive Bayes funcionaba. Y funcionaba bien.

Pero después decidimos imputar los `unknown` según los datos de los *known*. Había `unknown` en las tablas `age_interval`, `gender`, y `customerzipcode`. Para la imputación, partiendo de las tablas “rellenas” con las correcciones de Laplace, calculamos para **cada** zipcode la probabilidad de cada *age_interval*, *gender*, o *customerzipcode*, respectivamente. Con esas probabilidades hacemos la imputación de los unknown. De esta forma, utilizando la **asunción que el BBVA tiene una distribución de clientes representativa del total**, recuperamos el 70% de los datos. Así podíamos volver a utilizar

\begin{align}
p(\text{zipcode}|\text{selection}) =& p(\text{gender}|\text{zipcode}) \times p(\text{age_interval}|\text{zipcode})\\\
&\times p(\text{customerzipcode}|\text{zipcode})\times  p(\text{weekday}|\text{zipcode}),
\end{align}

y parecía que funcionaba mejor que antes. 

Peero, decidimos no quedarnos ahí y utilizar una variable más: la hora del día. Hemos dividido el día en mañana, mediodía, y noche. El problema es que la tabla `expenditure-time_curve` no tiene `category`, por lo que corríamos el riesgo de estar asignando pagos a `barsandrestaurants` de otras categorías. Para solucionarlo lo que hicimos fue sacar de la tabla `basics` la proporción de pagos en `barsandrestaurants` de `cada` zipcode. Esa proporción es el factor multiplicativo que tendremos que aplicar al número de pagos en un time para cada zipcode. Añadimos un término multiplicativo extra $$\alpha$$ que tiene en cuenta que por la noche la proporción de pagos en `barsandrestaurants` es más alta que durante el día al estar el resto de categorías mayoritariamente cerradas. Con todo eso podemos calcular

\begin{align}
p(\text{zipcode}|\text{selection}) =& p(\text{gender}|\text{zipcode})\times p(\text{age_interval}|\text{zipcode})\\\
&\times p(\text{customerzipcode}|\text{zipcode})\times p(\text{time}|\text{zipcode})\\\
&\times p(\text{weekday}|\text{zipcode}),
\end{align}

y parecía que funcionaba mejor que antes.

Peeero (el último, palabra :D), después nos dimos cuenta que en realidad la probabilidad de `weekday` (que está sacada de la `basics`), está implícita en las tablas `age_interval`, `gender`, `customerzipcode` y `expenditure-time`. Por lo que recalculamos absolutamente todo lo explicado hasta ahora, pero sin agregar los `weekday`. **Así pues nos queda la siguiente expresión para decirnos dónde va una chica de 25-34 años, de Sant-Gervasi, un miércoles por la noche**:

\begin{align}
p(\text{zipcode}|\text{selection}) =& p(\text{gender,weekday}|\text{zipcode})\times p(\text{age_interval,weekday}|\text{zipcode})\\\
&\times p(\text{customerzipcode, weekday}|\text{zipcode})\times p(\text{time,weekday}|\text{zipcode}),
\end{align}

Y este último modelo es el que se utiliza en el motor de clasificación de la aplicación. De forma efectiva es como si hubiéramos desagredado las tablas del BBVA, y parece que funciona bastante bien. 😉