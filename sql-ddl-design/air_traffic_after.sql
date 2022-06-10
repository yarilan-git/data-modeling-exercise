DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name  VARCHAR(20) NOT NULL
);

CREATE INDEX pass_fname_index ON passenger(first_name);
CREATE INDEX pass_lname_index ON passenger(last_name);


CREATE TABLE airline
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)  NOT NULL
);

CREATE UNIQUE INDEX airline_name_index on airline(name);

CREATE TABLE country 
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE UNIQUE INDEX country_name_index on country(name);

CREATE TABLE City
(
    id SERIAL PRIMARY KEY,
    name  VARCHAR(30) NOT NULL,
    country_id INT REFERENCES country(id)
);

CREATE INDEX city_name_index on city(name);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passenger(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airline(id),
  from_city_id INT REFERENCES city(id),
  from_country_id INT REFERENCES country(id),
  to_city_id INT REFERENCES city(id),
  to_country_id INT REFERENCES country(id)
);

CREATE INDEX flight_date_index on tickets(departure);
CREATE INDEX flight_airline_index on tickets(airline_id);

