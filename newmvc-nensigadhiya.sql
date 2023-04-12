-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2023 at 09:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newmvc-nensigadhiya`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `status`, `create_at`, `update_at`) VALUES
(2, 'xyz@gmail.com', '1232545', 1, '2023-04-11 07:48:42', '2023-04-11 08:20:25'),
(3, 'abc@gmail.com', '1232545', 2, '2023-04-11 07:49:35', '2023-04-11 08:17:45'),
(4, 'vhghghgh', '1232545', 1, '2023-04-11 07:50:47', '2023-04-11 08:18:00'),
(6, 'vbn@gmail.com', '', 1, '2023-04-11 10:11:47', '2023-04-11 10:13:02'),
(9, '', '', 1, '2023-04-11 10:56:57', '2023-04-11 10:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `shipping_amount` int(50) NOT NULL,
  `tax_percent` int(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cost` int(50) NOT NULL,
  `price` int(50) NOT NULL,
  `quantity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(4) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `status` varchar(155) NOT NULL,
  `description` varchar(111) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `parent_id`, `name`, `status`, `description`, `created_at`, `updated_at`) VALUES
(169, NULL, 'fgg', 'Yes', 'mjnds', '2023-03-24 12:24:47', '2023-03-26 04:28:05'),
(179, 169, 'ghbh', 'Yes', 'sdf', '2023-03-26 19:59:04', '2023-03-28 10:33:25'),
(190, 179, 'aaa', 'Yes', '', '2023-03-28 11:06:22', NULL),
(197, 190, 'nnn', 'Yes', '', '2023-03-28 13:46:13', '2023-03-29 10:34:24');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `mobile` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email`, `gender`, `mobile`, `status`, `created_at`, `updated_at`, `billing_address_id`, `shipping_address_id`) VALUES
(100, 'sz', 'sjb', 'ad@efg', 'Male', 0, 'Yes', '2023-03-20 11:56:33', '2023-03-26 03:27:23', 0, 0),
(101, '', '', 'dc@ref', 'Male', 0, 'Yes', '2023-03-22 09:34:00', '2023-03-23 05:54:49', 0, 0),
(102, '', 'dfg', 'ad@efg', 'Male', 0, 'Yes', '2023-03-22 09:56:58', '2023-03-23 05:54:59', 0, 0),
(104, '', '', '', 'Male', 0, 'Yes', '2023-03-24 12:15:55', '2023-03-26 03:15:57', 0, 0),
(105, '', 'df', '', 'Male', 0, 'Yes', '2023-03-26 18:38:20', '2023-03-26 03:15:53', 0, 0),
(107, '', 'hjhjhj', '', 'Male', 0, 'Yes', '2023-03-28 10:15:21', NULL, 0, 0),
(108, '', '', '', 'Male', 0, 'Yes', '2023-03-29 11:07:58', NULL, 0, 0),
(109, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:17:33', NULL, 0, 0),
(110, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:19:04', NULL, 0, 0),
(111, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:22:23', NULL, 0, 0),
(112, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:22:55', NULL, 0, 0),
(113, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:23:19', NULL, 0, 0),
(114, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:24:15', NULL, 0, 0),
(115, 'nensi', 'gadhiya', 'abc@gmail.com', 'Female', 1234569877, 'No', '2023-03-29 11:25:12', NULL, 0, 0),
(116, '', 'ddd', '', 'Male', 0, 'Yes', '2023-03-29 11:26:50', NULL, 0, 0),
(117, '', 'ddd', '', 'Male', 0, 'Yes', '2023-03-29 11:27:13', NULL, 0, 0),
(118, '', '', '', 'Male', 0, 'Yes', '2023-03-29 13:09:20', NULL, 0, 0),
(119, '', '', '', 'Male', 0, 'Yes', '2023-03-29 13:09:39', NULL, 0, 0),
(120, '', '', '', 'Male', 0, 'Yes', '2023-03-31 14:55:21', NULL, 0, 0),
(121, 'ddsds', 'sds', '', 'Male', 0, 'Yes', '2023-03-31 14:55:32', NULL, 0, 0),
(122, '', '', '', 'Male', 0, 'Yes', '2023-03-31 14:57:01', NULL, 0, 0),
(123, '', '', '', 'Male', 0, 'Yes', '2023-03-31 14:57:55', NULL, 0, 0),
(124, '', '', '', 'Male', 0, 'Yes', '2023-03-31 14:58:15', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`address_id`, `address`, `city`, `state`, `country`, `zipcode`, `customer_id`) VALUES
(1, 'fvdv ', 'dfv', '', '', 0, 14),
(2, 'frgvdfv', 'dfbd', 'dfb', '', 0, 15),
(3, 'ghc', 'fgsx', '', '', 0, 16),
(4, 'dadsds', '', '', '', 0, 17),
(5, 'vxytsxvas', 'fyt', 'tvfuy', 'tgfyt', 5555, 6),
(6, 'kkkkk', 'ghn', 'jj', '', 0, 18),
(7, '', '', 'jkmmm', 'gh', 0, 19),
(8, 'lhkfgdfv', '', '', 'india', 0, 20),
(9, 'ffff', '', '', 'cccccccccc', 0, 21),
(10, '', 'hhhhhhhhhhhhhh', '', '', 0, 22),
(11, '', 'sfsdfdsfc', '', '', 0, 23),
(12, '', '', 'dsf', '', 0, 24),
(13, '', '', '', 'ewfwefdsdd', 0, 25),
(14, '', 'surat', '', '', 0, 26),
(15, 'dsede', 'fcedf', 'fd', 'dg', 765, 0),
(37, '', '', '', '', 0, 98),
(39, 'dhgh', 'hjh', 'sscsdsds', 'as', 0, 99),
(41, '', 'ZXasd', '', '', 0, 100),
(43, '', 'dc', 'eferf', '', 0, 101),
(45, 'sfg', 'dfv', '', '', 0, 102),
(47, 'hd', '', '', '', 0, 103),
(50, '', '', '', '', 0, 104),
(59, '', '', '', '', 0, 105),
(60, '', 'xf vnmdf', '', '', 0, 106),
(61, 'cdcdcdcdc', '', '', '', 0, 107),
(62, '', '', '', '', 0, 108);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE `eav_attribute` (
  `attribute_id` int(11) NOT NULL,
  `entity_type_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `backend_type` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `backend_model` varchar(255) NOT NULL,
  `input_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `code`, `backend_type`, `name`, `status`, `backend_model`, `input_type`) VALUES
(1, 1, 'color', 'int', 'Color', 1, '', 'select'),
(2, 1, 'style', 'int', 'Style', 1, '', 'select'),
(3, 1, 'short_desc', 'textarea', 'Short Description', 1, '', 'textarea');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `option_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `position` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `name`, `attribute_id`, `position`) VALUES
(1, 'Red', 1, 1),
(2, 'White', 1, 2),
(3, 'Black', 1, 3),
(4, 'Brown', 1, 4),
(5, 'Silver', 1, 5),
(6, 'Traditional', 2, 1),
(7, 'Modern', 2, 2),
(8, 'Minimalist', 2, 1),
(9, 'Bohemien', 2, 1),
(10, 'Electric', 2, 1),
(11, 'Contemporary', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `entity_type`
--

CREATE TABLE `entity_type` (
  `entity_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `entity_model` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entity_type`
--

INSERT INTO `entity_type` (`entity_type_id`, `name`, `entity_model`) VALUES
(1, 'product', ''),
(2, 'category', ''),
(3, 'customer', ''),
(4, 'vendor', ''),
(5, 'salesman', '');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `base` varchar(50) DEFAULT NULL,
  `small` varchar(50) DEFAULT NULL,
  `thumbnail` varchar(50) DEFAULT NULL,
  `gallery` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `name`, `image`, `base`, `small`, `thumbnail`, `gallery`, `created_at`) VALUES
(48, 'zxcv', '48.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:10:41.692480'),
(49, 'aaa', '49.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:31:20.742511'),
(50, 'aaa', '50.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:31:33.249043'),
(51, 'aaavv', '51.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:31:58.934741'),
(52, 'janki', '52.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:35:50.546736'),
(53, 'hvj', '53.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:37:12.068301'),
(54, 'hvj', '54.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:37:54.436265'),
(55, 'acxde', '55.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:40:17.750946'),
(56, 'huhuhu', '56.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:41:50.838530'),
(57, 'huhuhu', '57.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:42:55.447845'),
(59, 'wertttfg', '59.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:45:21.392555'),
(60, 'accddeee', '60.jpeg', NULL, NULL, NULL, NULL, '2023-03-26 12:46:15.887380'),
(77, '', '77.jpg', NULL, NULL, NULL, NULL, '2023-03-27 12:02:13.399054');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(21, 'jkm', 'Yes', '2023-03-16 21:55:05', '2023-03-26 04:14:15'),
(22, 'ngfvhkj', 'Yes', '2023-03-16 21:55:18', '2023-03-23 11:10:43'),
(23, 'bnc', 'Yes', '2023-03-16 21:55:23', '2023-03-23 11:10:36'),
(24, 'tdy', 'Yes', '2023-03-23 15:40:24', '2023-03-23 11:10:31'),
(25, 'tg', 'Yes', '2023-03-26 14:39:55', '2023-03-26 03:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(5) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `color` varchar(255) NOT NULL,
  `material` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `sku`, `cost`, `price`, `quantity`, `description`, `status`, `color`, `material`, `created_at`, `updated_at`) VALUES
(146, '', '', '5555.00', '0.00', 0, '', 'Yes', '', '', '2023-03-29 10:05:42', '2023-03-29 10:07:02'),
(147, 'sssnnn', '', '0.00', '0.00', 0, '', 'Yes', '', '', '2023-03-29 10:11:24', '2023-03-30 08:16:07'),
(151, 'bbbb', '', '0.00', '0.00', 0, '', 'Yes', '', '', '2023-03-30 13:33:21', '2023-03-30 10:03:31'),
(152, '', '', '0.00', '0.00', 0, '', 'Yes', '', '', '2023-03-30 14:21:33', '2023-03-30 10:51:33'),
(153, '', '', '0.00', '0.00', 0, '', 'Yes', '', '', '2023-03-30 14:25:02', '2023-03-30 10:55:02'),
(154, '', 'ccdcdc', '454545.00', '0.00', 0, '', 'Yes', '', '', '2023-03-31 11:06:16', '2023-03-31 07:36:33'),
(155, '', '', '0.00', '0.00', 0, '', 'Yes', '', '', '2023-03-31 11:07:09', '2023-03-31 07:37:09'),
(156, '', '', '8888888.00', '0.00', 0, '', 'Yes', '', '', '2023-03-31 11:07:18', '2023-03-31 07:45:19'),
(157, '', '', '5555.00', '0.00', 0, '', 'Yes', '', '', '2023-03-31 11:09:37', '2023-03-31 07:40:05'),
(166, 'hgdhegdhg', 'cndjcjdhc', '4545.00', '5656.00', 5, 'vgfgf', '', '', '', '2023-04-11 10:28:34', NULL),
(167, '', '', '454545.00', '0.00', 0, '', '', '', '', '2023-04-11 10:30:04', '2023-04-11 10:32:30'),
(168, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-11 10:40:06', NULL),
(169, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-12 07:49:54', NULL),
(170, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-12 07:50:45', NULL),
(171, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-12 07:52:40', NULL),
(172, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-12 07:52:50', NULL),
(173, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-12 07:54:29', NULL),
(174, '', '', '0.00', '0.00', 0, '', '', '', '', '2023-04-12 07:54:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_int`
--

CREATE TABLE `product_int` (
  `value_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `salesman_id` int(11) NOT NULL,
  `first_name` varchar(11) NOT NULL,
  `last_name` varchar(11) NOT NULL,
  `email` varchar(11) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `mobile` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `company` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_id`, `first_name`, `last_name`, `email`, `gender`, `mobile`, `status`, `company`, `created_at`, `updated_at`) VALUES
(48, 'fg', 'dsf', '', 'Male', 0, 'Yes', '', '2023-03-19 10:10:37', '2023-03-23 06:36:10'),
(50, 'dt', 'ft', '', 'Male', 0, 'Yes', '', '2023-03-19 10:24:40', '2023-03-23 06:36:05'),
(51, 'df', '', 'gfs@rghjk', 'Male', 0, 'Yes', '', '2023-03-20 10:00:53', NULL),
(52, 'fgh', '', '', 'Male', 0, 'Yes', '', '2023-03-22 09:27:27', NULL),
(54, 'dfv', 'xvc', 'gfs@rghjk', 'Male', 536, 'Yes', 'rg', '2023-03-22 09:42:29', NULL),
(55, 'dfv', 'xvc', 'gfs@rghjk', 'Male', 536, 'Yes', 'rg', '2023-03-22 09:43:37', '2023-03-23 06:36:17'),
(56, 'dfv', 'xvc', 'gfs@rghjk', 'Male', 536, 'No', 'rg', '2023-03-22 09:44:00', NULL),
(57, '', 'sdf', '', 'Male', 0, 'Yes', '', '2023-03-26 19:54:17', '2023-03-26 04:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `salesman_address`
--

CREATE TABLE `salesman_address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `salesman_address`
--

INSERT INTO `salesman_address` (`address_id`, `address`, `city`, `state`, `country`, `zipcode`, `salesman_id`) VALUES
(1, 'jsxbsjxbs', '', '', '', 0, 15),
(2, 'hnvjh', 'bv', '', 'jfjymf', 0, 16),
(3, 'hnvjh', 'bv', '', 'jfjymf', 0, 17),
(4, 'nc', 'mhnf', '', 'jkm', 0, 18),
(5, 'rge', '', '', 'af', 0, 19),
(6, 'dddddd', '', 'xddd', '', 0, 46),
(7, 'fytcytc', 'cyc', 'cttg', 'tcyc', 78, 52),
(8, 'df', 'dfgeg', 'ret', 'grt', 56, 56),
(9, '', '', '', '', 0, 57);

-- --------------------------------------------------------

--
-- Table structure for table `salesman_price`
--

CREATE TABLE `salesman_price` (
  `entity_id` int(50) NOT NULL,
  `salesman_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `salesman_price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippingmethod`
--

CREATE TABLE `shippingmethod` (
  `shipping_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shippingmethod`
--

INSERT INTO `shippingmethod` (`shipping_id`, `name`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(16, 'jk', 0, 'Yes', '2023-03-16 15:07:05', '2023-03-26 11:13:26'),
(17, 'fffcfg', 4, 'Yes', '2023-03-16 15:07:21', '2023-03-26 11:13:30'),
(18, 'ncv ', 0, 'Yes', '2023-03-16 15:08:03', '2023-03-26 04:21:22'),
(20, 'xv', 3456, 'Yes', '2023-03-26 19:46:03', '2023-03-26 04:18:01'),
(21, 'fg', 0, 'Yes', '2023-03-26 19:49:42', '2023-03-26 04:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `mobile` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `company` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `first_name`, `last_name`, `email`, `gender`, `mobile`, `status`, `company`, `created_at`, `updated_at`) VALUES
(13, 'jjs', 'sef', 'h@jug', 'Male', 0, 'Yes', 'ccccccccccc', '2023-03-19 10:00:10', '2023-03-26 11:52:12'),
(14, 'jk', 'm', 'jhf@i', 'Male', 0, 'Yes', 'aara', '2023-03-19 10:00:40', '2023-03-26 12:07:27'),
(15, 'd', 'df', '', 'Male', 0, 'Yes', '', '2023-03-19 10:35:37', '2023-03-26 12:29:28'),
(17, 'df', 'cv', '', 'Male', 0, 'Yes', '', '2023-03-20 10:02:27', NULL),
(18, 'sdf', '', '', 'Male', 0, 'Yes', '', '2023-03-20 12:50:48', NULL),
(30, 'asd', '', '', 'Male', 0, 'Yes', '', '2023-03-20 12:57:50', NULL),
(31, 'cgb', '', '', 'Male', 0, 'Yes', 'aa', '2023-03-20 16:31:32', NULL),
(32, 'sdj', 'cd', 'jhf@i', 'Male', 0, 'Yes', '', '2023-03-22 09:44:29', '2023-03-26 11:52:21'),
(33, '', '', '', 'Male', 0, 'Yes', '', '2023-03-26 15:31:41', NULL),
(34, 'sws', '', '', 'Male', 0, 'Yes', '', '2023-03-26 15:41:40', NULL),
(47, '', '', '', 'Male', 0, 'Yes', '', '2023-03-26 15:49:30', NULL),
(49, 'fd', 'erw', '', 'Male', 0, 'Yes', '', '2023-03-26 15:52:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_address`
--

CREATE TABLE `vendor_address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vendor_address`
--

INSERT INTO `vendor_address` (`address_id`, `address`, `city`, `state`, `country`, `zipcode`, `vendor_id`) VALUES
(1, 'vsdfv', '', 'dvsfv', 'ghbfg', 56, 4),
(2, 'jkmm', 'rdgf', 'gujrat', 'surat', 565656, 5),
(3, '', 'mhvn', 'mbnm', '', 0, 6),
(4, '', '', '', '', 390, 7),
(5, 'mndbmxn cx', '', 'xc cx ', '', 0, 8),
(6, 'kamrej', 'surat', '', 'india', 0, 9),
(7, '', 'fffffffffffff', '', 'vvvvvvv', 0, 10),
(8, '', 'surat', 'cvxcvxdv', '', 0, 11),
(9, '', '', 'dsfsdfsd', '', 0, 29),
(10, 'rgdfg', 'df', 'nmvxcxz ', 'zx', 0, 30),
(11, 'dw', 'ddsc', 'ddwd', 'yhffg', 45, 0),
(13, 'sd', 'gdfg', '', '', 5346, 31),
(15, 'dc', 'zxc', 'dcd', 'ghbfg', 0, 32),
(17, '', '', '', '', 0, 33),
(19, 'dced', 'eddfe', '', '', 0, 41),
(20, 'dced', 'eddfe', '', '', 0, 42),
(21, 'dced', 'eddfe', '', '', 0, 43),
(22, 'dced', 'eddfe', '', '', 0, 44),
(32, '', '', '', '', 0, 45),
(35, '', '', '', '', 0, 46),
(38, '', '', '', '', 0, 47),
(40, 'xcv', 'xcv', '', '', 0, 49),
(41, '', '', '', '', 0, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `shipping_id` (`shipping_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `parent_id` (`parent_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `entity_type_id` (`entity_type_id`);

--
-- Indexes for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `entity_type`
--
ALTER TABLE `entity_type`
  ADD PRIMARY KEY (`entity_type_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_int`
--
ALTER TABLE `product_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `entity_id_2` (`entity_id`,`attribute_id`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_id`);

--
-- Indexes for table `salesman_address`
--
ALTER TABLE `salesman_address`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `salesman_price`
--
ALTER TABLE `salesman_price`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `salesman_price_ibfk_1` (`product_id`),
  ADD KEY `salesman_price_ibfk_2` (`salesman_id`);

--
-- Indexes for table `shippingmethod`
--
ALTER TABLE `shippingmethod`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `vendor_address`
--
ALTER TABLE `vendor_address`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `vendor_id` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `entity_type`
--
ALTER TABLE `entity_type`
  MODIFY `entity_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `product_int`
--
ALTER TABLE `product_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `salesman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `salesman_address`
--
ALTER TABLE `salesman_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salesman_price`
--
ALTER TABLE `salesman_price`
  MODIFY `entity_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `shippingmethod`
--
ALTER TABLE `shippingmethod`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `vendor_address`
--
ALTER TABLE `vendor_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`shipping_id`) REFERENCES `shippingmethod` (`shipping_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `eav_attribute_option_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesman_price`
--
ALTER TABLE `salesman_price`
  ADD CONSTRAINT `salesman_price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salesman_price_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
