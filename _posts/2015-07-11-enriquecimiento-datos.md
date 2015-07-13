---
layout: post
title: Enriquecimiento de los datos
---
Para poder mejorar la recomendación que realiza nuestra aplicación, hemos querido utilizar datos disponibles en la web.

Con los datos que nos ofrecía BBVA sólo eramos capaces de obtener códigos postales, y nuestra idea consistía en llegar a recomendar restaurantes en concreto al usuario, ya que un código postal no aporta demasiada información acerca de dónde se puede dirigir una persona a cenar.

Así, estos son los diferentes datos que hemos extraído de la web, y el uso que les hemos dado:

- Polígonos de los códigos postales.

  Con estos datos hemos podido representar en el mapa cada código postal. La información la hemos extraído de la base de datos de Cartociudad.
  Con estos datos y la ayuda de la librería Leaflet, somos capaces de representar la recomendación que estamos realizando

- Datos de restaurantes

  Había diferentes lugares de donde extraer estos datos. Se tuvo en cuenta Google Places, Fourquare, BCNRestaurantes y Tripadvisor. Interesaba que fuéramos capaces de extraer un rating de los restaurantes y el nivel de precios, para que el usuario pudiera definir el nivel de gasto a realizar.

  Decidimos utilizar el API de Foursquare puesto que permitía extraer lo que necesitábamos sin tener que realizar scraping.

  De este modo la aplicación recomienda los mejores restaurantes del código postal que seleccione el usuario, incrementando mucho la utilidad que se le puede sacar a la app.

- Tiempo meteorológico

  Se realizó una extacción del tiempo que hizo en Barcelona durante el mes de Junio de 2014. Estos datos se utilizarán para mejorar la recomendación en función del tiempo que haga en el momento de realizar la consulta con la aplicación.
