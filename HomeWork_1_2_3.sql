-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”.
-- Работаем с БД vk и данными, которые вы сгенерировали ранее.

-- Задание 1.
-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека,
-- который больше всех общался с нашим пользователем.

select from_user_id, count(from_user_id) as total
from messages
where to_user_id = 21 and from_user_id in (
	select initiator_user_id from friend_requests where target_user_id = 21 and status = 'approved'
	union
	select target_user_id from friend_requests where initiator_user_id = 21 and status = 'approved'
	)
group by from_user_id
order by total desc
limit 1;

-- Задание 2.
-- Подсчитать общее количество лайков, которые получили пользователи младше 20 лет.

select count(id) as total
from likes
where media_id in (
	select user_id from profiles where (((year(current_date) - year(birthday)) - (date_format(current_date, '%m%d') < date_format(birthday, '%m%d'))) < 20)
	);

-- Задание 3.
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select count(id) from likes where user_id in (select user_id from profiles where gender = 0)
union
select count(id) from likes where user_id in (select user_id from profiles where gender = 1);