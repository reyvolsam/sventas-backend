-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sventas
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET ucs2 COLLATE ucs2_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (3,'Campus 1','-','2019-07-11 12:49:06','2019-07-11 12:49:06',NULL),(4,'Campus 2','-','2019-07-11 13:03:32','2019-07-11 13:03:32',NULL),(5,'Campus 3','-','2019-07-11 13:03:36','2019-07-11 13:03:36',NULL),(6,'Campus 4','-','2019-07-11 13:03:39','2019-07-11 13:03:39',NULL),(7,'Campus 5','-','2019-07-11 13:03:44','2019-07-11 13:03:44',NULL);
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `campus_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_campus_id_idx` (`campus_id`),
  CONSTRAINT `fk_grades_campus_id` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (2,'1er Grado','-',3,'2019-07-11 13:08:45','2019-07-11 13:58:43',NULL),(3,'2o Grado','-',3,'2019-07-11 13:09:08','2019-07-11 13:09:08',NULL),(4,'3er Grado','-',3,'2019-07-11 13:09:14','2019-07-11 13:09:14',NULL),(5,'4o Grado','-',3,'2019-07-11 13:09:21','2019-07-11 13:09:21',NULL),(6,'5o Grado','-',3,'2019-07-11 13:09:26','2019-07-11 13:09:26',NULL),(7,'6o Grado','-',3,'2019-07-11 13:09:29','2019-07-11 13:09:29',NULL),(8,'7o Grado','-',3,'2019-07-11 13:09:46','2019-07-11 13:37:10',NULL),(9,'8o Grados','--/',3,'2019-07-11 13:13:00','2019-07-11 13:44:37','2019-07-11 13:44:37');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'root','root','2018-01-07 03:34:15',NULL,NULL),(2,'administrator','Administrador','2018-01-07 03:34:15',NULL,NULL),(3,'Contabilidad','accounting','2018-01-07 03:34:15',NULL,NULL),(4,'Vendedor','seller','2018-01-07 03:34:15',NULL,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('581b8c258e25bc61cf4e35b41489d91aae1da6cc35b315a6e023aecd8e0a9192b3d6e9cbd7aef8ba',1,1,'Personal Access Token','[]',0,'2019-06-04 23:20:12','2019-06-04 23:20:12','2020-06-04 18:20:12'),('d8d291337a787c37e91a34ce5e36d26500af325460e44247ef8e24cd7ffad921d59353f7c2735a71',1,1,'Personal Access Token','[]',0,'2019-06-04 23:22:38','2019-06-04 23:22:38','2020-06-04 18:22:38'),('a03bc78598a27089d57de64cbd8af91a3333f34eb8bad441bbad4382ac874700628e59c6b352be10',1,1,'Personal Access Token','[]',0,'2019-06-18 22:20:14','2019-06-18 22:20:14','2020-06-18 17:20:14'),('2f102bbc02345d4d20e73f768fce5aa64da729bf7490fca77417a52b7b1868c90178b3baba5bb574',1,1,'Personal Access Token','[]',0,'2019-06-18 22:39:12','2019-06-18 22:39:12','2020-06-18 17:39:12'),('2dc1d975caad40db7f4be75be812eb198a8d23a5af6ba4f5a7cd2b37ca99e21884bd7dd0714ff182',1,1,'Personal Access Token','[]',0,'2019-06-18 22:50:57','2019-06-18 22:50:57','2020-06-18 17:50:57'),('7d6eede0968b218d5e7a9f893d989af4201a24f09288fc79c092e8366c002d5f203af02ea133f739',1,1,'Personal Access Token','[]',0,'2019-06-18 22:59:04','2019-06-18 22:59:04','2020-06-18 17:59:04'),('433734cd43b6536a5e8a0239a9ee1628204f81bddb990f707f75b4cdf3949754660be558b54d17fd',1,1,'Personal Access Token','[]',0,'2019-06-18 23:00:22','2019-06-18 23:00:22','2020-06-18 18:00:22'),('27e8a50c828ce4a01eacada0637380e3441922a87e8335111385f8fbc9bb046b86834d322d7deb0f',1,1,'Personal Access Token','[]',0,'2019-06-18 23:01:57','2019-06-18 23:01:57','2020-06-18 18:01:57'),('d134d162f61016c33c0ebad6c53269ae6fbc1c593408df83d9f49ee0f6d1429e2af17ef32231ac48',1,1,'Personal Access Token','[]',0,'2019-06-18 23:02:57','2019-06-18 23:02:57','2020-06-18 18:02:57'),('89419bb1ff201959327d3500252e44346d035ee3d8654c0386bfeacbc7a86095c1debc9c1a160e27',1,1,'Personal Access Token','[]',0,'2019-06-18 23:18:55','2019-06-18 23:18:55','2020-06-18 18:18:55'),('0dd49ff4afa94c1ec0e4d09e5447fc734af9c8fb38e17254f8baf51ec553221c83e8f1aeda5581e8',1,1,'Personal Access Token','[]',0,'2019-06-18 23:23:06','2019-06-18 23:23:06','2020-06-18 18:23:06'),('202aa8c486648e897c27fe36d8d99743ed27e201494450032c78f566ce00684b94cb63d250cf4c30',1,1,'Personal Access Token','[]',0,'2019-06-18 23:24:47','2019-06-18 23:24:47','2020-06-18 18:24:47'),('6f4263f116f0e30a3d1c743f853868ac642ec13a3b6c21abec1da506fe5771f1d62278a2decb6eb9',1,1,'Personal Access Token','[]',0,'2019-06-18 23:25:34','2019-06-18 23:25:34','2020-06-18 18:25:34'),('6cf56e147f45a140f43dbc948bd9af5220721b9b9e0f2f564877cd7fa82a070346d711ebbc7d534f',1,1,'Personal Access Token','[]',0,'2019-06-18 23:26:36','2019-06-18 23:26:36','2020-06-18 18:26:36'),('9f61c4558a7d293cd96c3b616a90aae9170152e1964ca1e8d05d2a91cbb43c6abfe3e920325a5438',1,1,'Personal Access Token','[]',0,'2019-06-18 23:28:20','2019-06-18 23:28:20','2020-06-18 18:28:20'),('04c72e2510aa40aac750c76b291dc89936517bfff6b1a8bf87ee22f8c829c8fae2f7f40bb46e0de7',1,1,'Personal Access Token','[]',0,'2019-06-18 23:29:40','2019-06-18 23:29:40','2020-06-18 18:29:40'),('d03eb1c62b477dec9ee09eb4c432f8cf500c09a066b3bb9de0b2482865a59d3d381cd94ca6b905ec',1,1,'Personal Access Token','[]',0,'2019-06-18 23:35:28','2019-06-18 23:35:28','2020-06-18 18:35:28'),('c1ed1244c121efe6991ad09225ddca39a54770bef148b04e46eb24424eb4a7e520d3505d3ee311f2',1,1,'Personal Access Token','[]',0,'2019-06-18 23:43:20','2019-06-18 23:43:20','2020-06-18 18:43:20'),('03962b6dd171b278765d67ed02679b9b4fd627231d3e0ef0048b186a067dfa206e17d7f5320eb7cc',1,1,'Personal Access Token','[]',0,'2019-06-18 23:55:24','2019-06-18 23:55:24','2020-06-18 18:55:24'),('864c5ec6dd352eab8f4a299708dc41867bffda0c2ada49c498e4196e30861a03573643c5173eaaee',1,1,'Personal Access Token','[]',0,'2019-06-18 23:55:43','2019-06-18 23:55:43','2020-06-18 18:55:43'),('f373a9fe684e94af1bacc84780c93faf2a3489a2109a24325801872fe3c0b3dc42579ae61c0d771d',1,1,'Personal Access Token','[]',0,'2019-06-18 23:56:39','2019-06-18 23:56:39','2020-06-18 18:56:39'),('de6c5471a7c3e0b42b691b026233952a22ef112a25fec5de18129c89b90d7d356b19641187c44a82',1,1,'Personal Access Token','[]',0,'2019-06-19 00:05:59','2019-06-19 00:05:59','2020-06-18 19:05:59'),('cfbda809ad894f5b9e56e142bb097206f01fd4d5ffca6058e82168acc187086d46990b86e942306a',1,1,'Personal Access Token','[]',0,'2019-06-19 00:09:05','2019-06-19 00:09:05','2020-06-18 19:09:05'),('50ac5fced60edf681c9da9763045e0ae49bb9809903e40696dbfc48dc3829b68fbfe52d5e8e591c6',1,1,'Personal Access Token','[]',0,'2019-06-19 00:12:35','2019-06-19 00:12:35','2020-06-18 19:12:35'),('fff92480de95af52ab19690953ce64bafbb40414ed43602b9c204cf7d00e03ca3ff33c6ab2b5be44',1,1,'Personal Access Token','[]',0,'2019-06-26 22:27:59','2019-06-26 22:27:59','2020-06-26 17:27:59'),('47b1668c99923b5004340f9e7fde97ed191d0f3cd39202bb0c464da16956202803f82530d651b7a4',1,1,'Personal Access Token','[]',0,'2019-06-28 18:23:14','2019-06-28 18:23:14','2020-06-28 13:23:14'),('ec1d72e9a190ee7ba4c173fc5e626fdbffcb24eafc2a074e298b237c72dc4fc8348cc2f9161200b9',1,1,'Personal Access Token','[]',0,'2019-06-28 18:23:44','2019-06-28 18:23:44','2020-06-28 13:23:44'),('0a2f9efff1b13dd7e3871e70f2ec6197c35fc7392596e5a637578c10c60309e911896da503da58bc',1,1,'Personal Access Token','[]',0,'2019-06-28 18:24:31','2019-06-28 18:24:31','2020-06-28 13:24:31'),('4f2fafb30939fb2383bd06729e72500c9b250b1b3bce777c55952ce1a1af3e8e33a2a859351310cf',1,1,'Personal Access Token','[]',0,'2019-06-28 18:27:10','2019-06-28 18:27:10','2020-06-28 13:27:10'),('0e2cdfb3b4ab15f19f3d21d2a43858a331c96427a8a96a749967084752bae8eec569bba9119f9c7f',1,1,'Personal Access Token','[]',0,'2019-06-28 18:28:57','2019-06-28 18:28:57','2020-06-28 13:28:57'),('af0c72d25930fe02a1da8223ecfcc993bb2d12f3164fe7a3263cc6d64036dd99bf5adf762442b942',1,1,'Personal Access Token','[]',0,'2019-06-28 18:58:23','2019-06-28 18:58:23','2020-06-28 13:58:23'),('6bbb1610881d2853f2420886fc259eab93d62a48e2c5bea762ad39fd48039b716d45c76cce3c6bbc',1,1,'Personal Access Token','[]',0,'2019-06-29 00:18:50','2019-06-29 00:18:50','2020-06-28 19:18:50'),('f8cc0d81b5dbb05eca4484e13fafc6aaed733d1553c091cc180b307c838220916f2d7621e263e6ee',1,1,'Personal Access Token','[]',0,'2019-07-03 18:06:14','2019-07-03 18:06:14','2020-07-03 13:06:14'),('6f3595ec9e2d0a500ba7398fdf03d42d0fabff279e0c4d7f185dac1d531cc833a676c9905f8bd08d',1,1,'Personal Access Token','[]',0,'2019-07-03 19:00:48','2019-07-03 19:00:48','2020-07-03 14:00:48'),('372746456d0a0a09dd540597da987af6505fafc8ea43b443ea114208d23d79ab01db97756765f5c6',1,1,'Personal Access Token','[]',0,'2019-07-04 22:15:21','2019-07-04 22:15:21','2020-07-04 17:15:21'),('4cbe3e75a8acbe857b55326f59ce8c5cead18d2c24e76a58ba89b7ced788c1d8317b84d433ccab85',1,1,'Personal Access Token','[]',0,'2019-07-04 22:15:56','2019-07-04 22:15:56','2020-07-04 17:15:56'),('d5b77dc1f27240e3b3c412a26cabcbfe2149435cb73b713efd6c5635f476799fd52e209e8d539d3d',1,1,'Personal Access Token','[]',0,'2019-07-04 23:23:22','2019-07-04 23:23:22','2020-07-04 18:23:22'),('bd5512f0acf42c9b3757379ec1ebe660bc475c540f84faeb823256c5620ec7fdc3dea3cc45b12630',1,1,'Personal Access Token','[]',0,'2019-07-05 17:59:44','2019-07-05 17:59:44','2020-07-05 12:59:44');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','mEXm28Fp7ejkkESrdRn9zCaN5VRDLj8QQziLRzDC','http://localhost',1,0,0,'2019-05-29 23:31:22','2019-05-29 23:31:22'),(2,NULL,'Laravel Password Grant Client','3tOnLRPJhd7O3opP4s048P22VMRSza9wYO1wapTR','http://localhost',0,1,0,'2019-05-29 23:31:22','2019-05-29 23:31:22');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-05-29 23:31:22','2019-05-29 23:31:22');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_types`
--

DROP TABLE IF EXISTS `parent_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_types`
--

LOCK TABLES `parent_types` WRITE;
/*!40000 ALTER TABLE `parent_types` DISABLE KEYS */;
INSERT INTO `parent_types` VALUES (1,'Padre','2019-07-12 12:00:00',NULL),(2,'Madre','2019-07-12 12:00:00',NULL),(3,'Tutor','2019-07-12 12:00:00',NULL);
/*!40000 ALTER TABLE `parent_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents_students`
--

DROP TABLE IF EXISTS `parents_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `parent_type_id` int(11) unsigned NOT NULL,
  `phone` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_parents_students_parent_type_idx` (`parent_type_id`),
  KEY `fk_parents_students_student_id_idx` (`student_id`),
  CONSTRAINT `fk_parents_students_parent_type` FOREIGN KEY (`parent_type_id`) REFERENCES `parent_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parents_students_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents_students`
--

LOCK TABLES `parents_students` WRITE;
/*!40000 ALTER TABLE `parents_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `parents_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_groups`
--

DROP TABLE IF EXISTS `school_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `grade_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_grade_id_idx` (`grade_id`),
  CONSTRAINT `fk_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_groups`
--

LOCK TABLES `school_groups` WRITE;
/*!40000 ALTER TABLE `school_groups` DISABLE KEYS */;
INSERT INTO `school_groups` VALUES (1,'Grupo AA','N/A',2,NULL,'2019-07-11 14:28:23',NULL),(2,'Grupo A','-',3,'2019-07-11 14:20:49','2019-07-11 14:20:49',NULL),(3,'Grupo B',NULL,3,'2019-07-11 14:21:26','2019-07-11 14:21:26',NULL);
/*!40000 ALTER TABLE `school_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enrollment` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `grade_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'123456-A','Estudiante 1',1,'2019-07-12 13:09:59','2019-07-12 13:09:59',NULL),(2,'123456-AS','Estudiante 2',1,'2019-07-12 13:15:01','2019-07-12 13:15:01',NULL),(3,'123456-AS','Estudiante 3',1,'2019-07-12 13:27:42','2019-07-12 13:27:42',NULL),(4,'123456-ASA','Estudiante 4',1,'2019-07-12 13:28:13','2019-07-12 13:28:13',NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `campus_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_group_id_idx` (`group_id`),
  KEY `fk_campus_id_idx` (`campus_id`),
  CONSTRAINT `fk_campus_id` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Samuel Regino Placido','samuel43_7@hotmail.com','$2y$10$0Au256pSaAs1mdFqiefRCeyBD4uKqldyRFfsbOHOElfptDYky0JUK',NULL,1,'avatar.png',1,3,'2019-05-29 22:04:02','2019-05-29 22:04:02',NULL);
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

-- Dump completed on 2019-07-12 17:50:51
