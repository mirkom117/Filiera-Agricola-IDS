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
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `id` varchar(255) NOT NULL,
  `registration_date` datetime(6) DEFAULT NULL,
  `role` tinyint DEFAULT NULL,
  `actor_id` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmcne5oxlwr54p4jakiogqih7y` (`actor_id`),
  KEY `FKdwaykt3mmluwtoc97nq1c50x7` (`event_id`),
  CONSTRAINT `FKdwaykt3mmluwtoc97nq1c50x7` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `FKmcne5oxlwr54p4jakiogqih7y` FOREIGN KEY (`actor_id`) REFERENCES `user` (`id`),
  CONSTRAINT `participation_chk_1` CHECK ((`role` between 0 and 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

LOCK TABLES `participation` WRITE;
/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
INSERT INTO `participation` VALUES ('prt-001','2025-09-15 11:00:00.000000',0,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-001'),('prt-002','2025-09-20 14:30:00.000000',1,'538e3bef-4373-446c-9226-c84a605685c0','evt-001'),('prt-004','2025-10-02 09:15:00.000000',0,'71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','evt-002'),('prt-005','2025-10-05 12:00:00.000000',1,'538e3bef-4373-446c-9226-c84a605685c0','evt-002'),('prt-007','2025-11-01 10:00:00.000000',3,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-002'),('prt-009','2026-01-15 11:30:00.000000',2,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-003'),('prt-010','2026-03-01 14:00:00.000000',0,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-004'),('prt-011','2026-03-05 17:00:00.000000',1,'538e3bef-4373-446c-9226-c84a605685c0','evt-004'),('prt-013','2026-04-01 10:00:00.000000',0,'71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','evt-005'),('prt-014','2026-04-10 19:00:00.000000',3,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-005'),('prt-016','2026-05-01 12:00:00.000000',0,'538e3bef-4373-446c-9226-c84a605685c0','evt-006'),('prt-017','2026-05-15 15:00:00.000000',3,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-006'),('prt-019','2026-06-10 10:10:00.000000',0,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-007'),('prt-020','2026-06-20 11:20:00.000000',3,'71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','evt-007'),('prt-023','2026-07-15 18:00:00.000000',3,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-008'),('prt-024','2026-07-20 17:00:00.000000',3,'67f6216d-efc8-4297-bbdc-90bb5b572935','evt-008'),('prt-025','2026-08-01 11:50:00.000000',0,'71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','evt-009'),('prt-027','2026-08-20 14:00:00.000000',3,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-009'),('prt-028','2026-09-01 10:00:00.000000',0,'538e3bef-4373-446c-9226-c84a605685c0','evt-010'),('prt-029','2026-09-10 18:00:00.000000',3,'6c52d2f1-c333-46bd-96e6-16000d2e18c4','evt-010');
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 10:27:52
