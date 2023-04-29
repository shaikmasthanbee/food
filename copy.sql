-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additems`
--

DROP TABLE IF EXISTS `additems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additems` (
  `itemid` varchar(9) NOT NULL,
  `itemname` varchar(30) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `category` enum('South India','North India','Chinese','French') DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `rid` (`rid`),
  CONSTRAINT `additems_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additems`
--

LOCK TABLES `additems` WRITE;
/*!40000 ALTER TABLE `additems` DISABLE KEYS */;
INSERT INTO `additems` VALUES ('A8tF0rF3h','Chicken Bun',120,'Chinese',852),('B1qM5mU9x','parota',40,'South India',852),('B7iJ1mT3w','vada',35,'South India',852),('C9bA3nA3n','veg roll',150,'French',852),('E6sM9lF6y','South India',30,'South India',852),('F3oT0zM2y','Dosa',25,'South India',852),('G5rK1lV5e','puri',40,'South India',852),('I0vG9fA5y','punugulu',60,'South India',852),('J1hE2gZ3h','Rice',100,'South India',1),('J1wY2zW5z','chese cake',90,'French',852),('J5yT7eI9l','North Bryani',250,'North India',852),('J8vI4fB6a','Rice',100,'South India',852),('K3nZ6tX2b','soup',120,'Chinese',852),('K5iB4yI0m','chapati',30,'North India',852),('M4pA2xY5g','chicken',200,'French',852),('N0yD6sA5x','Bun',60,'French',852),('P0tN0sZ0j','chapati with milymakers',100,'North India',852),('P2rF3dT0g','chicken puff',80,'French',852),('Q0wJ6hR5a','pizza',200,'French',852),('Q3aR9vT3m','chapati Roll',160,'French',852),('Q7aK8vL1a','Chicken Sticks',130,'Chinese',852),('Q7pF9fP6z','chapati with milymakers',100,'North India',852),('R3wV9sP2d','Noodiles',80,'Chinese',852),('R4sF3cT7z','chapati with gulabjam',130,'North India',1),('R8jS9rD8r','Roles',80,'Chinese',852),('U1rB3uI9h','burgur',120,'French',852),('U2mN4dM0j','Manchuriya',80,'Chinese',852),('U5uR4aY3c','Pasta',200,'Chinese',852),('V3nX0uA6x','Desi Roll',180,'French',852),('X0pB4hL6t','potato pops',130,'Chinese',852);
/*!40000 ALTER TABLE `additems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `Name` varchar(20) DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `itemid` varchar(9) DEFAULT NULL,
  `itemname` varchar(30) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `uname` char(15) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `itemid` (`itemid`),
  KEY `uname` (`uname`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `additems` (`itemid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `users` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'B1qM5mU9x','parota',1,852,'bhagi'),(2,'B1qM5mU9x','parota',1,852,'bhagi'),(3,'B1qM5mU9x','parota',1,852,'bhagi'),(4,'J1hE2gZ3h','Rice',1,100,'bhagi');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `rid` int NOT NULL,
  `rname` varchar(15) DEFAULT NULL,
  `rplace` varchar(20) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'rr Darbar','vijayawada','bhagi','bhargavasai288@gmail.com'),(23,'harika','vijayawada','harika','bhargavasai288@gmail.com'),(45,'harika','vijayawada','harika','masthanbeeshaik19@gmail.com'),(852,'rr Darbar','vijayawada','meghana','bhargavasai288@gmail.com');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uname` char(15) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `Gender` char(6) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  PRIMARY KEY (`uname`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('anu',112233445,'female','masthanbeeshaik17@gmail.com','food'),('bhagavi',9989185691,'female','bhargavasai288@gmail.com','bhagi'),('bhagi',9989185696,'female','bhargavasai288@gmail.com','bhagi'),('harika',9032464534,'female','kondetiharika11@gmail.com','harika'),('masthanbee',9014885840,'female','bhargavasai288@gmail.com','bhagi'),('mastii',9014885810,'female','masthanbeeshaik19@gmail.com','bhagi'),('sai',9866694981,'female','bhargavasai288@gmail.com','bhagi'),('sita',998918569,'female','bhargavasai288@gmail.com','bhagi'),('Sk. Masthanbee',9989165489,'female','bhargavasai288@gmail.com','admin'),('swati',997788445,'female','bhargavasai288@gmail.com','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-27 20:05:00
