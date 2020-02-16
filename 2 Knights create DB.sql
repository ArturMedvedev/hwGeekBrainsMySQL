DROP DATABASE IF EXISTS `knights`;
CREATE DATABASE  IF NOT EXISTS `knights`;
USE `knights`;


DROP TABLE IF EXISTS `skill_type`;
CREATE TABLE `skill_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skillTypeId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_skill_skill_type1_idx` (`skillTypeId`),
  CONSTRAINT `fk_skill_skill_type1` FOREIGN KEY (`skillTypeId`) REFERENCES `skill_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fraction`;
CREATE TABLE `fraction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fraction_has_skill`;
CREATE TABLE `fraction_has_skill` (
  `fractionId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL,
  PRIMARY KEY (`fractionId`,`skillId`),
  KEY `fk_fraction_has_skill_skill1_idx` (`skillId`),
  KEY `fk_fraction_has_skill_fraction1_idx` (`fractionId`),
  CONSTRAINT `fk_fraction_has_skill_fraction1` FOREIGN KEY (`fractionId`) REFERENCES `fraction` (`id`),
  CONSTRAINT `fk_fraction_has_skill_skill1` FOREIGN KEY (`skillId`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `weapon_type`;
CREATE TABLE `weapon_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `weapon`;
CREATE TABLE `weapon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `distance` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `damage` int(11) NOT NULL,
  `armor` int(11) NOT NULL,
  `isTwoHanded` tinyint(4) NOT NULL,
  `weapon_type_id` int(11) NOT NULL,
  `bonus_stamina` int(11) NOT NULL DEFAULT '0',
  `bonus_strength` int(11) NOT NULL DEFAULT '0',
  `bonus_agility` int(11) NOT NULL DEFAULT '0',
  `bonus_intellegance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_weapon_weapon_type1_idx` (`weapon_type_id`),
  CONSTRAINT `fk_weapon_weapon_type1` FOREIGN KEY (`weapon_type_id`) REFERENCES `weapon_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gear_type`;
CREATE TABLE `gear_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gear`;
CREATE TABLE `gear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `armor` int(11) NOT NULL,
  `gear_type_id` int(11) NOT NULL,
  `bonus_stamina` int(11) NOT NULL DEFAULT '0',
  `bonus_strength` int(11) NOT NULL DEFAULT '0',
  `bonus_agility` int(11) NOT NULL DEFAULT '0',
  `bonus_intellegance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gear_gear_type1_idx` (`gear_type_id`),
  CONSTRAINT `fk_gear_gear_type1` FOREIGN KEY (`gear_type_id`) REFERENCES `gear_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bijouterie_type`;
CREATE TABLE `bijouterie_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bijouterie`;
CREATE TABLE `bijouterie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `resist` int(11) NOT NULL,
  `bijouterie_type_id` int(11) NOT NULL,
  `bonus_stamina` int(11) NOT NULL DEFAULT '0',
  `bonus_srength` int(11) NOT NULL DEFAULT '0',
  `bonus_agility` int(11) NOT NULL DEFAULT '0',
  `bonus_intellegance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bijouterie_bijouterie_type1_idx` (`bijouterie_type_id`),
  CONSTRAINT `fk_bijouterie_bijouterie_type1` FOREIGN KEY (`bijouterie_type_id`) REFERENCES `bijouterie_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume` int(11) NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inventory_has_weapon`;
CREATE TABLE `inventory_has_weapon` (
  `inventory_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL,
  PRIMARY KEY (`inventory_id`,`weapon_id`),
  KEY `fk_inventory_has_weapon_weapon1_idx` (`weapon_id`),
  KEY `fk_inventory_has_weapon_inventory1_idx` (`inventory_id`),
  CONSTRAINT `fk_inventory_has_weapon_inventory1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`),
  CONSTRAINT `fk_inventory_has_weapon_weapon1` FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inventory_has_gear`;
CREATE TABLE `inventory_has_gear` (
  `inventory_id` int(11) NOT NULL,
  `gear_id` int(11) NOT NULL,
  PRIMARY KEY (`inventory_id`,`gear_id`),
  KEY `fk_inventory_has_gear_gear1_idx` (`gear_id`),
  KEY `fk_inventory_has_gear_inventory1_idx` (`inventory_id`),
  CONSTRAINT `fk_inventory_has_gear_gear1` FOREIGN KEY (`gear_id`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_inventory_has_gear_inventory1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inventory_has_bijouterie`;
CREATE TABLE `inventory_has_bijouterie` (
  `inventory_id` int(11) NOT NULL,
  `bijouterie_id` int(11) NOT NULL,
  PRIMARY KEY (`inventory_id`,`bijouterie_id`),
  KEY `fk_inventory_has_bijouterie_bijouterie1_idx` (`bijouterie_id`),
  KEY `fk_inventory_has_bijouterie_inventory1_idx` (`inventory_id`),
  CONSTRAINT `fk_inventory_has_bijouterie_bijouterie1` FOREIGN KEY (`bijouterie_id`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_inventory_has_bijouterie_inventory1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fractionId` int(11) NOT NULL,
  `inventoryId` int(11) NOT NULL,
  `nickName` varchar(255) NOT NULL,
  `isNpc` tinyint(4) NOT NULL,
  `maxHp` int(11) NOT NULL,
  `maxMp` int(11) NOT NULL,
  `stamina` int(11) NOT NULL,
  `strength` int(11) NOT NULL,
  `agility` int(11) NOT NULL,
  `intellegance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`nickName`),
  KEY `fk_person_fraction_idx` (`fractionId`),
  KEY `fk_person_inventory1_idx` (`inventoryId`),
  CONSTRAINT `fk_person_fraction` FOREIGN KEY (`fractionId`) REFERENCES `fraction` (`id`),
  CONSTRAINT `fk_person_inventory1` FOREIGN KEY (`inventoryId`) REFERENCES `inventory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wear`;
CREATE TABLE `wear` (
  `person_id` int(11) NOT NULL,
  `necklace1` int(11) DEFAULT NULL,
  `necklace2` int(11) DEFAULT NULL,
  `necklace3` int(11) DEFAULT NULL,
  `earring1` int(11) DEFAULT NULL,
  `earring2` int(11) DEFAULT NULL,
  `ring1` int(11) DEFAULT NULL,
  `ring2` int(11) DEFAULT NULL,
  `ring3` int(11) DEFAULT NULL,
  `ring4` int(11) DEFAULT NULL,
  `ring5` int(11) DEFAULT NULL,
  `ring6` int(11) DEFAULT NULL,
  `ring7` int(11) DEFAULT NULL,
  `ring8` int(11) DEFAULT NULL,
  `weapon_id1` int(11) DEFAULT NULL,
  `weapon_id2` int(11) DEFAULT NULL,
  `gear_id1` int(11) DEFAULT NULL,
  `gear_id2` int(11) DEFAULT NULL,
  `gear_id3` int(11) DEFAULT NULL,
  `gear_id4` int(11) DEFAULT NULL,
  `gear_id5` int(11) DEFAULT NULL,
  `gear_id6` int(11) DEFAULT NULL,
  `gear_id7` int(11) DEFAULT NULL,
  KEY `fk_wear_person1_idx` (`person_id`),
  KEY `fk_wear_bijouterie1_idx` (`necklace1`),
  KEY `fk_wear_bijouterie2_idx` (`necklace2`),
  KEY `fk_wear_bijouterie3_idx` (`necklace3`),
  KEY `fk_wear_bijouterie4_idx` (`earring1`),
  KEY `fk_wear_bijouterie5_idx` (`earring2`),
  KEY `fk_wear_bijouterie6_idx` (`ring1`),
  KEY `fk_wear_bijouterie7_idx` (`ring2`),
  KEY `fk_wear_bijouterie8_idx` (`ring3`),
  KEY `fk_wear_bijouterie9_idx` (`ring4`),
  KEY `fk_wear_bijouterie10_idx` (`ring5`),
  KEY `fk_wear_bijouterie11_idx` (`ring6`),
  KEY `fk_wear_bijouterie12_idx` (`ring7`),
  KEY `fk_wear_bijouterie13_idx` (`ring8`),
  KEY `fk_wear_weapon1_idx` (`weapon_id1`),
  KEY `fk_wear_weapon2_idx` (`weapon_id2`),
  KEY `fk_wear_gear1_idx` (`gear_id1`),
  KEY `fk_wear_gear2_idx` (`gear_id2`),
  KEY `fk_wear_gear3_idx` (`gear_id3`),
  KEY `fk_wear_gear4_idx` (`gear_id4`),
  KEY `fk_wear_gear5_idx` (`gear_id5`),
  KEY `fk_wear_gear6_idx` (`gear_id6`),
  KEY `fk_wear_gear7_idx` (`gear_id7`),
  CONSTRAINT `fk_wear_bijouterie1` FOREIGN KEY (`necklace1`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie10` FOREIGN KEY (`ring5`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie11` FOREIGN KEY (`ring6`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie12` FOREIGN KEY (`ring7`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie13` FOREIGN KEY (`ring8`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie2` FOREIGN KEY (`necklace2`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie3` FOREIGN KEY (`necklace3`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie4` FOREIGN KEY (`earring1`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie5` FOREIGN KEY (`earring2`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie6` FOREIGN KEY (`ring1`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie7` FOREIGN KEY (`ring2`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie8` FOREIGN KEY (`ring3`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_bijouterie9` FOREIGN KEY (`ring4`) REFERENCES `bijouterie` (`id`),
  CONSTRAINT `fk_wear_gear1` FOREIGN KEY (`gear_id1`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_gear2` FOREIGN KEY (`gear_id2`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_gear3` FOREIGN KEY (`gear_id3`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_gear4` FOREIGN KEY (`gear_id4`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_gear5` FOREIGN KEY (`gear_id5`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_gear6` FOREIGN KEY (`gear_id6`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_gear7` FOREIGN KEY (`gear_id7`) REFERENCES `gear` (`id`),
  CONSTRAINT `fk_wear_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `fk_wear_weapon1` FOREIGN KEY (`weapon_id1`) REFERENCES `weapon` (`id`),
  CONSTRAINT `fk_wear_weapon2` FOREIGN KEY (`weapon_id2`) REFERENCES `weapon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;