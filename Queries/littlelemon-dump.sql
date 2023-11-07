-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `TableNumber` int NOT NULL,
  `Customer_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Bookings_Customer1_idx` (`Customer_Id`),
  CONSTRAINT `fk_Bookings_Customer1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-11-02 17:00:00',2,1),(2,'2023-11-02 18:00:00',1,2),(3,'2023-11-02 19:30:00',3,3),(4,'2023-11-03 17:20:00',5,4),(5,'2023-11-04 18:00:00',4,5),(6,'2023-11-04 18:00:00',6,6),(7,'2023-10-10 18:00:00',5,1),(8,'2023-11-12 17:00:00',3,3),(9,'2023-10-11 18:20:00',2,2),(10,'2023-10-13 19:00:00',2,1),(11,'2023-11-02 19:30:00',1,9),(12,'2023-11-02 21:00:00',1,11);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Phone` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Lana','Banana',33334444),(2,'Keith','Bridges',44445555),(3,'Jackie','Morrone',44556666),(4,'Hanna','Wang',55556666),(5,'Diana','Lonkovska',33335599),(6,'Olena','Svizha',34557890),(7,'Kelly','Melly',46593468),(8,'Tiana','Ward',45732266),(9,'Lila','Lolarie',22223333),(11,'Lily','Command',44455555);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Cuisine` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Italian'),(2,'Ukrainian'),(3,'French');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menyitem`
--

DROP TABLE IF EXISTS `menyitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menyitem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Menu_Id` int NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_MenyItem_Menu1_idx` (`Menu_Id`),
  CONSTRAINT `fk_MenyItem_Menu1` FOREIGN KEY (`Menu_Id`) REFERENCES `menu` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menyitem`
--

LOCK TABLES `menyitem` WRITE;
/*!40000 ALTER TABLE `menyitem` DISABLE KEYS */;
INSERT INTO `menyitem` VALUES (1,'Varenyky',2,'Main',130.00),(2,'Varenyky',2,'Main',130.00),(3,'Varenyky with meat',2,'Main',140.00),(4,'Varenyky with cabbage',2,'Main',100.00),(5,'Varenyky with mashed potato',2,'Main',90.00),(6,'Varenyky in assortment',2,'Main',120.00),(7,'Borsch',2,'Soup',150.00),(8,'Baked sausages with sause and baked potato',2,'Main',250.00),(9,'Mashed potato',2,'Side dish',60.00),(10,'Deruny',2,'Side dish',70.00),(11,'Holybtsi with meat',2,'Main',200.00),(12,'Banosh with dressings',2,'Main',150.00),(13,'Varenyky with strawberries',2,'Dessert',100.00),(14,'Smetannyk',2,'Dessert',130.00),(15,'Boiled potatoes and herring',2,'Starters',150.00),(16,'Bread with salo and horseradish',2,'Starters',110.00),(17,'Eggplant rolls',2,'Starters',90.00),(18,'Horilka',2,'Drink',70.00),(19,'White homemade wine',2,'Drink',50.00),(20,'Red homemade wine',2,'Drink',50.00),(21,'Kompot',2,'Drink',30.00),(22,'Juice',2,'Drink',40.00),(23,'Pizza Margarita',1,'Main',200.00),(24,'Pizza 4 Cheese',1,'Main',250.00),(25,'Pizza siciliana',1,'Main',210.00),(26,'Pizza alla napoletana',1,'Main',200.00),(27,'Risotto',1,'Main',170.00),(28,'Tiramisy',1,'Dessert',150.00),(29,'Spaghetti alla Carbonara ',1,'Main',180.00),(30,'Lasagne',1,'Main',220.00),(31,'Ravioli ',1,'Main',160.00),(32,'Burrata al tartufo',1,'Starters',100.00),(33,'Sicilian salada ',1,'Starters',150.00),(34,'Red Wine',1,'Drink',70.00),(35,'White Wine',1,'Drink',70.00),(36,'Beef Burgundy',3,'Main',250.00),(37,'Quiche Lorraine',3,'Main',190.00),(38,'Croque monsieur',3,'Main',110.00),(39,'Croque Madame on Brioche',3,'Main',100.00),(40,'Cheese Puffs ',3,'Starters',130.00),(41,'French onion soup',3,'Soup',100.00),(42,'Salmon Terrine',3,'Starters',170.00),(43,'Brie Cheese Appetizer',3,'Starters',90.00),(44,'Creme brulee',3,'Dessert',130.00),(45,'Eclair',3,'Dessert',80.00),(46,'Red Wine',3,'Drink',70.00),(47,'White Wine',3,'Drink',70.00);
/*!40000 ALTER TABLE `menyitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystate`
--

DROP TABLE IF EXISTS `orderdeliverystate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystate` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) NOT NULL,
  `Date` datetime NOT NULL,
  `Orders_Id` int NOT NULL,
  `Staff_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_OrderDeliveryState_Orders1_idx` (`Orders_Id`),
  KEY `fk_OrderDeliveryState_Staff1_idx` (`Staff_Id`),
  CONSTRAINT `fk_OrderDeliveryState_Orders1` FOREIGN KEY (`Orders_Id`) REFERENCES `orders` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderDeliveryState_Staff1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystate`
