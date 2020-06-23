-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2020 at 01:07 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendants`
--

DROP TABLE IF EXISTS `attendants`;
CREATE TABLE IF NOT EXISTS `attendants` (
  `aId` int(11) NOT NULL AUTO_INCREMENT,
  `aDate` date DEFAULT NULL,
  `tIds` text,
  `Present` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`aId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendants`
--

INSERT INTO `attendants` (`aId`, `aDate`, `tIds`, `Present`) VALUES
(1, '2020-06-23', '2,3', 1),
(2, '2020-06-24', '3', 1),
(3, '2020-06-22', '1,2,3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clasess`
--

DROP TABLE IF EXISTS `clasess`;
CREATE TABLE IF NOT EXISTS `clasess` (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `Active` int(11) NOT NULL DEFAULT '1' COMMENT '1:active,0:locked',
  PRIMARY KEY (`cId`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clasess`
--

INSERT INTO `clasess` (`cId`, `cName`, `CreatedDate`, `Active`) VALUES
(1, 'Class 1', '2020-06-23 10:59:16', 1),
(4, 'Class 2', '2020-06-23 10:59:23', 1),
(5, 'Class 3', '2020-06-23 10:59:28', 1),
(6, 'Class 4', '2020-06-23 10:59:34', 1),
(7, 'Class 5', '2020-06-23 10:59:43', 1),
(8, 'Class 6', '2020-06-23 10:59:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

DROP TABLE IF EXISTS `tbl_last_login`;
CREATE TABLE IF NOT EXISTS `tbl_last_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(1, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-22 13:34:00'),
(2, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-22 13:34:49'),
(3, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-22 17:45:10'),
(4, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-23 17:38:18'),
(5, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-24 18:15:34'),
(6, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-25 10:47:00'),
(7, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-25 12:33:15'),
(8, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-25 19:12:51'),
(9, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-26 11:33:45'),
(10, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-26 19:15:25'),
(11, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-27 11:02:51'),
(12, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-27 13:24:52'),
(13, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10', '2020-04-27 15:19:05'),
(14, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-27 18:03:04'),
(15, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-28 16:28:38'),
(16, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10', '2020-04-28 19:53:17'),
(17, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-28 20:15:18'),
(18, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-29 10:24:20'),
(19, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-29 16:30:54'),
(20, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-04-30 08:39:56'),
(21, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10', '2020-04-30 10:21:57'),
(22, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-01 12:35:12'),
(23, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-02 11:49:11'),
(24, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-03 09:45:12'),
(25, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-07 10:57:52'),
(26, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10', '2020-05-07 12:45:29'),
(27, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-07 15:38:04'),
(28, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-07 23:53:13'),
(29, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-08 09:46:59'),
(30, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-09 11:53:18'),
(31, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 75.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0', 'Windows 10', '2020-05-09 17:42:56'),
(32, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-14 14:18:59'),
(33, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-15 11:03:58'),
(34, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-15 17:06:39'),
(35, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-16 11:59:38'),
(36, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-18 14:07:05'),
(37, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-19 11:15:51'),
(38, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-19 13:18:51'),
(39, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 76.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0', 'Windows 10', '2020-05-19 13:52:46'),
(40, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-20 16:38:13'),
(41, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-20 18:19:05'),
(42, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-20 18:19:54'),
(43, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-21 09:10:44'),
(44, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-21 13:16:11'),
(45, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-22 14:06:54'),
(46, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-22 18:15:25'),
(47, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-23 11:32:25'),
(48, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 81.0.4044.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10', '2020-05-23 13:49:31'),
(49, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-05-29 12:49:03'),
(50, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-05-31 18:20:21'),
(51, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-06-04 18:39:27'),
(52, 40532396931656748, '{\"MaidId\":\"40532396931656748\",\"Maidname\":\"Sinu\",\"MaidEmail\":\"sinujose007@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 11:52:43'),
(53, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 11:52:43\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 11:59:55'),
(54, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 11:59:55\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 12:10:14'),
(55, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 12:10:14\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 12:52:03'),
(56, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 12:52:03\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 12:52:30'),
(57, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 12:52:30\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 12:58:41'),
(58, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 12:58:41\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 13:19:03'),
(59, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 13:19:03\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 13:20:44'),
(60, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 13:20:44\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 13:21:04'),
(61, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 13:21:04\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 13:27:12'),
(62, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 13:27:12\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 13:27:37'),
(63, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 13:27:37\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 13:34:01'),
(64, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 13:34:01\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:15:17'),
(65, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:15:17\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:18:37'),
(66, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:18:37\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:18:51'),
(67, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:18:51\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:22:37'),
(68, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:22:37\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:22:51'),
(69, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:22:51\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:41:04'),
(70, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:41:04\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:41:29'),
(71, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:41:29\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:41:53'),
(72, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:41:53\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:49:55'),
(73, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:49:55\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:50:04'),
(74, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:50:04\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:50:22'),
(75, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:50:22\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:50:34'),
(76, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:50:34\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-06 14:51:04'),
(77, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-06 14:51:04\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 10:21:33'),
(78, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 14:15:45'),
(79, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-06-08 14:18:11'),
(80, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 14:59:01'),
(81, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:01:26'),
(82, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:01:26\"},\"0\":\"createdDtm\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:05:52'),
(83, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:05:52\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:06:49'),
(84, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:06:49\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:07:14'),
(85, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:07:14\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:14:54'),
(86, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:14:54\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:16:27'),
(87, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:16:27\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:17:22'),
(88, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-08 15:17:22\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:18:04'),
(89, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-08 15:19:19'),
(90, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-09 08:21:56'),
(91, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-06-09 08:25:10'),
(92, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-09 08:21:56\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-09 09:02:31'),
(93, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-09 09:02:31\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-09 09:02:47'),
(94, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":{\"createdDtm\":\"2020-06-09 09:02:47\"},\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-09 09:04:29'),
(95, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-10 12:49:37'),
(96, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-08 10:21:33\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-10 14:55:09'),
(97, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-10 14:59:05'),
(98, 99352, '{\"MaidId\":\"99352\",\"Maidname\":\"Sadees Kumar Livein Housemaid\\/Cook\\/Baby Sitter (Muslim)\",\"MaidEmail\":\"sadees.kumar0020@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-10 16:00:53'),
(99, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-11 16:04:22'),
(100, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-06-11 22:23:52'),
(101, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'Windows 10', '2020-06-12 15:57:57'),
(102, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-10 14:55:09\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-12 19:19:28'),
(103, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-12 19:20:10'),
(104, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"Ancy\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-12 19:27:08'),
(105, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true,\"completed\":\"0\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-13 09:36:10'),
(106, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true,\"completed\":\"0\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-13 16:31:17'),
(107, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true,\"completed\":\"1\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-13 16:36:23'),
(108, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":null,\"isLoggedIn\":true,\"completed\":\"0\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-13 16:39:49'),
(109, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-12 19:19:28\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-13 17:08:03'),
(110, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-13 17:08:03\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-15 10:59:02'),
(111, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":\"2020-06-13 16:39:49\",\"isLoggedIn\":true,\"completed\":\"1\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-15 12:32:30'),
(112, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-15 10:59:02\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-15 12:36:57'),
(113, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":\"2020-06-15 12:32:30\",\"isLoggedIn\":true,\"completed\":\"1\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-15 14:40:24'),
(114, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-15 12:36:57\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-16 16:26:13'),
(115, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-16 16:26:13\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-18 12:32:44'),
(116, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 83.0.4103.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'Windows 10', '2020-06-19 11:47:37'),
(117, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-18 12:32:44\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-19 13:24:14'),
(118, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":\"2020-06-15 14:40:24\",\"isLoggedIn\":true,\"completed\":\"1\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-19 13:46:54'),
(119, 40532396931656748, '{\"ClientId\":\"40532396931656748\",\"Clientname\":\"Sinu\",\"ClientEmail\":\"sinujose007@gmail.com\",\"lastLogin\":\"2020-06-19 13:24:14\",\"isLoggedIn\":true}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-19 15:17:37'),
(120, 99368, '{\"MaidId\":\"99368\",\"Maidname\":\"AncySinu\",\"MaidEmail\":\"annaancysinu@gmail.com\",\"lastLogin\":\"2020-06-19 13:46:54\",\"isLoggedIn\":true,\"completed\":\"1\"}', '::1', 'Firefox 77.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0', 'Windows 10', '2020-06-19 15:19:01'),
(121, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 69.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 'Windows 10', '2020-06-23 12:21:24'),
(122, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 69.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 'Windows 10', '2020-06-23 12:45:55'),
(123, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Firefox 69.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 'Windows 10', '2020-06-23 13:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

DROP TABLE IF EXISTS `tbl_reset_password`;
CREATE TABLE IF NOT EXISTS `tbl_reset_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(255) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_reset_password`
--

INSERT INTO `tbl_reset_password` (`id`, `email`, `activation_id`, `agent`, `client_ip`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(8, 'sinujose007@gmail.com', 'I8WTFywUVZuGtse', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 16:48:26', NULL, NULL),
(9, 'sinujose007@gmail.com', '5V8kHGX6OZQzKtW', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 17:00:44', NULL, NULL),
(10, 'sinujose007@gmail.com', 'rE04zRTiQAvdymj', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 17:02:05', NULL, NULL),
(11, 'sinujose007@gmail.com', '7POwYK4hpJMRIBG', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 17:54:42', NULL, NULL),
(12, 'sinujose007@gmail.com', '15o2Wn3xVYjHyUF', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 17:54:45', NULL, NULL),
(13, 'annaancysinu@gmail.com', 'ZHUTk0KNtQSCEgf', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 18:25:11', NULL, NULL),
(14, 'annaancysinu@gmail.com', 'N7Bx521ifCWRmaG', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 18:25:14', NULL, NULL),
(15, 'annaancysinu@gmail.com', 'vl6yTgMaRD3CGVo', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 18:27:40', NULL, NULL),
(16, 'annaancysinu@gmail.com', 'ar0ZuDl4nGRy8xv', 'Firefox 77.0', '::1', 0, 1, '2020-06-04 18:27:43', NULL, NULL),
(17, 'sinujose007@gmail.com', 'MOBPyDkvgQsU2rq', 'Firefox 77.0', '127.0.0.1', 0, 1, '2020-06-06 07:56:43', NULL, NULL),
(18, 'sinujose007@gmail.com', 'hDUIiVkOMAx09Gz', 'Firefox 77.0', '127.0.0.1', 0, 1, '2020-06-06 07:56:47', NULL, NULL),
(19, 'annancysinu@gmail.com', 'Xt8R7z6CaceTw1Q', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 08:28:32', NULL, NULL),
(20, 'sinujose007@gmail.com', 'Y1JIHKgehvkfso2', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 08:31:31', NULL, NULL),
(21, 'sinujose007@gmail.com', '4iG0kUd5SANOe6L', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 08:40:25', NULL, NULL),
(22, 'sinujose007@gmail.com', '7a6lkdRVPLWMZhE', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 08:42:10', NULL, NULL),
(23, 'sinujose007@gmail.com', 'ezPkA1mbYWo8fns', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 08:45:40', NULL, NULL),
(24, 'sinujose007@gmail.com', 'l6iTGmOwb25M47A', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 08:47:38', NULL, NULL),
(25, 'sinujose007@gmail.com', 'uKgqmkpswHJYLx8', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 09:36:05', NULL, NULL),
(26, 'sinujose007@gmail.com', '5YPdtS036UQe1lN', 'Firefox 77.0', '::1', 0, 1, '2020-06-06 09:42:14', NULL, NULL),
(27, 'annaancysinu@gmail.com', 'jgdXloJcDU20KvY', 'Firefox 77.0', '::1', 0, 1, '2020-06-08 11:43:18', NULL, NULL),
(28, 'writetosimimol@gmail.com', 'F3Z2aB0OtQz1H6X', 'Firefox 77.0', '::1', 0, 1, '2020-06-11 20:37:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE IF NOT EXISTS `tbl_roles` (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text',
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'sinujose007@gmail.com', '$2y$10$jxgunXyNctbj9/9TKM6AUudHbu4bKux1dRlbmWRNodlTXbHUhyc6q', 'System Administrator', '0504400539', 1, 0, 0, '2020-06-23 18:56:49', 1, '2020-06-23 09:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Telephone` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Qualification` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Active` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`Id`, `Name`, `Telephone`, `Email`, `Password`, `Address`, `Qualification`, `Subject`, `Active`) VALUES
(1, 'Arabic Teacher', '0504400539', 'arabic@lms.ae', '$2y$10$CQaAWEHs3zA6nmmgUwsNEOjdWPriJ1CCwSx/YLZPc/5MHaZnL2dAm', 'Ajman', 'BTECH', 'Arabic', 1),
(2, 'Physics Teacher', '0504400539', 'phy@lms.ae', '$2y$10$8W/JKHdK39p8wxSfH9sLl.k.8pqLI9SCCN1DQTTVWwZHyxdvsr0ii', '', 'BTECH', 'Physics', 1),
(3, 'Biology Teacher', '0504400539', 'bio@lms.ae', '$2y$10$Y5zoWLxzc.vz/oj1rc41pe2ECA4xHfJkm.6rSdQIlJ5HZreMuordS', 'Ajman', 'PG', 'Biology', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_clasess`
--

DROP TABLE IF EXISTS `teacher_clasess`;
CREATE TABLE IF NOT EXISTS `teacher_clasess` (
  `tcId` int(20) NOT NULL AUTO_INCREMENT,
  `tId` bigint(20) DEFAULT NULL,
  `cId` bigint(20) DEFAULT NULL,
  `DateAssigned` datetime DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`tcId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_clasess`
--

INSERT INTO `teacher_clasess` (`tcId`, `tId`, `cId`, `DateAssigned`, `Status`) VALUES
(1, 1, 4, '2020-06-23 01:01:55', NULL),
(2, 1, 5, '2020-06-23 01:01:55', NULL),
(3, 2, 4, '2020-06-23 01:03:12', NULL),
(4, 2, 6, '2020-06-23 01:03:12', NULL),
(5, 3, 5, '2020-06-23 01:03:58', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
