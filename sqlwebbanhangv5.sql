-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for my_store
CREATE DATABASE IF NOT EXISTS `my_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `my_store`;

-- Dumping structure for table my_store.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(50) NOT NULL DEFAULT 'user',
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.accounts: ~0 rows (approximately)
INSERT INTO `accounts` (`id`, `username`, `password`, `created_at`, `role`, `fullname`) VALUES
	(1, '2', '$2y$12$/hhyB2vdBQC9EYmVZnBt0OqT/Nb0Lwsh6qnC6saTqEnlt56KhE/K.', '2025-03-17 03:44:17', 'user', NULL),
	(2, '4', '$2y$12$g5Yhti8pWnopCwErVp.unOfdlELPjgsvUUAijLKsIotRcEbPY.LOm', '2025-03-24 00:36:37', 'admin', '4'),
	(3, '5', '$2y$12$h9H5lyfduiHZR8kb4OpvT.lRn.gH0ukmVfyOF1ylVd9WcX3qHsImi', '2025-03-24 00:39:53', 'user', '5');

-- Dumping structure for table my_store.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.category: ~5 rows (approximately)
INSERT INTO `category` (`id`, `name`, `description`) VALUES
	(1, 'SUV Hạng Sang', 'Danh mục các dòng SUV cao cấp từ các thương hiệu hàng đầu'),
	(2, 'Sedan Hạng Sang', 'Danh mục các mẫu sedan sang trọng, tiện nghi'),
	(3, 'Xe Thể Thao', 'Danh mục các dòng xe thể thao hiệu suất cao'),
	(4, 'Siêu Xe', 'Danh mục các dòng siêu xe đẳng cấp thế giới'),
	(5, 'Xe Điện Cao Cấp', 'Danh mục các mẫu xe điện sang trọng và hiện đại');

-- Dumping structure for table my_store.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.orders: ~6 rows (approximately)
INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `created_at`) VALUES
	(11, 'Vo Thanh Tung', '0364805938', 'd', '2025-03-10 02:03:15'),
	(12, 'Vo Thanh Tung', '0364805938', 'asdsd', '2025-03-10 02:10:03'),
	(13, 'kin', '79483547', 'fgf', '2025-03-10 02:12:35'),
	(14, 'Vo Thanh Tung', '0364805938', 'ss', '2025-03-10 02:59:32'),
	(15, 'Vo Thanh Tung', '0364805938', 'sg', '2025-03-10 03:21:30'),
	(16, 'Vo Thanh Tung', '0364805938', 'as', '2025-03-10 03:35:34');

-- Dumping structure for table my_store.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.order_details: ~12 rows (approximately)
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
	(1, 11, 1, 2, 3455325.00),
	(2, 12, 2, 1, 3444346.00),
	(3, 13, 3, 1, 2455.00),
	(4, 14, 2, 1, 3444346.00),
	(5, 14, 1, 1, 3455325.00),
	(6, 14, 4, 1, 76567.00),
	(7, 15, 1, 1, 3455325.00),
	(8, 15, 2, 1, 3444346.00),
	(9, 16, 1, 2, 3455325.00),
	(10, 16, 2, 1, 3444346.00),
	(11, 16, 3, 1, 2455.00),
	(12, 16, 4, 1, 76567.00);

-- Dumping structure for table my_store.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.product: ~9 rows (approximately)
INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `category_id`) VALUES
	(1, 'Camry 2025', 'fdsd', 3455325.00, 'uploads/67ce5a5ade3b2_Capture.PNG', 2),
	(2, 'Honda Acord', 'fdsds', 3444346.00, 'uploads/67ce5a62dd775_honda accrod.PNG', 2),
	(3, 'VF9', 'asasdd', 2455.00, 'uploads/67ce5a687020a_vf9.PNG', 5),
	(4, 'VF7', 'jfgj', 76567.00, 'uploads/67ce5a6de3cd9_vf7.PNG', 5),
	(7, 'Cadillac Escalade', 'frdss', 2342422.00, 'uploads/67ce5a79071a8_cadilac.PNG', 1),
	(8, 'Lamborgini', 'erte', 45645577.00, 'uploads/67ce5a7d6656b_lambor.PNG', 4),
	(9, 'Civic', 'ww', 36363636.00, 'uploads/67ce5a95207ff_BYD.PNG', 3),
	(11, 'koenigsegg', 'asa', 3545325.00, 'uploads/67ce5a9c14312_koenigsegg.PNG', 4),
	(12, 'subaru', 'wdss', 54635.00, 'uploads/67ce5aa3b38db_subaru.PNG', 3),
	(15, 'Teritory', '1', 123343.00, 'uploads/teritory.PNG', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
