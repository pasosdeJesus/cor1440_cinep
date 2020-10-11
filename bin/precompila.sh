#!/bin/sh

if [ -f ".env" ] ; then
  . .env
fi;


if [ "$RAILS_ENV" = "" ] ; then
  RAILS_ENV=development
fi
rm -rf public/assets/*
rm -rf public/packs/*
RAILS_ENV=$RAILS_ENV PGSSLCERT=$PGSSLCERT PGSSLKEY=$PGSSLKEY bin/rails \
  assets:precompile --trace
