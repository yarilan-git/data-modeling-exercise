DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE UNIQUE INDEX region_name_index on region(name);

INSERT INTO region
    (name)
VALUES
    ('Northern region');

CREATE TABLE usr
(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    preferred_region INT REFERENCES region(id)
);

CREATE UNIQUE INDEX user_name_index on usr(user_name);

INSERT INTO usr
    (user_name, preferred_region)
VALUES
    ('poster', 1);

CREATE TABLE location
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    region_id INT REFERENCES region(id)
);

INSERT INTO location
    (name, region_id)
VALUES
    ('Main Street', 1);

CREATE INDEX location_name_index on location(name);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE UNIQUE INDEX cat_name_index on category(name);

INSERT INTO category
    (name)
VALUES
    ('Jobs');


CREATE TABLE post
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    content TEXT,
    user_id INT REFERENCES usr(id),
    location_id INT REFERENCES location(id),
    region_id INT REFERENCES region(id),
    category_id INT REFERENCES category(id)
);

CREATE INDEX post_title_index on post(title);

INSERT INTO post
    (title, content, user_id, location_id, region_id, category_id)
VALUES
    ('A post', 'This is my first post', 1, 1, 1, 1);


