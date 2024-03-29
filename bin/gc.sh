#!/bin/sh
# Hace pruebas, pruebas de regresión, envia a github y sube a heroku

if (test -f ".env") then {
	. ./.env
} fi;

grep "^[^#]*path" -B 1 -A 1 Gemfile
if (test "$?" = "0") then {
  echo "Hay una gema cableada en el sistema de archivos"
  exit 1;
} fi;

grep "^ *gem *.debugger*" Gemfile > /dev/null 2> /dev/null
if (test "$?" = "0") then {
	echo "Gemfile incluye debugger"
	exit 1;
} fi;
grep "^ *gem *.byebug*" Gemfile > /dev/null 2> /dev/null
if (test "$?" = "0") then {
	echo "Gemfile incluye byebug que rbx de travis-ci no quiere"
	exit 1;
} fi;

if (test "$SINAC" != "1") then {
	NOKOGIRI_USE_SYSTEM_LIBRARIES=1 MAKE=gmake make=gmake QMAKE=qmake4 bundle update
	if (test "$?" != "0") then {
		exit 1;
	} fi;
	CXX=c++ yarn upgrade
	if (test "$?" != "0") then {
		exit 1;
	} fi;
} fi;
if (test "$SININS" != "1") then {
	NOKOGIRI_USE_SYSTEM_LIBRARIES=1 MAKE=gmake make=gmake QMAKE=qmake4 bundle install
	if (test "$?" != "0") then {
		exit 1;
	} fi;
	CXX=c++ yarn install
	if (test "$?" != "0") then {
		exit 1;
	} fi;
} fi;
if (test "$SINMIG" != "1") then {
        PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY bundle exec rake db:migrate sip:indices db:structure:dump
	if (test "$?" != "0") then {
		exit 1;
	} fi;
} fi;

PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY RAILS_ENV=test bundle exec rake db:drop db:setup;  PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY RAILS_ENV=test bin/rails db:migrate sip:indices
if (test "$?" != "0") then {
	echo "No puede preparse base de prueba";
	exit 1;
} fi;

CONFIG_HOSTS=www.example.com PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY bundle exec bin/rails test
if (test "$?" != "0") then {
	echo "No pasaron pruebas";
	exit 1;
} fi;


#CONFIG_HOSTS=127.0.0.1 PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY bundle exec bin/rails test:system
#if (test "$?" != "0") then {
#	echo "No pasaron pruebas de sistema";
#	exit 1;
#} fi;

RAILS_ENV=test bin/rails db:structure:dump
b=`git branch | grep "^*" | sed -e  "s/^* //g"`
git status -s
if (test "$MENSCONS" = "") then {
	MENSCONS="Actualiza"
} fi;
git commit -m "$MENSCONS" -a
git push origin ${b}
if (test "$?" != "0") then {
	echo "No pudo subirse el cambio a github";
	exit 1;
} fi;


if (test "$CONH" != "") then {
	git push heroku master
	heroku run rake db:migrate sip:indices
} fi;

if (test "$?" != "0") then {
	echo "No puede preparse base de prueba";
	exit 1;
} fi;

