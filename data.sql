-- inserting data into the animals table
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (1, 'Agumon', '2020-02-03', 0, True, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, True, 8),
  (3, 'Pikachu', '2021-01-07', 1, False, 15.04),
  (4, 'Devimon', '2017-05-12', 5, True, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (5, 'Charmander', '2020-02-08', 0, False, -11),
  (6, 'Plantmon', '2021-11-15', 2, True, -5.7),
  (7, 'Squirtle', '1993-04-02', 3, False, -12.13),
  (8, 'Angemon', '2005-06-12', 1, True, -45),
  (9, 'Boarmon', '2005-06-07', 7, True, 20.4),
  (10, 'Blossom', '1998-10-13', 3, True, 17),
  (11, 'Ditto', '2022-05-14', 4, True, 22);

-- inserting data into the owners table
INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody POnd', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

-- inserting data into the species table
INSERT INTO species (name)
VALUES
  ('Pokemon'),
  ('Digimon');

-- modifying the animals table to include species_id
UPDATE animals
SET species_id = (
  SELECT id
  FROM species
  WHERE species.name='Pokemon'
)
WHERE animals.name LIKE '%mon';

UPDATE animals
SET species_id = (
  SELECT id
  FROM species
  WHERE species.name='Digimon'
)
WHERE animals.species_id IS NULL;

-- modifying the animals table to include owner_id
UPDATE animals SET owner_id= (
SELECT id FROM owners WHERE owners.full_name = 'Sam Smith') WHERE animals.name = 'Agumon';

UPDATE animals SET owner_id= (
SELECT id FROM owners WHERE owners.full_name = 'Jeniffer Orwell') WHERE animals.name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id= (
SELECT id FROM owners WHERE owners.full_name = 'Bob') WHERE animals.name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id= (
SELECT id FROM owners WHERE owners.full_name = 'Melody Pond') WHERE animals.name IN ('Charmander','Squirtle', 'Blossom');

UPDATE animals SET owner_id= (
SELECT id FROM owners WHERE owners.full_name = 'Dean Wichester') WHERE animals.name IN ('Angemon','Boarmon');

  -- insert into vets
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');


-- add vet specialties
INSERT INTO specializations (species_id, vet_id)
VALUES (1, 1),
(1, 3),
(2, 3),
(2, 4);

-- animal visits to the vets
INSERT INTO visits (animals_id, vet_id, date_of_visit) VALUES
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2020-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
