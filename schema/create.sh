#!/bin/sh
export PGPASSWORD="yPN92ngZTvnovwHP"
psql -f init.sql postgres postgres

for t in t_*.sql
do
  psql -f ${t} gamify gamify_user
done


psql -f x_01_data.sql gamify gamify_user

unset PGPASSWORD
export PGPASSWORD
