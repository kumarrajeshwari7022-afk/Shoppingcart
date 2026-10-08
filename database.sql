-- MySQL dump 10.13  Distrib 8.4.11, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order'),(37,'Can add order item',10,'add_orderitem'),(38,'Can change order item',10,'change_orderitem'),(39,'Can delete order item',10,'delete_orderitem'),(40,'Can view order item',10,'view_orderitem'),(41,'Can add wishlist',11,'add_wishlist'),(42,'Can change wishlist',11,'change_wishlist'),(43,'Can delete wishlist',11,'delete_wishlist'),(44,'Can view wishlist',11,'view_wishlist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$X8cMiFe46AeG5gfh0rUYfz$YeGpxzWUUoPYLZUyxXrHd5dcJF2pJBVNw7Bp93dKd/w=','2026-09-29 18:49:42.972845',1,'subha','','','subha@gmail.com',1,1,'2026-09-26 21:17:55.211572'),(2,'pbkdf2_sha256$600000$ufG8JHisAp3qdcJ1lDHIn1$EKwHtCXhNV/XHipTck32NpuwjXTAfia3mHiGQbzkUqQ=',NULL,1,'ramya','','','ramya@gmail.com',1,1,'2026-09-26 21:29:16.019551'),(3,'pbkdf2_sha256$600000$uxctAxJN3wQBLUNW9Wt1dk$lz6awKm2Vl/sPlAte5C6memBn4J4ALMsMLCrKXTGCeY=',NULL,0,'Subhashree','','','kumarrajeshwari7022@gmail.com',0,1,'2026-09-29 17:42:23.770705'),(4,'pbkdf2_sha256$600000$g65JIvvlDafMLdZOP9mIaJ$Py7O7s+hNGcLx+fJZazMrb38ahvsDixq3dk3tHBUxXM=',NULL,0,'Rmaya','','','kumarrajeshwari7022@gmail.com',0,1,'2026-09-29 17:43:10.122530'),(5,'pbkdf2_sha256$600000$M5PTw1DksMv4k0s6BBSHc8$C+5m6ujizpFz/Jzl4aRgmJRWyteloHXnpNOBoS8feQw=','2026-09-29 18:22:42.310761',0,'Rajeshwari','','','raje@gmail.com',0,1,'2026-09-29 17:46:07.652716'),(6,'pbkdf2_sha256$600000$OPbqELVPvmvJ1AohBxQdth$tH+idbfpvsjF70m85Yv97NekJgWgEPiMjFlx69pXzv0=','2026-10-05 12:46:22.328104',0,'kumar','','','kumar@gmail.com',0,1,'2026-10-05 12:46:16.645079');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-09-26 21:38:51.827943','1','Electronics',1,'[{\"added\": {}}]',7,1),(2,'2026-09-26 21:39:20.982671','2','Clothing',1,'[{\"added\": {}}]',7,1),(3,'2026-09-26 21:39:53.371706','3','Books',1,'[{\"added\": {}}]',7,1),(4,'2026-09-26 21:40:25.923741','4','Home & Kitchen',1,'[{\"added\": {}}]',7,1),(5,'2026-09-26 21:43:46.552623','1','Wireless Headphones',1,'[{\"added\": {}}]',8,1),(6,'2026-09-26 21:48:50.482041','2','Smartphone',1,'[{\"added\": {}}]',8,1),(7,'2026-09-26 21:50:11.804340','3','Laptop',1,'[{\"added\": {}}]',8,1),(8,'2026-09-26 22:00:31.222446','4','Bluetooth Speaker',1,'[{\"added\": {}}]',8,1),(9,'2026-09-27 16:56:43.742613','5','Wireless Mouse',1,'[{\"added\": {}}]',8,1),(10,'2026-09-27 16:58:03.936247','6','Mechanical Keyboard',1,'[{\"added\": {}}]',8,1),(11,'2026-09-27 16:59:25.868768','7','Smart Watch',1,'[{\"added\": {}}]',8,1),(12,'2026-09-27 17:00:47.339466','8','USB-C Charger',1,'[{\"added\": {}}]',8,1),(13,'2026-09-27 17:01:45.436459','9','Power Bank',1,'[{\"added\": {}}]',8,1),(14,'2026-09-27 17:02:37.154306','10','Webcam',1,'[{\"added\": {}}]',8,1),(15,'2026-09-27 17:08:43.078106','11','Cotton T-Shirt',1,'[{\"added\": {}}]',8,1),(16,'2026-09-27 17:11:49.944062','12','Denim Jeans',1,'[{\"added\": {}}]',8,1),(17,'2026-09-27 17:13:01.000918','13','Hoodie',1,'[{\"added\": {}}]',8,1),(18,'2026-09-27 17:13:58.232478','14','Formal Shirt',1,'[{\"added\": {}}]',8,1),(19,'2026-09-27 17:15:09.273995','15','Casual Jacket',1,'[{\"added\": {}}]',8,1),(20,'2026-09-27 17:16:06.210890','16','Sports T-Shirt',1,'[{\"added\": {}}]',8,1),(21,'2026-09-27 17:16:54.095683','17','Track Pants',1,'[{\"added\": {}}]',8,1),(22,'2026-09-27 17:18:06.695482','18','Kurti',1,'[{\"added\": {}}]',8,1),(23,'2026-09-27 17:18:56.518063','19','Python Programming Book',1,'[{\"added\": {}}]',8,1),(24,'2026-09-27 17:20:05.111099','20','Machine Learning Basics',1,'[{\"added\": {}}]',8,1),(25,'2026-09-27 17:20:56.309736','21','Deep Learning with Python',1,'[{\"added\": {}}]',8,1),(26,'2026-09-27 17:21:58.722674','22','Data Structures and Algorithms',1,'[{\"added\": {}}]',8,1),(27,'2026-09-27 17:23:00.768184','23','Web Development Guide',1,'[{\"added\": {}}]',8,1),(28,'2026-09-27 17:24:38.783997','24','Artificial Intelligence Fundamentals',1,'[{\"added\": {}}]',8,1),(29,'2026-09-27 17:25:35.456884','25','Django for Beginners',1,'[{\"added\": {}}]',8,1),(30,'2026-09-27 17:40:07.688858','26','Electric Kettle',1,'[{\"added\": {}}]',8,1),(31,'2026-09-27 17:41:19.218110','27','Mixer Grinder',1,'[{\"added\": {}}]',8,1),(32,'2026-09-27 17:51:23.117920','28','Water Bottle',1,'[{\"added\": {}}]',8,1),(33,'2026-09-27 17:52:22.303768','29','Coffee Mug',1,'[{\"added\": {}}]',8,1),(34,'2026-09-27 17:55:15.983595','30','Lunch Box',1,'[{\"added\": {}}]',8,1),(35,'2026-09-27 17:56:15.387129','31','Table Lamp',1,'[{\"added\": {}}]',8,1),(36,'2026-09-27 17:57:23.788815','32','Non-Stick Frying Pan',1,'[{\"added\": {}}]',8,1),(37,'2026-09-27 17:58:57.007084','33','Storage Container Set',1,'[{\"added\": {}}]',8,1),(38,'2026-10-05 12:34:38.236438','4','Order #4 - subha',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(39,'2026-10-05 12:34:38.245464','3','Order #3 - subha',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(40,'2026-10-05 12:34:38.250532','2','Order #2 - subha',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(41,'2026-10-05 12:34:38.255464','1','Order #1 - Rajeshwari',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'shop','category'),(9,'shop','order'),(10,'shop','orderitem'),(8,'shop','product'),(11,'shop','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-26 21:05:03.177828'),(2,'auth','0001_initial','2026-09-26 21:05:03.802674'),(3,'admin','0001_initial','2026-09-26 21:05:03.951473'),(4,'admin','0002_logentry_remove_auto_add','2026-09-26 21:05:03.961216'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-26 21:05:03.970093'),(6,'contenttypes','0002_remove_content_type_name','2026-09-26 21:05:04.107570'),(7,'auth','0002_alter_permission_name_max_length','2026-09-26 21:05:04.170223'),(8,'auth','0003_alter_user_email_max_length','2026-09-26 21:05:04.198841'),(9,'auth','0004_alter_user_username_opts','2026-09-26 21:05:04.208989'),(10,'auth','0005_alter_user_last_login_null','2026-09-26 21:05:04.274497'),(11,'auth','0006_require_contenttypes_0002','2026-09-26 21:05:04.281501'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-26 21:05:04.293257'),(13,'auth','0008_alter_user_username_max_length','2026-09-26 21:05:04.359502'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-26 21:05:04.429895'),(15,'auth','0010_alter_group_name_max_length','2026-09-26 21:05:04.452928'),(16,'auth','0011_update_proxy_permissions','2026-09-26 21:05:04.468080'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-26 21:05:04.532397'),(18,'sessions','0001_initial','2026-09-26 21:05:04.572221'),(19,'shop','0001_initial','2026-09-26 21:13:29.833122'),(20,'shop','0002_order_orderitem','2026-09-29 17:51:22.032614'),(21,'shop','0003_wishlist','2026-09-29 18:52:50.395925'),(22,'shop','0004_order_payment_status_order_razorpay_order_id_and_more','2026-09-30 10:17:12.679122');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wsn2glvfxxoxpkey8gg8trcyredrvsdv','.eJxVjDsOg0AMBe_iOlqt2cU2lOlzBuT9EEgikPhUiLsHJIqkfTNvNmh0XbpmnfPU9AlqILj9bkHjOw8nSC8dnqOJ47BMfTCnYi46m8eY8ud-uX-BTufueBeUsWUukqiyo2QrIZUqC9lWSi5c4NY5KpGz9Yg-ow3ReVFhK-T0iEadFqg3QIYa9_0LTbs6-Q:1xEpOX:OjlwF9dQqU6e8wyepWBeKpTizCmo-fC-LoP0YdUlZ0E','2026-10-22 14:46:53.528334');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'Electronics','Electronic devices and accessories'),(2,'Clothing','Fashion and clothing products'),(3,'Books','Books and educational materials'),(4,'Home & Kitchen','Home & Kitchen');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `payment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razorpay_order_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_payment_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_user_id_00aba627_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_order_user_id_00aba627_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,'Rajeshwari','raje@gmail.com','1234567890','h d kote','Mysore','karnataka','571114',17497.00,'Confirmed','2026-09-29 18:44:17.315218',5,'Pending',NULL,NULL),(2,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','571114',1498.00,'Confirmed','2026-10-01 18:29:54.209428',1,'Pending',NULL,NULL),(3,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','571114',2197.00,'Confirmed','2026-10-01 18:35:09.360424',1,'Pending',NULL,NULL),(4,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','131456',2197.00,'Confirmed','2026-10-01 18:35:25.354011',1,'Pending',NULL,NULL),(5,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','131456',2197.00,'Pending','2026-10-01 19:05:34.273606',1,'Pending',NULL,NULL),(6,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','571114',2197.00,'Pending','2026-10-01 19:05:42.889944',1,'Pending',NULL,NULL),(7,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','123456',3695.00,'Pending','2026-10-01 19:15:27.125722',1,'Pending',NULL,NULL),(8,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','571114',2996.00,'Pending','2026-10-01 19:17:53.970041',1,'Pending',NULL,NULL),(9,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','571114',2996.00,'Pending','2026-10-05 10:52:28.589842',1,'Pending',NULL,NULL),(10,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','123456',4494.00,'Pending','2026-10-05 10:53:49.393381',1,'Pending',NULL,NULL),(11,'Rajeshwari','kumarrajeshwari7022@gmail.com','1234567890','h d kote','Mysore','karnataka','123456',4494.00,'Pending','2026-10-05 11:02:19.745271',1,'Pending',NULL,NULL),(12,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','571114',4494.00,'Pending','2026-10-05 11:03:34.579577',1,'Pending',NULL,NULL),(13,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','571114',4494.00,'Pending','2026-10-05 11:06:23.794835',1,'Pending',NULL,NULL),(14,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','571114',4494.00,'Pending','2026-10-05 11:34:10.170968',1,'Pending',NULL,NULL),(15,'Rajeshwari','kumarrajeshwari7022@gmail.com','01234567890','h d kote','Mysore','karnataka','571114',4494.00,'Confirmed','2026-10-05 12:21:29.907533',1,'Paid','order_TkE0KW4Ctq1Is4','pay_TkE7D7P8c2T4dB'),(16,'dhanyashree ','dhanya@gmail.com','1234567890','shravanabelagola\r\n\r\n\r\n','hassan','karnataka','573135',1299.00,'Pending','2026-10-08 13:40:50.007649',6,'Pending','order_TlQxLZW72CaxuK',NULL),(17,'dhanyashree ','dhanya@gmail.com','1234567890','shravanabelagola\r\n\r\n\r\n','hassan','karnataka','573135',1299.00,'Confirmed','2026-10-08 13:40:52.528178',6,'Paid','order_TlQxNawWkS7DiA','pay_TlR1PTc6xUiHF4'),(18,'Rajeshwari','raje@gmail.com','1234567890','h d kote','Mysore','karnataka','571114',15999.00,'Confirmed','2026-10-08 14:43:39.346214',6,'Paid','order_TlS1ogUkqscrVu','pay_TlS32uj4s3FE8b');
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderitem`
--

DROP TABLE IF EXISTS `shop_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderitem_order_id_2f1b00cf_fk_shop_order_id` (`order_id`),
  KEY `shop_orderitem_product_id_48153f22_fk_shop_product_id` (`product_id`),
  CONSTRAINT `shop_orderitem_order_id_2f1b00cf_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `shop_orderitem_product_id_48153f22_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderitem`
--

LOCK TABLES `shop_orderitem` WRITE;
/*!40000 ALTER TABLE `shop_orderitem` DISABLE KEYS */;
INSERT INTO `shop_orderitem` VALUES (1,1,1498.00,1,1),(2,1,15999.00,1,2),(3,1,1498.00,2,1),(4,1,1498.00,3,1),(5,1,699.00,3,5),(6,1,1498.00,4,1),(7,1,699.00,4,5),(8,1,1498.00,5,1),(9,1,699.00,5,5),(10,1,1498.00,6,1),(11,1,699.00,6,5),(12,2,1498.00,7,1),(13,1,699.00,7,5),(14,2,1498.00,8,1),(15,2,1498.00,9,1),(16,3,1498.00,10,1),(17,3,1498.00,11,1),(18,3,1498.00,12,1),(19,3,1498.00,13,1),(20,3,1498.00,14,1),(21,3,1498.00,15,1),(22,1,1299.00,16,26),(23,1,1299.00,17,26),(24,1,15999.00,18,2);
/*!40000 ALTER TABLE `shop_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_product_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Wireless Headphones','High-quality wireless headphones with clear sound and comfortable design.',1498.00,21,'products/wireless_headphones.jpg',1,'2026-09-26 21:43:46.550520','2026-10-05 12:28:43.684762',1),(2,'Smartphone','Modern smartphone with a vibrant display, powerful processor, high-quality camera, and reliable battery performance.',15999.00,13,'products/smartphone.jpg',1,'2026-09-26 21:48:50.479928','2026-10-08 14:45:40.393378',1),(3,'Laptop','Powerful laptop suitable for programming, office work, online learning, entertainment, and everyday computing.',55999.00,14,'products/laptop.jpg',1,'2026-09-26 21:50:11.801345','2026-09-26 21:50:11.801345',1),(4,'Bluetooth Speaker','Portable Bluetooth speaker with clear audio, strong bass, and a compact design for indoor and outdoor use.',1999.00,10,'products/bluetooth_speaker.jpg',1,'2026-09-26 22:00:31.220545','2026-09-26 22:00:31.220545',1),(5,'Wireless Mouse','Ergonomic wireless mouse with responsive tracking and comfortable grip for work, study, and everyday use.',699.00,35,'products/wireless_mouse.jpg',1,'2026-09-27 16:56:43.740711','2026-09-27 16:56:43.740711',1),(6,'Mechanical Keyboard','Durable mechanical keyboard with responsive keys, comfortable typing, and a stylish design for programmers and gamers.',2499.00,18,'products/mechanical_keyboard.jpg',1,'2026-09-27 16:58:03.932091','2026-09-27 16:58:03.933094',1),(7,'Smart Watch','Smart watch with activity tracking, notifications, heart-rate monitoring, and a stylish digital display.',2999.00,20,'products/smart_watch.jpg',1,'2026-09-27 16:59:25.866736','2026-09-27 16:59:25.866736',1),(8,'USB-C Charger','Compact USB-C charger designed for fast and reliable charging of compatible smartphones, tablets, and other devices.',899.00,30,'products/usb_c_charger.jpg',1,'2026-09-27 17:00:47.336445','2026-09-27 17:00:47.336445',1),(9,'Power Bank','Portable power bank with high battery capacity for conveniently charging smartphones and other USB-powered devices.',1299.00,25,'products/power_bank.jpg',1,'2026-09-27 17:01:45.433357','2026-09-27 17:01:45.433357',1),(10,'Webcam','Full HD webcam suitable for online classes, video meetings, interviews, and virtual presentations.',1799.00,15,'products/webcam.jpg',1,'2026-09-27 17:02:37.151303','2026-09-27 17:02:37.151303',1),(11,'Cotton T-Shirt','Comfortable cotton T-shirt made with soft and breathable fabric for everyday casual wear.',599.00,30,'products/cotton_tshirt.jpg',1,'2026-09-27 17:08:43.073114','2026-09-27 17:08:43.073114',2),(12,'Denim Jeans','Classic denim jeans with a comfortable fit and durable fabric suitable for everyday wear.',1299.00,20,'products/denim_jeans.jpg',1,'2026-09-27 17:11:49.940968','2026-09-27 17:11:49.940968',2),(13,'Hoodie','Comfortable casual hoodie made from soft fabric, suitable for cool weather and everyday styling.',1199.00,18,'products/hoodie.jpg',1,'2026-09-27 17:13:00.997419','2026-09-27 17:13:00.997419',2),(14,'Formal Shirt','Smart formal shirt with a clean design, suitable for college presentations, interviews, office wear, and formal occasions.',999.00,15,'products/formal_shirt.jpg',1,'2026-09-27 17:13:58.231477','2026-09-27 17:13:58.231477',2),(15,'Casual Jacket','Stylish lightweight jacket designed for casual outings and comfortable everyday wear.',1899.00,12,'products/casual_jacket.jpg',1,'2026-09-27 17:15:09.272374','2026-09-27 17:15:09.272374',2),(16,'Sports T-Shirt','Lightweight and breathable sports T-shirt designed for workouts, running, and other physical activities.',799.00,25,'products/sports_t_shirt.jpg',1,'2026-09-27 17:16:06.207861','2026-09-27 17:16:06.207861',2),(17,'Track Pants','Comfortable track pants made from soft fabric, suitable for workouts, travel, and casual activities.',899.00,20,'products/track_pants.jpg',1,'2026-09-27 17:16:54.093678','2026-09-27 17:16:54.093678',2),(18,'Kurti','Comfortable and elegant kurti with a simple design suitable for casual and semi-formal occasions.',1099.00,15,'products/kurti.jpg',1,'2026-09-27 17:18:06.694441','2026-09-27 17:18:06.694441',2),(19,'Python Programming Book','Beginner-friendly Python programming book covering programming fundamentals, functions, data structures, and practical examples.',799.00,20,'products/python_programming_book.jpg',1,'2026-09-27 17:18:56.516088','2026-09-27 17:18:56.516088',3),(20,'Machine Learning Basics','Introduction to machine learning concepts, algorithms, data preprocessing, model evaluation, and practical applications.',899.00,15,'products/machine_learning_basics.jpg',1,'2026-09-27 17:20:05.108100','2026-09-27 17:20:05.108100',3),(21,'Deep Learning with Python','Practical introduction to neural networks and deep learning using Python with examples and real-world applications.',1199.00,10,'products/deep_learning_with_python.jpg',1,'2026-09-27 17:20:56.307734','2026-09-27 17:20:56.307734',3),(22,'Data Structures and Algorithms','Comprehensive guide to common data structures and algorithms with simple explanations and programming examples.',699.00,25,'products/data_structures_algorithms.jpg',1,'2026-09-27 17:21:58.719673','2026-09-27 17:21:58.719673',3),(23,'Web Development Guide','Beginner-friendly guide covering HTML, CSS, JavaScript, responsive design, and basic web development concepts.',749.00,18,'products/web_development_guide.jpg',1,'2026-09-27 17:23:00.766295','2026-09-27 17:23:00.766295',3),(24,'Artificial Intelligence Fundamentals','Introduction to artificial intelligence concepts, problem solving, machine learning, and real-world AI applications.',999.00,12,'products/artificial_intelligence_fundamentals.jpg',1,'2026-09-27 17:24:38.782059','2026-09-27 17:24:38.783001',3),(25,'Django for Beginners','Practical guide to building web applications with Django, including models, views, templates, forms, and databases.',849.00,15,'products/django_for_beginners.jpg',1,'2026-09-27 17:25:35.453964','2026-09-27 17:25:35.453964',3),(26,'Electric Kettle','Compact electric kettle for quickly boiling water, preparing beverages, and everyday kitchen use.',1299.00,11,'products/electric_kettle.jpg',1,'2026-09-27 17:40:07.686858','2026-10-08 13:45:16.473037',4),(27,'Mixer Grinder','Powerful mixer grinder suitable for grinding spices, preparing smoothies, and everyday kitchen preparation.',2999.00,10,'products/mixer_grinder.jpg',1,'2026-09-27 17:41:19.214109','2026-09-27 17:41:19.215109',4),(28,'Water Bottle','Durable reusable water bottle with a leak-resistant design, suitable for college, office, travel, and daily use.',499.00,40,'products/water_bottle.jpg',1,'2026-09-27 17:51:23.117920','2026-09-27 17:51:23.117920',4),(29,'Coffee Mug','Simple ceramic coffee mug suitable for serving tea, coffee, and other hot beverages.',299.00,50,'products/coffee_mug.jpg',1,'2026-09-27 17:52:22.300769','2026-09-27 17:52:22.300769',4),(30,'Lunch Box','Compact lunch box with multiple compartments for conveniently carrying different types of food.',599.00,30,'products/lunch_box.jpg',1,'2026-09-27 17:55:15.980270','2026-09-27 17:55:15.980270',4),(31,'Table Lamp','Adjustable table lamp providing comfortable lighting for studying, reading, and working.',899.00,18,'products/table_lamp.jpg',1,'2026-09-27 17:56:15.382341','2026-09-27 17:56:15.382341',4),(32,'Non-Stick Frying Pan','Durable non-stick frying pan designed for convenient cooking with easy cleaning and maintenance.',1099.00,15,'products/non_stick_frying_pan.jpg',1,'2026-09-27 17:57:23.785691','2026-09-27 17:57:23.785691',4),(33,'Storage Container Set','Set of reusable storage containers designed to keep food organized and fresh in the kitchen.',799.00,25,'products/storage_container_set.jpg',1,'2026-09-27 17:58:57.004084','2026-09-27 17:58:57.004084',4);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_wishlist`
--

DROP TABLE IF EXISTS `shop_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_wishlist_user_id_product_id_cc6abffc_uniq` (`user_id`,`product_id`),
  KEY `shop_wishlist_product_id_0fc70568_fk_shop_product_id` (`product_id`),
  CONSTRAINT `shop_wishlist_product_id_0fc70568_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_wishlist_user_id_131c4a81_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_wishlist`
--

LOCK TABLES `shop_wishlist` WRITE;
/*!40000 ALTER TABLE `shop_wishlist` DISABLE KEYS */;
INSERT INTO `shop_wishlist` VALUES (4,'2026-10-08 14:46:31.545699',1,6),(5,'2026-10-08 14:46:37.653688',5,6),(6,'2026-10-08 14:47:05.396259',15,6),(7,'2026-10-08 14:47:14.431969',33,6);
/*!40000 ALTER TABLE `shop_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-08 21:54:29
