-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2022 at 07:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment1`
--

-- --------------------------------------------------------

--
-- Table structure for table `templatedb`
--

CREATE TABLE `templatedb` (
  `date` text NOT NULL,
  `employeeid` text NOT NULL,
  `name` text NOT NULL,
  `workingtype` text NOT NULL,
  `starttime` time(6) NOT NULL,
  `end` time NOT NULL,
  `storeid` text DEFAULT NULL,
  `storename` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `templatedb`
--

INSERT INTO `templatedb` (`date`, `employeeid`, `name`, `workingtype`, `starttime`, `end`, `storeid`, `storename`) VALUES
('2019-10-15', '1237780', 'kimmy ', 'training', '16:00:00.000000', '17:00:00', 'RAJD6000883', 'Multiplex samsung'),
('2019-10-15', '1237780', 'kimmy ', 'lunch', '00:00:00.000000', '00:00:00', NULL, NULL),
('2019-10-15', '1237780', 'kimmy ', 'break', '00:00:00.000000', '00:00:00', NULL, NULL),
('2019-10-16', '1237780', 'kimmy ', 'day off', '00:00:00.000000', '00:00:00', NULL, NULL),
('2019-10-19', '1237780', 'kimmy ', 'leave', '00:00:00.000000', '00:00:00', NULL, NULL),
('2019-10-18', '1237780', 'kimmy ', 'leave', '00:00:00.000000', '00:00:00', NULL, NULL),
('2019-10-17', '1237780', 'kimmy ', 'leave', '00:00:00.000000', '00:00:00', NULL, NULL),
('2019-10-15', '1237780', 'kimmy ', 'working time', '08:00:00.000000', '19:00:00', 'RAJD6000883', 'Junbo Store'),
('2019-10-15', '1237780', 'kimmy ', 'route', '18:00:00.000000', '19:00:00', 'RAJD6000883', 'ABC Mart');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
