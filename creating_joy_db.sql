DROP SCHEMA IF EXISTS `creating_joy_db`;

CREATE SCHEMA `creating_joy_db`;

USE `creating_joy_db`;




DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
   `user_id` int(11) NOT NULL AUTO_INCREMENT,
   `user_firstname` varchar(45) NOT NULL,
   `user_lastname` varchar(45) NOT NULL,
   `username` varchar(45) NOT NULL UNIQUE,
   `password` char(68) NOT NULL,
   `user_website` varchar(45),
   `user_rating` int(11) NOT NULL,
   `user_phoneno` varchar(20) NOT NULL UNIQUE,
  
	PRIMARY KEY (`user_id`)
 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`(
	`category_id` int(11) NOT NULL AUTO_INCREMENT,
    `category_name` varchar(45) NOT NULL,
    
    primary key(`category_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `user_category`;
CREATE TABLE `user_category` (                   
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  
  PRIMARY KEY (`user_id`,`category_id`),
  
  CONSTRAINT `FK_CATEGORIES_1` FOREIGN KEY (`category_id`) 
  REFERENCES `category`(`category_id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_USERS_3` FOREIGN KEY (`user_id`) 
  REFERENCES `user`(`user_id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(50) NOT NULL,
   primary key(`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (                   
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  
  PRIMARY KEY (`role_id`,`user_id`),
  
  CONSTRAINT `FK_ROLES` FOREIGN KEY (`role_id`) 
  REFERENCES `role`(`role_id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_USERS` FOREIGN KEY (`user_id`) 
  REFERENCES `user`(`user_id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;








DROP TABLE IF EXISTS `query`;
CREATE TABLE `query`(
	`query_id` int(11) NOT NULL AUTO_INCREMENT,
    `requestor_id` int(11) NOT NULL,
    `acceptor_id` int(11) NOT NULL,
    `query_text` text NOT NULL,
	`category_id` int(11) NOT NULL,
    `query_image` blob NOT NULL,
    `query_address_id` int(11) NOT NULL,
    `timestamp` time NOT NULL,
    `likes` int(11),
    `dislikes` int(11),
   
    primary key(`query_id`),
    
    CONSTRAINT `FK_USER_REQUESTOR` FOREIGN KEY(`requestor_id`)
    REFERENCES `user` (`user_id`),
    CONSTRAINT `FK_USER_ACCEPTOR` FOREIGN KEY(`acceptor_id`)
    REFERENCES `user` (`user_id`),
    CONSTRAINT `FK_CATEGORY` FOREIGN KEY(`category_id`)
    REFERENCES `category` (`category_id`)
    
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `address`;
 CREATE TABLE `address`(
    `address_id` int(11) NOT NULL,
    `house_no` varchar(45),
    `street` varchar(50) NOT NULL,
    `city` varchar(45) NOT NULL,
    `landmark` varchar(45),
    `ZIP` varchar(6) NOT NULL,
    `state` varchar(45) NOT NULL,
    `country` varchar(45) NOT NULL,
	 
     
     CONSTRAINT `FK_ADDRESS_1` FOREIGN KEY(`address_id`)
     REFERENCES `user`(`user_id`),
     
	 CONSTRAINT `FK_ADDRESS_2` FOREIGN KEY(`address_id`)
     REFERENCES `query`(`query_id`)
     
    
);


INSERT INTO `role` 
VALUES 
(1,'USER'),
(2,'DONOR'),
(3,'NGO');


INSERT INTO `category` 
VALUES 
(1,'FOOD'),
(2,'SHELTER'),
(3,'CLOTHES');

    
    
   
	

    
    

