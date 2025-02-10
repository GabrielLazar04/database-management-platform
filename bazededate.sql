-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: proiect_lazar
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `animale`
--

DROP TABLE IF EXISTS `animale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animale` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `specie` varchar(45) DEFAULT NULL,
  `nume` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animale`
--

LOCK TABLES `animale` WRITE;
/*!40000 ALTER TABLE `animale` DISABLE KEYS */;
INSERT INTO `animale` VALUES (15,'câine','Aldo'),(18,'crocodil','frank');
/*!40000 ALTER TABLE `animale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristici`
--

DROP TABLE IF EXISTS `caracteristici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristici` (
  `idcaracteristic` int NOT NULL AUTO_INCREMENT,
  `numecaracteristica` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcaracteristic`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristici`
--

LOCK TABLES `caracteristici` WRITE;
/*!40000 ALTER TABLE `caracteristici` DISABLE KEYS */;
INSERT INTO `caracteristici` VALUES (4,'vârstă'),(13,'trai'),(17,'model');
/*!40000 ALTER TABLE `caracteristici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristici_animale`
--

DROP TABLE IF EXISTS `caracteristici_animale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristici_animale` (
  `idcaracteristici_animale` int NOT NULL AUTO_INCREMENT,
  `mediu` varchar(45) DEFAULT NULL,
  `id_animal` int DEFAULT NULL,
  `idcaracteristic` int DEFAULT NULL,
  PRIMARY KEY (`idcaracteristici_animale`),
  KEY `fk1_idx` (`id_animal`),
  KEY `fk2_idx` (`idcaracteristic`),
  CONSTRAINT `fk1` FOREIGN KEY (`id_animal`) REFERENCES `animale` (`id_animal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`idcaracteristic`) REFERENCES `caracteristici` (`idcaracteristic`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristici_animale`
--

LOCK TABLES `caracteristici_animale` WRITE;
/*!40000 ALTER TABLE `caracteristici_animale` DISABLE KEYS */;
INSERT INTO `caracteristici_animale` VALUES (9,'urban',15,4),(15,'acvatic',18,4);
/*!40000 ALTER TABLE `caracteristici_animale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 19:50:15
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: proiect_lazar_spring
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `idanimal` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  PRIMARY KEY (`idanimal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (2,'kasy'),(3,'aldo'),(4,'moft');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buletin`
--

DROP TABLE IF EXISTS `buletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buletin` (
  `idbuletin` bigint NOT NULL AUTO_INCREMENT,
  `mediu` varchar(255) NOT NULL,
  `id_animal` bigint NOT NULL,
  `idcaracteristici` bigint NOT NULL,
  PRIMARY KEY (`idbuletin`),
  KEY `FK6l6bt1r7biklhsbdp9vwvmvb5` (`id_animal`),
  KEY `FKk9scmrk2vugabjh5dfcs3fbm5` (`idcaracteristici`),
  CONSTRAINT `FK6l6bt1r7biklhsbdp9vwvmvb5` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`idanimal`),
  CONSTRAINT `FKk9scmrk2vugabjh5dfcs3fbm5` FOREIGN KEY (`idcaracteristici`) REFERENCES `caracteristici` (`idcaracteristici`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buletin`
--

LOCK TABLES `buletin` WRITE;
/*!40000 ALTER TABLE `buletin` DISABLE KEYS */;
INSERT INTO `buletin` VALUES (2,'sălbatic',2,2),(3,'12',2,2);
/*!40000 ALTER TABLE `buletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristici`
--

DROP TABLE IF EXISTS `caracteristici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristici` (
  `idcaracteristici` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  PRIMARY KEY (`idcaracteristici`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristici`
--

LOCK TABLES `caracteristici` WRITE;
/*!40000 ALTER TABLE `caracteristici` DISABLE KEYS */;
INSERT INTO `caracteristici` VALUES (2,'vârstă'),(3,'problema');
/*!40000 ALTER TABLE `caracteristici` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 19:50:15
