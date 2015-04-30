# Cor1440_cinep
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/cor1440_cinep.svg?branch=master)](https://travis-ci.org/pasosdeJesus/cor1440_cinep) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep) [![security](https://hakiri.io/github/pasosdeJesus/cor1440_cinep/master.svg)](https://hakiri.io/github/pasosdeJesus/cor1440_cinep/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/cor1440_cinep.svg)](https://gemnasium.com/pasosdeJesus/cor1440_cinep) 

Sistema para planeación y seguimiento de actividades e informes en el CINEP.

### Requerimientos
* Ruby version >= 2.2
* PostgreSQL >= 9.4 con extensión unaccent disponible
* Recomendado sobre adJ 5.6 (que incluye todos los componentes mencionados).  
  Las siguientes instrucciones suponen que opera en este ambiente.

### Arquitectura
Es una aplicación que emplea el motor genérico estilo Pasos de Jesús ```sip```
 https://github.com/pasosdeJesus/sip
y el motor cor1440_gen https://github.com/pasosdeJesus/cor1440_gen

### Configuracion, uso, desarrollo

Puede seguir las mismas instrucciones de sivel2:

Los cambios son:

* El usuario por defecto para la base de datos es cor1440cinep
* Al iniciar una nueva aplicación se crea usuario cor1440cinep con clave
  cor1440cinep
* La aplicacion se monta sobre ```/act```, si se necesita redirigir ```/```
  copiar y cambiar plantilla
  ```
	cp app/views/redirige/index.html.erb.plantilla app/views/redirige/index.html.erb
	vim app/views/redirige/index.html.erb
  ```


