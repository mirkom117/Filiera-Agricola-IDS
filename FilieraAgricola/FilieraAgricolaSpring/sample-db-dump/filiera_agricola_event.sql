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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` varchar(255) NOT NULL,
  `date_time` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `organizer_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('evt-001','2025-10-26 10:00:00.000000','Festa annuale per celebrare il nuovo raccolto di olive e la prima spremitura. Degustazioni guidate e stand gastronomici.','Piazza del Popolo, Offida (AP)','user-01','Sagra dell\'Olio Nuovo 2025'),('evt-002','2025-11-15 09:00:00.000000','Fiera dedicata ai formaggi stagionati in fossa, con produttori da tutte le Marche. Concorso per il miglior formaggio.','Centro Storico, Sogliano al Rubicone (FC)','71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','Fiera del Formaggio di Fossa'),('evt-003','2026-03-08 15:00:00.000000','Convegno sulle nuove tecniche di agricoltura biologica e sostenibile per la viticoltura. Interventi di esperti del settore.','Aula Magna, Università Politecnica delle Marche, Ancona','535f4326-312c-4ac8-8c30-374cf7e90974','Viticoltura Sostenibile: Futuro e Innovazione'),('evt-004','2026-04-25 11:00:00.000000','Mercato a km 0 con i migliori produttori della filiera dei Sibillini. Verdure, legumi, formaggi e salumi.','Piazza San Benedetto, Norcia (PG)','6c52d2f1-c333-46bd-96e6-16000d2e18c4','Mercato dei Produttori dei Sibillini'),('evt-005','2026-05-01 12:00:00.000000','Show cooking con chef locali che utilizzano i prodotti della nostra filiera. Degustazione dei piatti preparati.','Showroom Cucine Lube, Treia (MC)','71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','Chef in Filiera'),('evt-006','2026-06-02 09:30:00.000000','Visita guidata presso un\'azienda produttrice di pasta artigianale. Dimostrazione del processo di trafilatura al bronzo.','Pastificio Rossi, Campofilone (FM)','538e3bef-4373-446c-9226-c84a605685c0','Porte Aperte al Pastificio'),('evt-007','2026-07-18 18:00:00.000000','Aperitivo e degustazione di vini biologici marchigiani in vigna al tramonto. Musica dal vivo e stuzzichini locali.','Azienda Vinicola Bianchi, Morro d\'Alba (AN)','6c52d2f1-c333-46bd-96e6-16000d2e18c4','Aperitivo in Vigna'),('evt-008','2026-08-05 20:00:00.000000','Cena di beneficenza per raccogliere fondi per la tutela del Parco dei Sibillini. Menu interamente basato su prodotti della filiera.','Ristorante Il Tiglio, Montemonaco (AP)','535f4326-312c-4ac8-8c30-374cf7e90974','Cena Solidale per i Sibillini'),('evt-009','2026-09-12 10:00:00.000000','Workshop pratico su come creare e gestire un gruppo di acquisto solidale (GAS). Intervengono esperti e animatori di GAS già attivi.','Sala consiliare, Comune di Macerata','71270ac9-1ab6-4e37-a1a0-84d16fc69cdf','Workshop: Creare un GAS'),('evt-010','2026-09-27 16:00:00.000000','Evento dedicato ai bambini per imparare a fare il formaggio partendo dal latte fresco. Laboratorio pratico e merenda.','Fattoria Didattica Il Girasole, Jesi (AN)','538e3bef-4373-446c-9226-c84a605685c0','Piccoli Casari Crescono'),('f6d52b62-b3d3-444b-af6c-573a18b5a4d7',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
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
