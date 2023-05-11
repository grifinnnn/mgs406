-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: helpdesk
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_submitted` date NOT NULL,
  `submitted_by` varchar(255) NOT NULL,
  `priority` enum('High','Medium','Low') NOT NULL,
  `description` text NOT NULL,
  `status` enum('Open','In Progress','Resolved') NOT NULL DEFAULT 'Open',
  `date_resolved` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES
(1,'2023-05-10','John Doe','High','Unable to log in to computer','Resolved',NULL),
(2,'2023-05-11','Jane Smith','Medium','Printer not working','Resolved',NULL),
(3,'2023-05-12','Bob Johnson','Low','Need help installing new software','Resolved','2023-05-15'),
(4,'2023-05-13','Alex Lee','Medium','Email not working','Resolved',NULL),
(5,'2023-05-14','Sara Williams','Low','Need help setting up a new account','Resolved',NULL),
(6,'2023-05-15','Tom Jones','High','Computer is running very slow','Open',NULL),
(7,'2023-05-16','Maria Garcia','Medium','Need help accessing a file on the network','Resolved','2023-05-18'),
(8,'2023-05-17','David Chen','Low','Need help with password reset','Resolved','2023-05-19'),
(9,'2023-05-18','Amy Nguyen','High','Need help with software upgrade','Open',NULL),
(10,'2023-05-19','Mohammed Ali','Medium','Need help with VPN connection','Open',NULL),
(11,'2023-05-10','Griffin Refol','High','My Computer is on fire','Open',NULL),
(12,'2023-05-10','Tyanna Rosado','Medium','The hat man took my comptuer','Resolved',NULL),
(13,'2023-05-10','Tyanna Rosado','Medium','Hat man took computer','Resolved',NULL),
(14,'2023-05-10','Tyanna Rosado','Medium','Hat man took computer','Open',NULL),
(15,'2023-05-10','Jason Cody','Low','Monitor is unplugged','Open',NULL),
(16,'2023-05-10','Bob Cody','Low','MY EYES','Open',NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11  0:04:51
