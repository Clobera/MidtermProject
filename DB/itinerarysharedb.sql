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
  `enabled` TINYINT(4) NOT NULL DEFAULT '1',
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `profile_picture` VARCHAR(2048) NULL DEFAULT 'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg',
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `active` TINYINT(4) NOT NULL DEFAULT '1',
  `budget` DECIMAL(8,2) NULL DEFAULT NULL,
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
  `reply` INT(11) NULL,
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
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


-- -----------------------------------------------------
-- Table `destination_picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination_picture` ;

CREATE TABLE IF NOT EXISTS `destination_picture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2048) NULL,
  `destination_id` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_destination_picture_destination1_idx` (`destination_id` ASC),
  CONSTRAINT `fk_destination_picture_destination1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `destination` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS itdbadmin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'itdbadmin'@'localhost' IDENTIFIED BY 'itdbadmin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'itdbadmin'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'itdbadmin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (1, 'admin', 'chaotic_slime', 1, 'ADMIN', 'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg', 'Chaotic', 'Slime', 'this is the chaotic slime admin account!');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (2, 'user2', 'password123', 1, 'USER', NULL, 'Carlos', 'Lobera', 'hello! im carlos.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `itinerary`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (1, 1, 2000.00, '2022-12-25', '2022-12-30', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/roadtrip-1583526313.jpg', 1, 'Summer Trip to Utah 2022', 'Roadtrip with my boyfriend to Utah');
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (2, 1, 1500, '2023-05-10', '2023-05-20', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/10/2e/65/florida-keys.jpg?w=700&h=-1&s=1', 1, '10 day RoadTrip to Florida Keys', 'Roadtrip to the florida keys!');
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (3, 1, 3000, '2022-06-22', '2022-07-20', 'https://img-www.tf-cdn.com/movie/2/the-lizzie-mcguire-movie-2003.jpeg', 1, 'Trip to Italy', 'i went on a trip to Italy with some friend and there were some suprises!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `itinerary_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `itinerary_comment` (`id`, `user_id`, `post`, `reply`, `itinerary_id`) VALUES (1, 1, 'This trip was great', NULL, 1);
INSERT INTO `itinerary_comment` (`id`, `user_id`, `post`, `reply`, `itinerary_id`) VALUES (2, 1, 'i wish i stayed longer', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (1, 'Salt Lakes', 'Famous Lake known for being really salty', 'https://cdn.britannica.com/36/193436-050-6054715D/Antelope-Island-Great-Salt-Lake-Utah.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (2, 'Tubing Provo River', 'Best suited for the later summer months (during late spring and early summer, the river’s water is typically too high and too cold), tubing the Provo River is not only a refreshing adventure, but an escape from the dog days of summer. Although you can tube or raft the river with your own equipment, it is recommended that you enlist the services of trained river guides that will give you the equipment and know-how necessary to both have fun, and stay safe. ', 'https://www.onlyinyourstate.com/wp-content/uploads/2019/06/38817189_10155838594776317_6889531587537403904_n-1.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (3, 'Cowabunga Bay Water Park', 'A rainbow of interwoven waterslides that scream for attention from passerby, Cowabunga Bay is a center of family fun that cools everyone off during the summer months. With fun food, periodic deals, and new facilities, the water park is one of the best in Utah. ', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/5f/55/46/20180614-111338-largejpg.jpg?w=1200&h=-1&s=1', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (4, 'Alpine Slide & Mountain Coaster', 'For many Utahans, Park City is the ideal summer destination because it offers cooler temperatures and a variety of activities and entertainment. One of the city’s most popular attractions is the alpine slide, and its cooler younger brother, the mountain coaster. $17 dollars for a single ride on the slide and $24 for a single ride on the coaster, it’s a better deal to purchase a duo ticket that gets you into both for $34. ', 'https://www.laparent.com/wp-content/uploads/2021/05/Mineshaft-Coaster-at-AlpineSlides-scaled.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (5, 'Salt Lake City Farmers Market', 'The largest farmers market in Utah, the Salt Lake City Farmers Market takes place every Saturday from June to October in Pioneer Park. With artisanal goods, gourmet food, and a wide selection of locally-grown produce, the farmer’s market is an exciting shopping experience for families. ', 'https://assets.simpleviewinc.com/simpleview/image/upload/crm/parkcity/PSSM-Chamber-Photos20_5e9810c2-5056-b3a8-49f1588030dc5f20.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (6, 'Summerfest', 'Taking place every year in early June, Orem’s Summerfest is a classic carnival experience shaped by the Utah Valley community. With all of the expected rides and treats, the family-friendly festival ends with a spectacular firework show. ', 'https://victoryranchutah.com/wp-content/uploads/2019/08/unnamed-1024x683.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (7, ' Penny Ann\'s Cafe', 'Breakfast Restaurant', 'https://pennyannscafe.com/wp-content/uploads/2015/05/slide-5-mobile.png', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (8, 'The Park Cafe', 'Breakfast Restaurant', 'https://utah.momentumrecycling.com/wp-content/uploads/2019/11/The-Park-Cafe_Salt-Lake-City_1-scaled.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (9, 'Hub and Spoke Diner', 'Breakfast Restaurant', 'https://cdn0.weddingwire.com/vendor/937170/3_2/960/jpg/hub-1_51_1071739-1570220336.jpeg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (10, 'Spitz', 'Lunch Restaurant', 'http://2.bp.blogspot.com/-XA9Ngc9elr8/VO0NttltNEI/AAAAAAAALjs/wTLwDVqbN7Q/s1600/Spitz.png', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (11, 'Takashi', 'Lunch Restaurant', 'https://cityhomecollective.blob.core.windows.net/uploads/cms/wp-content/uploads/2013/02/Tamara-Takashi-SLC-Local-Sushi-Restaraunt-23.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (12, 'The Dodo Restaurant', 'Lunch Restaurant', 'http://4.bp.blogspot.com/-t016DVKWdjA/T5zfV4NBxRI/AAAAAAAAN_M/vyS8PtzrEoY/s1600/dodo026.JPG', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (13, 'Sleepy Ridge Vineyard', 'Winery', 'https://t.realgeeks.media/thumbnail/tF23zV_Z2pqiu8BTc5Bvea-lKxA=/fit-in/460x/u.realgeeks.media/utahrealtygroup/sleepy-ridge-homes-vineyard-1.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (14, 'The Grand American Hotel', 'Hotel', 'https://www.grandamerica.com/wp-content/uploads/2021/01/GAH-Home-Gradient-Winter-Hotel-Exterior-scaled.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (15, 'Salt Lake City International Airport', 'Airport', 'https://www.hok.com/wp-content/uploads/2021/09/SLC_PhotoByBruceDamonte_10.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (16, 'salt Lake Centry 16 and XD', 'Movie Theater', 'https://static.utahtheaters.info/theaters/Century16/Photos/040119/040119-DSCN1528-250.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (17, 'Oquirrih Restaurant', 'Dinner Restaurant', 'https://utahstories.com/wp-content/uploads/2022/05/Untitled-105-min.jpg', 'United States', 'Salt Lake City');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (18, 'Spencers For Steaks and Chops Salt Lake City', 'Dinner Restaurant', 'https://images.otstatic.com/prod/24100374/1/large.jpg', 'United States', 'Salt Lake City');

COMMIT;


-- -----------------------------------------------------
-- Data for table `itinerary_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (1, 1, 1, 7, 'Breakfast');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (2, 1, 1, 1, 'Lake day');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (3, 1, 1, 10, 'Lunch');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (4, 1, 1, 14, 'Dinner');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (5, 1, 2, 8, 'Breakfast');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (6, 1, 2, 5, 'Sightsee');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (7, 1, 2, 12, 'Lunch');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (8, 1, 2, 16, 'Movies');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (9, 1, 2, 14, 'Dinner');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (10, 1, 3, 9, 'Breakfast');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (11, 1, 3, 14, 'Relax');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (12, 1, 3, 10, 'Lunch');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (13, 1, 3, 2, 'Hangout with Friends');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (14, 1, 3, 17, 'Dinner with family');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (15, 1, 4, 8, 'Brunch');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (16, 1, 4, 13, 'Vineyard');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (17, 1, 4, 18, 'Dinner');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (18, 1, 5, 7, 'Breakfast');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (19, 1, 5, 6, 'Sightsee');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (20, 1, 5, 11, 'Lunch');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (21, 1, 5, 4, 'Sightsee');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (22, 1, 5, 18, 'Dinner');
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (23, 1, 6, 15, 'Travel Day');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_bookmarked_itinerary`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `user_has_bookmarked_itinerary` (`user_id`, `itinerary_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (1, 1, 'that lake is super salty!', NULL, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (2, 1, 'ill buy goggles next time', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `destination_rating` (`rating`, `rating_comment`, `destination_id`, `user_id`) VALUES (5, 'a summer ill never forget', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip_picture`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `trip_picture` (`id`, `image_url`, `itinerary_item_id`) VALUES (1, 'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9hZCUyMHRyaXB8ZW58MHx8MHx8&w=1000&q=80', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination_picture`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (1, 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQYxi6zFlTIvKUG6JQX80sTqOpLAtYpNLnajGqWwzhjnjxdSrDj_VOXB7LeIdTly_Af', 1);

COMMIT;

