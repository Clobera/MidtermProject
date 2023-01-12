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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (3, 'lolo1209', ' ', 1, 'USER', 'https://pbs.twimg.com/profile_images/1532621513303609344/bsUairjB_400x400.jpg', 'Carlos', 'Lobera', 'this is the real Carlos');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (4, 'austeresake', 'password123', 1, 'USER', NULL, 'Flora', 'Harun', 'Beer geek. Freelance food enthusiast. Subtly charming alcohol practitioner. Pop culture fanatic. Twitter ninja.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (5, 'emotionalability', 'password123', 1, 'USER', NULL, 'Rudi', 'Elizabet', 'Explorer. Tv ninja. Internet advocate. Food specialist. Web trailblazer. Beer junkie. Extreme pop culture expert.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (6, 'begleader', 'password123', 1, 'USER', NULL, 'Bernie', 'Bernie ', 'Passionate organizer. Travel aficionado. Alcohol specialist. Student. Friendly reader. Hipster-friendly web expert.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (7, 'nurserysailboat', 'password123', 1, 'USER', NULL, 'Goda', 'Haf', 'Organizer. Pop culture aficionado. Avid zombie scholar. Travel expert. Freelance web guru.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (8, 'cumbersomekilt', 'password123', 1, 'USER', NULL, 'Branden', 'Marcos', 'Lifelong communicator. Typical explorer. Travel ninja. Unapologetic creator. Food enthusiast.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (9, 'bozooptician', 'password123', 1, 'USER', NULL, 'Zeltzin', 'Vepkhia', 'Subtly charming pop culture junkie. Music maven. Award-winning internet evangelist.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `profile_picture`, `first_name`, `last_name`, `biography`) VALUES (10, 'oreganobonk', 'password123', 1, 'USER', NULL, 'Riin', 'Drystan', 'Social media nerd. Bacon aficionado. Award-winning food advocate. Organizer. Avid communicator. Writer. Troublemaker.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `itinerary`
-- -----------------------------------------------------
START TRANSACTION;
USE `itinerarysharedb`;
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (1, 1, 2000.00, '2022-12-25', '2022-12-30', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/roadtrip-1583526313.jpg', 1, 'Summer Trip to Utah 2022', 'Roadtrip with my boyfriend to Utah');
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (2, 1, 1500, '2023-05-10', '2023-05-20', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/10/2e/65/florida-keys.jpg?w=700&h=-1&s=1', 1, '10 day RoadTrip to Florida Keys', 'Roadtrip to the florida keys!');
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (3, 1, 3000, '2022-06-22', '2022-07-10', 'https://img-www.tf-cdn.com/movie/2/the-lizzie-mcguire-movie-2003.jpeg', 1, 'Trip to Italy', 'i went on a trip to Italy with some friend and there were some suprises!');
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (4, 1, 4783, '2022-01-01', '2022-02-14', 'https://cdn.londonandpartners.com/-/media/images/london/visit/campaigns/international-recovery-campaign/lets-do-london-related-international-640.jpeg?mw=640&hash=477E6FF9F31F292EE017E5BA63027C7054EB39A0', 2, 'Family trip to London', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (5, 1, 6840, '2022-04-14', '2022-06-26', 'https://i.natgeofe.com/n/6c02ad5a-977b-4f12-b9c0-02ffb0736e07/metropolitan-cathedral-zocalo-mexico-city_16x9.JPG', 3, 'Solo trip to Mexico', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (6, 1, 2000, '2023-12-25', '2024-01-10', 'https://nationaltoday.com/wp-content/uploads/2021/11/National-Iowa-Day.jpg', 4, 'Senior Year Trip to Iowa', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (7, 1, 3532, '2023-03-08', '2023-03-18', 'https://www.seabourn.com/content/dam/sbn/inventory-assets/ports/ANC/port-anchorage-alaska-1334x1001.jpg', 5, 'Icy escapade to Alaska', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (8, 1, 8765, '2022-08-10', '2022-11-30', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/34/00/d7/el-paso.jpg?w=700&h=500&s=1', 6, 'A hot Tour of the El Paso Texas', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (9, 1, 3532, '2022-10-25', '2022-12-01', 'https://www.ledgertranscript.com/getattachment/4569a718-9ef4-454d-9258-a76414b63534/pbrescuewhites-ml-061620-ph2', 7, 'A trip with my Siblings', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (10, 1, 8654, '2022-02-01', '2022-05-01', 'https://a.cdn-hotels.com/gdcs/production5/d1996/54fdb73f-eee5-4612-a3e7-6fc7ed2f7bee.jpg?impolicy=fcrop&w=800&h=533&q=medium', 8, 'Trip to australia', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (11, 1, 3344, '2022-05-04', '2022-07-11', 'https://handluggageonly.co.uk/wp-content/uploads/2015/05/Hand-Luggage-Only-17.jpg', 5, 'Getaway to the greek islands', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (12, 1, 5433, '2023-05-10', '2023-05-29', 'https://a.cdn-hotels.com/gdcs/production54/d346/a7f50b1f-9730-4d1e-93d6-c3239b81f394.jpg', 9, 'Trip to Seattle Washington', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (13, 1, 4783, '2022-02-01', '2022-11-30', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/View_of_Empire_State_Building_from_Rockefeller_Center_New_York_City_dllu.jpg/1200px-View_of_Empire_State_Building_from_Rockefeller_Center_New_York_City_dllu.jpg', 4, 'Long trip to New York', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (14, 1, 4783, '2022-11-30', '2022-12-30', 'https://content.r9cdn.net/rimg/dimg/ca/7e/9ae1c4b2-city-21033-16c1b1c620d.jpg?crop=true&width=1020&height=498', 8, 'Fun Times in Tokyo', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (15, 1, 6868, '2022-04-14', '2022-11-30', 'https://imageio.forbes.com/specials-images/imageserve/61730c93fc56ba9cc0b0c7f2/Blue-Mosque-in-Istanbul/960x0.jpg?format=jpg&width=960', 10, 'Riding a bull in Istanbul', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (16, 1, 4783, '2023-05-10', '2024-01-10', 'https://theworldpursuit.com/wp-content/uploads/2019/11/Things-to-do-Mykonos.jpg', 3, 'Mykonos extravaganza', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (17, 1, 2330, '2022-06-26', '2022-06-29', 'https://media.resources.festicket.com/www/admin/uploads/images/WarehouseKraftwerkBerlin.jpg', 6, 'Nights out in Berlin', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (18, 1, 3532, '2022-10-25', '2023-03-18', 'https://www.travelandleisure.com/thmb/eu_fq7aoSb0sX87bxTbGsehqQEM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/stockholm-se-STOCKHOLMTG0721-6d6d4ffaf1eb4338ac6f90759dc61c11.jpg', 4, 'Getting stickholm syndrome in Stockholm ', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (19, 1, 5839, '2022-02-01', '2022-02-11', 'https://media.architecturaldigest.com/photos/570fddaa9ed5af6a73fbc5f4/4:3/w_768/buenos-aires-lede.jpg', 7, 'Smelling the Bueno Aire in Buenos Aires', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (20, 1, 7844, '2024-01-10', '2024-01-20', 'https://content.r9cdn.net/rimg/dimg/c7/1c/ae83fb0d-city-24227-55360872.jpg?crop=true&width=1366&height=768&xhint=1509&yhint=1008', 5, 'Trip to Sao Miguel de Allende', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (21, 1, 4783, '2022-05-04', '2022-05-20', 'https://assets3.thrillist.com/v1/image/3120392/1200x630/flatten;crop_down;webp=auto;jpeg_quality=70', 9, 'A week getaway to quebec', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (22, 1, 7959, '2022-12-13', '2022-12-25', 'https://i.natgeofe.com/n/fbc599f2-ead1-4017-b301-e405c6a23fbf/park-lima-peru_3x2.jpg', 8, 'meeting a Lama in Limaaaaa', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (23, 1, 3532, '2022-04-14', '2022-04-18', 'https://s3-service-broker-live-19ea8b98-4d41-4cb4-be4c-d68f4963b7dd.s3.amazonaws.com/uploads/collections/Taiwan_HERO-90c839a8a58ac8867931eabada6a41b5.jpg', 4, 'Taiwan adventure', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (24, 1, 6840, '2022-04-14', '2022-04-30', 'https://thenomadvisor.com/wp-content/uploads/2022/01/thingstodoincabosanlucas-780x520.jpg', 10, 'Beach trip to San Cabo Mexico', NULL);
INSERT INTO `itinerary` (`id`, `active`, `budget`, `start_date`, `end_date`, `image`, `user_id`, `name`, `description`) VALUES (25, 1, 5888, '2022-04-18', '2022-04-28', 'https://image.cnbcfm.com/api/v1/image/106845320-1614210756268-gettyimages-542706099-8b6933a4-90e8-40ba-be5b-40a84bd34bd7.jpeg?v=1670909308', 3, '10 day cruise to the Bahamas ', NULL);

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
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (7, 'Penny Ann\'s Cafe', 'Breakfast Restaurant', 'https://pennyannscafe.com/wp-content/uploads/2015/05/slide-5-mobile.png', 'United States', 'Salt Lake City');
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
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (19, 'Barnum Roma', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (20, 'Mus Caffe', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (21, 'D’Angelo Caffè & Gastronomia', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (22, 'Trecaffè - Piazza di Spagna', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (23, 'La Licata', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (24, 'Café Mémé bistrot', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (25, 'Trecaffè - Prati', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (26, 'Homebaked Monteverde', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (27, 'Faro - Luminaries of Coffee', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (28, 'Cappuccino Doc', 'Breakfast Restaurant', 'https://foodtourrome.com/wp-content/uploads/2021/02/thumbnail-7.jpeg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (29, 'Quel che c’è laboratorio Di Cucina', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (30, 'Fuorinorma', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (31, 'Unik Restaurant', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (32, 'Pinsitaly Trevi', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (33, 'Mordi Sandwichouse', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (34, 'Bono Bottega Nostrana - Piazza Di Spagna', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (35, 'Cantina e Cucina', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (36, 'Pane e Salame', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (37, 'Vuliò', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (38, 'Supplizio', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (39, 'Tonnarello', 'Lunch Restaurant', 'https://assets3.thrillist.com/v1/image/2836197/1200x600/scale;', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (40, 'Colline Emiliane', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (41, 'Ristorante Il Falchetto', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (42, 'Cantina e Cucina', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (43, 'Supplizio', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (44, 'al42 by Pasta Chef rione Monti', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (45, 'Ristorante Ad Hoc', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (46, 'Pane e Salame', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (47, 'Trattoria Vecchia Roma', 'Dinner Restaurant', 'https://www.therooftopguide.com/rooftop-news/Bilder/rooftop-restaurants-rome-hotel-raphael.jpg', 'Italy', 'Rome');
INSERT INTO `destination` (`id`, `name`, `description`, `image`, `country`, `city`) VALUES (48, 'Leonardo da Vinci International Airport', 'Airport', 'https://www.traveller.com.au/content/dam/images/h/1/c/1/m/2/image.related.articleLeadwide.620x349.h1c1m5.png/1552437451495.jpg', 'Italy', 'Rome');

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
INSERT INTO `itinerary_item` (`id`, `itinerary_id`, `trip_day`, `destination_id`, `description`) VALUES (24, 2, 1, 48, 'Travel Day');

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
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (1, 4, 'that lake is super salty!', NULL, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (2, 4, 'ill buy goggles next time', 1, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (3, 6, 'The sunset is so beautiful, i went with my family last year', NULL, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (4, 10, 'really? ill have to go this summer!', 3, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (5, 7, 'i couldnt get the taste of salt out of my mouth for weeks!!! be warned', NULL, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (6, 4, 'my daughter fell in and she turned into a salt rock :(', NULL, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (7, 5, 'OMG!! im so sorry :/ ', 6, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (8, 4, 'Its okay, i was salty at first but shes better this way lol', 6, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (9, 5, 'HAHAHAHA', 6, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (10, 8, 'I heard they actually use the salt from here and package it as himalayan salt', NULL, 1);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (11, 9, 'the pancakes are amazing hereeeeeee!! go check them out', NULL, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (12, 4, 'ill never go back... the food was good, but i addicentally fell and my face landed in a bowl of grits :( the whole restaurant laughed at me and i can never show my gritty face ever again', NULL, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (13, 7, 'woah i wouldnt go back either... thats so embarrassing', 12, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (14, 6, 'the wait was long but the food was great! dont come during a rush', NULL, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (15, 10, 'my favorite item from the menu is the potato soup!!! its so so good. ask for the peels on the side too!', NULL, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (16, 5, 'that sounds so gross what is wrong with you', 15, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (17, 8, 'do they have eggs there?', NULL, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (18, 5, 'obviously they have eggs? theyre a breakfast restaurant...', 17, 7);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (19, 5, 'I HATE the name, makes me feel like they put spit in my food :(', NULL, 10);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (20, 4, 'right?? but the food was so good, they need to do something avout that name...', 19, 10);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (21, 9, 'i went here for my birthday and they slammed my head in the cake after they were done singing me happy birthday', NULL, 10);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (22, 10, 'was the cake atleast free??', 21, 10);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (23, 9, 'no :((( they made me pay 44 dollars for my face to be smashed into my cake:(((((', 21, 10);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (24, 5, 'I had the best stay here!', NULL, 14);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (25, 8, 'I really enjoyed staying here the few times I did. The view & landscaping is really quite nice. I had an optician’s rep trunk show thing in the main ballroom. It was a lot of fun & the food was really good. It’s very organized & the staff is very professional. Plenty of parking below in the parking garage area. The staff is thoughtful & the hotel is very clean & stylish, but not overdone at all. Excellent.', NULL, 14);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (26, 10, 'Horrible website! Wanted to book the Witches Tea for my mom’s 60th birthday. Four of us were on the website right at 10 AM everyday to make the reservations. After two minutes they were all “booked” and the website crashed several times! When we called reception they were unsympathetic and unhelpful. They said sorry the website wasn’t working for any of us but that is the only way we can make reservations. End of story. So disappointed!', NULL, 14);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (27, 5, 'where did yall end up staying?', 26, 14);
INSERT INTO `destination_comment` (`id`, `user_id`, `post`, `reply`, `destination_id`) VALUES (28, 10, 'the redroof in :(', 26, 14);

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
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (2, 'https://pennyannscafe.com/wp-content/uploads/2020/09/Breakfast-Sandwich.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (3, 'https://pennyannscafe.com/wp-content/uploads/2020/09/Scone-topped.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (4, 'https://pennyannscafe.com/wp-content/uploads/2020/10/Banana-Nutella.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (5, 'https://pennyannscafe.com/wp-content/uploads/2020/10/Hot-Cake-Sandwich.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (6, 'https://pennyannscafe.com/wp-content/uploads/2020/09/Buffalo-Chicken-Wrap-scaled.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (7, 'https://media-cdn.tripadvisor.com/media/photo-s/0e/cc/b4/b7/heavenly-hot-cakes-topped.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (8, 'https://s3-media0.fl.yelpcdn.com/bphoto/bltcOzTQ9vfXtofuztUSbQ/l.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (9, 'https://utahgrubs.com/wp-content/uploads/sites/22430/2019/06/40C06FEC-D340-45DC-8DA4-389410D799AD-768x1024.jpg', 7);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (10, 'https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F210716084312-08-great-salt-lake-210504.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (11, 'https://cdn.britannica.com/98/197598-050-28DA45BC/Stansbury-Island-Utah-Great-Salt-Lake-foreground.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (12, 'https://visitutahkenticoprod.blob.core.windows.net/cmsroot/visitutah/media/site-assets/three-season-photography/state-parks/great-salt-lake/great-salt-lake-state-park_uibel-charles.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (13, 'https://i.guim.co.uk/img/media/0fcc4237e785be2c01be14c6506be2ab263f4d89/0_114_2400_1440/master/2400.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=f14296ed1c022bcaf68dadee10e0f944', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (14, 'https://static.politico.com/dims4/default/55a1666/2147483647/resize/1110/quality/100/?url=https://static.politico.com/56/1a/18591e9d4754abe17ed8b29f9e85/gw-1007-jacobs-drought-1160-01.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (15, 'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,f_jpg,h_518,q_80,w_640/v1/clients/saltlake/VisitSaltLake_GreatSaltLake_hirez_AustenDiamondPhotography_3_caf3e560-c835-4a0c-a954-6dc03937b2d4.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (16, 'https://cloudfront-us-east-1.images.arcpublishing.com/sltrib/BKEOKS6ZBBFVBJJPR6MCZNHL64.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (17, 'https://npr.brightspotcdn.com/dims4/default/fac538c/2147483647/strip/true/crop/4000x3000+0+0/resize/880x660!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Flegacy%2Fsites%2Fupr%2Ffiles%2F202109%2Furvish-prajapati-kN89XrQog0k-unsplash.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (18, 'https://static.euronews.com/articles/stories/06/76/34/66/1000x563_cmsv2_a1b87c08-6d24-58eb-b3cd-6ae3eed7af27-6763466.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (19, 'https://health.clevelandclinic.org/wp-content/uploads/sites/3/2022/02/TooMuchSodiuml-1051727580-770x533-1-650x428.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (20, 'https://www.foodnavigator.com/var/wrbm_gb_food_pharma/storage/images/9/0/8/1/2321809-1-eng-GB/Quiet-salt-reduction-is-vital-but-gourmet-salt-growth-may-stifle-industry-efforts.jpg', 1);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (21, 'https://spitz-restaurant.com/wp-content/uploads/2021/02/best-mediterranean-restaurant-near-me-vegan-food-greek-food.jpg', 10);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (22, 'https://s3-media0.fl.yelpcdn.com/bphoto/HZCwVumwk2hlWHw5ML1ygA/348s.jpg', 10);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (23, 'https://media-cdn.tripadvisor.com/media/photo-p/1a/49/18/6c/photo0jpg.jpg', 10);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (24, 'https://media-cdn.tripadvisor.com/media/photo-s/08/62/c1/46/doner-salad.jpg', 10);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (25, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/85/cb/ba/the-lobby-lounge.jpg?w=700&h=-1&s=1', 14);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (26, 'https://www.grandamerica.com/wp-content/uploads/2017/03/GA_MtgRoomGallery_Riviera-min.jpg', 14);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (27, 'https://assets.simpleviewinc.com/simpleview/image/fetch/c_limit,q_75,w_1200/https://assets.simpleviewinc.com/simpleview/image/upload/crm/utahddm/4023434_552c1b8f3c509095f00041bf_38a57896-5056-a36a-094f51fe9bbfb402.jpg', 14);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (28, 'https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_631,q_75,w_951/https://assets.simpleviewinc.com/simpleview/image/upload/crm/utahddm/3940687_552c1b8f3c509095f00041bf_38a4720f-5056-a36a-09892f806e341e45.jpg', 14);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (29, 'https://media.hrs.com/media/image/98/8a/9a/Grand_America_Hotel-Salt_Lake_City-Aussenansicht-1-78582_600x600.jpg', 14);
INSERT INTO `destination_picture` (`id`, `image_url`, `destination_id`) VALUES (30, 'https://pbs.twimg.com/media/EVmzz25U0AEN6qg?format=jpg&name=large', 14);

COMMIT;

