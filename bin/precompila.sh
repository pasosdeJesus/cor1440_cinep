#!/bin/sh

if [ -f ".env" ] ; then
  . .env
fi;


if [ "$RAILS_ENV" = "" ] ; then
  RAILS_ENV=development
fi
rm -rf public/assets/*
if [ "$RAILS_ENV" = "ensayo" ] ; then
  rm -rf public/packs-staging/*
else
  rm -rf public/packs/*
fi
RAILS_ENV=$RAILS_ENV PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY bin/rails \
  assets:precompile --trace
