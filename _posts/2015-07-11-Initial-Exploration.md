---
layout: post
title: Initial Exploration
---

Empezamos analizando la tabla basic_stats, que contiene la siguiente información:

    merchants Number of merchants 
    cards Number of differents cards 
    payments Number of transactions 
    avg payment Average transaction 
    max payment Maximum transaction 
    min payment Minimum transaction 
    std Standard deviation    

<div>
<table border="1" class="dataframe" >
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>zipcode</th>
      <th>date</th>
      <th>category</th>
      <th>merchant</th>
      <th>card</th>
      <th>payment</th>
      <th>avg</th>
      <th>max</th>
      <th>min</th>
      <th>std</th>
      <th>amount</th>
      <th>avgpaybymerch</th>
      <th>amountbymerch</th>
      <th>avgReppays</th>
      <th>weekday</th>
      <th>day</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>8001</td>
      <td>2014-07-01</td>
      <td>es_barsandrestaurants</td>
      <td>76</td>
      <td>405</td>
      <td>410</td>
      <td>27.28</td>
      <td>600</td>
      <td>0.1</td>
      <td>47.253606</td>
      <td>11184.8</td>
      <td>5.394737</td>
      <td>147.168421</td>
      <td>1.012346</td>
      <td>1</td>
      <td>01-Tue</td>
    </tr>
  </tbody>
</table>
</div>


el importe de total de transacciones:

<h3>214 Millones de Eur.</h3>


y su distribución por categorias:

![png](/assets/2015-07-11-Initial-Exploration/output_5_0.png)


un subset de su distribución por zipcodes:


![png](/assets/2015-07-11-Initial-Exploration/output_6_1.png)

estamos en el mes de Rebajas!

evolución de lo gastado por categorias por date:


![png](/assets/2015-07-11-Initial-Exploration/output_8_1.png)



evolución del gasto en Bars&Restaurants:



![png](/assets/2015-07-11-Initial-Exploration/output_9_1.png)



    
relación del gasto en Bars&Restaurants y el gasto en Fashion en función del dia de la semana:


![png](/assets/2015-07-11-Initial-Exploration/output_13_0.png)


relación del gasto en Health y el gasto en food en función del dia de la semana:

![png](/assets/2015-07-11-Initial-Exploration/output_14_0.png)


relación del gasto en fashion y el gasto en food en función del dia de la semana:

![png](/assets/2015-07-11-Initial-Exploration/output_15_0.png)


relación del gasto en Bars&Restaurants, fashion y  en food en función del zipcode:


![png](/assets/2015-07-11-Initial-Exploration/output_21_1.png)

headmap global:


![png](/assets/2015-07-11-Initial-Exploration/output_22_1.png)


despues de este analysis inicial, vemos que hay zipcodes como Vic, Figueres que tienen una distribución más uniforme de gasto en casi todas las categorias, zipcodes con todos los servicios.

utilizamos KMeans para ver diferentes clusters de zipcodes, K=3, K=10, K=20,

    from sklearn import cluster
    K=20 # Assuming to be 3 clusters!
    clf = cluster.KMeans(init='random', n_clusters=K, random_state=0)
    clf.fit(zipbycategory_row_norm)
    print clf.labels_
    sns.heatmap(zipbycategory_row_norm[clf.predict(zipbycategory_row_norm)==0])
    

    [ 2  8 11  5  5  5  8 11  5 16  5 11  5 11  5 11  5 11  8  0 11  5 18  5  1
      1 17 18 11  2  1  1 14  5  5  5  5 17 14  1 17  4 12 17  5 15 17 14 12  0
     11  5  6  6 17 17  3  1 14  1  1 12  1  1 17 17 14  1  1  8 17 17 18  0 11
     17  9  1 17 17 17 14 12  8  6  8 11  9 17 10 12  3 12 19  1  1 17 12 11 11
     17  8 17 17 12 19  1 13  1 10 10 19 18 19  5  5 15 10 19  5 11 11  9  3 12
     14  7 17 19 13 19 13 18 17  3  9  3 11 12  3 18  3 17 15  6 11 14 17 18  1
     12  3  8 18  1  1 13 17  1  3  5 17 12 14 11  1  3  1  3 17  3 12 12 15 11
      2 17 11  1  5  1 10  5 16 15  1  5 11  1  2 14 14  6 11  1 17 17 17 11 14
     11  1 15 17  1  5 17  9  5  1 11  8  2  8 14  0 13 18 17  3 10  2 11 10 16
     10 18  5 13  7 10  5 12 19 10 19 16  1 17 16  3  3  3  3 18  3  6 16 10 18
     17 15 16 11  3  3 11 17 17  8 18 11  1 11  8 17  3  3  3  3 19 15  3  1 10
     15 11 15  3  3  8 15 19 17  2 17 13 10 11 19 12 10  7  3  8 11  3  5 12  9
      3  7 19  3  5 19 11  3  3 17  3 10 15 11 15  1 19 11 11 16 13 11 10 12 19
     12 19 12]

ejemplo del cluster "Zipcodes Health" con K=20

![png](/assets/2015-07-11-Initial-Exploration/output_23_2.png)






   
