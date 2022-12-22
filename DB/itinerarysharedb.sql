-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT(4) NULL DEFAULT '1',
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `profile_picture` VARCHAR(2048) NULL DEFAULT NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `itinerary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itinerary` ;

CREATE TABLE IF NOT EXISTS `itinerary` (
  `id` INT(11) NOT NULL,
  `active` TINYINT(4) NOT NULL DEFAULT '1',
  `budget` DECIMAL(6,2) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `image` VARCHAR(2048) NULL DEFAULT 'https://media.istockphoto.com/photos/couple-relax-on-the-beach-enjoy-beautiful-sea-on-the-tropical-island-picture-id1160947136?b=1&k=20&m=1160947136&s=612x612&w=0&h=AsFmKSBYTtacl0DvI-RanCnAXFU0cmuW8NAo0g-tGzA=',
  `user_id` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL DEFAULT 'My Itinerary',
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_itinerary_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_itinerary_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `itinerary_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itinerary_comment` ;

CREATE TABLE IF NOT EXISTS `itinerary_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `post` TEXT NOT NULL,
  `reply` INT(11) NULL DEFAULT NULL,
  `itinerary_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  INDEX `fk_reply_id_idx` (`reply` ASC),
  INDEX `fk_comment_itinerary1_idx` (`itinerary_id` ASC),
  CONSTRAINT `fk_comment_itinerary`
    FOREIGN KEY (`itinerary_id`)
    REFERENCES `itinerary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reply_id`
    FOREIGN KEY (`reply`)
    REFERENCES `itinerary_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `image` TEXT NULL,
  `country` VARCHAR(100) NULL,
  `city` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `itinerary_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `itinerary_item` ;

CREATE TABLE IF NOT EXISTS `itinerary_item` (
  `id` INT(11) NOT NULL,
  `itinerary_id` INT(11) NOT NULL,
  `trip_day` INT NOT NULL DEFAULT 0,
  `destination_id` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_itinerary_id_idx` (`itinerary_id` ASC),
  INDEX `fk_itinerary_item_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_itinerary_id`
    FOREIGN KEY (`itinerary_id`)
    REFERENCES `itinerary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itinerary_item_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT(11) NOT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `rating` INT(1) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` INT(11) NOT NULL,
  `destination_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_user1_idx` (`user_id` ASC),
  INDEX `fk_review_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_review_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `itinerary_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_has_bookmarked_itinerary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_bookmarked_itinerary` ;

CREATE TABLE IF NOT EXISTS `user_has_bookmarked_itinerary` (
  `user_id` INT(11) NOT NULL,
  `itinerary_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `itinerary_id`),
  INDEX `fk_user_has_itinerary_itinerary1_idx` (`itinerary_id` ASC),
  INDEX `fk_user_has_itinerary_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_itinerary_itinerary1`
    FOREIGN KEY (`itinerary_id`)
    REFERENCES `itinerary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_itinerary_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `travel_detail_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travel_detail_type` ;

CREATE TABLE IF NOT EXISTS `travel_detail_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travel_detail` ;

CREATE TABLE IF NOT EXISTS `travel_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `itinerary_item_id` INT(11) NOT NULL,
  `travel_detail_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_travel_detail_itinerary_item1_idx` (`itinerary_item_id` ASC),
  INDEX `fk_travel_detail_travel_detail_type1_idx` (`travel_detail_type_id` ASC),
  CONSTRAINT `fk_travel_detail_itinerary_item1`
    FOREIGN KEY (`itinerary_item_id`)
    REFERENCES `itinerary_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_travel_detail_travel_detail_type1`
    FOREIGN KEY (`travel_detail_type_id`)
    REFERENCES `travel_detail_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination_comment` ;

CREATE TABLE IF NOT EXISTS `destination_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `post` TEXT NOT NULL,
  `reply` INT(11) NULL DEFAULT NULL,
  `destination_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  INDEX `fk_reply_id_idx` (`reply` ASC),
  INDEX `fk_destination_comment_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_reply_id0`
    FOREIGN KEY (`reply`)
    REFERENCES `destination_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id0`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_destination_comment_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `destination_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination_rating` ;

CREATE TABLE IF NOT EXISTS `destination_rating` (
  `rating` INT NOT NULL,
  `rating_comment` TEXT NULL,
  `destination_id` INT NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`destination_id`, `user_id`),
  INDEX `fk_destination_rating_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_destination_rating_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_destination_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip_picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip_picture` ;

CREATE TABLE IF NOT EXISTS `trip_picture` (
  `id` INT NOT NULL,
  `image_url` VARCHAR(2048) NOT NULL,
  `itinerary_item_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trip_picture_itinerary_item1_idx` (`itinerary_item_id` ASC),
  CONSTRAINT `fk_trip_picture_itinerary_item1`
    FOREIGN KEY (`itinerary_item_id`)
    REFERENCES `itinerary_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (1, 'admin', 'chaotic_slime', 1, 'ADMIN', NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `itinerary`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (1, 1, 2000.00, '2022-12-25', '2022-12-30', NULL, 1, DEFAULT, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `itinerary_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `itinerary_comment` (`id`, `user_id`, `post`, `reply`, `itinerary_id`) VALUES (1, 1, 'This trip was great', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_bookmarked_itinerary`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `user_has_bookmarked_itinerary` (`user_id`, `itinerary_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `travel_detail_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `travel_detail_type` (`id`, `name`) VALUES (1, 'flight');
INSERT INTO `travel_detail_type` (`id`, `name`) VALUES (2, 'train');
INSERT INTO `travel_detail_type` (`id`, `name`) VALUES (3, 'rental car');
INSERT INTO `travel_detail_type` (`id`, `name`) VALUES (4, 'accommodation');
INSERT INTO `travel_detail_type` (`id`, `name`) VALUES (5, 'dining');

COMMIT;

