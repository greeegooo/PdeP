# pdep-mit-2017-base-de-TP-logico

Repositorio de base para el TP grupal de lógico 2017

## Enunciado

### Primera entrega: Está compuesta por las primeras dos partes del problema:

**Parte 1: Para armar la base de conocimientos inicial de acuerdo a lo indicado**

https://docs.google.com/document/d/1U2LKXlTOlYErj8Z_scWxoP3mi62nm2Lv1_7kQQvshqE/edit?usp=sharing

**Parte 2: Se incorpora lógica más avanzada**

https://docs.google.com/document/d/1pi0c3sYrrT8hUYpx2pFWFrebDMfhvh46iIcY6k0J81o/edit?usp=sharing

### Segunda entrega: Compuesta por la tercer y última parte del problema

https://docs.google.com/document/d/1fbBFbXSzjyl8PpH7Jj0YqlEtFJdIsBnO6QmpS-PKeS8/edit#heading=h.pyv2xfxjzh7h

## ¿Cómo organizar la solución?

El trabajo práctico consiste en resolver los requerimientos de cada uno de los enunciados definiendo los predicados que consideren más adecuados.

Estos predicados deben definirlos en el archivo programadores.pl.

Además, para verificar el correcto funcionamiento del trabajo práctico, el mismo está acompañado por otro archivo llamado programadores_test.pl, que incluye distintos casos de prueba usando el framework de testeo PlUnit.

En este archivo se espera que reemplacen, dentro de cada test que se espera que implementen, el booleano que viene por defecto por una consulta que cumpla con lo pedido.

Por ejemplo, un test como este:

```
test(quienesSonHijosDeHomero, set(Hijo == [bart, lisa, maggie])) :-
    false.
```
    
Así como está va compilar, pero va a fallar en ejecución. Necesitamos cambiar el false por la consulta que haríamos por consola para saber quiénes son hijos de Homero.

```
test(quienesSonHijosDeHomero, set(Hijo == [bart, lisa, maggie])) :-
    padre(homero, Hijo).
```
    
Ese test, si homero se relaciona con cada uno de ellos mediante el predicado padre/2 va a dar verde. No importa si al hacer esa misma consulta en la consola de Prolog las respuestas se repiten o están en otro orden.

El archivo de pruebas incluye toda la información que podrían llegar a necesitar para definir y correr los casos de prueba.

Tengan en cuenta que:
 - El archivo de pruebas importa el archivo programadores.pl por su nombre, por ende no deberían renombrarlo.
 - Las pruebas de la segunda entrega ya están en el mismo archivo, pero están comentadas. Para la segunda entrega deberían descomentar esa parte.
