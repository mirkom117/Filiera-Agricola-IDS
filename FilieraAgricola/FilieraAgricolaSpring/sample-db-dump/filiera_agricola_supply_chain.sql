-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: filiera_agricola
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `supply_chain`
--

DROP TABLE IF EXISTS `supply_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_chain` (
  `id` varchar(255) NOT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `territorial_area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_chain`
--

LOCK TABLES `supply_chain` WRITE;
/*!40000 ALTER TABLE `supply_chain` DISABLE KEYS */;
INSERT INTO `supply_chain` VALUES ('8a8f219c-9b1a-4b1f-9c1e-9d7a2b9e6f3d','2023-05-15 00:00:00.000000','Filiera dedicata alla produzione e distribuzione di olio extra vergine di oliva biologico dalle colline marchigiane, con tracciabilità completa dal campo alla tavola.','Filiera Olio EVO Bio delle Marche','Regione Marche, Italia'),('agriturismo_di_paganico_default_1758876844797','2025-09-26 10:54:04.806000','Supply chain for Agriturismo di Paganico','Agriturismo di Paganico','default'),('f4b3e2a1-c0d9-4e8f-a9b8-c7d6e5f4b3a2','2022-09-01 00:00:00.000000','Filiera corta per la produzione di formaggi a latte crudo di pecora e la loro vendita diretta nei mercati locali, valorizzando le tradizioni casearie del territorio.','Formaggi Artigianali dei Sibillini','Parco Nazionale dei Monti Sibillini'),('società_agricola_la_rinascita_default_1758876973213','2025-09-26 10:56:13.213000','Supply chain for Società agricola la rinascita','Società agricola la rinascita','default');
/*!40000 ALTER TABLE `supply_chain` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 10:27:53