--

LOCK TABLES `orderdeliverystate` WRITE;
/*!40000 ALTER TABLE `orderdeliverystate` DISABLE KEYS */;
INSERT INTO `orderdeliverystate` VALUES (1,'Done','2023-11-02 17:50:00',1,3),(2,'Done','2023-11-02 18:40:00',2,2),(3,'In Delivery','2023-11-02 19:35:00',3,3),(4,'Waiting for a Waiter','2023-11-03 18:10:00',4,6),(5,'Preparing','2023-11-03 18:20:00',5,1);
/*!40000 ALTER TABLE `orderdeliverystate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermenyitem`
--

DROP TABLE IF EXISTS `ordermenyitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordermenyitem` (
  `MenyItem_Id` int NOT NULL,
  `Orders_Id` int NOT NULL,
  KEY `fk_OrderMenyItem_MenyItem1_idx` (`MenyItem_Id`),
  KEY `fk_OrderMenyItem_Orders1_idx` (`Orders_Id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_OrderMenyItem_MenyItem1` FOREIGN KEY (`MenyItem_Id`) REFERENCES `menyitem` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderMenyItem_Orders1` FOREIGN KEY (`Orders_Id`) REFERENCES `orders` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermenyitem`
--

LOCK TABLES `ordermenyitem` WRITE;
/*!40000 ALTER TABLE `ordermenyitem` DISABLE KEYS */;
INSERT INTO `ordermenyitem` VALUES (1,1),(7,1),(6,1),(10,1),(8,1),(15,1),(18,1),(19,1),(20,1),(1,2),(5,2),(4,2),(18,2),(18,2),(21,2),(23,3),(28,3),(34,3),(34,3),(34,3),(35,3),(30,4),(27,4),(34,4),(35,4),(36,5),(37,5),(45,5),(42,5),(46,5),(47,5);
/*!40000 ALTER TABLE `ordermenyitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `Bookings_Id` int NOT NULL,
  PRIMARY KEY (`Id`,`Bookings_Id`),
  KEY `fk_Orders_Bookings1_idx` (`Bookings_Id`),
  CONSTRAINT `fk_Orders_Bookings1` FOREIGN KEY (`Bookings_Id`) REFERENCES `bookings` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-11-02 17:15:00',1,1040.00,1),(2,'2023-11-02 18:10:00',1,490.00,2),(3,'2023-11-02 19:35:00',2,630.00,3),(4,'2023-11-03 17:35:00',1,530.00,4),(5,'2023-11-03 17:50:00',3,830.00,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `Id`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Maria','Horlovska','Manager',25000.00),(2,'Olena','Voloshina','Waiter',19000.00),(3,'Oleg','Pansky','Waiter',19000.00),(4,'Khrystyna','Graivoron','Chef',28000.00),(5,'Dmytro','Karmansky','Sous Chef',21000.00),(6,'Lilly','Korosten','Waiter',17000.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `o`.`Id` AS `Id`,`o`.`Quantity` AS `Quantity`,`o`.`TotalCost` AS `TotalCost` from `orders` `o` where (`o`.`Quantity` > 2) */;
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

-- Dump completed on 2023-11-07 15:52:12
