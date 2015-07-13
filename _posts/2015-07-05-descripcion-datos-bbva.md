---
layout: post
title: Descripción de los datos proporcionados por BBVA
---
Para la realización del proyecto hemos tenido la oportunidad de disponer de datos suministrados por BBVA de transacciones realizadas en Catalunya a través de su sistema de pago con tarjetas bancarias.

Estos datos incluyen los pagos realizados durante Julio de 2014 en Catalunya, ya sea con tarjetas del BBVA o a través de TPV de BBVA.

A continuación detallamos los datos disponibles:

- Tabla `basic_stats`. Cada fila contiene la siguiente información:
  - `merchant zipcode`: Código postal del comercio donde se ha efectuado la operación
  - `date`: Día en que se ha realizado la transacción
  - `category`: Categoría del comercio. Según el tipo de negocio está distribuido por bares y restaurantes, moda, deportes, tecnología, salud, etc.
  - `merchants`: Número de negocios que hay en las operaciones de la fila
  - `cards`: Número de tarjetas utilizadas en las operaciones de la fila
  - `payments`: Número de pagos realizados en la fila estudiada
  - `avg payment`: Importe medio de las transacciones de la línea
  - `min payment`: Pago mínimo realizado para este conjunto de operaciones
  - `max payment`: Pago máximo realizado para este conjunto de operaciones
  - `std`: desviación estándar de las transacciones

- Tabla `age_distribution`: Incluye la misma información que la anterior, pero excluye el dato de `customer zipcode` y lo sustituye por `age interval`, que corresponde al rango de edad del cliente que ha realizado la operación.

- Tabla `gender_distribution`: Incluye la misma información que la tabla `basic_stats` excepto que se sustituye el `customer zipcode` por el género del cliente en cada agregación.

- Tabla `payment_distribution`: Incluye el intervalo de valor del pago realizado en lugar del `customer zipcode` de la tabla `basic_stats`.

- Tabla `demographic_distribution`: Incluye datos de distrubucíon por edades y de género, excluyendo el `customer zipcopde` respecto a la tabla `basic_stats`.

- Tabla `expenditure-time_curve`: Se diferencia de la tabla `basic_stats` en que no incluye la `category` e incluye las columnas de `day of week` y `hour` en que se ha realizado la transacción.

- Tabla `customer_zipcodes`: Se diferencia de la tabla `basic_stats` en que incluye el código postal del cliente.

Un punto a tener en cuenta es que se trata de datos agregados para asegurar su anonimización. Es necesario que haya un mínimo de transacciones en cada distribución o fila para que ésta se incluya en la tabla. De este modo, si existen muy pocas transacciones de un tipo en un código postal en concreto, podemos encontrarnos con que no se presente esta información en la tabla.

Al tratarse de datos agregados nos hemos encontrado con que la realización de un merge es muy complicado puesto que los datos que se están representando en una tabla pueden no ser los mismos que en otra ya que puede ser que no se llegue al mínimo para que se consideren en la agregación.
