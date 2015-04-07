# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.21)
# Database: blablacool
# Generation Time: 2015-04-05 12:16:12 +0000
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
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`trip_id`,`step_id`,`user_id_user`),
  KEY `fk_booking_trip1_idx` (`trip_id`),
  KEY `fk_booking_step1_idx` (`step_id`),
  KEY `fk_booking_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_booking_step1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id_step`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_booking_trip1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id_trip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_booking_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;

INSERT INTO `booking` (`id`, `trip_id`, `step_id`, `user_id_user`, `status`, `created_time`)
VALUES
	(6,7,25,1,'ACCEPTED','2015-03-30 07:31:26'),
	(7,12,39,1,'DECLINED','2015-03-31 20:16:59'),
	(8,11,37,1,'PENDING','2015-04-04 20:27:47'),
	(9,13,41,1,'PENDING','2015-04-04 20:29:20'),
	(10,10,35,1,'CANCELLED','2015-04-04 23:01:24'),
	(11,9,33,1,'PENDING','2015-04-05 08:25:37');

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
  `fuel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_car`,`owner_id`),
  KEY `fk_car_user1_idx` (`owner_id`),
  CONSTRAINT `fk_car_user1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;

INSERT INTO `car` (`id_car`, `owner_id`, `type`, `registration`, `brand`, `model`, `capacity`, `image`, `api_id`, `year`, `trim`, `horse_power`, `doors`, `fuel`)
VALUES
	(1,1,'SUV','AB-042-XY','Land Rover','Evoque',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;


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
  CONSTRAINT `fk_place_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;

