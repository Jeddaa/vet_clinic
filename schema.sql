-- create database vet_clinic
CREATE DATABASE vet_clinic;

-- use databse vet_clinic
USE vet_clinic;

-- create table animals
CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

-- add column species to animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

-- create table owners
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INT
);

-- create table species
CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- drop species column in animals table
ALTER TABLE animals DROP COLUMN species;

-- add owner_id and species_id columns to animals table
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

-- create new table vets
CREATE TABLE vets (
  id SERIAL PRIMARY KEY, name VARCHAR(100), age INT, date_of_graduation DATE);

-- vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    date_of_graduation DATE
);

-- specializations join table
CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
    vet_id INT REFERENCES vets(id)
);

-- visits join table
CREATE TABLE visits (
    animals_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    date_of_visit DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add index to the id columns in visit table
CREATE INDEX ix_animal_id_visits ON visits(animal_id);
CREATE INDEX ix_vet_id_visits ON visits(vet_id);
CREATE INDEX ix_email_owners ON owners(email);
