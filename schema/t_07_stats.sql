CREATE OR REPLACE FUNCTION update_changed_timestamp()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.dt_changed = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

create table statistics (
    id SERIAL PRIMARY KEY,
    challenge_id INT NOT NULL,
    company_id INT NOT NULL,
    team_id INT,
    user_id INT NOT NULL,
    dt_created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dt_changed TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    score_delta INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_s_challenge FOREIGN KEY(challenge_id) REFERENCES challenge(id),
    CONSTRAINT fk_s_company FOREIGN KEY(company_id) REFERENCES company(id),
    CONSTRAINT fk_s_team FOREIGN KEY(team_id) REFERENCES team(id),
    CONSTRAINT fk_s_user FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TRIGGER update_statistics BEFORE UPDATE ON statistics
    FOR EACH ROW EXECUTE PROCEDURE update_changed_timestamp();

create table targets (
    id SERIAL PRIMARY KEY,
    challenge_id INT,
    company_id INT,
    team_id INT,
    user_id INT,
    dt_created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dt_changed TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    target INT NOT NULL,
    CONSTRAINT fk_t_challenge FOREIGN KEY(challenge_id) REFERENCES challenge(id),
    CONSTRAINT fk_t_company FOREIGN KEY(company_id) REFERENCES company(id),
    CONSTRAINT fk_t_team FOREIGN KEY(team_id) REFERENCES team(id),
    CONSTRAINT fk_t_user FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TRIGGER update_statistics BEFORE UPDATE ON targets
    FOR EACH ROW EXECUTE PROCEDURE update_changed_timestamp();
