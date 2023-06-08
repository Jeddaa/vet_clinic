-- select all columns from the table animals where the name ends with 'mon'
SELECT * FROM animals WHERE name LIKE '%mon';

-- select all columns from animals with date of birth btwn 2016-01-01 and 2019-01-01
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered=True AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=True;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.5 AND weight_kg <=17.3;
BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT ditto;
UPDATE animals SET weight_kg= weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SAVEPOINT ditto;
SELECT * FROM animals;
UPDATE animals SET weight_kg= weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
-- count all animals
SELECT COUNT(*) FROM animals;

-- count all animals that haven't tried to escape
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;

-- select the average weight of all animals
SELECT AVG(weight_kg) AS AVERAGE_WEIGHT FROM animals;
SELECT * FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- select owners with the highest number of animals
SELECT owners.full_name, animals.name FROM owners
JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';

-- seleect animals that are of species 'pokemon'
SELECT species.name AS species_name, animals.name FROM species
JOIN animals ON species.id = animals.species_id WHERE species.name = 'Pokemon';

-- show all owners and their animals but include owners without animals
SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- count animals by species
SELECT species.name, COUNT(animals.species_id) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;

-- list 'digimon' owned by 'Jennifer orwell'
SELECT animals.id, animals.name, owners.full_name as owners_name, species.name AS
species_name FROM animals JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

-- list all animals owned by 'Dean winchester that haven't tried to escape
SELECT animals.name FROM owners JOIN animals ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- list the owner with the highest animal
SELECT owners.id, owners.full_name, COUNT(animals.id) AS animal_count
FROM owners JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id, owners.full_name
HAVING COUNT(animals.id) = (
    SELECT MAX(animal_count)
    FROM (
        SELECT COUNT(id) AS animal_count
        FROM animals
        GROUP BY owner_id
    ) AS subquery
);



