---
layout: post
title: Utilización de Naive Bayes para solucionar problemas de agragación y diferentes tablas
---

Dos de los problemas más importantes que nos hemos encontrado durante el desarrollo de la palicación tienen que ver con el hecho de que los datos estuvieran agregados y que además diferentes informaciones que queríamos utilizar para la aplicación se encontraran en distintas tablas que debíamos combinar para poder realizar una recomendación más precisa.

A pesar de que en un principio el desarrollo de la aplicación se planteó como un problema de filtraje de datos y presentación de resultados, hemos querido añadir el uso del modelo de Machine Learning Naive Bayes para realizar una clasificación por códigos postales.

De este modo obtenemos dos beneficios:

1.- Permite agregar datos de diferentes tablas, con lo que con este sistema podríamos agregar selección de usuario para cualquier dato que tengamos en las tablas, como podría ser hora del día o código postal de procedencia del cliente, que se encuentran en dos tablas distintas.

2.- Permite asignar una probabilidad a CP’s que, por agregación, no aparecen en la tabla “demographics”, que es con la que estamos trabajando desde un principio con el método del filtraje.

A continuación se detalla cómo hemos aplicado el modelo Naive Bayes junto con la corrección de Laplace.
