-- 1. 			Create users table
CREATE TABLE IF NOT EXISTS users (
    id serial UNIQUE NOT NULL,
    full_name character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    last_login timestamp without time zone DEFAULT now()
);
-- 2. Check what is inside
SELECT * FROM users;


-- 			   Populate with data

--                         Primary Keys
-- 3. Add a primaty key constraint
ALTER TABLE users ADD PRIMARY KEY (id);

-- 4. ERROR:  invalid input syntax for integer: "John Smith"
INSERT INTO users VALUES ('John Smith', false);

--                         Default Values
-- 5.
INSERT INTO users (full_name, enabled) VALUES 
	('John Smith', false);

-- 6.
INSERT INTO users (full_name) VALUES 
	('Jane Smith'),
	('Harry Potter');

--                         NOT NULL Constraints
-- 7. ERROR:  null value in column "full_name" violates not-null constraint 
INSERT INTO users (id, enabled)VALUES
	(1, false);

--                         Unique Constraints
-- 8. ERROR:  duplicate key value violates unique constraint "unique_id"
INSERT INTO users (id, full_name, enabled) VALUES 
	(1, 'Alissa Jackson', true);
	
-- 9. 
SELECT * FROM users;
	
--                         CHECK Constraints
--INSERT INTO users (id, full_name) VALUES (4, '');

-- 11.
ALTER TABLE users ADD CHECK (full_name <> '');

-- 12. 
INSERT INTO users (id, full_name) VALUES (4, '');


--                         Foreign Keys & The ON DELETE clause
/*
one to one: User has one address
*/
-- 13.
CREATE TABLE addresses (
  user_id int, -- Both a primary and foreign key
  street varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  state varchar(30) NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- 14.
INSERT INTO addresses (user_id, street, city, state) VALUES
  (1, '1 Market Street', 'San Francisco', 'CA'),
  (2, '2 Elm Street', 'San Francisco', 'CA'),
  (3, '3 Main Street', 'Boston', 'MA');
 
--                      Referential Integrity
-- 15. ERROR:  duplicate key value violates unique constraint "addresses_pkey"
INSERT INTO addresses (user_id, street, city, state) VALUES
	(1, '2 Park Road', 'San Francisco', 'CA');
  
-- 16. ERROR:  insert or update on table "addresses" violates foreign key constraint "addresses_user_id_fkey"
INSERT INTO addresses (user_id, street, city, state) VALUES
	(7, '11 Station Road', 'Portland', 'OR');
 
-- 17. 
CREATE TABLE books (
  id serial,
  title varchar(100) NOT NULL,
  author varchar(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn char(12),
  PRIMARY KEY (id),
  UNIQUE (isbn)
);

/*
 one to many: Book has many reviews
*/

-- 18.
CREATE TABLE reviews (
  id serial,
  book_id integer NOT NULL,
  reviewer_name varchar(255),
  content varchar(255),
  rating integer,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

-- 19.
INSERT INTO books (id, title, author, published_date, isbn) VALUES
  (1, 'My First SQL Book', 'Mary Parker', '2012-02-22 12:08:17.320053-03', '981483029127'),
  (2, 'My Second SQL Book', 'John Mayer', '1972-07-03 09:22:45.050088-07', '857300923713'),
  (3, 'My First SQL Book', 'Cary Flint', '2015-10-18 14:05:44.547516-07', '523120967812');

-- 20.
INSERT INTO reviews (id, book_id, reviewer_name, content, rating, published_date) VALUES
  (1, 1, 'John Smith', 'My first review', 4, '2017-12-10 05:50:11.127281-02'),
  (2, 2, 'John Smith', 'My second review', 5, '2017-10-13 15:05:12.673382-05'),
  (3, 2, 'Alice Walker', 'Another review', 1, '2017-10-22 23:47:10.407569-07');
 
-- 21.
CREATE TABLE checkouts (
  id serial,
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

-- 22.
INSERT INTO checkouts (id, user_id, book_id, checkout_date, return_date) VALUES
  (1, 1, 1, '2017-10-15 14:43:18.095143-07', NULL),
  (2, 1, 2, '2017-10-05 16:22:44.593188-07', '2017-10-13 13:0:12.673382-05'),
  (3, 2, 2, '2017-10-15 11:11:24.994973-07', '2017-10-22 17:47:10.407569-07'),
  (4, 3, 3, '2017-10-15 09:27:07.215217-07', NULL);
  
--                        Joins:
-- Syntax:
-- SELECT [table_name.column_name1, table_name.column_name2,..] FROM table_name1
-- join_type JOIN table_name2 ON (join_condition);

--                        INNER JOIN
-- 23.
SELECT users.*, addresses.*
FROM users INNER JOIN addresses
ON (users.id = addresses.user_id);

--                        LEFT JOIN
-- 24.
SELECT users.*, addresses.*
FROM users
LEFT JOIN addresses
ON (users.id = addresses.user_id);

--                        RIGHT JOIN
-- 25. 
SELECT reviews.book_id, reviews.content,
       reviews.rating, reviews.published_date,
       books.id, books.title, books.author
FROM reviews RIGHT JOIN books ON (reviews.book_id = books.id);

--                        FULL JOIN
-- 26. 
CREATE TABLE basket_a (
    id INT PRIMARY KEY,
    fruit VARCHAR (100) NOT NULL
);
 
CREATE TABLE basket_b (
    id INT PRIMARY KEY,
    fruit VARCHAR (100) NOT NULL
);
 
INSERT INTO basket_a (id, fruit)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');
 
INSERT INTO basket_b (id, fruit)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');
	
SELECT
    a.id id_a,
    a.fruit fruit_a,
    b.id id_b,
    b.fruit fruit_b
FROM
    basket_a a
FULL JOIN basket_b b ON a.fruit = b.fruit;


--                        CROSS JOIN
-- 27.
SELECT * FROM users CROSS JOIN addresses;
-- SELECT * FROM users, addresses;


--                        Multiple Joins
-- 28.
SELECT users.full_name, books.title, checkouts.checkout_date
FROM users
INNER JOIN checkouts ON (users.id = checkouts.user_id)
INNER JOIN books ON (books.id = checkouts.book_id);


--                        Aliasing
-- 29.
SELECT u.full_name, b.title, c.checkout_date
FROM users AS u
INNER JOIN checkouts AS c ON (u.id = c.user_id)
INNER JOIN books AS b ON (b.id = c.book_id);

  
  


