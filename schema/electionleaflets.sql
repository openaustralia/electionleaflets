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
(1, 'Climate Change', NULL, NULL),
(2, 'Communications', NULL, NULL),
(3, 'Defence', NULL, NULL),
(4, 'Economy', NULL, NULL),
(5, 'Education', NULL, NULL),
(6, 'Environment', NULL, NULL),
(7, 'Family', NULL, NULL),
(8, 'Health', NULL, NULL),
(9, 'Immigration', NULL, NULL),
(10, 'Jobs', NULL, NULL),
(11, 'Tax', NULL, NULL),
(12, 'Transport', NULL, NULL),
(13, 'Infrastructure', NULL, NULL);

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
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Albury',5,'NSW','albury');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Auburn',5,'NSW','auburn');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ballina',5,'NSW','ballina');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Balmain',5,'NSW','balmain');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Bankstown',5,'NSW','bankstown');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Barwon',5,'NSW','barwon');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Bathurst',5,'NSW','bathurst');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Baulkham Hills',5,'NSW','baulkham_hills');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Bega',5,'NSW','bega');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Blacktown',5,'NSW','blacktown');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Blue Mountains',5,'NSW','blue_mountains');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Burrinjuck',5,'NSW','burrinjuck');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cabramatta',5,'NSW','cabramatta');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Camden',5,'NSW','camden');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Campbelltown',5,'NSW','campbelltown');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Canterbury',5,'NSW','canterbury');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Castle Hill',5,'NSW','castle_hill');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cessnock',5,'NSW','cessnock');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Charlestown',5,'NSW','charlestown');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Clarence',5,'NSW','clarence');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Coffs Harbour',5,'NSW','coffs_harbour');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Coogee',5,'NSW','coogee');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cronulla',5,'NSW','cronulla');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Davidson',5,'NSW','davidson');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Drummoyne',5,'NSW','drummoyne');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Dubbo',5,'NSW','dubbo');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('East Hills',5,'NSW','east_hills');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Epping',5,'NSW','epping');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Fairfield',5,'NSW','fairfield');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Gosford',5,'NSW','gosford');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Hawkesbury',5,'NSW','hawkesbury');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Heathcote',5,'NSW','heathcote');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Heffron',5,'NSW','heffron');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Hornsby',5,'NSW','hornsby');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Keira',5,'NSW','keira');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Kiama',5,'NSW','kiama');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Kogarah',5,'NSW','kogarah');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ku-ring-gai',5,'NSW','ku-ring-gai');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Lake Macquarie',5,'NSW','lake_macquarie');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Lakemba',5,'NSW','lakemba');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Lane Cove',5,'NSW','lane_cove');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Lismore',5,'NSW','lismore');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Liverpool',5,'NSW','liverpool');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Londonderry',5,'NSW','londonderry');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Macquarie Fields',5,'NSW','macquarie_fields');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Maitland',5,'NSW','maitland');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Manly',5,'NSW','manly');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Maroubra',5,'NSW','maroubra');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Marrickville',5,'NSW','marrickville');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Menai',5,'NSW','menai');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Miranda',5,'NSW','miranda');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Monaro',5,'NSW','monaro');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mount Druitt',5,'NSW','mount_druitt');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mulgoa',5,'NSW','mulgoa');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Murray-darling',5,'NSW','murray-darling');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Murrumbidgee',5,'NSW','murrumbidgee');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Myall Lakes',5,'NSW','myall_lakes');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Newcastle',5,'NSW','newcastle');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('North Shore',5,'NSW','north_shore');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Northern Tablelands',5,'NSW','northern_tablelands');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Oatley',5,'NSW','oatley');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Orange',5,'NSW','orange');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Oxley',5,'NSW','oxley');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Parramatta',5,'NSW','parramatta');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Penrith',5,'NSW','penrith');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Pittwater',5,'NSW','pittwater');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Port Macquarie',5,'NSW','port_macquarie');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Port Stephens',5,'NSW','port_stephens');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Riverstone',5,'NSW','riverstone');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Rockdale',5,'NSW','rockdale');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ryde',5,'NSW','ryde');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Shellharbour',5,'NSW','shellharbour');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Smithfield',5,'NSW','smithfield');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('South Coast',5,'NSW','south_coast');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Strathfield',5,'NSW','strathfield');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Swansea',5,'NSW','swansea');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Sydney',5,'NSW','sydney');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Tamworth',5,'NSW','tamworth');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Terrigal',5,'NSW','terrigal');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('The Entrance',5,'NSW','the_entrance');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Toongabbie',5,'NSW','toongabbie');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Tweed',5,'NSW','tweed');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Upper Hunter',5,'NSW','upper_hunter');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Vaucluse',5,'NSW','vaucluse');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Wagga Wagga',5,'NSW','wagga_wagga');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Wakehurst',5,'NSW','wakehurst');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Wallsend',5,'NSW','wallsend');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Willoughby',5,'NSW','willoughby');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Wollondilly',5,'NSW','wollondilly');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Wollongong',5,'NSW','wollongong');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Wyong',5,'NSW','wyong');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Albert',6,'QLD','albert');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Charters Towers',6,'QLD','charters_towers');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Hinchinbrook',6,'QLD','hinchinbrook');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mount Coot-tha',6,'QLD','mount_coot-tha');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('South Brisbane',6,'QLD','south_brisbane');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Algester',6,'QLD','algester');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Chatsworth',6,'QLD','chatsworth');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Inala',6,'QLD','inala');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mount Gravatt',6,'QLD','mount_gravatt');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Southern Downs',6,'QLD','southern_downs');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ashgrove',6,'QLD','ashgrove');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Clayfield',6,'QLD','clayfield');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Indooroopilly',6,'QLD','indooroopilly');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mount Isa',6,'QLD','mount_isa');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Southport',6,'QLD','southport');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Aspley',6,'QLD','aspley');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cleveland',6,'QLD','cleveland');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ipswich',6,'QLD','ipswich');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mount Ommaney',6,'QLD','mount_ommaney');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Springwood',6,'QLD','springwood');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Barron River',6,'QLD','barron_river');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cook',6,'QLD','cook');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ipswich West',6,'QLD','ipswich_west');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mudgeeraba',6,'QLD','mudgeeraba');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Stafford',6,'QLD','stafford');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Beaudesert',6,'QLD','beaudesert');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cunningham',6,'QLD','cunningham');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Kallangur',6,'QLD','kallangur');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mulgrave',6,'QLD','mulgrave');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Stretton',6,'QLD','stretton');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Brisbane Central',6,'QLD','brisbane_central');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Currumbin',6,'QLD','currumbin');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Kawana',6,'QLD','kawana');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mundingburra',6,'QLD','mundingburra');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Surfers Paradise',6,'QLD','surfers_paradise');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Broadwater',6,'QLD','broadwater');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Darling Downs',6,'QLD','darling_downs');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Keppel',6,'QLD','keppel');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Murrumba',6,'QLD','murrumba');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Tablelands',6,'QLD','tablelands');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Bulimba',6,'QLD','bulimba');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Everton ',6,'QLD','everton');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Kurwongbah',6,'QLD','kurwongbah');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Nanango',6,'QLD','nanango');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Thuringowa',6,'QLD','thuringowa');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Bundaberg',6,'QLD','bundaberg');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Ferny Grove',6,'QLD','ferny_grove');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Lockyer',6,'QLD','lockyer');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Nicklin',6,'QLD','nicklin');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Toowoomba North',6,'QLD','toowoomba_north');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Bundamba',6,'QLD','bundamba');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Fitzroy',6,'QLD','fitzroy');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Logan',6,'QLD','logan');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Noosa ',6,'QLD','noosa');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Toowoomba South',6,'QLD','toowoomba_south');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Burdekin',6,'QLD','burdekin');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Gaven',6,'QLD','gaven');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Lytton',6,'QLD','lytton');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Nudgee',6,'QLD','nudgee');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Townsville',6,'QLD','townsville');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Burleigh',6,'QLD','burleigh');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Gladstone',6,'QLD','gladstone');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mackay',6,'QLD','mackay');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Pumicestone',6,'QLD','pumicestone');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Warrego',6,'QLD','warrego');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Burnett',6,'QLD','burnett');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Glass House',6,'QLD','glass_house');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mansfield',6,'QLD','mansfield');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Redcliffe',6,'QLD','redcliffe');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Waterford',6,'QLD','waterford');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Cairns',6,'QLD','cairns');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Greenslopes',6,'QLD','greenslopes');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Maroochydore',6,'QLD','maroochydore');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Redlands',6,'QLD','redlands');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Whitsunday',6,'QLD','whitsunday');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Callide',6,'QLD','callide');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Gregory',6,'QLD','gregory');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Maryborough',6,'QLD','maryborough');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Robina',6,'QLD','robina');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Woodridge',6,'QLD','woodridge');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Caloundra',6,'QLD','caloundra');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Gympie',6,'QLD','gympie');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Mirani',6,'QLD','mirani');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Rockhampton',6,'QLD','rockhampton');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Yeerongpilly',6,'QLD','yeerongpilly');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Capalaba',6,'QLD','capalaba');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Hervey Bay',6,'QLD','hervey_bay');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Moggill',6,'QLD','moggill');
INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('Sandgate',6,'QLD','sandgate');
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
INSERT INTO `constituency_type` VALUES
(1,'European Parliament Constituency',225,'europe'),
(2,'Local Authority Ward',225,'council'),
(3,'UK Parliament Constituency',225,'wesminster'),
(4,'Australian Electoral Division',13,'federalaustralia'),
(5,'NSW Electoral Division',13,'nsw'),
(6,'QLD Electoral Division',13,'qld');
/*!40000 ALTER TABLE `constituency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituency_election`
--

DROP TABLE IF EXISTS `constituency_election`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `constituency_election` (
  `constituency_election_id` int(11) NOT NULL AUTO_INCREMENT,
  `constituency_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  PRIMARY KEY (`constituency_election_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `constituency_election`
--

LOCK TABLES `constituency_election` WRITE;
/*!40000 ALTER TABLE `constituency_election` DISABLE KEYS */;
INSERT INTO `constituency_election` VALUES (1, 1, 1),(2, 2, 1),(3, 3, 1),(4, 4, 1),(5, 5, 1),(6, 6, 1),(7, 7, 1),(8, 8, 1),(9, 9, 1),(10, 10, 1),(11, 11, 1),(12, 12, 1),(13, 13, 1),(14, 14, 1),(15, 15, 1),(16, 16, 1),(17, 17, 1),(18, 18, 1),(19, 19, 1),(20, 20, 1),(21, 21, 1),(22, 22, 1),(23, 23, 1),(24, 24, 1),(25, 25, 1),(26, 26, 1),(27, 27, 1),(28, 28, 1),(29, 29, 1),(30, 30, 1),(31, 31, 1),(32, 32, 1),(33, 33, 1),(34, 34, 1),(35, 35, 1),(36, 36, 1),(37, 37, 1),(38, 38, 1),(39, 39, 1),(40, 40, 1),(41, 41, 1),(42, 42, 1),(43, 43, 1),(44, 44, 1),(45, 45, 1),(46, 46, 1),(47, 47, 1),(48, 48, 1),(49, 49, 1),(50, 50, 1),(51, 51, 1),(52, 52, 1),(53, 53, 1),(54, 54, 1),(55, 55, 1),(56, 56, 1),(57, 57, 1),(58, 58, 1),(59, 59, 1),(60, 60, 1),(61, 61, 1),(62, 62, 1),(63, 63, 1),(64, 64, 1),(65, 65, 1),(66, 66, 1),(67, 67, 1),(68, 68, 1),(69, 69, 1),(70, 70, 1),(71, 71, 1),(72, 72, 1),(73, 73, 1),(74, 74, 1),(75, 75, 1),(76, 76, 1),(77, 77, 1),(78, 78, 1),(79, 79, 1),(80, 80, 1),(81, 81, 1),(82, 82, 1),(83, 83, 1),(84, 84, 1),(85, 85, 1),(86, 86, 1),(87, 87, 1),(88, 88, 1),(89, 89, 1),(90, 90, 1),(91, 91, 1),(92, 92, 1),(93, 93, 1),(94, 94, 1),(95, 95, 1),(96, 96, 1),(97, 97, 1),(98, 98, 1),(99, 99, 1),(100, 100, 1),(101, 101, 1),(102, 102, 1),(103, 103, 1),(104, 104, 1),(105, 105, 1),(106, 106, 1),(107, 107, 1),(108, 108, 1),(109, 109, 1),(110, 110, 1),(111, 111, 1),(112, 112, 1),(113, 113, 1),(114, 114, 1),(115, 115, 1),(116, 116, 1),(117, 117, 1),(118, 118, 1),(119, 119, 1),(120, 120, 1),(121, 121, 1),(122, 122, 1),(123, 123, 1),(124, 124, 1),(125, 125, 1),(126, 126, 1),(127, 127, 1),(128, 128, 1),(129, 129, 1),(130, 130, 1),(131, 131, 1),(132, 132, 1),(133, 133, 1),(134, 134, 1),(135, 135, 1),(136, 136, 1),(137, 137, 1),(138, 138, 1),(139, 139, 1),(140, 140, 1),(141, 141, 1),(142, 142, 1),(143, 143, 1),(144, 144, 1),(145, 145, 1),(146, 146, 1),(147, 147, 1),(148, 148, 1),(149, 149, 1),(150, 150, 1);
/*!40000 ALTER TABLE `constituency_election` ENABLE KEYS */;
UNLOCK TABLES;

