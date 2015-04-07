# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.21)
# Database: blablacool
# Generation Time: 2015-04-07 17:37:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table booking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  `status` enum('PENDING','DECLINED','ACCEPTED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `paid` tinyint(1) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`trip_id`,`step_id`,`user_id_user`),
  KEY `fk_booking_trip1_idx` (`trip_id`),
  KEY `fk_booking_step1_idx` (`step_id`),
  KEY `fk_booking_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_booking_step1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id_step`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_trip1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id_trip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;

INSERT INTO `booking` (`id`, `trip_id`, `step_id`, `user_id_user`, `status`, `paid`, `created_time`)
VALUES
	(1,10,28,1,'ACCEPTED',NULL,'2015-04-06 12:52:21');

/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table car
# ------------------------------------------------------------

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id_car` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `type` varchar(150) DEFAULT NULL,
  `registration` varchar(30) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `capacity` tinyint(10) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `api_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `trim` varchar(255) DEFAULT NULL,
  `horse_power` int(11) DEFAULT NULL,
  `doors` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_car`,`owner_id`),
  KEY `fk_car_user1_idx` (`owner_id`),
  CONSTRAINT `fk_car_user1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;

INSERT INTO `car` (`id_car`, `owner_id`, `type`, `registration`, `brand`, `model`, `capacity`, `image`, `api_id`, `year`, `trim`, `horse_power`, `doors`)
VALUES
	(1,1,'SUV','AB-042-ZY','Land Rover','Ranger Rover Evoque',4,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_message`,`user_id`,`trip_id`),
  KEY `fk_message_user1_idx` (`user_id`),
  KEY `fk_message_trip1_idx` (`trip_id`),
  CONSTRAINT `fk_message_trip1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id_trip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;

INSERT INTO `message` (`id_message`, `user_id`, `trip_id`, `message`, `created_at`)
VALUES
	(1,1,10,'Ceci est un message de test !!','2015-04-06 11:11:39'),
	(2,1,10,'Ceci est un autre message de test\r\n\r\navec des\r\n\r\nretours\r\n\r\n\r\n\r\nÃ  la ligne cette fois !','2015-04-06 11:23:17'),
	(3,1,10,'message\r<br />\r<br />\r<br />avec retours lignes\r<br />\r<br />\r<br />et acÃ© Ã  Ãº Ãª !!!','2015-04-06 11:25:56'),
	(4,1,10,'ceci\r<br />\r<br />message\r<br />\r<br />Ã  \'w Ã©Ã©Ã©Ã© Ã¨Ã¨Ã¨Ã¨``','2015-04-06 12:07:30'),
	(5,1,10,'Ã©Ã©Ã©Ã© Ã Ã Ã Ã ','2015-04-06 12:14:07'),
	(6,1,10,'àààà','2015-04-06 12:20:58'),
	(7,1,10,'Bonjour,\r<br />\r<br />OKOK !\r<br />\r<br />Merci !','2015-04-06 12:25:40'),
	(8,1,10,'haha<br />haha<br />haha','2015-04-06 12:28:04'),
	(9,1,10,'Test de notification!','2015-04-06 12:35:48');

/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(100) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id_payment`,`booking_id`),
  KEY `fk_payment_booking1_idx` (`booking_id`),
  CONSTRAINT `fk_payment_booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table place
# ------------------------------------------------------------

DROP TABLE IF EXISTS `place`;

CREATE TABLE `place` (
  `id_place` int(11) NOT NULL AUTO_INCREMENT,
  `name_public` varchar(255) NOT NULL,
  `name_private` varchar(255) NOT NULL,
  `latitude` decimal(24,18) NOT NULL,
  `longitude` decimal(24,18) NOT NULL,
  `location` varchar(255) NOT NULL,
  `address` tinytext NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` varchar(42) NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `country_short` varchar(45) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_place`,`user_id_user`),
  KEY `fk_place_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_place_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;

INSERT INTO `place` (`id_place`, `name_public`, `name_private`, `latitude`, `longitude`, `location`, `address`, `street`, `street_number`, `postal_code`, `city`, `country`, `country_short`, `user_id_user`)
VALUES
	(1,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(2,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(3,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(4,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(5,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(6,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(7,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(8,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(9,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(10,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(11,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(12,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(13,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(14,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(15,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(16,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(17,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(18,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(19,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(20,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(21,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(22,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(23,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(24,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(25,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(26,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(27,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(28,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(29,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(30,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1);

/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `comment` tinytext,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_review`,`reviewer_id`,`booking_id`),
  KEY `fk_review_user1_idx` (`reviewer_id`),
  KEY `fk_review_booking1_idx` (`booking_id`),
  CONSTRAINT `fk_review_booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user1` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;

INSERT INTO `review` (`id_review`, `reviewer_id`, `booking_id`, `note`, `comment`, `created_at`)
VALUES
	(1,1,1,3,'Test','2015-04-06 15:05:40');

