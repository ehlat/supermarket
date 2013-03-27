-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2012 at 08:32 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `s_market`
--

-- --------------------------------------------------------

--
-- Table structure for table `goods_in_stock`
--

CREATE TABLE IF NOT EXISTS `goods_in_stock` (
  `amount` int(3) NOT NULL,
  `in_price` float NOT NULL,
  `out_price` float NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '100',
  `mark` int(3) NOT NULL DEFAULT '1',
  `barcode` int(6) NOT NULL,
  PRIMARY KEY (`barcode`,`mark`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goods_in_stock`
--

INSERT INTO `goods_in_stock` (`amount`, `in_price`, `out_price`, `discount`, `mark`, `barcode`) VALUES
(-1, 5, 6, 100, 1, 1111),
(9, 13, 16, 100, 1, 1112),
(0, 3, 4, 100, 1, 1113),
(6, 1.5, 2, 100, 1, 1114),
(17, 1.5, 2, 100, 1, 1115),
(0, 12, 34, 100, 2, 1116),
(29, 2.3, 3, 100, 1, 1117),
(0, 12, 14, 100, 1, 1123);

-- --------------------------------------------------------

--
-- Table structure for table `good_list`
--

CREATE TABLE IF NOT EXISTS `good_list` (
  `barcode` int(32) unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8 NOT NULL,
  `category` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '日用',
  `additional` varchar(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `good_list`
--

INSERT INTO `good_list` (`barcode`, `name`, `category`, `additional`) VALUES
(1111, '巧克力', '食物', ''),
(1112, '优客牌蛋糕', '食物', ''),
(1113, '六神肥皂', '日用', ''),
(1114, '爽歪歪', '食品', ''),
(1115, '娃哈哈AD?奶', '食品', ''),
(1116, '男士拖鞋', '日用', ''),
(1117, '百事可?', '日用', ''),
(1118, 'beard', '日用', ''),
(1123, '阿斯顿', '日用', '');

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE IF NOT EXISTS `rate` (
  `barcode` int(32) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`barcode`, `count`) VALUES
(1111, 25),
(1112, 0),
(1113, 41),
(1114, 10),
(1115, 10),
(1116, 0),
(1117, 0),
(1118, 0),
(1123, 5);

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE IF NOT EXISTS `record` (
  `barcode` int(32) NOT NULL,
  `name` varchar(24) CHARACTER SET utf8 NOT NULL,
  `category` varchar(32) CHARACTER SET utf8 NOT NULL,
  `amount` int(3) NOT NULL,
  `in_price` float NOT NULL,
  `out_price` float NOT NULL,
  `discount` int(11) NOT NULL,
  `additional` varchar(32) CHARACTER SET utf8 NOT NULL,
  `mark` int(3) NOT NULL,
  `dis` int(2) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dis`)
) ENGINE=InnoDB  DEFAULT CHARSET=big5 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`barcode`, `name`, `category`, `amount`, `in_price`, `out_price`, `discount`, `additional`, `mark`, `dis`) VALUES
(1114, '巧克力', '食物', 6, 1.5, 2, 100, '', 1, 1),
(1117, '巧克力', '食物', 29, 2.3, 3, 100, '', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE IF NOT EXISTS `temp` (
  `num` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` int(32) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=big5 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(24) NOT NULL,
  `password` int(6) unsigned NOT NULL DEFAULT '123456',
  `permission` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `permission`) VALUES
('boss', 123456, 1),
('manager', 123456, 1),
('cashier', 123456, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
