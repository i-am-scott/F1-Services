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

-- Dumping structure for table f1.championship
CREATE TABLE IF NOT EXISTS `championship` (
  `Season` int unsigned NOT NULL,
  `DriverKey` int unsigned NOT NULL,
  `TeamKey` int unsigned NOT NULL,
  `Position` int unsigned NOT NULL,
  `Points` int unsigned NOT NULL,
  UNIQUE KEY `Season_DriverKey` (`TeamKey`,`Season`,`DriverKey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.championship: ~44 rows (approximately)
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 982, 481, 16, 12);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1032, 481, 23, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1079, 481, 19, 5);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 907, 481, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 982, 481, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 907, 526, 5, 290);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 955, 526, 3, 356);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 4, 526, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 955, 526, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 981, 529, 2, 374);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1039, 529, 4, 292);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 981, 529, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1039, 529, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 9, 536, 8, 152);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 902, 536, 1, 437);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 902, 536, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1029, 536, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 4, 543, 7, 223);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 960, 543, 6, 245);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 960, 543, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1171, 543, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 16, 557, 11, 41);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 888, 557, 15, 16);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1041, 557, 18, 7);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 905, 557, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1041, 557, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 905, 600, 14, 23);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 951, 600, 10, 42);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1035, 600, 24, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 951, 600, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1035, 600, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1, 602, 9, 70);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 956, 602, 13, 24);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1, 602, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 956, 602, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 850, 606, 22, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1025, 606, 20, 4);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 16, 606, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1082, 606, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 18, 607, 17, 12);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1024, 607, 12, 30);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 1029, 607, 21, 4);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1024, 662, 0, 0);
INSERT INTO `championship` (`Season`, `DriverKey`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 1042, 662, 0, 0);

-- Dumping structure for table f1.constructors
CREATE TABLE IF NOT EXISTS `constructors` (
  `Season` int unsigned NOT NULL,
  `TeamKey` int unsigned NOT NULL,
  `Position` int unsigned NOT NULL,
  `Points` int unsigned NOT NULL,
  UNIQUE KEY `Season_TeamKey` (`Season`,`TeamKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.constructors: ~20 rows (approximately)
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 481, 9, 17);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 526, 2, 652);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 529, 1, 666);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 536, 3, 589);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 543, 4, 468);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 557, 7, 58);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 600, 6, 65);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 602, 5, 94);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 606, 10, 4);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2024, 607, 8, 46);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 481, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 526, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 529, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 536, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 543, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 557, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 600, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 602, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 606, 0, 0);
INSERT INTO `constructors` (`Season`, `TeamKey`, `Position`, `Points`) VALUES
	(2025, 662, 0, 0);

-- Dumping structure for table f1.drivers
CREATE TABLE IF NOT EXISTS `drivers` (
  `Season` int unsigned NOT NULL,
  `RacingNumber` int unsigned NOT NULL,
  `Key` int unsigned NOT NULL,
  `TeamKey` int unsigned NOT NULL,
  `TLA` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PIA, NOR ETC',
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nationality` int NOT NULL,
  `Image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Profile` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  UNIQUE KEY `DrivingNumber_Season` (`RacingNumber`,`Season`) USING BTREE,
  UNIQUE KEY `Season_TLA` (`Season`,`TLA`) USING BTREE,
  UNIQUE KEY `Key` (`Key`,`Season`) USING BTREE,
  KEY `LastName` (`LastName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.drivers: ~44 rows (approximately)
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 1, 902, 536, 'VER', 'Max', 'Verstappen', 28, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png', '/en/drivers/max-verstappen');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 1, 902, 536, 'VER', 'Max', 'Verstappen', 28, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png', '/en/drivers/max-verstappen');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 2, 1032, 481, 'SAR', 'Logan', 'Sargeant', 43, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LOGSAR01_Logan_Sargeant/logsar01.png', '/en/drivers/logan-sargeant');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 3, 18, 607, 'RIC', 'Daniel', 'Ricciardo', 2, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/D/DANRIC01_Daniel_Ricciardo/danric01.png', '/en/drivers/daniel-ricciardo');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 4, 981, 529, 'NOR', 'Lando', 'Norris', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANNOR01_Lando_Norris/lannor01.png', '/en/drivers/lando-norris');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 4, 981, 529, 'NOR', 'Lando', 'Norris', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANNOR01_Lando_Norris/lannor01.png', '/en/drivers/lando-norris');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 5, 1082, 606, 'BOR', 'Gabriel', 'Bortoleto', 7, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GABBOR01_Gabriel_Bortoleto/gabbor01.png', '/en/drivers/gabriel-bortoleto');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 6, 1042, 662, 'HAD', 'Isack', 'Hadjar', 15, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/I/ISAHAD01_Isack_Hadjar/isahad01.png', '/en/drivers/isack-hadjar');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 7, 1035, 600, 'DOO', 'Jack', 'Doohan', 2, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/J/JACDOO01_Jack_Doohan/jacdoo01.png', '/en/drivers/jack-doohan');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 10, 951, 600, 'GAS', 'Pierre', 'Gasly', 15, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/P/PIEGAS01_Pierre_Gasly/piegas01.png', '/en/drivers/pierre-gasly');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 10, 951, 600, 'GAS', 'Pierre', 'Gasly', 15, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/P/PIEGAS01_Pierre_Gasly/piegas01.png', '/en/drivers/pierre-gasly');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 11, 9, 536, 'PER', 'Sergio', 'Perez', 25, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/S/SERPER01_Sergio_Perez/serper01.png', '/en/drivers/sergio-perez');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 12, 1171, 543, 'ANT', 'Andrea Kimi', 'Antonelli', 21, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/A/ANDANT01_Andrea%20Kimi_Antonelli/andant01.png', '/en/drivers/kimi-antonelli');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 14, 1, 602, 'ALO', 'Fernando', 'Alonso', 37, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/F/FERALO01_Fernando_Alonso/feralo01.png', '/en/drivers/fernando-alonso');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 14, 1, 602, 'ALO', 'Fernando', 'Alonso', 37, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/F/FERALO01_Fernando_Alonso/feralo01.png', '/en/drivers/fernando-alonso');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 16, 955, 526, 'LEC', 'Charles', 'Leclerc', 26, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CHALEC01_Charles_Leclerc/chalec01.png', '/en/drivers/charles-leclerc');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 16, 955, 526, 'LEC', 'Charles', 'Leclerc', 26, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CHALEC01_Charles_Leclerc/chalec01.png', '/en/drivers/charles-leclerc');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 18, 956, 602, 'STR', 'Lance', 'Stroll', 8, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANSTR01_Lance_Stroll/lanstr01.png', '/en/drivers/lance-stroll');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 18, 956, 602, 'STR', 'Lance', 'Stroll', 8, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANSTR01_Lance_Stroll/lanstr01.png', '/en/drivers/lance-stroll');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 20, 888, 557, 'MAG', 'Kevin', 'Magnussen', 13, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/K/KEVMAG01_Kevin_Magnussen/kevmag01.png', '/en/drivers/kevin-magnussen');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 22, 1024, 607, 'TSU', 'Yuki', 'Tsunoda', 22, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/Y/YUKTSU01_Yuki_Tsunoda/yuktsu01.png', '/en/drivers/yuki-tsunoda');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 22, 1024, 662, 'TSU', 'Yuki', 'Tsunoda', 22, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/Y/YUKTSU01_Yuki_Tsunoda/yuktsu01.png', '/en/drivers/yuki-tsunoda');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 23, 982, 481, 'ALB', 'Alexander', 'Albon', 40, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/A/ALEALB01_Alexander_Albon/alealb01.png', '/en/drivers/alexander-albon');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 23, 982, 481, 'ALB', 'Alexander', 'Albon', 40, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/A/ALEALB01_Alexander_Albon/alealb01.png', '/en/drivers/alexander-albon');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 24, 1025, 606, 'ZHO', 'Guanyu', 'Zhou', 10, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GUAZHO01_Guanyu_Zhou/guazho01.png', '/en/drivers/guanyu-zhou');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 27, 16, 557, 'HUL', 'Nico', 'Hulkenberg', 16, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/N/NICHUL01_Nico_Hulkenberg/nichul01.png', '/en/drivers/nico-hulkenberg');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 27, 16, 606, 'HUL', 'Nico', 'Hulkenberg', 16, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/N/NICHUL01_Nico_Hulkenberg/nichul01.png', '/en/drivers/nico-hulkenberg');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 30, 1029, 607, 'LAW', 'Liam', 'Lawson', 29, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LIALAW01_Liam_Lawson/lialaw01.png', '/en/drivers/liam-lawson');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 30, 1029, 536, 'LAW', 'Liam', 'Lawson', 29, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LIALAW01_Liam_Lawson/lialaw01.png', '/en/drivers/liam-lawson');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 31, 905, 600, 'OCO', 'Esteban', 'Ocon', 15, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/E/ESTOCO01_Esteban_Ocon/estoco01.png', '/en/drivers/esteban-ocon');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 31, 905, 557, 'OCO', 'Esteban', 'Ocon', 15, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/E/ESTOCO01_Esteban_Ocon/estoco01.png', '/en/drivers/esteban-ocon');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 43, 1079, 481, 'COL', 'Franco', 'Colapinto', 1, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/F/FRACOL01_Franco_Colapinto/fracol01.png', '/en/drivers/franco-colapinto');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 44, 4, 543, 'HAM', 'Lewis', 'Hamilton', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LEWHAM01_Lewis_Hamilton/lewham01.png', '/en/drivers/lewis-hamilton');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 44, 4, 526, 'HAM', 'Lewis', 'Hamilton', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LEWHAM01_Lewis_Hamilton/lewham01.png', '/en/drivers/lewis-hamilton');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 50, 1041, 557, 'BEA', 'Oliver', 'Bearman', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/O/OLIBEA01_Oliver_Bearman/olibea01.png', '/en/drivers/oliver-bearman');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 55, 907, 526, 'SAI', 'Carlos', 'Sainz', 37, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CARSAI01_Carlos_Sainz/carsai01.png', '/en/drivers/carlos-sainz');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 55, 907, 481, 'SAI', 'Carlos', 'Sainz', 37, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CARSAI01_Carlos_Sainz/carsai01.png', '/en/drivers/carlos-sainz');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 61, 1035, 600, 'DOO', 'Jack', 'Doohan', 2, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/J/JACDOO01_Jack_Doohan/jacdoo01.png', '/en/drivers/jack-doohan');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 63, 960, 543, 'RUS', 'George', 'Russell', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GEORUS01_George_Russell/georus01.png', '/en/drivers/george-russell');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 63, 960, 543, 'RUS', 'George', 'Russell', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GEORUS01_George_Russell/georus01.png', '/en/drivers/george-russell');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 77, 850, 606, 'BOT', 'Valtteri', 'Bottas', 14, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/V/VALBOT01_Valtteri_Bottas/valbot01.png', '/en/drivers/valtteri-bottas');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2024, 81, 1039, 529, 'PIA', 'Oscar', 'Piastri', 2, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/O/OSCPIA01_Oscar_Piastri/oscpia01.png', '/en/drivers/oscar-piastri');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 81, 1039, 529, 'PIA', 'Oscar', 'Piastri', 2, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/O/OSCPIA01_Oscar_Piastri/oscpia01.png', '/en/drivers/oscar-piastri');
INSERT INTO `drivers` (`Season`, `RacingNumber`, `Key`, `TeamKey`, `TLA`, `FirstName`, `LastName`, `Nationality`, `Image`, `Profile`) VALUES
	(2025, 87, 1041, 557, 'BEA', 'Oliver', 'Bearman', 42, 'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/O/OLIBEA01_Oliver_Bearman/olibea01.png', '/en/drivers/oliver-bearman');