INSERT INTO `place` (`id_place`, `name_public`, `name_private`, `latitude`, `longitude`, `location`, `address`, `street`, `street_number`, `postal_code`, `city`, `country`, `country_short`, `user_id_user`)
VALUES
	(1,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(2,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(3,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(4,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(5,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(6,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(7,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(8,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(9,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(10,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(11,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(12,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(13,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(14,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(15,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(16,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(17,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(18,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(19,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(20,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(21,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(22,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(23,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(24,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(25,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(26,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(27,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(28,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(29,'Le Portel','Private Name',50.707420900000000000,1.576772000000005400,'50.707421,1.576772','Le Portel, France','','','','Le Portel','France','FR',1),
	(30,'Saint-Léonard','Private Name',50.688548000000000000,1.627890999999976900,'50.688548,1.627891','Saint-Léonard, France','','','','Saint-Léonard','France','FR',1),
	(31,'Saint-Omer','Private Name',50.750115000000000000,2.252207999999996000,'50.750115,2.252208','Saint-Omer, France','','','','Saint-Omer','France','FR',1),
	(32,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(33,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(34,'Boulogne-sur-Mer','Private Name',50.725231000000000000,1.613334000000009000,'50.725231,1.613334','Boulogne-sur-Mer, France','','','','Boulogne-sur-Mer','France','FR',1),
	(35,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(36,'Boulogne-sur-Mer','Private Name',50.725231000000000000,1.613334000000009000,'50.725231,1.613334','Boulogne-sur-Mer, France','','','','Boulogne-sur-Mer','France','FR',1),
	(37,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(38,'Boulogne-sur-Mer','Private Name',50.725231000000000000,1.613334000000009000,'50.725231,1.613334','Boulogne-sur-Mer, France','','','','Boulogne-sur-Mer','France','FR',1),
	(39,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(40,'Boulogne-sur-Mer','Private Name',50.725231000000000000,1.613334000000009000,'50.725231,1.613334','Boulogne-sur-Mer, France','','','','Boulogne-sur-Mer','France','FR',1),
	(41,'Lille','Private Name',50.629250000000000000,3.057256000000052000,'50.62925,3.057256','Lille, France','','','','Lille','France','FR',1),
	(42,'Boulogne-sur-Mer','Private Name',50.725231000000000000,1.613334000000009000,'50.725231,1.613334','Boulogne-sur-Mer, France','','','','Boulogne-sur-Mer','France','FR',1);

/*!40000 ALTER TABLE `place` ENABLE KEYS */;
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
  CONSTRAINT `fk_step_place1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id_place`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_step_trip1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id_trip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;

INSERT INTO `step` (`id_step`, `position`, `estimated_time`, `place_id`, `trip_id`)
VALUES
	(1,1,'2015-03-29 15:00:00',1,1),
	(2,2,'2015-03-29 15:15:00',2,1),
	(3,3,'2015-03-29 16:00:00',3,1),
	(4,4,'2015-03-29 17:00:00',4,1),
	(5,1,'2015-03-29 15:00:00',5,2),
	(6,2,'2015-03-29 15:15:00',6,2),
	(7,3,'2015-03-29 16:00:00',7,2),
	(8,4,'2015-03-29 17:00:00',8,2),
	(9,1,'2015-03-29 15:00:00',9,3),
	(10,2,'2015-03-29 15:15:00',10,3),
	(11,3,'2015-03-29 16:00:00',11,3),
	(12,4,'2015-03-29 17:00:00',12,3),
	(13,1,'2015-03-29 15:00:00',13,4),
	(14,2,'2015-03-29 15:15:00',14,4),
	(15,3,'2015-03-29 16:00:00',15,4),
	(16,4,'2015-03-29 17:00:00',16,4),
	(17,1,'2015-03-29 15:00:00',17,5),
	(18,2,'2015-03-29 15:15:00',18,5),
	(19,3,'2015-03-29 16:00:00',19,5),
	(20,4,'2015-03-29 17:00:00',20,5),
	(21,1,'2015-03-29 15:00:00',21,6),
	(22,2,'2015-03-29 15:15:00',22,6),
	(23,3,'2015-03-29 16:00:00',23,6),
	(24,4,'2015-03-29 17:00:00',24,6),
	(25,1,'2015-03-29 15:00:00',25,7),
	(26,2,'2015-03-29 15:15:00',26,7),
	(27,3,'2015-03-29 16:00:00',27,7),
	(28,4,'2015-03-29 17:00:00',28,7),
	(29,1,'2015-03-29 15:00:00',29,8),
	(30,2,'2015-03-29 15:15:00',30,8),
	(31,3,'2015-03-29 16:00:00',31,8),
	(32,4,'2015-03-29 17:00:00',32,8),
	(33,1,'2015-03-30 22:15:00',33,9),
	(34,2,'2015-03-30 22:15:00',34,9),
	(35,1,'2015-03-30 22:15:00',35,10),
	(36,2,'2015-03-30 22:15:00',36,10),
	(37,1,'2015-03-30 22:15:00',37,11),
	(38,2,'2015-03-30 22:15:00',38,11),
	(39,1,'2015-03-30 22:15:00',39,12),
	(40,2,'2015-03-30 22:15:00',40,12),
	(41,1,'2015-03-30 22:15:00',41,13),
	(42,1,'2015-03-29 15:00:00',1,15),
	(43,2,'2015-03-29 15:15:00',2,15),
	(44,3,'2015-03-29 16:00:00',3,15),
	(45,4,'2015-03-29 17:00:00',4,15),
	(46,1,'2015-03-29 15:00:00',13,16),
	(47,2,'2015-03-29 15:15:00',14,16),
	(48,3,'2015-03-29 16:00:00',15,16),
	(49,4,'2015-03-29 17:00:00',16,16);

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
  CONSTRAINT `fk_subscription_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;

INSERT INTO `subscription` (`id_subscription`, `name`, `from`, `to`, `amount`, `user_id`)
VALUES
	(1,NULL,'2015-03-29 14:30:56','2015-04-05 14:30:56',0.00,1);

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
  CONSTRAINT `fk_trip_user1` FOREIGN KEY (`driver_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;

INSERT INTO `trip` (`id_trip`, `driver_id`, `capacity`, `smoking`, `animals`, `luggage`, `price`)
VALUES
	(1,1,7,1,1,'LIGHT',9.00),
	(2,1,7,1,1,'LIGHT',9.00),
	(3,1,7,1,1,'LIGHT',9.00),
	(4,1,7,1,1,'LIGHT',9.00),
	(5,1,7,1,1,'LIGHT',9.00),
	(6,1,7,1,1,'LIGHT',9.00),
	(7,1,7,1,1,'LIGHT',9.00),
	(8,1,7,1,1,'LIGHT',9.00),
	(9,1,7,0,0,'NORMAL',10.00),
	(10,1,7,0,0,'LIGHT',10.00),
	(11,1,5,1,1,'LIGHT',20.00),
	(12,1,5,1,1,'LIGHT',20.00),
	(13,1,5,1,1,'LIGHT',7.00),
	(15,1,7,1,1,'LIGHT',9.00),
	(16,1,7,1,1,'LIGHT',9.00);

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
	(1,'Valentin','Polo','VP42','me@vpolo.fr','$2a$10$7E6u7FYYhdUuQDwATDf2Bu5tBcY1nr4exnNMjs4k7h3YhBOM2xrJa',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
  CONSTRAINT `fk_user_has_roles_roles1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_roles_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `fk_user_preference_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
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
