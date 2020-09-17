
create table team (
    id SERIAL PRIMARY KEY,
    shortname varchar NOT NULL check (shortname <> '' AND shortname ~ '^[a-z0-9_ -]+$'),
    name varchar NOT NULL,
    constraint team_unique_shortname UNIQUE(shortname)
);

create table member (
    team_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT team_membership UNIQUE (team_id, user_id),
    CONSTRAINT fk_team FOREIGN KEY(team_id) REFERENCES team(id),
    CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id)
);