-- Dumping structure for table f1.events
CREATE TABLE IF NOT EXISTS `events` (
  `Key` int unsigned NOT NULL,
  `Season` int unsigned NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OfficialName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Location` int unsigned NOT NULL,
  `Start` datetime NOT NULL,
  `End` datetime NOT NULL,
  `TimeOffset` int NOT NULL DEFAULT (0),
  `Profile` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Circuit` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Key`) USING BTREE,
  UNIQUE KEY `season_name` (`Season`,`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.events: ~50 rows (approximately)
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1228, 2024, 'Pre-Season Testing', 'FORMULA 1 ARAMCO PRE-SEASON TESTING 2024', 5, '2024-02-21 07:00:00', '2024-02-23 16:00:00', 3, '/en/racing/2024/pre-season-testing', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1229, 2024, 'Bahrain Grand Prix', 'FORMULA 1 GULF AIR BAHRAIN GRAND PRIX 2024', 5, '2024-02-29 11:30:00', '2024-03-02 17:00:00', 3, '/en/racing/2024/bahrain', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1230, 2024, 'Saudi Arabian Grand Prix', 'FORMULA 1 STC SAUDI ARABIAN GRAND PRIX 2024', 34, '2024-03-07 13:30:00', '2024-03-09 19:00:00', 3, '/en/racing/2024/saudi-arabia', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Saudi Arabia%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1231, 2024, 'Australian Grand Prix', 'FORMULA 1 ROLEX AUSTRALIAN GRAND PRIX 2024', 2, '2024-03-22 01:30:00', '2024-03-24 06:00:00', 11, '/en/racing/2024/australia', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Australia%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1232, 2024, 'Japanese Grand Prix', 'FORMULA 1 MSC CRUISES JAPANESE GRAND PRIX 2024', 22, '2024-04-05 02:30:00', '2024-04-07 07:00:00', 9, '/en/racing/2024/japan', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Japan%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1233, 2024, 'Chinese Grand Prix', 'FORMULA 1 LENOVO CHINESE GRAND PRIX 2024', 10, '2024-04-19 03:30:00', '2024-04-21 09:00:00', 8, '/en/racing/2024/china', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/China%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1234, 2024, 'Miami Grand Prix', 'FORMULA 1 CRYPTO.COM MIAMI GRAND PRIX 2024', 43, '2024-05-03 16:30:00', '2024-05-05 22:00:00', -4, '/en/racing/2024/miami', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Miami%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1235, 2024, 'Emilia Romagna Grand Prix', 'FORMULA 1 MSC CRUISES GRAN PREMIO DEL MADE IN ITALY E DELL\'EMILIA-ROMAGNA 2024', 21, '2024-05-17 11:30:00', '2024-05-19 15:00:00', 2, '/en/racing/2024/emiliaromagna', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia-Romagna%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1236, 2024, 'Monaco Grand Prix', 'FORMULA 1 GRAND PRIX DE MONACO 2024', 26, '2024-05-24 11:30:00', '2024-05-26 15:00:00', 2, '/en/racing/2024/monaco', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Monaco%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1237, 2024, 'Canadian Grand Prix', 'FORMULA 1 AWS GRAND PRIX DU CANADA 2024', 8, '2024-06-07 17:30:00', '2024-06-09 20:00:00', -4, '/en/racing/2024/canada', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Canada%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1238, 2024, 'Spanish Grand Prix', 'FORMULA 1 ARAMCO GRAN PREMIO DE ESPAÑA 2024', 37, '2024-06-21 11:30:00', '2024-06-23 15:00:00', 2, '/en/racing/2024/spain', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Spain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1239, 2024, 'Austrian Grand Prix', 'FORMULA 1 QATAR AIRWAYS AUSTRIAN GRAND PRIX 2024', 3, '2024-06-28 10:30:00', '2024-06-30 15:00:00', 2, '/en/racing/2024/austria', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Austria%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1240, 2024, 'British Grand Prix', 'FORMULA 1 QATAR AIRWAYS BRITISH GRAND PRIX 2024', 42, '2024-07-05 11:30:00', '2024-07-07 16:00:00', 1, '/en/racing/2024/great-britain', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Great Britain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1241, 2024, 'Hungarian Grand Prix', 'FORMULA 1 HUNGARIAN GRAND PRIX 2024', 17, '2024-07-19 11:30:00', '2024-07-21 15:00:00', 2, '/en/racing/2024/hungary', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Hungary%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1242, 2024, 'Belgian Grand Prix', 'FORMULA 1 ROLEX BELGIAN GRAND PRIX 2024', 6, '2024-07-26 11:30:00', '2024-07-28 15:00:00', 2, '/en/racing/2024/belgium', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Belgium%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1243, 2024, 'Dutch Grand Prix', 'FORMULA 1 HEINEKEN DUTCH GRAND PRIX 2024', 28, '2024-08-23 10:30:00', '2024-08-25 15:00:00', 2, '/en/racing/2024/netherlands', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Netherlands%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1244, 2024, 'Italian Grand Prix', 'FORMULA 1 PIRELLI GRAN PREMIO D’ITALIA 2024', 21, '2024-08-30 11:30:00', '2024-09-01 15:00:00', 2, '/en/racing/2024/italy', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Italy%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1245, 2024, 'Azerbaijan Grand Prix', 'FORMULA 1 QATAR AIRWAYS AZERBAIJAN GRAND PRIX 2024', 4, '2024-09-13 09:30:00', '2024-09-15 13:00:00', 4, '/en/racing/2024/azerbaijan', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Azerbaijan%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1246, 2024, 'Singapore Grand Prix', 'FORMULA 1 SINGAPORE AIRLINES SINGAPORE GRAND PRIX 2024', 35, '2024-09-20 09:30:00', '2024-09-22 14:00:00', 8, '/en/racing/2024/singapore', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Singapore%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1247, 2024, 'United States Grand Prix', 'FORMULA 1 PIRELLI UNITED STATES GRAND PRIX 2024', 43, '2024-10-18 17:30:00', '2024-10-20 21:00:00', -5, '/en/racing/2024/united-states', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/United States%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1248, 2024, 'Mexico City Grand Prix', 'FORMULA 1 GRAN PREMIO DE LA CIUDAD DE MÉXICO 2024', 25, '2024-10-25 18:30:00', '2024-10-27 22:00:00', -6, '/en/racing/2024/mexico', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Mexico%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1249, 2024, 'São Paulo Grand Prix', 'FORMULA 1 LENOVO GRANDE PRÊMIO DE SÃO PAULO 2024', 7, '2024-11-01 14:30:00', '2024-11-03 17:30:00', -3, '/en/racing/2024/brazil', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Brazil%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1250, 2024, 'Las Vegas Grand Prix', 'FORMULA 1 HEINEKEN SILVER LAS VEGAS GRAND PRIX 2024', 43, '2024-11-22 02:30:00', '2024-11-24 07:59:59', -8, '/en/racing/2024/las-vegas', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Las Vegas%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1251, 2024, 'Qatar Grand Prix', 'FORMULA 1 QATAR AIRWAYS QATAR GRAND PRIX 2024', 32, '2024-11-29 13:30:00', '2024-12-01 18:00:00', 3, '/en/racing/2024/qatar', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Qatar%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1252, 2024, 'Abu Dhabi Grand Prix', 'FORMULA 1 ETIHAD AIRWAYS ABU DHABI GRAND PRIX 2024', 41, '2024-12-06 09:30:00', '2024-12-08 15:00:00', 4, '/en/racing/2024/united-arab-emirates', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Abu Dhabi%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1253, 2025, 'Pre-Season Testing', 'FORMULA 1 ARAMCO PRE-SEASON TESTING 2025', 5, '2025-02-26 07:00:00', '2025-02-28 16:00:00', 3, '/en/racing/2025/pre-season-testing', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1254, 2025, 'Australian Grand Prix', 'FORMULA 1 LOUIS VUITTON AUSTRALIAN GRAND PRIX 2025', 2, '2025-03-14 01:30:00', '2025-03-16 06:00:00', 11, '/en/racing/2025/australia', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Australia%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1255, 2025, 'Chinese Grand Prix', 'FORMULA 1 HEINEKEN CHINESE GRAND PRIX 2025', 10, '2025-03-21 03:30:00', '2025-03-23 09:00:00', 8, '/en/racing/2025/china', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/China%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1256, 2025, 'Japanese Grand Prix', 'FORMULA 1 LENOVO JAPANESE GRAND PRIX 2025 ', 22, '2025-04-04 02:30:00', '2025-04-06 07:00:00', 9, '/en/racing/2025/japan', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Japan%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1257, 2025, 'Bahrain Grand Prix', 'FORMULA 1 GULF AIR BAHRAIN GRAND PRIX 2025', 5, '2025-04-11 11:30:00', '2025-04-13 17:00:00', 3, '/en/racing/2025/bahrain', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1258, 2025, 'Saudi Arabian Grand Prix', 'FORMULA 1 STC SAUDI ARABIAN GRAND PRIX 2025', 34, '2025-04-18 13:30:00', '2025-04-20 19:00:00', 3, '/en/racing/2025/saudi-arabia', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Saudi Arabia%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1259, 2025, 'Miami Grand Prix', 'FORMULA 1 CRYPTO.COM MIAMI GRAND PRIX 2025', 43, '2025-05-02 16:30:00', '2025-05-04 22:00:00', -4, '/en/racing/2025/miami', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Miami%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1260, 2025, 'Emilia Romagna Grand Prix', 'FORMULA 1 AWS GRAN PREMIO DEL MADE IN ITALY E DELL\'EMILIA-ROMAGNA 2025', 21, '2025-05-16 11:30:00', '2025-05-18 15:00:00', 2, '/en/racing/2025/emiliaromagna', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia-Romagna%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1261, 2025, 'Monaco Grand Prix', 'FORMULA 1 TAG HEUER GRAND PRIX DE MONACO 2025', 26, '2025-05-23 11:30:00', '2025-05-25 15:00:00', 2, '/en/racing/2025/monaco', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Monaco%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1262, 2025, 'Spanish Grand Prix', 'FORMULA 1 ARAMCO GRAN PREMIO DE ESPAÑA 2025', 37, '2025-05-30 11:30:00', '2025-06-01 15:00:00', 2, '/en/racing/2025/spain', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Spain%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1263, 2025, 'Canadian Grand Prix', 'FORMULA 1 PIRELLI GRAND PRIX DU CANADA 2025', 8, '2025-06-13 17:30:00', '2025-06-15 20:00:00', -4, '/en/racing/2025/canada', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Canada%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1264, 2025, 'Austrian Grand Prix', 'FORMULA 1 MSC CRUISES AUSTRIAN GRAND PRIX 2025', 3, '2025-06-27 11:30:00', '2025-06-29 15:00:00', 2, '/en/racing/2025/austria', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Austria%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1265, 2025, 'Belgian Grand Prix', 'FORMULA 1 MOËT & CHANDON BELGIAN GRAND PRIX 2025', 6, '2025-07-25 10:30:00', '2025-07-27 15:00:00', 2, '/en/racing/2025/belgium', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Belgium%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1266, 2025, 'Hungarian Grand Prix', 'FORMULA 1 LENOVO HUNGARIAN GRAND PRIX 2025', 17, '2025-08-01 11:30:00', '2025-08-03 15:00:00', 2, '/en/racing/2025/hungary', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Hungary%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1267, 2025, 'Dutch Grand Prix', 'FORMULA 1 HEINEKEN DUTCH GRAND PRIX 2025', 28, '2025-08-29 10:30:00', '2025-08-31 15:00:00', 2, '/en/racing/2025/netherlands', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Netherlands%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1268, 2025, 'Italian Grand Prix', 'FORMULA 1 PIRELLI GRAN PREMIO D’ITALIA 2025', 21, '2025-09-05 11:30:00', '2025-09-07 15:00:00', 2, '/en/racing/2025/italy', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Italy%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1269, 2025, 'Azerbaijan Grand Prix', 'FORMULA 1 QATAR AIRWAYS AZERBAIJAN GRAND PRIX 2025', 4, '2025-09-19 08:30:00', '2025-09-21 13:00:00', 4, '/en/racing/2025/azerbaijan', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Azerbaijan%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1270, 2025, 'Singapore Grand Prix', 'FORMULA 1 SINGAPORE AIRLINES SINGAPORE GRAND PRIX 2025', 35, '2025-10-03 09:30:00', '2025-10-05 14:00:00', 8, '/en/racing/2025/singapore', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Singapore%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1271, 2025, 'United States Grand Prix', 'FORMULA 1 MSC CRUISES UNITED STATES GRAND PRIX 2025', 43, '2025-10-17 17:30:00', '2025-10-19 21:00:00', -5, '/en/racing/2025/united-states', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/United States%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1272, 2025, 'Mexico City Grand Prix', 'FORMULA 1 GRAN PREMIO DE LA CIUDAD DE MÉXICO 2025', 25, '2025-10-24 18:30:00', '2025-10-26 22:00:00', -6, '/en/racing/2025/mexico', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Mexico%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1273, 2025, 'São Paulo Grand Prix', 'FORMULA 1 MSC CRUISES GRANDE PRÊMIO DE SÃO PAULO 2025', 7, '2025-11-07 14:30:00', '2025-11-09 19:00:00', -3, '/en/racing/2025/brazil', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Brazil%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1274, 2025, 'Las Vegas Grand Prix', 'FORMULA 1 HEINEKEN LAS VEGAS GRAND PRIX 2025', 43, '2025-11-21 00:30:00', '2025-11-23 06:00:00', -8, '/en/racing/2025/las-vegas', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Las Vegas%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1275, 2025, 'Qatar Grand Prix', 'FORMULA 1 QATAR AIRWAYS QATAR GRAND PRIX 2025', 32, '2025-11-28 13:30:00', '2025-11-30 18:00:00', 3, '/en/racing/2025/qatar', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Qatar%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1276, 2025, 'Abu Dhabi Grand Prix', 'FORMULA 1 ETIHAD AIRWAYS ABU DHABI GRAND PRIX 2025 ', 41, '2025-12-05 09:30:00', '2025-12-07 15:00:00', 4, '/en/racing/2025/united-arab-emirates', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Abu Dhabi%20carbon.png');
INSERT INTO `events` (`Key`, `Season`, `Name`, `OfficialName`, `Location`, `Start`, `End`, `TimeOffset`, `Profile`, `Circuit`) VALUES
	(1277, 2025, 'British Grand Prix', 'FORMULA 1 QATAR AIRWAYS BRITISH GRAND PRIX 2025', 42, '2025-07-04 11:30:00', '2025-07-06 16:00:00', 1, '/en/racing/2025/great-britain', 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Great Britain%20carbon.png');

-- Dumping structure for table f1.events_awards
CREATE TABLE IF NOT EXISTS `events_awards` (
  `Key` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `EventKey` int unsigned NOT NULL,
  `RewardType` int unsigned NOT NULL,
  `Title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'itemTitle',
  `Winner` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'winnerName',
  `Time` int unsigned DEFAULT NULL COMMENT 'winnerTime',
  PRIMARY KEY (`Key`),
  UNIQUE KEY `EventKey_RewardType` (`EventKey`,`RewardType`),
  KEY `EventKey` (`EventKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.events_awards: ~72 rows (approximately)
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1229_DRIVER_OF_THE_DAY', 1229, 3, 'Bahrain 2024 Driver of the Day', 'CARLOS SAINZ', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1229_FASTEST_LAP', 1229, 2, 'Bahrain 2024 Fastest Lap', 'VERSTAPPEN', 92608);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1229_FASTEST_PIT_STOP', 1229, 1, 'Bahrain 2024 Fastest Pit Stop', 'FERRARI', 2230);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1230_DRIVER_OF_THE_DAY', 1230, 3, 'Saudi Arabia 2024 Driver of the Day', 'OLIVER BEARMAN', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1230_FASTEST_LAP', 1230, 2, 'Saudi Arabia 2024 Fastest Lap', 'LECLERC', 91632);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1230_FASTEST_PIT_STOP', 1230, 1, 'Saudi Arabia 2024 Fastest Pit Stop', 'RED BULL', 2440);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1231_DRIVER_OF_THE_DAY', 1231, 3, 'Australia 2024 Driver of the Day', 'CARLOS SAINZ', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1231_FASTEST_LAP', 1231, 2, 'Australia 2024 Fastest Lap', 'LECLERC', 79813);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1231_FASTEST_PIT_STOP', 1231, 1, 'Australia 2024 Fastest Pit Stop', 'RED BULL', 2100);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1232_DRIVER_OF_THE_DAY', 1232, 3, 'Japan 2024 Driver of the Day', 'CHARLES LECLERC', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1232_FASTEST_LAP', 1232, 2, 'Japan 2024 Fastest Lap', 'VERSTAPPEN', 93706);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1232_FASTEST_PIT_STOP', 1232, 1, 'Japan 2024 Fastest Pit Stop', 'RED BULL', 2080);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1233_DRIVER_OF_THE_DAY', 1233, 3, 'China 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1233_FASTEST_LAP', 1233, 2, 'China 2024 Fastest Lap', 'ALONSO', 97810);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1233_FASTEST_PIT_STOP', 1233, 1, 'China 2024 Fastest Pit Stop', 'RED BULL', 1900);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1234_DRIVER_OF_THE_DAY', 1234, 3, 'Miami 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1234_FASTEST_LAP', 1234, 2, 'Miami 2024 Fastest Lap', 'PIASTRI', 90634);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1234_FASTEST_PIT_STOP', 1234, 1, 'Miami 2024 Fastest Pit Stop', 'FERRARI', 1940);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1235_DRIVER_OF_THE_DAY', 1235, 3, 'Emilia Romagna 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1235_FASTEST_LAP', 1235, 2, 'Emilia Romagna 2024 Fastest Lap', 'RUSSELL', 78589);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1235_FASTEST_PIT_STOP', 1235, 1, 'Emilia Romagna 2024 Fastest Pit Stop', 'RED BULL', 2090);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1236_DRIVER_OF_THE_DAY', 1236, 3, 'Monaco 2024 Driver of the Day', 'CHARLES LECLERC', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1236_FASTEST_LAP', 1236, 2, 'Monaco 2024 Fastest Lap', 'HAMILTON', 74165);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1236_FASTEST_PIT_STOP', 1236, 1, 'Monaco 2024 Fastest Pit Stop', 'RED BULL', 2100);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1237_DRIVER_OF_THE_DAY', 1237, 3, 'Canada 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1237_FASTEST_LAP', 1237, 2, 'Canada 2024 Fastest Lap', 'HAMILTON', 74856);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1237_FASTEST_PIT_STOP', 1237, 1, 'Canada 2024 Fastest Pit Stop', 'FERRARI', 2210);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1238_DRIVER_OF_THE_DAY', 1238, 3, 'Spain 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1238_FASTEST_LAP', 1238, 2, 'Spain 2024 Fastest Lap', 'NORRIS', 77115);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1238_FASTEST_PIT_STOP', 1238, 1, 'Spain 2024 Fastest Pit Stop', 'RED BULL RACING', 1920);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1239_DRIVER_OF_THE_DAY', 1239, 3, 'Austria 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1239_FASTEST_LAP', 1239, 2, 'Austria 2024 Fastest Lap', 'ALONSO', 67694);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1239_FASTEST_PIT_STOP', 1239, 1, 'Austria 2024 Fastest Pit Stop', 'FERRARI', 1950);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1240_DRIVER_OF_THE_DAY', 1240, 3, 'Great Britain 2024 Driver of the Day', 'LEWIS HAMILTON', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1240_FASTEST_LAP', 1240, 2, 'Great Britain 2024 Fastest Lap', 'SAINZ', 88293);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1240_FASTEST_PIT_STOP', 1240, 1, 'Great Britain 2024 Fastest Pit Stop', 'RED BULL', 1990);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1241_DRIVER_OF_THE_DAY', 1241, 3, 'Hungary 2024 Driver of the Day', 'OSCAR PIASTRI', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1241_FASTEST_LAP', 1241, 2, 'Hungary 2024 Fastest Lap', 'RUSSELL', 80305);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1241_FASTEST_PIT_STOP', 1241, 1, 'Hungary 2024 Fastest Pit Stop', 'RB', 2010);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1242_DRIVER_OF_THE_DAY', 1242, 3, 'Belgium 2024 Driver of the Day', 'LEWIS HAMILTON', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1242_FASTEST_LAP', 1242, 2, 'Belgium 2024 Fastest Lap', 'PEREZ', 104701);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1242_FASTEST_PIT_STOP', 1242, 1, 'Belgium 2024 Fastest Pit Stop', 'McLAREN', 2050);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1243_DRIVER_OF_THE_DAY', 1243, 3, 'Netherlands 2024 Driver of the Day', 'LANDO NORRIS', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1243_FASTEST_LAP', 1243, 2, 'Netherlands 2024 Fastest Lap', 'NORRIS', 73817);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1243_FASTEST_PIT_STOP', 1243, 1, 'Netherlands 2024 Fastest Pit Stop', 'RB', 2180);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1244_DRIVER_OF_THE_DAY', 1244, 3, 'Italy 2024 Driver of the Day', 'CHARLES LECLERC', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1244_FASTEST_LAP', 1244, 2, 'Italy 2024 Fastest Lap', 'NORRIS', 81432);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1244_FASTEST_PIT_STOP', 1244, 1, 'Italy 2024 Fastest Pit Stop', 'ALPINE', 2010);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1245_DRIVER_OF_THE_DAY', 1245, 3, 'Azerbaijan 2024 Driver of the Day', 'OSCAR PIASTRI', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1245_FASTEST_LAP', 1245, 2, 'Azerbaijan 2024 Fastest Lap', 'NORRIS', 105255);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1245_FASTEST_PIT_STOP', 1245, 1, 'Azerbaijan 2024 Fastest Pit Stop', 'KICK SAUBER', 2320);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1246_DRIVER_OF_THE_DAY', 1246, 3, 'Singapore 2024 Driver of the Day', 'DANIEL RICCIARDO', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1246_FASTEST_LAP', 1246, 2, 'Singapore 2024 Fastest Lap', 'RICCIARDO', 94486);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1246_FASTEST_PIT_STOP', 1246, 1, 'Singapore 2024 Fastest Pit Stop', 'McLAREN', 2110);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1247_DRIVER_OF_THE_DAY', 1247, 3, 'United States 2024 Driver of the Day', 'CHARLES LECLERC', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1247_FASTEST_LAP', 1247, 2, 'United States 2024 Fastest Lap', 'OCON', 97330);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1247_FASTEST_PIT_STOP', 1247, 1, 'United States 2024 Fastest Pit Stop', 'McLAREN', 2210);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1248_DRIVER_OF_THE_DAY', 1248, 3, 'Mexico 2024 Driver of the Day', 'CARLOS SAINZ', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1248_FASTEST_LAP', 1248, 2, 'Mexico 2024 Fastest Lap', 'LECLERC', 78336);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1248_FASTEST_PIT_STOP', 1248, 1, 'Mexico 2024 Fastest Pit Stop', 'McLAREN', 1900);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1249_DRIVER_OF_THE_DAY', 1249, 3, 'Brazil 2024 Driver of the Day', 'MAX VERSTAPPEN', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1249_FASTEST_LAP', 1249, 2, 'Brazil 2024 Fastest Lap', 'VERSTAPPEN', 80472);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1249_FASTEST_PIT_STOP', 1249, 1, 'Brazil 2024 Fastest Pit Stop', 'KICK SAUBER', 2520);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1250_DRIVER_OF_THE_DAY', 1250, 3, 'Las Vegas 2024 Driver of the Day', 'LEWIS HAMILTON', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1250_FASTEST_LAP', 1250, 2, 'Las Vegas 2024 Fastest Lap', 'NORRIS', 94876);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1250_FASTEST_PIT_STOP', 1250, 1, 'Las Vegas 2024 Fastest Pit Stop', 'RED BULL RACING', 2090);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1251_DRIVER_OF_THE_DAY', 1251, 3, 'Qatar 2024 Driver of the Day', 'ZHOU GUANYU', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1251_FASTEST_LAP', 1251, 2, 'Qatar 2024 Fastest Lap', 'NORRIS', 82384);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1251_FASTEST_PIT_STOP', 1251, 1, 'Qatar 2024 Fastest Pit Stop', 'RED BULL RACING', 2290);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1252_DRIVER_OF_THE_DAY', 1252, 3, 'Abu Dhabi 2024 Driver of the Day', 'CHARLES LECLERC', 0);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1252_FASTEST_LAP', 1252, 2, 'Abu Dhabi 2024 Fastest Lap', 'MAGNUSSEN', 85637);
INSERT INTO `events_awards` (`Key`, `EventKey`, `RewardType`, `Title`, `Winner`, `Time`) VALUES
	('1252_FASTEST_PIT_STOP', 1252, 1, 'Abu Dhabi 2024 Fastest Pit Stop', 'McLAREN', 2080);

