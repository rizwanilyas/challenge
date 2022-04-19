-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: challenge
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

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
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'Manufacturing',0),(2,'Servicem',0),(3,'Other',0),(5,'Printing',1),(6,'Food and Beverage',1),(7,'Textile and Clothing',1),(8,'Wood',1),(9,'Plastic and Rubber',1),(11,'Metalworking',1),(12,'Machinery',1),(13,'Furniture',1),(18,'Electronics and Optics',1),(19,'Construction materials',1),(21,'Transport and Logistics',2),(22,'Tourism',2),(25,'Business services',2),(28,'Information Technology and Telecommunications',2),(29,'Energy technology',3),(33,'Environment',3),(35,'Engineering',2),(37,'Creative industries',3),(39,'Milk & dairy products',6),(40,'Meat & meat products',6),(42,'Fish & fish products',6),(43,'Beverages',6),(44,'Clothing',7),(45,'Textile',7),(47,'Wooden houses',8),(51,'Wooden building materials',8),(53,'Plastics welding and processing',559),(54,'Packaging',9),(55,'Blowing',559),(57,'Moulding',559),(62,'Forgings  Fasteners',542),(66,'MIG TIG Aluminum welding',542),(67,'Construction of metal structures',11),(69,'Gas Plasma Laser cutting',542),(75,'CNC-machining',542),(91,'Machinery equipment/tools',12),(93,'Metal structures',12),(94,'Machinery components',12),(97,'Maritime',12),(98,'Kitchen',13),(99,'Project furniture',13),(101,'Living room',13),(111,'Air',21),(112,'Road',21),(113,'Water',21),(114,'Rail',21),(121,'Software Hardware',28),(122,'Telecommunications',28),(141,'Translation services',2),(145,'Labelling and packaging printing',5),(148,'Advertising',5),(150,'Book/Periodicals printing',5),(224,'Manufacture of machinery',12),(227,'Repair and maintenance service',12),(230,'Ship repair and conversion',97),(263,'Houses and buildings',11),(267,'Metal products',11),(269,'Boat/Yacht building',97),(271,'Aluminium and steel workboats',97),(337,'Other (Wood)',8),(341,'Outdoor',13),(342,'Bakery & confectionery products',6),(378,'Sweets & snack food',6),(385,'Bedroom',13),(389,'Bathroom/sauna',13),(390,'Children’s room',13),(392,'Office',13),(394,'Other (Furniture)',13),(437,'Other',6),(508,'Other',12),(542,'Metal works',11),(556,'Plastic goods',9),(559,'Plastic processing technology',9),(560,'Plastic profiles',9),(576,'Programming Consultancy',28),(581,'Data processing  Web portals E-marketing',28);
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agree_to_terms` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'','worker'),(2,'','worker'),(3,'','worker'),(4,'','worker'),(5,'','Yummy'),(6,'','worker'),(7,'','worker'),(8,'','Yahoo');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_sector`
--

DROP TABLE IF EXISTS `worker_sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_sector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sector_id` bigint(20) DEFAULT NULL,
  `worker_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK43hry2nf0iqy7ft8oi0ufedl2` (`sector_id`),
  KEY `FK29g8l1qkbqyyn98andlq8mqy` (`worker_id`),
  CONSTRAINT `FK29g8l1qkbqyyn98andlq8mqy` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`),
  CONSTRAINT `FK43hry2nf0iqy7ft8oi0ufedl2` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_sector`
--

LOCK TABLES `worker_sector` WRITE;
/*!40000 ALTER TABLE `worker_sector` DISABLE KEYS */;
INSERT INTO `worker_sector` VALUES (3,1,2),(4,2,2),(5,1,3),(6,2,3),(12,3,4),(13,2,5),(14,8,5),(15,9,5),(16,1,6),(17,2,6),(18,43,7),(19,44,7),(22,8,1),(23,9,1),(24,1,8),(25,3,8);
/*!40000 ALTER TABLE `worker_sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'challenge'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 23:09:05
