-- 1. create database
CREATE DATABASE university
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
-- 2. create tables
CREATE TABLE student (
    sid SERIAL PRIMARY KEY,
    iname varchar(45) NOT NULL,
	fname varchar(45) NOT NULL,
	phone CHAR(13) NOT NULL,
	IQ int NOT NULL,
	birth_date DATE NOT NULL
);

CREATE TABLE university (
	uid SERIAL PRIMARY KEY,
	name varchar(45) not null,
	founded_in date not null,
	raiting int not null
);

CREATE TABLE migration (
    mid SERIAL PRIMARY KEY,
    who int NOT NULL,
	from_ int NOT NULL,
	to_ int NOT NULL,
	when_ DATE NOT NULL
);

-- 3. add university description
ALTER TABLE university ADD COLUMN about text;

-- 4. add student gender
ALTER TABLE student ADD COLUMN gender varchar(6);

-- 5. populate tables
INSERT INTO student (iname, fname, phone, iq, birth_date, gender) VALUES
('Pellentesque', 'Aenean', '+997400033863', 100, '2001-01-01', 'female'),
('interdum', 'convallis', '+827236682348', 101, '2001-01-02', 'male'),
('pellentesque', 'lorem', '+167902697951', 103, '2001-02-01', 'female'),
('laoreet', 'arcu', '+348316920649', 104, '2002-01-01', 'male'),
('lorem', 'feugiat', '+306222816130', 90, '2001-01-03', 'female'),
('Sit', 'metus', '+476874537110', 180, '2001-03-01', 'male'),
('vulputate', 'semper', '+55549230337', 139, '2003-01-01', 'female'),
('lobortis', 'nulla', '+866268823705', 100, '2001-01-04', 'male'),
('Taciti', 'leo', '+614826898463', 109, '2003-04-01', 'female'),
('placerat', 'Porttitor', '+979225460145', 101, '2004-01-01', 'male'),
('eleifend', 'Lacus', '+414652833007', 120, '2003-01-05', 'female'),
('ut', 'aenean', '+438516520042', 125, '2003-05-01', 'male'),
('suscipit', 'Ligula', '+322165792593', 186, '2005-01-01', 'female'),
('hac', 'vestibulum', '+173343954488', 156, '2003-02-01', 'male'),
('ad', 'nisi', '+465934123107', 123, '2000-02-01', 'female');

insert into university (name, founded_in, raiting) values
('Suscipit nam, eros parturient', '1900-01-01', 5, 'some text'),
('Magna ad felis', '1901-01-01', 324, 'some text'),
('Taciti odio odio maecenas est', '1800-01-01', 34, 'some text'),
('Sapien felis in taciti mollis', '1801-01-01', 256, 'some text'),
('Dis hac consequat', '1950-01-01', 1341, 'some text'),
('Ultricies adipiscing', '1850-01-01', 3, 'some text'),
('Dictum elit ad risus', '1709-01-01', 1, 'some text'),
('Aptent penatibus mi', '2020-01-01', 3556, 'some text'),
('Quam primis sociosqu taciti', '2010-01-01', 324, 'some text'),
('Metus lobortis fames a', '2017-01-01', 23, 'some text'),
('Penatibus elit', '1355-01-01', 24, 'some text'),
('Arcu velit condimentum volutpat', '1234-01-01', 56, 'some text'),
('Mi habitant aliquet magna', '1987-01-01', 8, 'some text'),
('Duis ut sollicitudin blandit', '1345-01-01', 2, 'some text'),
('Iaculis euismod quam sociosqu netus in', '2004-01-01', 987, 'some text');

insert into migration (who, from_, to_, when_) values
(2, 3, 4, '2006-01-01'), 
(1, 2, 4, '2006-01-01'), 
(3, 3, 5, '2006-01-01'),
(4, 3, 9, '2006-01-01'),
(12, 13, 14, '2006-01-01'),
(2, 4, 14, '2009-01-01'),
(5, 2, 4, '2006-01-01'),
(6, 3, 4, '2006-01-01'),
(8, 3, 4, '2006-01-01'),
(7, 3, 4, '2006-01-01'),
(9, 3, 4, '2006-01-01'),
(10, 3, 4, '2006-01-01'),
(15, 3, 4, '2006-01-01'),
(14, 3, 4, '2006-01-01'),
(13, 3, 4, '2006-01-01');
-- 6. modify student phones
UPDATE student SET phone = '+140582151809' WHERE sid = 1;
UPDATE student SET phone = '+404230079669' WHERE sid = 2;
UPDATE student SET phone = '+158983878687' WHERE sid = 4;

-- 7. select gerls
SELECT * FROM student WHERE gender='female';

-- 8. select all 18+
SELECT * FROM student where extract(year from age(birth_date))::int >= 18
-- 9. select first 10 students ordered by iname and fname
SELECT * FROM student ORDER BY iname asc limit 10;
SELECT * FROM student ORDER BY fname asc limit 10;

-- 10. delete records from tables
delete from migration;
delete from university;
delete from student;
-- 11. delete all tables
drop table migration;
drop table university;
drop table student;
-- 12. delete database
drop database university;
