---
layout: post
title: Descipción de la aplicación
---
Empezamos el proyecto con la idea de dar un significado a los datos que nos había proporcionado BBVA.

Estos datos consistían en la información agregada de transacciones realizadas en Catalunya con tarjetas BBVA o en TPV’s BBVA, que comprenden una muestra del 30% del total de las transacciones que se realizan en total.

Surgieron varias ideas sobre las que se podía hacer algo que resultara útil para el usuario final, y vimos que teníamos mucha información en los datos para saber dónde se dirigía la gente de cierto tipo cuando iban a realizar un gasto en alguna categoría en concreto.

Podíamos tener información por franja de edad, género, día de la semana o CP de procedencia o destino.

Así que decidimos hacer una aplicación de recomendación de restaurantes en función de los datos proporcionados por el usuario.

Con los datos que nos proporciona el usuario y sabiendo las transacciones que realizan las personas similares, somos capaces de recomendar un código postal donde suele dirigirse la gente según el día de la semana en que nos encontremos.

Aquí podemos ver la forma en la que se piden los datos del usuario en la aplicación:

![Search_tab](/images/diego/App_search.png)

Cuando el usuario pulsa **Recommend me** aparece la pestaña `Map`, donde se muestran los códigos postales recomendados, coloreados según importancia. En azul oscuro se marcan los más recomendados y el color va pasando a vainilla para los menos recomendados, hasta la falta de color que significa una relevancia mínima. Podemos ver un ejemplo en la siguiente imagen:

![Map_tab](/images/diego/App_map.png)

Una vez recomendados los mejores CP’s donde ir, usaremos una base de datos donde aparecen los restaurantes de cada código postal, ordenados por rating y por nivel de gasto, que es uno de los campos que el usuario también ha podido rellenar para afinar más la búsqueda.

La base de datos de restaurantes que hemos utilizado proviene de un scrapping contra la web [BCNrestaurantes](http://bcnrestaurantes.com), que contiene 1283 restaurantes en Barcelona. Aunque también se tienen los datos de Foursquare y de Google Places, que fueron los primeros en obtenerse ya que sus API permitían obtener los datos de forma relativamente sencilla, hemos visto que la información encontrada en BCNrestaurantes es bastante más completa para la aplicación que queremos realizar.

En la aplicación, una vez seleccionado por el usuario el CP que le parezca, éste se amplía mostrando los restaurantes que la base de datos contiene para ese CP. En rojo se muestran aquellos con el rango de precio igual al que ha introducido el usuario, mientras que en gris se enseñan todos los demás. Los mejores del CP se muestran con un tamaño mayor, como se puede ver en esta imagen:

![Restaurants](/images/diego/App_restaurants.png)

Y si seleccionamos uno de los restaurantes podemos ver su información completa:

![Restaurant_detail](/images/diego/App_restaurant_detail.png)


En resumen, la pregunta que queremos responder a través de los datos es doble:

"¿A qué códigos postales de Barcelona se dirige una persona con un perfil determinado de edad y género en un día de la semana concreto? ¿Cuáles son los mejores restaurantes para el rango de precio que busca el usuario?"

Una vez respondida esta pregunta, tendremos los CP’s con mayor actividad para el perfil seleccionado, y usaremos la base de datos extraida de Foursquare para responder “Cuáles son los mejores restaurentes en la zona dentro de un rango de precios?"

Para introducir los datos por parte del usuario usaremos una aplicación realizada a partir de la plataforma [], y los códigos postales recomendados aprecerán en un mapa que desarrollaremos a partir de Leaflet, una librería JavaScript para realizar mapas.

El usuario puede clicar sobre el mapa de CP’s recomendados para ver la información de los restaurantes recomendados en esa zona.
