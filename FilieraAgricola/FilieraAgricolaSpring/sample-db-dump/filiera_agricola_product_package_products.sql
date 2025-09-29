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
-- Table structure for table `product_package_products`
--

DROP TABLE IF EXISTS `product_package_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_package_products` (
  `product_package_id` varchar(255) NOT NULL,
  `products_id` varchar(255) NOT NULL,
  KEY `FK90epdod47401a1m0n8ctttx5` (`products_id`),
  KEY `FKgispd9kjluwdvmhgnov05he50` (`product_package_id`),
  CONSTRAINT `FK90epdod47401a1m0n8ctttx5` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKgispd9kjluwdvmhgnov05he50` FOREIGN KEY (`product_package_id`) REFERENCES `product_package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_package_products`
--

LOCK TABLES `product_package_products` WRITE;
/*!40000 ALTER TABLE `product_package_products` DISABLE KEYS */;
INSERT INTO `product_package_products` VALUES ('pkg-001','2a075e53-46a4-44ac-80f4-5f560e980376'),('pkg-001','a8d8c222-0d64-469b-9c76-577bb50041dc'),('pkg-001','2a2b724f-ef78-430c-a681-42e72900e572'),('pkg-002','a9cdb71a-db1d-4850-a47d-a42063379086'),('pkg-002','be1b5275-6a56-42d1-9f93-c351f78c8a14'),('pkg-002','c2718e8d-5658-45e6-94b2-2975949a2096'),('pkg-003','765ea49a-a3f7-4217-8fa6-ce00528fe01b'),('pkg-003','be1b5275-6a56-42d1-9f93-c351f78c8a14'),('pkg-003','3f875f10-72d8-4f80-9a4f-553b93475e5b'),('pkg-001','2a075e53-46a4-44ac-80f4-5f560e980376'),('pkg-001','a8d8c222-0d64-469b-9c76-577bb50041dc'),('pkg-001','2a2b724f-ef78-430c-a681-42e72900e572'),('pkg-002','a9cdb71a-db1d-4850-a47d-a42063379086'),('pkg-002','bb836de5-5460-49ae-a0a3-f9fbe2a0b16a'),('pkg-002','c2718e8d-5658-45e6-94b2-2975949a2096'),('pkg-003','765ea49a-a3f7-4217-8fa6-ce00528fe01b'),('pkg-003','be1b5275-6a56-42d1-9f93-c351f78c8a14'),('pkg-003','3f875f10-72d8-4f80-9a4f-553b93475e5b');
/*!40000 ALTER TABLE `product_package_products` ENABLE KEYS */;
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
