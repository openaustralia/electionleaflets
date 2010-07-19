-- MySQL dump 10.13
--
-- Host: localhost    Database: fairdinkum_test
-- ------------------------------------------------------
-- Server version	5.1.22-rc

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `default_value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `description`, `default_value`) VALUES
(1, 'Communications', NULL, NULL),
(2, 'Defence', NULL, NULL),
(3, 'Economy', NULL, NULL),
(4, 'Education', NULL, NULL),
(5, 'Environment', NULL, NULL),
(6, 'Family', NULL, NULL),
(7, 'Health', NULL, NULL),
(8, 'Immigration', NULL, NULL),
(9, 'Jobs', NULL, NULL),
(10, 'Tax', NULL, NULL);

--
-- Table structure for table `constituency`
--

DROP TABLE IF EXISTS `constituency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `constituency` (
  `constituency_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternative_name` varchar(255) DEFAULT NULL,
  `constituency_type_id` int(11) NOT NULL,
  `retired` tinyint(1) DEFAULT '0',
  `area_code` varchar(20) DEFAULT NULL,
  `area_uri` varchar(255) DEFAULT NULL,
  `wikipedia_url` varchar(255) DEFAULT NULL,
  `url_id` varchar(100) DEFAULT NULL,
  `guardian_aristotle_id` int(11) DEFAULT NULL,
  `guardian_pa_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`constituency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `constituency`
--

LOCK TABLES `constituency` WRITE;
/*!40000 ALTER TABLE `constituency` DISABLE KEYS */;
INSERT INTO `constituency` VALUES (1,'Canberra',NULL,4,0,'ACT',NULL,'http://en.wikipedia.org/wiki/Division_of_Canberra','canberra',NULL,NULL),(2,'Fraser',NULL,4,0,'ACT',NULL,'http://en.wikipedia.org/wiki/Division_of_Fraser','fraser',NULL,NULL),(3,'Banks',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Banks','banks',NULL,NULL),(4,'Barton',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Barton','barton',NULL,NULL),(5,'Bennelong',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Bennelong','bennelong',NULL,NULL),(6,'Berowra',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Berowra','berowra',NULL,NULL),(7,'Blaxland',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Blaxland','blaxland',NULL,NULL),(8,'Bradfield',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Bradfield','bradfield',NULL,NULL),(9,'Calare',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Calare','calare',NULL,NULL),(10,'Charlton',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Charlton','charlton',NULL,NULL),(11,'Chifley',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Chifley','chifley',NULL,NULL),(12,'Cook',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Cook','cook',NULL,NULL),(13,'Cowper',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Cowper','cowper',NULL,NULL),(14,'Cunningham',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Cunningham','cunningham',NULL,NULL),(15,'Dobell',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Dobell','dobell',NULL,NULL),(16,'Eden-Monaro',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Eden-Monaro','eden-monaro',NULL,NULL),(17,'Farrer',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Farrer','farrer',NULL,NULL),(18,'Fowler',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Fowler','fowler',NULL,NULL),(19,'Gilmore',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Gilmore','gilmore',NULL,NULL),(20,'Grayndler',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Grayndler','grayndler',NULL,NULL),(21,'Greenway',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Greenway','greenway',NULL,NULL),(22,'Hughes',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Hughes','hughes',NULL,NULL),(23,'Hume',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Hume','hume',NULL,NULL),(24,'Hunter',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Hunter','hunter',NULL,NULL),(25,'Kingsford Smith',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Kingsford Smith','kingsford_smith',NULL,NULL),(26,'Lindsay',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Lindsay','lindsay',NULL,NULL),(27,'Lyne',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Lyne','lyne',NULL,NULL),(28,'Macarthur',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Macarthur','macarthur',NULL,NULL),(29,'Mackellar',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Mackellar','mackellar',NULL,NULL),(30,'Macquarie',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Macquarie','macquarie',NULL,NULL),(31,'McMahon',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_McMahon','mcmahon',NULL,NULL),(32,'Mitchell',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Mitchell','mitchell',NULL,NULL),(33,'Newcastle',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Newcastle','newcastle',NULL,NULL),(34,'New England',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_New England','new_england',NULL,NULL),(35,'North Sydney',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_North Sydney','north_sydney',NULL,NULL),(36,'Page',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Page','page',NULL,NULL),(37,'Parkes',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Parkes','parkes',NULL,NULL),(38,'Parramatta',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Parramatta','parramatta',NULL,NULL),(39,'Paterson',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Paterson','paterson',NULL,NULL),(40,'Reid',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Reid','reid',NULL,NULL),(41,'Richmond',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Richmond','richmond',NULL,NULL),(42,'Riverina',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Riverina','riverina',NULL,NULL),(43,'Robertson',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Robertson','robertson',NULL,NULL),(44,'Shortland',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Shortland','shortland',NULL,NULL),(45,'Sydney',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Sydney','sydney',NULL,NULL),(46,'Throsby',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Throsby','throsby',NULL,NULL),(47,'Warringah',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Warringah','warringah',NULL,NULL),(48,'Watson',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Watson','watson',NULL,NULL),(49,'Wentworth',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Wentworth','wentworth',NULL,NULL),(50,'Werriwa',NULL,4,0,'NSW',NULL,'http://en.wikipedia.org/wiki/Division_of_Werriwa','werriwa',NULL,NULL),(51,'Lingiari',NULL,4,0,'NT',NULL,'http://en.wikipedia.org/wiki/Division_of_Lingiari','lingiari',NULL,NULL),(52,'Solomon',NULL,4,0,'NT',NULL,'http://en.wikipedia.org/wiki/Division_of_Solomon','solomon',NULL,NULL),(53,'Blair',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Blair','blair',NULL,NULL),(54,'Bonner',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Bonner','bonner',NULL,NULL),(55,'Bowman',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Bowman','bowman',NULL,NULL),(56,'Brisbane',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Brisbane','brisbane',NULL,NULL),(57,'Capricornia',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Capricornia','capricornia',NULL,NULL),(58,'Dawson',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Dawson','dawson',NULL,NULL),(59,'Dickson',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Dickson','dickson',NULL,NULL),(60,'Fadden',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Fadden','fadden',NULL,NULL),(61,'Fairfax',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Fairfax','fairfax',NULL,NULL),(62,'Fisher',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Fisher','fisher',NULL,NULL),(63,'Flynn',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Flynn','flynn',NULL,NULL),(64,'Forde',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Forde','forde',NULL,NULL),(65,'Griffith',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Griffith','griffith',NULL,NULL),(66,'Groom',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Groom','groom',NULL,NULL),(67,'Herbert',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Herbert','herbert',NULL,NULL),(68,'Hinkler',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Hinkler','hinkler',NULL,NULL),(69,'Kennedy',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Kennedy','kennedy',NULL,NULL),(70,'Leichhardt',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Leichhardt','leichhardt',NULL,NULL),(71,'Lilley',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Lilley','lilley',NULL,NULL),(72,'Longman',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Longman','longman',NULL,NULL),(73,'Maranoa',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Maranoa','maranoa',NULL,NULL),(74,'McPherson',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_McPherson','mcpherson',NULL,NULL),(75,'Moncrieff',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Moncrieff','moncrieff',NULL,NULL),(76,'Moreton',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Moreton','moreton',NULL,NULL),(77,'Oxley',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Oxley','oxley',NULL,NULL),(78,'Petrie',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Petrie','petrie',NULL,NULL),(79,'Rankin',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Rankin','rankin',NULL,NULL),(80,'Ryan',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Ryan','ryan',NULL,NULL),(81,'Wide Bay',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Wide Bay','wide_bay',NULL,NULL),(82,'Wright',NULL,4,0,'Qld',NULL,'http://en.wikipedia.org/wiki/Division_of_Wright','wright',NULL,NULL),(83,'Adelaide',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Adelaide','adelaide',NULL,NULL),(84,'Barker',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Barker','barker',NULL,NULL),(85,'Boothby',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Boothby','boothby',NULL,NULL),(86,'Grey',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Grey','grey',NULL,NULL),(87,'Hindmarsh',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Hindmarsh','hindmarsh',NULL,NULL),(88,'Kingston',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Kingston','kingston',NULL,NULL),(89,'Makin',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Makin','makin',NULL,NULL),(90,'Mayo',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Mayo','mayo',NULL,NULL),(91,'Port Adelaide',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Port Adelaide','port_adelaide',NULL,NULL),(92,'Sturt',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Sturt','sturt',NULL,NULL),(93,'Wakefield',NULL,4,0,'SA',NULL,'http://en.wikipedia.org/wiki/Division_of_Wakefield','wakefield',NULL,NULL),(94,'Bass',NULL,4,0,'Tas.',NULL,'http://en.wikipedia.org/wiki/Division_of_Bass','bass',NULL,NULL),(95,'Braddon',NULL,4,0,'Tas.',NULL,'http://en.wikipedia.org/wiki/Division_of_Braddon','braddon',NULL,NULL),(96,'Denison',NULL,4,0,'Tas.',NULL,'http://en.wikipedia.org/wiki/Division_of_Denison','denison',NULL,NULL),(97,'Franklin',NULL,4,0,'Tas.',NULL,'http://en.wikipedia.org/wiki/Division_of_Franklin','franklin',NULL,NULL),(98,'Lyons',NULL,4,0,'Tas.',NULL,'http://en.wikipedia.org/wiki/Division_of_Lyons','lyons',NULL,NULL),(99,'Aston',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Aston','aston',NULL,NULL),(100,'Ballarat',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Ballarat','ballarat',NULL,NULL),(101,'Batman',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Batman','batman',NULL,NULL),(102,'Bendigo',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Bendigo','bendigo',NULL,NULL),(103,'Bruce',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Bruce','bruce',NULL,NULL),(104,'Calwell',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Calwell','calwell',NULL,NULL),(105,'Casey',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Casey','casey',NULL,NULL),(106,'Chisholm',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Chisholm','chisholm',NULL,NULL),(107,'Corangamite',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Corangamite','corangamite',NULL,NULL),(108,'Corio',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Corio','corio',NULL,NULL),(109,'Deakin',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Deakin','deakin',NULL,NULL),(110,'Dunkley',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Dunkley','dunkley',NULL,NULL),(111,'Flinders',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Flinders','flinders',NULL,NULL),(112,'Gellibrand',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Gellibrand','gellibrand',NULL,NULL),(113,'Gippsland',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Gippsland','gippsland',NULL,NULL),(114,'Goldstein',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Goldstein','goldstein',NULL,NULL),(115,'Gorton',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Gorton','gorton',NULL,NULL),(116,'Higgins',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Higgins','higgins',NULL,NULL),(117,'Holt',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Holt','holt',NULL,NULL),(118,'Hotham',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Hotham','hotham',NULL,NULL),(119,'Indi',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Indi','indi',NULL,NULL),(120,'Isaacs',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Isaacs','isaacs',NULL,NULL),(121,'Jagajaga',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Jagajaga','jagajaga',NULL,NULL),(122,'Kooyong',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Kooyong','kooyong',NULL,NULL),(123,'Lalor',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Lalor','lalor',NULL,NULL),(124,'La Trobe',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_La Trobe','la_trobe',NULL,NULL),(125,'Mallee',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Mallee','mallee',NULL,NULL),(126,'Maribyrnong',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Maribyrnong','maribyrnong',NULL,NULL),(127,'McEwen',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_McEwen','mcewen',NULL,NULL),(128,'McMillan',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_McMillan','mcmillan',NULL,NULL),(129,'Melbourne',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Melbourne','melbourne',NULL,NULL),(130,'Melbourne Ports',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Melbourne Ports','melbourne_ports',NULL,NULL),(131,'Menzies',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Menzies','menzies',NULL,NULL),(132,'Murray',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Murray','murray',NULL,NULL),(133,'Scullin',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Scullin','scullin',NULL,NULL),(134,'Wannon',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Wannon','wannon',NULL,NULL),(135,'Wills',NULL,4,0,'Vic.',NULL,'http://en.wikipedia.org/wiki/Division_of_Wills','wills',NULL,NULL),(136,'Brand',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Brand','brand',NULL,NULL),(137,'Canning',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Canning','canning',NULL,NULL),(138,'Cowan',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Cowan','cowan',NULL,NULL),(139,'Curtin',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Curtin','curtin',NULL,NULL),(140,'Durack',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Durack','durack',NULL,NULL),(141,'Forrest',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Forrest','forrest',NULL,NULL),(142,'Fremantle',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Fremantle','fremantle',NULL,NULL),(143,'Hasluck',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Hasluck','hasluck',NULL,NULL),(144,'Moore',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Moore','moore',NULL,NULL),(145,'O\'Connor',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_O\'Connor','o_connor',NULL,NULL),(146,'Pearce',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Pearce','pearce',NULL,NULL),(147,'Perth',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Perth','perth',NULL,NULL),(148,'Stirling',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Stirling','stirling',NULL,NULL),(149,'Swan',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Swan','swan',NULL,NULL),(150,'Tangney',NULL,4,0,'WA',NULL,'http://en.wikipedia.org/wiki/Division_of_Tangney','tangney',NULL,NULL);
/*!40000 ALTER TABLE `constituency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituency_type`
--

DROP TABLE IF EXISTS `constituency_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `constituency_type` (
  `constituency_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `url_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`constituency_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `constituency_type`
--

LOCK TABLES `constituency_type` WRITE;
/*!40000 ALTER TABLE `constituency_type` DISABLE KEYS */;
INSERT INTO `constituency_type` VALUES (1,'European Parliament Constituency',225,'europe'),(2,'Local Authority Ward',225,'council'),(3,'UK Parliament Constituency',225,'wesminster'),(4,'Australian Electoral Division',13,'federalaustralia');
/*!40000 ALTER TABLE `constituency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AF','Afghanistan','AFG'),(2,'AL','Albania','ALB'),(3,'DZ','Algeria','DZA'),(4,'AS','American Samoa','ASM'),(5,'AD','Andorra','AND'),(6,'AO','Angola','AGO'),(7,'AI','Anguilla','AIA'),(8,'AQ','Antarctica',NULL),(9,'AG','Antigua and Barbuda','ATG'),(10,'AR','Argentina','ARG'),(11,'AM','Armenia','ARM'),(12,'AW','Aruba','ABW'),(13,'AU','Australia','AUS'),(14,'AT','Austria','AUT'),(15,'AZ','Azerbaijan','AZE'),(16,'BS','Bahamas','BHS'),(17,'BH','Bahrain','BHR'),(18,'BD','Bangladesh','BGD'),(19,'BB','Barbados','BRB'),(20,'BY','Belarus','BLR'),(21,'BE','Belgium','BEL'),(22,'BZ','Belize','BLZ'),(23,'BJ','Benin','BEN'),(24,'BM','Bermuda','BMU'),(25,'BT','Bhutan','BTN'),(26,'BO','Bolivia','BOL'),(27,'BA','Bosnia and Herzegovina','BIH'),(28,'BW','Botswana','BWA'),(29,'BV','Bouvet Island',NULL),(30,'BR','Brazil','BRA'),(31,'IO','British Indian Ocean Territory',NULL),(32,'BN','Brunei Darussalam','BRN'),(33,'BG','Bulgaria','BGR'),(34,'BF','Burkina Faso','BFA'),(35,'BI','Burundi','BDI'),(36,'KH','Cambodia','KHM'),(37,'CM','Cameroon','CMR'),(38,'CA','Canada','CAN'),(39,'CV','Cape Verde','CPV'),(40,'KY','Cayman Islands','CYM'),(41,'CF','Central African Republic','CAF'),(42,'TD','Chad','TCD'),(43,'CL','Chile','CHL'),(44,'CN','China','CHN'),(45,'CX','Christmas Island',NULL),(46,'CC','Cocos (Keeling) Islands',NULL),(47,'CO','Colombia','COL'),(48,'KM','Comoros','COM'),(49,'CG','Congo','COG'),(50,'CD','Congo, the Democratic Republic of the','COD'),(51,'CK','Cook Islands','COK'),(52,'CR','Costa Rica','CRI'),(53,'CI','Cote D\'Ivoire','CIV'),(54,'HR','Croatia','HRV'),(55,'CU','Cuba','CUB'),(56,'CY','Cyprus','CYP'),(57,'CZ','Czech Republic','CZE'),(58,'DK','Denmark','DNK'),(59,'DJ','Djibouti','DJI'),(60,'DM','Dominica','DMA'),(61,'DO','Dominican Republic','DOM'),(62,'EC','Ecuador','ECU'),(63,'EG','Egypt','EGY'),(64,'SV','El Salvador','SLV'),(65,'GQ','Equatorial Guinea','GNQ'),(66,'ER','Eritrea','ERI'),(67,'EE','Estonia','EST'),(68,'ET','Ethiopia','ETH'),(69,'FK','Falkland Islands (Malvinas)','FLK'),(70,'FO','Faroe Islands','FRO'),(71,'FJ','Fiji','FJI'),(72,'FI','Finland','FIN'),(73,'FR','France','FRA'),(74,'GF','French Guiana','GUF'),(75,'PF','French Polynesia','PYF'),(76,'TF','French Southern Territories',NULL),(77,'GA','Gabon','GAB'),(78,'GM','Gambia','GMB'),(79,'GE','Georgia','GEO'),(80,'DE','Germany','DEU'),(81,'GH','Ghana','GHA'),(82,'GI','Gibraltar','GIB'),(83,'GR','Greece','GRC'),(84,'GL','Greenland','GRL'),(85,'GD','Grenada','GRD'),(86,'GP','Guadeloupe','GLP'),(87,'GU','Guam','GUM'),(88,'GT','Guatemala','GTM'),(89,'GN','Guinea','GIN'),(90,'GW','Guinea-Bissau','GNB'),(91,'GY','Guyana','GUY'),(92,'HT','Haiti','HTI'),(93,'HM','Heard Island and Mcdonald Islands',NULL),(94,'VA','Holy See (Vatican City State)','VAT'),(95,'HN','Honduras','HND'),(96,'HK','Hong Kong','HKG'),(97,'HU','Hungary','HUN'),(98,'IS','Iceland','ISL'),(99,'IN','India','IND'),(100,'ID','Indonesia','IDN'),(101,'IR','Iran, Islamic Republic of','IRN'),(102,'IQ','Iraq','IRQ'),(103,'IE','Ireland','IRL'),(104,'IL','Israel','ISR'),(105,'IT','Italy','ITA'),(106,'JM','Jamaica','JAM'),(107,'JP','Japan','JPN'),(108,'JO','Jordan','JOR'),(109,'KZ','Kazakhstan','KAZ'),(110,'KE','Kenya','KEN'),(111,'KI','Kiribati','KIR'),(112,'KP','Korea, Democratic People\'s Republic of','PRK'),(113,'KR','Korea, Republic of','KOR'),(114,'KW','Kuwait','KWT'),(115,'KG','Kyrgyzstan','KGZ'),(116,'LA','Lao People\'s Democratic Republic','LAO'),(117,'LV','Latvia','LVA'),(118,'LB','Lebanon','LBN'),(119,'LS','Lesotho','LSO'),(120,'LR','Liberia','LBR'),(121,'LY','Libyan Arab Jamahiriya','LBY'),(122,'LI','Liechtenstein','LIE'),(123,'LT','Lithuania','LTU'),(124,'LU','Luxembourg','LUX'),(125,'MO','Macao','MAC'),(126,'MK','Macedonia, the Former Yugoslav Republic of','MKD'),(127,'MG','Madagascar','MDG'),(128,'MW','Malawi','MWI'),(129,'MY','Malaysia','MYS'),(130,'MV','Maldives','MDV'),(131,'ML','Mali','MLI'),(132,'MT','Malta','MLT'),(133,'MH','Marshall Islands','MHL'),(134,'MQ','Martinique','MTQ'),(135,'MR','Mauritania','MRT'),(136,'MU','Mauritius','MUS'),(137,'YT','Mayotte',NULL),(138,'MX','Mexico','MEX'),(139,'FM','Micronesia, Federated States of','FSM'),(140,'MD','Moldova, Republic of','MDA'),(141,'MC','Monaco','MCO'),(142,'MN','Mongolia','MNG'),(143,'MS','Montserrat','MSR'),(144,'MA','Morocco','MAR'),(145,'MZ','Mozambique','MOZ'),(146,'MM','Myanmar','MMR'),(147,'NA','Namibia','NAM'),(148,'NR','Nauru','NRU'),(149,'NP','Nepal','NPL'),(150,'NL','Netherlands','NLD'),(151,'AN','Netherlands Antilles','ANT'),(152,'NC','New Caledonia','NCL'),(153,'NZ','New Zealand','NZL'),(154,'NI','Nicaragua','NIC'),(155,'NE','Niger','NER'),(156,'NG','Nigeria','NGA'),(157,'NU','Niue','NIU'),(158,'NF','Norfolk Island','NFK'),(159,'MP','Northern Mariana Islands','MNP'),(160,'NO','Norway','NOR'),(161,'OM','Oman','OMN'),(162,'PK','Pakistan','PAK'),(163,'PW','Palau','PLW'),(164,'PS','Palestinian Territory, Occupied',NULL),(165,'PA','Panama','PAN'),(166,'PG','Papua New Guinea','PNG'),(167,'PY','Paraguay','PRY'),(168,'PE','Peru','PER'),(169,'PH','Philippines','PHL'),(170,'PN','Pitcairn','PCN'),(171,'PL','Poland','POL'),(172,'PT','Portugal','PRT'),(173,'PR','Puerto Rico','PRI'),(174,'QA','Qatar','QAT'),(175,'RE','Reunion','REU'),(176,'RO','Romania','ROM'),(177,'RU','Russian Federation','RUS'),(178,'RW','Rwanda','RWA'),(179,'SH','Saint Helena','SHN'),(180,'KN','Saint Kitts and Nevis','KNA'),(181,'LC','Saint Lucia','LCA'),(182,'PM','Saint Pierre and Miquelon','SPM'),(183,'VC','Saint Vincent and the Grenadines','VCT'),(184,'WS','Samoa','WSM'),(185,'SM','San Marino','SMR'),(186,'ST','Sao Tome and Principe','STP'),(187,'SA','Saudi Arabia','SAU'),(188,'SN','Senegal','SEN'),(189,'CS','Serbia and Montenegro',NULL),(190,'SC','Seychelles','SYC'),(191,'SL','Sierra Leone','SLE'),(192,'SG','Singapore','SGP'),(193,'SK','Slovakia','SVK'),(194,'SI','Slovenia','SVN'),(195,'SB','Solomon Islands','SLB'),(196,'SO','Somalia','SOM'),(197,'ZA','South Africa','ZAF'),(198,'GS','South Georgia and the South Sandwich Islands',NULL),(199,'ES','Spain','ESP'),(200,'LK','Sri Lanka','LKA'),(201,'SD','Sudan','SDN'),(202,'SR','Suriname','SUR'),(203,'SJ','Svalbard and Jan Mayen','SJM'),(204,'SZ','Swaziland','SWZ'),(205,'SE','Sweden','SWE'),(206,'CH','Switzerland','CHE'),(207,'SY','Syrian Arab Republic','SYR'),(208,'TW','Taiwan, Province of China','TWN'),(209,'TJ','Tajikistan','TJK'),(210,'TZ','Tanzania, United Republic of','TZA'),(211,'TH','Thailand','THA'),(212,'TL','Timor-Leste',NULL),(213,'TG','Togo','TGO'),(214,'TK','Tokelau','TKL'),(215,'TO','Tonga','TON'),(216,'TT','Trinidad and Tobago','TTO'),(217,'TN','Tunisia','TUN'),(218,'TR','Turkey','TUR'),(219,'TM','Turkmenistan','TKM'),(220,'TC','Turks and Caicos Islands','TCA'),(221,'TV','Tuvalu','TUV'),(222,'UG','Uganda','UGA'),(223,'UA','Ukraine','UKR'),(224,'AE','United Arab Emirates','ARE'),(225,'GB','United Kingdom','GBR'),(226,'US','United States','USA'),(227,'UM','United States Minor Outlying Islands',NULL),(228,'UY','Uruguay','URY'),(229,'UZ','Uzbekistan','UZB'),(230,'VU','Vanuatu','VUT'),(231,'VE','Venezuela','VEN'),(232,'VN','Viet Nam','VNM'),(233,'VG','Virgin Islands, British','VGB'),(234,'VI','Virgin Islands, U.s.','VIR'),(235,'WF','Wallis and Futuna','WLF'),(236,'EH','Western Sahara','ESH'),(237,'YE','Yemen','YEM'),(238,'ZM','Zambia','ZMB'),(239,'ZW','Zimbabwe','ZWE');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `election` (
  `election_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `election_type_id` int(11) NOT NULL,
  `vote_date` date NOT NULL,
  PRIMARY KEY (`election_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
INSERT INTO `election` VALUES (1,'Australian Federal Election 2010',1,'2010-11-01');
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election_type`
--

DROP TABLE IF EXISTS `election_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `election_type` (
  `election_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`election_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `election_type`
--

LOCK TABLES `election_type` WRITE;
/*!40000 ALTER TABLE `election_type` DISABLE KEYS */;
INSERT INTO `election_type` VALUES (1,0,13);
/*!40000 ALTER TABLE `election_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_alert`
--

DROP TABLE IF EXISTS `email_alert`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `email_alert` (
  `email_alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `frequency_hours` int(11) NOT NULL,
  `last_sent` datetime DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `confirm_id` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`email_alert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `email_alert`
--

LOCK TABLES `email_alert` WRITE;
/*!40000 ALTER TABLE `email_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_que`
--

DROP TABLE IF EXISTS `email_que`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `email_que` (
  `email_que_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `postcode` varchar(20) NOT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_que_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `email_que`
--

LOCK TABLES `email_que` WRITE;
/*!40000 ALTER TABLE `email_que` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_que` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_que`
--

DROP TABLE IF EXISTS `image_que`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `image_que` (
  `image_que_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_key` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image_key` varchar(255) DEFAULT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_que_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `image_que_seq`
--

DROP TABLE IF EXISTS `image_que_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `image_que_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `leaflet`
--

DROP TABLE IF EXISTS `leaflet`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet` (
  `leaflet_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `publisher_party_id` int(11) NOT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_delivered` datetime NOT NULL,
  `live` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`leaflet_id`),
  KEY `title` (`title`),
  KEY `date_uploaded` (`date_uploaded`),
  KEY `latlng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet`
--

LOCK TABLES `leaflet` WRITE;
/*!40000 ALTER TABLE `leaflet` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_category`
--

DROP TABLE IF EXISTS `leaflet_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_category` (
  `leaflet_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`leaflet_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_category`
--

LOCK TABLES `leaflet_category` WRITE;
/*!40000 ALTER TABLE `leaflet_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_category_seq`
--

DROP TABLE IF EXISTS `leaflet_category_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_category_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_category_seq`
--

LOCK TABLES `leaflet_category_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_category_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_category_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_constituency`
--

DROP TABLE IF EXISTS `leaflet_constituency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_constituency` (
  `leaflet_constituency_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `constituency_id` int(11) NOT NULL,
  PRIMARY KEY (`leaflet_constituency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_constituency`
--

LOCK TABLES `leaflet_constituency` WRITE;
/*!40000 ALTER TABLE `leaflet_constituency` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_constituency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_election`
--

DROP TABLE IF EXISTS `leaflet_election`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_election` (
  `leaflet_election_id` int(11) NOT NULL,
  `leaflet_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  PRIMARY KEY (`leaflet_election_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_election`
--

LOCK TABLES `leaflet_election` WRITE;
/*!40000 ALTER TABLE `leaflet_election` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_election__seq`
--

DROP TABLE IF EXISTS `leaflet_election__seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_election__seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_election__seq`
--

LOCK TABLES `leaflet_election__seq` WRITE;
/*!40000 ALTER TABLE `leaflet_election__seq` DISABLE KEYS */;
INSERT INTO `leaflet_election__seq` VALUES (4);
/*!40000 ALTER TABLE `leaflet_election__seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_image`
--

DROP TABLE IF EXISTS `leaflet_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_image` (
  `leaflet_image_id` int(11) NOT NULL,
  `leaflet_id` int(11) NOT NULL,
  `image_key` varchar(255) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`leaflet_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_image`
--

LOCK TABLES `leaflet_image` WRITE;
/*!40000 ALTER TABLE `leaflet_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_image_seq`
--

DROP TABLE IF EXISTS `leaflet_image_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_image_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_image_seq`
--

LOCK TABLES `leaflet_image_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_image_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_image_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_party_attack`
--

DROP TABLE IF EXISTS `leaflet_party_attack`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_party_attack` (
  `leaflet_party_attack_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`leaflet_party_attack_id`),
  KEY `leaflet_id` (`leaflet_id`),
  KEY `party_id` (`party_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_party_attack`
--

LOCK TABLES `leaflet_party_attack` WRITE;
/*!40000 ALTER TABLE `leaflet_party_attack` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_party_attack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_party_attack_seq`
--

DROP TABLE IF EXISTS `leaflet_party_attack_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_party_attack_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_party_attack_seq`
--

LOCK TABLES `leaflet_party_attack_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_party_attack_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_party_attack_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_seq`
--

DROP TABLE IF EXISTS `leaflet_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_seq`
--

LOCK TABLES `leaflet_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_tag`
--

DROP TABLE IF EXISTS `leaflet_tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_tag` (
  `leaflet_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`leaflet_tag_id`),
  KEY `leaflet_id` (`leaflet_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_tag`
--

LOCK TABLES `leaflet_tag` WRITE;
/*!40000 ALTER TABLE `leaflet_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_tag_seq`
--

DROP TABLE IF EXISTS `leaflet_tag_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_tag_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_tag_seq`
--

LOCK TABLES `leaflet_tag_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_tag_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaflet_tag_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `party` (
  `party_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `major` tinyint(1) DEFAULT NULL,
  `logo_file` varchar(100) DEFAULT NULL,
  `url_id` varchar(255) DEFAULT NULL,
  `colour` char(6) DEFAULT NULL,
  `twitter_account` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`party_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,'Australia First Party (NSW) Incorporated',13,NULL,NULL,'australia_first_party_(nsw)_incorporated',NULL,NULL),(2,'Australian Democrats',13,NULL,NULL,'australian_democrats',NULL,NULL),(3,'Australian Fishing and Lifestyle Party',13,NULL,NULL,'australian_fishing_and_lifestyle_party',NULL,NULL),(4,'Australian Greens',13,NULL,NULL,'australian_greens',NULL,NULL),(5,'Australian Sex Party',13,NULL,NULL,'australian_sex_party',NULL,NULL),(6,'Carers Alliance',13,NULL,NULL,'carers_alliance',NULL,NULL),(7,'Christian Democratic Party (Fred Nile Group)',13,NULL,NULL,'christian_democratic_party_(fred_nile_group)',NULL,NULL),(8,'Citizens Electoral Council of Australia',13,NULL,NULL,'citizens_electoral_council_of_australia',NULL,NULL),(9,'Communist Alliance',13,NULL,NULL,'communist_alliance',NULL,NULL),(10,'Country Liberals (Northern Territory)',13,NULL,NULL,'country_liberals_(northern_territory)',NULL,NULL),(11,'Democratic Labor Party (DLP) of Australia',13,NULL,NULL,'democratic_labor_party_(dlp)_of_australia',NULL,NULL),(12,'Family First Party',13,NULL,NULL,'family_first_party',NULL,NULL),(13,'Liberal Party of Australia',13,NULL,NULL,'liberal_party_of_australia',NULL,NULL),(14,'National Party of Australia',13,NULL,NULL,'national_party_of_australia',NULL,NULL),(15,'Non-Custodial Parents Party (Equal Parenting)',13,NULL,NULL,'non-custodial_parents_party_(equal_parenting)',NULL,NULL),(16,'One Nation',13,NULL,NULL,'one_nation',NULL,NULL),(17,'Senator On-Line',13,NULL,NULL,'senator_on-line',NULL,NULL),(18,'Shooters and Fishers Party',13,NULL,NULL,'shooters_and_fishers_party',NULL,NULL),(19,'Socialist Alliance',13,NULL,NULL,'socialist_alliance',NULL,NULL),(20,'Socialist Equality Party',13,NULL,NULL,'socialist_equality_party',NULL,NULL);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promise`
--

DROP TABLE IF EXISTS `promise`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `promise` (
  `promise_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY (`promise_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `promise`
--

LOCK TABLES `promise` WRITE;
/*!40000 ALTER TABLE `promise` DISABLE KEYS */;
/*!40000 ALTER TABLE `promise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_interesting`
--

DROP TABLE IF EXISTS `rate_interesting`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rate_interesting` (
  `rate_interesting_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`rate_interesting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rate_interesting`
--

LOCK TABLES `rate_interesting` WRITE;
/*!40000 ALTER TABLE `rate_interesting` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_interesting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_type`
--

DROP TABLE IF EXISTS `rate_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rate_type` (
  `rate_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `left_label` varchar(50) NOT NULL,
  `right_label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rate_type`
--

LOCK TABLES `rate_type` WRITE;
/*!40000 ALTER TABLE `rate_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_value`
--

DROP TABLE IF EXISTS `rate_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rate_value` (
  `rate_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaflet_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `rate_type_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`rate_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rate_value`
--

LOCK TABLES `rate_value` WRITE;
/*!40000 ALTER TABLE `rate_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_seq`
--

DROP TABLE IF EXISTS `tag_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tag_seq` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tag_seq`
--

LOCK TABLES `tag_seq` WRITE;
/*!40000 ALTER TABLE `tag_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-07-11 12:09:33
