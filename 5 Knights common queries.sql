-- Характерный запрос.
-- Игрок навел в клиенте мышкой на экипированное оружие в слоте,
-- и ему выводятся параметры оружия.

select 
	w1.name,
	wt.name as `type`,
	w1.distance,
	w1.weight,
	w1.damage,
	w1.armor,
	w1.bonus_stamina,
	w1.bonus_strength,
	w1.bonus_agility,
	w1.bonus_intellegance
from weapon w1
join wear w2 on w2.weapon_id1 = w1.id
join weapon_type wt on w1.weapon_type_id = wt.id;


-- Характерный запрос.
-- Игрок навел в клиенте мышкой на экипированный нагрудник в слоте,
-- и ему выводятся параметры нагрудника.

select 
	g1.name,
	gt.name as `type`,
	g1.weight,
	g1.armor,
	g1.bonus_stamina,
	g1.bonus_strength,
	g1.bonus_agility,
	g1.bonus_intellegance
from gear g1
join wear w on w.gear_id2 = g1.id
join gear_type gt on g1.gear_type_id = gt.id;


-- Вьюшка. Просмотр всех доступных скиллов в игре.

create or replace view show_skills as
select 
	s.name as skill_name,
	st.name as skill_type_name,
	s.value as skill_value,
	f.name as fraction_name
from skill s
join skill_type st on s.`skillTypeId` = st.id
join fraction_has_skill fhs on s.id = fhs.`skillId`
join fraction f on fhs.`fractionId` = f.id
order by s.name;

select * from show_skills;


-- Вьюшка. Просмотр всех игроков.

create or replace view show_persons as
select id, nickName
from person;

select * from show_persons;


-- Хранимая процедура создания персонажа.
-- Для создания персонажа необходим уже созданный инвентарь,
-- поэтому сначала создается инвентарь, затем персонаж.

drop procedure if exists user_creation;
delimiter //
create procedure user_creation (in nickname varchar(255))
begin
	insert into `knights`.`inventory` (`volume`)
	values
	(50);

	select @last_inventory_id := last_insert_id()
	from `knights`.`inventory`;

	insert into `knights`.`person` (
		`fractionId`,
		`inventoryId`,
		`nickName`,
		`isNpc`,
		`maxHp`,
		`maxMp`,
		`stamina`,
		`strength`,
		`agility`,
		`intellegance`
		) values 
		(1, @last_inventory_id, nickname, 0, 100, 100, 50, 10, 10, 10);
end//

call user_creation('Oborvanets');