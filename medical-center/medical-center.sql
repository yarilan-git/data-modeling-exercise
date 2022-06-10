DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctor
(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(20),
    first_name VARCHAR(20)
);

CREATE INDEX doc_fname_index on doctor(first_name);
CREATE INDEX doc_lname_index on doctor(last_name);

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

CREATE INDEX patient_fname_index on patient(first_name);
CREATE INDEX patient_lname_index on patient(last_name);

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

CREATE UNIQUE INDEX disease_name_index on disease(name);


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

CREATE INDEX visit_date_index on visit(date);

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

CREATE INDEX diagnosis_patient_index on diagnosis(patient_id);

INSERT INTO diagnosis
    (patient_id, disease_id, doctor_id)
VALUES
(1,1,1);

