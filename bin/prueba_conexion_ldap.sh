#!/bin/sh
# Prueba conexión a LDAP

if (test ! -f ".env") then {
  echo "Falta archivo .env"
  exit 1;
} fi;
. ./.env

if (test "$RC" = "") then {
  export RC=cor1440cinep
} fi;
if (test "$RAILS_ENV" = "") then {
  RAILS_ENV=development
} fi;
if (test "$PUERTODES" = "") then {
  PUERTODES=2300
} fi;
if (test "$IPDES" = "") then {
  IPDES=127.0.0.1
} fi;

if (test "$SMTP_MAQ" = "") then {
  echo "Falta SMTP_MAQ"
  exit 1;
} fi;
if (test "$SMTP_PUERTO" = "") then {
  echo "Falta SMTP_PUERTO"
  exit 1;
} fi;
if (test "$SMTP_DOMINIO" = "") then {
  echo "Falta SMTP_DOMINIO"
  exit 1;
} fi;
if (test "$SMTP_USUARIO" = "") then {
  echo "Falta SMTP_USUARIO"
  exit 1;
} fi;
if (test "$SMTP_CLAVE" = "") then {
  echo "Falta SMTP_CLAVE"
  exit 1;
} fi;
if (test "$JN316_CLAVE" = "") then {
  echo "Falta JN316_CLAVE"
  exit 1;
} fi;
if (test "$PRC_USUARIO" = "") then {
  echo "Falta PRC_USUARIO (e.g vtamara)"
  exit 1;
} fi;


/usr/local/bin/ruby bin/rails runner -e ${RAILS_ENV} scripts/prueba_conexion_ldap.rb
