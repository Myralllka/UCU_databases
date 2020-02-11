--
-- PostgreSQL database dump
--
CREATE DATABASE exercises;
-- \c exercises
CREATE TABLE bookings (
    bookid integer NOT NULL,
    facid integer NOT NULL,
    memid integer NOT NULL,
    starttime timestamp without time zone NOT NULL,
    slots integer NOT NULL
);
CREATE TABLE facilities (
    facid integer NOT NULL,
    name character varying(100) NOT NULL,
    membercost numeric NOT NULL,
    guestcost numeric NOT NULL,
    initialoutlay numeric NOT NULL,
    monthlymaintenance numeric NOT NULL
);
CREATE TABLE members (
    memid integer NOT NULL,
    surname character varying(200) NOT NULL,
    firstname character varying(200) NOT NULL,
    address character varying(300) NOT NULL,
    zipcode integer NOT NULL,
    telephone character varying(20) NOT NULL,
    recommendedby integer,
    joindate timestamp without time zone NOT NULL
);
ALTER TABLE members ADD COLUMN gender BOOLEAN;
ALTER TABLE members ADD COLUMN gender BOOLEAN DEFAULT False;
ALTER TABLE members DROP COLUMN gender;
ALTER TABLE members RENAME TO club_members;
ALTER TABLE members ALTER COLUMN gender TYPE integer;
SELECT * FROM members;
DROP TABLE members;
DROP TABLE IF EXISTS author;
TRUNCATE TABLE members;
INSERT INTO bookings (bookid, facid, memid, starttime, slots) VALUES
(0, 3, 1, '2012-07-03 11:00:00', 2),
(1, 4, 22, '2012-07-03 08:00:00', 2),
(2, 6, 0, '2012-07-03 18:00:00', 2),
(3, 7, 1, '2012-07-03 19:00:00', 2),
(4, 0, 2, '2012-07-04 09:00:00', 3),
(5, 0, 21, '2012-07-04 15:00:00', 3),
(6, 4, 3, '2012-07-04 13:30:00', 2),
(7, 4, 0, '2012-07-04 15:00:00', 2),
(8, 8, 16, '2012-07-04 18:00:00', 1),
(9, 3, 2, '2012-07-07 12:30:00', 2),
(10, 4, 3, '2012-07-07 11:30:00', 2),
(11, 7, 18, '2012-07-10 08:30:00', 2),
(12, 0, 4, '2012-07-11 08:00:00', 3),
(13, 5, 4, '2012-07-11 17:00:00', 2),
(14, 0, 5, '2012-07-16 11:00:00', 3),
(15, 0, 5, '2012-07-16 19:00:00', 3),
(16, 1, 23, '2012-07-16 08:00:00', 3),
(17, 1, 23, '2012-07-26 08:00:00', 3),
(18, 1, 23, '2012-07-26 11:30:00', 3),
(19, 1, 6, '2012-07-26 19:00:00', 3),
(20, 2, 7, '2012-07-26 14:00:00', 3),
(21, 7, 7, '2012-07-26 09:30:00', 2),
(22, 7, 6, '2012-07-26 11:00:00', 2),
(23, 1, 24, '2012-08-05 11:00:00', 3),
(24, 1, 9, '2012-08-05 15:30:00', 3),
(25, 2, 10, '2012-08-07 15:00:00', 3),
(26, 2, 7, '2012-08-08 11:00:00', 3),
(27, 2, 1, '2012-08-08 14:00:00', 3),
(28, 2, 5, '2012-08-08 17:30:00', 3),
(29, 2, 24, '2012-08-08 19:00:00', 3),
(30, 3, 10, '2012-08-09 10:00:00', 2),
(31, 0, 12, '2012-08-11 16:30:00', 3),
(32, 1, 11, '2012-08-11 08:00:00', 3),
(33, 3, 13, '2012-08-11 19:00:00', 2),
(34, 4, 14, '2012-08-11 11:00:00', 2),
(35, 5, 12, '2012-08-11 19:30:00', 2),
(36, 6, 13, '2012-08-11 08:00:00', 2),
(37, 3, 19, '2012-08-12 14:30:00', 2),
(38, 1, 26, '2012-08-13 12:30:00', 6),
(39, 1, 11, '2012-08-13 15:30:00', 3),
(40, 7, 14, '2012-08-13 09:00:00', 2),
(41, 7, 13, '2012-08-13 13:00:00', 2),
(42, 1, 12, '2012-08-15 11:30:00', 3),
(43, 1, 11, '2012-08-15 14:30:00', 3),
(44, 1, 12, '2012-08-15 16:30:00', 3),
(45, 8, 25, '2012-08-17 16:30:00', 1),
(46, 8, 20, '2012-08-23 18:30:00', 1),
(47, 8, 17, '2012-08-23 19:00:00', 1),
(48, 8, 16, '2012-08-23 20:00:00', 1),
(49, 0, 14, '2012-08-24 09:00:00', 3),
(50, 1, 10, '2012-08-24 15:30:00', 3),
(51, 1, 12, '2012-08-24 18:00:00', 3),
(52, 2, 13, '2012-08-24 08:00:00', 3),
(53, 2, 15, '2012-08-24 13:00:00', 3),
(54, 2, 16, '2012-08-24 15:00:00', 3),
(55, 2, 12, '2012-08-24 16:30:00', 3),
(56, 3, 17, '2012-08-24 14:00:00', 2),
(57, 3, 15, '2012-08-24 17:30:00', 2),
(58, 8, 27, '2012-08-24 11:00:00', 1),
(59, 8, 16, '2012-08-24 13:30:00', 1),
(60, 8, 14, '2012-08-24 14:00:00', 1),
(61, 8, 14, '2012-08-24 17:30:00', 1),
(62, 0, 17, '2012-08-25 17:00:00', 3),
(63, 1, 28, '2012-08-25 11:30:00', 3),
(64, 1, 15, '2012-08-25 18:30:00', 3),
(65, 2, 14, '2012-08-25 11:00:00', 3),
(66, 3, 16, '2012-08-25 09:30:00', 2),
(67, 3, 0, '2012-08-25 12:00:00', 2),
(68, 3, 15, '2012-08-25 14:30:00', 2),
(69, 3, 11, '2012-08-25 18:30:00', 2),
(70, 4, 30, '2012-08-25 08:00:00', 2),
(71, 3, 20, '2012-08-28 14:00:00', 2),
(72, 3, 17, '2012-08-28 18:30:00', 2),
(73, 8, 2, '2012-09-30 19:30:00', 1);
INSERT INTO facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) VALUES
(0, 'Tennis Court 1', 5, 25, 10000, 200),
(1, 'Tennis Court 2', 5, 25, 8000, 200),
(2, 'Badminton Court', 0, 15.5, 4000, 50),
(3, 'Table Tennis', 0, 5, 320, 10),
(4, 'Massage Room 1', 35, 80, 4000, 3000),
(5, 'Massage Room 2', 35, 80, 4000, 3000),
(6, 'Squash Court', 3.5, 17.5, 5000, 80),
(7, 'Snooker Table', 0, 5, 450, 15),
(8, 'Pool Table', 0, 5, 400, 15);
INSERT INTO members (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate) VALUES
(0, 'GUEST', 'GUEST', 'GUEST', 0, '(000) 000-0000', NULL, '2012-07-01 00:00:00'),
(1, 'Smith', 'Darren', '8 Bloomsbury Close, Boston', 4321, '555-555-5555', NULL, '2012-07-02 12:02:05'),
(2, 'Smith', 'Tracy', '8 Bloomsbury Close, New York', 4321, '555-555-5555', NULL, '2012-07-02 12:08:23'),
(3, 'Rownam', 'Tim', '23 Highway Way, Boston', 23423, '(844) 693-0723', NULL, '2012-07-03 09:32:15'),
(4, 'Joplette', 'Janice', '20 Crossing Road, New York', 234, '(833) 942-4710', 1, '2012-07-03 10:25:05'),
(5, 'Butters', 'Gerald', '1065 Huntingdon Avenue, Boston', 56754, '(844) 078-4130', 1, '2012-07-09 10:44:09'),
(6, 'Tracy', 'Burton', '3 Tunisia Drive, Boston', 45678, '(822) 354-9973', NULL, '2012-07-15 08:52:55'),
(7, 'Dare', 'Nancy', '6 Hunting Lodge Way, Boston', 10383, '(833) 776-4001', 4, '2012-07-25 08:59:12'),
(8, 'Boothe', 'Tim', '3 Bloomsbury Close, Reading, 00234', 234, '(811) 433-2547', 3, '2012-07-25 16:02:35'),
(9, 'Stibbons', 'Ponder', '5 Dragons Way, Winchester', 87630, '(833) 160-3900', 6, '2012-07-25 17:09:05'),
(10, 'Owen', 'Charles', '52 Cheshire Grove, Winchester, 28563', 28563, '(855) 542-5251', 1, '2012-08-03 19:42:37'),
(11, 'Jones', 'David', '976 Gnats Close, Reading', 33862, '(844) 536-8036', 4, '2012-08-06 16:32:55'),
(12, 'Baker', 'Anne', '55 Powdery Street, Boston', 80743, '844-076-5141', 9, '2012-08-10 14:23:22'),
(13, 'Farrell', 'Jemima', '103 Firth Avenue, North Reading', 57392, '(855) 016-0163', NULL, '2012-08-10 14:28:01'),
(14, 'Smith', 'Jack', '252 Binkington Way, Boston', 69302, '(822) 163-3254', 1, '2012-08-10 16:22:05'),
(15, 'Bader', 'Florence', '264 Ursula Drive, Westford', 84923, '(833) 499-3527', 9, '2012-08-10 17:52:03'),
(16, 'Baker', 'Timothy', '329 James Street, Reading', 58393, '833-941-0824', 13, '2012-08-15 10:34:25'),
(17, 'Pinker', 'David', '5 Impreza Road, Boston', 65332, '811 409-6734', 13, '2012-08-16 11:32:47'),
(18, 'Genting', 'Matthew', '4 Nunnington Place, Wingfield, Boston', 52365, '(811) 972-1377', 5, '2012-08-19 14:55:55'),
(19, 'Mackenzie', 'Anna', '64 Perkington Lane, Reading', 64577, '(822) 661-2898', 1, '2012-08-26 09:32:05'),
(20, 'Coplin', 'Joan', '85 Bard Street, Bloomington, Boston', 43533, '(822) 499-2232', 16, '2012-08-29 08:32:41'),
(21, 'Sarwin', 'Ramnaresh', '12 Bullington Lane, Boston', 65464, '(822) 413-1470', 15, '2012-09-01 08:44:42'),
(22, 'Jones', 'Douglas', '976 Gnats Close, Reading', 11986, '844 536-8036', 11, '2012-09-02 18:43:05'),
(23, 'Rumney', 'Henrietta', '3 Burkington Plaza, Boston', 78533, '(822) 989-8876', 20, '2012-09-05 08:42:35'),
(24, 'Farrell', 'David', '437 Granite Farm Road, Westford', 43532, '(855) 755-9876', NULL, '2012-09-15 08:22:05'),
(25, 'Worthington-Smyth', 'Henry', '55 Jagbi Way, North Reading', 97676, '(855) 894-3758', 2, '2012-09-17 12:27:15'),
(26, 'Purview', 'Millicent', '641 Drudgery Close, Burnington, Boston', 34232, '(855) 941-9786', 2, '2012-09-18 19:04:01'),
(27, 'Tupperware', 'Hyacinth', '33 Cheerful Plaza, Drake Road, Westford', 68666, '(822) 665-5327', NULL, '2012-09-18 19:32:05'),
(28, 'Hunt', 'John', '5 Bullington Lane, Boston', 54333, '(899) 720-6978', 30, '2012-09-19 11:32:45'),
(29, 'Crumpet', 'Erica', 'Crimson Road, North Reading', 75655, '(811) 732-4816', 2, '2012-09-22 08:36:38'),
(30, 'Smith', 'Darren', '3 Funktown, Denzington, Boston', 66796, '(822) 577-3541', NULL, '2012-09-26 18:08:45');
UPDATE members
SET surname = value1,
    firstname = value2,
    telephone = '+38093255009*'
WHERE surname = 'GUEST';
SELECT
   memid, surname, firstname, telephone
FROM
   members
where surname = 'Smith'
order by firstname asc
limit 1 offset 0;
SELECT
   DISTINCT column_1, column_2
FROM
   table_name;9
