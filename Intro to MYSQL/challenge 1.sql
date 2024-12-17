-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carinventorydb
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
  `VIN` char(17) NOT NULL,
  `Manufacturer` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES ('0','Volkswagen','Tiguan',2019,'Blue'),('1','Peugeot','Rifter',2019,'Red'),('2','Ford','Fusion',2018,'White'),('3','Toyota','RAV4',2018,'Silver'),('4','Volvo','V60',2019,'Gray'),('5','Volvo','V60 Cross Country',2019,'Gray'),('6','Honda','Civic',2020,'Black');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chope','Madrid','Madrid','Spain','28045'),(2,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States','33130'),(3,'Napoleon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France','75008');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
/*!50001 DROP VIEW IF EXISTS `invoicedetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `invoicedetails` AS SELECT 
 1 AS `InvoiceID`,
 1 AS `Date`,
 1 AS `Manufacturer`,
 1 AS `Model`,
 1 AS `CustomerName`,
 1 AS `SalespersonName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `InvoiceID` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `CarVIN` char(17) DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `CarVIN` (`CarVIN`),
  KEY `CustomerID` (`CustomerID`),
  KEY `StaffID` (`StaffID`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`CarVIN`) REFERENCES `cars` (`VIN`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `salespersons` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'2018-08-22','0',1,1),(2,'2018-12-31','3',2,2),(3,'2019-01-22','2',3,3);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salespersons`
--

DROP TABLE IF EXISTS `salespersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salespersons` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Store` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salespersons`
--

LOCK TABLES `salespersons` WRITE;
/*!40000 ALTER TABLE `salespersons` DISABLE KEYS */;
INSERT INTO `salespersons` VALUES (1,'Petey Cruiser','Store 0'),(2,'Anna Sthesia','Store 1'),(3,'Paul Molive','Store 2'),(4,'Gail Forcewind','Store 3'),(5,'Paige Turner','Store 4'),(6,'Bob Frapples','Store 5'),(7,'Walter Melon','Store 6'),(8,'Shonda Leer','São Paulo');
/*!40000 ALTER TABLE `salespersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `invoicedetails`
--

/*!50001 DROP VIEW IF EXISTS `invoicedetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoicedetails` AS select `invoices`.`InvoiceID` AS `InvoiceID`,`invoices`.`Date` AS `Date`,`cars`.`Manufacturer` AS `Manufacturer`,`cars`.`Model` AS `Model`,`customers`.`Name` AS `CustomerName`,`salespersons`.`Name` AS `SalespersonName` from (((`invoices` join `cars` on((`invoices`.`CarVIN` = `cars`.`VIN`))) join `customers` on((`invoices`.`CustomerID` = `customers`.`CustomerID`))) join `salespersons` on((`invoices`.`StaffID` = `salespersons`.`StaffID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 13:01:13
