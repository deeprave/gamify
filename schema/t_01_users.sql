
create table users (
    id SERIAL PRIMARY KEY,
    login varchar NOT NULL,
    name varchar NOT NULL,
    email varchar,
    constraint users_unique_name UNIQUE(name)
);
