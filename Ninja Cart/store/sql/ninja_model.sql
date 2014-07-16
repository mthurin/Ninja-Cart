-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: vm133086.cs.stedwards.edu
-- Generation Time: Nov 23, 2013 at 04:57 PM
-- Server version: 5.5.29-0ubuntu0.12.04.1-log
-- PHP Version: 5.3.2-1ubuntu4.21

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ninja_model`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `item_id` varchar(100) DEFAULT NULL,
  `profile_num` varchar(100) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `uid`, `item_id`, `profile_num`, `size`, `qty`) VALUES
(9, 'a7074025-967d-4101-b8ff-b5456a2af454', '12', '1', 'Medium', NULL),
(13, 'a7074025-967d-4101-b8ff-b5456a2af454', '25', '3', 'Medium', NULL),
(14, 'a7074025-967d-4101-b8ff-b5456a2af454', '13', '2', 'Medium', NULL),
(15, 'a7074025-967d-4101-b8ff-b5456a2af454', '5', '1', 'Large', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL,
  `item_id` text,
  `cart_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `item_id`, `cart_id`) VALUES
(1, '37', '1'),
(3, '14', '2');

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE IF NOT EXISTS `cart_list` (
  `id` int(11) NOT NULL,
  `profile_id` text,
  `size` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `profile_id`, `size`) VALUES
(1, '5', 'Small'),
(2, '2', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL,
  `status` text,
  `profile_id` int(11) DEFAULT NULL,
  `size` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `status`, `profile_id`, `size`) VALUES
(1, 'Available', 1, 'Small'),
(2, 'Available', 1, 'Small'),
(3, 'Available', 1, 'Medium'),
(4, 'Available', 1, 'Medium'),
(5, 'Available', 1, 'Large'),
(6, 'Available', 1, 'Large'),
(7, 'Available', 1, 'Large'),
(8, 'Available', 1, 'X-Large'),
(9, 'Available', 1, 'X-Large'),
(10, 'Available', 1, 'Small'),
(11, 'Available', 1, 'Small'),
(12, 'Available', 1, 'Medium'),
(13, 'Available', 2, 'Medium'),
(14, 'In Cart', 2, 'Medium'),
(15, 'Available', 2, 'Medium'),
(16, 'Available', 2, 'Small'),
(17, 'Available', 2, 'Small'),
(18, 'Available', 2, 'Small'),
(19, 'Available', 2, 'Large'),
(20, 'Available', 2, 'Large'),
(21, 'Available', 3, 'Small'),
(22, 'Available', 3, 'Small'),
(23, 'Available', 3, 'Small'),
(24, 'Available', 3, 'Small'),
(25, 'Available', 3, 'Medium'),
(26, 'Available', 3, 'Medium'),
(27, 'Available', 3, 'Large'),
(28, 'Available', 3, 'Large'),
(29, 'Available', 4, 'Large'),
(30, 'Available', 4, 'Large'),
(31, 'Available', 4, 'Small'),
(32, 'Available', 4, 'Medium'),
(33, 'Available', 4, 'Medium'),
(34, 'Available', 4, 'Large'),
(35, 'Available', 4, 'X-Large'),
(36, 'Available', 7, 'Small'),
(37, 'In Cart', 5, 'Small'),
(39, 'Available', 5, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `item_hold`
--

CREATE TABLE IF NOT EXISTS `item_hold` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_profile`
--

CREATE TABLE IF NOT EXISTS `item_profile` (
  `id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_profile`
--

INSERT INTO `item_profile` (`id`, `description`, `image`, `title`, `price`) VALUES
(0, 'Commemorative Poster', 'http://farm6.staticflickr.com/5508/10600054225_389aaf7829.jpg', '2012 Poster', 10),
(1, 'Unisex T-Shirt. Don’t Litter Spay/Neuter Balloon Dogs', 'http://love-a-bull.org/wp-content/uploads/merch/1664-balloons.jpg', 'Don’t Litter Spay/Neuter Balloon Dogs', 15),
(2, 'White shirt. Red text.', 'http://love-a-bull.org/wp-content/uploads/merch/5954-LOVEUNISEX.jpg', 'Unisex V-Neck, Love Design', 15),
(3, 'Pullover Hoodie. Dark Gray. ', 'http://love-a-bull.org/wp-content/uploads/merch/12609-pullover_dkgray_front_sm.jpg', 'Love-A-Bull Hoodie', 30),
(4, 'Women’s V-Neck. Hello Pittie. White Shirt. Black Ink.', 'http://love-a-bull.org/wp-content/uploads/merch/1665-hello.jpg', 'Hello Pittiel Hoodie', 15),
(5, 'Unisex T-Shirt (Black), Love-A-Bull Logo', 'http://love-a-bull.org/wp-content/uploads/merch/1666-logo_black.jpg', 'Love-A-Bull T-Shirt', 15),
(6, 'Women’s V-Neck, Don’t Litter, Spay & Neuter', 'http://love-a-bull.org/wp-content/uploads/merch/1662-dontlitter.jpg', 'Women''s Don''t Litter V-Neck', 15),
(7, 'Zip-up Hoodie (Black), Love-A-Bull Logo', 'http://love-a-bull.org/wp-content/uploads/merch/12608-zipup_black_back_sm.jpg', 'Black Zip-Up Hoodie', 30);

-- --------------------------------------------------------

--
-- Table structure for table `item_size`
--

CREATE TABLE IF NOT EXISTS `item_size` (
  `itemID` int(255) NOT NULL,
  `sizeID` int(255) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`itemID`,`sizeID`),
  KEY `itemID` (`itemID`),
  KEY `quantity` (`quantity`),
  KEY `sizeID` (`sizeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_size`
--

INSERT INTO `item_size` (`itemID`, `sizeID`, `quantity`) VALUES
(1, 1, 20),
(2, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE IF NOT EXISTS `size` (
  `id` int(11) NOT NULL,
  `size` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `size`) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large'),
(4, 'X-Large'),
(5, 'No Size');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL,
  `status` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'Available'),
(2, 'In Cart'),
(3, 'Sold');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_size`
--
ALTER TABLE `item_size`
  ADD CONSTRAINT `item_size_ibfk_8` FOREIGN KEY (`sizeID`) REFERENCES `size` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_size_ibfk_7` FOREIGN KEY (`itemID`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
