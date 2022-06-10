DROP DATABASE IF EXISTS soccer;
CREATE DATABASE soccer;

\c soccer

CREATE TABLE match
(
    id SERIAL PRIMARY KEY,
    team_1 INT NOT NULL,
    team_2 INT NOT NULL,
    date DATE NOT NULL
);

CREATE INDEX match_date_index on match(date);


INSERT INTO match
    (team_1, team_2, date)
VALUES
    (1, 2, '2022-03-01');

CREATE TABLE team
(
    id SERIAL PRIMARY KEY,
    name  VARCHAR(30) NOT NULL,
    rank  INT
);

INSERT INTO team
    (name, rank)
VALUES
    ('Manchester United', 1);


CREATE TABLE player
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name   VARCHAR (20) NOT NULL,
    team_id INT REFERENCES team(id)
);

CREATE INDEX player_fname ON player(first_name);
CREATE INDEX player_lname ON player(last_name);

INSERT INTO player
    (first_name, last_name, team_id)
VALUES
    ('frank', 'Johnson', 1);

CREATE TABLE goal
(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES player(id) NOT NULL,
    match_id INT REFERENCES match(id) NOT NULL
);

INSERT INTO goal
    (player_id, match_id)
VALUES
    (1,1);

CREATE TABLE referee
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE INDEX ref_fname ON referee(first_name);
CREATE INDEX ref_lname ON referee(last_name);

INSERT INTO referee
    (first_name, last_name)
VALUES
    ('Tomas', 'Bayer');

CREATE TABLE match_referee
(
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES match(id) NOT NULL,
    referee_id INT REFERENCES referee(id) NOT NULL
);

INSERT INTO match_referee
    (match_id, referee_id)
VALUES
    (1,1);


CREATE TABLE match_team
(
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES team(id) NOT NULL,
    match_id INT REFERENCES match(id) NOT NULL
);

INSERT INTO match_team
    (team_id, match_id)
VALUES
    (1,1);


CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO season
    (start_date, end_date)
VALUES
    ('2022-01-01', '2022-08-31');
