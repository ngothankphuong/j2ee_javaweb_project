-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: phone_store
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cau_hinh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loai_san_pham` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gia` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hinhAnh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trang_thai` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (20,'Iphone 11','Màu: Đen | CPU: Apple A11 | Pin 3500mAh | Màn hình 1.5k','Apple','dien_thoai','10000000','ip11.jpg','inactive'),(21,'Iphone 13 Mini','Màu: Xanh | CPU: Apple A13 | Pin 3200mAh | Màn hình 1.5k','Apple','dien_thoai','15000000','ip13_mini.png','active'),(22,'Iphone 14','Màu: Hồng | CPU: Apple A14 | Pin 3800mAh | Màn hình 1.5k','Apple','dien_thoai','18000000','ip14.jpg','active'),(23,'Iphone X','Màu: Đen | CPU: Apple A10 | Pin 3000mAh | Màn hình:6.5','Apple','dien_thoai','8000000','ipX.png','active'),(25,'Iphone 11','Màu: Tím | CPU: Apple A11 | Pin 3500mAh | Màn hình 1.5k','Apple','dien_thoai','7000000','ip11_purple.jpg','active'),(26,'Ipad 9','CPU: Apple A13 | Pin 3000mAH | Màn hình 1k','Apple','may_tinh_bang','15000000','ipad_gen9.jpg','active'),(28,'ipad 6','Màu: Đen | CPU: Apple A11 | Pin 3500mAh | Màn hình 1.5k','Apple','may_tinh_bang','5000000','ipad_mini_6.jpg','active'),(29,'Ipad Pro M1 2022','CPU: Apple A13 | Pin 3000mAH | Màn hình 1k','Apple','may_tinh_bang','18000000','ipad_pro_m1.jpg','active'),(30,'Macbook Pro 13 Inch','Apple M1 Pro with 10-core CPU, 16-core GPU, 16-core Neural Engine','Apple','laptop','30000000','macbook_pro_13inch.jpg','active'),(31,'Macbook Pro 2022','Apple M1 Max with 10-core CPU, 32-core GPU, 16-core Neural Engine','Apple','laptop','40000000','macbook_pro_2022.jpg','active'),(32,'Macbook Air','Apple M1 chip with 8-core CPU, 8-core GPU, and 16-core Neural Engine | Bộ nhớ RAM:8GB','Apple','laptop','28000000','macbook_air.jpg','active'),(33,'Macbook Pro M2','Apple M1 chip with 8-core CPU | 8GB | 256GB SSD','Apple','laptop','40000000','macbook_pro_m2.jpg','active'),(34,'Macbook Pro 2023','Apple M1 chip with 8‑core CPU | 8GB | 7-core GPU | 1.29 kg','Apple','laptop','50000000','macbook_pro_2023.jpg','active'),(35,'Macbook Pro M1 16 Inch','Apple M1 chip with 8‑core CPU | 8GB | 7-core GPU | 1.29 kg','Apple','laptop','23000000','macbook_pro_m1_16inch.jpg','active'),(36,'Macbook Pro 14 Inch','Màn hình Liquid Retina XDR 14 inch² Hai cổng Thunderbolt / USB 4, cổng HDMI, khe thẻ nhớ SDXC, jack cắm tai nghe, cổng MagSafe 3 Magic Keyboard với Touch ID Bàn di chuột Force Touch Bộ Tiếp Hợp Nguồn USB-C 70W','Apple','laptop','35000000','macbook_pro_14.jpg','active'),(37,'Macbook Pro M3','Apple M3 chip with 8‑core CPU | 16GB | 7-core GPU | 1.29 kg','Apple','laptop','50000000','macbook_m3.jpg','active');
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 20:52:12
