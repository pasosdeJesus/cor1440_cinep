#!/bin/sh
# Inicia produccion
if (test "${SECRET_KEY_BASE}" = "") then {
	echo "Definir variable de ambiente SECRET_KEY_BASE"
	exit 1;
} fi;
if (test "${USUARIO_AP}" = "") then {
	echo "Definir usuario con el que se ejecuta en USUARIO_AP"
	exit 1;
} fi;
if (test "${DIRAP}" = "") then {
	echo "Definir directorio de aplicacion en DIRAP"
	exit 1;
} fi;
if (test "${RAILS_RELATIVE_URL_ROOT}" = "") then {
	echo "Definir ruta relativa en URL en RAILS_RELATIVE_URL_ROOT"
	exit 1;
} fi;

if (test "${PGSSLCERT}" = "") then {
	PGSSLCERT=~/.postgresql/postgresql.crt
} fi;
if (test "${PGSSLKEY}" = "") then {
	PGSSLKEY=~/.postgresql/postgresql.key
} fi;

DOAS=`which doas 2>/dev/null`
if (test "$DOAS" = "") then {
	DOAS=sudo
} fi;
dfap=`basename ${DIRAP}`
$DOAS su ${USUARIO_AP} -c "cd ${DIRAP};  RAILS_ENV=ensayo bin/rails assets:precompile RAILS_RELATIVE_URL_ROOT=${RAILS_RELATIVE_URL_ROOT}; echo \"Iniciando unicorn...\" ; PGSSLCERT=${PGSSLCERT} PGSSLKEY=${PGSSLKEY} bundle exec rails RAILS_ENV=${RAILS_ENV} sip:indices ; PGSSLCERT=${PGSSLCERT} PGSSLKEY=${PGSSLKEY} SECRET_KEY_BASE=${SECRET_KEY_BASE} bundle exec unicorn_rails -c ../$dfap/config/unicorn.conf.minimal.rb  -E ${RAILS_ENV} -D "

