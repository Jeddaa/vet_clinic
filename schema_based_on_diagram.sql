-- create the clinic database
CREATE DATABASE clinic;

-- create table treatment
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

-- create table patient
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth VARCHAR(100)
);

-- create medical_histories table
CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    admitted_at timestamp,
    status VARCHAR(100)
);
