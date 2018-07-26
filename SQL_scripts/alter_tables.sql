USE mockProject;

DROP TABLE `AuthUser`;

DROP TABLE `AuthOwner`;

CREATE TABLE `AuthUser`
(
 `auth_id`          INT NOT NULL AUTO_INCREMENT,
 `user_id`          INT NOT NULL ,
 `source`      		VARCHAR(255) NOT NULL ,
 `source_id`      	VARCHAR(255) NOT NULL ,
 `created_at`       INT(11) NOT NULL ,
 `updated_at`       INT(11) NOT NULL ,

PRIMARY KEY (`auth_id`),
UNIQUE KEY (`user_id`),
KEY `fkIdx_135` (`user_id`),
CONSTRAINT `FK_AuthUser_User` FOREIGN KEY `fkIdx_135` (`user_id`) REFERENCES `User` (`user_id`)
) AUTO_INCREMENT=1;

CREATE TABLE `AuthOwner`
(
 `auth_id`          INT NOT NULL AUTO_INCREMENT,
 `owner_id`         INT NOT NULL ,
 `source`      		VARCHAR(255) NOT NULL ,
 `source_id`      	VARCHAR(255) NOT NULL ,
 `created_at`       INT(11) NOT NULL ,
 `updated_at`       INT(11) NOT NULL ,

PRIMARY KEY (`auth_id`),
UNIQUE KEY (`owner_id`),
KEY `fkIdx_140` (`owner_id`),
CONSTRAINT `FK_AuthOwner_Owner` FOREIGN KEY `fkIdx_140` (`owner_id`) REFERENCES `Owner` (`owner_id`)
) AUTO_INCREMENT=1;