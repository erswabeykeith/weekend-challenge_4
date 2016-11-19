CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) UNIQUE NOT NULL,
	author VARCHAR(50) NOT NULL,
	page_count INTEGER NOT NULL,
	published DATE NOT NULL
	);
	


DROP TABLE books;

INSERT INTO books (title, author, page_count, published)
VALUES ('Harry Potter and the Philosophers Stone', 'JK Rowling', 248, '6-26-1997');

SELECT * 
FROM books;

UPDATE books
SET title='Harry Potter and the Sorcerer''s Stone';

INSERT INTO books (title, author, page_count, published)
VALUES ('Harry Potter and the Chamber of Secrets', 'JK Rowling', 238, '6-26-1999'),
('Harry Potter and the Prisoner of Azkaban', 'JK Rowling', 300, '6-26-2001'),
('Harry Potter and the Golblet of Fire', 'JK Rowling', 574, '6-26-2003'),
('Harry Potter and the Order of the Phoenix', 'JK Rowling', 574, '6-26-2005'),
('Harry Potter and the Half-Blood Prince', 'JK Rowling', 624, '6-26-2006'),
('Harry Potter and the Deathly Hallows', 'JK Rowling', 238, '6-26-1999');

UPDATE books
SET published='7-16-2005'
WHERE title='Harry Potter and the Half-Blood Prince';

SELECT *
FROM books
ORDER BY id;

INSERT INTO books (title, author, page_count, published)
VALUES ('Watchmen', 'Alan Moore', 123, '1-23-1986');

UPDATE books
SET author='J.K. Rowling'
WHERE author LIKE '%Rowling'

DELETE FROM books
WHERE title LIKE 'Watchmen'; (or '%atch%')

DELETE FROM books
WHERE title LIKE '%Harry%'
OR author LIKE '%Moore';

SELECT *
FROM books
WHERE published > '1-1-2002';  <> does not equal

SELECT *
FROM books
WHERE title NOT ILIKE '%secrets';

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) UNIQUE NOT NULL,
  author VARCHAR(50) NOT NULL,
  page_count BIGINT NOT NULL,
  published DATE NOT NULL
);

INSERT INTO books (title, author, page_count, published)
VALUES ('Harry Potter and the Chamber of Secrets', 'JK Rowling', 238, '6-26-1999'),
('Harry Potter and the Prisoner of Azkaban', 'JK Rowling', 300, '6-26-2001'),
('Harry Potter and the Goblet of Fire', 'JK Rowling', 534, '6-26-2003'),
('Harry Potter and the Order of the Pheonix', 'JK Rowling', 574, '6-26-2005'),
('Harry Potter and the Half-Blood Prince', 'JK Rowling', 574, '6-26-2005'),
('Harry Potter and the Deathly Hallows', 'JK Rowling', 624, '6-26-2003'),
('Harry Potter and the Cursed Child', 'JK Rowling', 624, '6-26-2003');


ALTER TABLE books
      ADD  COLUMN genre VARCHAR(120),
      ADD COLUMN  publisher varchar(120);
      
ALTER TABLE books
      ADD  COLUMN edition int;
      
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) UNIQUE NOT NULL,
  author VARCHAR(50) NOT NULL,
  genre VARCHAR(100) NOT NULL,
  published DATE NOT NULL,
  edition INTEGER,
  publisher VARCHAR(120)
);

INSERT INTO books (title, author, genre, published, edition, publisher)
VALUES ('Harry Potter and the Chamber of Secrets', 'JK Rowling', 'fantasy', '6-26-1999', 1, 'Scholastic'),
('Harry Potter and the Prisoner of Azkaban', 'JK Rowling', 'fantasy', '6-26-2001', 1, 'Scholastic'),
('Harry Potter and the Goblet of Fire', 'JK Rowling', 'fantasy', '6-26-2003', 1, 'Scholastic'),
('Harry Potter and the Order of the Pheonix', 'JK Rowling', 'fantasy', '6-26-2005', 1, 'Scholastic'),
('Harry Potter and the Half-Blood Prince', 'JK Rowling', 'fantasy', '6-26-2005', 1, 'Scholastic'),
('Harry Potter and the Deathly Hallows', 'JK Rowling', 'fantasy', '6-26-2003', 1, 'Scholastic'),
('Harry Potter and the Cursed Child', 'JK Rowling', 'fantasy', '6-26-2003', 1, 'Scholastic');

CREATE TABLE people (
id SERIAL PRIMARY KEY,
first_name VARCHAR(80),
last_name VARCHAR(80)
);

INSERT INTO people (first_name, last_name)
VALUES ('Jason', 'Sunde'),
('Liz', 'Swabey-Keith'),
('Michael', 'Brannen');

SELECT *
FROM people;

CREATE TABLE jobs(
id SERIAL PRIMARY KEY,
title VARCHAR(80)
);

INSERT INTO jobs(title)
VALUES ('Marine Biologist');

SELECT *
FROM jobs;
     
SELECT *
FROM jobs
JOIN people
ON people.id=jobs.people_id
WHERE people.first_name='Jason';

DROP TABLE people, jobs;

CREATE TABLE people_jobs(
PRIMARY KEY(people_id, jobs_id),
people_id INTEGER REFERENCES people,
jobs_id INTEGER REFERENCES jobs
);

INSERT INTO people_jobs
VALUES(3,8),
(1,2),
(3,4),
(2,7);

DROP TABLE people_jobs;

SELECT * 
FROM people_jobs;

SELECT *
FROM people
JOIN people_jobs ON people.id = people_jobs.people_id
JOIN jobs ON jobs.id = people_jobs.jobs_id;

SELECT *
FROM people;

SELECT *
FROM people
JOIN people_jobs ON people.id = people_jobs.people_id
RIGHT JOIN jobs ON jobs.id = people_jobs.jobs_id;

SELECT *
FROM people
LEFT JOIN people_jobs ON people.id = people_jobs.people_id
LEFT JOIN jobs ON jobs.id = people_jobs.jobs_id;

INSERT INTO people (first_name, last_name)
VALUES ('Steve', 'Larsen');

CREATE TABLE stats(
id SERIAL PRIMARY KEY,
recorded TIMESTAMP DEFAULT current_date,
inches INTEGER,
drought boolean NOT NULL DEFAULT FALSE,
city VARCHAR(80)
);

INSERT INTO stats (recorded, inches, drought, city)
VALUES ('1997-10-02', 20, true, 'Chicago'),
('1997-10-12', 10, true, 'Chicago'),
('2001-11-02', 1, false, 'Detroit'),
('2010-08-05', 3, true, 'Detroit'),
('2010-07-06', 0, false, 'Detroit'),
('2016-09-20', 3, true, 'Las Vegas');

SELECT *
FROM stats;

SELECT MAX(inches) AS max_rainfall, MIN(inches), AVG(inches)
FROM stats;

SELECT city, AVG(inches)
FROM stats
GROUP BY city;

-----------------------------------------------------

CREATE TABLE tasks (
	id SERIAL PRIMARY KEY,
	taskName VARCHAR(100) UNIQUE NOT NULL);

SELECT * FROM tasks;

ALTER TABLE tasks
  ADD completionStatus VARCHAR(50);


INSERT INTO tasks (taskname, completionstatus)
VALUES ('Do the dishes', 'yes');
