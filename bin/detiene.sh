#!/bin/sh
# Detiene servicio

if (test -f ".env") then {
	. .env
} fi;
if (test "$RC" = "") then {
	RC=cor1440cinep
} fi;
if (test "$RAILS_ENV" = "production") then {
	if (test ! -f /etc/rc.d/$RC) then {
		echo "Falta script /etc/rc.d/$RC"
		exit 1;
	} fi;

	doas sh /etc/rc.d/$RC -d stop;
} elif (test -f tmp/pids/server.pid) then {
	kill `cat tmp/pids/server.pid`
} fi;

