---
layout: post
title: Siguientes pasos
---
Al tratarse de un proyecto de poca duración, nos hemos encontrado con posibles mejoras que podíamos haber realizado sobre el producto que por falta de tiempo no hemos podido implementar.

A continuación las describimos, ya que son los pasos que hubiéramos seguido para utilizar mejor los datos que tenemos y por lo tanto mejorar la recomendación que hacemos al usuario.

- Utilización de datos meteorológicos para mejorar la recomendación.

Creemos que la climatología puede afectar mucho respecto los sitios “recomendables” para ir a comer o a cenar. Estamos seguros que las zonas de centros comerciales o que estén más resguardadas serán mejores que las zonas de playa para acudir un día lluvioso.

Nuestra idea consistía en utilizar datos de clima en Barcelona y poder creuzarlos con los datos de BBVA, para poder ver si hay variaciones en los días de lluvia y poder reocmendar códigos postales de destino en función de este apartado.

- Mejorar la base de datos de restaurantes

Después de utlizar Foursquare dadas las facilidades que ofrecía la API, hemos visto que tal vez realizando un scraping en otras webs, como por ejemplo Tripadvisor o BCNRestaurantes podríamos obtener una base de datos mayor, con más opciones de restaurantes para recomendar.

No se trata de un punto crítico par ala aplicación puesto que tenemos restaurantes suficientes para mostrar resultados útiles, pero creemos que se podria complementar la base de datos de restaurantes que tenemos con esta nueva información.

- Realizar un perfil de usuario por intereses y recomendar a partir de él.

Otra opción de clasificación de usuario que no se pudo ejecutar por falta de tiempo fue la de utilizar las categorías que no son bares y restaurantes para hacer un perfil de usuario que nos sirviera para recomendar.

Se trataba de preguntar al usuario cuáles de las categorías que nos proporciona BBVA le interesaban más (deporte, moda, wellness, salud…) y utilizar esta información para realizar un perfil en función de los gustos.

De este modo, sabríamos recomendar a una persona que les gusta el deporte y la moda dónde va la gente que le gustan estas categorías. Esto se valoraría en función del gasto en cada CP de esas categorías que hubiera seleccionado el usuario.

- Utilizar la distribución de pagos de cada CP para permitir al usuario que seleccione el rango de dinero que se quiere gastar

La propuesta consiste en tener un rango de precios suministrado por el usuario, y utilizar los datos de las tablas de BBVA para obtener las distribuciones de pagos. De este modo, seríamos capaces de “cortar” las distribuciones y obtener una probabilidad de que un un CP en concreto el gasto se encontrar en el rango que ha suministrado el usuario.

Esta probabilidad de multiplicaría por la probabilidad obtenida ya en la aplicación y podríamos cambiar nuestra recomendación en función del gasto que se realiza en los CP's

Esta opción se descartó dados los problemas de las asunciones que estaríamos realizando, ya que nos encontramos con que muchas transacciones de las que tenemos información pueden tratarse de dos o más personas que van a cenar, de modo que no concordaría demasiado con la realizada las posibles recomendaiones que obtuviéramos.

Creemos que este uso tendría mucho más sentido en el caso de categorías donde se gaste de forma más “individual”, como sería el caso de moda.

De todos modos nos pareció interesante el hecho de poder construir la distribución que representa los pagos para cada CP y poder realizar cortes en función del rango que comentábamos del gasto que se quiera realizar.