-- Dumping structure for table f1.events_results
CREATE TABLE IF NOT EXISTS `events_results` (
  `Key` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `EventKey` int unsigned NOT NULL,
  `DriverKey` int unsigned NOT NULL,
  `Position` int unsigned NOT NULL,
  `Points` int unsigned DEFAULT '0',
  `Laps` int DEFAULT '0',
  `Time` int DEFAULT '0',
  PRIMARY KEY (`Key`),
  UNIQUE KEY `grandprix_driver_points` (`EventKey`,`DriverKey`,`Position`) USING BTREE,
  KEY `EventKey` (`EventKey`),
  KEY `FK_events_results_drivers` (`DriverKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.events_results: ~479 rows (approximately)
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_1', 1229, 902, 1, 26, 57, 5504742);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_10', 1229, 956, 10, 1, 57, 5597958);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_11', 1229, 1025, 11, 0, 56, 5511501);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_12', 1229, 888, 12, 0, 56, 5513058);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_13', 1229, 18, 13, 0, 56, 5513700);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_14', 1229, 1024, 14, 0, 56, 5514224);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_15', 1229, 982, 15, 0, 56, 5516628);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_16', 1229, 16, 16, 0, 56, 5522374);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_17', 1229, 905, 17, 0, 56, 5536192);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_18', 1229, 951, 18, 0, 56, 5537159);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_19', 1229, 850, 19, 0, 56, 5587972);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_2', 1229, 9, 2, 18, 57, 5527199);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_20', 1229, 1032, 20, 0, 55, 5525537);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_3', 1229, 907, 3, 15, 57, 5529852);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_4', 1229, 955, 4, 12, 57, 5544411);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_5', 1229, 960, 5, 10, 57, 5551530);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_6', 1229, 981, 6, 8, 57, 5553200);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_7', 1229, 4, 7, 6, 57, 5555066);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_8', 1229, 1039, 8, 4, 57, 5560824);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1229_r_9', 1229, 1, 9, 2, 57, 5579629);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_1', 1230, 902, 1, 25, 50, 4843273);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_10', 1230, 16, 10, 1, 50, 4920269);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_11', 1230, 982, 11, 0, 50, 4931627);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_12', 1230, 888, 12, 0, 50, 4949010);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_13', 1230, 905, 13, 0, 49, 4847274);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_14', 1230, 1032, 14, 0, 49, 4850058);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_15', 1230, 1024, 15, 0, 49, 4853806);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_16', 1230, 18, 16, 0, 49, 4863988);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_17', 1230, 850, 17, 0, 49, 4866388);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_18', 1230, 1025, 18, 0, 49, 4872826);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_19', 1230, 956, 19, 0, 5, 485608);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_2', 1230, 9, 2, 18, 50, 4856916);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_20', 1230, 951, 20, 0, 1, 121453);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_3', 1230, 955, 3, 16, 50, 4861912);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_4', 1230, 1039, 4, 12, 50, 4875280);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_5', 1230, 1, 5, 10, 50, 4879032);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_6', 1230, 960, 6, 8, 50, 4883209);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_7', 1230, 1041, 7, 6, 50, 4885952);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_8', 1230, 981, 8, 4, 50, 4888981);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1230_r_9', 1230, 4, 9, 2, 50, 4890664);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_1', 1231, 907, 1, 25, 58, 4826843);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_10', 1231, 888, 10, 1, 57, 4830924);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_11', 1231, 982, 11, 0, 57, 4831852);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_12', 1231, 18, 12, 0, 57, 4838351);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_13', 1231, 951, 13, 0, 57, 4867796);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_14', 1231, 850, 14, 0, 57, 4869169);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_15', 1231, 1025, 15, 0, 57, 4871136);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_16', 1231, 905, 16, 0, 57, 4880822);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_17', 1231, 960, 17, 0, 56, 4684734);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_18', 1231, 4, 18, 0, 15, 1278426);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_19', 1231, 902, 19, 0, 3, 254672);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_2', 1231, 955, 2, 19, 58, 4829209);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_3', 1231, 981, 3, 15, 58, 4832747);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_4', 1231, 1039, 4, 12, 58, 4862613);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_5', 1231, 9, 5, 10, 58, 4883152);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_6', 1231, 956, 6, 8, 58, 4920065);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_7', 1231, 1024, 7, 6, 58, 4922444);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_8', 1231, 1, 8, 4, 58, 4927835);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1231_r_9', 1231, 16, 9, 2, 58, 4931396);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_1', 1232, 902, 1, 26, 53, 6863566);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_10', 1232, 1024, 10, 1, 52, 6865168);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_11', 1232, 16, 11, 0, 52, 6870734);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_12', 1232, 956, 12, 0, 52, 6874799);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_13', 1232, 888, 13, 0, 52, 6881485);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_14', 1232, 850, 14, 0, 52, 6882459);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_15', 1232, 905, 15, 0, 52, 6904718);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_16', 1232, 951, 16, 0, 52, 6918632);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_17', 1232, 1032, 17, 0, 52, 6936331);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_18', 1232, 1025, 18, 0, 12, 2969022);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_19', 1232, 18, 19, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_2', 1232, 9, 2, 18, 53, 6876101);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_20', 1232, 982, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_3', 1232, 907, 3, 15, 53, 6884432);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_4', 1232, 955, 4, 12, 53, 6890088);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_5', 1232, 981, 5, 10, 53, 6893266);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_6', 1232, 1, 6, 8, 53, 6907838);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_7', 1232, 960, 7, 6, 53, 6909517);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_8', 1232, 1039, 8, 4, 53, 6911091);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1232_r_9', 1232, 4, 9, 2, 53, 6912192);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_1', 1233, 902, 1, 25, 56, 6052554);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_10', 1233, 16, 10, 1, 56, 6113030);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_11', 1233, 905, 11, 0, 56, 6115366);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_12', 1233, 982, 12, 0, 56, 6118060);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_13', 1233, 951, 13, 0, 56, 6121777);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_14', 1233, 1025, 14, 0, 56, 6124243);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_15', 1233, 956, 15, 0, 56, 6135340);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_16', 1233, 888, 16, 0, 56, 6140087);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_17', 1233, 1032, 17, 0, 56, 6147664);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_18', 1233, 18, 18, 0, 33, 3797069);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_19', 1233, 1024, 19, 0, 26, 2887215);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_2', 1233, 981, 2, 18, 56, 6066327);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_20', 1233, 850, 20, 0, 19, 1978520);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_3', 1233, 9, 3, 15, 56, 6071714);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_4', 1233, 955, 4, 12, 56, 6076177);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_5', 1233, 907, 5, 10, 56, 6086537);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_6', 1233, 960, 6, 8, 56, 6091278);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_7', 1233, 1, 7, 7, 56, 6095968);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_8', 1233, 1039, 8, 4, 56, 6108752);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1233_r_9', 1233, 4, 9, 2, 56, 6110540);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_1', 1234, 981, 1, 25, 57, 5449876);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_10', 1234, 905, 10, 1, 57, 5489622);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_11', 1234, 16, 11, 0, 57, 5490665);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_12', 1234, 951, 12, 0, 57, 5494834);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_13', 1234, 1039, 13, 0, 57, 5499632);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_14', 1234, 1025, 14, 0, 57, 5499855);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_15', 1234, 18, 15, 0, 57, 5500832);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_16', 1234, 850, 16, 0, 57, 5502232);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_17', 1234, 956, 17, 0, 57, 5505049);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_18', 1234, 982, 18, 0, 57, 5525967);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_19', 1234, 888, 19, 0, 57, 5534559);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_2', 1234, 902, 2, 18, 57, 5457488);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_20', 1234, 1032, 20, 0, 27, 2583540);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_3', 1234, 955, 3, 15, 57, 5459796);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_4', 1234, 9, 4, 12, 57, 5464526);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_5', 1234, 907, 5, 10, 57, 5466283);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_6', 1234, 4, 6, 8, 57, 5466461);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_7', 1234, 1024, 7, 6, 57, 5476061);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_8', 1234, 960, 8, 4, 57, 5484665);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1234_r_9', 1234, 1, 9, 2, 57, 5486983);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_1', 1235, 902, 1, 25, 63, 5125252);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_10', 1235, 1024, 10, 1, 62, 5143108);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_11', 1235, 16, 11, 0, 62, 5150529);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_12', 1235, 888, 12, 0, 62, 5151686);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_13', 1235, 18, 13, 0, 62, 5152913);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_14', 1235, 905, 14, 0, 62, 5169159);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_15', 1235, 1025, 15, 0, 62, 5170185);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_16', 1235, 951, 16, 0, 62, 5174967);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_17', 1235, 1032, 17, 0, 62, 5176303);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_18', 1235, 850, 18, 0, 62, 5181595);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_19', 1235, 1, 19, 0, 62, 5200376);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_2', 1235, 981, 2, 18, 63, 5125977);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_20', 1235, 982, 20, 0, 51, 4387729);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_3', 1235, 955, 3, 15, 63, 5133168);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_4', 1235, 1039, 4, 12, 63, 5139384);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_5', 1235, 907, 5, 10, 63, 5147577);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_6', 1235, 4, 6, 8, 63, 5160356);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_7', 1235, 960, 7, 7, 63, 5172406);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_8', 1235, 9, 8, 4, 63, 5180028);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1235_r_9', 1235, 956, 9, 2, 63, 5204808);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_1', 1236, 955, 1, 25, 78, 8595554);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_10', 1236, 951, 10, 1, 77, 8655795);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_11', 1236, 1, 11, 0, 76, 8599408);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_12', 1236, 18, 12, 0, 76, 8599818);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_13', 1236, 850, 13, 0, 76, 8600042);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_14', 1236, 956, 14, 0, 76, 8601521);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_15', 1236, 1032, 15, 0, 76, 8604580);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_16', 1236, 1025, 16, 0, 76, 8650814);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_17', 1236, 905, 17, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_18', 1236, 9, 18, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_19', 1236, 16, 19, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_2', 1236, 1039, 2, 18, 78, 8602706);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_20', 1236, 888, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_3', 1236, 907, 3, 15, 78, 8603139);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_4', 1236, 981, 4, 12, 78, 8604204);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_5', 1236, 960, 5, 10, 78, 8608863);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_6', 1236, 902, 6, 8, 78, 8609407);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_7', 1236, 4, 7, 7, 78, 8610462);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_8', 1236, 1024, 8, 4, 77, 8635041);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1236_r_9', 1236, 982, 9, 2, 77, 8649606);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_1', 1237, 902, 1, 25, 70, 6347927);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_10', 1237, 905, 10, 1, 70, 6378240);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_11', 1237, 16, 11, 0, 70, 6378751);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_12', 1237, 888, 12, 0, 70, 6379180);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_13', 1237, 850, 13, 0, 70, 6388414);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_14', 1237, 1024, 14, 0, 70, 6400621);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_15', 1237, 1025, 15, 0, 69, 6401455);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_16', 1237, 907, 16, 0, 52, 4788472);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_17', 1237, 982, 17, 0, 52, 4789040);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_18', 1237, 9, 18, 0, 51, 4710768);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_19', 1237, 955, 19, 0, 40, 3843308);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_2', 1237, 981, 2, 18, 70, 6351806);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_20', 1237, 1032, 20, 0, 23, 2164519);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_3', 1237, 960, 3, 15, 70, 6352244);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_4', 1237, 4, 4, 13, 70, 6352842);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_5', 1237, 1039, 5, 10, 70, 6358126);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_6', 1237, 1, 6, 8, 70, 6365437);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_7', 1237, 956, 7, 6, 70, 6371552);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_8', 1237, 18, 8, 4, 70, 6376599);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1237_r_9', 1237, 951, 9, 2, 70, 6377948);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_1', 1238, 902, 1, 25, 66, 5300227);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_10', 1238, 905, 10, 1, 66, 5372116);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_11', 1238, 16, 11, 0, 66, 5379442);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_12', 1238, 1, 12, 0, 65, 5309724);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_13', 1238, 1025, 13, 0, 65, 5315703);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_14', 1238, 956, 14, 0, 65, 5325479);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_15', 1238, 18, 15, 0, 65, 5344277);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_16', 1238, 850, 16, 0, 65, 5353540);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_17', 1238, 888, 17, 0, 65, 5355015);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_18', 1238, 982, 18, 0, 65, 5358376);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_19', 1238, 1024, 19, 0, 65, 5369131);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_2', 1238, 981, 2, 19, 66, 5302446);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_20', 1238, 1032, 20, 0, 64, 5305093);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_3', 1238, 4, 3, 15, 66, 5318017);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_4', 1238, 960, 4, 12, 66, 5322547);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_5', 1238, 955, 5, 10, 66, 5322936);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_6', 1238, 907, 6, 8, 66, 5331255);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_7', 1238, 1039, 7, 6, 66, 5333987);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_8', 1238, 9, 8, 4, 66, 5359751);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1238_r_9', 1238, 951, 9, 2, 66, 5362252);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_1', 1239, 960, 1, 25, 71, 5062798);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_10', 1239, 951, 10, 1, 71, 5124564);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_11', 1239, 955, 11, 0, 71, 5129854);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_12', 1239, 905, 12, 0, 71, 5131123);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_13', 1239, 956, 13, 0, 70, 5073032);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_14', 1239, 1024, 14, 0, 70, 5075943);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_15', 1239, 982, 15, 0, 70, 5078664);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_16', 1239, 850, 16, 0, 70, 5082173);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_17', 1239, 1025, 17, 0, 70, 5107680);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_18', 1239, 1, 18, 0, 70, 5110458);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_19', 1239, 1032, 19, 0, 69, 5069107);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_2', 1239, 1039, 2, 18, 71, 5064704);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_20', 1239, 981, 20, 0, 64, 4596054);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_3', 1239, 907, 3, 15, 71, 5067331);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_4', 1239, 4, 4, 12, 71, 5085940);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_5', 1239, 902, 5, 10, 71, 5100051);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_6', 1239, 16, 6, 8, 71, 5116886);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_7', 1239, 9, 7, 6, 71, 5117470);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_8', 1239, 888, 8, 4, 71, 5123153);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1239_r_9', 1239, 18, 9, 2, 71, 5123967);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_1', 1240, 4, 1, 25, 52, 4947059);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_10', 1240, 1024, 10, 1, 52, 5026362);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_11', 1240, 1032, 11, 0, 52, 5036019);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_12', 1240, 888, 12, 0, 52, 5037212);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_13', 1240, 18, 13, 0, 51, 4956996);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_14', 1240, 955, 14, 0, 51, 4987532);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_15', 1240, 850, 15, 0, 51, 4988880);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_16', 1240, 905, 16, 0, 50, 4957741);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_17', 1240, 9, 17, 0, 50, 4965064);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_18', 1240, 1025, 18, 0, 50, 5001535);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_19', 1240, 960, 19, 0, 33, 3171677);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_2', 1240, 902, 2, 18, 52, 4948524);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_20', 1240, 951, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_3', 1240, 981, 3, 15, 52, 4954606);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_4', 1240, 1039, 4, 12, 52, 4959488);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_5', 1240, 907, 5, 11, 52, 4994377);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_6', 1240, 16, 6, 8, 52, 5002781);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_7', 1240, 956, 7, 6, 52, 5003628);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_8', 1240, 1, 8, 4, 52, 5010636);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1240_r_9', 1240, 982, 9, 2, 52, 5015446);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_1', 1241, 1039, 1, 25, 70, 5881989);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_10', 1241, 956, 10, 1, 70, 5959965);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_11', 1241, 1, 11, 0, 70, 5964449);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_12', 1241, 18, 12, 0, 69, 5899913);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_13', 1241, 16, 13, 0, 69, 5915173);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_14', 1241, 982, 14, 0, 69, 5918758);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_15', 1241, 888, 15, 0, 69, 5927291);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_16', 1241, 850, 16, 0, 69, 5927398);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_17', 1241, 1032, 17, 0, 69, 5934580);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_18', 1241, 905, 18, 0, 69, 5942918);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_19', 1241, 1025, 19, 0, 69, 5945587);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_2', 1241, 981, 2, 18, 70, 5884130);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_20', 1241, 951, 20, 0, 33, 2859255);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_3', 1241, 4, 3, 15, 70, 5896869);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_4', 1241, 955, 4, 12, 70, 5901675);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_5', 1241, 902, 5, 10, 70, 5903338);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_6', 1241, 907, 6, 8, 70, 5905062);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_7', 1241, 9, 7, 6, 70, 5921781);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_8', 1241, 960, 8, 5, 70, 5924357);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1241_r_9', 1241, 1024, 9, 2, 70, 5959248);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_1', 1242, 960, 1, 0, 44, 4797040);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_10', 1242, 905, 10, 2, 44, 4849592);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_11', 1242, 18, 11, 1, 44, 4851966);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_12', 1242, 956, 12, 0, 44, 4860051);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_13', 1242, 982, 13, 0, 44, 4860691);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_14', 1242, 951, 14, 0, 44, 4861405);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_15', 1242, 888, 15, 0, 44, 4863671);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_16', 1242, 850, 16, 0, 44, 4867678);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_17', 1242, 1024, 17, 0, 44, 4873777);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_18', 1242, 1032, 18, 0, 44, 4883097);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_19', 1242, 16, 19, 0, 44, 4885873);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_2', 1242, 4, 2, 25, 44, 4797566);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_20', 1242, 1025, 20, 0, 5, 660351);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_3', 1242, 1039, 3, 18, 44, 4798213);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_4', 1242, 955, 4, 15, 44, 4805589);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_5', 1242, 902, 5, 12, 44, 4806266);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_6', 1242, 981, 6, 10, 44, 4806890);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_7', 1242, 907, 7, 8, 44, 4816835);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_8', 1242, 9, 8, 7, 44, 4840235);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1242_r_9', 1242, 1, 9, 4, 44, 4847003);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_1', 1243, 981, 1, 26, 72, 5445519);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_10', 1243, 1, 10, 1, 71, 5459052);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_11', 1243, 16, 11, 0, 71, 5464733);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_12', 1243, 18, 12, 0, 71, 5466586);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_13', 1243, 956, 13, 0, 71, 5471231);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_14', 1243, 982, 14, 0, 71, 5486230);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_15', 1243, 905, 15, 0, 71, 5492397);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_16', 1243, 1032, 16, 0, 71, 5510058);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_17', 1243, 1024, 17, 0, 71, 5510665);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_18', 1243, 888, 18, 0, 71, 5511226);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_19', 1243, 850, 19, 0, 70, 5448767);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_2', 1243, 902, 2, 18, 72, 5468415);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_20', 1243, 1025, 20, 0, 70, 5481538);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_3', 1243, 955, 3, 15, 72, 5470958);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_4', 1243, 1039, 4, 12, 72, 5472856);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_5', 1243, 907, 5, 10, 72, 5477656);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_6', 1243, 9, 6, 8, 72, 5485061);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_7', 1243, 960, 7, 6, 72, 5490136);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_8', 1243, 4, 8, 4, 72, 5495118);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1243_r_9', 1243, 951, 9, 2, 71, 5454123);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_1', 1244, 955, 1, 25, 53, 4480727);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_10', 1244, 888, 10, 1, 53, 4549029);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_11', 1244, 1, 11, 0, 53, 4549222);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_12', 1244, 1079, 12, 0, 53, 4562035);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_13', 1244, 18, 13, 0, 53, 4574179);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_14', 1244, 905, 14, 0, 52, 4493386);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_15', 1244, 951, 15, 0, 52, 4499071);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_16', 1244, 850, 16, 0, 52, 4507938);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_17', 1244, 16, 17, 0, 52, 4511597);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_18', 1244, 1025, 18, 0, 52, 4520782);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_19', 1244, 956, 19, 0, 52, 4524235);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_2', 1244, 1039, 2, 18, 53, 4483391);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_20', 1244, 1024, 20, 0, 7, 636669);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_3', 1244, 981, 3, 16, 53, 4486880);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_4', 1244, 907, 4, 12, 53, 4496348);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_5', 1244, 4, 5, 10, 53, 4503547);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_6', 1244, 902, 6, 8, 53, 4518659);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_7', 1244, 960, 7, 6, 53, 4520442);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_8', 1244, 9, 8, 4, 53, 4534875);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1244_r_9', 1244, 982, 9, 2, 53, 4548183);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_1', 1245, 1039, 1, 25, 51, 5578007);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_10', 1245, 1041, 10, 1, 51, 5671134);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_11', 1245, 16, 11, 0, 51, 5671472);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_12', 1245, 951, 12, 0, 51, 5695196);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_13', 1245, 18, 13, 0, 51, 5724914);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_14', 1245, 1025, 14, 0, 51, 5726848);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_15', 1245, 905, 15, 0, 50, 5599351);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_16', 1245, 850, 16, 0, 50, 5603402);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_17', 1245, 9, 17, 0, 49, 5321198);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_18', 1245, 907, 18, 0, 49, 5321768);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_19', 1245, 956, 19, 0, 45, 5001080);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_2', 1245, 955, 2, 18, 51, 5588917);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_20', 1245, 1024, 20, 0, 14, 1622651);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_3', 1245, 960, 3, 15, 51, 5609335);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_4', 1245, 981, 4, 13, 51, 5614150);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_5', 1245, 902, 5, 10, 51, 5655105);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_6', 1245, 1, 6, 8, 51, 5663475);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_7', 1245, 982, 7, 6, 51, 5665403);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_8', 1245, 1079, 8, 4, 51, 5667548);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1245_r_9', 1245, 4, 9, 2, 51, 5670408);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_1', 1246, 981, 1, 25, 62, 6052571);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_10', 1246, 9, 10, 1, 61, 6057195);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_11', 1246, 1079, 11, 0, 61, 6058855);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_12', 1246, 1024, 12, 0, 61, 6061363);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_13', 1246, 905, 13, 0, 61, 6096576);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_14', 1246, 956, 14, 0, 61, 6100142);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_15', 1246, 1025, 15, 0, 61, 6109791);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_16', 1246, 850, 16, 0, 61, 6110400);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_17', 1246, 951, 17, 0, 61, 6111630);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_18', 1246, 18, 18, 0, 61, 6142367);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_19', 1246, 888, 19, 0, 57, 5811906);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_2', 1246, 902, 2, 18, 62, 6073516);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_20', 1246, 982, 20, 0, 15, 1560703);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_3', 1246, 1039, 3, 15, 62, 6094394);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_4', 1246, 960, 4, 12, 62, 6113611);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_5', 1246, 955, 5, 10, 62, 6115001);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_6', 1246, 4, 6, 8, 62, 6137819);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_7', 1246, 907, 7, 6, 62, 6148610);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_8', 1246, 1, 8, 4, 61, 6053444);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1246_r_9', 1246, 16, 9, 2, 61, 6055711);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_1', 1247, 955, 1, 25, 56, 5709639);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_10', 1247, 1079, 10, 1, 56, 5781618);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_11', 1247, 888, 11, 0, 56, 5789421);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_12', 1247, 951, 12, 0, 56, 5800197);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_13', 1247, 1, 13, 0, 55, 5711365);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_14', 1247, 1024, 14, 0, 55, 5717851);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_15', 1247, 956, 15, 0, 55, 5726622);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_16', 1247, 982, 16, 0, 55, 5727731);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_17', 1247, 850, 17, 0, 55, 5743972);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_18', 1247, 905, 18, 0, 55, 5751751);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_19', 1247, 1025, 19, 0, 55, 5758879);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_2', 1247, 907, 2, 18, 56, 5718201);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_20', 1247, 4, 20, 0, 1, 108064);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_3', 1247, 902, 3, 15, 56, 5729051);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_4', 1247, 981, 4, 12, 56, 5729993);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_5', 1247, 1039, 5, 10, 56, 5731560);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_6', 1247, 960, 6, 8, 56, 5765934);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_7', 1247, 9, 7, 6, 56, 5768711);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_8', 1247, 16, 8, 4, 56, 5772596);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1247_r_9', 1247, 1029, 9, 2, 56, 5780202);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_1', 1248, 907, 1, 25, 71, 6055800);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_10', 1248, 951, 10, 1, 70, 6074387);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_11', 1248, 956, 11, 0, 70, 6080872);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_12', 1248, 1079, 12, 0, 70, 6093297);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_13', 1248, 905, 13, 0, 70, 6095463);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_14', 1248, 850, 14, 0, 70, 6098027);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_15', 1248, 1025, 15, 0, 70, 6117522);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_16', 1248, 1029, 16, 0, 70, 6120266);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_17', 1248, 9, 17, 0, 70, 6129084);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_18', 1248, 1, 18, 0, 15, 1526239);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_19', 1248, 982, 19, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_2', 1248, 981, 2, 18, 71, 6060505);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_20', 1248, 1024, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_3', 1248, 955, 3, 16, 71, 6090187);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_4', 1248, 4, 4, 12, 71, 6100580);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_5', 1248, 960, 5, 10, 71, 6104336);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_6', 1248, 902, 6, 8, 71, 6115358);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_7', 1248, 888, 7, 6, 71, 6119442);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_8', 1248, 1039, 8, 4, 71, 6120728);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1248_r_9', 1248, 16, 9, 2, 70, 6058520);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_1', 1249, 902, 1, 26, 69, 7614430);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_10', 1249, 4, 10, 1, 69, 7665183);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_11', 1249, 9, 11, 0, 69, 7665961);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_12', 1249, 1041, 12, 0, 69, 7671515);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_13', 1249, 850, 13, 0, 69, 7678018);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_14', 1249, 1, 14, 0, 69, 7692479);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_15', 1249, 1025, 15, 0, 69, 7694079);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_16', 1249, 907, 16, 0, 38, 4944199);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_17', 1249, 1079, 17, 0, 30, 2708261);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_18', 1249, 982, 18, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_19', 1249, 956, 19, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_2', 1249, 905, 2, 18, 69, 7633907);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_20', 1249, 16, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_3', 1249, 951, 3, 15, 69, 7636962);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_4', 1249, 960, 4, 12, 69, 7637695);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_5', 1249, 955, 5, 10, 69, 7644607);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_6', 1249, 981, 6, 8, 69, 7645802);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_7', 1249, 1024, 7, 6, 69, 7656486);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_8', 1249, 1039, 8, 4, 69, 7659373);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1249_r_9', 1249, 1029, 9, 2, 69, 7664882);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_1', 1250, 960, 1, 25, 50, 4925969);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_10', 1250, 9, 10, 1, 50, 4989083);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_11', 1250, 1, 11, 0, 50, 4995164);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_12', 1250, 888, 12, 0, 50, 4995772);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_13', 1250, 1025, 13, 0, 50, 5000054);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_14', 1250, 1079, 14, 0, 50, 5001141);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_15', 1250, 956, 15, 0, 50, 5010071);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_16', 1250, 1029, 16, 0, 50, 5016974);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_17', 1250, 905, 17, 0, 49, 4928029);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_18', 1250, 850, 18, 0, 49, 4937254);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_19', 1250, 982, 19, 0, 25, 2532021);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_2', 1250, 4, 2, 18, 50, 4933282);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_20', 1250, 951, 20, 0, 15, 1536973);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_3', 1250, 907, 3, 15, 50, 4937875);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_4', 1250, 955, 4, 12, 50, 4940252);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_5', 1250, 902, 5, 10, 50, 4942551);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_6', 1250, 981, 6, 9, 50, 4969354);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_7', 1250, 1039, 7, 6, 50, 4977334);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_8', 1250, 16, 8, 4, 50, 4985777);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1250_r_9', 1250, 1024, 9, 2, 50, 4988777);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_1', 1251, 902, 1, 25, 57, 5465323);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_10', 1251, 981, 10, 2, 57, 5501085);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_11', 1251, 850, 11, 0, 57, 5515566);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_12', 1251, 4, 12, 0, 57, 5521445);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_13', 1251, 1024, 13, 0, 57, 5526423);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_14', 1251, 1029, 14, 0, 57, 5527979);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_15', 1251, 982, 15, 0, 56, 5478292);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_16', 1251, 16, 16, 0, 39, 3834508);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_17', 1251, 9, 17, 0, 38, 3690177);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_18', 1251, 956, 18, 0, 8, 971562);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_19', 1251, 1079, 19, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_2', 1251, 955, 2, 18, 57, 5471354);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_20', 1251, 905, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_3', 1251, 1039, 3, 15, 57, 5472142);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_4', 1251, 960, 4, 12, 57, 5479427);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_5', 1251, 951, 5, 10, 57, 5482105);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_6', 1251, 907, 6, 8, 57, 5482799);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_7', 1251, 1, 7, 6, 57, 5485190);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_8', 1251, 1025, 8, 4, 57, 5490683);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1251_r_9', 1251, 888, 9, 2, 57, 5497500);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_1', 1252, 981, 1, 25, 58, 5193291);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_10', 1252, 1039, 10, 1, 58, 5277112);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_11', 1252, 982, 11, 0, 57, 5204542);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_12', 1252, 1024, 12, 0, 57, 5208029);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_13', 1252, 1025, 13, 0, 57, 5210595);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_14', 1252, 956, 14, 0, 57, 5211764);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_15', 1252, 1035, 15, 0, 57, 5219846);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_16', 1252, 888, 16, 0, 57, 5270888);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_17', 1252, 1029, 17, 0, 55, 5076949);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_18', 1252, 850, 18, 0, 30, 2847280);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_19', 1252, 1079, 19, 0, 26, 2470430);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_2', 1252, 907, 2, 18, 58, 5199123);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_20', 1252, 9, 20, 0, 0, 0);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_3', 1252, 955, 3, 15, 58, 5225219);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_4', 1252, 4, 4, 12, 58, 5229774);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_5', 1252, 960, 5, 10, 58, 5230829);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_6', 1252, 902, 6, 8, 58, 5243138);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_7', 1252, 951, 7, 6, 58, 5265851);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_8', 1252, 16, 8, 4, 58, 5268845);
INSERT INTO `events_results` (`Key`, `EventKey`, `DriverKey`, `Position`, `Points`, `Laps`, `Time`) VALUES
	('1252_r_9', 1252, 1, 9, 2, 58, 5275664);

-- Dumping structure for table f1.events_schedule
CREATE TABLE IF NOT EXISTS `events_schedule` (
  `Key` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `EventKey` int unsigned NOT NULL,
  `Session` int unsigned NOT NULL,
  `Start` datetime NOT NULL,
  `End` datetime NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Key`),
  KEY `EventKey` (`EventKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.events_schedule: ~246 rows (approximately)
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1228_p1_1', 1228, 8, '2024-02-21 07:00:00', '2024-02-21 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1228_p2_2', 1228, 9, '2024-02-22 07:00:00', '2024-02-22 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1228_p3_3', 1228, 10, '2024-02-23 07:00:00', '2024-02-23 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1229_p1_1', 1229, 1, '2024-02-29 11:30:00', '2024-02-29 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1229_p2_2', 1229, 2, '2024-02-29 15:00:00', '2024-02-29 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1229_p3_3', 1229, 3, '2024-03-01 12:30:00', '2024-03-01 13:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1229_q_0', 1229, 4, '2024-03-01 16:00:00', '2024-03-01 17:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1229_r_0', 1229, 0, '2024-03-02 15:00:00', '2024-03-02 17:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1230_p1_1', 1230, 1, '2024-03-07 13:30:00', '2024-03-07 14:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1230_p2_2', 1230, 2, '2024-03-07 17:10:00', '2024-03-07 18:10:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1230_p3_3', 1230, 3, '2024-03-08 13:30:00', '2024-03-08 14:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1230_q_0', 1230, 4, '2024-03-08 17:00:00', '2024-03-08 18:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1230_r_0', 1230, 0, '2024-03-09 17:00:00', '2024-03-09 19:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1231_p1_1', 1231, 1, '2024-03-22 01:30:00', '2024-03-22 02:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1231_p2_2', 1231, 2, '2024-03-22 05:00:00', '2024-03-22 06:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1231_p3_3', 1231, 3, '2024-03-23 01:30:00', '2024-03-23 02:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1231_q_0', 1231, 4, '2024-03-23 05:00:00', '2024-03-23 06:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1231_r_0', 1231, 0, '2024-03-24 04:00:00', '2024-03-24 06:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1232_p1_1', 1232, 1, '2024-04-05 02:30:00', '2024-04-05 03:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1232_p2_2', 1232, 2, '2024-04-05 06:00:00', '2024-04-05 07:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1232_p3_3', 1232, 3, '2024-04-06 02:30:00', '2024-04-06 03:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1232_q_0', 1232, 4, '2024-04-06 06:00:00', '2024-04-06 07:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1232_r_0', 1232, 0, '2024-04-07 05:00:00', '2024-04-07 07:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1233_p1_1', 1233, 1, '2024-04-19 03:30:00', '2024-04-19 04:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1233_q_0', 1233, 4, '2024-04-20 07:00:00', '2024-04-20 08:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1233_r_0', 1233, 0, '2024-04-21 07:00:00', '2024-04-21 09:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1233_ss_0', 1233, 6, '2024-04-19 07:30:00', '2024-04-19 08:14:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1233_s_0', 1233, 5, '2024-04-20 03:00:00', '2024-04-20 04:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1234_p1_1', 1234, 1, '2024-05-03 16:30:00', '2024-05-03 17:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1234_q_0', 1234, 4, '2024-05-04 20:00:00', '2024-05-04 21:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1234_r_0', 1234, 0, '2024-05-05 20:00:00', '2024-05-05 22:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1234_ss_0', 1234, 6, '2024-05-03 20:30:00', '2024-05-03 21:14:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1234_s_0', 1234, 5, '2024-05-04 16:00:00', '2024-05-04 17:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1235_p1_1', 1235, 1, '2024-05-17 11:30:00', '2024-05-17 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1235_p2_2', 1235, 2, '2024-05-17 15:00:00', '2024-05-17 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1235_p3_3', 1235, 3, '2024-05-18 10:30:00', '2024-05-18 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1235_q_0', 1235, 4, '2024-05-18 14:00:00', '2024-05-18 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1235_r_0', 1235, 0, '2024-05-19 13:00:00', '2024-05-19 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1236_p1_1', 1236, 1, '2024-05-24 11:30:00', '2024-05-24 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1236_p2_2', 1236, 2, '2024-05-24 15:00:00', '2024-05-24 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1236_p3_3', 1236, 3, '2024-05-25 10:30:00', '2024-05-25 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1236_q_0', 1236, 4, '2024-05-25 14:00:00', '2024-05-25 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1236_r_0', 1236, 0, '2024-05-26 13:00:00', '2024-05-26 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1237_p1_1', 1237, 1, '2024-06-07 17:30:00', '2024-06-07 18:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1237_p2_2', 1237, 2, '2024-06-07 21:00:00', '2024-06-07 22:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1237_p3_3', 1237, 3, '2024-06-08 16:30:00', '2024-06-08 17:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1237_q_0', 1237, 4, '2024-06-08 20:00:00', '2024-06-08 21:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1237_r_0', 1237, 0, '2024-06-09 18:00:00', '2024-06-09 20:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1238_p1_1', 1238, 1, '2024-06-21 11:30:00', '2024-06-21 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1238_p2_2', 1238, 2, '2024-06-21 15:00:00', '2024-06-21 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1238_p3_3', 1238, 3, '2024-06-22 10:30:00', '2024-06-22 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1238_q_0', 1238, 4, '2024-06-22 14:00:00', '2024-06-22 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1238_r_0', 1238, 0, '2024-06-23 13:00:00', '2024-06-23 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1239_p1_1', 1239, 1, '2024-06-28 10:30:00', '2024-06-28 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1239_q_0', 1239, 4, '2024-06-29 14:00:00', '2024-06-29 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1239_r_0', 1239, 0, '2024-06-30 13:00:00', '2024-06-30 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1239_ss_0', 1239, 6, '2024-06-28 14:30:00', '2024-06-28 15:14:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1239_s_0', 1239, 5, '2024-06-29 10:00:00', '2024-06-29 11:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1240_p1_1', 1240, 1, '2024-07-05 11:30:00', '2024-07-05 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1240_p2_2', 1240, 2, '2024-07-05 15:00:00', '2024-07-05 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1240_p3_3', 1240, 3, '2024-07-06 10:30:00', '2024-07-06 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1240_q_0', 1240, 4, '2024-07-06 14:00:00', '2024-07-06 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1240_r_0', 1240, 0, '2024-07-07 14:00:00', '2024-07-07 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1241_p1_1', 1241, 1, '2024-07-19 11:30:00', '2024-07-19 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1241_p2_2', 1241, 2, '2024-07-19 15:00:00', '2024-07-19 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1241_p3_3', 1241, 3, '2024-07-20 10:30:00', '2024-07-20 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1241_q_0', 1241, 4, '2024-07-20 14:00:00', '2024-07-20 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1241_r_0', 1241, 0, '2024-07-21 13:00:00', '2024-07-21 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1242_p1_1', 1242, 1, '2024-07-26 11:30:00', '2024-07-26 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1242_p2_2', 1242, 2, '2024-07-26 15:00:00', '2024-07-26 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1242_p3_3', 1242, 3, '2024-07-27 10:30:00', '2024-07-27 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1242_q_0', 1242, 4, '2024-07-27 14:00:00', '2024-07-27 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1242_r_0', 1242, 0, '2024-07-28 13:00:00', '2024-07-28 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1243_p1_1', 1243, 1, '2024-08-23 10:30:00', '2024-08-23 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1243_p2_2', 1243, 2, '2024-08-23 14:00:00', '2024-08-23 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1243_p3_3', 1243, 3, '2024-08-24 09:30:00', '2024-08-24 10:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1243_q_0', 1243, 4, '2024-08-24 13:00:00', '2024-08-24 14:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1243_r_0', 1243, 0, '2024-08-25 13:00:00', '2024-08-25 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1244_p1_1', 1244, 1, '2024-08-30 11:30:00', '2024-08-30 12:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1244_p2_2', 1244, 2, '2024-08-30 15:00:00', '2024-08-30 16:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1244_p3_3', 1244, 3, '2024-08-31 10:30:00', '2024-08-31 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1244_q_0', 1244, 4, '2024-08-31 14:00:00', '2024-08-31 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1244_r_0', 1244, 0, '2024-09-01 13:00:00', '2024-09-01 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1245_p1_1', 1245, 1, '2024-09-13 09:30:00', '2024-09-13 10:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1245_p2_2', 1245, 2, '2024-09-13 13:00:00', '2024-09-13 14:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1245_p3_3', 1245, 3, '2024-09-14 08:30:00', '2024-09-14 09:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1245_q_0', 1245, 4, '2024-09-14 12:00:00', '2024-09-14 13:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1245_r_0', 1245, 0, '2024-09-15 11:00:00', '2024-09-15 13:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1246_p1_1', 1246, 1, '2024-09-20 09:30:00', '2024-09-20 10:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1246_p2_2', 1246, 2, '2024-09-20 13:00:00', '2024-09-20 14:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1246_p3_3', 1246, 3, '2024-09-21 09:30:00', '2024-09-21 10:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1246_q_0', 1246, 4, '2024-09-21 13:00:00', '2024-09-21 14:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1246_r_0', 1246, 0, '2024-09-22 12:00:00', '2024-09-22 14:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1247_p1_1', 1247, 1, '2024-10-18 17:30:00', '2024-10-18 18:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1247_q_0', 1247, 4, '2024-10-19 22:00:00', '2024-10-19 23:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1247_r_0', 1247, 0, '2024-10-20 19:00:00', '2024-10-20 21:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1247_ss_0', 1247, 6, '2024-10-18 21:30:00', '2024-10-18 22:14:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1247_s_0', 1247, 5, '2024-10-19 18:00:00', '2024-10-19 19:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1248_p1_1', 1248, 1, '2024-10-25 18:30:00', '2024-10-25 19:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1248_p2_2', 1248, 2, '2024-10-25 22:00:00', '2024-10-25 23:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1248_p3_3', 1248, 3, '2024-10-26 17:30:00', '2024-10-26 18:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1248_q_0', 1248, 4, '2024-10-26 21:00:00', '2024-10-26 22:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1248_r_0', 1248, 0, '2024-10-27 20:00:00', '2024-10-27 22:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1249_p1_1', 1249, 1, '2024-11-01 14:30:00', '2024-11-01 15:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1249_q_0', 1249, 4, '2024-11-03 10:30:00', '2024-11-03 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1249_r_0', 1249, 0, '2024-11-03 15:30:00', '2024-11-03 17:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1249_ss_0', 1249, 6, '2024-11-01 18:30:00', '2024-11-01 19:14:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1249_s_0', 1249, 5, '2024-11-02 14:00:00', '2024-11-02 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1250_p1_1', 1250, 1, '2024-11-22 02:30:00', '2024-11-22 03:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1250_p2_2', 1250, 2, '2024-11-22 06:00:00', '2024-11-22 07:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1250_p3_3', 1250, 3, '2024-11-23 02:30:00', '2024-11-23 03:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1250_q_0', 1250, 4, '2024-11-23 06:00:00', '2024-11-23 07:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1250_r_0', 1250, 0, '2024-11-24 06:00:00', '2024-11-24 07:59:59', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1251_p1_1', 1251, 1, '2024-11-29 13:30:00', '2024-11-29 14:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1251_q_0', 1251, 4, '2024-11-30 18:00:00', '2024-11-30 19:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1251_r_0', 1251, 0, '2024-12-01 16:00:00', '2024-12-01 18:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1251_ss_0', 1251, 6, '2024-11-29 17:30:00', '2024-11-29 18:14:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1251_s_0', 1251, 5, '2024-11-30 14:00:00', '2024-11-30 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1252_p1_1', 1252, 1, '2024-12-06 09:30:00', '2024-12-06 10:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1252_p2_2', 1252, 2, '2024-12-06 13:00:00', '2024-12-06 14:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1252_p3_3', 1252, 3, '2024-12-07 10:30:00', '2024-12-07 11:30:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1252_q_0', 1252, 4, '2024-12-07 14:00:00', '2024-12-07 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1252_r_0', 1252, 0, '2024-12-08 13:00:00', '2024-12-08 15:00:00', 'completed');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1253_p1_1', 1253, 8, '2025-02-26 07:00:00', '2025-02-26 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1253_p2_2', 1253, 9, '2025-02-27 07:00:00', '2025-02-27 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1253_p3_3', 1253, 10, '2025-02-28 07:00:00', '2025-02-28 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1254_p1_1', 1254, 1, '2025-03-14 01:30:00', '2025-03-14 02:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1254_p2_2', 1254, 2, '2025-03-14 05:00:00', '2025-03-14 06:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1254_p3_3', 1254, 3, '2025-03-15 01:30:00', '2025-03-15 02:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1254_q_0', 1254, 4, '2025-03-15 05:00:00', '2025-03-15 06:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1254_r_0', 1254, 0, '2025-03-16 04:00:00', '2025-03-16 06:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1255_p1_1', 1255, 1, '2025-03-21 03:30:00', '2025-03-21 04:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1255_q_0', 1255, 4, '2025-03-22 07:00:00', '2025-03-22 08:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1255_r_0', 1255, 0, '2025-03-23 07:00:00', '2025-03-23 09:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1255_ss_0', 1255, 6, '2025-03-21 07:30:00', '2025-03-21 08:14:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1255_s_0', 1255, 5, '2025-03-22 03:00:00', '2025-03-22 04:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1256_p1_1', 1256, 1, '2025-04-04 02:30:00', '2025-04-04 03:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1256_p2_2', 1256, 2, '2025-04-04 06:00:00', '2025-04-04 07:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1256_p3_3', 1256, 3, '2025-04-05 02:30:00', '2025-04-05 03:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1256_q_0', 1256, 4, '2025-04-05 06:00:00', '2025-04-05 07:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1256_r_0', 1256, 0, '2025-04-06 05:00:00', '2025-04-06 07:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1257_p1_1', 1257, 1, '2025-04-11 11:30:00', '2025-04-11 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1257_p2_2', 1257, 2, '2025-04-11 15:00:00', '2025-04-11 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1257_p3_3', 1257, 3, '2025-04-12 12:30:00', '2025-04-12 13:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1257_q_0', 1257, 4, '2025-04-12 16:00:00', '2025-04-12 17:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1257_r_0', 1257, 0, '2025-04-13 15:00:00', '2025-04-13 17:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1258_p1_1', 1258, 1, '2025-04-18 13:30:00', '2025-04-18 14:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1258_p2_2', 1258, 2, '2025-04-18 17:00:00', '2025-04-18 18:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1258_p3_3', 1258, 3, '2025-04-19 13:30:00', '2025-04-19 14:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1258_q_0', 1258, 4, '2025-04-19 17:00:00', '2025-04-19 18:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1258_r_0', 1258, 0, '2025-04-20 17:00:00', '2025-04-20 19:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1259_p1_1', 1259, 1, '2025-05-02 16:30:00', '2025-05-02 17:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1259_q_0', 1259, 4, '2025-05-03 20:00:00', '2025-05-03 21:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1259_r_0', 1259, 0, '2025-05-04 20:00:00', '2025-05-04 22:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1259_ss_0', 1259, 6, '2025-05-02 20:30:00', '2025-05-02 21:14:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1259_s_0', 1259, 5, '2025-05-03 16:00:00', '2025-05-03 17:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1260_p1_1', 1260, 1, '2025-05-16 11:30:00', '2025-05-16 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1260_p2_2', 1260, 2, '2025-05-16 15:00:00', '2025-05-16 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1260_p3_3', 1260, 3, '2025-05-17 10:30:00', '2025-05-17 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1260_q_0', 1260, 4, '2025-05-17 14:00:00', '2025-05-17 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1260_r_0', 1260, 0, '2025-05-18 13:00:00', '2025-05-18 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1261_p1_1', 1261, 1, '2025-05-23 11:30:00', '2025-05-23 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1261_p2_2', 1261, 2, '2025-05-23 15:00:00', '2025-05-23 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1261_p3_3', 1261, 3, '2025-05-24 10:30:00', '2025-05-24 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1261_q_0', 1261, 4, '2025-05-24 14:00:00', '2025-05-24 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1261_r_0', 1261, 0, '2025-05-25 13:00:00', '2025-05-25 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1262_p1_1', 1262, 1, '2025-05-30 11:30:00', '2025-05-30 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1262_p2_2', 1262, 2, '2025-05-30 15:00:00', '2025-05-30 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1262_p3_3', 1262, 3, '2025-05-31 10:30:00', '2025-05-31 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1262_q_0', 1262, 4, '2025-05-31 14:00:00', '2025-05-31 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1262_r_0', 1262, 0, '2025-06-01 13:00:00', '2025-06-01 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1263_p1_1', 1263, 1, '2025-06-13 17:30:00', '2025-06-13 18:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1263_p2_2', 1263, 2, '2025-06-13 21:00:00', '2025-06-13 22:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1263_p3_3', 1263, 3, '2025-06-14 16:30:00', '2025-06-14 17:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1263_q_0', 1263, 4, '2025-06-14 20:00:00', '2025-06-14 21:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1263_r_0', 1263, 0, '2025-06-15 18:00:00', '2025-06-15 20:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1264_p1_1', 1264, 1, '2025-06-27 11:30:00', '2025-06-27 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1264_p2_2', 1264, 2, '2025-06-27 15:00:00', '2025-06-27 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1264_p3_3', 1264, 3, '2025-06-28 10:30:00', '2025-06-28 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1264_q_0', 1264, 4, '2025-06-28 14:00:00', '2025-06-28 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1264_r_0', 1264, 0, '2025-06-29 13:00:00', '2025-06-29 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1265_p1_1', 1265, 1, '2025-07-25 10:30:00', '2025-07-25 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1265_q_0', 1265, 4, '2025-07-26 14:00:00', '2025-07-26 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1265_r_0', 1265, 0, '2025-07-27 13:00:00', '2025-07-27 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1265_ss_0', 1265, 6, '2025-07-25 14:30:00', '2025-07-25 15:14:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1265_s_0', 1265, 5, '2025-07-26 10:00:00', '2025-07-26 11:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1266_p1_1', 1266, 1, '2025-08-01 11:30:00', '2025-08-01 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1266_p2_2', 1266, 2, '2025-08-01 15:00:00', '2025-08-01 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1266_p3_3', 1266, 3, '2025-08-02 10:30:00', '2025-08-02 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1266_q_0', 1266, 4, '2025-08-02 14:00:00', '2025-08-02 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1266_r_0', 1266, 0, '2025-08-03 13:00:00', '2025-08-03 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1267_p1_1', 1267, 1, '2025-08-29 10:30:00', '2025-08-29 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1267_p2_2', 1267, 2, '2025-08-29 14:00:00', '2025-08-29 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1267_p3_3', 1267, 3, '2025-08-30 09:30:00', '2025-08-30 10:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1267_q_0', 1267, 4, '2025-08-30 13:00:00', '2025-08-30 14:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1267_r_0', 1267, 0, '2025-08-31 13:00:00', '2025-08-31 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1268_p1_1', 1268, 1, '2025-09-05 11:30:00', '2025-09-05 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1268_p2_2', 1268, 2, '2025-09-05 15:00:00', '2025-09-05 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1268_p3_3', 1268, 3, '2025-09-06 10:30:00', '2025-09-06 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1268_q_0', 1268, 4, '2025-09-06 14:00:00', '2025-09-06 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1268_r_0', 1268, 0, '2025-09-07 13:00:00', '2025-09-07 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1269_p1_1', 1269, 1, '2025-09-19 08:30:00', '2025-09-19 09:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1269_p2_2', 1269, 2, '2025-09-19 12:00:00', '2025-09-19 13:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1269_p3_3', 1269, 3, '2025-09-20 08:30:00', '2025-09-20 09:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1269_q_0', 1269, 4, '2025-09-20 12:00:00', '2025-09-20 13:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1269_r_0', 1269, 0, '2025-09-21 11:00:00', '2025-09-21 13:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1270_p1_1', 1270, 1, '2025-10-03 09:30:00', '2025-10-03 10:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1270_p2_2', 1270, 2, '2025-10-03 13:00:00', '2025-10-03 14:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1270_p3_3', 1270, 3, '2025-10-04 09:30:00', '2025-10-04 10:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1270_q_0', 1270, 4, '2025-10-04 13:00:00', '2025-10-04 14:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1270_r_0', 1270, 0, '2025-10-05 12:00:00', '2025-10-05 14:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1271_p1_1', 1271, 1, '2025-10-17 17:30:00', '2025-10-17 18:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1271_q_0', 1271, 4, '2025-10-18 21:00:00', '2025-10-18 22:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1271_r_0', 1271, 0, '2025-10-19 19:00:00', '2025-10-19 21:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1271_ss_0', 1271, 6, '2025-10-17 21:30:00', '2025-10-17 22:14:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1271_s_0', 1271, 5, '2025-10-18 17:00:00', '2025-10-18 18:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1272_p1_1', 1272, 1, '2025-10-24 18:30:00', '2025-10-24 19:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1272_p2_2', 1272, 2, '2025-10-24 22:00:00', '2025-10-24 23:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1272_p3_3', 1272, 3, '2025-10-25 17:30:00', '2025-10-25 18:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1272_q_0', 1272, 4, '2025-10-25 21:00:00', '2025-10-25 22:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1272_r_0', 1272, 0, '2025-10-26 20:00:00', '2025-10-26 22:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1273_p1_1', 1273, 1, '2025-11-07 14:30:00', '2025-11-07 15:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1273_q_0', 1273, 4, '2025-11-08 18:00:00', '2025-11-08 19:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1273_r_0', 1273, 0, '2025-11-09 17:00:00', '2025-11-09 19:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1273_ss_0', 1273, 6, '2025-11-07 18:30:00', '2025-11-07 19:14:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1273_s_0', 1273, 5, '2025-11-08 14:00:00', '2025-11-08 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1274_p1_1', 1274, 1, '2025-11-21 00:30:00', '2025-11-21 01:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1274_p2_2', 1274, 2, '2025-11-21 04:00:00', '2025-11-21 05:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1274_p3_3', 1274, 3, '2025-11-22 00:30:00', '2025-11-22 01:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1274_q_0', 1274, 4, '2025-11-22 04:00:00', '2025-11-22 05:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1274_r_0', 1274, 0, '2025-11-23 04:00:00', '2025-11-23 06:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1275_p1_1', 1275, 1, '2025-11-28 13:30:00', '2025-11-28 14:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1275_q_0', 1275, 4, '2025-11-29 18:00:00', '2025-11-29 19:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1275_r_0', 1275, 0, '2025-11-30 16:00:00', '2025-11-30 18:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1275_ss_0', 1275, 6, '2025-11-28 17:30:00', '2025-11-28 18:14:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1275_s_0', 1275, 5, '2025-11-29 14:00:00', '2025-11-29 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1276_p1_1', 1276, 1, '2025-12-05 09:30:00', '2025-12-05 10:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1276_p2_2', 1276, 2, '2025-12-05 13:00:00', '2025-12-05 14:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1276_p3_3', 1276, 3, '2025-12-06 10:30:00', '2025-12-06 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1276_q_0', 1276, 4, '2025-12-06 14:00:00', '2025-12-06 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1276_r_0', 1276, 0, '2025-12-07 13:00:00', '2025-12-07 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1277_p1_1', 1277, 1, '2025-07-04 11:30:00', '2025-07-04 12:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1277_p2_2', 1277, 2, '2025-07-04 15:00:00', '2025-07-04 16:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1277_p3_3', 1277, 3, '2025-07-05 10:30:00', '2025-07-05 11:30:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1277_q_0', 1277, 4, '2025-07-05 14:00:00', '2025-07-05 15:00:00', 'upcoming');
INSERT INTO `events_schedule` (`Key`, `EventKey`, `Session`, `Start`, `End`, `Status`) VALUES
	('1277_r_0', 1277, 0, '2025-07-06 14:00:00', '2025-07-06 16:00:00', 'upcoming');

-- Dumping structure for table f1.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `Season` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Key` int unsigned NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `Color` varchar(6) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'FFFFFF',
  `Icon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Profile` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  UNIQUE KEY `Season_Key` (`Season`,`Key`),
  KEY `Key` (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table f1.teams: ~20 rows (approximately)
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 481, 'Williams', '64C4FF', 'https://media.formula1.com/content/dam/fom-website/teams/2024/williams-white.png', '/en/teams/williams');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 526, 'Ferrari', 'E80020', 'https://media.formula1.com/content/dam/fom-website/teams/2024/ferrari-white.png', '/en/teams/ferrari');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 529, 'McLaren', 'FF8000', 'https://media.formula1.com/content/dam/fom-website/teams/2024/mclaren-white.png', '/en/teams/mclaren');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 536, 'Red Bull Racing', '3671C6', 'https://media.formula1.com/content/dam/fom-website/teams/2024/red-bull-racing-white.png', '/en/teams/red-bull-racing');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 543, 'Mercedes', '27F4D2', 'https://media.formula1.com/content/dam/fom-website/teams/2024/mercedes-white.png', '/en/teams/mercedes');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 557, 'Haas', 'B6BABD', 'https://media.formula1.com/content/dam/fom-website/teams/2024/haas-white.png', '/en/teams/haas');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 600, 'Alpine', '0093CC', 'https://media.formula1.com/content/dam/fom-website/teams/2024/alpine-white.png', '/en/teams/alpine');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 602, 'Aston Martin', '229971', 'https://media.formula1.com/content/dam/fom-website/teams/2024/aston-martin-white.png', '/en/teams/aston-martin');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 606, 'Kick Sauber', '52E252', 'https://media.formula1.com/content/dam/fom-website/teams/2024/kick-sauber-white.png', '/en/teams/kick-sauber');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2024', 607, 'RB', '6692FF', 'https://media.formula1.com/content/dam/fom-website/teams/2024/rb-white.png', NULL);
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 481, 'Williams', '64C4FF', 'https://media.formula1.com/content/dam/fom-website/teams/2025/williams-white.png', '/en/teams/williams');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 526, 'Ferrari', 'E80020', 'https://media.formula1.com/content/dam/fom-website/teams/2025/ferrari-white.png', '/en/teams/ferrari');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 529, 'McLaren', 'FF8000', 'https://media.formula1.com/content/dam/fom-website/teams/2025/mclaren-white.png', '/en/teams/mclaren');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 536, 'Red Bull Racing', '3671C6', 'https://media.formula1.com/content/dam/fom-website/teams/2025/red-bull-racing-white.png', '/en/teams/red-bull-racing');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 543, 'Mercedes', '27F4D2', 'https://media.formula1.com/content/dam/fom-website/teams/2025/mercedes-white.png', '/en/teams/mercedes');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 557, 'Haas', 'B6BABD', 'https://media.formula1.com/content/dam/fom-website/teams/2025/haas-white.png', '/en/teams/haas');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 600, 'Alpine', '0093CC', 'https://media.formula1.com/content/dam/fom-website/teams/2025/alpine-white.png', '/en/teams/alpine');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 602, 'Aston Martin', '229971', 'https://media.formula1.com/content/dam/fom-website/teams/2025/aston-martin-white.png', '/en/teams/aston-martin');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 606, 'Kick Sauber', '52E252', 'https://media.formula1.com/content/dam/fom-website/teams/2025/kick-sauber-white.png', '/en/teams/kick-sauber');
INSERT INTO `teams` (`Season`, `Key`, `Name`, `Color`, `Icon`, `Profile`) VALUES
	('2025', 662, 'Racing Bulls', '6692FF', 'https://media.formula1.com/content/dam/fom-website/teams/2025/racing-bulls-white.png', '/en/teams/racing-bulls');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
