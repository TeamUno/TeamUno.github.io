---
layout: post
title: Pipeline de la aplicación
---
A continuación describimos los diferentes pasos que realiza nuestra aplicación desde que el ulsuario introduce una serie de limitaciones para la recomendación hasta que llegamos a los códigos postales recomendados para destino y la presentación de los restaurantes existentes en ese código postal.

1.- Introducción de datos

El usuario introduce sus preferencias. Puede elegir día de la semana, rango de edad, género, zipcode de orígen y rango de precios.

El usuario pulsa el botón “recommend me” y la aplicación pasa a realizar los cálculos y mostrar los primeros resultados.

2.- Tratamiento de los datos y cálculo de recomendación de códigos postales

A partir de esos datos, la aplicación aplica el filtro de día de la semana, rango de edad y género a la tabla “demographics”, y obtiene el porcentaje del total de transacciones que se han realizado en cada CP. Ese resultado será la probabilidad que un cliente con esas características se dirija a un local de ese código postal.

Una segunda iteración de la recomendación de CP’s permite añadir el CP de procedencia a la recomendación. Este apartado se encuentra explicado con más detalle en el post de tratamiento de datos agregados.

3.- Visualización de CP’s y seleccion por parte del usuario de un CP

Una vez la aplicación termina de realizar los cálculos presenta un mapa de la ciudad de Barcelona donde se muestan los códigos postales coloreados en función de la recomendación obtenida según el perfil de usuario. La escala de colores indica el rating obtenido en cada código postal, y el valor se muestra en el pop-up que aparece en el mapa al pasar por encima de cada código postal.

En este punto, el usuario selecciona un código postal para visualizar los restaurantes mejor recomendados dentro del mismo.

4.- Visualización de los restaurantes del CP seleccionado

Una vez seleccionado el código postal el mapa hace zoom sobre la selección y presenta los diferentes puntos donde se encuentran restaurantes en el código postal, coloreando de color rojo los restaurantes que coincidan además con la selección de rango de precios que haya realizado el usuario. El tamaño del punto que representa el restaurante es mayor en función de la recomendación, de forma que sea más fácil identificar la mejor opción.

El usuario puede hacer click sobre cualquier restaurante para poder acceder a detalles del mismo, como nombre, teléfono, rating, fotografia, etc.
