-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ihnatieva
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abonent_booksdelivery`
--

DROP TABLE IF EXISTS `abonent_booksdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonent_booksdelivery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_return` date DEFAULT NULL,
  `copies_inventory_num_id` int NOT NULL,
  `readers_read_ticket_num_id` int NOT NULL,
  `date_must_return` date DEFAULT NULL,
  `date_issue` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_delivery_readers_read_ticket_num__a6570d86_uniq` (`readers_read_ticket_num_id`,`copies_inventory_num_id`,`date_issue`),
  KEY `books_delivery_copies_inventory_num_e4a25565_fk_copies_in` (`copies_inventory_num_id`),
  KEY `books_delivery_readers_read_ticket_num_id_fcd49f6b` (`readers_read_ticket_num_id`),
  CONSTRAINT `books_delivery_copies_inventory_num_e4a25565_fk_copies_in` FOREIGN KEY (`copies_inventory_num_id`) REFERENCES `copies` (`inventory_num`),
  CONSTRAINT `books_delivery_readers_read_ticket_num_id_fcd49f6b_fk` FOREIGN KEY (`readers_read_ticket_num_id`) REFERENCES `readers` (`read_ticket_num`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonent_booksdelivery`
--

LOCK TABLES `abonent_booksdelivery` WRITE;
/*!40000 ALTER TABLE `abonent_booksdelivery` DISABLE KEYS */;
INSERT INTO `abonent_booksdelivery` VALUES (56,NULL,7,23459,'2023-04-30','2023-04-16'),(58,NULL,1,23456,'2023-04-30','2023-04-16'),(59,NULL,6,12345,'2023-04-30','2023-04-16'),(60,NULL,7,23464,'2023-04-30','2023-04-16'),(62,NULL,2,23463,'2023-05-01','2023-04-17'),(70,NULL,6,23459,'2023-05-05','2023-04-21'),(72,NULL,8,23469,'2023-05-12','2023-04-28');
/*!40000 ALTER TABLE `abonent_booksdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Publisher',7,'add_publisher'),(26,'Can change Publisher',7,'change_publisher'),(27,'Can delete Publisher',7,'delete_publisher'),(28,'Can view Publisher',7,'view_publisher'),(29,'Can add Books',8,'add_book'),(30,'Can change Books',8,'change_book'),(31,'Can delete Books',8,'delete_book'),(32,'Can view Books',8,'view_book'),(33,'Can add Author',9,'add_author'),(34,'Can change Author',9,'change_author'),(35,'Can delete Author',9,'delete_author'),(36,'Can view Author',9,'view_author'),(37,'Can add Copies',10,'add_copies'),(38,'Can change Copies',10,'change_copies'),(39,'Can delete Copies',10,'delete_copies'),(40,'Can view Copies',10,'view_copies'),(41,'Can add KnowledgeField',11,'add_knowledgefield'),(42,'Can change KnowledgeField',11,'change_knowledgefield'),(43,'Can delete KnowledgeField',11,'delete_knowledgefield'),(44,'Can view KnowledgeField',11,'view_knowledgefield'),(45,'Can add BooksAuthor',12,'add_bookauthor'),(46,'Can change BooksAuthor',12,'change_bookauthor'),(47,'Can delete BooksAuthor',12,'delete_bookauthor'),(48,'Can view BooksAuthor',12,'view_bookauthor'),(49,'Can add Reader',13,'add_reader'),(50,'Can change Reader',13,'change_reader'),(51,'Can delete Reader',13,'delete_reader'),(52,'Can view Reader',13,'view_reader'),(53,'Can add BooksDelivery',14,'add_booksdelivery'),(54,'Can change BooksDelivery',14,'change_booksdelivery'),(55,'Can delete BooksDelivery',14,'delete_booksdelivery'),(56,'Can view BooksDelivery',14,'view_booksdelivery'),(57,'Can add KnowledgeFieldHasBook',15,'add_knowledgefieldhasbook'),(58,'Can change KnowledgeFieldHasBook',15,'change_knowledgefieldhasbook'),(59,'Can delete KnowledgeFieldHasBook',15,'delete_knowledgefieldhasbook'),(60,'Can view KnowledgeFieldHasBook',15,'view_knowledgefieldhasbook');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$dUrPXcOhstO0xSQQ9iR7wj$RK6mcgxJFrCYrnOT+chfDXuTs3lvFwKzLeM/WMxnxpg=','2023-04-16 15:19:12.063415',1,'admin','','','comfy99225@gmail.com',1,1,'2023-04-01 18:55:58.522566');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `ID_author` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Тарас','Шевченко'),(2,'Даніель','Дефо'),(3,'Джордж','Орвелл'),(5,'Олександр','Палій'),(6,'Джоан','Роулінг');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `public_city` varchar(45) NOT NULL,
  `year` int NOT NULL,
  `page_num` int NOT NULL,
  `copies_num` int NOT NULL,
  `publisher_ID_publisher_id` int NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `book_publisher_ID_publish_89bb9d14_fk_publisher` (`publisher_ID_publisher_id`),
  CONSTRAINT `book_publisher_ID_publish_89bb9d14_fk_publisher` FOREIGN KEY (`publisher_ID_publisher_id`) REFERENCES `publisher` (`ID_publisher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('978-3-16-148410-0','Кобзар','Київ',2003,273,1,1),('978-5-699-12014-7','Робінзон Крузо','Харків',2018,496,1,2),('978-617-577-367-3','Книга Правила Дорожнього Руху України 2023 р.','Харків',2022,132,1,7),('978-617-585-123-4','Книга Короткий курс історії України','Київ',2021,464,2,5),('978-966-2355-57-4','1984','Харків',2015,312,3,3),('978-966-7047-34-4','Гаррі Поттер і таємна кімната','Львів',2017,352,4,5),('978-966-7047-39-9','Гаррі Поттер і філософський камінь','Львів',2017,320,1,5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` varchar(20) NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_authors_book_id_author_id_96c38d5f_uniq` (`book_id`,`author_id`),
  KEY `book_authors_author_id_ea39dbe4_fk_author_ID_author` (`author_id`),
  CONSTRAINT `book_authors_author_id_ea39dbe4_fk_author_ID_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`ID_author`),
  CONSTRAINT `book_authors_book_id_a678937d_fk_book_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,'978-3-16-148410-0',1),(2,'978-5-699-12014-7',2),(4,'978-617-585-123-4',5),(3,'978-966-2355-57-4',3),(6,'978-966-7047-34-4',6),(5,'978-966-7047-39-9',6);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_author`
