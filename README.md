# Cor1440_cinep

[![Revisado por Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com) [![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/cor1440_cinep.svg?branch=master)](https://travis-ci.org/pasosdeJesus/cor1440_cinep) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/cor1440_cinep) [![security](https://hakiri.io/github/pasosdeJesus/cor1440_cinep/master.svg)](https://hakiri.io/github/pasosdeJesus/cor1440_cinep/master)

Sistema de información de procesos en CINEP/PPP

### Requerimientos
* Ruby version >= 3.0
* Ruby on Rails >= 6.1.3
* PostgreSQL >= 13 con extensión unaccent disponible
* Recomendado sobre adJ 6.8 (que incluye todos los componentes mencionados).  

Estas instrucciones suponen que opera en este ambiente, puedes ver más sobre
la instalación de Ruby on Rails en adJ en 
[http://dhobsd.pasosdejesus.org/Ruby_on_Rails_en_OpenBSD.html]


### Arquitectura

Es una aplicación que emplea el motor genérico estilo Pasos de Jesús ```sip```
 [https://github.com/pasosdeJesus/sip]
y el motor cor1440_gen [https://github.com/pasosdeJesus/cor1440_gen]


### Manejo de usuarios

* Si hay directorio LDAP se autentica con este.
* Si se configura un directorio activo puede realizar algunas operaciones  
  con este.

Para esto usa la gema jn316_gen, y la configuración de estos es como
ese explica en <https://github.com/pasosdeJesus/jn316_gen>

### Configuracion, uso, desarrollo

Puede seguir las mismas instrucciones de sivel2:

Los cambios son:

* El usuario por defecto para la base de datos es cor1440cinep
* Al iniciar una nueva aplicación se crea usuario cor1440 con clave
  cor1440
* La aplicacion se monta sobre ```/```
* La conexión LDAP si la hace cifrada requiere un certificao firmado cuyo
  subject sea el nombre del servidor al que se conecta y con una autoridad
  ceritificadora reconocida por el servidor donde reside la aplicación.
  Si usa su propia autoridad certificadora asegurese de incluir la llave
  pública entre las conocidas por el sistema (en adJ /etc/ssl/cert.pem).
* El envio de alertas depende de:
1. Que se tenga una cuenta configurada en un servidor SMTP 
2. Que copie y configure datos de bin/cron-diario.sh.plantilla en bin/cron-diario.sh y que agregué las variables de correo en cada arranque de la aplicación
3. Que programa una tarea cron diaria para ejecutar bin/cron-diario.sh


### Plantilla

En app/reportes encuentra una plantilla por llenar con datos de convenios financieros

Debe guardarse en útlimas con LibreOffice (o OpenOffice) porque Word 2013 no soporta 
tablas con nombres y los nombres de las tablas para informes deben ser:
DESEMBOLSOS
INFORMESNARRATIVOS
INFORMESFINANCIEROS
INFORMESAUDITORIA