/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(42) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id_role`, `role`)
VALUES
	(1,'ROLE_ADMIN'),
	(2,'ROLE_USER');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table step
# ------------------------------------------------------------

DROP TABLE IF EXISTS `step`;

CREATE TABLE `step` (
  `id_step` int(11) NOT NULL AUTO_INCREMENT,
  `position` mediumint(10) DEFAULT NULL,
  `estimated_time` datetime DEFAULT NULL,
  `place_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  PRIMARY KEY (`id_step`),
  KEY `fk_step_trip1_idx` (`trip_id`),
  KEY `fk_step_place1` (`place_id`),
  CONSTRAINT `fk_step_place1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id_place`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_trip1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id_trip`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;

INSERT INTO `step` (`id_step`, `position`, `estimated_time`, `place_id`, `trip_id`)
VALUES
	(1,1,'2015-04-06 10:45:00',1,1),
	(2,2,'2015-04-06 11:30:00',2,1),
	(3,3,'2015-04-06 12:00:00',3,1),
	(4,1,'2015-04-06 10:45:00',4,2),
	(5,2,'2015-04-06 11:30:00',5,2),
	(6,3,'2015-04-06 12:00:00',6,2),
	(7,1,'2015-04-06 10:45:00',7,3),
	(8,2,'2015-04-06 11:30:00',8,3),
	(9,3,'2015-04-06 12:00:00',9,3),
	(10,1,'2015-04-06 10:45:00',10,4),
	(11,2,'2015-04-06 11:30:00',11,4),
	(12,3,'2015-04-06 12:00:00',12,4),
	(13,1,'2015-04-06 10:45:00',13,5),
	(14,2,'2015-04-06 11:30:00',14,5),
	(15,3,'2015-04-06 12:00:00',15,5),
	(16,1,'2015-04-06 10:45:00',16,6),
	(17,2,'2015-04-06 11:30:00',17,6),
	(18,3,'2015-04-06 12:00:00',18,6),
	(19,1,'2015-04-06 10:45:00',19,7),
	(20,2,'2015-04-06 11:30:00',20,7),
	(21,3,'2015-04-06 12:00:00',21,7),
	(22,1,'2015-04-06 10:45:00',22,8),
	(23,2,'2015-04-06 11:30:00',23,8),
	(24,3,'2015-04-06 12:00:00',24,8),
	(25,1,'2015-04-06 10:45:00',25,9),
	(26,2,'2015-04-06 11:30:00',26,9),
	(27,3,'2015-04-06 12:00:00',27,9),
	(28,1,'2015-04-01 10:45:00',28,10),
	(29,2,'2015-04-01 11:30:00',29,10),
	(30,3,'2015-04-01 12:00:00',30,10);

/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription`;

CREATE TABLE `subscription` (
  `id_subscription` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_subscription`,`user_id`),
  KEY `fk_subscription_user1_idx` (`user_id`),
  CONSTRAINT `fk_subscription_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;

INSERT INTO `subscription` (`id_subscription`, `name`, `from`, `to`, `amount`, `user_id`)
VALUES
	(1,NULL,'2015-04-06 10:23:37','2015-04-13 10:23:37',0.00,1);

/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table trip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trip`;

CREATE TABLE `trip` (
  `id_trip` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `capacity` tinyint(10) NOT NULL,
  `smoking` tinyint(1) DEFAULT '1',
  `animals` tinyint(1) DEFAULT '1',
  `luggage` varchar(50) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_trip`,`driver_id`),
  KEY `fk_trip_user1_idx` (`driver_id`),
  CONSTRAINT `fk_trip_user1` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;

INSERT INTO `trip` (`id_trip`, `driver_id`, `capacity`, `smoking`, `animals`, `luggage`, `price`)
VALUES
	(1,1,4,0,0,'NORMAL',9.00),
	(2,1,4,0,0,'NORMAL',9.00),
	(3,1,4,0,0,'NORMAL',9.00),
	(4,1,4,0,0,'NORMAL',9.00),
	(5,1,4,0,0,'NORMAL',9.00),
	(6,1,4,0,0,'NORMAL',9.00),
	(7,1,4,0,0,'NORMAL',9.00),
	(8,1,4,0,0,'NORMAL',9.00),
	(9,1,4,0,0,'NORMAL',9.00),
	(10,1,4,0,0,'NORMAL',9.00);

/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `nickname` varchar(42) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `age` tinyint(100) unsigned DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(180) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id_user`, `firstname`, `lastname`, `nickname`, `email`, `password`, `age`, `phone_number`, `address`, `city`, `state`, `postcode`, `country`)
VALUES
	(1,'Valentin','Polo','VP42','me@vpolo.fr','$2a$10$2o6eO.SpCvk2nFbqQOPg7.jIQQBQKSW1hNftaIbmMsoIqw9FCkOdS',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_has_roles`;

CREATE TABLE `user_has_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_roles_roles1_idx` (`role_id`),
  KEY `fk_user_has_roles_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_roles_roles1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_roles_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_has_roles` WRITE;
/*!40000 ALTER TABLE `user_has_roles` DISABLE KEYS */;

INSERT INTO `user_has_roles` (`user_id`, `role_id`)
VALUES
	(1,2);

/*!40000 ALTER TABLE `user_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_preference
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_preference`;

CREATE TABLE `user_preference` (
  `id_user_preference` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `like_animals` tinyint(1) DEFAULT NULL,
  `music_style` varchar(100) DEFAULT NULL,
  `like_smoking` tinyint(1) DEFAULT NULL,
  `temperament` varchar(100) DEFAULT NULL,
  `talking_level` varchar(150) DEFAULT NULL,
  `driving_style` varchar(150) DEFAULT NULL,
  `others` mediumtext,
  PRIMARY KEY (`id_user_preference`,`user_id`),
  KEY `fk_user_preference_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_preference_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `user_preference` WRITE;
/*!40000 ALTER TABLE `user_preference` DISABLE KEYS */;

INSERT INTO `user_preference` (`id_user_preference`, `user_id`, `like_animals`, `music_style`, `like_smoking`, `temperament`, `talking_level`, `driving_style`, `others`)
VALUES
	(1,1,0,NULL,0,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `user_preference` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
