-- MySQL dump 10.13  Distrib 5.6.38, for macos10.12 (x86_64)
--
-- Host: localhost    Database: salmon
-- ------------------------------------------------------
-- Server version	5.5.59

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
-- Table structure for table `accounts_host`
--

DROP TABLE IF EXISTS `accounts_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `name` varchar(15) NOT NULL,
  `location` varchar(15) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_host_ip_20892f32_uniq` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_host`
--

LOCK TABLES `accounts_host` WRITE;
/*!40000 ALTER TABLE `accounts_host` DISABLE KEYS */;
INSERT INTO `accounts_host` VALUES (1,'192.168.111.112','192.168.111.112','Shanghai',NULL,NULL,'/tmp',0,'2018-01-15 09:30:25.000000','2018-01-15 09:30:27.000000'),(2,'192.168.111.204','192.168.111.204','shanghai',NULL,NULL,'/tmp',0,'2018-01-15 09:33:34.000000','2018-01-15 09:33:36.000000'),(3,'192.168.111.111','192.168.111.111','jinhua',NULL,NULL,'/tmp',1,'2018-01-15 09:35:13.000000','2018-01-15 09:35:14.000000'),(4,'192.168.111.113','192.168.111.113','guangzhou','1.0','guangzhou',NULL,1,NULL,NULL),(5,'192.168.111.114','192.168.111.114','guangzhou','1.0','guangzhou',NULL,1,'2018-02-23 03:31:37.000000','2018-02-23 03:31:40.000000'),(6,'192.168.111.115','192.168.111.115','guangzhou','1.0','guangzhou',NULL,1,'2018-02-23 03:32:04.000000','2018-02-23 03:32:07.000000'),(7,'192.168.111.116','192.168.111.116','guangzhou',NULL,NULL,NULL,1,'2018-02-23 03:32:04.000000','2018-02-23 03:32:07.000000'),(8,'192.168.111.117','192.168.111.117','guangzhou',NULL,NULL,NULL,1,'2018-02-23 03:32:04.000000','2018-02-23 03:32:07.000000'),(9,'192.168.111.118','192.168.111.118','guangzhou',NULL,NULL,NULL,1,'2018-02-23 03:32:04.000000','2018-02-23 03:32:07.000000'),(10,'192.168.111.119','192.168.111.119','guangzhou',NULL,NULL,NULL,1,'2018-02-23 03:32:04.000000','2018-02-23 03:32:07.000000'),(11,'192.168.111.120','192.168.111.120','guangzhou',NULL,NULL,NULL,1,'2018-02-23 03:32:04.000000','2018-02-23 03:32:07.000000'),(14,'192.168.110.121','192.168.110.121','shanghai',NULL,NULL,NULL,1,NULL,NULL),(16,'192.168.110.124','192.168.110.124','shanghai','1.0','shanghai','',1,'2018-02-22 19:32:07.000000','2018-02-22 19:32:07.000000'),(18,'192.168.110.125','192.168.110.125','shanghai','1.0','shanghai','',1,'2018-02-22 19:32:07.000000','2018-02-22 19:32:07.000000'),(23,'192.168.120.227','192.168.120.227',NULL,NULL,NULL,NULL,1,NULL,NULL),(24,'192.168.120.228','192.168.120.228',NULL,NULL,NULL,NULL,1,NULL,NULL),(25,'192.168.120.229','192.168.120.229',NULL,NULL,NULL,NULL,1,NULL,NULL),(26,'192.168.120.230','192.168.120.230',NULL,NULL,NULL,NULL,1,NULL,NULL),(27,'192.168.120.231','192.168.120.231',NULL,NULL,NULL,NULL,1,NULL,NULL),(28,'192.168.120.232','192.168.120.232',NULL,NULL,NULL,NULL,1,NULL,NULL),(29,'192.168.120.233','192.168.120.233',NULL,NULL,NULL,NULL,1,NULL,NULL),(30,'192.168.120.234','192.168.120.234',NULL,NULL,NULL,NULL,1,NULL,NULL),(31,'192.168.120.235','192.168.120.235',NULL,NULL,NULL,NULL,1,NULL,NULL),(32,'192.168.120.236','192.168.120.236',NULL,NULL,NULL,NULL,1,NULL,NULL),(33,'192.168.120.237','192.168.120.237',NULL,NULL,NULL,NULL,1,NULL,NULL),(34,'192.168.120.238','192.168.120.238',NULL,NULL,NULL,NULL,1,NULL,NULL),(35,'192.168.120.239','192.168.120.239',NULL,NULL,NULL,NULL,1,NULL,NULL),(36,'192.168.120.240','192.168.120.240',NULL,NULL,NULL,NULL,1,NULL,NULL),(42,'192.168.120.241','192.168.120.241',NULL,NULL,NULL,NULL,1,NULL,NULL),(43,'192.168.120.242','192.168.120.242',NULL,NULL,NULL,NULL,1,NULL,NULL),(44,'192.168.110.127','192.168.110.127',NULL,NULL,NULL,NULL,1,NULL,NULL),(45,'192.168.110.128','192.168.110.128',NULL,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `accounts_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_hostgroup`
--

DROP TABLE IF EXISTS `accounts_hostgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_hostgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `memo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_hostgroup`
--

