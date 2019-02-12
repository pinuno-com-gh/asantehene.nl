CREATE DATABASE  IF NOT EXISTS `asantehene_dev` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `asantehene_dev`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.33.20    Database: asantehene_dev
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Asantehene\n'),(2,'Amanhene\n'),(3,'Obrempon\n'),(4,'Odikro\n'),(5,'Mpanimfo\n'),(6,'Abusuapanin\n'),(7,'Efiepanin\n');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chief`
--

DROP TABLE IF EXISTS `chief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `instoolment_date` date DEFAULT NULL,
  `destoolment_date` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `report_to` int(11) DEFAULT NULL,
  `current_occupant` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chief_category_fk_idx` (`category_id`),
  KEY `chief_rank_fk_idx` (`rank_id`),
  KEY `chief_state_fk_idx` (`state_id`),
  KEY `chief_parent_fk_idx` (`parent_id`),
  CONSTRAINT `chief_category_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `chief_parent_fk` FOREIGN KEY (`parent_id`) REFERENCES `parentNode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `chief_rank_fk` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `chief_state_fk` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chief`
--

LOCK TABLES `chief` WRITE;
/*!40000 ALTER TABLE `chief` DISABLE KEYS */;
/*!40000 ALTER TABLE `chief` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familyMemberNodeTree`
--

DROP TABLE IF EXISTS `familyMemberNodeTree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familyMemberNodeTree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthdate` varchar(45) DEFAULT NULL,
  `deathdate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familyMemberNodeTree`
--

LOCK TABLES `familyMemberNodeTree` WRITE;
/*!40000 ALTER TABLE `familyMemberNodeTree` DISABLE KEYS */;
/*!40000 ALTER TABLE `familyMemberNodeTree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentNode`
--

DROP TABLE IF EXISTS `parentNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentNode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familyMemberNodeTreeIdMother` int(11) DEFAULT NULL,
  `familyMemberNodeTreeIdFather` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentNode_familyMemberNodeTreeMother_fk_idx` (`familyMemberNodeTreeIdMother`),
  KEY `parentNode_familyMemberNodeTreeFather_fk_idx` (`familyMemberNodeTreeIdFather`),
  CONSTRAINT `parentNode_familyMemberNodeTreeFather_fk` FOREIGN KEY (`familyMemberNodeTreeIdFather`) REFERENCES `familyMemberNodeTree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `parentNode_familyMemberNodeTreeMother_fk` FOREIGN KEY (`familyMemberNodeTreeIdMother`) REFERENCES `familyMemberNodeTree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentNode`
--

LOCK TABLES `parentNode` WRITE;
/*!40000 ALTER TABLE `parentNode` DISABLE KEYS */;
/*!40000 ALTER TABLE `parentNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,'Bantamahene'),(2,'Akwamuhene'),(3,'Adontenhene'),(4,'Akyempemhene'),(5,'Kontihene');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Kumase'),(2,'Mampong'),(3,'Assumegya'),(4,'Adanse'),(5,'Dwaben'),(6,'Kokofu'),(7,'Bekwai'),(8,'Nsuta'),(9,'Kumawu'),(10,'Agona'),(11,'Offinso'),(12,'Edweso'),(13,'Denyase'),(14,'Asokore\n'),(15,'Agogo'),(16,'Obogu'),(17,'Tepa'),(18,'Manso Nkwanta'),(19,'Ofoase'),(20,'Bompata'),(21,'Asankare\n'),(22,'Mim'),(23,'Sankore'),(24,'Akyerensua'),(25,'Bekyem'),(26,'Yamfo'),(27,'Ofuman'),(28,'Nsokow'),(29,'Gyapekrom'),(30,'Goaso'),(31,'Hwediem'),(32,'Kenyase no1'),(33,'Kenyase no2'),(34,'Akrodie'),(35,'Amanten'),(36,'Sampa'),(37,'Kukuom'),(38,'Beposo'),(39,'Kwaman'),(40,'Domeabra'),(41,'Dwansa'),(42,'Asuboa'),(43,'Kontanase'),(44,'Kokofu'),(45,'Asaman'),(46,'Amoaful'),(47,'Adankranya'),(48,'Sabronom'),(49,'Mpasaso No1'),(50,'Mamfo'),(51,'Maaban  '),(52,'Gyadam'),(53,'Tuobodom'),(54,'Tanaso'),(55,'Tanoboase'),(56,'Buoyam \n');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'asantehene_dev'
--

--
-- Dumping routines for database 'asantehene_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-12 10:02:16
