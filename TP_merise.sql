CREATE DATABASE  IF NOT EXISTS `tp_merise` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tp_merise`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_merise
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competence` (
  `idcompetence` int NOT NULL,
  `intCompetence` varchar(45) DEFAULT NULL,
  `codeNiv` int NOT NULL,
  PRIMARY KEY (`idcompetence`),
  KEY `fk_comp_niv_idx` (`codeNiv`),
  CONSTRAINT `fk_comp_niv` FOREIGN KEY (`codeNiv`) REFERENCES `nivcomp` (`Codeniv`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nivcomp`
--

DROP TABLE IF EXISTS `nivcomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivcomp` (
  `Codeniv` int NOT NULL,
  `designNiv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codeniv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posseder` (
  `numsal` int NOT NULL,
  `idcomp` int NOT NULL,
  PRIMARY KEY (`numsal`,`idcomp`),
  KEY `fk_posseder_comp_idx` (`idcomp`),
  CONSTRAINT `fk_posseder_comp` FOREIGN KEY (`idcomp`) REFERENCES `competence` (`idcompetence`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_posseder_salarié` FOREIGN KEY (`numsal`) REFERENCES `salarié` (`numSal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poste`
--

DROP TABLE IF EXISTS `poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poste` (
  `numPost` int NOT NULL,
  `designPost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salarié`
--

DROP TABLE IF EXISTS `salarié`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarié` (
  `numSal` int NOT NULL,
  `nomSal` varchar(45) DEFAULT NULL,
  `promSal` varchar(45) DEFAULT NULL,
  `genre` varchar(1) DEFAULT NULL,
  `dateNais` date DEFAULT NULL,
  `dateEmb` date DEFAULT NULL,
  `numPost` int NOT NULL,
  PRIMARY KEY (`numSal`),
  KEY `fk_salarié_poste_idx` (`numPost`),
  CONSTRAINT `fk_salarié_poste` FOREIGN KEY (`numPost`) REFERENCES `poste` (`numPost`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-13  0:05:10
