-- Практическое задание по теме “Оптимизация запросов”.

-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
-- catalogs и products в таблицу logs помещается время и дата создания записи,
-- название таблицы, идентификатор первичного ключа и содержимое поля name.

drop table if exists logs;

create table logs (
	source_id int not null,
	table_name varchar(15),
	source_name varchar(55),
	created_at datetime default now()
	) engine = archive;

drop trigger if exists log_users;
delimiter //
create trigger log_users after insert ON users
for each row
begin
	insert into logs (source_id, table_name, source_name) values
	(new.id, 'users', new.name);
END//

drop trigger if exists log_catalogs;
delimiter //
create trigger log_catalogs after insert ON catalogs
for each row
begin
	insert into logs (source_id, table_name, source_name) values
	(new.id, 'catalogs', new.name);
END//

drop trigger if exists log_products;
delimiter //
create trigger log_products after insert ON products
for each row
begin
	insert into logs (source_id, table_name, source_name) values
	(new.id, 'products', new.name);
END//