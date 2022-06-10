DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE selestial_object_type
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE galaxy(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE selestial_object
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type_id INT REFERENCES selestial_object_type(id),
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INT REFERENCES selestial_object(id),
  galaxy_id INT REFERENCES galaxy(id)
);

CREATE TABLE selestial_object_moon
(
    id SERIAL PRIMARY KEY,
    selestial_object_id INT REFERENCES selestial_object(id),
    moon_id INT REFERENCES selestial_object(id)
);



CREATE UNIQUE INDEX Object_name_index ON selestial_object(name);
CREATE UNIQUE INDEX galaxy_name_index ON galaxy(name);

