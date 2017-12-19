# Cor1440_cinep
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/cor1440_cinep.svg?branch=master)](https://travis-ci.org/pasosdeJesus/cor1440_cinep) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep) [![security](https://hakiri.io/github/pasosdeJesus/cor1440_cinep/master.svg)](https://hakiri.io/github/pasosdeJesus/cor1440_cinep/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/cor1440_cinep.svg)](https://gemnasium.com/pasosdeJesus/cor1440_cinep) 

Sistema de información de procesos en CINEP/PPP

### Requerimientos
* Ruby version >= 2.4
* Ruby on Rails 5.1.x
* PostgreSQL >= 9.6 con extensión unaccent disponible
* Recomendado sobre adJ 6.0 (que incluye todos los componentes mencionados).  

Estas instrucciones suponen que opera en este ambiente, puedes ver más sobre
la instalación de Ruby on Rails en adJ en 
[http://dhobsd.pasosdejesus.org/Ruby_on_Rails_en_OpenBSD.html]


### Arquitectura
Es una aplicación que emplea el motor genérico estilo Pasos de Jesús ```sip```
 [https://github.com/pasosdeJesus/sip]
y el motor cor1440_gen [https://github.com/pasosdeJesus/cor1440_gen]

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

* La conexión LDAP si la hace cifrada requiere un certificao firmado cuyo
  subject sea el nombre del servidor al que se conecta y con una autoridad
  ceritificadora reconocida por el servidor donde reside la aplicación.
  Si usa su propia autoridad certificadora asegurese de incluir la llave
  pública entre las conocidas por el sistema (en adJ /etc/ssl/cert.pem).

### Plantilla

En app/reportes encuentra una plantilla por llenar con datos de convenios financieros

Debe guardarse en útlimas con LibreOffice (o OpenOffice) porque Word 2013 no soporta 
tablas con nombres y los nombres de las tablas para informes deben ser:
DESEMBOLSOS
INFORMESNARRATIVOS
INFORMESFINANCIEROS
INFORMESAUDITORIA