LOCK TABLES `accounts_hostgroup` WRITE;
/*!40000 ALTER TABLE `accounts_hostgroup` DISABLE KEYS */;
INSERT INTO `accounts_hostgroup` VALUES (1,'Java4',NULL),(2,'Java3',NULL),(3,'Java2',NULL),(4,'Java1',NULL);
/*!40000 ALTER TABLE `accounts_hostgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_hostgroup_bind_hosts`
--

DROP TABLE IF EXISTS `accounts_hostgroup_bind_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_hostgroup_bind_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostgroup_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_hostgroups_bind_hostgroups_id_host_id_3c6283ff_uniq` (`hostgroup_id`,`host_id`),
  KEY `accounts_hostgroups__host_id_6572f61c_fk_accounts_` (`host_id`),
  CONSTRAINT `accounts_hostgroup_b_hostgroup_id_f9b47677_fk_accounts_` FOREIGN KEY (`hostgroup_id`) REFERENCES `accounts_hostgroup` (`id`),
  CONSTRAINT `accounts_hostgroups__host_id_6572f61c_fk_accounts_` FOREIGN KEY (`host_id`) REFERENCES `accounts_host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_hostgroup_bind_hosts`
--

LOCK TABLES `accounts_hostgroup_bind_hosts` WRITE;
/*!40000 ALTER TABLE `accounts_hostgroup_bind_hosts` DISABLE KEYS */;
INSERT INTO `accounts_hostgroup_bind_hosts` VALUES (8,1,5),(22,1,7),(19,1,9),(20,1,11),(18,1,16),(11,2,4),(12,2,6),(13,2,8),(14,2,10),(15,2,14),(16,2,18),(10,3,1),(5,4,3);
/*!40000 ALTER TABLE `accounts_hostgroup_bind_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_hostuser`
--

DROP TABLE IF EXISTS `accounts_hostuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_hostuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_hostuser_group_id_6d21aba6_fk_accounts_hostgroup_id` (`group_id`),
  KEY `accounts_hostuser_user_id_7b44767f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `accounts_hostuser_group_id_6d21aba6_fk_accounts_hostgroup_id` FOREIGN KEY (`group_id`) REFERENCES `accounts_hostgroup` (`id`),
  CONSTRAINT `accounts_hostuser_user_id_7b44767f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_hostuser`
--

LOCK TABLES `accounts_hostuser` WRITE;
/*!40000 ALTER TABLE `accounts_hostuser` DISABLE KEYS */;
INSERT INTO `accounts_hostuser` VALUES (1,4,1),(2,3,1),(3,2,1),(6,1,1),(7,3,2),(8,4,3),(9,2,3),(10,1,2);
/*!40000 ALTER TABLE `accounts_hostuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_newhost`
--

DROP TABLE IF EXISTS `accounts_newhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_newhost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `name` varchar(15) NOT NULL,
  `location` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_newhost`
--

LOCK TABLES `accounts_newhost` WRITE;
/*!40000 ALTER TABLE `accounts_newhost` DISABLE KEYS */;
INSERT INTO `accounts_newhost` VALUES (8,'192.168.110.124','192.168.110.124','shanghai'),(9,'192.168.110.125','192.168.110.125','guangzhou'),(10,'192.168.110.126','192.168.110.126','shanghai');
/*!40000 ALTER TABLE `accounts_newhost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profileimage`
--

DROP TABLE IF EXISTS `accounts_profileimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_profileimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profileimage`
--

LOCK TABLES `accounts_profileimage` WRITE;
/*!40000 ALTER TABLE `accounts_profileimage` DISABLE KEYS */;
INSERT INTO `accounts_profileimage` VALUES (1,'profile/2018/02/01/bstree-halflings.png'),(2,'profile/2018/02/01/干扰log数据的测试数据详细.xlsx'),(3,'profile/2018/02/01/干扰log数据的测试数据详细.xlsx'),(4,'profile/2018/02/01/bstree-halflings.png'),(5,'profile/2018/02/01/bstree-halflings_cZsGOeW.png'),(6,'profile/2018/02/01/bstree-halflings_dTvS8aa.png'),(7,'profile/2018/02/01/干扰log数据的测试数据详细_WWeg5dj.xlsx'),(8,'profile/2018/02/01/干扰log数据的测试数据详细_ifKGlv0.xlsx'),(9,'profile/2018/02/01/bstree-halflings_OR2MH1y.png'),(10,'profile/2018/02/01/bstree-halflings.png'),(11,'profile/2018/02/01/bstree-halflings_iqcDjTA.png'),(12,'profile/2018/02/01/bstree-halflings.png'),(13,'profile/2018/02/01/bstree-halflings_43Ym7e1.png'),(14,'profile/2018/02/01/bstree-halflings.png'),(15,'profile/2018/02/01/bstree-halflings_RTohYrj.png'),(16,'profile/2018/02/01/bstree-halflings_7kzkMzX.png'),(17,'profile/2018/02/01/bstree-halflings_OERGEAt.png'),(18,'profile/2018/02/01/bstree-halflings_wQCOoCs.png'),(19,'profile/2018/02/01/bstree-halflings_8y2rbPl.png'),(20,'profile/2018/02/01/bstree-halflings_aWzb3Zq.png'),(21,'profile/2018/02/01/bstree-halflings.png'),(22,'profile/2018/02/01/bstree-halflings_vDYCjrK.png'),(23,'profile/2018/02/01/bstree-halflings_VbtPCGs.png'),(24,'profile/2018/02/01/bstree-halflings_4rmvZz5.png'),(25,'profile/2018/02/01/echo.yml'),(26,'profile/2018/02/01/echo_HCK1P19.yml'),(27,'profile/2018/02/01/echo_JsTjX6R.yml'),(28,'profile/2018/02/01/echo_E1wDo6U.yml'),(29,'profile/2018/02/01/echo_auDirpE.yml'),(30,'profile/2018/02/01/echo_JzqWnWi.yml'),(31,'profile/2018/02/01/echo.yml'),(32,'profile/2018/02/01/echo.yml'),(33,'profile/2018/02/01/echo_S1c2OP7.yml'),(34,'profile/2018/02/01/echo_11EyIEe.yml'),(35,'profile/2018/02/01/hello.yml'),(36,'profile/2018/02/01/hello_mKpnaFQ.yml'),(37,'profile/2018/02/01/hello_zzrc4Qg.yml'),(38,'profile/2018/02/01/hello_QjhPBB0.yml'),(39,'profile/2018/02/01/hello_3SDtTGP.yml'),(40,'profile/2018/02/01/hello_WI3bkmB.yml'),(41,'profile/2018/02/01/hello_BSJAkYD.yml'),(42,'profile/2018/02/01/hello_w3LYFiv.yml'),(43,'profile/2018/02/01/hello_WfeHDlO.yml'),(44,'profile/2018/02/01/hello_1mLg6Zd.yml'),(45,'profile/2018/02/01/hello_DUDQWjp.yml'),(46,'profile/2018/02/01/hello_EkF3veR.yml'),(47,'profile/2018/02/01/hello_iCEvVKX.yml'),(48,'profile/2018/02/01/hello_6SrMZ2P.yml'),(49,'profile/2018/02/01/hello_llWGTkf.yml'),(50,'profile/2018/02/01/hello_XkruC9r.yml'),(51,'profile/2018/02/01/hello_oq14E4A.yml'),(52,'profile/2018/02/01/hello_2m7yriY.yml'),(53,'profile/2018/02/01/hello_t8HNUEf.yml'),(54,'profile/2018/02/01/hello_yKSNILz.yml'),(55,'profile/2018/02/02/hello.yml'),(56,'profile/2018/02/02/hello_S0k8yjS.yml'),(57,'profile/2018/02/02/hello_NheXjbP.yml'),(58,'profile/2018/02/02/hello_0uFGhIX.yml'),(59,'profile/2018/02/02/hello_gI9yK1P.yml'),(60,'profile/2018/02/02/hello_kg5pwYK.yml'),(61,'profile/2018/02/02/hello_dYNnC29.yml'),(62,'profile/2018/02/02/hello_CJGqtpL.yml'),(63,'profile/2018/02/02/hello_64yAlYn.yml'),(64,'profile/2018/02/02/hello_WWAZ1vM.yml'),(65,'profile/2018/02/02/hello_70jkblZ.yml'),(66,'profile/2018/02/02/hello_OVljlIt.yml'),(67,'profile/2018/02/02/hello_A47vj88.yml'),(68,'profile/2018/02/02/hello_B4Wziz6.yml'),(69,'profile/2018/02/02/hello_splpExI.yml'),(70,'profile/2018/02/02/hello_85Ec7EZ.yml'),(71,'profile/2018/02/02/hello_m83VBRP.yml'),(72,'profile/2018/02/02/hello_zERYgBx.yml'),(73,'profile/2018/02/02/hello_wtC1grp.yml'),(74,'profile/2018/02/02/hello_655CV7H.yml'),(75,'profile/2018/02/02/hello_xDINJtl.yml'),(76,'profile/2018/02/02/hello_MDD3b37.yml'),(77,'profile/2018/02/02/hello_rUs3iaB.yml'),(78,'profile/2018/02/02/hello_11xdwpK.yml'),(79,'profile/2018/02/02/hello_8ThyRP1.yml'),(80,'profile/2018/02/02/hello_DqqepeS.yml'),(81,'profile/2018/02/02/hello_hrWRIAR.yml'),(82,'profile/2018/02/02/hello_lQ28Kdh.yml'),(83,'profile/2018/02/02/hello_hmtrGkP.yml'),(84,'profile/2018/02/02/hello_RZzdxUy.yml'),(85,'profile/2018/02/02/hello_ZUMh7qE.yml'),(86,'profile/2018/02/02/hello_qbhtwwe.yml'),(87,'profile/2018/02/02/hello.yml'),(88,'profile/2018/02/02/hello_CbneKop.yml'),(89,'profile/2018/02/02/hello_4iIl8qA.yml'),(90,'profile/2018/02/02/hello_NRNXun7.yml'),(91,'profile/2018/02/02/hello_YAQOtUZ.yml'),(92,'profile/2018/02/02/hello_oKWZxsv.yml'),(93,'profile/2018/02/02/hello_cW5tfBW.yml'),(94,'profile/2018/02/02/hello_ty3Kc8M.yml'),(95,'profile/2018/02/02/hello_AWiyE2m.yml'),(96,'profile/2018/02/02/hello_5b84QRI.yml'),(97,'profile/2018/02/02/hello_dgelOYM.yml'),(98,'profile/2018/02/02/hello_m6b06Ie.yml'),(99,'profile/2018/02/02/hello_kTzOzM8.yml'),(100,'profile/2018/02/02/hello_87YVFID.yml'),(101,'profile/2018/02/02/hello_Mm5c0pk.yml'),(102,'profile/2018/02/02/hello_s6T5om7.yml'),(103,'profile/2018/02/02/hello_Ry23seE.yml'),(104,'profile/2018/02/02/hello.yml'),(105,'profile/2018/02/02/hello_vQfuHS9.yml'),(106,'profile/2018/02/02/hello_DomNCDz.yml'),(107,'profile/2018/02/02/hello_XdBZsPo.yml'),(108,'profile/2018/02/02/hello_1FJT5TI.yml'),(109,'profile/2018/02/02/hello_hWS9C7S.yml'),(110,'profile/2018/02/02/hello_UGxvOzx.yml'),(111,'profile/2018/02/02/hello_nbozYue.yml'),(112,'profile/2018/02/02/hello_GJB2pzy.yml'),(113,'profile/2018/02/02/hello_ppDwHcT.yml'),(114,'profile/2018/02/02/hello_38d4qWz.yml'),(115,'profile/2018/02/02/hello_6gwGu7P.yml'),(116,'profile/2018/02/02/hello_0nVdb5h.yml'),(117,'profile/2018/02/02/hello_mroubtC.yml'),(118,'profile/2018/02/02/hello_tw58ohL.yml'),(119,'profile/2018/02/02/hello_3vWx0pF.yml'),(120,'profile/2018/02/02/hello.yml'),(121,'profile/2018/02/02/hello_LNSsTUc.yml'),(122,'profile/2018/02/02/hello_6LIqTdA.yml'),(123,'profile/2018/02/02/hello_N7zps1R.yml'),(124,'profile/2018/02/02/hello_SHa9LlQ.yml'),(125,'profile/2018/02/02/hello_1JsAagx.yml'),(126,'profile/2018/02/02/hello_bwDdUQ1.yml'),(127,'profile/2018/02/02/hello_gTBkFwq.yml'),(128,'profile/2018/02/02/hello_CQzbbMz.yml'),(129,'profile/2018/02/02/hello_Jpk2Ynf.yml'),(130,'profile/2018/02/02/hello_cBmImRn.yml'),(131,'profile/2018/02/02/hello_OOIFeVj.yml'),(132,'profile/2018/02/02/hello_FZxkhcI.yml'),(133,'profile/2018/02/02/hello_eihLPII.yml'),(134,'profile/2018/02/02/hello_ICP2D08.yml'),(135,'profile/2018/02/02/hello_G7r2szJ.yml'),(136,'profile/2018/02/02/hello_SIxzu96.yml'),(137,'profile/2018/02/02/hello_qLgzt6X.yml'),(138,'profile/2018/02/02/hello_jQ6UrFQ.yml'),(139,'profile/2018/02/02/hello_HVo9Kwj.yml'),(140,'profile/2018/02/02/hello_WCJNOWk.yml'),(141,'profile/2018/02/02/hello.yml'),(142,'profile/2018/02/02/hello_4Ht6WKD.yml'),(143,'profile/2018/02/02/hello_NFo1u96.yml'),(144,'profile/2018/02/02/hello_ogrT2hG.yml'),(145,'profile/2018/02/02/echo.yml'),(146,'profile/2018/02/04/hello.yml'),(147,'profile/2018/02/05/hello.yml'),(148,'profile/2018/02/05/hello_NXfEgTr.yml'),(149,'profile/2018/02/05/hello_9g9maOk.yml'),(150,'profile/2018/02/05/hello_qhY1nuB.yml'),(151,'profile/2018/02/05/hello_aR4acEX.yml'),(152,'profile/2018/02/05/hello.yml'),(153,'profile/2018/02/05/hello.yml'),(154,'profile/2018/02/05/test.sh'),(155,'profile/2018/02/05/test_4X7RZlx.sh'),(156,'profile/2018/02/05/test_a8cVMLk.sh'),(157,'profile/2018/02/05/test_SjlIRRz.sh'),(158,'profile/2018/02/05/hello.yml'),(159,'profile/2018/02/05/test_WCdpy2I.sh'),(160,'profile/2018/02/05/test_j3bBg3x.sh'),(161,'profile/2018/02/05/test_PStdV7Z.sh'),(162,'profile/2018/02/05/test_FMGWtXF.sh'),(163,'profile/2018/02/05/test_9rdmgim.sh'),(164,'profile/2018/02/05/test_yLeIPLi.sh'),(165,'profile/2018/02/05/test_rqcQzsG.sh'),(166,'profile/2018/02/05/test_ivJBzWO.sh'),(167,'profile/2018/02/05/test_sqOHoSD.sh'),(168,'profile/2018/02/05/test_gzdKqLv.sh'),(169,'profile/2018/02/05/test_EYozE9v.sh'),(170,'profile/2018/02/05/test_FBk5dRC.sh'),(171,'profile/2018/02/05/test_kUPGKEm.sh'),(172,'profile/2018/02/05/test_Y4mTUAl.sh'),(173,'profile/2018/02/05/test_ZfHBX9j.sh'),(174,'profile/2018/02/05/test_WBbVu7Q.sh'),(175,'profile/2018/02/05/test_uZSSACi.sh'),(176,'profile/2018/02/05/test_I2dhcbW.sh'),(177,'profile/2018/02/05/test_Ahsv9J9.sh'),(178,'profile/2018/02/05/test_E4yLD2f.sh'),(179,'profile/2018/02/05/test_Oe3FoJu.sh'),(180,'profile/2018/02/05/test_P2UgnfY.sh'),(181,'profile/2018/02/05/test_Ljv8PHf.sh'),(182,'profile/2018/02/05/test_GqqeDHC.sh'),(183,'profile/2018/02/05/test_u312S4R.sh'),(184,'profile/2018/02/05/test_nMA2cRg.sh'),(185,'profile/2018/02/05/test_cCYLpTX.sh'),(186,'profile/2018/02/05/test_YIbMsyp.sh'),(187,'profile/2018/02/05/test_Td3gOdx.sh'),(188,'profile/2018/02/05/test_u6lbtM1.sh'),(189,'profile/2018/02/06/hello.yml'),(190,'profile/2018/02/06/test.sh'),(191,'profile/2018/02/06/test_huQTHA7.sh'),(192,'profile/2018/02/06/test_4O6VJo6.sh'),(193,'profile/2018/02/07/test.sh'),(194,'profile/2018/02/07/hello.yml'),(195,'profile/2018/02/07/test_VeEdY9y.sh'),(196,'profile/2018/02/07/test_hRqyau4.sh'),(197,'profile/2018/02/07/test_TrOJG9v.sh'),(198,'profile/2018/02/07/test_vinYVvb.sh'),(199,'profile/2018/02/07/test_FgwkyUn.sh'),(200,'profile/2018/02/07/test_6wiz5do.sh'),(201,'profile/2018/02/07/test_8CQBqPP.sh'),(202,'profile/2018/02/07/test_12a2nuu.sh'),(203,'profile/2018/02/07/test_c3pLcK6.sh'),(204,'profile/2018/02/07/test_GSh6Ksc.sh'),(205,'profile/2018/02/07/test_FBzyvkk.sh'),(206,'profile/2018/02/07/test_xVvqJUe.sh'),(207,'profile/2018/02/07/test_1NijyhY.sh'),(208,'profile/2018/02/07/test_61LbIIS.sh'),(209,'profile/2018/02/07/test_vK1yYIH.sh'),(210,'profile/2018/02/08/test.sh'),(211,'profile/2018/02/08/test_186eWzj.sh'),(212,'profile/2018/02/08/test_U0c9BFv.sh'),(213,'profile/2018/02/08/test_SK2j8d4.sh'),(214,'profile/2018/02/08/test_JRggKUI.sh'),(215,'profile/2018/02/08/test_WoW77i9.sh'),(216,'profile/2018/02/08/test_puxZbUi.sh'),(217,'profile/2018/02/08/test_isWqEUI.sh'),(218,'profile/2018/02/08/test_bhYT8im.sh'),(219,'profile/2018/02/08/test_cQ7yb7G.sh'),(220,'profile/2018/02/08/test_D2KYNXD.sh'),(221,'profile/2018/02/08/test_wPC9MST.sh'),(222,'profile/2018/02/08/test_usQhsMR.sh'),(223,'profile/2018/02/08/test_FB6VAuh.sh'),(224,'profile/2018/02/08/test_dwOkiYd.sh'),(225,'profile/2018/02/08/test_fyTcRRI.sh'),(226,'profile/2018/02/08/test_owfxKme.sh'),(227,'profile/2018/02/08/test_ATfUeWT.sh'),(228,'profile/2018/02/08/test_X7bDr1q.sh'),(229,'profile/2018/02/08/test_wA9zH64.sh'),(230,'profile/2018/02/08/test_gaBhyrw.sh'),(231,'profile/2018/02/08/test_G5XeK4c.sh'),(232,'profile/2018/02/08/test_OOcCmCW.sh'),(233,'profile/2018/02/08/test_LXc2LXZ.sh'),(234,'profile/2018/02/08/test_TXXtlJi.sh'),(235,'profile/2018/02/08/test_9hRkPf2.sh'),(236,'profile/2018/02/08/test_spWU3hJ.sh'),(237,'profile/2018/02/08/test_3ru0ZfK.sh'),(238,'profile/2018/02/08/test_HtOWOk0.sh'),(239,'profile/2018/02/08/test_0k09b0m.sh'),(240,'profile/2018/02/08/test_3pBNagX.sh'),(241,'profile/2018/02/08/test_DRw1o3f.sh'),(242,'profile/2018/02/08/test_KM6ttcJ.sh'),(243,'profile/2018/02/08/test_RLQyuuT.sh'),(244,'profile/2018/02/08/test_1omo2Zt.sh'),(245,'profile/2018/02/08/test_INkan4b.sh'),(246,'profile/2018/02/08/test_udeEiu0.sh'),(247,'profile/2018/02/08/test_LhHjSal.sh'),(248,'profile/2018/02/08/test_zxboLz2.sh'),(249,'profile/2018/02/08/test_CkiBHws.sh'),(250,'profile/2018/02/08/test_IwBrKDT.sh'),(251,'profile/2018/02/08/test_klSuo6s.sh'),(252,'profile/2018/02/08/test_MqATGOj.sh'),(253,'profile/2018/02/08/test_WNvLi1e.sh'),(254,'profile/2018/02/08/test_HmAy3g4.sh'),(255,'profile/2018/02/08/test_7fWL4zs.sh'),(256,'profile/2018/02/08/test_1xmicnz.sh'),(257,'profile/2018/02/08/test_auCS4KL.sh'),(258,'profile/2018/02/08/test_gLe4Rar.sh'),(259,'profile/2018/02/08/test_dITWZ7z.sh'),(260,'profile/2018/02/08/test_0G26epX.sh'),(261,'profile/2018/02/08/test_X80cBYd.sh'),(262,'profile/2018/02/08/test_u6ChjL6.sh'),(263,'profile/2018/02/08/test_AQRhFOf.sh'),(264,'profile/2018/02/08/test_mDvugJU.sh'),(265,'profile/2018/02/08/test_PZirbB3.sh'),(266,'profile/2018/02/08/test_WiErXhb.sh'),(267,'profile/2018/02/08/test_0hpk208.sh'),(268,'profile/2018/02/08/test_uKCo9H7.sh'),(269,'profile/2018/02/08/test_rmFYRTT.sh'),(270,'profile/2018/02/08/test_sEsZTHb.sh'),(271,'profile/2018/02/08/test_jMtKgpr.sh'),(272,'profile/2018/02/08/test_09BSTKN.sh'),(273,'profile/2018/02/08/test_HZJ66Xj.sh'),(274,'profile/2018/02/08/test_NemR9Sm.sh'),(275,'profile/2018/02/08/test_7FRutVf.sh'),(276,'profile/2018/02/08/test_weVVhFM.sh'),(277,'profile/2018/02/08/test_fZumVtP.sh'),(278,'profile/2018/02/08/test_VKWU3wS.sh'),(279,'profile/2018/02/08/test_LnEOsWY.sh'),(280,'profile/2018/02/08/test_Bqi4JFU.sh'),(281,'profile/2018/02/08/test_IRk7Phy.sh'),(282,'profile/2018/02/08/test_h3z5ltC.sh'),(283,'profile/2018/02/08/test_FIG8IaT.sh'),(284,'profile/2018/02/08/test_Qsrhbo4.sh'),(285,'profile/2018/02/08/test_xrEmVWO.sh'),(286,'profile/2018/02/08/test_He1A0sp.sh'),(287,'profile/2018/02/08/test_XEYBBHb.sh'),(288,'profile/2018/02/08/test_3BGyMvV.sh'),(289,'profile/2018/02/08/test_z0EUpw2.sh'),(290,'profile/2018/02/08/test_8SfOz3t.sh'),(291,'profile/2018/02/08/test_Mg1HkAI.sh'),(292,'profile/2018/02/08/test_ApFQnUz.sh'),(293,'profile/2018/02/08/test_G7RHcLH.sh'),(294,'profile/2018/02/08/test_PNPL6YA.sh'),(295,'profile/2018/02/08/test_3o75Tdr.sh'),(296,'profile/2018/02/08/test_f968l5X.sh'),(297,'profile/2018/02/08/test_IAaBFcP.sh'),(298,'profile/2018/02/08/test_CTEySAg.sh'),(299,'profile/2018/02/08/test_eI0mQKK.sh'),(300,'profile/2018/02/08/test_E6zrehv.sh'),(301,'profile/2018/02/08/test_MLqQ8Hn.sh'),(302,'profile/2018/02/08/test_yR7zUu2.sh'),(303,'profile/2018/02/08/test_cehANLW.sh'),(304,'profile/2018/02/08/test_U0hGfHz.sh'),(305,'profile/2018/02/08/test_1Cnz5Mi.sh'),(306,'profile/2018/02/08/test_4zGdZiW.sh'),(307,'profile/2018/02/08/test_VF3DBT0.sh'),(308,'profile/2018/02/08/test_Q6zKwG0.sh'),(309,'profile/2018/02/08/test_A73j7iJ.sh'),(310,'profile/2018/02/08/test_jXeDvVo.sh'),(311,'profile/2018/02/08/test_she20bw.sh'),(312,'profile/2018/02/08/test_QLlGPvr.sh'),(313,'profile/2018/02/08/test_OpMfy8y.sh'),(314,'profile/2018/02/08/test.sh'),(315,'profile/2018/02/08/test_fXV6LdZ.sh'),(316,'profile/2018/02/08/test_FrVCrc3.sh'),(317,'profile/2018/02/08/test_xpihNBm.sh'),(318,'profile/2018/02/08/test_Zhh4I1C.sh'),(319,'profile/2018/02/08/test_xvhTQ2H.sh'),(320,'profile/2018/02/08/test_FBzuJlG.sh'),(321,'profile/2018/02/08/test_duK4epQ.sh'),(322,'profile/2018/02/08/test_lYjwwEc.sh'),(323,'profile/2018/02/08/test_MgP9dpK.sh'),(324,'profile/2018/02/08/test_VnoMHey.sh'),(325,'profile/2018/02/08/test_p773cmH.sh'),(326,'profile/2018/02/08/test_hRgkzO4.sh'),(327,'profile/2018/02/08/test_yt6Dk3o.sh'),(328,'profile/2018/02/08/test_e1FNktx.sh'),(329,'profile/2018/02/08/test_ihWD3xk.sh'),(330,'profile/2018/02/08/test_Eibpq6w.sh'),(331,'profile/2018/02/08/test_9bCpGpe.sh'),(332,'profile/2018/02/08/test_bMC35uY.sh'),(333,'profile/2018/02/08/test_Ye3o0ro.sh'),(334,'profile/2018/02/08/test_BKtUtcW.sh'),(335,'profile/2018/02/08/test_R3Kslyr.sh'),(336,'profile/2018/02/08/test_fnEVBpU.sh'),(337,'profile/2018/02/08/test_eUMn7ZA.sh'),(338,'profile/2018/02/08/test_cH9tkwF.sh'),(339,'profile/2018/02/08/test_GT6Oc1Z.sh'),(340,'profile/2018/02/08/test_ItlglYD.sh'),(341,'profile/2018/02/08/test_RrH3j1C.sh'),(342,'profile/2018/02/08/test_A2Kc2Io.sh'),(343,'profile/2018/02/08/test_Z70Pc0K.sh'),(344,'profile/2018/02/08/test_sVJ5OGq.sh'),(345,'profile/2018/02/08/test_EWR20Ca.sh'),(346,'profile/2018/02/08/test_oZOdYSz.sh'),(347,'profile/2018/02/08/test_K6BQEEC.sh'),(348,'profile/2018/02/08/test_GmXVe1N.sh'),(349,'profile/2018/02/08/test_pT5WAZO.sh'),(350,'profile/2018/02/08/test_5pSYExC.sh'),(351,'profile/2018/02/08/test_SCCyDJb.sh'),(352,'profile/2018/02/08/test.sh'),(353,'profile/2018/02/08/test_55NTUx5.sh'),(354,'profile/2018/02/08/test_txteU9L.sh'),(355,'profile/2018/02/08/test_wllyDLT.sh'),(356,'profile/2018/02/08/test_k1arqSm.sh'),(357,'profile/2018/02/08/test_9bYPwty.sh'),(358,'profile/2018/02/08/test_BJigsbK.sh'),(359,'profile/2018/02/08/test_izR8ehX.sh'),(360,'profile/2018/02/08/test_TWq7UwP.sh'),(361,'profile/2018/02/08/test_NvwgToa.sh'),(362,'profile/2018/02/08/test_kwfDlCG.sh'),(363,'profile/2018/02/08/test_ONBy8k5.sh'),(364,'profile/2018/02/08/test_OK0VYzq.sh'),(365,'profile/2018/02/08/test_UtKUhzE.sh'),(366,'profile/2018/02/08/test_T9Nci3u.sh'),(367,'profile/2018/02/08/test_u34Ao1N.sh'),(368,'profile/2018/02/08/test_2MgLEDN.sh'),(369,'profile/2018/02/08/test_zEdxlg6.sh'),(370,'profile/2018/02/08/test_ts6YviG.sh'),(371,'profile/2018/02/08/test_IA3wJK9.sh'),(372,'profile/2018/02/08/test_9D79aAC.sh'),(373,'profile/2018/02/08/test_9d7YtaH.sh'),(374,'profile/2018/02/08/test_32ndVao.sh'),(375,'profile/2018/02/08/test_RK4rQ4M.sh'),(376,'profile/2018/02/08/test_HQSLLug.sh'),(377,'profile/2018/02/08/test_xUwoloO.sh'),(378,'profile/2018/02/08/test_IozuQyT.sh'),(379,'profile/2018/02/08/test_2Uav0zt.sh'),(380,'profile/2018/02/08/test_7jp2kHH.sh'),(381,'profile/2018/02/09/test.sh'),(382,'profile/2018/02/09/test_RH3Z3VH.sh'),(383,'profile/2018/02/09/test_7ziuOGs.sh'),(384,'profile/2018/02/09/test_1ktNAwe.sh'),(385,'profile/2018/02/09/test_ERVngvc.sh'),(386,'profile/2018/02/09/test_03lESXf.sh'),(387,'profile/2018/02/09/test_AluGLtj.sh'),(388,'profile/2018/02/10/test.sh'),(389,'profile/2018/02/10/test_tcAipYG.sh'),(390,'profile/2018/02/10/test_CqLbY4r.sh'),(391,'profile/2018/02/10/test_UOsnI5P.sh'),(392,'profile/2018/02/10/test_8QPlXij.sh'),(393,'profile/2018/02/10/test_yWATJBx.sh'),(394,'profile/2018/02/10/test_9t1Dl2s.sh'),(395,'profile/2018/02/10/test_7AlaSnQ.sh'),(396,'profile/2018/02/10/test_6nO1ETT.sh'),(397,'profile/2018/02/10/test_wf8q4G8.sh'),(398,'profile/2018/02/10/test_2q1P7oE.sh'),(399,'profile/2018/02/10/test_swZhrZ0.sh'),(400,'profile/2018/02/10/test_VWoOHch.sh'),(401,'profile/2018/02/10/test_Ug2yWx7.sh'),(402,'profile/2018/02/10/test_2JFsIqX.sh'),(403,'profile/2018/02/10/test_pGXIv1J.sh'),(404,'profile/2018/02/10/test_5FteNCy.sh'),(405,'profile/2018/02/10/test_FKxNgJh.sh'),(406,'profile/2018/02/10/test_6e8savn.sh'),(407,'profile/2018/02/10/test_J4y3B2o.sh'),(408,'profile/2018/02/11/test.sh'),(409,'profile/2018/02/11/test_htfzBGH.sh'),(410,'profile/2018/02/12/test.sh'),(411,'profile/2018/02/12/test_jyPe6LZ.sh'),(412,'profile/2018/02/12/test_siqIIMG.sh'),(413,'profile/2018/02/12/test_R59hBuK.sh'),(414,'profile/2018/02/12/test_9nCoj7e.sh'),(415,'profile/2018/02/12/test_CDCqFek.sh'),(416,'profile/2018/02/12/test_o84Ywuz.sh'),(417,'profile/2018/02/12/test_5auS5al.sh'),(418,'profile/2018/02/12/test_8q2FDXQ.sh'),(419,'profile/2018/02/12/test_ViBVxxp.sh'),(420,'profile/2018/02/12/test_bwB23cz.sh'),(421,'profile/2018/02/12/test_eQzRHB7.sh'),(422,'profile/2018/02/12/test_Oj2zye1.sh'),(423,'profile/2018/02/12/test_n8MNBk0.sh'),(424,'profile/2018/02/12/test_2KIjX1s.sh'),(425,'profile/2018/02/12/test_bAoDll4.sh'),(426,'profile/2018/02/12/test_9dKeV07.sh'),(427,'profile/2018/02/12/test_7sw1MAM.sh'),(428,'profile/2018/02/12/test_gKK3heJ.sh'),(429,'profile/2018/02/13/test.sh'),(430,'profile/2018/02/13/test_V80qqXl.sh'),(431,'profile/2018/02/13/test_dEd7uNS.sh'),(432,'profile/2018/02/13/test_SrAimzs.sh'),(433,'profile/2018/02/23/test.sh'),(434,'profile/2018/02/23/echo.yml'),(435,'profile/2018/02/23/hello.yml'),(436,'profile/2018/02/23/echo_nSarTgE.yml'),(437,'profile/2018/02/23/test_I3fL0UL.sh'),(438,'profile/2018/02/24/test.sh'),(439,'profile/2018/02/24/hello.yml'),(440,'profile/2018/02/24/hello_tBbw3pi.yml'),(441,'profile/2018/02/24/hello_RTPzaez.yml'),(442,'profile/2018/02/24/hello_adkCTv9.yml'),(443,'profile/2018/02/24/hello_SMoQ0Ct.yml'),(444,'profile/2018/02/24/hello_ulmDHjk.yml'),(445,'profile/2018/02/24/hello_q9PiUiQ.yml'),(446,'profile/2018/02/24/hello_4kLgdVz.yml'),(447,'profile/2018/02/24/echo.yml'),(448,'profile/2018/02/24/hello_6LthpAW.yml'),(449,'profile/2018/02/24/hello_r9pV0O4.yml'),(450,'profile/2018/02/24/hello_FmfqJDz.yml'),(451,'profile/2018/02/24/hello_httV55v.yml'),(452,'profile/2018/02/24/hello_CTqNKwY.yml'),(453,'profile/2018/02/24/test_j6u1mtQ.sh'),(454,'profile/2018/02/24/test_T819THm.sh'),(455,'profile/2018/02/24/test_2s6B2Sw.sh'),(456,'profile/2018/02/24/test_GUG977a.sh'),(457,'profile/2018/02/24/test_dR4WqK3.sh'),(458,'profile/2018/02/24/hello_EQbOZXo.yml'),(459,'profile/2018/02/24/test_t75Nhlv.sh'),(460,'profile/2018/02/26/test.sh'),(461,'profile/2018/02/26/hello.yml'),(462,'profile/2018/02/26/test_CROdCIp.sh'),(463,'profile/2018/02/26/test_aEqn6sJ.sh'),(464,'profile/2018/03/05/test.sh'),(465,'profile/2018/03/05/test_AHrwLUa.sh'),(466,'profile/2018/03/05/echo.yml'),(467,'profile/2018/03/05/echo_AMDFofy.yml'),(468,'profile/2018/03/05/hello.yml'),(469,'profile/2018/03/05/设备资产批量导入模板文件.xls'),(470,'profile/2018/03/05/设备资产批量导入模板文件_WwpFu7b.xls'),(471,'profile/2018/03/05/设备资产批量导入模板文件_sUCcQLG.xls'),(472,'profile/2018/03/05/设备资产批量导入模板文件_w8kl5ZV.xls'),(473,'profile/2018/03/05/设备资产批量导入模板文件_lXwK1yR.xls'),(474,'profile/2018/03/05/设备资产批量导入模板文件_GxYA1hm.xls'),(475,'profile/2018/03/05/设备资产批量导入模板文件_SHQggsG.xls'),(476,'profile/2018/03/05/设备资产批量导入模板文件_kwjc71i.xls'),(477,'profile/2018/03/05/设备资产批量导入模板文件_IMFL4KU.xls'),(478,'profile/2018/03/05/设备资产批量导入模板文件_z6LbXZQ.xls'),(479,'profile/2018/03/05/设备资产批量导入模板文件_PELoShl.xls'),(480,'profile/2018/03/05/设备资产批量导入模板文件_REpWssQ.xls'),(481,'profile/2018/03/05/设备资产批量导入模板文件_1xzsqEf.xls'),(482,'profile/2018/03/05/设备资产批量导入模板文件_OhNBIbj.xls'),(483,'profile/2018/03/05/设备资产批量导入模板文件_vNHVUJh.xls'),(484,'profile/2018/03/05/设备资产批量导入模板文件_j1bLMjH.xls'),(485,'profile/2018/03/05/设备资产批量导入模板文件_FU33N9I.xls'),(486,'profile/2018/03/05/设备资产批量导入模板文件_OYJCC7Z.xls'),(487,'profile/2018/03/05/设备资产批量导入模板文件_SumGVBv.xls'),(488,'profile/2018/03/05/设备资产批量导入模板文件_1o0bfLm.xls'),(489,'profile/2018/03/05/设备资产批量导入模板文件_zfHkmkG.xls'),(490,'profile/2018/03/05/设备资产批量导入模板文件_xmiwi4A.xls'),(491,'profile/2018/03/05/设备资产批量导入模板文件_yevEco1.xls'),(492,'profile/2018/03/05/设备资产批量导入模板文件_8OXKpgU.xls'),(493,'profile/2018/03/05/设备资产批量导入模板文件_rxmHNDU.xls'),(494,'profile/2018/03/05/设备资产批量导入模板文件_RQcFAJg.xls'),(495,'profile/2018/03/05/设备资产批量导入模板文件_oiX0vge.xls'),(496,'profile/2018/03/05/设备资产批量导入模板文件_n9YCjNn.xls'),(497,'profile/2018/03/05/设备资产批量导入模板文件_mwykZul.xls'),(498,'profile/2018/03/05/设备资产批量导入模板文件_DhjMcJT.xls'),(499,'profile/2018/03/05/设备资产批量导入模板文件_mXkeF8g.xls'),(500,'profile/2018/03/05/设备资产批量导入模板文件_oh5c6HD.xls'),(501,'profile/2018/03/05/设备资产批量导入模板文件_oUZwXOF.xls'),(502,'profile/2018/03/05/设备资产批量导入模板文件_L8ZhiD7.xls'),(503,'profile/2018/03/05/设备资产批量导入模板文件_q10TcWm.xls'),(504,'profile/2018/03/05/设备资产批量导入模板文件_zaNNZmE.xls'),(505,'profile/2018/03/05/设备资产批量导入模板文件_mHNsi5U.xls'),(506,'profile/2018/03/05/设备资产批量导入模板文件_GYbzqKS.xls'),(507,'profile/2018/03/05/设备资产批量导入模板文件_srFmYxd.xls'),(508,'profile/2018/03/05/设备资产批量导入模板文件_Tx255i4.xls'),(509,'profile/2018/03/05/设备资产批量导入模板文件_HdhytnV.xls'),(510,'profile/2018/03/05/设备资产批量导入模板文件_QLcjRAR.xls'),(511,'profile/2018/03/05/设备资产批量导入模板文件_DI2LiVQ.xls'),(512,'profile/2018/03/05/设备资产批量导入模板文件_9kfs28K.xls'),(513,'profile/2018/03/05/设备资产批量导入模板文件_B5m6tl5.xls'),(514,'profile/2018/03/05/设备资产批量导入模板文件_Ul3RnAu.xls'),(515,'profile/2018/03/05/设备资产批量导入模板文件_bKISwEQ.xls'),(516,'profile/2018/03/05/设备资产批量导入模板文件_TMAMb7z.xls'),(517,'profile/2018/03/05/设备资产批量导入模板文件_VcOal4B.xls'),(518,'profile/2018/03/05/设备资产批量导入模板文件_XO9nLPQ.xls'),(519,'profile/2018/03/05/设备资产批量导入模板文件_PoVfK3h.xls'),(520,'profile/2018/03/05/设备资产批量导入模板文件_WkdJZ4h.xls'),(521,'profile/2018/03/05/设备资产批量导入模板文件_mAqFeQ8.xls'),(522,'profile/2018/03/05/设备资产批量导入模板文件_ZZ0L1FD.xls'),(523,'profile/2018/03/05/设备资产批量导入模板文件_JzkNOg9.xls'),(524,'profile/2018/03/05/设备资产批量导入模板文件_uM5YBC4.xls'),(525,'profile/2018/03/05/设备资产批量导入模板文件_eXTAjY0.xls'),(526,'profile/2018/03/05/设备资产批量导入模板文件_q4BznNy.xls'),(527,'profile/2018/03/05/设备资产批量导入模板文件_jTfDG6A.xls'),(528,'profile/2018/03/05/设备资产批量导入模板文件_3Syl4bE.xls'),(529,'profile/2018/03/05/设备资产批量导入模板文件_jVl3pNh.xls'),(530,'profile/2018/03/05/设备资产批量导入模板文件_LffEC9S.xls'),(531,'profile/2018/03/05/设备资产批量导入模板文件_LFNdXKn.xls'),(532,'profile/2018/03/05/设备资产批量导入模板文件_dNKSbi2.xls'),(533,'profile/2018/03/05/设备资产批量导入模板文件_9dEhWKD.xls'),(534,'profile/2018/03/05/test_5DDeSx3.sh'),(535,'profile/2018/03/05/echo_0ikZ2JB.yml'),(536,'profile/2018/03/05/test_HdHkXhu.sh'),(537,'profile/2018/03/06/设备资产批量导入模板文件.xls'),(538,'profile/2018/03/06/设备资产批量导入模板文件_2pnkkvi.xls'),(539,'profile/2018/03/06/设备资产批量导入模板文件_WSzRW1P.xls'),(540,'profile/2018/03/06/设备资产批量导入模板文件_U8mAvE7.xls'),(541,'profile/2018/03/06/设备资产批量导入模板文件_nuujdJu.xls'),(542,'profile/2018/03/06/设备资产批量导入模板文件_vSywjid.xls'),(543,'profile/2018/03/06/设备资产批量导入模板文件_pIEtd9y.xls'),(544,'profile/2018/03/06/设备资产批量导入模板文件_Klcm1VK.xls'),(545,'profile/2018/03/06/设备资产批量导入模板文件_pXk9ags.xls'),(546,'profile/2018/03/06/设备资产批量导入模板文件_hVTve9A.xls'),(547,'profile/2018/03/06/设备资产批量导入模板文件_j2WmXdE.xls'),(548,'profile/2018/03/06/设备资产批量导入模板文件_mAYoVzc.xls'),(549,'profile/2018/03/06/设备资产批量导入模板文件_BRQ6wjl.xls'),(550,'profile/2018/03/06/设备资产批量导入模板文件_MXZlNsS.xls'),(551,'profile/2018/03/06/设备资产批量导入模板文件_3FJPfUi.xls'),(552,'profile/2018/03/06/设备资产批量导入模板文件_qkw61dp.xls'),(553,'profile/2018/03/06/设备资产批量导入模板文件_AgOq5zm.xls'),(554,'profile/2018/03/06/设备资产批量导入模板文件_FwvNLOK.xls'),(555,'profile/2018/03/06/设备资产批量导入模板文件_udR96b5.xls'),(556,'profile/2018/03/06/设备资产批量导入模板文件_SW8DmuT.xls'),(557,'profile/2018/03/06/设备资产批量导入模板文件_rZ4WfS1.xls'),(558,'profile/2018/03/06/设备资产批量导入模板文件_FcIU9eN.xls'),(559,'profile/2018/03/06/设备资产批量导入模板文件_xxM7LIH.xls'),(560,'profile/2018/03/06/设备资产批量导入模板文件_OT8XSN6.xls'),(561,'profile/2018/03/06/设备资产批量导入模板文件_vxa8xTh.xls'),(562,'profile/2018/03/06/设备资产批量导入模板文件_j4OFL2x.xls'),(563,'profile/2018/03/06/设备资产批量导入模板文件_zwsGR8K.xls'),(564,'profile/2018/03/06/设备资产批量导入模板文件_eHgIST4.xls'),(565,'profile/2018/03/06/设备资产批量导入模板文件_YXy7ufF.xls'),(566,'profile/2018/03/06/设备资产批量导入模板文件_O1GP5if.xls'),(567,'profile/2018/03/06/设备资产批量导入模板文件_MsMZH29.xls'),(568,'profile/2018/03/06/设备资产批量导入模板文件_EQSWD1n.xls'),(569,'profile/2018/03/06/设备资产批量导入模板文件_x2byfx3.xls'),(570,'profile/2018/03/06/设备资产批量导入模板文件_4PZqp1T.xls'),(571,'profile/2018/03/06/设备资产批量导入模板文件_nWAZpFy.xls'),(572,'profile/2018/03/06/设备资产批量导入模板文件_8XSfF77.xls'),(573,'profile/2018/03/06/设备资产批量导入模板文件_WAsEb93.xls'),(574,'profile/2018/03/06/设备资产批量导入模板文件_mvYLifJ.xls'),(575,'profile/2018/03/06/设备资产批量导入模板文件_EEEaaMY.xls'),(576,'profile/2018/03/06/设备资产批量导入模板文件_792iCvE.xls'),(577,'profile/2018/03/06/设备资产批量导入模板文件_zQRHev6.xls'),(578,'profile/2018/03/06/设备资产批量导入模板文件_xjeWFk9.xls'),(579,'profile/2018/03/06/设备资产批量导入模板文件_jnBP8rm.xls'),(580,'profile/2018/03/06/设备资产批量导入模板文件_jyo3TTe.xls'),(581,'profile/2018/03/06/设备资产批量导入模板文件_YR072Ie.xls'),(582,'profile/2018/03/06/设备资产批量导入模板文件_JPmOMQq.xls'),(583,'profile/2018/03/06/设备资产批量导入模板文件_qx14WFj.xls'),(584,'profile/2018/03/06/设备资产批量导入模板文件_l4xHB1X.xls'),(585,'profile/2018/03/06/设备资产批量导入模板文件_sIdhAQf.xls'),(586,'profile/2018/03/06/设备资产批量导入模板文件_RbB8Skv.xls'),(587,'profile/2018/03/06/设备资产批量导入模板文件_s2e7gVY.xls'),(588,'profile/2018/03/06/设备资产批量导入模板文件_Axkpkas.xls'),(589,'profile/2018/03/06/设备资产批量导入模板文件_IK7A1WC.xls'),(590,'profile/2018/03/06/设备资产批量导入模板文件_7fI4plL.xls'),(591,'profile/2018/03/13/hello.yml'),(592,'profile/2018/03/13/test.sh');
/*!40000 ALTER TABLE `accounts_profileimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_scheduledetails`
--

DROP TABLE IF EXISTS `accounts_scheduledetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_scheduledetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eta` datetime(6) DEFAULT NULL,
  `args` varchar(200) DEFAULT NULL,
  `sid` varchar(70) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `result` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_scheduledetails`
--

LOCK TABLES `accounts_scheduledetails` WRITE;
/*!40000 ALTER TABLE `accounts_scheduledetails` DISABLE KEYS */;
INSERT INTO `accounts_scheduledetails` VALUES (13,'2018-02-12 02:10:48.745397','[1, 100]','3fe251c9-b535-40bc-8b9e-d5f0f9c6f370','PENDING',NULL),(14,'2018-02-12 02:10:48.782384','[99, 100]','22c6893f-573c-43a5-960e-485c5edc1f95','PENDING',NULL),(15,'2018-02-12 02:35:26.653944','[1, 100]','9a801c39-0507-4864-947e-982d4b4f58ee','PENDING',NULL),(16,'2018-02-12 02:35:26.692173','[99, 100]','2d776129-e88e-4161-85f7-7ce71de1ff6b','PENDING',NULL),(17,'2018-02-12 02:47:15.357780','[1, 100]','ff66548f-6496-4e8c-9ffc-9e883965739f','PENDING',NULL),(18,'2018-02-12 02:47:15.394957','[99, 100]','ae00352e-dccd-4a17-8976-173baf5e820c','PENDING',NULL),(19,'2018-02-12 02:52:01.538930','[1, 100]','44e8518d-96c8-4f74-a21f-bdda16dbf27a','PENDING',NULL),(20,'2018-02-12 02:52:01.580239','[99, 100]','b013cad4-8c45-4778-a82f-d1fe6b22d5cb','PENDING',NULL),(21,'2018-02-12 02:58:56.397741','[1, 100]','1433a038-4ac6-4d71-999e-f55eef5dd8e2','PENDING',NULL),(22,'2018-02-12 02:58:56.438899','[99, 100]','616d5bdb-865f-4a33-8c1a-8b8ad76fa30c','PENDING',NULL),(23,'2018-02-12 03:00:15.050526','[1, 100]','8ad5d0f5-2ca0-4b88-bec1-374ad41d6b68','PENDING',NULL),(24,'2018-02-12 03:00:15.093113','[99, 100]','ca03d7e9-46c2-407e-9d10-856b99e3b16c','PENDING',NULL),(25,'2018-02-12 15:55:00.000000','()','0bb0093d-8678-4552-a873-5735dccace2a','PENDING',NULL),(26,'2018-02-12 12:00:00.000000','()','05aba3fb-90bd-45ed-baf0-8df1a298f278','PENDING',NULL),(27,'2018-02-12 07:20:00.000000','()','a4172f42-7eca-4019-b5fe-d921a5bfdd56','PENDING',NULL),(28,'2018-02-12 12:15:00.000000','()','f63c1e1b-1720-482e-966c-c564647c3ee6','PENDING',NULL),(29,'2018-02-12 12:20:00.000000','()','5ef32d9d-9720-48e6-bc6a-0ec21b49caad','PENDING',NULL),(30,'2018-02-12 14:32:00.000000','()','9be2544f-38c8-4eaa-bfac-020d7c571d95','PENDING',NULL),(31,'2018-02-12 07:50:00.000000','()','61d94494-53bf-4927-95fd-e0c1fa24d731','PENDING',NULL),(32,'2018-02-13 02:30:00.000000','()','a9309b38-f8bb-4e52-b188-8a69c72535bd','PENDING',NULL),(33,'2018-02-13 02:35:00.000000','()','1aa55139-f210-437f-b211-ed528d2a9170','PENDING',NULL),(34,'2018-02-13 02:40:00.000000','()','64f7064c-6718-432e-8973-5ddf6eb6f203','PENDING',NULL),(35,'2018-02-24 09:35:00.000000','()','1af38908-6793-470e-a03d-ce9527c351c0','PENDING',NULL);
/*!40000 ALTER TABLE `accounts_scheduledetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Host_Manager_Group');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,26),(3,1,27);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add host_ user',7,'add_host_user'),(20,'Can change host_ user',7,'change_host_user'),(21,'Can delete host_ user',7,'delete_host_user'),(22,'Can add category',8,'add_category'),(23,'Can change category',8,'change_category'),(24,'Can delete category',8,'delete_category'),(25,'Can add host',9,'add_host'),(26,'Can change host',9,'change_host'),(27,'Can delete host',9,'delete_host'),(28,'Can add HostGroups',10,'add_hostgroups'),(29,'Can change HostGroups',10,'change_hostgroups'),(30,'Can delete HostGroups',10,'delete_hostgroups'),(31,'Can add host group',10,'add_hostgroup'),(32,'Can change host group',10,'change_hostgroup'),(33,'Can delete host group',10,'delete_hostgroup'),(34,'Can add photo',11,'add_photo'),(35,'Can change photo',11,'change_photo'),(36,'Can delete photo',11,'delete_photo'),(37,'Can add photo',12,'add_photo'),(38,'Can change photo',12,'change_photo'),(39,'Can delete photo',12,'delete_photo'),(40,'Can add profile image',13,'add_profileimage'),(41,'Can change profile image',13,'change_profileimage'),(42,'Can delete profile image',13,'delete_profileimage'),(43,'Can add periodic task',14,'add_periodictask'),(44,'Can change periodic task',14,'change_periodictask'),(45,'Can delete periodic task',14,'delete_periodictask'),(46,'Can add crontab',15,'add_crontabschedule'),(47,'Can change crontab',15,'change_crontabschedule'),(48,'Can delete crontab',15,'delete_crontabschedule'),(49,'Can add interval',16,'add_intervalschedule'),(50,'Can change interval',16,'change_intervalschedule'),(51,'Can delete interval',16,'delete_intervalschedule'),(52,'Can add periodic tasks',17,'add_periodictasks'),(53,'Can change periodic tasks',17,'change_periodictasks'),(54,'Can delete periodic tasks',17,'delete_periodictasks'),(55,'Can add task state',18,'add_taskmeta'),(56,'Can change task state',18,'change_taskmeta'),(57,'Can delete task state',18,'delete_taskmeta'),(58,'Can add saved group result',19,'add_tasksetmeta'),(59,'Can change saved group result',19,'change_tasksetmeta'),(60,'Can delete saved group result',19,'delete_tasksetmeta'),(61,'Can add worker',20,'add_workerstate'),(62,'Can change worker',20,'change_workerstate'),(63,'Can delete worker',20,'delete_workerstate'),(64,'Can add task',21,'add_taskstate'),(65,'Can change task',21,'change_taskstate'),(66,'Can delete task',21,'delete_taskstate'),(67,'Can add schedule details',22,'add_scheduledetails'),(68,'Can change schedule details',22,'change_scheduledetails'),(69,'Can delete schedule details',22,'delete_scheduledetails'),(70,'Can add new host',23,'add_newhost'),(71,'Can change new host',23,'change_newhost'),(72,'Can delete new host',23,'delete_newhost'),(73,'Can add host user',7,'add_hostuser'),(74,'Can change host user',7,'change_hostuser'),(75,'Can delete host user',7,'delete_hostuser'),(76,'Can add 总资产表',24,'add_asset'),(77,'Can change 总资产表',24,'change_asset'),(78,'Can delete 总资产表',24,'delete_asset'),(79,'读取资产权限',24,'can_read_assets'),(80,'更改资产权限',24,'can_change_assets'),(81,'添加资产权限',24,'can_add_assets'),(82,'删除资产权限',24,'can_delete_assets'),(83,'Can add 服务器资产表',25,'add_server'),(84,'Can change 服务器资产表',25,'change_server'),(85,'Can delete 服务器资产表',25,'delete_server'),(86,'读取服务器资产权限',25,'can_read_server_assets'),(87,'更改服务器资产权限',25,'can_change_server_assets'),(88,'添加服务器资产权限',25,'can_add_server_assets'),(89,'删除服务器资产权限',25,'can_delete_server_assets');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$m1czGjoaQDVg$EtnJ1wMB8h492bz3qS+LGzvrY+6PxsXrWMK13Cl35+M=','2018-03-06 06:09:01.914173',1,'jcc','Jimmy','Zhou','jcc@ibm.com',1,1,'2018-01-15 09:00:05.000000'),(2,'pbkdf2_sha256$36000$Xe9sNAHCZl8G$3ArjrsRKKlyNpn4xKMysZPZFSbdAYpZLYJ/aJ8S4p10=','2018-02-25 08:29:03.495068',0,'bjm','bill','Matrin','Bill.Martin@nygard.com',1,1,'2018-02-05 06:29:52.000000'),(3,'pbkdf2_sha256$36000$upzaXkEAHw58$P3I/CCMRxIdLMBigTutLnYAdGf9n0S8ORTE1QISfaPU=','2018-02-25 08:28:35.438601',0,'dwf','David','Fu','David.Fu@nygard.com',1,1,'2018-02-05 07:30:27.000000'),(5,'',NULL,0,'Richard.Swingish','','','Richard.Swingish@nygard.com',0,1,'2018-02-28 10:31:37.515783'),(6,'',NULL,0,'Jane.Chung','','','Jane.Chung@twitter.com',0,1,'2018-03-01 02:34:30.337626');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-01-15 09:00:52.770464','1','Host_Manager_Group',1,'[{\"added\": {}}]',2,1),(2,'2018-01-15 09:01:25.615413','1','jcc',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(3,'2018-01-15 09:27:55.314846','1','ACLU',1,'[{\"added\": {}}]',10,1),(4,'2018-01-15 09:28:23.528288','2','Agape',1,'[{\"added\": {}}]',10,1),(5,'2018-01-15 09:29:22.223983','3','2008-2009 \"Mini\" Baja',1,'[{\"added\": {}}]',10,1),(6,'2018-01-15 09:29:41.700346','4','Active Minds',1,'[{\"added\": {}}]',10,1),(7,'2018-01-15 09:32:36.280660','1','192.168.108.112',1,'[{\"added\": {}}]',9,1),(8,'2018-01-15 09:33:38.763359','2','192.168.108.204',1,'[{\"added\": {}}]',9,1),(9,'2018-01-15 09:33:50.515149','2','192.168.108.204',2,'[{\"changed\": {\"fields\": [\"location\"]}}]',9,1),(10,'2018-01-15 09:35:15.865323','3','192.168.108.111',1,'[{\"added\": {}}]',9,1),(11,'2018-01-15 09:35:51.251348','1','192.168.111.112',2,'[{\"changed\": {\"fields\": [\"ip\", \"name\"]}}]',9,1),(12,'2018-01-15 09:36:02.619953','2','192.168.111.204',2,'[{\"changed\": {\"fields\": [\"ip\", \"name\"]}}]',9,1),(13,'2018-01-15 09:36:12.904506','3','192.168.111.111',2,'[{\"changed\": {\"fields\": [\"ip\", \"name\"]}}]',9,1),(14,'2018-01-15 09:37:12.256870','4','Active Minds',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(15,'2018-01-15 09:37:29.784849','1','ACLU',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(16,'2018-01-15 09:37:36.467097','1','ACLU',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(17,'2018-01-16 01:30:17.660095','4','Active Minds',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(18,'2018-02-05 06:30:43.948042','2','bjm',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(19,'2018-02-05 06:32:19.262848','2','bjm',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\"]}}]',4,1),(20,'2018-02-05 07:31:25.237893','3','dwf',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(21,'2018-02-05 07:31:36.557582','3','dwf',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(22,'2018-02-05 09:31:52.687047','1','jcc',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,1),(23,'2018-02-23 03:31:12.146170','4','192.168.111.113',1,'[{\"added\": {}}]',9,1),(24,'2018-02-23 03:31:41.828311','5','192.168.111.114',1,'[{\"added\": {}}]',9,1),(25,'2018-02-23 03:32:09.089361','6','192.168.111.115',1,'[{\"added\": {}}]',9,1),(26,'2018-02-23 03:33:57.855680','4','Active Minds',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(27,'2018-02-23 03:34:05.924036','3','2008-2009 \"Mini\" Baja',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(28,'2018-02-23 03:34:15.483715','2','Agape',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(29,'2018-02-23 03:34:26.234541','1','ACLU',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(30,'2018-02-23 11:55:51.046941','4','Java1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(31,'2018-02-23 11:55:58.800090','3','Java2',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(32,'2018-02-23 11:56:07.179183','2','Java3',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(33,'2018-02-23 11:56:13.478488','1','Java4',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(34,'2018-02-24 10:27:46.446921','12','192.168.110.120',1,'[{\"added\": {}}]',9,1),(35,'2018-02-24 10:27:57.721429','12','192.168.110.120',3,'',9,1),(36,'2018-02-24 10:29:35.875904','13','192.168.110.120',1,'[{\"added\": {}}]',9,1),(37,'2018-02-24 10:29:51.264918','13','192.168.110.120',3,'',9,1),(38,'2018-02-24 10:33:28.975746','14','192.168.110.121',1,'[{\"added\": {}}]',9,1),(39,'2018-02-24 10:34:57.734930','15','192.168.111.121',3,'',9,1),(40,'2018-02-25 07:18:03.798487','1','jcc',1,'[{\"added\": {}}]',7,1),(41,'2018-02-25 07:18:12.333813','2','bjm',1,'[{\"added\": {}}]',7,1),(42,'2018-02-25 07:18:20.188175','3','jcc',1,'[{\"added\": {}}]',7,1),(43,'2018-02-25 07:25:34.545217','4','bjm',1,'[{\"added\": {}}]',7,1),(44,'2018-02-25 07:25:50.352954','4','bjm',3,'',7,1),(45,'2018-02-25 07:32:11.812766','4','Java1',2,'[{\"changed\": {\"fields\": [\"bind_users\"]}}]',10,1),(46,'2018-02-25 07:32:22.769757','4','Java1',2,'[]',10,1),(47,'2018-02-25 07:32:29.949736','3','Java2',2,'[{\"changed\": {\"fields\": [\"bind_users\"]}}]',10,1),(48,'2018-02-25 07:32:34.998149','3','Java2',2,'[]',10,1),(49,'2018-02-25 07:32:41.032586','1','Java4',2,'[{\"changed\": {\"fields\": [\"bind_users\"]}}]',10,1),(50,'2018-02-25 07:50:03.782567','6','bjm',1,'[{\"added\": {}}]',7,1),(51,'2018-02-25 07:50:15.802732','3','jcc',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(52,'2018-02-25 07:50:24.446799','2','jcc',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(53,'2018-02-25 07:50:30.198719','1','jcc',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(54,'2018-02-25 07:50:37.184961','2','jcc',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(55,'2018-02-25 07:50:46.883280','6','jcc',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',7,1),(56,'2018-02-25 07:50:59.070626','7','bjm',1,'[{\"added\": {}}]',7,1),(57,'2018-02-25 07:51:07.455450','8','dwf',1,'[{\"added\": {}}]',7,1),(58,'2018-02-25 07:51:14.291097','9','dwf',1,'[{\"added\": {}}]',7,1),(59,'2018-02-25 07:51:22.060683','7','bjm',2,'[{\"changed\": {\"fields\": [\"group\"]}}]',7,1),(60,'2018-02-25 07:51:32.173444','10','bjm',1,'[{\"added\": {}}]',7,1),(61,'2018-02-25 08:24:45.887011','3','dwf',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(62,'2018-02-25 08:25:00.062669','4','test',1,'[{\"added\": {}}]',4,1),(63,'2018-02-25 08:25:21.048628','4','test',2,'[{\"changed\": {\"fields\": [\"first_name\", \"email\", \"is_staff\", \"is_superuser\"]}}]',4,1),(64,'2018-02-25 08:26:43.988367','4','Java1',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(65,'2018-02-25 08:26:52.910418','3','Java2',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(66,'2018-02-25 08:27:00.610624','2','Java3',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(67,'2018-02-25 08:27:06.463284','1','Java4',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(68,'2018-02-25 08:27:51.944074','2','Java3',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(69,'2018-02-25 08:28:04.646677','1','Java4',2,'[{\"changed\": {\"fields\": [\"bind_hosts\"]}}]',10,1),(70,'2018-02-25 09:10:04.106185','3','192.168.111.111',2,'[{\"changed\": {\"fields\": [\"location\"]}}]',9,1),(71,'2018-03-05 01:35:18.470642','1','Asset object',1,'[{\"added\": {}}]',24,1),(72,'2018-03-05 01:44:38.554324','1','Server object',1,'[{\"added\": {}}]',25,1),(73,'2018-03-05 02:27:44.385814','1','Asset object',2,'[{\"changed\": {\"fields\": [\"model\"]}}]',24,1),(74,'2018-03-05 06:00:12.789639','23','Asset object',2,'[{\"changed\": {\"fields\": [\"provider\", \"model\"]}}]',24,1),(75,'2018-03-05 06:00:24.974869','24','Asset object',2,'[{\"changed\": {\"fields\": [\"provider\", \"model\"]}}]',24,1),(76,'2018-03-05 06:01:31.120235','2','Asset object',2,'[{\"changed\": {\"fields\": [\"sn\", \"buy_time\", \"expire_date\", \"management_ip\", \"manufacturer\", \"provider\", \"model\", \"status\", \"put_zone\", \"group\", \"business\", \"project\"]}}]',24,1),(77,'2018-03-05 06:01:50.723307','23','Asset object',2,'[{\"changed\": {\"fields\": [\"provider\", \"business\"]}}]',24,1),(78,'2018-03-05 06:24:55.456094','2','Asset object',2,'[{\"changed\": {\"fields\": [\"assets_type\", \"sn\"]}}]',24,1),(79,'2018-03-05 06:25:01.633027','1','Asset object',2,'[]',24,1),(80,'2018-03-05 06:25:18.942532','23','Asset object',2,'[{\"changed\": {\"fields\": [\"assets_type\"]}}]',24,1),(81,'2018-03-05 06:25:26.713539','24','Asset object',2,'[{\"changed\": {\"fields\": [\"assets_type\"]}}]',24,1),(82,'2018-03-05 06:25:32.672264','25','Asset object',2,'[{\"changed\": {\"fields\": [\"assets_type\"]}}]',24,1),(83,'2018-03-05 06:25:37.947344','26','Asset object',2,'[{\"changed\": {\"fields\": [\"assets_type\"]}}]',24,1),(84,'2018-03-05 06:25:54.171993','1','Asset object',2,'[{\"changed\": {\"fields\": [\"sn\"]}}]',24,1),(85,'2018-03-05 09:49:53.863876','37','Asset object',3,'',24,1),(86,'2018-03-05 10:03:39.576837','47','Asset object',3,'',24,1),(87,'2018-03-05 10:03:39.578815','46','Asset object',3,'',24,1),(88,'2018-03-05 10:03:39.579773','45','Asset object',3,'',24,1),(89,'2018-03-05 10:03:39.580603','44','Asset object',3,'',24,1),(90,'2018-03-05 10:03:39.581522','43','Asset object',3,'',24,1),(91,'2018-03-05 10:03:39.583561','42','Asset object',3,'',24,1),(92,'2018-03-05 10:03:39.584918','41','Asset object',3,'',24,1),(93,'2018-03-05 10:03:39.585961','40','Asset object',3,'',24,1),(94,'2018-03-05 10:03:39.587309','39','Asset object',3,'',24,1),(95,'2018-03-05 10:03:39.588139','38','Asset object',3,'',24,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (24,'accounts','asset'),(8,'accounts','category'),(9,'accounts','host'),(10,'accounts','hostgroup'),(7,'accounts','hostuser'),(23,'accounts','newhost'),(11,'accounts','photo'),(13,'accounts','profileimage'),(22,'accounts','scheduledetails'),(25,'accounts','server'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'djcelery','crontabschedule'),(16,'djcelery','intervalschedule'),(14,'djcelery','periodictask'),(17,'djcelery','periodictasks'),(18,'djcelery','taskmeta'),(19,'djcelery','tasksetmeta'),(21,'djcelery','taskstate'),(20,'djcelery','workerstate'),(12,'photos','photo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-15 08:57:45.876397'),(2,'auth','0001_initial','2018-01-15 08:57:46.190179'),(3,'accounts','0001_initial','2018-01-15 08:57:46.352361'),(4,'admin','0001_initial','2018-01-15 08:57:46.426740'),(5,'admin','0002_logentry_remove_auto_add','2018-01-15 08:57:46.466187'),(6,'contenttypes','0002_remove_content_type_name','2018-01-15 08:57:46.531890'),(7,'auth','0002_alter_permission_name_max_length','2018-01-15 08:57:46.554191'),(8,'auth','0003_alter_user_email_max_length','2018-01-15 08:57:46.587926'),(9,'auth','0004_alter_user_username_opts','2018-01-15 08:57:46.617928'),(10,'auth','0005_alter_user_last_login_null','2018-01-15 08:57:46.649696'),(11,'auth','0006_require_contenttypes_0002','2018-01-15 08:57:46.651058'),(12,'auth','0007_alter_validators_add_error_messages','2018-01-15 08:57:46.663420'),(13,'auth','0008_alter_user_username_max_length','2018-01-15 08:57:46.695587'),(14,'sessions','0001_initial','2018-01-15 08:57:46.729524'),(15,'accounts','0002_hostgroups','2018-01-15 09:03:27.719033'),(16,'accounts','0003_auto_20180115_0910','2018-01-15 09:10:23.179644'),(17,'accounts','0004_auto_20180115_0926','2018-01-15 09:26:12.723420'),(18,'accounts','0005_auto_20180115_0932','2018-01-15 09:32:20.540989'),(19,'accounts','0006_auto_20180115_0934','2018-01-15 09:34:45.610561'),(20,'accounts','0007_auto_20180115_0936','2018-01-15 09:36:38.252286'),(21,'accounts','0008_photo','2018-02-01 04:21:12.512533'),(22,'photos','0001_initial','2018-02-01 04:21:12.540286'),(23,'photos','0002_auto_20161122_1248','2018-02-01 04:21:12.546172'),(24,'accounts','0009_auto_20180201_0710','2018-02-01 07:10:12.007876'),(25,'djcelery','0001_initial','2018-02-07 13:01:15.236677'),(26,'accounts','0010_scheduledetails','2018-02-11 07:34:52.092918'),(27,'accounts','0011_auto_20180211_0817','2018-02-11 08:17:06.993449'),(28,'accounts','0012_auto_20180224_1829','2018-02-24 10:29:14.523264'),(29,'accounts','0013_newhost','2018-02-25 04:32:55.954323'),(30,'accounts','0014_hostgroup_bind_users','2018-02-25 07:09:21.182975'),(31,'accounts','0015_remove_hostgroup_bind_users','2018-02-25 07:10:41.388340'),(32,'accounts','0016_host_user','2018-02-25 07:12:57.621021'),(33,'accounts','0017_auto_20180225_1517','2018-02-25 07:17:46.074934'),(34,'accounts','0018_hostgroup_bind_users','2018-02-25 07:20:10.639859'),(35,'accounts','0019_auto_20180225_1524','2018-02-25 07:24:42.172024'),(36,'accounts','0020_hostuser_department','2018-02-25 07:34:26.469826'),(37,'accounts','0021_remove_hostuser_user','2018-02-25 07:36:11.494732'),(38,'accounts','0022_remove_hostgroup_bind_users','2018-02-25 07:38:17.829744'),(39,'accounts','0023_auto_20180225_1546','2018-02-25 07:46:16.991802'),(40,'accounts','0024_auto_20180228_1816','2018-02-28 10:16:29.799508'),(41,'accounts','0025_auto_20180228_1826','2018-02-28 10:28:28.551242'),(42,'accounts','0026_asset_server','2018-03-04 10:15:03.534071'),(43,'accounts','0027_auto_20180304_1849','2018-03-04 10:49:07.708044'),(44,'accounts','0028_auto_20180305_1215','2018-03-05 04:15:44.457522'),(45,'accounts','0029_remove_asset_name','2018-03-05 04:18:58.296615');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('10mz50a8zgrwm5endvorvgju1nwd7nhx','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-15 02:08:59.755952'),('3aqzn1fo21qvw0s3pczj9bn985mxx610','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-16 01:58:29.976199'),('52bym1bmvwkm9y41zfyhl056zn53a911','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-02-21 14:16:05.167053'),('db5ni13uot11srkgkbm3tx6oj5uuow8t','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-29 09:07:16.097823'),('dg9n63izcf2g3c972x4imb94bgv3z63l','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-02-20 01:57:45.231160'),('g3zfkju080akpnv8pgeizkdnylf29ctj','MTA3NTJmZWM4NjlkNjFmZjc5M2NmOTg5NGQ1ZWIzZTI4ZjJmMWQ4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-03-14 08:38:12.392954'),('m2s5t70w4l29wprctjkx65x0twwx7h9e','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-11 08:52:17.545575'),('nxm8jy9cql6vtrdydcbk7pyw2hylkj54','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-15 02:30:19.817942'),('rik0nekkzwk40kc2esyrj4v3qdfm9ok7','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-20 06:09:01.916549'),('w186c6ktj4zqi4v55wzbw19k9auwuku6','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-29 09:08:22.204765'),('xaujzj1y4dh1evrc53ljv72h6g9vmlzb','YmY2ZmJjMTVhNzhmZjAzMmE1NjQ3ZjQ5ZGIxMTlkMzA1MTZiOWYwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-02-20 14:48:09.557568'),('ynyv7p8bydlmeunk22tkoe5piyp8541g','MTA3NTJmZWM4NjlkNjFmZjc5M2NmOTg5NGQ1ZWIzZTI4ZjJmMWQ4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzYTM5MWQ0NGFkYmIwNmZjMWU4MzJhMDZhNmNlOWE2YmVjZjYzMGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-03-10 10:03:23.347540');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` (`crontab_id`),
  KEY `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` (`interval_id`),
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos_photo`
--

DROP TABLE IF EXISTS `photos_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos_photo`
--

LOCK TABLES `photos_photo` WRITE;
/*!40000 ALTER TABLE `photos_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salmon_asset`
--

DROP TABLE IF EXISTS `salmon_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salmon_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assets_type` varchar(100) NOT NULL,
  `sn` varchar(100) DEFAULT NULL,
  `buy_time` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `management_ip` char(39) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `put_zone` smallint(6) DEFAULT NULL,
  `group` smallint(6) DEFAULT NULL,
  `business` smallint(6) DEFAULT NULL,
  `project` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salmon_asset`
--

LOCK TABLES `salmon_asset` WRITE;
/*!40000 ALTER TABLE `salmon_asset` DISABLE KEYS */;
INSERT INTO `salmon_asset` VALUES (1,'server','sn000','2018-03-05','2020-03-04','192.168.100.1','Dell','Dell Inc.','Poweredge R730',0,1,1,1,1),(2,'vmser','sn001','2018-03-05','2020-03-05','192.168.100.1','Dell','Dell Inc.','Poweredge R630',1,1,1,1,1),(23,'vmser','sn002','2018-03-05','2020-03-04','192.168.100.2','Dell','Dell Inc.','Poweredge R730',0,1,1,1,1),(24,'vmser','sn003','2018-03-05','2020-03-04','192.168.100.3','Dell','Dell Inc','Poweredge R730',0,1,1,NULL,1),(25,'vmser','sn004','2018-03-05','2020-03-04','192.168.100.4','Dell','Dell Inc.','Poweredge R730',0,1,1,NULL,1),(26,'vmser','sn005','2018-03-05','2020-03-04','192.168.100.5','Dell','Dell Inc.','Poweredge R730',0,1,1,NULL,1),(27,'server','VM004','2017-09-10','2020-06-10','192.168.88.236','DELL','广州蓝鸟科技有限公司','poweredge r730',0,1,1,1,NULL),(28,'server','VM005','2017-09-10','2020-06-10','192.168.88.237','IBM','广州蓝鸟科技有限公司','IBM 3650',0,1,1,1,NULL),(29,'server','VM006','2017-09-10','2020-06-10','192.168.88.238','DELL','北京神州普华','poweredge r650',0,1,1,1,NULL),(30,'server','VM007','2017-09-10','2020-06-10','192.168.88.239','DELL','北京神州普华','poweredge r650',0,2,1,1,NULL),(31,'server','VM008','2017-09-10','2020-06-10','192.168.88.240','DELL','北京神州普华','poweredge r650',0,2,1,1,NULL),(32,'server','VM009','2017-09-10','2020-06-10','192.168.88.241','DELL','北京神州普华','poweredge r650',0,2,1,1,NULL),(33,'server','VM0010','2017-09-10','2020-06-10','192.168.88.242','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(34,'server','VM0011','2017-09-10','2020-06-10','192.168.88.243','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(35,'server','VM0012','2017-09-10','2020-06-10','192.168.88.244','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(36,'server','VM0013','2017-09-10','2020-06-10','192.168.88.245','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(48,'server','VM00014','2017-09-10','2020-06-10','192.168.77.236','DELL','广州蓝鸟科技有限公司','poweredge r730',0,1,1,1,NULL),(49,'server','VM00015','2017-09-10','2020-06-10','192.168.77.237','IBM','广州蓝鸟科技有限公司','IBM 3650',0,1,1,1,NULL),(50,'server','VM00016','2017-09-10','2020-06-10','192.168.77.238','DELL','北京神州普华','poweredge r650',0,1,1,1,NULL),(51,'server','VM00017','2017-09-10','2020-06-10','192.168.77.239','DELL','北京神州普华','poweredge r650',0,2,1,1,NULL),(52,'server','VM00018','2017-09-10','2020-06-10','192.168.77.240','DELL','北京神州普华','poweredge r650',0,2,1,1,NULL),(53,'server','VM00019','2017-09-10','2020-06-10','192.168.77.241','DELL','北京神州普华','poweredge r650',0,2,1,1,NULL),(54,'server','VM00020','2017-09-10','2020-06-10','192.168.77.242','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(55,'server','VM00021','2017-09-10','2020-06-10','192.168.77.243','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(56,'server','VM00022','2017-09-10','2020-06-10','192.168.77.244','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(57,'server','VM00023','2017-09-10','2020-06-10','192.168.77.245','DELL','北京路海创世','poweredge r650',0,2,1,1,NULL),(58,'server','VM00024','2017-09-10','2020-06-10','192.168.77.246','DELL','北京路海创世','poweredge r651',0,2,1,1,NULL),(59,'server','VM00025','2017-09-10','2020-06-10','192.168.77.247','DELL','北京路海创世','poweredge r652',0,2,1,1,NULL),(60,'server','VM00026','2017-09-10','2020-06-10','192.168.77.248','DELL','北京路海创世','poweredge r653',0,2,1,1,NULL),(61,'server','VM00027','2017-09-10','2020-06-10','192.168.77.249','DELL','北京路海创世','poweredge r654',0,2,1,1,NULL),(62,'server','VM00028','2017-09-10','2020-06-10','192.168.77.250','DELL','北京路海创世','poweredge r654',0,2,1,1,NULL),(63,'server','VM00029','2017-09-10','2020-06-10','192.168.77.251','DELL','北京路海创世','poweredge r654',0,2,1,1,NULL),(64,'server','VM00030','2017-09-10','2020-06-10','192.168.77.252','DELL','北京路海创世','poweredge r654',0,2,1,1,NULL),(65,'server','VM00031','2017-09-10','2020-06-10','192.168.77.253','DELL','北京路海创世','poweredge r654',0,2,1,1,NULL);
/*!40000 ALTER TABLE `salmon_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salmon_server`
--

DROP TABLE IF EXISTS `salmon_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salmon_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `passwd` varchar(100) DEFAULT NULL,
  `keyfile` smallint(6) DEFAULT NULL,
  `port` decimal(6,0) DEFAULT NULL,
  `line` smallint(6) DEFAULT NULL,
  `cpu` varchar(100) DEFAULT NULL,
  `cpu_number` smallint(6) DEFAULT NULL,
  `vcpu_number` smallint(6) DEFAULT NULL,
  `cpu_core` smallint(6) DEFAULT NULL,
  `disk_total` varchar(100) DEFAULT NULL,
  `ram_total` int(11) DEFAULT NULL,
  `kernel` varchar(100) DEFAULT NULL,
  `selinux` varchar(100) DEFAULT NULL,
  `swap` varchar(100) DEFAULT NULL,
  `raid` smallint(6) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `assets_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_id` (`assets_id`),
  UNIQUE KEY `ip` (`ip`),
  CONSTRAINT `salmon_server_assets_id_257624bc_fk_salmon_asset_id` FOREIGN KEY (`assets_id`) REFERENCES `salmon_asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salmon_server`
--

LOCK TABLES `salmon_server` WRITE;
/*!40000 ALTER TABLE `salmon_server` DISABLE KEYS */;
INSERT INTO `salmon_server` VALUES (1,'192.168.100.1','192.168.100.1','root','!QAZ2wsx',0,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-05 01:44:38.553748','2018-03-05 01:44:38.553784',1),(2,'192.168.100.2','192.168.100.2','root','!QAZ2wsx',0,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-05 05:36:20.383996','2018-03-05 05:36:20.384040',2),(6,'192.168.100.3','192.168.100.3','root','!QAZ2wsx',0,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-05 05:50:00.294023','2018-03-05 05:50:00.294064',23),(7,'192.168.88.236','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.648118','2018-03-05 09:47:02.648159',27),(8,'192.168.88.237','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.651185','2018-03-05 09:47:02.651217',28),(9,'192.168.88.238','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.653981','2018-03-05 09:47:02.654012',29),(10,'192.168.88.239','test1','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.656639','2018-03-05 09:47:02.656668',30),(11,'192.168.88.240','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.659298','2018-03-05 09:47:02.659329',31),(12,'192.168.88.241','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.662003','2018-03-05 09:47:02.662032',32),(13,'192.168.88.242','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.665619','2018-03-05 09:47:02.665651',33),(14,'192.168.88.243','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.668059','2018-03-05 09:47:02.668084',34),(15,'192.168.88.244','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.670951','2018-03-05 09:47:02.670984',35),(16,'192.168.88.245','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 09:47:02.673932','2018-03-05 09:47:02.673962',36),(28,'192.168.77.236','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.767587','2018-03-05 10:04:00.767631',48),(29,'192.168.77.237','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.770836','2018-03-05 10:04:00.770875',49),(30,'192.168.77.238','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.774243','2018-03-05 10:04:00.774272',50),(31,'192.168.77.239','test1','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.777157','2018-03-05 10:04:00.777182',51),(32,'192.168.77.240','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.779926','2018-03-05 10:04:00.779954',52),(33,'192.168.77.241','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.782494','2018-03-05 10:04:00.782518',53),(34,'192.168.77.242','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.785204','2018-03-05 10:04:00.785232',54),(35,'192.168.77.243','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.787757','2018-03-05 10:04:00.787783',55),(36,'192.168.77.244','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.790074','2018-03-05 10:04:00.790098',56),(37,'192.168.77.245','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:04:00.792847','2018-03-05 10:04:00.792878',57),(38,'192.168.77.246','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:07:54.707688','2018-03-05 10:07:54.707730',58),(39,'192.168.77.247','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:07:54.710403','2018-03-05 10:07:54.710429',59),(40,'192.168.77.248','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:07:54.712813','2018-03-05 10:07:54.712837',60),(41,'192.168.77.249','test','root','1223x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:07:54.715254','2018-03-05 10:07:54.715281',61),(42,'192.168.77.250','test','root','12234x',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:27:16.039798','2018-03-05 10:27:16.039836',62),(43,'192.168.77.251','test','root','123456.0',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:33:20.914899','2018-03-05 10:33:20.914936',63),(44,'192.168.77.252','test','root','123456.0',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 10:33:20.917280','2018-03-05 10:33:20.917305',64),(45,'192.168.77.253','test','root','123456.0',1,22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-03-05 11:05:47.736896','2018-03-05 11:05:47.736939',65);
/*!40000 ALTER TABLE `salmon_server` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-13 15:10:41
