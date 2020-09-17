psql -f init.sql postgres postgres

for t in t_*.sql
do
  psql -f ${t} gamify gamify_user
done

