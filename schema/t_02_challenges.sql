
create table challenge (
    id SERIAL PRIMARY KEY,
    name varchar NOT NULL,
    description varchar,
    constraint challenge_unique_name UNIQUE(name)

);

