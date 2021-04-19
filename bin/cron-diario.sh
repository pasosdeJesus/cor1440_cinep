#!/bin/sh
# Sugerido ejecutar  a diario (por ejemplo en /etc/daily.local)
# su -l miusuario -c "(cd /var/www/htdocs/cor1440_cinep; date ; bin/cron-diario.sh) >> /var/www/htdocs/cor1440_cinep/log/alertas.bitacora 2>&1" 


if (test -f ".env") then {
  . .env
} fi;
if (test "$RAILS_ENV" = "") then {
  echo "Falta RAILS_ENV en .env"
  exit 1
} fi;
if (test "$SMTP_MAQ" = "") then {
  echo "Falta SMTP_MAQ en .env"
  exit 1
} fi;
if (test "$SMTP_PUERTO" = "") then {
  echo "Falta SMTP_PUERTO en .env"
  exit 1
} fi;
if (test "$SMTP_DOMINIO" = "") then {
  echo "Falta SMTP_DOMINIO en .env"
  exit 1
} fi;
if (test "$SMTP_USUARIO" = "") then {
  echo "Falta SMTP_USUARIO en .env"
  exit 1
} fi;
if (test "$SMTP_CLAVE" = "") then {
  echo "Falta SMTP_CLAVE en .env"
  exit 1
} fi;

SMTP_MAQ=$SMTP_MAQ SMTP_PUERTO=$SMTP_PUERTO SMTP_DOMINIO=$SMTP_DOMINIO SMTP_USUARIO=$SMTP_USUARIO SMTP_CLAVE=$SMTP_CLAVE bin/rails runner -e -e ${RAILS_ENV} scripts/a_diario_runner.rb
