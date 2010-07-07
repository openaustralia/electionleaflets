-- MySQL dump 10.11
--
-- Host: localhost    Database: fairdinkum
-- ------------------------------------------------------
-- Server version	5.0.51a-24+lenny4

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
  `category_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` text,
  `default_value` tinyint(1) default NULL,
  PRIMARY KEY  (`category_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (13,'Litter / dog waste / graffiti','Littering',NULL),(2,'Foreign affairs','Foriegn policy or war',NULL),(3,'Economy','The economy, spending or financial management',NULL),(4,'Education','Schools, universities or adult education',0),(5,'Crime','Crime and disorder',0),(6,'Immigration','Immigration',NULL),(7,'Environment','e.g. Climate change or green belt land',NULL),(8,'Transport','Local or national transport',0),(9,'Tax','Local or national taxation',NULL),(10,'Local issue or campaign','e.g. Closure of a local hospital',NULL),(11,'Young people','e.g. Activities for young people',NULL),(12,'Culture','The arts',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituency`
--

DROP TABLE IF EXISTS `constituency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `constituency` (
  `constituency_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `alternative_name` varchar(255) default NULL,
  `constituency_type_id` int(11) NOT NULL,
  `retired` tinyint(1) default '0',
  `area_code` varchar(20) default NULL,
  `area_uri` varchar(255) default NULL,
  `wikipedia_url` varchar(255) default NULL,
  `url_id` varchar(100) default NULL,
  `guardian_aristotle_id` int(11) default NULL,
  `guardian_pa_code` int(11) default NULL,
  PRIMARY KEY  (`constituency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8399 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `constituency`
--

LOCK TABLES `constituency` WRITE;
/*!40000 ALTER TABLE `constituency` DISABLE KEYS */;
/*!40000 ALTER TABLE `constituency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituency_type`
--

DROP TABLE IF EXISTS `constituency_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `constituency_type` (
  `constituency_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `url_id` varchar(100) default NULL,
  PRIMARY KEY  (`constituency_type_id`)
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
  `country_id` int(11) NOT NULL auto_increment,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `iso3` char(3) default NULL,
  PRIMARY KEY  (`country_id`)
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
  `election_id` int(11) NOT NULL auto_increment,
  `name` varchar(150) NOT NULL,
  `election_type_id` int(11) NOT NULL,
  `vote_date` date NOT NULL,
  PRIMARY KEY  (`election_id`)
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
  `election_type_id` int(11) NOT NULL auto_increment,
  `name` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY  (`election_type_id`)
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
  `email_alert_id` int(11) NOT NULL auto_increment,
  `email` varchar(50) NOT NULL,
  `frequency_hours` int(11) NOT NULL,
  `last_sent` datetime default NULL,
  `type` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `activated` tinyint(1) default '0',
  `confirm_id` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY  (`email_alert_id`)
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
  `email_que_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) NOT NULL,
  `postcode` varchar(20) NOT NULL,
  `delivery_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`email_que_id`)
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
  `image_que_id` int(11) NOT NULL auto_increment,
  `upload_key` varchar(255) NOT NULL,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `image_key` varchar(255) default NULL,
  `uploaded_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`image_que_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `image_que`
--

LOCK TABLES `image_que` WRITE;
/*!40000 ALTER TABLE `image_que` DISABLE KEYS */;
INSERT INTO `image_que` VALUES (1,'55e7ac91a6dd89a5bbd74e51c0b0ed2b',NULL,NULL,'b422337044b6143baa26eda7fbf61273','2010-07-06 12:29:58'),(2,'a66468d235465d96000a83a60cfdf409',NULL,NULL,'a5cb8db8e4d2741faee28c73c3a0cd89','2010-07-06 12:30:17'),(3,'7c6dca36c3866aad5eff5926776f2e17',NULL,NULL,'b422337044b6143baa26eda7fbf61273','2010-07-06 12:36:33'),(4,'31378da3f7e9f93f91cc4adc9249c20f',NULL,NULL,'239e04eed7cadd2e35534be93c4a2d31','2010-07-06 12:37:06'),(5,'848b082aed92b27ae34aeae270d5c9f6',NULL,NULL,'239e04eed7cadd2e35534be93c4a2d31','2010-07-06 13:09:10'),(6,'ebaccd6c1e583007bec0f8a8e3a4c62d',NULL,NULL,'5305d64b40a4520e3224e8a33c901208','2010-07-06 14:00:28'),(7,'413b0321b08f341ee2957759b03055fb',NULL,NULL,'5305d64b40a4520e3224e8a33c901208','2010-07-06 14:01:44'),(12,'3f1add72cb8314e8bbf2b91a10db96d0',NULL,NULL,'5305d64b40a4520e3224e8a33c901208','2010-07-07 11:44:58'),(14,'48d141104fff34d8b5239ddb86286e97',NULL,NULL,'5305d64b40a4520e3224e8a33c901208','2010-07-07 13:12:40'),(15,'db811449e2d5d91776163e95ddb823a9',NULL,NULL,'5305d64b40a4520e3224e8a33c901208','2010-07-07 13:13:19'),(16,'637420af70e8bad0787ae8524f12d007',NULL,NULL,'c61ab2b0684e341f3fd525f435498599','2010-07-07 13:17:31'),(17,'8424c67f33c37745e414c62ad295e515',NULL,NULL,'5305d64b40a4520e3224e8a33c901208','2010-07-07 13:18:49'),(18,'013b666c866d8ed31ed4ab40dc292d80',NULL,NULL,'ae1d4d5c987d7dae29708092ed6d20ac','2010-07-07 13:28:54'),(19,'102c14538fe965fe5599646211283a3e',NULL,NULL,'b422337044b6143baa26eda7fbf61273','2010-07-07 13:49:13');
/*!40000 ALTER TABLE `image_que` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_que_seq`
--

DROP TABLE IF EXISTS `image_que_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `image_que_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `image_que_seq`
--

LOCK TABLES `image_que_seq` WRITE;
/*!40000 ALTER TABLE `image_que_seq` DISABLE KEYS */;
INSERT INTO `image_que_seq` VALUES (20);
/*!40000 ALTER TABLE `image_que_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet`
--

DROP TABLE IF EXISTS `leaflet`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet` (
  `leaflet_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` text,
  `publisher__id` int(11) NOT NULL,
  `postcode` varchar(50) default NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_uploaded` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `date_delivered` datetime NOT NULL,
  `live` tinyint(1) default NULL,
  PRIMARY KEY  (`leaflet_id`),
  KEY `title` (`title`),
  KEY `date_uploaded` (`date_uploaded`),
  KEY `latlng` (`lng`,`lat`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet`
--

LOCK TABLES `leaflet` WRITE;
/*!40000 ALTER TABLE `leaflet` DISABLE KEYS */;
INSERT INTO `leaflet` VALUES (15,'UKIP manifesto','stuff about UKIP',1282,'sw98jx',-0.114293,51.4624,'Richard Pope','richard@memespring.co.uk','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(16,'Castle Voice','Development on marshall\\\'s airfield; money sent to iceland; and road crash budget.',1109,'cb12ld',0.136656,52.2045,'Richard Pope','richard@memespring.co.uk','2009-05-05 05:31:53','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `leaflet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_category`
--

DROP TABLE IF EXISTS `leaflet_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_category` (
  `leaflet_category_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_category`
--

LOCK TABLES `leaflet_category` WRITE;
/*!40000 ALTER TABLE `leaflet_category` DISABLE KEYS */;
INSERT INTO `leaflet_category` VALUES (3,15,5),(4,15,4),(5,16,7),(6,16,9);
/*!40000 ALTER TABLE `leaflet_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_category_seq`
--

DROP TABLE IF EXISTS `leaflet_category_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_category_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_category_seq`
--

LOCK TABLES `leaflet_category_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_category_seq` DISABLE KEYS */;
INSERT INTO `leaflet_category_seq` VALUES (6);
/*!40000 ALTER TABLE `leaflet_category_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_constituency`
--

DROP TABLE IF EXISTS `leaflet_constituency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_constituency` (
  `leaflet_constituency_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `constituency_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_constituency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY  (`leaflet_election_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_election`
--

LOCK TABLES `leaflet_election` WRITE;
/*!40000 ALTER TABLE `leaflet_election` DISABLE KEYS */;
INSERT INTO `leaflet_election` VALUES (3,15,1),(4,16,2);
/*!40000 ALTER TABLE `leaflet_election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_election__seq`
--

DROP TABLE IF EXISTS `leaflet_election__seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_election__seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
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
  PRIMARY KEY  (`leaflet_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_image`
--

LOCK TABLES `leaflet_image` WRITE;
/*!40000 ALTER TABLE `leaflet_image` DISABLE KEYS */;
INSERT INTO `leaflet_image` VALUES (1,15,'6c3cf28d08501075fa93d41419c488de',1),(2,15,'d58f211ea0aa046a8ea5aa5494e8660c',2),(3,16,'aaa1859e1f2c2d2e5d119598a3d5b743',1);
/*!40000 ALTER TABLE `leaflet_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_image_seq`
--

DROP TABLE IF EXISTS `leaflet_image_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_image_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_image_seq`
--

LOCK TABLES `leaflet_image_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_image_seq` DISABLE KEYS */;
INSERT INTO `leaflet_image_seq` VALUES (3);
/*!40000 ALTER TABLE `leaflet_image_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_party_attack`
--

DROP TABLE IF EXISTS `leaflet_party_attack`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_party_attack` (
  `leaflet_party_attack_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_party_attack_id`),
  KEY `leaflet_id` (`leaflet_id`),
  KEY `party_id` (`party_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_party_attack`
--

LOCK TABLES `leaflet_party_attack` WRITE;
/*!40000 ALTER TABLE `leaflet_party_attack` DISABLE KEYS */;
INSERT INTO `leaflet_party_attack` VALUES (3,15,1109),(4,16,1111);
/*!40000 ALTER TABLE `leaflet_party_attack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_party_attack_seq`
--

DROP TABLE IF EXISTS `leaflet_party_attack_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_party_attack_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_party_attack_seq`
--

LOCK TABLES `leaflet_party_attack_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_party_attack_seq` DISABLE KEYS */;
INSERT INTO `leaflet_party_attack_seq` VALUES (4);
/*!40000 ALTER TABLE `leaflet_party_attack_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_seq`
--

DROP TABLE IF EXISTS `leaflet_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_seq`
--

LOCK TABLES `leaflet_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_seq` DISABLE KEYS */;
INSERT INTO `leaflet_seq` VALUES (22);
/*!40000 ALTER TABLE `leaflet_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_tag`
--

DROP TABLE IF EXISTS `leaflet_tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_tag` (
  `leaflet_tag_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_tag_id`),
  KEY `leaflet_id` (`leaflet_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_tag`
--

LOCK TABLES `leaflet_tag` WRITE;
/*!40000 ALTER TABLE `leaflet_tag` DISABLE KEYS */;
INSERT INTO `leaflet_tag` VALUES (3,15,3),(4,15,4),(5,15,5),(6,15,6),(7,15,7),(8,15,8),(9,16,9),(10,16,10);
/*!40000 ALTER TABLE `leaflet_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaflet_tag_seq`
--

DROP TABLE IF EXISTS `leaflet_tag_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `leaflet_tag_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `leaflet_tag_seq`
--

LOCK TABLES `leaflet_tag_seq` WRITE;
/*!40000 ALTER TABLE `leaflet_tag_seq` DISABLE KEYS */;
INSERT INTO `leaflet_tag_seq` VALUES (10);
/*!40000 ALTER TABLE `leaflet_tag_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `party` (
  `party_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `major` tinyint(1) default NULL,
  `logo_file` varchar(100) default NULL,
  `url_id` varchar(255) default NULL,
  `colour` char(6) default NULL,
  `twitter_account` varchar(50) default NULL,
  PRIMARY KEY  (`party_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1360 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1358,'test1',13,NULL,NULL,NULL,NULL,NULL),(1359,'test2',13,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promise`
--

DROP TABLE IF EXISTS `promise`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `promise` (
  `promise_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY  (`promise_id`)
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
  `rate_interesting_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY  (`rate_interesting_id`)
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
  `rate_type_id` int(11) NOT NULL auto_increment,
  `left_label` varchar(50) NOT NULL,
  `right_label` varchar(50) default NULL,
  PRIMARY KEY  (`rate_type_id`)
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
  `rate_value_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `rate_type_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY  (`rate_value_id`)
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
  `tag_id` int(11) NOT NULL auto_increment,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY  (`tag_id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (3,'europe'),(4,'pound'),(5,'hatred'),(10,'iceland'),(9,'cambridge');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_seq`
--

DROP TABLE IF EXISTS `tag_seq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tag_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tag_seq`
--

LOCK TABLES `tag_seq` WRITE;
/*!40000 ALTER TABLE `tag_seq` DISABLE KEYS */;
INSERT INTO `tag_seq` VALUES (10);
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

-- Dump completed on 2010-07-07 13:55:39
