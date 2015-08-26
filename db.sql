-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: RJRecording
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

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
-- Table structure for table `wordinfo`
--

DROP TABLE IF EXISTS `wordinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordinfo` (
  `wordid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(250) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`wordid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordinfo`
--

LOCK TABLES `wordinfo` WRITE;
/*!40000 ALTER TABLE `wordinfo` DISABLE KEYS */;
INSERT INTO `wordinfo` VALUES (1,'前进','2014-09-23 13:46:00','remark'),(2,'后退','2014-09-23 13:46:00','remark'),(3,'左转','2014-09-23 13:46:00','remark'),(4,'右转','2014-09-23 13:46:00','remark'),(5,'停下','2014-09-23 13:46:00','remark'),(6,'继续','2014-09-23 13:46:00','remark'),(7,'加速','2014-09-23 13:46:00','remark'),(8,'减速','2014-09-23 13:46:00','remark'),(9,'全速','2014-09-23 13:46:00','remark'),(10,'半速','2014-09-23 13:46:00','remark'),(11,'帮助','2014-09-23 13:46:00','remark'),(12,'关闭','2014-09-23 13:46:00','remark'),(13,'取消','2014-09-23 13:46:00','remark'),(14,'很好','2014-09-23 13:46:00','remark'),(15,'导航','2014-09-23 13:46:00','remark'),(16,'跟踪','2014-09-23 13:46:00','remark'),(17,'人','2014-09-23 13:46:00','remark'),(18,'脸','2014-09-23 13:46:00','remark'),(19,'识别','2014-09-23 13:46:00','remark'),(20,'训练','2014-09-23 13:46:00','remark');
/*!40000 ALTER TABLE `wordinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-23 15:16:23
