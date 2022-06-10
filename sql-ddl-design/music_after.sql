DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL    
);

CREATE UNIQUE INDEX title_index ON songs(title);



CREATE TABLE artist
(
      id SERIAL PRIMARY KEY,
      first_name VARCHAR(20) NOT NULL,
      last_name  VARCHAR(20) NOT NULL
);

CREATE INDEX fname_index ON artist(first_name);
CREATE INDEX lname_index ON artist(last_name);

CREATE TABLE song_artist
(
      id SERIAL PRIMARY KEY,
      song_id INT REFERENCES songs(id),
      artist_id INT REFERENCES artist(id)
);

CREATE TABLE album
(
      id SERIAL PRIMARY KEY,
      name VARCHAR(20) NOT NULL,
      release_date DATE NOT NULL
);

CREATE INDEX name_index ON album(name);

CREATE TABLE album_song
(
      id SERIAL PRIMARY KEY,
      album_id INT REFERENCES album(id),
      song_id INT REFERENCES songs(id)
);

CREATE TABLE producer
(
      id SERIAL PRIMARY KEY,
      first_name VARCHAR(20) NOT NULL,
      last_name  VARCHAR(20) NOT NULL
);

CREATE INDEX fname_index ON producer(first_name);
CREATE INDEX lname_index ON producer(last_name);


CREATE TABLE album_producer
(
      id SERIAL PRIMARY KEY,
      album_id INT REFERENCES album(id),
      producer_id INT REFERENCES producer(id)
);


