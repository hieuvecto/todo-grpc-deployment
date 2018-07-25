-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

USE mockProject;

DROP TABLE `Booking`;


DROP TABLE `SubPitch`;


DROP TABLE `Pitch`;


DROP TABLE `User`;


DROP TABLE `Owner`;


DROP TABLE `Admin`;



-- ************************************** `User`

CREATE TABLE `User`
(
`id` INT NOT NULL AUTO_INCREMENT ,
`username` VARCHAR(40) NOT NULL ,
`email` VARCHAR(40) NOT NULL ,
`password` VARCHAR(255) NOT NULL ,
`phone` VARCHAR(13) NOT NULL ,
`avatarUrl` TEXT ,
`created_at` INT(11) NOT NULL ,
`updated_at` INT(11) NOT NULL ,

PRIMARY KEY (`id`),
UNIQUE KEY (`username`),
UNIQUE KEY (`email`),
UNIQUE KEY (`phone`)
) AUTO_INCREMENT=1;





-- ************************************** `Owner`

CREATE TABLE `Owner`
(
`id` INT NOT NULL AUTO_INCREMENT ,
`username` VARCHAR(40) NOT NULL ,
`email` VARCHAR(40) NOT NULL ,
`password` VARCHAR(255) NOT NULL ,
`phone` VARCHAR(13) NOT NULL ,
`avatarUrl` TEXT ,
`created_at` INT(11) NOT NULL ,
`updated_at` INT(11) NOT NULL ,

PRIMARY KEY (`id`),
UNIQUE KEY (`username`),
UNIQUE KEY (`email`),
UNIQUE KEY (`phone`)
) AUTO_INCREMENT=1;





-- ************************************** `Admin`

CREATE TABLE `Admin`
(
`id` INT NOT NULL AUTO_INCREMENT ,
`username` VARCHAR(40) NOT NULL ,
`password` VARCHAR(255) NOT NULL ,

PRIMARY KEY (`id`),
UNIQUE KEY (`username`)
) AUTO_INCREMENT=1;





-- ************************************** `Pitch`

CREATE TABLE `Pitch`
(
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL ,
`description` TEXT ,
`ownerId` INT NOT NULL ,
`city` VARCHAR(20) NOT NULL ,
`district` VARCHAR(20) NOT NULL ,
`street` VARCHAR(30) NOT NULL ,
`apartmentNumber` INT NOT NULL ,
`created_at` INT(11) NOT NULL ,
`updated_at` INT(11) NOT NULL ,

PRIMARY KEY (`id`),
UNIQUE KEY (`name`),
KEY `fkIdx_129` (`ownerId`),
CONSTRAINT `FK_Pitch_Owner` FOREIGN KEY `fkIdx_129` (`ownerId`) REFERENCES `Owner` (`id`)
) AUTO_INCREMENT=1;





-- ************************************** `SubPitch`

CREATE TABLE `SubPitch`
(
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL ,
`description` TEXT ,
`status` BINARY NOT NULL DEFAULT 1,
`pitchId` INT NOT NULL ,
`startTime` TIME NOT NULL ,
`endTime` TIME NOT NULL ,
`pricePerHour` INT NOT NULL ,
`currency` CHAR(3) NOT NULL DEFAULT 'VND',
`created_at` INT(11) NOT NULL ,
`updated_at` INT(11) NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_146` (`pitchId`),
CONSTRAINT `FK_SubPitch_Pitch` FOREIGN KEY `fkIdx_146` (`pitchId`) REFERENCES `Pitch` (`Id`)
) AUTO_INCREMENT=1;





-- ************************************** `Booking`

CREATE TABLE `Booking`
(
`id` INT NOT NULL AUTO_INCREMENT,
`userId` INT NOT NULL ,
`subPitchId` INT NOT NULL ,
`bookDay` DATE NOT NULL ,
`startTime` TIME NOT NULL ,
`endTime` TIME NOT NULL ,
`message` TEXT ,
`isVerified` BINARY NOT NULL DEFAULT 0,
`created_at` INT(11) NOT NULL ,
`updated_at` INT(11) NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_154` (`userId`),
CONSTRAINT `FK_Booking_User` FOREIGN KEY `fkIdx_154` (`userId`) REFERENCES `User` (`id`),
KEY `fkIdx_167` (`subPitchId`),
CONSTRAINT `FK_Booking_SubPitch` FOREIGN KEY `fkIdx_167` (`subPitchId`) REFERENCES `SubPitch` (`id`)
) AUTO_INCREMENT=1;









