-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab_mysql
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `year_` int DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Peugeot','Rifter',2019,'Red'),(2,'Ford','Fusion',2018,'White'),(3,'Toyota','RAV4',2018,'Silver'),(4,'Volvo','V60',2019,'Gray'),(5,'Volvo','V60 Cross Country',2019,'Gray'),(7,'Volkswagen','Tiguan',2019,'Blue');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costumer`
--

DROP TABLE IF EXISTS `costumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costumer` (
  `costumer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`costumer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costumer`
--

LOCK TABLES `costumer` WRITE;
/*!40000 ALTER TABLE `costumer` DISABLE KEYS */;
INSERT INTO `costumer` VALUES (10001,'Pablo','Picasso','+34 636 17 63 82','-','Paseo de la Chopera','Madrid','Madrid','Spain','28045'),(20001,'Abraham','Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States','33130'),(30001,'Napoleon','Bonaparte','+33 1 79 75 40 00','napoleon@france.com','40 Rue du Colisée','Paris','Île-de-France','France','75008');
/*!40000 ALTER TABLE `costumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL,
  `date_` date DEFAULT NULL,
  `cars_car_id` int DEFAULT NULL,
  `costumer_costumer_id` int DEFAULT NULL,
  `salesperson_salesperson_id` int DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `cars_car_id` (`cars_car_id`),
  KEY `costumer_costumer_id` (`costumer_costumer_id`),
  KEY `salesperson_salesperson_id` (`salesperson_salesperson_id`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`cars_car_id`) REFERENCES `cars` (`car_id`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`costumer_costumer_id`) REFERENCES `costumer` (`costumer_id`),
  CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`salesperson_salesperson_id`) REFERENCES `salesperson` (`salesperson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (271135104,'2019-01-22',2,30001,7),(731166526,'2018-12-31',3,20001,5),(852399038,'2018-08-22',0,10001,3);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesperson` (
  `salesperson_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) DEFAULT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`salesperson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
INSERT INTO `salesperson` VALUES (1,'Petey Cruiser','Madrid'),(2,'Anna Sthesia','Barcelona'),(3,'Paul Molive','Berlin'),(4,'Gail Forcewind','Paris'),(5,'Paige Turner','Miami'),(6,'Bob Frapples','Mexico City'),(7,'Walter Melon','Amsterdam'),(8,'Shonda Leer','São Paulo');
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 14:40:06
