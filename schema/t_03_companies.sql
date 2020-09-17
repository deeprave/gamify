
create table company (
    id SERIAL PRIMARY KEY,
    shortname varchar NOT NULL check (shortname <> '' AND shortname ~ '^[a-z0-9_ -]+$'),
    name varchar NOT NULL,
    constraint unique_shortname UNIQUE(shortname)
);


