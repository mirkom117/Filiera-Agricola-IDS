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
-- Table structure for table `supply_chain_points`
--

DROP TABLE IF EXISTS `supply_chain_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_chain_points` (
  `supply_chain_id` varchar(255) NOT NULL,
  `points_id` varchar(255) NOT NULL,
  UNIQUE KEY `UKa5dwc2wiq1rssuudswsf1tse6` (`points_id`),
  KEY `FKtmbai3d2pk72jkbg56bhsv6lk` (`supply_chain_id`),
  CONSTRAINT `FKkjp639lko7ecfpwcp85hfp06w` FOREIGN KEY (`points_id`) REFERENCES `supply_chain_point` (`id`),
  CONSTRAINT `FKtmbai3d2pk72jkbg56bhsv6lk` FOREIGN KEY (`supply_chain_id`) REFERENCES `supply_chain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_chain_points`
--

LOCK TABLES `supply_chain_points` WRITE;
/*!40000 ALTER TABLE `supply_chain_points` DISABLE KEYS */;
INSERT INTO `supply_chain_points` VALUES ('8a8f219c-9b1a-4b1f-9c1e-9d7a2b9e6f3d','a1b2c3d4-e5f6-4a1b-8c2d-3e4f5a6b7c8d'),('8a8f219c-9b1a-4b1f-9c1e-9d7a2b9e6f3d','b2c3d4e5-f6a7-4b2c-9d3e-4f5a6b7c8d9e'),('agriturismo_di_paganico_default_1758876844797','1bfec589-297b-4c6b-8ca3-3b3333829df9'),('agriturismo_di_paganico_default_1758876844797','e3cb88e8-fb8f-49c7-9461-bfcb99d46677'),('f4b3e2a1-c0d9-4e8f-a9b8-c7d6e5f4b3a2','c3d4e5f6-a7b8-4c3d-ae4f-5a6b7c8d9e0f'),('f4b3e2a1-c0d9-4e8f-a9b8-c7d6e5f4b3a2','d4e5f6a7-b8c9-4d4e-bf5a-6b7c8d9e0f1a'),('società_agricola_la_rinascita_default_1758876973213','42e37eaf-262b-46ba-8fa3-824bf276ef55'),('società_agricola_la_rinascita_default_1758876973213','5c3af0fd-59f6-4073-a339-c017cd8c7a38');
/*!40000 ALTER TABLE `supply_chain_points` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 10:27:51
