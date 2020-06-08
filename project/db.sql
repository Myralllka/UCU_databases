-- create database Alianers
-- WITH  OWNER = postgres ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TABLESPACE = pg_default CONNECTION LIMIT = -1;
-- \connect Alianers;

create table planet(
    id serial primary key,
    name varchar (50) not null
);

create table users (
    id serial primary key,
    username varchar(45) not NULL ,
    usersurname varchar(45) not NULL ,
    password varchar(45) not NULL ,
    role bool,
    alive bool not null default true,
    planet integer references planet(id),
    check(length(password) between 6 and 45)
);

create table alien (
    id serial primary key,
    user_id INTEGER REFERENCES users(id)
);

create table human (
    id serial primary key,
    user_id INTEGER REFERENCES users(id)
);

create table alien_group (
    alien_group_id int,
    alien_id integer references alien(id)
);

create table human_group (
    human_group_id int,
    human_id integer references human(id)
);

create table starship(
    id serial primary key,
    name varchar not null,
    alien_group_id int,
    human_group_id int,
    cordinate int
);

create table experiment (
    id serial primary key,
    alien_group_id int not null,
    human_id integer references human(id),
    starship_id integer references starship(id),
    date timestamp default now()
);

create table transportation (
    id serial primary key,
    alien_id integer references alien(id),
    human_id integer references human(id),
    departure integer references starship(id),
    destination integer references starship(id),
    date timestamp default now()
);

create table theft (
    id serial primary key,
    alien_id integer references alien(id),
    human_id integer references human(id),
    starship_id integer references starship(id),
    date timestamp default now()
);

create table murder (
    id serial primary key,
    murder integer references human(id),
    victim  integer references alien(id),
    date timestamp default now()
);

create table excursion (
    id serial primary key,
    guide integer references alien(id),
    humans_group_id  int not null,
    date timestamp default now()
);

create table escapism (
    id serial primary key,
    human_id integer references human(id),
    starship_id integer references starship(id),
    date timestamp default now()
);

create table crash (
    id serial primary key,
    starship_id integer references starship(id)
)
