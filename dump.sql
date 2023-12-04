CREATE DATABASE  IF NOT EXISTS `aviokompanija` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aviokompanija`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aviokompanija
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwordHash` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `country_ID` int DEFAULT NULL,
  PRIMARY KEY (`account_ID`),
  UNIQUE KEY `email` (`email`),
  KEY `country_ID` (`country_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`country_ID`) REFERENCES `country` (`country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role` (
  `adminAccount_ID` int NOT NULL,
  `role_ID` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`adminAccount_ID`,`role_ID`),
  KEY `role_ID` (`role_ID`),
  CONSTRAINT `admin_role_ibfk_1` FOREIGN KEY (`adminAccount_ID`) REFERENCES `adminaccount` (`adminAccount_ID`),
  CONSTRAINT `admin_role_ibfk_2` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminaccount`
--

DROP TABLE IF EXISTS `adminaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminaccount` (
  `adminAccount_ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwordHash` varchar(50) NOT NULL,
  PRIMARY KEY (`adminAccount_ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminaccount`
--

LOCK TABLES `adminaccount` WRITE;
/*!40000 ALTER TABLE `adminaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_ID` int NOT NULL AUTO_INCREMENT,
  `town_id` int DEFAULT NULL,
  PRIMARY KEY (`airport_ID`),
  KEY `town_id` (`town_id`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`town_id`) REFERENCES `town` (`town_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Hrvatska'),(2,'Francuska'),(3,'Engleska'),(4,'Njemačka'),(5,'Brazil'),(6,'Sjedinjene Američke Države'),(7,'Ujedinjeni Arapski Emirati');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_ID` int NOT NULL AUTO_INCREMENT,
  `dateOfDeparture` date NOT NULL,
  `departureTimeDate` datetime DEFAULT NULL,
  `arrivalTimeDate` datetime DEFAULT NULL,
  `timeZone` varchar(50) DEFAULT NULL,
  `plane_ID` int DEFAULT NULL,
  `departureAirport_ID` int DEFAULT NULL,
  `destinationAirport_ID` int DEFAULT NULL,
  `extraBaggagePrice` decimal(3,2) NOT NULL,
  `flightInsurancePrice` decimal(3,2) NOT NULL,
  `timezone_ID` int DEFAULT NULL,
  `arrivalTimeZone_ID` int DEFAULT NULL,
  `departureTimeZone_ID` int DEFAULT NULL,
  PRIMARY KEY (`flight_ID`),
  KEY `timezone_ID` (`timezone_ID`),
  KEY `departureAirport_ID` (`departureAirport_ID`),
  KEY `destinationAirport_ID` (`destinationAirport_ID`),
  KEY `plane_ID` (`plane_ID`),
  KEY `departureTimeZone_ID` (`departureTimeZone_ID`),
  KEY `arrivalTimeZone_ID` (`arrivalTimeZone_ID`),
  CONSTRAINT `flight_ibfk_10` FOREIGN KEY (`departureTimeZone_ID`) REFERENCES `timezone` (`timezone_ID`),
  CONSTRAINT `flight_ibfk_11` FOREIGN KEY (`arrivalTimeZone_ID`) REFERENCES `timezone` (`timezone_ID`),
  CONSTRAINT `flight_ibfk_7` FOREIGN KEY (`departureAirport_ID`) REFERENCES `airport` (`airport_ID`),
  CONSTRAINT `flight_ibfk_8` FOREIGN KEY (`destinationAirport_ID`) REFERENCES `airport` (`airport_ID`),
  CONSTRAINT `flight_ibfk_9` FOREIGN KEY (`plane_ID`) REFERENCES `plane` (`plane_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_travelclass`
--

DROP TABLE IF EXISTS `flight_travelclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_travelclass` (
  `flight_ID` int NOT NULL,
  `travelClass_ID` int NOT NULL,
  `adultSeatPrice` decimal(4,2) NOT NULL,
  `childSeatPrice` decimal(4,2) NOT NULL,
  PRIMARY KEY (`flight_ID`,`travelClass_ID`),
  KEY `travelClass_ID` (`travelClass_ID`),
  CONSTRAINT `flight_travelclass_ibfk_1` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`flight_ID`),
  CONSTRAINT `flight_travelclass_ibfk_2` FOREIGN KEY (`travelClass_ID`) REFERENCES `travelclass` (`travelclass_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_travelclass`
--

LOCK TABLES `flight_travelclass` WRITE;
/*!40000 ALTER TABLE `flight_travelclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_travelclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane`
--

DROP TABLE IF EXISTS `plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane` (
  `plane_ID` int NOT NULL AUTO_INCREMENT,
  `numberOfSeats` int NOT NULL,
  PRIMARY KEY (`plane_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane`
--

LOCK TABLES `plane` WRITE;
/*!40000 ALTER TABLE `plane` DISABLE KEYS */;
INSERT INTO `plane` VALUES (1,150),(2,200),(3,150),(4,170),(5,200),(6,180);
/*!40000 ALTER TABLE `plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_ID` int NOT NULL AUTO_INCREMENT,
  `account_ID` int DEFAULT NULL,
  `flight_ID` int DEFAULT NULL,
  `seat_ID` int DEFAULT NULL,
  `extraBaggage` tinyint(1) NOT NULL,
  `flightInsurance` tinyint(1) NOT NULL,
  PRIMARY KEY (`reservation_ID`),
  KEY `seat_ID` (`seat_ID`),
  KEY `flight_ID` (`flight_ID`),
  KEY `account_ID` (`account_ID`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`seat_ID`) REFERENCES `seat` (`seat_ID`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`flight_ID`),
  CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`account_ID`) REFERENCES `account` (`account_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Operativno osoblje'),(3,'Sigurnono osoblje'),(4,'Posada'),(5,'Komercijalno osoblje');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_ID` int NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL,
  `travelClass_ID` int DEFAULT NULL,
  `plane_ID` int DEFAULT NULL,
  PRIMARY KEY (`seat_ID`),
  KEY `plane_ID` (`plane_ID`),
  KEY `travelClass_ID` (`travelClass_ID`),
  CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`plane_ID`) REFERENCES `plane` (`plane_ID`),
  CONSTRAINT `seat_ibfk_3` FOREIGN KEY (`travelClass_ID`) REFERENCES `travelclass` (`travelclass_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezone` (
  `timezone_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hour_diff` int NOT NULL,
  PRIMARY KEY (`timezone_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES (1,'UTC',0),(2,'EST',-5),(3,'PST',-8),(4,'AST',-4),(5,'UTC-3',-3),(6,'CET',1),(7,'UTC+4',4);
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `town_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`town_ID`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `town_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (1,'Zagreb',1),(2,'Split',1),(3,'Berlin',4),(4,'Munchen',4),(5,'Pariz',2),(6,'Lyon',2),(7,'London',3),(8,'Manchester',3),(9,'Rio de Janiero',5),(10,'New York',6),(11,'Washington',6),(12,'Dubai',7);
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelclass`
--

DROP TABLE IF EXISTS `travelclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelclass` (
  `travelclass_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`travelclass_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelclass`
--

LOCK TABLES `travelclass` WRITE;
/*!40000 ALTER TABLE `travelclass` DISABLE KEYS */;
INSERT INTO `travelclass` VALUES (1,'Economy'),(2,'Business'),(3,'First Class');
/*!40000 ALTER TABLE `travelclass` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 15:33:18
