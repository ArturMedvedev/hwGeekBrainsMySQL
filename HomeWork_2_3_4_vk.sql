-- Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

select distinct firstname from users
order by firstname

-- Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true).
-- При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0)

update profiles
set
	is_active = '1'
where
	((YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))) < '18';

-- Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)

delete from messages
where
	created_at > CURRENT_TIMESTAMP