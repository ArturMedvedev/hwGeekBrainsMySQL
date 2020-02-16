INSERT INTO `knights`.`skill_type` (`id`, `name`) VALUES
	(1, 'Buff'),
	(2, 'Debuff'),
	(3, 'Heal'),
	(4, 'Physical'),
	(5, 'Magic');
	
INSERT INTO `knights`.`skill` (`id`, `skillTypeId`, `name`, `value`) VALUES
	(1, 1, 'Rage', 10),
	(2, 2, 'Break', 10),
	(3, 3, 'Cleans', 1),
	(4, 4, 'Power slash', 10),
	(5, 5, 'Holy fire', 10),
	(6, 1, 'Blood lust', 20),
	(7, 2, 'Defacement', 20),
	(8, 3, 'Dark messa', 20),
	(9, 4, 'Impact', 20),
	(10, 5, 'Abbys fire', 20);
	
INSERT INTO `knights`.`fraction` (`id`, `name`) VALUES
	(1, 'Humans'),
	(2, 'Demons');
	
INSERT INTO `knights`.`fraction_has_skill` (`fractionId`, `skillId`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 9),
	(2, 10);
	
INSERT INTO `knights`.`weapon_type` (`id`, `name`) VALUES
	(1, 'Sword'),
	(2, 'Two handed sword'),
	(3, 'Bow'),
	(4, 'Mace'),
	(5, 'Lance'),
	(6, 'Staff'),
	(7, 'Shield');
	
INSERT INTO `knights`.`weapon` (
	`id`,
	`name`,
	`distance`,
	`weight`,
	`damage`,
	`armor`,
	`isTwoHanded`,
	`weapon_type_id`,
	`bonus_stamina`,
	`bonus_strength`,
	`bonus_agility`,
	`bonus_intellegance`
	) VALUES
	(1, 'Rusty sword', 1, 10, 10, 0, 0, 1, 20, 20, 0, 0),
	(2, 'Rusty longsword', 2, 15, 15, 0, 1, 2, 10, 30, 0, 0),
	(3, 'Crooked branch', 20, 8, 20, 0, 0, 3, 10, 10, 20, 0),
	(4, 'Old stave', 1, 10, 10, 0, 0, 4, 20, 0, 10, 10),
	(5, 'Awry lance', 3, 15, 15, 0, 0, 5, 0, 20, 20, 0),
	(6, 'Knotted staff', 2, 5, 5, 0, 0, 6, 0, 0, 20, 20),
	(7, 'Board shield', 1, 10, 5, 10, 0, 7, 20, 0, 0, 20);
	
INSERT INTO `knights`.`gear_type` (`id`, `name`) VALUES
	(1, 'Helmet'),
	(2, 'Breastplate'),
	(3, 'Gloves'),
	(4, 'Belt'),
	(5, 'Pants'),
	(6, 'Boots'),
	(7, 'Cape');

INSERT INTO `knights`.`gear` (
	`id`,
	`name`,
	`weight`,
	`armor`,
	`gear_type_id`,
	`bonus_stamina`,
	`bonus_strength`,
	`bonus_agility`,
	`bonus_intellegance`
	) VALUES
	(1, 'Leather earflaps', 1, 5, 1, 10, 0, 0, 0),
	(2, 'Leather pea jacket', 2, 20, 2, 10, 0, 0, 0),
	(3, 'Leather mittens', 1, 2, 3, 0, 0, 10, 0),
	(4, 'Leather sash', 1, 2, 4, 10, 0, 0, 10),
	(5, 'Leather pants', 2, 15, 5, 10, 0, 0, 0),
	(6, 'Leather slippers', 1, 5, 6, 0, 0, 10, 0),
	(7, 'Holey sack', 1, 0, 7, 0, 0, 0, 10);
	
INSERT INTO `knights`.`bijouterie_type` (`id`, `name`) VALUES
	(1, 'Necklace'),
	(2, 'Earing'),
	(3, 'Ring');


INSERT INTO `knights`.`bijouterie` (
	`id`,
	`name`,
	`weight`,
	`resist`,
	`bijouterie_type_id`,
	`bonus_stamina`,
	`bonus_srength`,
	`bonus_agility`,
	`bonus_intellegance`
	) VALUES
	(1, 'Iron chain', 1, 20, 1, 10, 10, 0, 0),
	(2, 'Iron rivet', 1, 15, 2, 10, 0, 5, 0),
	(3, 'Iron signet', 1, 5, 3, 0, 0, 0, 5);
	
INSERT INTO `knights`.`inventory` (`id`, `volume`) VALUES
	(1, 50);
	
INSERT INTO `knights`.`inventory_has_weapon` (
	`inventory_id`,
	`weapon_id`
	) VALUES
	(1, 4);

INSERT INTO `knights`.`inventory_has_gear` (
	`inventory_id`,
	`gear_id`
	) VALUES
	(1, 7);

INSERT INTO `knights`.`inventory_has_bijouterie` (
	`inventory_id`,
	`bijouterie_id`
	) VALUES
	(1, 1),
	(1, 2),
	(1, 3);
	
INSERT INTO `knights`.`person` (
	`id`,
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
	) VALUES 
	(1, 1, 1, 'Bomj', 0, 100, 100, 50, 10, 10, 10);
	
INSERT INTO `knights`.`wear` (
	`person_id`,
	`necklace1`,
	`necklace2`,
	`necklace3`,
	`earring1`,
	`earring2`,
	`ring1`,
	`ring2`,
	`ring3`,
	`ring4`,
	`ring5`,
	`ring6`,
	`ring7`,
	`ring8`,
	`weapon_id1`,
	`weapon_id2`,
	`gear_id1`,
	`gear_id2`,
	`gear_id3`,
	`gear_id4`,
	`gear_id5`,
	`gear_id6`,
	`gear_id7`) VALUES (
	1,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	2,
	NULL,
	1,
	2,
	3,
	4,
	5,
	6,
	DEFAULT
	);