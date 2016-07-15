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

$DOAS su ${USUARIO_AP} -c "cd /var/www/htdocs/cor1440_cinep;  bundle exec rake assets:precompile RAILS_RELATIVE_URL_ROOT=/act; echo \"Iniciando unicorn...\"; PGSSLCERT=${PGSSLCERT} PGSSLKEY=${PGSSLKEY} SECRET_KEY_BASE=${SECRET_KEY_BASE} bundle exec unicorn_rails -c ../cor1440_cinep/config/unicorn.conf.minimal.rb  -E production -D"

