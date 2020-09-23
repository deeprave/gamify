CREATE OR REPLACE FUNCTION update_changed_timestamp()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.dt_changed = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

create table events (
    id SERIAL PRIMARY KEY,
    challenge varchar NOT NULL,
    company varchar NOT NULL,
    team varchar,
    userid varchar NOT NULL,
    dt_created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dt_changed TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    delta INT NOT NULL DEFAULT 1
);

CREATE TRIGGER update_event BEFORE UPDATE ON events
    FOR EACH ROW EXECUTE PROCEDURE update_changed_timestamp();

create table targets (
    id SERIAL PRIMARY KEY,
    challenge varchar,
    company varchar,
    team varchar,
    userid varchar,
    dt_created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dt_changed TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    target INT NOT NULL
);

CREATE TRIGGER update_target BEFORE UPDATE ON targets
    FOR EACH ROW EXECUTE PROCEDURE update_changed_timestamp();
