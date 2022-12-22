-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema itinerarysharedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `itinerarysharedb` ;

-- -----------------------------------------------------
-- Schema itinerarysharedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itinerarysharedb` DEFAULT CHARACTER SET utf8 ;
USE `itinerarysharedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `profile_picture` VARCHAR(2048) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `itinerary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itinerary` ;

CREATE TABLE IF NOT EXISTS `itinerary` (
  `id` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NULL,
  `city` VARCHAR(100) NOT NULL,
  `budget` DECIMAL(6,2) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `image` VARCHAR(2048) NULL DEFAULT 'https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA=',
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_itinerary_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_itinerary_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `accommodation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `accommodation` ;

CREATE TABLE IF NOT EXISTS `accommodation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `rate` DECIMAL(6,2) NOT NULL,
  `address` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rental_car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental_car` ;

CREATE TABLE IF NOT EXISTS `rental_car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rate` DECIMAL(6,2) NOT NULL,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flight` ;

CREATE TABLE IF NOT EXISTS `flight` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `airline` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dining`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dining` ;

CREATE TABLE IF NOT EXISTS `dining` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NULL,
  `reservation_required` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `type` VARCHAR(45) NULL,
  `price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL,
  `itinerary_id` INT NOT NULL,
  `previous_destination` INT NULL,
  `next_destination` INT NULL,
  `accommodation_id` INT NULL,
  `event_id` INT NULL,
  `flight_id` INT NULL,
  `dining_id` INT NULL,
  `rental_car_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_id_idx` (`event_id` ASC),
  INDEX `fk_accomodation_id_idx` (`accommodation_id` ASC),
  INDEX `fk_flight_id_idx` (`flight_id` ASC),
  INDEX `fk_dining_id_idx` (`dining_id` ASC),
  INDEX `fk_rental_car_id_idx` (`rental_car_id` ASC),
  INDEX `fk_previous_destination_id_idx` (`previous_destination` ASC),
  INDEX `fk_next_destination_id_idx` (`next_destination` ASC),
  CONSTRAINT `fk_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_accomodation_id`
    FOREIGN KEY (`accommodation_id`)
    REFERENCES `accommodation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flight_id`
    FOREIGN KEY (`flight_id`)
    REFERENCES `flight` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dining_id`
    FOREIGN KEY (`dining_id`)
    REFERENCES `dining` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_car_id`
    FOREIGN KEY (`rental_car_id`)
    REFERENCES `rental_car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_previous_destination_id`
    FOREIGN KEY (`previous_destination`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_next_destination_id`
    FOREIGN KEY (`next_destination`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_itinerary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_itinerary` ;

CREATE TABLE IF NOT EXISTS `user_has_itinerary` (
  `user_id` INT NOT NULL,
  `itinerary_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `itinerary_id`),
  INDEX `fk_user_has_itinerary_itinerary1_idx` (`itinerary_id` ASC),
  INDEX `fk_user_has_itinerary_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_itinerary_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_itinerary_itinerary1`
    FOREIGN KEY (`itinerary_id`)
    REFERENCES `itinerary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `post` TEXT NOT NULL,
  `reply` INT NULL,
  `itinerary_id` INT NOT NULL,
  `itinerary_id1` INT NOT NULL,
  `user_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_itinerary1_idx` (`itinerary_id1` ASC),
  INDEX `fk_comment_user1_idx` (`user_id1` ASC),
  CONSTRAINT `fk_comment_itinerary1`
    FOREIGN KEY (`itinerary_id1`)
    REFERENCES `itinerary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id1`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS itdbadmin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'itdbadmin'@'localhost' IDENTIFIED BY 'itdbadmin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'itdbadmin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`) VALUES (1, 'admin', 'chaotic_slime', 1, '', 'ADMIN');

COMMIT;

