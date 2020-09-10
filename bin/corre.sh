#!/bin/sh
# Inicia servicio

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

if (test "$RAILS_ENV" = "development") then {
  if (test "$SININD" = "") then {
    bundle exec rake sip:indices
    rm -rf public/assets/* public/packs/*
    bin/rails assets:precompile
  } fi;
  bin/rails s -p $PUERTODES -b $IPDES
} 
else {
  if (test ! -f /etc/rc.d/$RC) then {
    echo "Falta script /etc/rc.d/$RC"
    exit 1;
  } fi;
  doas sh /etc/rc.d/$RC -d start
} fi;
