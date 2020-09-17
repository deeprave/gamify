
INSERT INTO users (login, name, email)
VALUES
    ('john', 'John Citizen', 'john@example.com'),    -- 1
    ('jane', 'Jane Doe', 'jane@example.com'),       -- 2
    ('peter', 'Peter Famous', 'peter@example.com'), -- 3
    ('wendy', 'Wendy Farmer', 'wendy@example.com'), -- 4
    ('zack', 'Zack Soccerberg', 'zs@example.com'),  -- 5
    ('ted', 'Ted Warder', 'ted@example.com'),       -- 6
    ('jenny', 'Jenny Irving', 'ji@example.com')     -- 7
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

INSERT INTO targets (challenge, company, team, userid, target)
VALUES
-- challenge, company, team, userid, target
    ('learning',   'unico', 'hi-fliers',   'john', 100),
    ('learning',   'unico', 'lo-dwellers', 'wendy', 100),
    ('timesheets', 'unico', 'hi-fliers',   'john', 31),
    ('timesheets', 'unico', 'hi-fliers',   'wendy', 31),
    ('timesheets', 'unico', 'lo-dwellers', 'peter', 31),
    ('timesheets', 'unico', 'lo-dwellers',  'jenny', 31),
    ('timesheets', 'unico', 'middles',     'ted', 31),
    ('timesheets', 'unico', 'middles',     'jane', 31),
    ('timesheets', 'unico', 'middles',     'zack', 31)
;

INSERT INTO statistics (challenge, company, team, userid, delta)
VALUES
    ('timesheets', 'unico', 'hi-fliers', 'john', 14),
    ('timesheets', 'unico', 'hi-fliers', 'john', 16),
    ('timesheets', 'unico', 'hi-fliers', 'wendy', 12),
    ('timesheets', 'unico', 'lo-dwellers', 'peter', 19),
    ('timesheets', 'unico', 'lo-dwellers', 'jenny', 17),
    ('timesheets', 'unico', 'middles', 'ted', 19),
    ('timesheets', 'unico', 'middles', 'jane', 21),
    ('timesheets', 'unico', 'middles', 'zack', 20)
;
