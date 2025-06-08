-- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
--
-- Host: localhost    Database: mysql_hasan
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Budi','Nugraha'),(2,'Andi','Septian'),(4,'Dani','Angga');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `harga` int NOT NULL DEFAULT '0',
  `jumlah` int NOT NULL DEFAULT '0',
  `deskripsi` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('C001','Dapur'),('C002','Mandi'),('C003','Fashion'),('C004','Elektronik'),('C005','Sekolah');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'mhasan@mail.com','M','Hasan'),(2,'mhasanain@mail.com','M','Hasanain'),(4,'mhasan2@mail.com','M','Hasan');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbooks`
--

DROP TABLE IF EXISTS `guestbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbooks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbooks`
--

LOCK TABLES `guestbooks` WRITE;
/*!40000 ALTER TABLE `guestbooks` DISABLE KEYS */;
INSERT INTO `guestbooks` VALUES (1,'guest1@mail.com','diganti user 1','Hello All'),(2,'guest2@mail.com','Hi','Hi All'),(3,'guest3@mail.com','Morning','Morning All'),(4,'mhasan@mail.com','Hola','Hola All'),(5,'mhasan@mail.com','Hola','Hola All'),(6,'mhasan@mail.com','Hola','Hola All'),(7,'guestbooks1@gmail.com','guestbooks1','guestbooks 1'),(8,'guestbooks2@gmail.com','guestbooks2','guestbooks 2'),(9,'guestbooks3@gmail.com','diganti user 2','guestbooks 3');
/*!40000 ALTER TABLE `guestbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,20,'2025-06-01 21:42:38'),(2,10,'2025-06-01 21:42:42'),(3,15,'2025-06-01 21:42:44');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `id_product` varchar(15) NOT NULL,
  `id_order` int NOT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_order`),
  KEY `fk_orders_detail_orders` (`id_order`),
  CONSTRAINT `fk_orders_detail_orders` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_orders_detail_products` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES ('P1685356889',1,1000,5),('P1685356889',3,1000,10),('P1685356900',1,2000,9),('P1685356911',2,2500,15),('P1685356922',2,5000,30),('P1685356933',3,1500,2);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_category` varchar(15) DEFAULT NULL,
  `description` text,
  `price` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_products_categories` (`id_category`),
  FULLTEXT KEY `product_search` (`name`,`description`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  CONSTRAINT `price_check` CHECK (((`price` >= 1000) and (`price` <= 100000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('P1685356801','Gula Pasir Premium','C001','Gula berkualitas tinggi untuk kebutuhan sehari-hari.',12000,130,'2025-05-29 06:27:56'),('P1685356812','Sabun Mandi Fresh','C002','Sabun dengan aroma segar yang menyegarkan tubuh.',5000,300,'2025-05-29 06:27:56'),('P1685356823','Tepung Terigu Serbaguna','C001','Tepung serbaguna untuk berbagai keperluan memasak.',8000,2,'2025-05-29 06:27:56'),('P1685356834','Sandal Kulit Pria','C003','Sandal elegan untuk pria dengan desain klasik.',45000,5,'2025-05-29 06:27:56'),('P1685356845','Gula Pasir Ekonomis','C001','Gula untuk keperluan sehari-hari.',11000,180,'2025-05-29 06:27:56'),('P1685356856','Sabun Mandi Herbal','C002','',6000,250,'2025-05-29 06:27:56'),('P1685356878','Sandal Kasual Wanita','C003','Sandal kasual untuk wanita dengan desain modern.',35000,12,'2025-05-29 06:27:56'),('P1685356889','Gula Kelapa Organik','C001','Gula kelapa organik untuk pemanis alami.',15000,80,'2025-05-29 06:27:56'),('P1685356900','Sabun Mandi Tea Tree','C002','Sabun dengan kandungan tea tree untuk kulit sehat.',7000,200,'2025-05-29 06:27:56'),('P1685356911','Tepung Maizena','C001','Tepung maizena untuk pengental makanan.',5000,150,'2025-05-29 06:27:56'),('P1685356922','Sandal Formal Pria','C003','Sandal formal untuk pria dengan desain elegan.',55000,60,'2025-05-29 06:27:56'),('P1685356933','Gula Pasir Putih','C001','Gula pasir putih untuk keperluan sehari-hari.',13000,140,'2025-05-29 06:27:56'),('P1685356944','Sabun Mandi Lavender','C002','',8000,220,'2025-05-29 06:27:56'),('P1685356955','Tepung Ketan','C001','Tepung ketan untuk membuat kue tradisional.',10000,90,'2025-05-29 06:27:56'),('P1685356966','Sandal Pantai Wanita','C003','Sandal pantai untuk wanita dengan desain santai.',25000,1,'2025-05-29 06:27:56'),('P1685356977','Gula Aren Cair','C001','Gula aren cair untuk pemanis alami.',20000,70,'2025-05-29 06:27:56'),('P1685356988','Sabun Mandi Eucalyptus','C002','Sabun dengan kandungan eucalyptus untuk kesegaran.',7500,210,'2025-05-29 06:27:56'),('P1685356999','Tepung Sagu','C001','Tepung sagu untuk membuat kue tradisional.',11000,130,'2025-05-29 06:27:56'),('P1685357010','Sandal Hiking Pria','C003','Sandal hiking untuk pria dengan desain kokoh.',60000,40,'2025-05-29 06:27:56'),('P1685357021','Gula Pasir Merah','C001','Gula pasir merah untuk keperluan sehari-hari.',14000,160,'2025-05-29 06:27:56'),('P1685357032','Sabun Mandi Rose','C002','',8500,230,'2025-05-29 06:27:56'),('P1685357043','Tepung Kedelai','C001','Tepung kedelai untuk membuat kue sehat.',9500,110,'2025-05-29 06:27:56'),('P1685357054','Sandal Olahraga Wanita','C003','Sandal olahraga untuk wanita dengan desain sporty.',40000,90,'2025-05-29 06:27:56'),('P1685357065','Gula Pasir Hitam','C001','Gula pasir hitam untuk keperluan sehari-hari.',16000,15,'2025-05-29 06:27:56'),('P1685357076','Sabun Mandi Chamomile','C002','Sabun dengan kandungan chamomile untuk kulit lembut.',9500,240,'2025-05-29 06:27:56'),('P1685357087','Tepung Kacang Hijau','C001','Tepung kacang hijau untuk membuat kue sehat.',10500,120,'2025-05-29 06:27:56'),('PP1685357013','Beras Ramok 5kg',NULL,NULL,100000,10,'2025-06-01 22:19:57'),('PP1685357022','Minyak Zaitun 2L',NULL,NULL,98000,23,'2025-06-01 22:19:57');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `firstname_index` (`first_name`),
  KEY `middlename_index` (`middle_name`),
  KEY `lastname_index` (`last_name`),
  KEY `firstname_middlename_lastname_index` (`first_name`,`middle_name`,`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_customer_unique` (`id_customer`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,1,0),(2,2,0),(3,4,150000);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` varchar(15) NOT NULL,
  `description` text,
  `id_customer` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wishlist_product` (`id_product`),
  KEY `fk_wishlist_customer` (`id_customer`),
  CONSTRAINT `fk_wishlist_customer` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'P1685356845','Stok gula Mei',1),(8,'P1685356856','Sabun whitening',2);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 14:18:29
