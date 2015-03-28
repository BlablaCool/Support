# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.21)
# Database: blablacool
# Generation Time: 2015-03-28 12:42:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(42) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription`;

CREATE TABLE `subscription` (
  `id_subscription` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_subscription`,`user_id`),
  KEY `fk_subscription_user1_idx` (`user_id`),
  CONSTRAINT `fk_subscription_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table trip_has_passengers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trip_has_passengers`;

CREATE TABLE `trip_has_passengers` (
  `trip_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  PRIMARY KEY (`trip_id`,`passenger_id`),
  KEY `fk_trip_has_user_user1_idx` (`passenger_id`),
  KEY `fk_trip_has_user_trip1_idx` (`trip_id`),
  CONSTRAINT `fk_trip_has_user_trip1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id_trip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_has_user_user1` FOREIGN KEY (`passenger_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
