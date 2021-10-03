-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 34.116.176.206    Database: spaceJunk
-- ------------------------------------------------------
-- Server version	8.0.18-google

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '4fa0699b-23bf-11ec-8b8a-42010aba0002:1-49113';

--
-- Table structure for table `spaceObjectsDetails`
--

DROP TABLE IF EXISTS `spaceObjectsDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaceObjectsDetails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Intldes` varchar(50) DEFAULT NULL,
  `NoradCatID` int(11) DEFAULT NULL,
  `ObjectTypeID` int(11) DEFAULT NULL,
  `SatName` varchar(50) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `LaunchCalendarID` int(11) DEFAULT NULL,
  `Site` varchar(20) DEFAULT NULL,
  `DecayCalendarID` int(11) DEFAULT NULL,
  `Period` double DEFAULT NULL,
  `Inclination` double DEFAULT NULL,
  `Apogee` int(11) DEFAULT NULL,
  `Perigee` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `CommentCode` varchar(255) DEFAULT NULL,
  `SizeID` int(11) DEFAULT NULL,
  `File` int(11) DEFAULT NULL,
  `LaunchYear` int(11) DEFAULT NULL,
  `LaunchNum` int(11) DEFAULT NULL,
  `LaunchPiece` varchar(10) DEFAULT NULL,
  `CurrentID` int(11) DEFAULT NULL,
  `rcsvalue` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-03 23:27:31
