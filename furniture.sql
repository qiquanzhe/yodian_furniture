-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: furniture
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admintel` varchar(20) DEFAULT NULL,
  KEY `fk_admintel` (`admintel`),
  CONSTRAINT `fk_admintel` FOREIGN KEY (`admintel`) REFERENCES `user` (`usertel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('18888888888');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `usertel` varchar(20) NOT NULL,
  `fid` varchar(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `ctime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fpic`
--

DROP TABLE IF EXISTS `fpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fpic` (
  `fid` bigint(20) NOT NULL,
  `fimg` varchar(100) DEFAULT NULL,
  KEY `fk_picfid` (`fid`),
  CONSTRAINT `fk_picfid` FOREIGN KEY (`fid`) REFERENCES `furn` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fpic`
--

LOCK TABLES `fpic` WRITE;
/*!40000 ALTER TABLE `fpic` DISABLE KEYS */;
INSERT INTO `fpic` VALUES (2002,'bed (2).png'),(2003,'bed (3).png'),(2004,'bed (4).png'),(2005,'bed (5).png'),(2006,'bed (6).png'),(2007,'bed (7).png'),(2008,'bed (8).png'),(2009,'bed (9).png'),(2010,'bed (10).png'),(2011,'bed (11).png'),(2012,'bed (12).png'),(2001,'bed2101 (1).png'),(2001,'bed2101 (2).png'),(2001,'bed2101 (3).png'),(2001,'bed2101 (4).png'),(2001,'bed2101 (5).png'),(2001,'bed2101 (6).png'),(2001,'bed2101 (7).png'),(1002,'sofa (1).png'),(1003,'sofa (2).png'),(1004,'sofa (3).png'),(1005,'sofa (4).png'),(1006,'sofa (5).png'),(1007,'sofa (6).png'),(1008,'sofa (7).png'),(1009,'sofa (8).png'),(1010,'sofa (9).png'),(1011,'sofa (10).png'),(1012,'sofa (11).png'),(1001,'sofab (1).jpg'),(1001,'sofab (2).jpg'),(1001,'sofab (3).jpg'),(1001,'sofab (4).jpg'),(1001,'sofab (5).jpg'),(1001,'sofab (6).jpg'),(1001,'sofab (7).jpg');
/*!40000 ALTER TABLE `fpic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furn`
--

DROP TABLE IF EXISTS `furn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `furn` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(120) NOT NULL,
  `fstock` int(11) NOT NULL,
  `fprice` double(6,2) NOT NULL,
  `ftype` varchar(20) NOT NULL,
  `fsellno` int(10) DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furn`
--

LOCK TABLES `furn` WRITE;
/*!40000 ALTER TABLE `furn` DISABLE KEYS */;
INSERT INTO `furn` VALUES (1001,'本色笔记',2005,3888.00,'沙发',0),(1002,'弧光圆舞',2500,5888.00,'沙发',0),(1003,'Zest One',2101,7888.00,'沙发',0),(1004,'夏洛克公寓',2103,6888.00,'沙发',0),(1005,'鸢尾花开',1000,7888.00,'沙发',0),(1006,'绿野仙踪',2000,6888.00,'沙发',0),(1007,'魔术师',2004,5888.00,'沙发',0),(1008,'蓝调探戈',1003,6888.00,'沙发',0),(1009,'天鹅倒影',1005,7888.00,'沙发',0),(1010,'落落星辰',1360,5888.00,'沙发',0),(1011,'清枫物语',1000,5888.00,'沙发',0),(1012,'云海蓝珊',500,8888.00,'沙发',0),(2001,'本色笔记',2500,3888.00,'床',0),(2002,'弧光圆舞',2500,5888.00,'床',0),(2003,'Zest One',2500,7888.00,'床',0),(2004,'夏洛克公寓',2500,6888.00,'床',0),(2005,'鸢尾花开',2500,7888.00,'床',0),(2006,'绿野仙踪',2500,5888.00,'床',0),(2007,'魔术师',2500,5888.00,'床',0),(2008,'蓝调探戈',2500,6888.00,'床',0),(2009,'天鹅倒影',2500,7888.00,'床',0),(2010,'落落星辰',2500,5888.00,'床',0),(2011,'清枫物语',2500,5888.00,'床',0),(2012,'云海蓝珊',2500,8888.00,'床',0);
/*!40000 ALTER TABLE `furn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `userpwd` varchar(20) NOT NULL,
  `useremail` varchar(30) NOT NULL,
  `usertel` varchar(20) NOT NULL,
  PRIMARY KEY (`usertel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('oneName','123456','11111@126.com','15698439321'),('root','root','root@root.com','18888888888');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishcart`
--

DROP TABLE IF EXISTS `wishcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishcart` (
  `usertel` varchar(20) NOT NULL,
  `fid` bigint(20) NOT NULL,
  `stype` int(11) NOT NULL,
  `fnumber` int(11) DEFAULT '1',
  KEY `fk_carttel` (`usertel`),
  KEY `fk_cartfid` (`fid`),
  CONSTRAINT `fk_cartfid` FOREIGN KEY (`fid`) REFERENCES `furn` (`fid`),
  CONSTRAINT `fk_carttel` FOREIGN KEY (`usertel`) REFERENCES `user` (`usertel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishcart`
--

LOCK TABLES `wishcart` WRITE;
/*!40000 ALTER TABLE `wishcart` DISABLE KEYS */;
INSERT INTO `wishcart` VALUES ('15698439321',1003,1,1);
/*!40000 ALTER TABLE `wishcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 11:31:57
