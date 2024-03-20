-- --------------------------------------------------------
-- Host:                         vm
-- Server version:               8.1.0 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for f1
CREATE DATABASE IF NOT EXISTS `f1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `f1`;

-- Dumping structure for table f1.constructors
CREATE TABLE IF NOT EXISTS `constructors` (
  `ticker` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nationality` int DEFAULT NULL,
  `titles` int DEFAULT NULL,
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `ticker` (`ticker`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table f1.drivers
CREATE TABLE IF NOT EXISTS `drivers` (
  `number` int unsigned NOT NULL,
  `ticker` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nationality` int NOT NULL,
  `titles` tinyint NOT NULL DEFAULT '0',
  `url` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dob` datetime NOT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `firstname_lastname` (`firstname`,`lastname`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `ticker` (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table f1.grandprix
CREATE TABLE IF NOT EXISTS `grandprix` (
  `id` int unsigned NOT NULL,
  `season` int unsigned NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location_flag` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `circuit` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `circuit_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `circuit_wiki` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `weekend` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `season_name` (`season`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table f1.grandprix_result
CREATE TABLE IF NOT EXISTS `grandprix_result` (
  `grandprix` int unsigned NOT NULL,
  `driver` int unsigned NOT NULL,
  `position` int unsigned NOT NULL,
  `laps` int unsigned DEFAULT NULL,
  `time` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  UNIQUE KEY `grandprix_driver_points` (`grandprix`,`driver`,`position`) USING BTREE,
  KEY `FK_grandprix_result_drivers` (`driver`),
  CONSTRAINT `FK_grandprix_result_drivers` FOREIGN KEY (`driver`) REFERENCES `drivers` (`number`),
  CONSTRAINT `FK_grandprix_result_grandprix` FOREIGN KEY (`grandprix`) REFERENCES `grandprix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table f1.grandprix_schedule
CREATE TABLE IF NOT EXISTS `grandprix_schedule` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `grandprixid` int unsigned NOT NULL,
  `type` int unsigned NOT NULL,
  `status` int NOT NULL,
  `start` timestamp NOT NULL,
  `end` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grandprixid_type` (`grandprixid`,`type`),
  KEY `FK_grandprix_schedule_grandprix` (`grandprixid`) USING BTREE,
  CONSTRAINT `FK_grandprix_schedule_grandprix` FOREIGN KEY (`grandprixid`) REFERENCES `grandprix` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table f1.grandprix_stats
CREATE TABLE IF NOT EXISTS `grandprix_stats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `grandprixid` int unsigned DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grandprixid_name` (`grandprixid`,`name`) USING BTREE,
  CONSTRAINT `FK_grandprix_stats_grandprix` FOREIGN KEY (`grandprixid`) REFERENCES `grandprix` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