--

DROP TABLE IF EXISTS `book_has_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author_ID_author_id` int NOT NULL,
  `book_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_has_author_author_ID_author_id_b677ba8a_fk_author_ID_author` (`author_ID_author_id`),
  KEY `book_has_author_book_id_2b7b8e44_fk_book_ISBN` (`book_id`),
  CONSTRAINT `book_has_author_author_ID_author_id_b677ba8a_fk_author_ID_author` FOREIGN KEY (`author_ID_author_id`) REFERENCES `author` (`ID_author`),
  CONSTRAINT `book_has_author_book_id_2b7b8e44_fk_book_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_author`
--

LOCK TABLES `book_has_author` WRITE;
/*!40000 ALTER TABLE `book_has_author` DISABLE KEYS */;
INSERT INTO `book_has_author` VALUES (1,1,'978-3-16-148410-0'),(2,3,'978-966-2355-57-4'),(3,2,'978-5-699-12014-7'),(4,6,'978-966-7047-39-9'),(5,5,'978-617-585-123-4'),(6,6,'978-966-7047-34-4');
/*!40000 ALTER TABLE `book_has_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_delivery`
--

DROP TABLE IF EXISTS `books_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_delivery` (
  `readers_read_ticket_num` int NOT NULL,
  `copies_inventory_num` int NOT NULL,
  `data_issue` date NOT NULL,
  `date_return` date NOT NULL,
  PRIMARY KEY (`readers_read_ticket_num`,`copies_inventory_num`,`data_issue`),
  KEY `fk_readers_has_copies_copies1_idx` (`copies_inventory_num`),
  KEY `fk_readers_has_copies_readers1_idx` (`readers_read_ticket_num`),
  CONSTRAINT `fk_readers_has_copies_copies1` FOREIGN KEY (`copies_inventory_num`) REFERENCES `copies` (`inventory_num`),
  CONSTRAINT `fk_readers_has_copies_readers1` FOREIGN KEY (`readers_read_ticket_num`) REFERENCES `readers` (`read_ticket_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_delivery`
--

LOCK TABLES `books_delivery` WRITE;
/*!40000 ALTER TABLE `books_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copies`
--

DROP TABLE IF EXISTS `copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copies` (
  `inventory_num` int NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  `place` int NOT NULL,
  `shelf` int NOT NULL,
  `book_ISBN_id` varchar(20) NOT NULL,
  PRIMARY KEY (`inventory_num`),
  KEY `copies_book_ISBN_id_8ed2a070_fk_book_ISBN` (`book_ISBN_id`),
  CONSTRAINT `copies_book_ISBN_id_8ed2a070_fk_book_ISBN` FOREIGN KEY (`book_ISBN_id`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copies`
--

LOCK TABLES `copies` WRITE;
/*!40000 ALTER TABLE `copies` DISABLE KEYS */;
INSERT INTO `copies` VALUES (1,250.00,1,1,'978-3-16-148410-0'),(2,370.00,2,2,'978-5-699-12014-7'),(3,180.00,3,3,'978-966-2355-57-4'),(5,340.00,4,3,'978-617-585-123-4'),(6,320.00,4,3,'978-966-7047-39-9'),(7,320.00,4,7,'978-966-7047-34-4'),(8,240.00,6,2,'978-617-577-367-3');
/*!40000 ALTER TABLE `copies` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-01 19:08:54.280713','1','Тарас Шевченко',3,'',9,1),(2,'2023-04-01 19:35:44.951184','1','Тарас Шевченко',1,'[{\"added\": {}}]',7,1),(3,'2023-04-01 19:35:57.392582','1','Тарас Шевченко',1,'[{\"added\": {}}]',9,1),(4,'2023-04-01 19:36:03.330798','978-3-16-148410-0','Кобзар',1,'[{\"added\": {}}]',8,1),(5,'2023-04-01 19:37:33.481046','1','Ранок',2,'[{\"changed\": {\"fields\": [\"Name publisher\"]}}]',7,1),(6,'2023-04-01 19:37:56.595445','978-3-16-148410-0','Кобзар',2,'[]',8,1),(7,'2023-04-01 19:50:19.554242','1','Copies object (1)',1,'[{\"added\": {}}]',10,1),(8,'2023-04-02 11:25:31.981774','2','Фоліо',1,'[{\"added\": {}}]',7,1),(9,'2023-04-02 11:26:09.489461','2','Даніель Дефо',1,'[{\"added\": {}}]',9,1),(10,'2023-04-02 11:26:12.040902','978-5-699-12014-7','Робінзон Крузо',1,'[{\"added\": {}}]',8,1),(11,'2023-04-02 11:27:12.828633','2','Copies object (2)',1,'[{\"added\": {}}]',10,1),(12,'2023-04-02 12:03:34.875943','3','Знання',1,'[{\"added\": {}}]',7,1),(13,'2023-04-02 12:03:46.675564','3','Джордж Орвелл',1,'[{\"added\": {}}]',9,1),(14,'2023-04-02 12:03:49.763519','978-966-2355-57-4','1984',1,'[{\"added\": {}}]',8,1),(15,'2023-04-02 12:04:06.360771','3','Copies object (3)',1,'[{\"added\": {}}]',10,1),(16,'2023-04-02 12:50:33.581499','1','BookAuthor object (1)',1,'[{\"added\": {}}]',12,1),(17,'2023-04-02 12:50:40.321813','2','BookAuthor object (2)',1,'[{\"added\": {}}]',12,1),(18,'2023-04-02 12:50:45.900768','3','BookAuthor object (3)',1,'[{\"added\": {}}]',12,1),(19,'2023-04-02 12:57:01.576987','12345','Reader object (12345)',1,'[{\"added\": {}}]',13,1),(20,'2023-04-02 13:11:32.462538','23456','Reader object (23456)',1,'[{\"added\": {}}]',13,1),(21,'2023-04-08 19:41:19.970937','5','А-ба-ба-га-ла-ма-га',1,'[{\"added\": {}}]',7,1),(22,'2023-04-08 19:41:42.335660','5','Олександр Палій',1,'[{\"added\": {}}]',9,1),(23,'2023-04-08 19:41:43.878159','978-617-585-123-4','Книга Короткий курс історії України',1,'[{\"added\": {}}]',8,1),(24,'2023-04-08 19:44:02.668115','5','Copies object (5)',1,'[{\"added\": {}}]',10,1),(25,'2023-04-08 19:45:44.680058','1','Copies object (1)',3,'',14,1),(26,'2023-04-08 19:45:51.053614','6','Copies object (2)',3,'',14,1),(27,'2023-04-08 21:27:54.648445','7','1',1,'[{\"added\": {}}]',14,1),(28,'2023-04-08 21:28:27.062897','7','Тарас Шевченко - Кобзар',2,'[]',14,1),(29,'2023-04-08 21:30:48.046577','6','Олександр Палій',1,'[{\"added\": {}}]',9,1),(30,'2023-04-08 21:31:00.334717','5','Олександр Палій',2,'[]',9,1),(31,'2023-04-08 21:31:04.174900','6','Олександр Палій',3,'',9,1),(32,'2023-04-08 21:31:59.177740','7','Тарас Шевченко - Кобзар',3,'',14,1),(33,'2023-04-08 21:34:29.140358','9','Тарас Шевченко - Кобзар',1,'[{\"added\": {}}]',14,1),(34,'2023-04-08 21:56:51.706143','14','Тарас Шевченко - Кобзар',3,'',14,1),(35,'2023-04-08 21:56:51.711293','13','Олександр Палій - Книга Короткий курс історії України',3,'',14,1),(36,'2023-04-08 21:56:51.715348','10','Даніель Дефо - Робінзон Крузо',3,'',14,1),(37,'2023-04-08 21:56:51.719990','9','Тарас Шевченко - Кобзар',3,'',14,1),(38,'2023-04-08 21:59:09.323439','18','Тарас Шевченко - Кобзар',3,'',14,1),(39,'2023-04-08 21:59:09.328574','16','Тарас Шевченко - Кобзар',3,'',14,1),(40,'2023-04-08 22:07:40.128012','23','Тарас Шевченко - Кобзар',3,'',14,1),(41,'2023-04-08 22:07:40.132617','22','Даніель Дефо - Робінзон Крузо',3,'',14,1),(42,'2023-04-08 22:07:40.235362','20','Джордж Орвелл - 1984',3,'',14,1),(43,'2023-04-08 22:14:21.713996','30','Олександр Палій - Книга Короткий курс історії України',3,'',14,1),(44,'2023-04-08 22:14:21.719756','29','Олександр Палій - Книга Короткий курс історії України',3,'',14,1),(45,'2023-04-08 22:14:21.819581','28','Джордж Орвелл - 1984',3,'',14,1),(46,'2023-04-08 22:14:21.822583','26','Даніель Дефо - Робінзон Крузо',3,'',14,1),(47,'2023-04-08 22:14:21.826576','25','Тарас Шевченко - Кобзар',3,'',14,1),(48,'2023-04-09 15:00:24.209341','6','Джоан Роулінг',1,'[{\"added\": {}}]',9,1),(49,'2023-04-09 15:00:28.052992','978-966-7047-39-9','Джоан Роулінг - Гаррі Поттер і філософський камінь',1,'[{\"added\": {}}]',8,1),(50,'2023-04-09 15:00:42.477868','4','Джоан Роулінг - Гаррі Поттер і філософський камінь',1,'[{\"added\": {}}]',12,1),(51,'2023-04-09 15:00:51.858302','5','Олександр Палій - Книга Короткий курс історії України',1,'[{\"added\": {}}]',12,1),(52,'2023-04-09 15:01:15.569566','6','Джоан Роулінг - Гаррі Поттер і філософський камінь',1,'[{\"added\": {}}]',10,1),(53,'2023-04-09 15:02:34.871861','978-966-7047-34-4','Джоан Роулінг - Гаррі Поттер і таємна кімната',1,'[{\"added\": {}}]',8,1),(54,'2023-04-09 15:02:58.263271','6','Джоан Роулінг - Гаррі Поттер і таємна кімната',1,'[{\"added\": {}}]',12,1),(55,'2023-04-09 15:03:19.380830','7','Джоан Роулінг - Гаррі Поттер і таємна кімната',1,'[{\"added\": {}}]',10,1),(56,'2023-04-16 15:19:48.230094','55','Джордж Орвелл - 1984',3,'',14,1),(57,'2023-04-16 15:19:48.357271','54','Даніель Дефо - Робінзон Крузо',3,'',14,1),(58,'2023-04-16 15:19:48.367292','53','Джоан Роулінг - Гаррі Поттер і таємна кімната',3,'',14,1),(59,'2023-04-16 15:19:48.377753','50','Даніель Дефо - Робінзон Крузо',3,'',14,1),(60,'2023-04-16 15:19:48.389319','48','Даніель Дефо - Робінзон Крузо',3,'',14,1),(61,'2023-04-16 15:19:48.398905','47','Олександр Палій - Книга Короткий курс історії України',3,'',14,1),(62,'2023-04-16 15:19:48.409224','46','Джордж Орвелл - 1984',3,'',14,1),(63,'2023-04-16 15:19:48.419088','44','Даніель Дефо - Робінзон Крузо',3,'',14,1),(64,'2023-04-16 15:19:48.431692','43','Джордж Орвелл - 1984',3,'',14,1),(65,'2023-04-16 15:19:48.445398','32','Тарас Шевченко - Кобзар',3,'',14,1),(66,'2023-04-16 15:19:48.458016','31','Джордж Орвелл - 1984',3,'',14,1),(67,'2023-04-16 15:26:13.409402','7','Моноліт',1,'[{\"added\": {}}]',7,1),(68,'2023-04-16 15:27:23.670026','8','Моноліт .',1,'[{\"added\": {}}]',9,1),(69,'2023-04-16 15:27:27.674100','978-617-577-367-3','Моноліт . - Правила Дорожнього Руху України 2023 р. Ілюст',1,'[{\"added\": {}}]',8,1),(70,'2023-04-16 15:27:53.826040','7','Моноліт . - Правила Дорожнього Руху України 2023 р. Ілюст',1,'[{\"added\": {}}]',12,1),(71,'2023-04-16 15:28:24.993048','8','Моноліт . - Правила Дорожнього Руху України 2023 р. Ілюст',1,'[{\"added\": {}}]',10,1),(72,'2023-04-17 19:03:55.908285','978-617-577-367-3','Моноліт . - Правила Дорожнього Руху України 2023 р. Ілюст',3,'',8,1),(73,'2023-04-17 19:05:00.977513','978-617-577-367-3',' - Книга Правила Дорожнього Руху України 2023 р.',1,'[{\"added\": {}}]',8,1),(74,'2023-04-17 19:05:12.961249','8','Моноліт .',3,'',9,1),(75,'2023-04-17 19:05:56.388989','8',' - Книга Правила Дорожнього Руху України 2023 р.',1,'[{\"added\": {}}]',10,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'abonent','author'),(8,'abonent','book'),(12,'abonent','bookauthor'),(14,'abonent','booksdelivery'),(10,'abonent','copies'),(11,'abonent','knowledgefield'),(15,'abonent','knowledgefieldhasbook'),(7,'abonent','publisher'),(13,'abonent','reader'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'abonent','0001_initial','2023-04-01 18:54:47.469934'),(2,'contenttypes','0001_initial','2023-04-01 18:54:47.503086'),(3,'auth','0001_initial','2023-04-01 18:54:47.978767'),(4,'admin','0001_initial','2023-04-01 18:54:48.093616'),(5,'admin','0002_logentry_remove_auto_add','2023-04-01 18:54:48.103455'),(6,'admin','0003_logentry_add_action_flag_choices','2023-04-01 18:54:48.112386'),(7,'contenttypes','0002_remove_content_type_name','2023-04-01 18:54:48.185312'),(8,'auth','0002_alter_permission_name_max_length','2023-04-01 18:54:48.267296'),(9,'auth','0003_alter_user_email_max_length','2023-04-01 18:54:48.346087'),(10,'auth','0004_alter_user_username_opts','2023-04-01 18:54:48.354760'),(11,'auth','0005_alter_user_last_login_null','2023-04-01 18:54:48.407837'),(12,'auth','0006_require_contenttypes_0002','2023-04-01 18:54:48.412495'),(13,'auth','0007_alter_validators_add_error_messages','2023-04-01 18:54:48.421560'),(14,'auth','0008_alter_user_username_max_length','2023-04-01 18:54:48.484815'),(15,'auth','0009_alter_user_last_name_max_length','2023-04-01 18:54:48.537194'),(16,'auth','0010_alter_group_name_max_length','2023-04-01 18:54:48.584426'),(17,'auth','0011_update_proxy_permissions','2023-04-01 18:54:48.593574'),(18,'auth','0012_alter_user_first_name_max_length','2023-04-01 18:54:48.674766'),(19,'sessions','0001_initial','2023-04-01 18:54:48.711454'),(20,'abonent','0002_book','2023-04-01 18:57:44.363598'),(21,'abonent','0003_author_alter_book_options','2023-04-01 18:59:23.394228'),(22,'abonent','0004_knowledgefield_reader_copies_bookauthor_and_more','2023-04-01 19:05:17.651737'),(23,'abonent','0005_book_authors','2023-04-01 19:25:45.595409'),(24,'abonent','0006_knowledgefield_book_reader_copies','2023-04-01 19:34:23.700616'),(25,'abonent','0007_alter_book_authors','2023-04-01 19:45:31.939752'),(26,'abonent','0008_remove_reader_copies_copies_reader','2023-04-02 12:49:35.284930'),(27,'abonent','0009_alter_reader_read_ticket_num','2023-04-02 13:26:16.704884'),(28,'abonent','0010_booksdelivery_date_must_return_and_more','2023-04-08 17:47:05.933806'),(29,'abonent','0011_alter_booksdelivery_options_and_more','2023-04-08 19:28:23.694824'),(30,'abonent','0012_remove_copies_reader','2023-04-08 20:22:31.880535'),(31,'abonent','0013_alter_book_authors_alter_booksdelivery_date_issue','2023-04-17 19:02:49.460237');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9r60a64a8y5jcyguh4n6c9uxnt4twwzk','.eJxVjMsOwiAURP-FtSFcnuLSvd9ALnCRqoGktCvjv9smXehqkjln5s0CrksN66A5TJldGLDTbxcxPantID-w3TtPvS3zFPmu8IMOfuuZXtfD_TuoOOq2JldKUmiQthAlSm2yigaMsi5qL1Ox0QGQSgSahDyLDB68sSKTkmjZ5wsAsDfx:1po49o:lnQsnt182k7xyBlGPo_9dSEqS4QzLK9eQqr41yA5kZY','2023-04-30 15:19:12.074220'),('fxvmi3eu0kkwll23l4hoqdoa8ckm2r6b','.eJxVjMsOwiAURP-FtSFcnuLSvd9ALnCRqoGktCvjv9smXehqkjln5s0CrksN66A5TJldGLDTbxcxPantID-w3TtPvS3zFPmu8IMOfuuZXtfD_TuoOOq2JldKUmiQthAlSm2yigaMsi5qL1Ox0QGQSgSahDyLDB68sSKTkmjZ5wsAsDfx:1pigS9:wQLbcbIKU_EdsRr3t56wzJj2TSbglUsh6I4x6a1SilU','2023-04-15 18:59:53.097062');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_field`
--

DROP TABLE IF EXISTS `knowledge_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_field` (
  `unique_num` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `knowledge_field_unique_num_id` int NOT NULL,
  PRIMARY KEY (`unique_num`),
  KEY `knowledge_field_knowledge_field_uniq_d0fe5156_fk_knowledge` (`knowledge_field_unique_num_id`),
  CONSTRAINT `knowledge_field_knowledge_field_uniq_d0fe5156_fk_knowledge` FOREIGN KEY (`knowledge_field_unique_num_id`) REFERENCES `knowledge_field` (`unique_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_field`
--

LOCK TABLES `knowledge_field` WRITE;
/*!40000 ALTER TABLE `knowledge_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_field_book`
--

DROP TABLE IF EXISTS `knowledge_field_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_field_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `knowledgefield_id` int NOT NULL,
  `book_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `knowledge_field_book_knowledgefield_id_book_id_6b092479_uniq` (`knowledgefield_id`,`book_id`),
  KEY `knowledge_field_book_book_id_a595b134_fk_book_ISBN` (`book_id`),
  CONSTRAINT `knowledge_field_book_book_id_a595b134_fk_book_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `knowledge_field_book_knowledgefield_id_aa372cbe_fk_knowledge` FOREIGN KEY (`knowledgefield_id`) REFERENCES `knowledge_field` (`unique_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_field_book`
--

LOCK TABLES `knowledge_field_book` WRITE;
/*!40000 ALTER TABLE `knowledge_field_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_field_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_field_has_book`
--

DROP TABLE IF EXISTS `knowledge_field_has_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_field_has_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_ISBN_id` varchar(20) NOT NULL,
  `knowledge_field_unique_num_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `knowledge_field_has_book_knowledge_field_unique_n_88fbb298_uniq` (`knowledge_field_unique_num_id`,`book_ISBN_id`),
  KEY `knowledge_field_has_book_book_ISBN_id_17f8057f_fk_book_ISBN` (`book_ISBN_id`),
  CONSTRAINT `knowledge_field_has__knowledge_field_uniq_4db1f992_fk_knowledge` FOREIGN KEY (`knowledge_field_unique_num_id`) REFERENCES `knowledge_field` (`unique_num`),
  CONSTRAINT `knowledge_field_has_book_book_ISBN_id_17f8057f_fk_book_ISBN` FOREIGN KEY (`book_ISBN_id`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_field_has_book`
--

LOCK TABLES `knowledge_field_has_book` WRITE;
/*!40000 ALTER TABLE `knowledge_field_has_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledge_field_has_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `ID_publisher` int NOT NULL,
  `name_publisher` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_publisher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Ранок'),(2,'Фоліо'),(3,'Знання'),(5,'А-ба-ба-га-ла-ма-га'),(7,'Моноліт');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `read_ticket_num` int NOT NULL AUTO_INCREMENT,
  `PIB` varchar(100) NOT NULL,
  `home_adress` varchar(45) NOT NULL,
  `tel_work` varchar(10) NOT NULL,
  `tel_home` varchar(10) DEFAULT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`read_ticket_num`)
) ENGINE=InnoDB AUTO_INCREMENT=23471 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (12345,'Ігнатьєва Катерина Миколаївна','Паркова 17','0975744766',NULL,'2003-12-06'),(23456,'Іванов Олександр Андрійович','Незалежності 8','0678277366','None','2002-09-03'),(23459,'Лабунський Богдан Васильович','Перемоги 23','0952836482','0672937465','2001-11-28'),(23460,'Ніколаєва Аліна Миколаївна','Миру 15','0972948264',NULL,'2002-12-11'),(23463,'Шведа Максим Сергійович','Слави 56','0982736763',NULL,'2003-05-29'),(23464,'Смірнов Олексій Володимирович','Героїв України 56','0982736452',NULL,'1986-06-17'),(23468,'Плеханова Катерина Андріївна','Андріївська 54','0927355927','0998274658','2000-02-20'),(23469,'Терещенко Владислав Михайлович','Лисичанська 162','0672936482','None','2001-07-23'),(23470,'Міронова Яна Олександрівна','Шполянська 29','0682730182',NULL,'2001-05-06');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ihnatieva'
--

--
-- Dumping routines for database 'ihnatieva'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-30  1:41:22
