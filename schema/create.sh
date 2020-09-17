#!/bin/sh
export PGPASSWORD="yPN92ngZTvnovwHP"
psql -f init.sql postgres postgres

for t in t_*.sql
do
  psql -f ${t} gamify gamify_user
done

unset PGPASSWORD
export PGPASSWORD
