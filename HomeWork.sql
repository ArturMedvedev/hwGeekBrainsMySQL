-- Практическое задание по теме “Транзакции, переменные, представления”.

-- Задание 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

start transaction;

insert into sample.users (name)
select name
from shop.users
where id = 1;

delete from shop.users
where id = 1;
commit;

-- Задание 2. Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.

create or replace view n1 as
select p1.name as product_name, c1.name as catalogs_name
from products p1
join catalogs c1 on p1.catalog_id = c1.id;

select *
from n1;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры".

-- Задание 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

delimiter //
drop function if exists hello//

create function hello()
returns varchar(255) deterministic
begin
	declare answer varchar(255);
		if (current_time > '06:00:00' and current_time <= '12:00:00') then
			set answer = 'Доброе утро';
		elseif (current_time > '12:00:00' and current_time <= '18:00:00') then
			set answer = 'Добрый день';
		elseif (current_time > '18:00:00' and current_time <= '00:00:00') then
			set answer = 'Добрый вечер';
		elseif (current_time > '00:00:00' and current_time <= '06:00:00') then
			set answer = 'Доброй ночи';
		end if;
	return answer;
end//

delimiter ;
select hello();

-- Задание 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное
-- значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

drop trigger if exists not_null_products;
delimiter //
create trigger not_null_products BEFORE insert ON products
FOR EACH row
begin
	IF (new.name is null and new.description is null) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Потрачено';
  END IF;
END//

delimiter ;
insert into products (price)
values (10000.00); -- Сработает триггер, получим ошибку.

insert into products (name, description, price)
values ('', '', 10000.00);  -- Видимо пустая строка не считается NULL

insert into products (name, price)
values ('qweqwe', 10000.00); -- Триггер не сработает, т.к. NULL будет только description

insert into products (description, price)
values ('asdasdas', 10000.00); -- Триггер не сработает, т.к. NULL будет только name