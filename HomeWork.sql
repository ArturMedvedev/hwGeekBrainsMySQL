-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

insert into orders (user_id) values
	('2'),
	('4'),
	('2'),
	('2');

select name
from users
join orders on users.id = orders.user_id;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

select products.name, catalogs.name
from products
join catalogs on products.catalog_id = catalogs.id;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

drop table if exists flights;
create table flights (
	id SERIAL PRIMARY KEY,
	`from` varchar(255),
	`to` varchar(255)
);

insert into flights (`from`, `to`) values
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');

drop table if exists cities;
create table cities (
	label varchar(50),
	name varchar(50)
);

insert into cities (label, name) values
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('omsk', 'Омск'),
	('kazan', 'Казань');

select id, c1.name as `from`, c2.name as `to`
from flights
join cities c1 on flights.`from` = c1.label
join cities c2 on flights.`to` = c2.label
order by id;