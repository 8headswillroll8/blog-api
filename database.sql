-- MySQL dump 10.13  Distrib 26.7.0, for macos14.6 (arm64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	26.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `blog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `blog`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `category` varchar(100) DEFAULT NULL,
  `submitted_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_articles_user` (`submitted_by`),
  CONSTRAINT `fk_articles_user` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Getting Started with Backend','Excited to learn about servers.','Backend',4,'2026-10-08 08:32:03'),(2,'Database Fundamentals','Sharing insights about SQL and data modeling.','Database',5,'2026-10-08 08:32:03'),(3,'My Second Article','More thoughts on web development.','Development',4,'2026-10-08 08:32:03'),(4,'Hello World API','Writing about building a first API endpoint.','Backend',6,'2026-10-08 08:32:03'),(5,'Advanced Queries','Tips on optimising database queries.','Database',5,'2026-10-08 08:32:03'),(6,'My First Authenticated Article','I built this API using Express, TypeScript and MySQL!','Backend',11,'2026-10-10 13:14:17'),(7,'My First Authenticated Article','I built this API using Express, TypeScript and MySQL!','Backend',11,'2026-10-10 13:17:15'),(8,'Postman Bootcamp','My backend survived the testing marathon!','Backend',12,'2026-10-10 18:04:12');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'diana@example.com','dummy_hash_1','2026-10-08 08:26:57'),(2,'erik@example.com','dummy_hash_2','2026-10-08 08:26:57'),(3,'fiona@example.com','dummy_hash_3','2026-10-08 08:26:57'),(4,'oliver@example.com','dummy_hash_4','2026-10-08 08:26:57'),(5,'mia@example.com','dummy_hash_5','2026-10-08 08:26:57'),(6,'noah@example.com','dummy_hash_6','2026-10-08 08:26:57'),(7,'ella@example.com','dummy_hash_7','2026-10-08 08:26:57'),(8,'leo@example.com','dummy_hash_8','2026-10-08 08:26:57'),(9,'sophie@example.com','dummy_hash_9','2026-10-08 08:26:57'),(10,'alex@example.com','dummy_hash_10','2026-10-08 08:26:57'),(11,'testuser@example.com','$2b$10$5I3dTl2lIWE3mI2WPWWPSuHoZ5KE60QiTIozh0qDruTxhvbh/GNT.','2026-10-10 11:46:36'),(12,'bootcamp1@example.com','$2b$10$xQSZgo22rOJz4iwC.sZzGuw1oucKDofWXcsDZDtkp/ucWC.AnJ30u','2026-10-10 17:53:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-10 20:48:05
