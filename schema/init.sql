drop database gamify;
drop role gamify_user;
drop role gamify;

-- create users and database
create role gamify createdb;
create role gamify_user createdb createrole inherit login password 'yPN92ngZTvnovwHP';
grant gamify to gamify_user;
alter role gamify set client_encoding  to 'utf8';
alter role gamify set default_transaction_isolation to 'read committed';
alter role gamify set timezone to 'Australia/Melbourne';
create database gamify owner gamify;
