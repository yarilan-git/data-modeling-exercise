DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctor
(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(20),
    first_name VARCHAR(20)
);

INSERT INTO doctor
    (last_name, first_name)
VALUES
('John', 'Hencock'),
('Steve', 'Jones');



CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(20),
    first_name VARCHAR(20)
);

INSERT INTO patient
    (first_name, last_name)
VALUES
('Jim', 'Smith'),
('Adam', 'Roberts');

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

INSERT INTO disease
    (name)
VALUES
('Diabetes');


CREATE TABLE visit
(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    doctor_id INT REFERENCES doctor(id) NOT  NULL,
    patient_id INT REFERENCES patient(id) NOT NULL
);

INSERT INTO visit
    (date, doctor_id, patient_id)
VALUES
('2022-05-01', 1, 1);


CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  patient_id INT REFERENCES patient(id) NOT NULL,
  disease_id INT REFERENCES disease(id) NOT NULL,
  doctor_id INT REFERENCES doctor(id) NOT NULL
);

INSERT INTO diagnosis
    (patient_id, disease_id, doctor_id)
VALUES
(1,1,1);

