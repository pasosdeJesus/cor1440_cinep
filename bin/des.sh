#!/bin/sh

if (test -f .env) then {
	. .env
} fi;

if (test $PUERTODES = "") then {
	echo "Falta variable PUERTODES con puerto para lanzar servidor de desarrollo (e.g 4000)"
} fi;
if (test $IPDES = "") then {
	echo "Falta variable IPDES con IP en la que lanza servidor de desarrollo (e.g 192.168.1.1)"
} fi;
if (test "$SININD" != "1") then {
	PATH=$PATH:/usr/local/bin ./bin/rake sip:indices
} fi;
PATH=$PATH:/usr/local/bin ./bin/rails s -b $IPDES -p $PUERTODES




