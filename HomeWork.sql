-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”.

-- Задание 1.
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

update users
set created_at = now(), updated_at = NOW()

-- Задание 2.
-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR
-- и в них долгое время помещались значения в формате "20.10.2017 8:10".
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

DROP TABLE IF EXISTS users1;
CREATE TABLE users1 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255) COMMENT 'Неправильный формат для ДЗ',
  updated_at VARCHAR(255) COMMENT 'Неправильный формат для ДЗ'
) COMMENT = 'Покупатели';

INSERT INTO users1 (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2018 8:10'),
  ('Наталья', '1984-11-12', '20.10.2017 8:10', '20.10.2018 8:10'),
  ('Александр', '1985-05-20', '20.10.2017 8:10', '20.10.2018 8:10'),
  ('Сергей', '1988-02-14', '20.10.2017 8:10', '20.10.2018 8:10'),
  ('Иван', '1998-01-12', '20.10.2017 8:10', '20.10.2018 8:10'),
  ('Мария', '1992-08-29', '20.10.2017 8:10', '20.10.2018 8:10');

update users1
set
	created_at = str_to_date(created_at, '%d.%m.%Y %h:%m'),
	updated_at = str_to_date(updated_at, '%d.%m.%Y %h:%m');

alter table users1
modify created_at DATETIME,
modify updated_at DATETIME;

-- Задание 3.
-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные
-- цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.

insert into storehouses_products (storehouse_id, product_id, value) values
	('1', '0009', '0'),
	('56', '5874', '2500'),
	('99', '2136', '0'),
	('8', '9998', '30'),
	('16', '7845', '500'),
	('439', '4836', '1');

select *, if (value > 0, '0', '1') as status
from storehouses_products
order by status, value;


-- Практическое задание теме “Агрегация данных”.

-- Задание 1.
-- Подсчитайте средний возраст пользователей в таблице users.

select
  avg((year(current_date) - year(birthday_at)) - 
  (date_format(current_date, '%m%d') < date_format(birthday_at, '%m%d'))
  ) as age
from users;

-- Задание 2.
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

select count(name) as 'кол-во ДР', dayname(date_add(birthday_at, interval (year(current_date) - year(birthday_at)) year)) as weekday
from users
group by weekday;