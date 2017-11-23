/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 5.0.82-community-nt : Database - guestbook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `guestbook1`;

USE `guestbook1`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `cmt` */

DROP TABLE IF EXISTS `cmt`;

CREATE TABLE `cmt` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) default NULL,
  `comment` varchar(500) default NULL,
  `datecmt` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_user_cmt` (`username`),
  CONSTRAINT `fk_user_cmt` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `cmt` */

insert  into `cmt`(`id`,`username`,`comment`,`datecmt`) values (1,'nha','hi','2017-11-23 14:00:38');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`username`,`password`,`fullname`) values ('nha','123','Nguyễn Thanh Nha');

/* Procedure structure for procedure `spDeleteCmt` */

/*!50003 DROP PROCEDURE IF EXISTS  `spDeleteCmt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCmt`(in id int)
begin
delete from cmt where cmt.id = id;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spInsertCmt` */

/*!50003 DROP PROCEDURE IF EXISTS  `spInsertCmt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertCmt`(in username varchar(50), in comment varchar(500))
begin
insert into cmt(username,comment,datecmt) values(username,comment,NOW());
end */$$
DELIMITER ;

/* Procedure structure for procedure `spInsertUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `spInsertUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertUser`(in username varchar(50),in password varchar(50),in fullname varchar(50))
begin
insert into user values(username, password, fullname);
end */$$
DELIMITER ;

/* Procedure structure for procedure `spLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `spLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spLogin`(in username varchar(50), in password varchar(50))
begin
select user.fullname from user where user.username=username and user.password = password;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spUpdateCmt` */

/*!50003 DROP PROCEDURE IF EXISTS  `spUpdateCmt` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateCmt`(in username varchar(50), in comment varchar(500), in id int)
begin
update cmt set cmt.comment = comment, cmt.datecmt = NOW() where cmt.id = id;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
