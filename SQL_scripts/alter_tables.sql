USE mockProject;

DROP TABLE `Booking`;


DROP TABLE `SubPitch`;


DROP TABLE `Pitch`;


CREATE TABLE `Booking`
(
 `booking_id`   INT NOT NULL AUTO_INCREMENT,
 `user_id`      INT NOT NULL ,
 `sub_pitch_id` INT NOT NULL ,
 `book_day`     DATE NOT NULL ,
 `start_time`   TIME NOT NULL ,
 `end_time`     TIME NOT NULL ,
 `message`      TEXT ,
 `is_verified`  BINARY NOT NULL DEFAULT 0,
 `total_price`	DOUBLE NOT NULL,
 `created_at`   INT(11) NOT NULL ,
 `updated_at`   INT(11) NOT NULL ,

PRIMARY KEY (`booking_id`),
KEY `fkIdx_154` (`user_id`),
CONSTRAINT `FK_Booking_User` FOREIGN KEY `fkIdx_154` (`user_id`) REFERENCES `User` (`user_id`),
KEY `fkIdx_167` (`sub_pitch_id`),
CONSTRAINT `FK_Booking_SubPitch` FOREIGN KEY `fkIdx_167` (`sub_pitch_id`) REFERENCES `SubPitch` (`sub_pitch_id`)
) AUTO_INCREMENT=1;

CREATE TABLE `Pitch`
(
 `pitch_id`         INT NOT NULL AUTO_INCREMENT,
 `name`             NVARCHAR(45) NOT NULL ,
 `description`      TEXT ,
 `owner_id`         INT NOT NULL ,
 `city`             NVARCHAR(20) NOT NULL ,
 `district`         NVARCHAR(20) NOT NULL ,
 `street`           NVARCHAR(30) NOT NULL ,
 `apartment_number` INT NOT NULL ,
 `phone_number`     VARCHAR(13) NOT NULL ,
 `avatar_url` 		TEXT ,
 `created_at`       INT(11) NOT NULL ,
 `updated_at`       INT(11) NOT NULL ,

PRIMARY KEY (`pitch_id`),
UNIQUE KEY (`name`),
KEY `fkIdx_129` (`owner_id`),
CONSTRAINT `FK_Pitch_Owner` FOREIGN KEY `fkIdx_129` (`owner_id`) REFERENCES `Owner` (`owner_id`)
) AUTO_INCREMENT=1;

CREATE TABLE `SubPitch`
(
 `sub_pitch_id`   INT NOT NULL AUTO_INCREMENT,
 `name`           NVARCHAR(45) NOT NULL ,
 `description`    TEXT ,
 `status`         BINARY NOT NULL DEFAULT 1,
 `pitch_id`       INT NOT NULL ,
 `start_time`     TIME NOT NULL ,
 `end_time`       TIME NOT NULL ,
 `price_per_hour` INT NOT NULL ,
 `currency`       CHAR(3) NOT NULL DEFAULT 'VND',
 `avatar_url`	  TEXT ,
 `created_at`     INT(11) NOT NULL ,
 `updated_at`     INT(11) NOT NULL ,

PRIMARY KEY (`sub_pitch_id`),
KEY `fkIdx_146` (`pitch_id`),
CONSTRAINT `FK_SubPitch_Pitch` FOREIGN KEY `fkIdx_146` (`pitch_id`) REFERENCES `Pitch` (`pitch_id`)
) AUTO_INCREMENT=1;