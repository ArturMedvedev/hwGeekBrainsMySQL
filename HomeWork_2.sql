drop database if exists example;
create database if not exists example;
use example;
create table users (
	id serial primary key,
	name varchar(255)
)