---
layout: post
title: Clusterización.
---

En esta sección, se presenta un estudio basado en clusterización aplicado a los datos del BBVA. 

Utilizaremos el dataset "demographic_distribution", en el que se encontraremos información agrupada según una cantidad mínima de payments, en general mayor que 5, en un código postal en concreto, para una fecha, una categoría, el genero y la edad del grupo que realiza el pago.

Para ser mas precisos describiremos los campos con mas detalle:

* merchant_zipcode: código postal donde se ha realizado el pago,
* date: fecha del pago,
* category: categoría donde se clasifica el pago (fashion, bar&restaurants...)
* age_interval: rango de edad del cliente que ha realizado el pago.
* gender: genero del cliente que ha realizado el pago.
* gasto: la cantidad de dinero en las diferentes compras.

Se hace un filtrado previo donde se eliminan la información donde el gender y el age_interval se desconoce.
También nos quedamos solo con los merchant zipcodes que pertenecen a Barcelona.

Ahora estamos preparados para realizar la clusterización, podemos hacer hacernos algunas preguntas basadas en los perfiles. Se entiende por perfil, la agrupación por genero y edad.


###Como se agrupan los diferentes perfiles según lo que gastan en las diferentes categorías?

Se realiza una agregación donde podamos desglosar por genero y edad el gasto a lo largo de todas las categorías.

```
gbcn = pd.pivot_table(demo_stats, values = "amount",
			index=["age_interval", "gender"], columns=["category"],
 			aggfunc=np.sum, fill_value=0 )
```

La clusterizacion es posible gracias a que llamamos values sobre el pivot_table anterior

```
kmeans = cluster.KMeans(init='k-means++',n_clusters= n_clusters)
y_pred = kmeans.fit_predict(gbcn.values)

```

#####Las conclusiones de esta clusterización se pueden resumir como:

- En un primer cluster encontramos que independientemente del genero, los mas jóvenes ( menores de 25 años) y los mayores ( mas de 65 años) tienen un comportamiento similar, tal vez explicado por las compras pequeñas a partir de tarjetas.

- En un segundo cluster tenemos los hombres comprendidos entre los 25-54 años, con gastos similares en muchas categorías.

- En un tercer cluster están las mujeres de entre 25-34 y las de 45-54,

- Y por ultimo un cuarto cluster donde se ven las mujeres de entre 35-44.

Esto nos hace sugerir que este ultimo cluster tiene un comportamiento diferenciado con respecto los demás y parece ser que diferente del tercer cluster donde por alguna razón se ha salido. Mirando detenidamente en los datos, se observa que el gasto generado en fashion por este ultimo cluster es bastante elevado. Y es que estamos en Julio. En plena rebajas!


###Que perfil gasta mas dinero en bares y restaurantes los fines de semanas?


Hacemos una agregación basada en el día de la semana, la edad y el genero y sumamos el amount gastado en la categoría de bares&restaurantes solo para los fines de semana.

Los filtros quedarían así:

```
demo_stats = demo_stats[demo_stats.category == 'es_barsandrestaurants']
demo_stats["weekday"] = demo_stats["date"].map(lambda d: (d.weekday()))
demo_stats = demo_stats[demo_stats.weekday.isin([5,6])]
```

Y utilizaríamos la misma agregación anterior.

#####Las conclusiones de esta clusterización se pueden resumir como:

Hacemos 3 cluster y observando el gasto podemos decir que:


 - los hombres de entre 25-44 son los que mas gastan.
 - las mujeres de entre 25-34 gastan aproximadamente mitad que el cluster anterior.
 - y que las mujeres de mas de 35 años y los hombres de mas 45 años, junto con los mas jóvenes (menores de 25 años) son los que menos gastan

 