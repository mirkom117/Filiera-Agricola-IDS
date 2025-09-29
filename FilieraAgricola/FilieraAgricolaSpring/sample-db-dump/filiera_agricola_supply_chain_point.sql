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
-- Table structure for table `supply_chain_point`
--

DROP TABLE IF EXISTS `supply_chain_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_chain_point` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_chain_point`
--

LOCK TABLES `supply_chain_point` WRITE;
/*!40000 ALTER TABLE `supply_chain_point` DISABLE KEYS */;
INSERT INTO `supply_chain_point` VALUES ('1bfec589-297b-4c6b-8ca3-3b3333829df9','Camerino loc. Raggiano, 8',43.1342,13.03439,'Magazino','+393204578157'),('42e37eaf-262b-46ba-8fa3-824bf276ef55','Pioraco loc. Pienta, 12',43.0956,13.4327,'Magazino','+393775757048'),('5c3af0fd-59f6-4073-a339-c017cd8c7a38','Localita Sellano 2, 62032 Camerino MC',43.15663,13.01929,'Rivendita','+393489703422'),('a1b2c3d4-e5f6-4a1b-8c2d-3e4f5a6b7c8d','Contrada Aso, 123, 63062 Montefiore dell\'Aso, AP',43.0515,13.7512,'Azienda Agricola Rossi - Oliveto','+390734938123'),('b2c3d4e5-f6a7-4b2c-9d3e-4f5a6b7c8d9e','Via dell\'Industria, 45, 60035 Jesi, AN',43.5235,13.2433,'Frantoio Oleario Bianchi','+39073156789'),('c3d4e5f6-a7b8-4c3d-ae4f-5a6b7c8d9e0f','Via del Parco, 1, 62039 Visso, MC',42.9315,13.0886,'Caseificio Monti Azzurri','+39073799123'),('d4e5f6a7-b8c9-4d4e-bf5a-6b7c8d9e0f1a','Piazza del Popolo, 22, 63100 Ascoli Piceno, AP',42.854,13.5755,'Bottega del Pastore','+390736258321'),('e3cb88e8-fb8f-49c7-9461-bfcb99d46677','Camerino loc. Paganico, SNC',43.13222,13.11566,'Rivendita','+39312554841');
/*!40000 ALTER TABLE `supply_chain_point` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 10:28:03