-- NSW
INSERT INTO `constituency_election` (constituency_id, election_id) SELECT constituency_id, 2 FROM constituency WHERE constituency_type_id=5;

-- QLD
INSERT INTO `constituency_election` (constituency_id, election_id) SELECT constituency_id, 3 FROM constituency WHERE constituency_type_id=6;
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
INSERT INTO `election` VALUES
(1,'Australian Federal Election 2010',1,'2010-08-21'),
(2,'NSW State Election 2011',1,'2011-03-26'),
(3,'QLD State Election 2012',1,'2012-03-01');
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
INSERT INTO `party` VALUES
(1,'Australia First Party (NSW) Incorporated',13,NULL,NULL,'australia_first_party_(nsw)_incorporated',NULL,NULL),
(2,'Australian Democrats',13,NULL,NULL,'australian_democrats',NULL,NULL),
(3,'Australian Fishing and Lifestyle Party',13,NULL,NULL,'australian_fishing_and_lifestyle_party',NULL,NULL),
(4,'Australian Greens',13,NULL,NULL,'australian_greens',NULL,NULL),
(5,'Australian Sex Party',13,NULL,NULL,'australian_sex_party',NULL,NULL),
(6,'Carers Alliance',13,NULL,NULL,'carers_alliance',NULL,NULL),
(7,'Christian Democratic Party (Fred Nile Group)',13,NULL,NULL,'christian_democratic_party_(fred_nile_group)',NULL,NULL),
(8,'Citizens Electoral Council of Australia',13,NULL,NULL,'citizens_electoral_council_of_australia',NULL,NULL),
(9,'Communist Alliance',13,NULL,NULL,'communist_alliance',NULL,NULL),
(10,'Country Liberals (Northern Territory)',13,NULL,NULL,'country_liberals_(northern_territory)',NULL,NULL),
(11,'Democratic Labor Party (DLP) of Australia',13,NULL,NULL,'democratic_labor_party_(dlp)_of_australia',NULL,NULL),
(12,'Family First Party',13,NULL,NULL,'family_first_party',NULL,NULL),
(13,'Liberal Party of Australia',13,NULL,NULL,'liberal_party_of_australia',NULL,NULL),
(14,'National Party of Australia',13,NULL,NULL,'national_party_of_australia',NULL,NULL),
(15,'Non-Custodial Parents Party (Equal Parenting)',13,NULL,NULL,'non-custodial_parents_party_(equal_parenting)',NULL,NULL),
(16,'One Nation',13,NULL,NULL,'one_nation',NULL,NULL),
(17,'Senator On-Line',13,NULL,NULL,'senator_on-line',NULL,NULL),
(18,'Shooters and Fishers Party',13,NULL,NULL,'shooters_and_fishers_party',NULL,NULL),
(19,'Socialist Alliance',13,NULL,NULL,'socialist_alliance',NULL,NULL),
(20,'Socialist Equality Party',13,NULL,NULL,'socialist_equality_party',NULL,NULL),
(21,'Independent',13,NULL,NULL,'independent',NULL,NULL),
(22,'Australian Labor Party (ALP)',13,NULL,NULL,'australian_labor_party_(ALP)',NULL,NULL),
(23,'Building Australia Party',13,NULL,NULL,'building_australia_party',NULL,NULL),
(24,'Liberal Democratic Party',13,NULL,NULL,'liberal_democratic_party',NULL,NULL),
(25,'Secular Party of Australia',13,NULL,NULL,'secular_party_of_australia',NULL,NULL),
(26,'The Climate Sceptics',13,NULL,NULL,'the_climate_sceptics',NULL,NULL),
(27, 'Country Labor Party', 13, NULL, NULL, 'country_labor_party', NULL, NULL),
(28, 'No Parking Meters Party', 13, NULL, NULL, 'no_parking_meters_party', NULL, NULL),
(29, 'Outdoor Recreation Party', 13, NULL, NULL, 'outdoor_recreation_party', NULL, NULL),
(30, 'Restore the Workers'' Rights Party', 13, NULL, NULL, 'restore_the_workers_rights_party', NULL, NULL),
(31, 'Save Our State', 13, NULL, NULL, 'save_our_state', NULL, NULL),
(32, 'The Fishing Party', 13, NULL, NULL, 'the_fishing_party', NULL, NULL),
(33, 'Unity Party', 13, NULL, NULL, 'unity_party', NULL, NULL);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_election`
--

DROP TABLE IF EXISTS `party_election`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `party_election` (
  `party_election_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`party_election_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `party_election`
--

LOCK TABLES `party_election` WRITE;
/*!40000 ALTER TABLE `party_election` DISABLE KEYS */;
INSERT INTO `party_election` VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5),
(6,1,6),
(7,1,7),
(8,1,8),
(9,1,9),
(10,1,10),
(11,1,11),
(12,1,12),
(13,1,13),
(14,1,14),
(15,1,15),
(16,1,16),
(17,1,17),
(18,1,18),
(19,1,19),
(20,1,20),
(21,1,21),
(22,1,22),
(23,1,23),
(24,1,24),
(25,1,25),
(26,1,26),
(27,2,2),
(28,2,22),
(29,2,23),
(30,2,7),
(31,2,27),
(32,2,12),
(33,2,13),
(34,2,14),
(35,2,28),
(36,2,29),
(37,2,30),
(38,2,31),
(39,2,19),
(40,2,32),
(41,2,4),
(42,2,18),
(43,2,33);
/*!40000 ALTER TABLE `party_election` ENABLE KEYS */;
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
