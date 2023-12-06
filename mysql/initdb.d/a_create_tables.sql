-- MySQL dump 10.13  Distrib 8.0.33, for macos12.6 (arm64)
--
-- Host: 34.22.100.35    Database: FLOWN
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

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
-- Table structure for table `bouquet`
--

DROP TABLE IF EXISTS `bouquet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bouquet` (
  `bouquet_id` int NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `price` int NOT NULL,
  `seller_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_new` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`bouquet_id`),
  KEY `f_buyer_id` (`buyer_id`),
  KEY `f_seller_id_bouquet` (`seller_id`),
  CONSTRAINT `f_buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_info` (`buyer_id`),
  CONSTRAINT `f_seller_id_bouquet` FOREIGN KEY (`seller_id`) REFERENCES `seller_info` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bouquet_configuration`
--

DROP TABLE IF EXISTS `bouquet_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bouquet_configuration` (
  `bouquet_id` int NOT NULL,
  `flower_id` int NOT NULL,
  `flowerAmount` int NOT NULL,
  PRIMARY KEY (`bouquet_id`,`flower_id`),
  KEY `f_flower_id_idx` (`flower_id`),
  CONSTRAINT `f_bouquet_id` FOREIGN KEY (`bouquet_id`) REFERENCES `bouquet` (`bouquet_id`),
  CONSTRAINT `f_flower_id` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`flower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buyer_info`
--

DROP TABLE IF EXISTS `buyer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer_info` (
  `buyer_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `phoneNumber` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flower`
--

DROP TABLE IF EXISTS `flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flower` (
  `flower_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `price` int DEFAULT NULL,
  `photo` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `isSoldOut` tinyint DEFAULT '0',
  PRIMARY KEY (`flower_id`,`seller_id`),
  KEY `f_seller_id` (`seller_id`),
  CONSTRAINT `color_check` CHECK ((`color` in (_utf8mb3'red',_utf8mb3'orange',_utf8mb3'yellow',_utf8mb3'green',_utf8mb3'blue',_utf8mb3'purple',_utf8mb3'white',_utf8mb3'black',_utf8mb3'pink')))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `title` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `content` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`notice_id`,`seller_id`),
  KEY `f_seller_id_notice` (`seller_id`),
  CONSTRAINT `f_seller_id_notice` FOREIGN KEY (`seller_id`) REFERENCES `seller_info` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `seller_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `receiverName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `orderDate` datetime NOT NULL,
  `pickUpDate` datetime NOT NULL,
  `orderStatus` varchar(20) COLLATE utf8mb3_bin NOT NULL DEFAULT 'waiting',
  `receiverPhoneNumber` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `memo` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `f_seller_id_order` (`seller_id`),
  KEY `f_buyer_id_order` (`buyer_id`),
  CONSTRAINT `f_buyer_id_order` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_info` (`buyer_id`),
  CONSTRAINT `f_seller_id_order` FOREIGN KEY (`seller_id`) REFERENCES `seller_info` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderItem`
--

DROP TABLE IF EXISTS `orderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderItem` (
  `orderItem_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `bouquet_id` int NOT NULL,
  `bouquetPrice` int NOT NULL,
  PRIMARY KEY (`orderItem_id`),
  KEY `f_order_id_orderItem_idx` (`order_id`),
  KEY `f_bouquet_id_orderItem` (`bouquet_id`),
  CONSTRAINT `f_bouquet_id_orderItem` FOREIGN KEY (`bouquet_id`) REFERENCES `bouquet` (`bouquet_id`),
  CONSTRAINT `f_order_id_orderItem` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) COLLATE utf8mb3_bin NOT NULL,
  `date` datetime NOT NULL,
  `rating` float NOT NULL,
  `buyer_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `seller_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `f_buyer_id_review` (`buyer_id`),
  KEY `f_seller_id_review` (`seller_id`),
  CONSTRAINT `f_buyer_id_review` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_info` (`buyer_id`),
  CONSTRAINT `f_seller_id_review` FOREIGN KEY (`seller_id`) REFERENCES `seller_info` (`seller_id`),
  CONSTRAINT `reviewRating_check` CHECK (((`rating` >= 0) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seller_info`
--

DROP TABLE IF EXISTS `seller_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_info` (
  `seller_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `storeName` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `ownerName` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `businessNumber` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `storePhoneNumber` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `storeRating` float NOT NULL DEFAULT '0',
  `storeStatus` varchar(20) COLLATE utf8mb3_bin NOT NULL DEFAULT 'close',
  `address_city` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `address_district` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `address_dong` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `address_detail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  CONSTRAINT `rating_check` CHECK (((`storeRating` >= 0) and (`storeRating` <= 5))),
  CONSTRAINT `status_check` CHECK ((`storeStatus` in (_utf8mb3'close',_utf8mb3'open',_utf8mb3'temporary close')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopping_basket`
--

DROP TABLE IF EXISTS `shopping_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_basket` (
  `shopping_basket_id` int NOT NULL AUTO_INCREMENT,
  `buyer_id` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `bouquet_id` int NOT NULL,
  PRIMARY KEY (`shopping_basket_id`),
  KEY `f_bouquet_id_basket_idx` (`bouquet_id`),
  KEY `f_buyer_id_basket` (`buyer_id`),
  CONSTRAINT `f_bouquet_id_basket` FOREIGN KEY (`bouquet_id`) REFERENCES `bouquet` (`bouquet_id`),
  CONSTRAINT `f_buyer_id_basket` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_info` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 21:05:32
