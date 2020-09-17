
INSERT INTO users (name, email)
VALUES
    ('John Citizen', 'john@example.com'),   -- 1
    ('Jane Doe', 'jane@example.com'),       -- 2
    ('Peter Famous', 'peter@example.com'),  -- 3
    ('Wendy Farmer', 'wendy@example.com'),  -- 4
    ('Zack Soccerberg', 'zs@example.com'),  -- 5
    ('Ted Warder', 'ted@example.com'),      -- 6
    ('Jenny Irving', 'ji@example.com')      -- 7
;

INSERT INTO company (shortname, name)
VALUES
    ('example', 'Example widges Inc'),
    ('unico', 'Unico Computer Systems')
;

INSERT INTO challenge (name)
VALUES
    ('learning'),
    ('timesheets'),
    ('social')
;


INSERT INTO team (shortname, name)
VALUES
    ('hi-fliers', 'High Fliers'),           -- 1
    ('lo-dwellers', 'Low Dwellers'),        -- 2
    ('middles', 'Middle Earth')             -- 3
;

INSERT INTO member (team_id, user_id)
VALUES
    (1, 1),
    (1, 4),
    (2, 3),
    (2, 7),
    (3, 6),
    (3, 2),
    (3, 5)
;

INSERT INTO targets (challenge_id, company_id, team_id, user_id, target)
VALUES
-- challenge_id, company_id, team_id, user_id, target
    (1, 2, 1, 1, 100),
    (1, 2, 2, 4, 100),
    (2, 2, 1, 1, 31),
    (2, 2, 1, 4, 31),
    (2, 2, 2, 3, 31),
    (2, 2, 2, 7, 31),
    (2, 2, 3, 6, 31),
    (2, 2, 3, 2, 31),
    (2, 2, 3, 5, 31)
;

INSERT INTO statistics (challenge_id, company_id, team_id, user_id, score_delta)
VALUES
    (2, 2, 1, 1, 14),
    (2, 2, 1, 1, 16),
    (2, 2, 1, 4, 12),
    (2, 2, 2, 3, 19),
    (2, 2, 2, 7, 17),
    (2, 2, 3, 6, 19),
    (2, 2, 3, 2, 21),
    (2, 2, 3, 5, 20)
;
