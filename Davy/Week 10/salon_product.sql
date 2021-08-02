-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: salon
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `unit_size` varchar(45) DEFAULT NULL,
  `price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`Product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Shampoo','Product','8 02',4.95),(2,'Shampoo','Product','16 02',8.95),(3,'Conditioner','Product','12 02',8.95),(4,'Hairspray','Product','8 02',7.95),(5,' Shampoo','Service',NULL,8.00),(6,'Men Hair Cut','Service',NULL,15.00),(7,'Women Hair Cut','Service',NULL,25.00),(8,' Color','Service',NULL,50.00),(9,'Pers','Service',NULL,60.00),(10,'Shampoo','Product','8 02',4.95),(11,'Shampoo','Product','16 02',8.95),(12,'Conditioner','Product','12 02',8.95),(13,'Hairspray','Product','8 02',7.95),(14,' Shampoo','Service',NULL,8.00),(15,'Men Hair Cut','Service',NULL,15.00),(16,'Women Hair Cut','Service',NULL,25.00),(17,' Color','Service',NULL,50.00),(18,'Pers','Service',NULL,60.00),(19,'Shampoo','Product','8 02',4.95),(20,'Shampoo','Product','16 02',8.95),(21,'Conditioner','Product','12 02',8.95),(22,'Hairspray','Product','8 02',7.95),(23,' Shampoo','Service',NULL,8.00),(24,'Men Hair Cut','Service',NULL,15.00),(25,'Women Hair Cut','Service',NULL,25.00),(26,' Color','Service',NULL,50.00),(27,'Pers','Service',NULL,60.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-23 14:53:08
