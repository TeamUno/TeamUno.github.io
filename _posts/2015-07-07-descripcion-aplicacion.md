---
layout: post
title: Descipción de la aplicación
---
Empezamos el proyecto con la idea de dar un significado a los datos que nos había proporcionado BBVA.

Estos datos consistían en la información agregada de transacciones realizadas en Catalunya con tarjetas BBVA o en TPV’s BBVA, que comprenden una muestra del 15% del total de las transacciones que se realizan en total.

Surgieron varias ideas sobre las que se podía hacer algo que resultara útil para el usuario final, y vimos que teníamos mucha información en los datos para saber dónde se dirigía la gente de cierto tipo cuando iban a realizar un gasto en alguna categoría en concreto.

Podíamos tener información por franja de edad, género, día de la semana o CP de procedencia o destino.

Así que decidimos hacer una aplicación de recomendación de restaurantes en función de los datos proporcionados por el usuario.

Con los datos que nos proporciona el usuario y sabiendo las transacciones que realizan las personas similares, somos capaces de recomendar un código postal donde suele dirigirse la gente según el día de la semana en que nos encontremos.

Una vez recomendados los mejores CP’s donde ir, usaremos una base de datos donde aparecen los restaurantes de cada código postal, ordenados por rating y por nivel de gasto, que será un campo que el usuario también podrá rellenar para afinar más la búsqueda.

La base de datos de restaurantes que hemos utilizado es Foursquare, ya que su API permitía obtener los datos de restaurantes de forma relativamente sencilla y la información encontrada es bastante completa para la aplicación que queremos realizar.

Así, la pregunta que queremos responder a través de los datos es:

"A qué códigos postales de Barcelona se dirige una persona con un perfil determinado de edad, género en un día de la semana en concreto?"

Los datos que tenemos son tan sólo de un mes, por lo que deberemos asumir que lo que se refleja en dicho mes es lo que ocurre durante el resto del año.

Una vez respondida esta pregunta, tendremos los CP’s con mayor actividad para el perfil seleccionado, y usaremos la base de datos extraida de Foursquare para responder “Cuáles son los mejores restaurentes en la zona dentro de un rango de precios?"

Para introducir los datos por parte del usuario usaremos una aplicación realizada a partir de la plataforma [], y los códigos postales recomendados aprecerán en un mapa que desarrollaremos a partir de Leaflet, una librería JavaScript para realizar mapas.

El usuario puede clicar sobre el mapa de CP’s recomendados para ver la información de los restaurantes recomendados en esa zona.
