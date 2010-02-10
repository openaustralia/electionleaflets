
DROP TABLE IF EXISTS `category`;
CREATE TABLE  `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` text,
  `default_value` tinyint(1) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
LOCK TABLES `category` WRITE;
INSERT INTO `category` VALUES  (13,'Litter / dog waste / graffiti','Littering',NULL),
 (2,'Foreign affairs','Foriegn policy or war',NULL),
 (3,'Economy','The economy, spending or financial management',NULL),
 (4,'Education','Schools, universities or adult education',0),
 (5,'Crime','Crime and disorder',0),
 (6,'Immigration','Immigration',NULL),
 (7,'Environment','e.g. Climate change or green belt land',NULL),
 (8,'Transport','Local or national transport',0),
 (9,'Tax','Local or national taxation',NULL),
 (10,'Local issue or campaign','e.g. Closure of a local hospital',NULL),
 (11,'Young people','e.g. Activities for young people',NULL),
 (12,'Culture','The arts',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE  `country` (
  `country_id` int(11) NOT NULL auto_increment,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `iso3` char(3) default NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
LOCK TABLES `country` WRITE;
INSERT INTO `country` VALUES  (1,'AF','Afghanistan','AFG'),
 (2,'AL','Albania','ALB'),
 (3,'DZ','Algeria','DZA'),
 (4,'AS','American Samoa','ASM'),
 (5,'AD','Andorra','AND'),
 (6,'AO','Angola','AGO'),
 (7,'AI','Anguilla','AIA'),
 (8,'AQ','Antarctica',NULL),
 (9,'AG','Antigua and Barbuda','ATG'),
 (10,'AR','Argentina','ARG'),
 (11,'AM','Armenia','ARM'),
 (12,'AW','Aruba','ABW'),
 (13,'AU','Australia','AUS'),
 (14,'AT','Austria','AUT'),
 (15,'AZ','Azerbaijan','AZE'),
 (16,'BS','Bahamas','BHS'),
 (17,'BH','Bahrain','BHR'),
 (18,'BD','Bangladesh','BGD'),
 (19,'BB','Barbados','BRB'),
 (20,'BY','Belarus','BLR'),
 (21,'BE','Belgium','BEL'),
 (22,'BZ','Belize','BLZ'),
 (23,'BJ','Benin','BEN'),
 (24,'BM','Bermuda','BMU'),
 (25,'BT','Bhutan','BTN'),
 (26,'BO','Bolivia','BOL'),
 (27,'BA','Bosnia and Herzegovina','BIH'),
 (28,'BW','Botswana','BWA'),
 (29,'BV','Bouvet Island',NULL),
 (30,'BR','Brazil','BRA'),
 (31,'IO','British Indian Ocean Territory',NULL),
 (32,'BN','Brunei Darussalam','BRN'),
 (33,'BG','Bulgaria','BGR'),
 (34,'BF','Burkina Faso','BFA'),
 (35,'BI','Burundi','BDI'),
 (36,'KH','Cambodia','KHM'),
 (37,'CM','Cameroon','CMR'),
 (38,'CA','Canada','CAN'),
 (39,'CV','Cape Verde','CPV'),
 (40,'KY','Cayman Islands','CYM'),
 (41,'CF','Central African Republic','CAF'),
 (42,'TD','Chad','TCD'),
 (43,'CL','Chile','CHL'),
 (44,'CN','China','CHN'),
 (45,'CX','Christmas Island',NULL),
 (46,'CC','Cocos (Keeling) Islands',NULL),
 (47,'CO','Colombia','COL'),
 (48,'KM','Comoros','COM'),
 (49,'CG','Congo','COG'),
 (50,'CD','Congo, the Democratic Republic of the','COD'),
 (51,'CK','Cook Islands','COK'),
 (52,'CR','Costa Rica','CRI'),
 (53,'CI','Cote D\'Ivoire','CIV'),
 (54,'HR','Croatia','HRV'),
 (55,'CU','Cuba','CUB'),
 (56,'CY','Cyprus','CYP'),
 (57,'CZ','Czech Republic','CZE'),
 (58,'DK','Denmark','DNK'),
 (59,'DJ','Djibouti','DJI'),
 (60,'DM','Dominica','DMA'),
 (61,'DO','Dominican Republic','DOM'),
 (62,'EC','Ecuador','ECU'),
 (63,'EG','Egypt','EGY'),
 (64,'SV','El Salvador','SLV'),
 (65,'GQ','Equatorial Guinea','GNQ'),
 (66,'ER','Eritrea','ERI'),
 (67,'EE','Estonia','EST'),
 (68,'ET','Ethiopia','ETH'),
 (69,'FK','Falkland Islands (Malvinas)','FLK'),
 (70,'FO','Faroe Islands','FRO'),
 (71,'FJ','Fiji','FJI'),
 (72,'FI','Finland','FIN'),
 (73,'FR','France','FRA'),
 (74,'GF','French Guiana','GUF'),
 (75,'PF','French Polynesia','PYF'),
 (76,'TF','French Southern Territories',NULL),
 (77,'GA','Gabon','GAB'),
 (78,'GM','Gambia','GMB'),
 (79,'GE','Georgia','GEO'),
 (80,'DE','Germany','DEU'),
 (81,'GH','Ghana','GHA'),
 (82,'GI','Gibraltar','GIB'),
 (83,'GR','Greece','GRC'),
 (84,'GL','Greenland','GRL'),
 (85,'GD','Grenada','GRD'),
 (86,'GP','Guadeloupe','GLP'),
 (87,'GU','Guam','GUM'),
 (88,'GT','Guatemala','GTM'),
 (89,'GN','Guinea','GIN'),
 (90,'GW','Guinea-Bissau','GNB'),
 (91,'GY','Guyana','GUY'),
 (92,'HT','Haiti','HTI'),
 (93,'HM','Heard Island and Mcdonald Islands',NULL),
 (94,'VA','Holy See (Vatican City State)','VAT'),
 (95,'HN','Honduras','HND'),
 (96,'HK','Hong Kong','HKG'),
 (97,'HU','Hungary','HUN'),
 (98,'IS','Iceland','ISL'),
 (99,'IN','India','IND'),
 (100,'ID','Indonesia','IDN'),
 (101,'IR','Iran, Islamic Republic of','IRN'),
 (102,'IQ','Iraq','IRQ'),
 (103,'IE','Ireland','IRL'),
 (104,'IL','Israel','ISR'),
 (105,'IT','Italy','ITA'),
 (106,'JM','Jamaica','JAM'),
 (107,'JP','Japan','JPN'),
 (108,'JO','Jordan','JOR'),
 (109,'KZ','Kazakhstan','KAZ'),
 (110,'KE','Kenya','KEN'),
 (111,'KI','Kiribati','KIR'),
 (112,'KP','Korea, Democratic People\'s Republic of','PRK'),
 (113,'KR','Korea, Republic of','KOR'),
 (114,'KW','Kuwait','KWT'),
 (115,'KG','Kyrgyzstan','KGZ'),
 (116,'LA','Lao People\'s Democratic Republic','LAO'),
 (117,'LV','Latvia','LVA'),
 (118,'LB','Lebanon','LBN'),
 (119,'LS','Lesotho','LSO'),
 (120,'LR','Liberia','LBR'),
 (121,'LY','Libyan Arab Jamahiriya','LBY'),
 (122,'LI','Liechtenstein','LIE'),
 (123,'LT','Lithuania','LTU'),
 (124,'LU','Luxembourg','LUX'),
 (125,'MO','Macao','MAC'),
 (126,'MK','Macedonia, the Former Yugoslav Republic of','MKD'),
 (127,'MG','Madagascar','MDG'),
 (128,'MW','Malawi','MWI'),
 (129,'MY','Malaysia','MYS'),
 (130,'MV','Maldives','MDV'),
 (131,'ML','Mali','MLI'),
 (132,'MT','Malta','MLT'),
 (133,'MH','Marshall Islands','MHL'),
 (134,'MQ','Martinique','MTQ'),
 (135,'MR','Mauritania','MRT'),
 (136,'MU','Mauritius','MUS'),
 (137,'YT','Mayotte',NULL),
 (138,'MX','Mexico','MEX'),
 (139,'FM','Micronesia, Federated States of','FSM'),
 (140,'MD','Moldova, Republic of','MDA'),
 (141,'MC','Monaco','MCO'),
 (142,'MN','Mongolia','MNG'),
 (143,'MS','Montserrat','MSR'),
 (144,'MA','Morocco','MAR'),
 (145,'MZ','Mozambique','MOZ'),
 (146,'MM','Myanmar','MMR'),
 (147,'NA','Namibia','NAM'),
 (148,'NR','Nauru','NRU'),
 (149,'NP','Nepal','NPL'),
 (150,'NL','Netherlands','NLD'),
 (151,'AN','Netherlands Antilles','ANT'),
 (152,'NC','New Caledonia','NCL'),
 (153,'NZ','New Zealand','NZL'),
 (154,'NI','Nicaragua','NIC'),
 (155,'NE','Niger','NER'),
 (156,'NG','Nigeria','NGA'),
 (157,'NU','Niue','NIU'),
 (158,'NF','Norfolk Island','NFK'),
 (159,'MP','Northern Mariana Islands','MNP'),
 (160,'NO','Norway','NOR'),
 (161,'OM','Oman','OMN'),
 (162,'PK','Pakistan','PAK'),
 (163,'PW','Palau','PLW'),
 (164,'PS','Palestinian Territory, Occupied',NULL),
 (165,'PA','Panama','PAN'),
 (166,'PG','Papua New Guinea','PNG'),
 (167,'PY','Paraguay','PRY'),
 (168,'PE','Peru','PER'),
 (169,'PH','Philippines','PHL'),
 (170,'PN','Pitcairn','PCN'),
 (171,'PL','Poland','POL'),
 (172,'PT','Portugal','PRT'),
 (173,'PR','Puerto Rico','PRI'),
 (174,'QA','Qatar','QAT'),
 (175,'RE','Reunion','REU'),
 (176,'RO','Romania','ROM'),
 (177,'RU','Russian Federation','RUS'),
 (178,'RW','Rwanda','RWA'),
 (179,'SH','Saint Helena','SHN'),
 (180,'KN','Saint Kitts and Nevis','KNA'),
 (181,'LC','Saint Lucia','LCA'),
 (182,'PM','Saint Pierre and Miquelon','SPM'),
 (183,'VC','Saint Vincent and the Grenadines','VCT'),
 (184,'WS','Samoa','WSM'),
 (185,'SM','San Marino','SMR'),
 (186,'ST','Sao Tome and Principe','STP'),
 (187,'SA','Saudi Arabia','SAU'),
 (188,'SN','Senegal','SEN'),
 (189,'CS','Serbia and Montenegro',NULL),
 (190,'SC','Seychelles','SYC'),
 (191,'SL','Sierra Leone','SLE'),
 (192,'SG','Singapore','SGP'),
 (193,'SK','Slovakia','SVK'),
 (194,'SI','Slovenia','SVN'),
 (195,'SB','Solomon Islands','SLB'),
 (196,'SO','Somalia','SOM'),
 (197,'ZA','South Africa','ZAF'),
 (198,'GS','South Georgia and the South Sandwich Islands',NULL),
 (199,'ES','Spain','ESP'),
 (200,'LK','Sri Lanka','LKA'),
 (201,'SD','Sudan','SDN'),
 (202,'SR','Suriname','SUR'),
 (203,'SJ','Svalbard and Jan Mayen','SJM'),
 (204,'SZ','Swaziland','SWZ'),
 (205,'SE','Sweden','SWE'),
 (206,'CH','Switzerland','CHE'),
 (207,'SY','Syrian Arab Republic','SYR'),
 (208,'TW','Taiwan, Province of China','TWN'),
 (209,'TJ','Tajikistan','TJK'),
 (210,'TZ','Tanzania, United Republic of','TZA'),
 (211,'TH','Thailand','THA'),
 (212,'TL','Timor-Leste',NULL),
 (213,'TG','Togo','TGO'),
 (214,'TK','Tokelau','TKL'),
 (215,'TO','Tonga','TON'),
 (216,'TT','Trinidad and Tobago','TTO'),
 (217,'TN','Tunisia','TUN'),
 (218,'TR','Turkey','TUR'),
 (219,'TM','Turkmenistan','TKM'),
 (220,'TC','Turks and Caicos Islands','TCA'),
 (221,'TV','Tuvalu','TUV'),
 (222,'UG','Uganda','UGA'),
 (223,'UA','Ukraine','UKR'),
 (224,'AE','United Arab Emirates','ARE'),
 (225,'GB','United Kingdom','GBR'),
 (226,'US','United States','USA'),
 (227,'UM','United States Minor Outlying Islands',NULL),
 (228,'UY','Uruguay','URY'),
 (229,'UZ','Uzbekistan','UZB'),
 (230,'VU','Vanuatu','VUT'),
 (231,'VE','Venezuela','VEN'),
 (232,'VN','Viet Nam','VNM'),
 (233,'VG','Virgin Islands, British','VGB'),
 (234,'VI','Virgin Islands, U.s.','VIR'),
 (235,'WF','Wallis and Futuna','WLF'),
 (236,'EH','Western Sahara','ESH'),
 (237,'YE','Yemen','YEM'),
 (238,'ZM','Zambia','ZMB'),
 (239,'ZW','Zimbabwe','ZWE');
UNLOCK TABLES;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `election`
--

DROP TABLE IF EXISTS `election`;
CREATE TABLE  `election` (
  `election_id` int(11) NOT NULL auto_increment,
  `name` varchar(150) NOT NULL,
  `election_type_id` int(11) NOT NULL,
  `vote_date` date NOT NULL,
  PRIMARY KEY  (`election_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `election`
--

/*!40000 ALTER TABLE `election` DISABLE KEYS */;
LOCK TABLES `election` WRITE;
INSERT INTO `election` VALUES  (1,'European election 2009',7,'2009-06-04'),
 (2,'English local government elections 2009',2,'2009-06-04');
UNLOCK TABLES;
/*!40000 ALTER TABLE `election` ENABLE KEYS */;


--
-- Definition of table `election_type`
--

DROP TABLE IF EXISTS `election_type`;
CREATE TABLE  `election_type` (
  `election_type_id` int(11) NOT NULL auto_increment,
  `name` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY  (`election_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `election_type`
--

/*!40000 ALTER TABLE `election_type` DISABLE KEYS */;
LOCK TABLES `election_type` WRITE;
INSERT INTO `election_type` VALUES  (1,0,225),
 (2,0,225),
 (3,0,225),
 (4,0,225),
 (5,0,225),
 (6,0,225),
 (7,0,225),
 (8,0,225);
UNLOCK TABLES;
/*!40000 ALTER TABLE `election_type` ENABLE KEYS */;


--
-- Definition of table `leaflet`
--

DROP TABLE IF EXISTS `leaflet`;
CREATE TABLE  `leaflet` (
  `leaflet_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` text,
  `publisher_party_id` int(11) NOT NULL,
  `postcode` varchar(50) default NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_uploaded` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `date_delivered` datetime NOT NULL,
  PRIMARY KEY  (`leaflet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaflet`
--

/*!40000 ALTER TABLE `leaflet` DISABLE KEYS */;
LOCK TABLES `leaflet` WRITE;
INSERT INTO `leaflet` VALUES  (15,'UKIP manifesto','stuff about UKIP',1282,'sw98jx',-0.114293,51.4624,'Richard Pope','richard@memespring.co.uk','0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (16,'Castle Voice','Development on marshall\\\'s airfield; money sent to iceland; and road crash budget.',1109,'cb12ld',0.136656,52.2045,'Richard Pope','richard@memespring.co.uk','2009-05-05 15:31:53','0000-00-00 00:00:00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet` ENABLE KEYS */;


--
-- Definition of table `leaflet_category`
--

DROP TABLE IF EXISTS `leaflet_category`;
CREATE TABLE  `leaflet_category` (
  `leaflet_category_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaflet_category`
--

/*!40000 ALTER TABLE `leaflet_category` DISABLE KEYS */;
LOCK TABLES `leaflet_category` WRITE;
INSERT INTO `leaflet_category` VALUES  (3,15,5),
 (4,15,4),
 (5,16,7),
 (6,16,9);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_category` ENABLE KEYS */;


--
-- Definition of table `leaflet_category_seq`
--

DROP TABLE IF EXISTS `leaflet_category_seq`;
CREATE TABLE  `leaflet_category_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaflet_category_seq`
--

/*!40000 ALTER TABLE `leaflet_category_seq` DISABLE KEYS */;
LOCK TABLES `leaflet_category_seq` WRITE;
INSERT INTO `leaflet_category_seq` VALUES  (6);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_category_seq` ENABLE KEYS */;


--
-- Definition of table `leaflet_election`
--

DROP TABLE IF EXISTS `leaflet_election`;
CREATE TABLE  `leaflet_election` (
  `leaflet_election_id` int(11) NOT NULL,
  `leaflet_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_election_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaflet_election`
--

/*!40000 ALTER TABLE `leaflet_election` DISABLE KEYS */;
LOCK TABLES `leaflet_election` WRITE;
INSERT INTO `leaflet_election` VALUES  (3,15,1),
 (4,16,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_election` ENABLE KEYS */;


--
-- Definition of table `leaflet_election__seq`
--

DROP TABLE IF EXISTS `leaflet_election__seq`;
CREATE TABLE  `leaflet_election__seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaflet_election__seq`
--

/*!40000 ALTER TABLE `leaflet_election__seq` DISABLE KEYS */;
LOCK TABLES `leaflet_election__seq` WRITE;
INSERT INTO `leaflet_election__seq` VALUES  (4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_election__seq` ENABLE KEYS */;


--
-- Definition of table `leaflet_image`
--

DROP TABLE IF EXISTS `leaflet_image`;
CREATE TABLE  `leaflet_image` (
  `leaflet_image_id` int(11) NOT NULL,
  `leaflet_id` int(11) NOT NULL,
  `image_key` varchar(255) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaflet_image`
--

/*!40000 ALTER TABLE `leaflet_image` DISABLE KEYS */;
LOCK TABLES `leaflet_image` WRITE;
INSERT INTO `leaflet_image` VALUES  (1,15,'6c3cf28d08501075fa93d41419c488de',1),
 (2,15,'d58f211ea0aa046a8ea5aa5494e8660c',2),
 (3,16,'aaa1859e1f2c2d2e5d119598a3d5b743',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_image` ENABLE KEYS */;


--
-- Definition of table `leaflet_image_seq`
--

DROP TABLE IF EXISTS `leaflet_image_seq`;
CREATE TABLE  `leaflet_image_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaflet_image_seq`
--

/*!40000 ALTER TABLE `leaflet_image_seq` DISABLE KEYS */;
LOCK TABLES `leaflet_image_seq` WRITE;
INSERT INTO `leaflet_image_seq` VALUES  (3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_image_seq` ENABLE KEYS */;


--
-- Definition of table `leaflet_party_attack`
--

DROP TABLE IF EXISTS `leaflet_party_attack`;
CREATE TABLE  `leaflet_party_attack` (
  `leaflet_party_attack_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_party_attack_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaflet_party_attack`
--

/*!40000 ALTER TABLE `leaflet_party_attack` DISABLE KEYS */;
LOCK TABLES `leaflet_party_attack` WRITE;
INSERT INTO `leaflet_party_attack` VALUES  (3,15,1109),
 (4,16,1111);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_party_attack` ENABLE KEYS */;


--
-- Definition of table `leaflet_party_attack_seq`
--

DROP TABLE IF EXISTS `leaflet_party_attack_seq`;
CREATE TABLE  `leaflet_party_attack_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaflet_party_attack_seq`
--

/*!40000 ALTER TABLE `leaflet_party_attack_seq` DISABLE KEYS */;
LOCK TABLES `leaflet_party_attack_seq` WRITE;
INSERT INTO `leaflet_party_attack_seq` VALUES  (4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_party_attack_seq` ENABLE KEYS */;


--
-- Definition of table `leaflet_seq`
--

DROP TABLE IF EXISTS `leaflet_seq`;
CREATE TABLE  `leaflet_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaflet_seq`
--

/*!40000 ALTER TABLE `leaflet_seq` DISABLE KEYS */;
LOCK TABLES `leaflet_seq` WRITE;
INSERT INTO `leaflet_seq` VALUES  (16);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_seq` ENABLE KEYS */;


--
-- Definition of table `leaflet_tag`
--

DROP TABLE IF EXISTS `leaflet_tag`;
CREATE TABLE  `leaflet_tag` (
  `leaflet_tag_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`leaflet_tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leaflet_tag`
--

/*!40000 ALTER TABLE `leaflet_tag` DISABLE KEYS */;
LOCK TABLES `leaflet_tag` WRITE;
INSERT INTO `leaflet_tag` VALUES  (3,15,3),
 (4,15,4),
 (5,15,5),
 (6,15,6),
 (7,15,7),
 (8,15,8),
 (9,16,9),
 (10,16,10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_tag` ENABLE KEYS */;


--
-- Definition of table `leaflet_tag_seq`
--

DROP TABLE IF EXISTS `leaflet_tag_seq`;
CREATE TABLE  `leaflet_tag_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaflet_tag_seq`
--

/*!40000 ALTER TABLE `leaflet_tag_seq` DISABLE KEYS */;
LOCK TABLES `leaflet_tag_seq` WRITE;
INSERT INTO `leaflet_tag_seq` VALUES  (10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `leaflet_tag_seq` ENABLE KEYS */;


--
-- Definition of table `party`
--

DROP TABLE IF EXISTS `party`;
CREATE TABLE  `party` (
  `party_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `major` tinyint(1) default NULL,
  PRIMARY KEY  (`party_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1358 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `party`
--

/*!40000 ALTER TABLE `party` DISABLE KEYS */;
LOCK TABLES `party` WRITE;
INSERT INTO `party` VALUES  (966,'1st Pension Party',225,NULL),
 (967,'21st Century Conservative Democrats',225,NULL),
 (968,'A BEE C',225,NULL),
 (969,'Action To Save St.John\'s Hospital',225,NULL),
 (970,'Adam Lyal\'s Witchery Tour Party',225,NULL),
 (971,'Albion Party',225,NULL),
 (972,'Alliance For Green Socialism',225,NULL),
 (973,'Alternative Party',225,NULL),
 (974,'Animals Count',225,NULL),
 (975,'Anti Party',225,NULL),
 (976,'Ashford Independent',225,NULL),
 (977,'Ashtead Independents',225,NULL),
 (978,'Association of Bedfordshire Citizens',225,NULL),
 (979,'Barlborough First',225,NULL),
 (980,'Barnsley Independent Group',225,NULL),
 (981,'Beaconsfield Independent Electors Association',225,NULL),
 (982,'Better Bedford Independent Party',225,NULL),
 (983,'Billingham Independents Association',225,NULL),
 (984,'Borders Party [The]',225,NULL),
 (985,'Boston Bypass Independents',225,NULL),
 (986,'BPP - Putting Britons First',225,NULL),
 (987,'Brighton & Hove Independents',225,NULL),
 (988,'British First Party',225,NULL),
 (990,'British National Party',225,NULL),
 (991,'British Public Party',225,NULL),
 (992,'British Right Alliance',225,NULL),
 (993,'British VOICE',225,NULL),
 (994,'Calverton First Independents Party',225,NULL),
 (995,'Campaign for Independent Politicians',225,NULL),
 (996,'Canvey Island Independent Party',225,NULL),
 (997,'Cardiff Independent Citizens',225,NULL),
 (998,'Centreground Party',225,NULL),
 (999,'Chigwell Residents',225,NULL),
 (1000,'Christian Democratic Party',225,NULL),
 (1001,'Christian Party \"Proclaiming Christ\'s Lordship\"',225,NULL),
 (1002,'Christian Peoples Alliance',225,NULL),
 (1003,'Citizens Party of Halton [The]',225,NULL),
 (1004,'City INDEPENDENTS',225,NULL),
 (1005,'Civilisation Party [The]',225,NULL),
 (1006,'Clause 28, Children\'s Protection Christian Democrats',225,NULL),
 (1007,'Co-operative Party [The]',225,NULL),
 (1008,'Collier Row & Mawneys Residents Association',225,NULL),
 (1009,'Common Good [The]',225,NULL),
 (1010,'Common Sense Party',225,NULL),
 (1011,'Communist Party of Britain',225,NULL),
 (1012,'Community (London Borough of Hounslow) [The]',225,NULL),
 (1013,'Community Action Party',225,NULL),
 (1014,'Community Alliance',225,NULL),
 (1015,'Community Campaign (Hart) [The]',225,NULL),
 (1016,'Community First',225,NULL),
 (1017,'Community Group [The]',225,NULL),
 (1018,'Community Representatives Party',225,NULL),
 (1019,'Consensus [The]',225,NULL),
 (1020,'Conservative Party',225,1),
 (1021,'Council Tax Payers Party (England\'s Own)',225,NULL),
 (1022,'Cumbernauld Independent Councillors Alliance',225,NULL),
 (1023,'Democratic Independence Party',225,NULL),
 (1024,'Democratic Labour Party',225,0),
 (1026,'Democratic Party [The]',225,NULL),
 (1027,'Democratic Socialist Alliance - People Before Profit',225,NULL),
 (1028,'Derwentside Independents',225,NULL),
 (1029,'Devizes Guardians',225,NULL),
 (1030,'Direct Democracy (Communist) Party',225,NULL),
 (1031,'Doncaster First Party [The]',225,NULL),
 (1032,'Dover Alliance [The]',225,NULL),
 (1033,'Dungeons Death And Taxes Party [The]',225,NULL),
 (1034,'Durham Taxpayers Alliance',225,NULL),
 (1035,'East Cleveland Independent',225,NULL),
 (1036,'East Dunbartonshire Independent Alliance',225,NULL),
 (1037,'East Herts People',225,NULL),
 (1038,'East Kilbride Alliance',225,NULL),
 (1039,'East Lindsey Independent Group',225,NULL),
 (1040,'easyVote',225,NULL),
 (1041,'Edinburgh Residents Party',225,NULL),
 (1042,'Elm Park Residents\' Association',225,NULL),
 (1043,'ENG',225,NULL),
 (1044,'England First Party',225,NULL),
 (1045,'English Democrats Party',225,NULL),
 (1046,'English National Party',225,NULL),
 (1047,'English Parliamentary Party',225,NULL),
 (1048,'English Progressive and Liberty Party [The]',225,NULL),
 (1049,'EnglishIndependenceParty.com',225,NULL),
 (1050,'Enterprise Party',225,NULL),
 (1051,'Equal Parenting Alliance',225,NULL),
 (1052,'Esher Residents Association',225,NULL),
 (1053,'Ewell Court Residents\' Association',225,NULL),
 (1054,'Fair Pay Fair Trade Party',225,NULL),
 (1055,'Families First',225,NULL),
 (1056,'Fancy Dress Party',225,NULL),
 (1057,'For Darwen',225,NULL),
 (1058,'For Integrity And Trust In Government',225,NULL),
 (1059,'Forward Wales',225,NULL),
 (1061,'Free Scotland Party [FSP]',225,NULL),
 (1062,'Freedom Party [The]',225,NULL),
 (1063,'Freedom-4-Choice',225,NULL),
 (1064,'Fylde Ratepayers Association',225,NULL),
 (1065,'Generalist Party',225,NULL),
 (1066,'Get Britain Back Party',225,NULL),
 (1067,'Get Snouts Out The Trough',225,NULL),
 (1068,'Green Party [The]',225,NULL),
 (1069,'Grumpy Old Men Political Party [The]',225,NULL),
 (1070,'Hackney Independent',225,NULL),
 (1071,'Had Enough Party [The]',225,NULL),
 (1072,'Hadley & Leegomery Residents Association',225,NULL),
 (1073,'Halstead Residents\' Association',225,NULL),
 (1074,'Handforth \'Ratepayers\' Association (Independent)',225,NULL),
 (1075,'Hands Off Tamworth\'s Schools',225,NULL),
 (1076,'Havering Residents Association',225,NULL),
 (1077,'Hawkwell Residents',225,NULL),
 (1078,'Henley Residents Group [The]',225,NULL),
 (1079,'Herne Bay First Independent Party',225,NULL),
 (1080,'Hersham Village Society',225,NULL),
 (1081,'Hextable Independent',225,NULL),
 (1082,'Hinchley Wood Residents Association',225,NULL),
 (1083,'Holland-on-Sea Residents\' Association [The]',225,NULL),
 (1084,'Hornchurch Residents Association',225,NULL),
 (1085,'Hounslow Independent Alliance',225,NULL),
 (1086,'Idle Toad [The]',225,NULL),
 (1087,'Imperial Party',225,NULL),
 (1088,'Independent Britwellian Residents',225,NULL),
 (1089,'Independent Green Voice',225,NULL),
 (1090,'Independent Group of Councillors',225,NULL),
 (1091,'Independent Kidderminster Hospital and Health Concern',225,NULL),
 (1092,'Independent Loughton Residents Association',225,NULL),
 (1093,'Independent Save Our Green Belt',225,NULL),
 (1094,'Independent Working Class Association',225,NULL),
 (1095,'Independents @ Swansea',225,NULL),
 (1096,'Independents of North Yorkshire',225,NULL),
 (1097,'Independents Party of Dover District',225,NULL),
 (1098,'Independents to Save Queen Mary\'s Hospital',225,NULL),
 (1100,'Ingleby Barwick Independent Society',225,NULL),
 (1101,'Integrity',225,NULL),
 (1102,'Islam Zinda Baad Platform',225,NULL),
 (1103,'John Lilburne Democratic Party',225,NULL),
 (1104,'Jury Team',225,NULL),
 (1105,'Justice Party',225,NULL),
 (1106,'Khair (Best) Party [The]',225,NULL),
 (1107,'Kingdom of God Christ\'s Ambassadors',225,NULL),
 (1108,'Kirklees Save Our Services',225,NULL),
 (1109,'The Labour Party',225,1),
 (1110,'Left List',225,NULL),
 (1111,'Liberal Democrats',225,1),
 (1112,'Liberal Party [The]',225,NULL),
 (1113,'Libertarian Party',225,NULL),
 (1114,'Libertas UK',225,NULL),
 (1115,'Ligali Party [The]',225,NULL),
 (1116,'Lincoln Independent Alliance',225,NULL),
 (1117,'Lincolnshire Independents Lincolnshire First',225,NULL),
 (1118,'Liverpool Independent Party [The]',225,NULL),
 (1119,'Liverpool Labour Community Party',225,NULL),
 (1120,'Llais Gwynedd - The Voice of Gwynedd',225,NULL),
 (1121,'Llantwit First Independents',225,NULL),
 (1122,'Magna Carta Conservation Party Great Britain',225,NULL),
 (1123,'Make Politicians History',225,NULL),
 (1124,'Mansfield Independent Forum',225,NULL),
 (1125,'Mebyon Kernow - The Party for Cornwall',225,NULL),
 (1126,'Medway Independent Party',225,NULL),
 (1127,'Mercian Party',225,NULL),
 (1128,'Merthyr Independents',225,NULL),
 (1129,'Merton Park Ward Independent Residents',225,NULL),
 (1130,'Middle England Party',225,NULL),
 (1131,'Middlewich First',225,NULL),
 (1132,'Miss Great Britain Party [The]',225,NULL),
 (1133,'Molesey Residents Association [The]',225,NULL),
 (1134,'Money Reform Party',225,NULL),
 (1135,'Moorlands Democratic Alliance',225,NULL),
 (1136,'Morecambe Bay Independents',225,NULL),
 (1137,'Morley Borough Independents',225,NULL),
 (1138,'Motorists, Equity & Unity Party',225,NULL),
 (1139,'Movement for Active Democracy! (M.A.D!)',225,NULL),
 (1140,'Mums\' Army',225,NULL),
 (1142,'Nantwich Independent Party',225,NULL),
 (1143,'National Democrats',225,NULL),
 (1145,'National Liberal Party, The Third Way',225,NULL),
 (1146,'National Republican And Democratic Party',225,NULL),
 (1148,'Neath Port Talbot Independent Party',225,NULL),
 (1149,'New England Party',225,NULL),
 (1150,'New Millennium Bean Party',225,NULL),
 (1151,'New Party [The]',225,NULL),
 (1152,'Newcastle Academy with Christian Values Party',225,NULL),
 (1153,'Newtown Independent Party',225,NULL),
 (1154,'No Candidate Deserves My Vote!',225,NULL),
 (1155,'No2EU:Yes to Democracy',225,NULL),
 (1156,'Nork Residents\' Association',225,NULL),
 (1157,'North Somerset Community Action Association',225,NULL),
 (1158,'North Yorkshire Coast Party',225,NULL),
 (1159,'Northampton - Save Our Public Services',225,NULL),
 (1160,'Northern Progress Party',225,NULL),
 (1161,'Norwich Over The Water',225,NULL),
 (1162,'NOTA',225,NULL),
 (1163,'Official Monster Raving Loony Party [The]',225,NULL),
 (1164,'Old Windsor Resident\'s and Ratepayers\' Association',225,NULL),
 (1165,'Ormskirk Party [The]',225,NULL),
 (1166,'Peace and Progress',225,NULL),
 (1167,'Peace Party - Non-violence, Justice, Environment [The]',225,NULL),
 (1168,'Pelsall Independent Alliance',225,NULL),
 (1169,'Pensioners Party',225,NULL),
 (1170,'People Against Bureaucracy Group',225,NULL),
 (1171,'People First Party',225,NULL),
 (1173,'People\'s Representative [The]',225,NULL),
 (1174,'People\'s Voice',225,NULL),
 (1175,'Peoples Party For Better Government [The]',225,NULL),
 (1176,'Plaid Cymru - Party of Wales [The]',225,1),
 (1177,'PLC Party',225,NULL),
 (1178,'Popular Alliance',225,NULL),
 (1180,'Populist Party',225,NULL),
 (1181,'Potteries Alliance [The]',225,NULL),
 (1182,'PPE [The]',225,NULL),
 (1183,'PPPILA',225,NULL),
 (1184,'Pro Democracy: Libertas.eu',225,NULL),
 (1185,'Procapitalism',225,NULL),
 (1186,'Progressive Action Party',225,NULL),
 (1187,'Progressive Democratic Party [The]',225,NULL),
 (1188,'Progressive Party [The]',225,NULL),
 (1189,'Proletarian',225,NULL),
 (1190,'Protest Vote Party',225,NULL),
 (1191,'Public Services Coalition',225,NULL),
 (1192,'Radical Party of Great Britain [The]',225,NULL),
 (1193,'Rainham Resident\'s Association',225,NULL),
 (1194,'Ramsgate First',225,NULL),
 (1195,'Ratepayers (Staffordshire Moorlands)',225,NULL),
 (1196,'Real Democracy Party',225,NULL),
 (1197,'Referendum Party [The]',225,NULL),
 (1198,'Reform 2000 Party',225,NULL),
 (1199,'Republican Party [The]',225,NULL),
 (1200,'Residents and Motorists of Great Britain',225,NULL),
 (1201,'Residents Associations of Epsom and Ewell',225,NULL),
 (1202,'Residents\' Association of Cuddington',225,NULL),
 (1203,'Residents\' Association of London',225,NULL),
 (1204,'Resolutionist Party [The]',225,NULL),
 (1205,'Respect - The Unity Coalition',225,NULL),
 (1206,'Resurgence',225,NULL),
 (1207,'Revolutionary Communist Party Britain (Marxist-Leninist)',225,NULL),
 (1208,'Richmondshire Independent Group [The]',225,NULL),
 (1209,'Rochford District Residents',225,NULL),
 (1210,'Roman Party. Ave! [The]',225,NULL),
 (1211,'Romford Residents Association',225,NULL),
 (1212,'Runnymede Independent Residents\' Group [The]',225,NULL),
 (1213,'S O S! Voters Against Overdevelopment of Northampton',225,NULL),
 (1214,'Save Chase Farm',225,NULL),
 (1215,'Save Huddersfield N.H.S.',225,NULL),
 (1216,'Scotland Against Crooked Lawyers',225,NULL),
 (1217,'Scottish Enterprise Party',225,NULL),
 (1218,'Scottish Green Party',225,NULL),
 (1219,'Scottish Independence Party',225,0),
 (1220,'Scottish National Party',225,1),
 (1221,'Scottish Senior Citizens Unity Party',225,NULL),
 (1222,'Scottish Socialist Party',225,NULL),
 (1223,'Scottish Unionist Party',225,NULL),
 (1224,'Scottish Voice',225,NULL),
 (1225,'Seagulls Party [The]',225,NULL),
 (1226,'Selston Area Independents',225,NULL),
 (1227,'Senate Party',225,NULL),
 (1228,'Senior Citizens Party',225,NULL),
 (1229,'Shepway Independents',225,NULL),
 (1230,'Social Democratic Party',225,NULL),
 (1231,'Social Justice Party',225,NULL),
 (1232,'Social Liberalist Party',225,NULL),
 (1233,'Socialist Alliance',225,NULL),
 (1234,'Socialist Alternative',225,NULL),
 (1235,'Socialist Equality Party',225,NULL),
 (1236,'Socialist Labour Party',225,NULL),
 (1237,'Socialist Party of Great Britain [The]',225,NULL),
 (1238,'Socialist People\'s Party',225,NULL),
 (1239,'Socialist Studies Party (1904)',225,NULL),
 (1240,'Socialist Unity',225,NULL),
 (1241,'Solidarity - Scotland\'s Socialist Movement',225,NULL),
 (1242,'South Tyneside Progressives',225,NULL),
 (1243,'Southampton First',225,NULL),
 (1244,'Southport Party [The]',225,NULL),
 (1245,'Space Navies Party',225,NULL),
 (1246,'St. George\'s Hill Independents',225,NULL),
 (1247,'Staffordshire Independent Group',225,NULL),
 (1248,'Stoke-on-Trent INDEPENDENT Group',225,NULL),
 (1249,'Stoneleigh and Auriol Residents\' Association',225,NULL),
 (1250,'Stop Congestion Charging Party',225,NULL),
 (1251,'Stop! Durrington\'s Overdevelopment - Save Titnores\' Trees',225,NULL),
 (1252,'Suffolk Together',225,NULL),
 (1253,'Sunderland First',225,NULL),
 (1254,'Swanscombe and Greenhithe Residents Association',225,NULL),
 (1255,'Tattenhams Residents\' Association',225,NULL),
 (1256,'Teesdale Independent Association',225,NULL),
 (1257,'telepathicpartnership.com',225,NULL),
 (1258,'Telford and Wrekin People\'s Association',225,NULL),
 (1259,'Tendring First',225,NULL),
 (1260,'Tewkesbury Independents',225,NULL),
 (1261,'Thames Ditton / Weston Green Residents\' Association',225,NULL),
 (1263,'The Citizens\' Action Party (UK)',225,NULL),
 (1264,'the independence index',225,NULL),
 (1266,'The Pensioners and Families Party',225,NULL),
 (1267,'The People\'s Choice! Exclusively For All',225,NULL),
 (1268,'The Sutton Independent Group',225,NULL),
 (1269,'The Unity Party',225,NULL),
 (1270,'Thornaby Independent Association',225,NULL),
 (1271,'TODOS',225,NULL),
 (1272,'Town Council Supporters',225,NULL),
 (1274,'Trinity',225,NULL),
 (1275,'TRIP\'S Party',225,NULL),
 (1276,'True Democracy Party [The]',225,NULL),
 (1277,'True English (Poetry) Party [The]',225,NULL),
 (1278,'Truly Independent English Party',225,NULL),
 (1279,'TUSP',225,NULL),
 (1280,'UK Community Issues Party',225,NULL),
 (1281,'United Kingdom First',225,NULL),
 (1282,'United Kingdom Independence Party',225,1),
 (1283,'Unity For Peace And Socialism',225,NULL),
 (1284,'Upminster and Cranham Residents Association',225,NULL),
 (1285,'Veritas',225,NULL),
 (1286,'Virtue Currency Cognitive Appraisal Party',225,NULL),
 (1287,'Vivamus',225,NULL),
 (1288,'WAI D',225,NULL),
 (1289,'Walton Society [The]',225,NULL),
 (1290,'Wessex Regionalists',225,NULL),
 (1291,'West Ewell and Ruxley Residents Association',225,NULL),
 (1292,'West Suffolk Independent Alliance Party',225,NULL),
 (1293,'Weybridge Independents',225,NULL),
 (1294,'Whitnash Residents Association',225,NULL),
 (1295,'Whitwell Resident\'s Association',225,NULL),
 (1296,'Wigan Independent Conservatives',225,NULL),
 (1297,'Willingdon Residents\' Association',225,NULL),
 (1298,'Wirral Independent Network',225,NULL),
 (1299,'women4theworld',225,NULL),
 (1300,'Workers Revolutionary Party',225,NULL),
 (1301,'World',225,NULL),
 (1302,'World Truth Coalition',225,NULL),
 (1303,'Wythall Residents\' Association',225,NULL),
 (1304,'Yarm Independent Association',225,NULL),
 (1305,'Yes 2 Europe',225,NULL),
 (1307,'Alliance - Alliance Party of Northern Ireland',225,NULL),
 (1308,'British Jobs First',225,NULL),
 (1309,'Centreground Party',225,NULL),
 (1310,'Common Good [The]',225,NULL),
 (1312,'Democratic Nationalists',225,NULL),
 (1314,'Democratic Unionist Party - D.U.P.',225,NULL),
 (1315,'ENG',225,NULL),
 (1316,'Fianna Fail - The Republican Party',225,NULL),
 (1317,'Free England Party [The]',225,NULL),
 (1318,'Green Party',225,NULL),
 (1319,'Independent Health Coalition',225,NULL),
 (1320,'Independent Republican Party',225,NULL),
 (1321,'Individual Capitalist Party',225,NULL),
 (1323,'Labour Party of Northern Ireland [The]',225,NULL),
 (1326,'Libertas NI',225,NULL),
 (1328,'Money Reform Party',225,NULL),
 (1330,'mums4justice',225,NULL),
 (1331,'National Front',225,NULL),
 (1332,'Nationwide Reform Party',225,NULL),
 (1334,'Newtownabbey Ratepayers Association',225,NULL),
 (1335,'People\'s Progressive Party [The]',225,NULL),
 (1336,'Popular Voice Party [The]',225,NULL),
 (1338,'Progressive Unionist Party of Northern Ireland',225,NULL),
 (1339,'Real Democracy Party',225,NULL),
 (1341,'SDLP (Social Democratic & Labour Party)',225,NULL),
 (1342,'Sinn Fein',225,NULL),
 (1343,'Socialist Party (Northern Ireland)',225,NULL),
 (1345,'The Animal Protection Party',225,NULL),
 (1346,'the independence index',225,NULL),
 (1347,'The Individuals Labour and Tory (TILT)',225,NULL),
 (1348,'TODOS',225,NULL),
 (1349,'Traditional Democrats',225,NULL),
 (1350,'Traditional Unionist Voice - TUV',225,NULL),
 (1352,'Ulster Unionist Party',225,NULL),
 (1354,'United Unionist Coalition',225,NULL),
 (1356,'Workers Party [The]',225,NULL),
 (1357,'You Party',225,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `party` ENABLE KEYS */;


--
-- Definition of table `promise`
--

DROP TABLE IF EXISTS `promise`;
CREATE TABLE  `promise` (
  `promise_id` int(11) NOT NULL auto_increment,
  `leaflet_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY  (`promise_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promise`
--

/*!40000 ALTER TABLE `promise` DISABLE KEYS */;
LOCK TABLES `promise` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `promise` ENABLE KEYS */;


--
-- Definition of table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE  `tag` (
  `tag_id` int(11) NOT NULL auto_increment,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY  (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
LOCK TABLES `tag` WRITE;
INSERT INTO `tag` VALUES  (3,'europe'),
 (4,'pound'),
 (5,'hatred'),
 (10,'iceland'),
 (9,'cambridge');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


--
-- Definition of table `tag_seq`
--

DROP TABLE IF EXISTS `tag_seq`;
CREATE TABLE  `tag_seq` (
  `sequence` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag_seq`
--

/*!40000 ALTER TABLE `tag_seq` DISABLE KEYS */;
LOCK TABLES `tag_seq` WRITE;
INSERT INTO `tag_seq` VALUES  (10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `tag_seq` ENABLE KEYS */;



-------

drop table election;
drop table election_type;
drop table leaflet_election;


ALTER TABLE `category` ADD INDEX name(`name`);
ALTER TABLE `leaflet` ADD INDEX title(`title`),
ADD INDEX lng(`lng`),
ADD INDEX lat(`lat`),
ADD INDEX date_uploaded(`date_uploaded`);
ALTER TABLE `leaflet_party_attack` ADD INDEX leaflet_id(`leaflet_id`),
ADD INDEX party_id(`party_id`);
ALTER TABLE `leaflet` DROP INDEX `lng`
, DROP INDEX `lat`,
ADD INDEX latlng(`lng`, `lat`);
ALTER TABLE `leaflet_tag` ADD INDEX leaflet_id(`leaflet_id`),
ADD INDEX tag_id(`tag_id`);
ALTER TABLE `tag` ADD UNIQUE INDEX tag(`tag`);

--------

CREATE TABLE  `constituency` (
  `constituency_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `alternative_name` varchar(255) default NULL,
  `constituency_type_id` int(11) NOT NULL,
  `retired` tinyint(1) default '0',
  `area_code` varchar(20) default NULL,
  `area_uri` varchar(255) default NULL,
  `wikipedia_url` varchar(255) default NULL,
  `url_id` varchar(100) default NULL,
  PRIMARY KEY  (`constituency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8399 DEFAULT CHARSET=utf8;

CREATE TABLE  `constituency_type` (
  `constituency_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `url_id` varchar(100) default NULL,
  PRIMARY KEY  (`constituency_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `constituency_type` VALUES  (1,'European Parliament Constituency',225,'europe'),
 (2,'Local Authority Ward',225,'council'),
 (3,'UK Parliament Constituency',225,'wesminster');
 
 CREATE TABLE  `leaflet_constituency` (
   `leaflet_constituency_id` int(11) NOT NULL auto_increment,
   `leaflet_id` int(11) NOT NULL,
   `constituency_id` int(11) NOT NULL,
   PRIMARY KEY  (`leaflet_constituency_id`)
 ) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;


 CREATE TABLE  `email_alert` (
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
 
 ALTER TABLE `constituency` ADD COLUMN `guardian_aristotle_id` INT AFTER `url_id`,
  ADD COLUMN `guardian_pa_code` INT AFTER `guardian_aristotle_id`;
 