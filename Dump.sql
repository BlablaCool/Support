-- MySQL Script generated by MySQL Workbench
-- Tue Apr  7 19:23:54 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blablacool
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blablacool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blablacool` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `blablacool` ;

-- -----------------------------------------------------
-- Table `blablacool`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`user` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(200) NULL,
  `lastname` VARCHAR(200) NULL,
  `nickname` VARCHAR(42) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `age` TINYINT(100) UNSIGNED NULL,
  `phone_number` VARCHAR(20) NULL,
  `address` VARCHAR(255) NULL,
  `city` VARCHAR(180) NULL,
  `state` VARCHAR(255) NULL,
  `postcode` VARCHAR(10) NULL,
  `country` VARCHAR(255) NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`place` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`place` (
  `id_place` INT NOT NULL AUTO_INCREMENT,
  `name_public` VARCHAR(255) NOT NULL,
  `name_private` VARCHAR(255) NOT NULL,
  `latitude` DECIMAL(24,18) NOT NULL,
  `longitude` DECIMAL(24,18) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `address` TINYTEXT NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `street_number` VARCHAR(42) NOT NULL,
  `postal_code` VARCHAR(6) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `country_short` VARCHAR(45) NOT NULL,
  `user_id_user` INT NOT NULL,
  PRIMARY KEY (`id_place`, `user_id_user`),
  INDEX `fk_place_user1_idx` (`user_id_user` ASC),
  CONSTRAINT `fk_place_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`trip` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`trip` (
  `id_trip` INT NOT NULL AUTO_INCREMENT,
  `driver_id` INT NOT NULL,
  `capacity` TINYINT(10) NOT NULL,
  `smoking` TINYINT(1) NULL DEFAULT 1,
  `animals` TINYINT(1) NULL DEFAULT 1,
  `luggage` VARCHAR(50) NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id_trip`, `driver_id`),
  INDEX `fk_trip_user1_idx` (`driver_id` ASC),
  CONSTRAINT `fk_trip_user1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`step`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`step` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`step` (
  `id_step` INT NOT NULL AUTO_INCREMENT,
  `position` MEDIUMINT(10) NULL,
  `estimated_time` DATETIME NULL,
  `place_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  INDEX `fk_step_trip1_idx` (`trip_id` ASC),
  PRIMARY KEY (`id_step`),
  CONSTRAINT `fk_step_place1`
    FOREIGN KEY (`place_id`)
    REFERENCES `blablacool`.`place` (`id_place`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_step_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `blablacool`.`trip` (`id_trip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`car` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`car` (
  `id_car` INT NOT NULL AUTO_INCREMENT,
  `owner_id` INT NOT NULL,
  `type` VARCHAR(150) NULL,
  `registration` VARCHAR(30) NOT NULL,
  `brand` VARCHAR(100) NULL,
  `model` VARCHAR(100) NULL,
  `capacity` TINYINT(10) NOT NULL,
  `image` VARCHAR(255) NULL,
  `api_id` INT NULL,
  `year` INT NULL,
  `trim` VARCHAR(255) NULL,
  `horse_power` INT NULL,
  `doors` INT NULL,
  PRIMARY KEY (`id_car`, `owner_id`),
  INDEX `fk_car_user1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_car_user1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`role` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`role` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(42) NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`user_has_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`user_has_roles` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`user_has_roles` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `fk_user_has_roles_roles1_idx` (`role_id` ASC),
  INDEX `fk_user_has_roles_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_roles_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_roles_roles1`
    FOREIGN KEY (`role_id`)
    REFERENCES `blablacool`.`role` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`subscription` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`subscription` (
  `id_subscription` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `from` DATETIME NOT NULL,
  `to` DATETIME NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_subscription`, `user_id`),
  INDEX `fk_subscription_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_subscription_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`user_preference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`user_preference` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`user_preference` (
  `id_user_preference` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `like_animals` TINYINT(1) NULL,
  `music_style` VARCHAR(100) NULL,
  `like_smoking` TINYINT(1) NULL,
  `temperament` VARCHAR(100) NULL,
  `talking_level` VARCHAR(150) NULL,
  `driving_style` VARCHAR(150) NULL,
  `others` MEDIUMTEXT NULL,
  PRIMARY KEY (`id_user_preference`, `user_id`),
  INDEX `fk_user_preference_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_preference_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`booking` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `trip_id` INT NOT NULL,
  `step_id` INT NOT NULL,
  `user_id_user` INT NOT NULL,
  `status` ENUM('PENDING', 'DECLINED', 'ACCEPTED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
  `paid` TINYINT(1) NULL,
  `created_time` DATETIME NULL,
  PRIMARY KEY (`id`, `trip_id`, `step_id`, `user_id_user`),
  INDEX `fk_booking_trip1_idx` (`trip_id` ASC),
  INDEX `fk_booking_step1_idx` (`step_id` ASC),
  INDEX `fk_booking_user1_idx` (`user_id_user` ASC),
  CONSTRAINT `fk_booking_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `blablacool`.`trip` (`id_trip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_step1`
    FOREIGN KEY (`step_id`)
    REFERENCES `blablacool`.`step` (`id_step`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`review` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`review` (
  `id_review` INT NOT NULL AUTO_INCREMENT,
  `reviewer_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  `note` INT(11) NULL,
  `comment` TINYTEXT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id_review`, `reviewer_id`, `booking_id`),
  INDEX `fk_review_user1_idx` (`reviewer_id` ASC),
  INDEX `fk_review_booking1_idx` (`booking_id` ASC),
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`reviewer_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `blablacool`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`message` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`message` (
  `id_message` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  `message` MEDIUMTEXT NOT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id_message`, `user_id`, `trip_id`),
  INDEX `fk_message_user1_idx` (`user_id` ASC),
  INDEX `fk_message_trip1_idx` (`trip_id` ASC),
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `blablacool`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `blablacool`.`trip` (`id_trip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blablacool`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blablacool`.`payment` ;

CREATE TABLE IF NOT EXISTS `blablacool`.`payment` (
  `id_payment` INT NOT NULL AUTO_INCREMENT,
  `payment_method` VARCHAR(100) NOT NULL,
  `amount` DECIMAL(8,2) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `booking_id` INT NOT NULL,
  PRIMARY KEY (`id_payment`, `booking_id`),
  INDEX `fk_payment_booking1_idx` (`booking_id` ASC),
  CONSTRAINT `fk_payment_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `blablacool`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
