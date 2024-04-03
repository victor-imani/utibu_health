-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 08:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utibu_health`
--

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_unit` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `type`, `quantity`, `price_per_unit`, `createdAt`, `updatedAt`) VALUES
(1, 'Lamivudine', 'Pills', 86, 5.99, '2024-03-30 09:37:18', '2024-04-01 07:30:58'),
(2, 'Zidovudine', 'Pills', 3976, 7.5, '2024-03-30 09:37:47', '2024-04-02 18:13:56'),
(3, 'Tenofovir', 'Pills', 1540, 8.25, '2024-03-30 09:38:10', '2024-04-02 18:13:56'),
(4, 'Efavirenz', 'Pills', 380, 6.75, '2024-03-30 09:38:44', '2024-04-02 19:51:20'),
(5, 'Enalapril', 'Pills', 1700, 4.5, '2024-03-30 09:39:01', '2024-04-02 21:55:52'),
(6, 'Losartan', 'Pills', 1896, 9.99, '2024-03-30 09:39:13', '2024-04-02 19:51:20'),
(7, 'Hydrochlorothiazide', 'Pills', 10, 5.25, '2024-03-30 09:39:28', '2024-04-02 18:02:31'),
(8, 'Amlodipine', 'Pills', 130, 7.85, '2024-03-30 09:39:48', '2024-03-30 09:39:48'),
(9, 'Atenolol', 'Pills', 70, 3.75, '2024-03-30 09:40:04', '2024-03-30 09:40:04'),
(10, 'Nifedipine', 'Pills', 100, 6.5, '2024-03-30 09:40:18', '2024-03-30 09:40:18'),
(11, 'Propranolol', 'Pills', 85, 4.99, '2024-03-30 09:40:40', '2024-03-30 09:40:40'),
(12, 'Clonidine', 'Pills', 52, 7.25, '2024-03-30 09:41:01', '2024-04-02 18:02:31'),
(13, 'Methyldopa', 'Pills', 90, 6.75, '2024-03-30 09:41:17', '2024-03-30 09:41:17'),
(14, 'Diltiazem', 'Pills', 98, 8.5, '2024-03-30 09:41:46', '2024-04-02 21:55:52'),
(15, 'Furosemide', 'Pills', 65, 5.99, '2024-03-30 09:42:00', '2024-04-02 18:02:31'),
(16, 'Abacavir', 'Pills', 100, 10.99, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(17, 'Darunavir', 'Pills', 90, 12.5, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(18, 'Ritonavir', 'Pills', 80, 15.25, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(19, 'Metformin', 'Pills', 120, 5.99, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(20, 'Glipizide', 'Pills', 110, 7.85, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(21, 'Glyburide', 'Pills', 100, 6.75, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(22, 'Lisinopril', 'Pills', 150, 4.5, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(23, 'Ramipril', 'Pills', 130, 6.99, '2024-04-03 14:27:12', '2024-04-03 14:27:12'),
(24, 'Candesartan', 'Pills', 95, 8.25, '2024-04-03 14:27:12', '2024-04-03 14:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `orderdrug`
--

CREATE TABLE `orderdrug` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `OrderId` int(11) NOT NULL,
  `DrugId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `medicationName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` float NOT NULL,
  `payment` enum('Pay Now','Pay Later') NOT NULL,
  `paymentStatus` enum('Pending','Paid') NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `medicationName`, `quantity`, `amount`, `payment`, `paymentStatus`, `userId`, `createdAt`, `updatedAt`) VALUES
(2, 'Lamivudine', 2, 0, 'Pay Now', 'Pending', 1, '2024-04-01 06:41:17', '2024-04-01 06:41:17'),
(3, 'Lamivudine', 2, 0, 'Pay Now', 'Pending', 2, '2024-04-01 07:30:58', '2024-04-01 07:30:58'),
(4, 'Zidovudine', 8, 0, 'Pay Now', 'Pending', 5, '2024-04-01 12:43:53', '2024-04-01 12:43:53'),
(5, 'Zidovudine', 8, 0, 'Pay Now', 'Pending', 5, '2024-04-01 12:47:28', '2024-04-01 12:47:28'),
(42, 'Zidovudine', 8, 221.13, 'Pay Later', 'Pending', 5, '2024-04-02 11:30:13', '2024-04-02 11:30:13'),
(43, 'Enalapril', 10, 45, 'Pay Later', 'Pending', 5, '2024-04-02 16:29:56', '2024-04-02 16:29:56'),
(44, 'Enalapril', 25, 112.5, 'Pay Now', 'Pending', 5, '2024-04-02 16:54:35', '2024-04-02 16:54:35'),
(45, 'Enalapril', 25, 270, 'Pay Now', 'Pending', 5, '2024-04-02 16:57:49', '2024-04-02 16:57:49'),
(46, 'Enalapril', 25, 714.08, 'Pay Now', 'Pending', 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34'),
(47, 'Enalapril', 25, 714.08, 'Pay Now', 'Pending', 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31'),
(49, 'Zidovudine', 8, 221.13, 'Pay Later', 'Pending', 5, '2024-04-02 18:04:48', '2024-04-02 18:04:48'),
(51, 'Zidovudine', 8, 221.13, 'Pay Later', 'Pending', 5, '2024-04-02 18:13:56', '2024-04-02 18:13:56'),
(53, 'Efavirenz', 13, 87.75, 'Pay Now', 'Paid', 6, '2024-04-02 18:57:07', '2024-04-02 18:57:07'),
(54, 'Efavirenz', 13, 117.72, 'Pay Later', 'Pending', 6, '2024-04-02 19:51:20', '2024-04-02 19:51:20'),
(55, 'Diltiazem', 12, 111, 'Pay Now', 'Paid', 6, '2024-04-02 21:55:52', '2024-04-02 21:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `transactionCode` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `date` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `transactionCode`, `amount`, `date`, `createdAt`, `updatedAt`) VALUES
(1, 'RTXYUI', 221.13, '2024-04-01 11:39:23', '2024-04-01 11:39:23', '2024-04-01 11:39:23'),
(2, 'RTXYUIW', 221.13, '2024-04-01 14:09:40', '2024-04-01 14:09:40', '2024-04-01 14:09:40'),
(3, 'RTX', 714.08, '2024-04-02 18:02:24', '2024-04-02 18:02:24', '2024-04-02 18:02:24'),
(4, 'RTXJK', 87.75, '2024-04-02 18:56:53', '2024-04-02 18:56:53', '2024-04-02 18:56:53'),
(5, 'FINALLY', 111, '2024-04-02 21:54:32', '2024-04-02 21:54:32', '2024-04-02 21:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `totalAmount` float NOT NULL,
  `paymentStatus` enum('Pending','Paid') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `date`, `userId`, `description`, `totalAmount`, `paymentStatus`, `createdAt`, `updatedAt`) VALUES
(12, '2024-04-01 06:41:17', 1, 'Ordered 2 units of Lamivudine,Ordered 3 units of Enalapril,Ordered 1 units of Losartan', 35.47, 'Pending', '2024-04-01 15:24:32', '2024-04-01 15:24:32'),
(13, '2024-04-01 07:30:58', 2, 'Ordered 2 units of Lamivudine,Ordered 3 units of Enalapril,Ordered 1 units of Losartan', 35.47, 'Pending', '2024-04-01 15:24:32', '2024-04-01 15:24:32'),
(14, '2024-04-01 12:43:53', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-01 15:24:32', '2024-04-01 15:24:32'),
(15, '2024-04-01 15:16:20', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-01 15:24:32', '2024-04-01 15:24:32'),
(16, '2024-04-01 15:17:55', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-01 15:24:32', '2024-04-01 15:24:32'),
(17, '2024-04-01 15:27:58', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-01 15:28:51', '2024-04-01 15:28:51'),
(18, '2024-04-01 15:28:35', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-01 15:28:51', '2024-04-01 15:28:51'),
(23, '2024-04-02 11:30:13', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-02 13:18:28', '2024-04-02 13:18:28'),
(24, '2024-04-02 16:29:56', 5, 'Ordered 10 units of Enalapril', 45, 'Pending', '2024-04-02 17:26:51', '2024-04-02 17:26:51'),
(25, '2024-04-02 16:54:35', 5, 'Ordered 25 units of Enalapril', 112.5, 'Pending', '2024-04-02 17:26:51', '2024-04-02 17:26:51'),
(26, '2024-04-02 16:57:49', 5, 'Ordered 25 units of Enalapril,Ordered 30 units of Hydrochlorothiazide', 270, 'Pending', '2024-04-02 17:26:51', '2024-04-02 17:26:51'),
(27, '2024-04-02 17:23:34', 5, 'Ordered 25 units of Enalapril,Ordered 30 units of Hydrochlorothiazide,Ordered 2 units of Losartan,Ordered 13 units of Efavirenz,Ordered 34 units of Clonidine,Ordered 15 units of Furosemide', 714.08, 'Pending', '2024-04-02 17:26:51', '2024-04-02 17:26:51'),
(28, '2024-04-02 18:02:31', 5, 'Ordered 25 units of Enalapril,Ordered 30 units of Hydrochlorothiazide,Ordered 2 units of Losartan,Ordered 13 units of Efavirenz,Ordered 34 units of Clonidine,Ordered 15 units of Furosemide', 714.08, 'Pending', '2024-04-02 18:20:18', '2024-04-02 18:20:18'),
(29, '2024-04-02 18:04:48', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-02 18:20:18', '2024-04-02 18:20:18'),
(30, '2024-04-02 18:13:56', 5, 'Ordered 8 units of Zidovudine,Ordered 5 units of Tenofovir,Ordered 12 units of Losartan', 221.13, 'Pending', '2024-04-02 18:20:18', '2024-04-02 18:20:18'),
(31, '2024-04-02 18:57:07', 6, 'Ordered 13 units of Efavirenz', 87.75, 'Paid', '2024-04-02 18:58:24', '2024-04-02 18:58:24'),
(32, '2024-04-02 19:51:20', 6, 'Ordered 13 units of Efavirenz,Ordered 3 units of Losartan', 117.72, 'Pending', '2024-04-02 19:51:30', '2024-04-02 19:51:30'),
(33, '2024-04-02 21:55:52', 6, 'Ordered 12 units of Diltiazem,Ordered 2 units of Enalapril', 111, 'Paid', '2024-04-02 21:56:06', '2024-04-02 21:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `statements`
--

CREATE TABLE `statements` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `paymentStatus` enum('Pending','Paid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statements`
--

INSERT INTO `statements` (`id`, `date`, `description`, `amount`, `userId`, `createdAt`, `updatedAt`, `OrderId`, `paymentStatus`) VALUES
(1, '2024-04-01 06:41:17', 'Ordered 2 units of Lamivudine', 11.98, 1, '2024-04-01 06:41:17', '2024-04-01 06:41:17', 2, 'Pending'),
(2, '2024-04-01 06:41:17', 'Ordered 3 units of Enalapril', 13.5, 1, '2024-04-01 06:41:17', '2024-04-01 06:41:17', 2, 'Pending'),
(3, '2024-04-01 06:41:17', 'Ordered 1 units of Losartan', 9.99, 1, '2024-04-01 06:41:17', '2024-04-01 06:41:17', 2, 'Pending'),
(4, '2024-04-01 07:30:58', 'Ordered 2 units of Lamivudine', 11.98, 2, '2024-04-01 07:30:58', '2024-04-01 07:30:58', 3, 'Pending'),
(5, '2024-04-01 07:30:58', 'Ordered 3 units of Enalapril', 13.5, 2, '2024-04-01 07:30:58', '2024-04-01 07:30:58', 3, 'Pending'),
(6, '2024-04-01 07:30:58', 'Ordered 1 units of Losartan', 9.99, 2, '2024-04-01 07:30:58', '2024-04-01 07:30:58', 3, 'Pending'),
(7, '2024-04-01 12:43:53', 'Ordered 8 units of Zidovudine', 60, 5, '2024-04-01 12:43:53', '2024-04-01 12:43:53', 4, 'Pending'),
(8, '2024-04-01 12:43:53', 'Ordered 5 units of Tenofovir', 41.25, 5, '2024-04-01 12:43:53', '2024-04-01 12:43:53', 4, 'Pending'),
(9, '2024-04-01 12:43:53', 'Ordered 12 units of Losartan', 119.88, 5, '2024-04-01 12:43:53', '2024-04-01 12:43:53', 4, 'Pending'),
(110, '2024-04-02 11:30:13', 'Ordered 8 units of Zidovudine', 60, 5, '2024-04-02 11:30:13', '2024-04-02 11:30:13', 42, 'Pending'),
(111, '2024-04-02 11:30:13', 'Ordered 5 units of Tenofovir', 41.25, 5, '2024-04-02 11:30:13', '2024-04-02 11:30:13', 42, 'Pending'),
(112, '2024-04-02 11:30:13', 'Ordered 12 units of Losartan', 119.88, 5, '2024-04-02 11:30:13', '2024-04-02 11:30:13', 42, 'Pending'),
(113, '2024-04-02 16:29:56', 'Ordered 10 units of Enalapril', 45, 5, '2024-04-02 16:29:56', '2024-04-02 16:29:56', 43, 'Pending'),
(114, '2024-04-02 16:54:35', 'Ordered 25 units of Enalapril', 112.5, 5, '2024-04-02 16:54:35', '2024-04-02 16:54:35', 44, 'Pending'),
(115, '2024-04-02 16:57:49', 'Ordered 25 units of Enalapril', 112.5, 5, '2024-04-02 16:57:49', '2024-04-02 16:57:49', 45, 'Pending'),
(116, '2024-04-02 16:57:49', 'Ordered 30 units of Hydrochlorothiazide', 157.5, 5, '2024-04-02 16:57:49', '2024-04-02 16:57:49', 45, 'Pending'),
(117, '2024-04-02 17:23:34', 'Ordered 25 units of Enalapril', 112.5, 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34', 46, 'Pending'),
(118, '2024-04-02 17:23:34', 'Ordered 30 units of Hydrochlorothiazide', 157.5, 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34', 46, 'Pending'),
(119, '2024-04-02 17:23:34', 'Ordered 2 units of Losartan', 19.98, 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34', 46, 'Pending'),
(120, '2024-04-02 17:23:34', 'Ordered 13 units of Efavirenz', 87.75, 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34', 46, 'Pending'),
(121, '2024-04-02 17:23:34', 'Ordered 34 units of Clonidine', 246.5, 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34', 46, 'Pending'),
(122, '2024-04-02 17:23:34', 'Ordered 15 units of Furosemide', 89.85, 5, '2024-04-02 17:23:34', '2024-04-02 17:23:34', 46, 'Pending'),
(123, '2024-04-02 18:02:31', 'Ordered 25 units of Enalapril', 112.5, 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31', 47, 'Pending'),
(124, '2024-04-02 18:02:31', 'Ordered 30 units of Hydrochlorothiazide', 157.5, 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31', 47, 'Pending'),
(125, '2024-04-02 18:02:31', 'Ordered 2 units of Losartan', 19.98, 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31', 47, 'Pending'),
(126, '2024-04-02 18:02:31', 'Ordered 13 units of Efavirenz', 87.75, 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31', 47, 'Pending'),
(127, '2024-04-02 18:02:31', 'Ordered 34 units of Clonidine', 246.5, 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31', 47, 'Pending'),
(128, '2024-04-02 18:02:31', 'Ordered 15 units of Furosemide', 89.85, 5, '2024-04-02 18:02:31', '2024-04-02 18:02:31', 47, 'Pending'),
(130, '2024-04-02 18:04:48', 'Ordered 8 units of Zidovudine', 60, 5, '2024-04-02 18:04:48', '2024-04-02 18:04:48', 49, 'Pending'),
(131, '2024-04-02 18:04:48', 'Ordered 5 units of Tenofovir', 41.25, 5, '2024-04-02 18:04:48', '2024-04-02 18:04:48', 49, 'Pending'),
(132, '2024-04-02 18:04:48', 'Ordered 12 units of Losartan', 119.88, 5, '2024-04-02 18:04:48', '2024-04-02 18:04:48', 49, 'Pending'),
(134, '2024-04-02 18:13:56', 'Ordered 8 units of Zidovudine', 60, 5, '2024-04-02 18:13:56', '2024-04-02 18:13:56', 51, 'Pending'),
(135, '2024-04-02 18:13:56', 'Ordered 5 units of Tenofovir', 41.25, 5, '2024-04-02 18:13:56', '2024-04-02 18:13:56', 51, 'Pending'),
(136, '2024-04-02 18:13:56', 'Ordered 12 units of Losartan', 119.88, 5, '2024-04-02 18:13:56', '2024-04-02 18:13:56', 51, 'Pending'),
(138, '2024-04-02 18:57:07', 'Ordered 13 units of Efavirenz', 87.75, 6, '2024-04-02 18:57:07', '2024-04-02 18:57:07', 53, 'Paid'),
(139, '2024-04-02 19:51:20', 'Ordered 13 units of Efavirenz', 87.75, 6, '2024-04-02 19:51:20', '2024-04-02 19:51:20', 54, 'Pending'),
(140, '2024-04-02 19:51:20', 'Ordered 3 units of Losartan', 29.97, 6, '2024-04-02 19:51:20', '2024-04-02 19:51:20', 54, 'Pending'),
(141, '2024-04-02 21:55:52', 'Ordered 12 units of Diltiazem', 102, 6, '2024-04-02 21:55:52', '2024-04-02 21:55:52', 55, 'Paid'),
(142, '2024-04-02 21:55:52', 'Ordered 2 units of Enalapril', 9, 6, '2024-04-02 21:55:52', '2024-04-02 21:55:52', 55, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `createdAt`, `updatedAt`) VALUES
(1, 'fnmhd', 'majpr@example.com', '$2b$10$H2OO.2ZN7KUOzRhUtvfHqe/OBC4XX/sXSZlg47mEBEJMvdnyk79ZO', '6144103948', '2024-03-30 08:30:17', '2024-03-30 08:30:17'),
(5, 'Likert', 'likert@example.com', '$2b$10$DympScguLWTDmVM9sK2jIevi8oTVy1aDltHBRR.0DogQuVhzcdrlS', '0712456723', '2024-03-30 09:47:53', '2024-03-30 09:47:53'),
(6, 'vic', 'vic@gmail.com', '$2b$10$p9c8Qc66Pjm3wie5TcfXA.nKBsVQNx3lTbEnMEBgjpe7uE0E3e6KW', '0790873452', '2024-04-02 12:55:34', '2024-04-02 12:55:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdrug`
--
ALTER TABLE `orderdrug`
  ADD PRIMARY KEY (`OrderId`,`DrugId`),
  ADD KEY `DrugId` (`DrugId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactionCode` (`transactionCode`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statements`
--
ALTER TABLE `statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderId` (`OrderId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `statements`
--
ALTER TABLE `statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdrug`
--
ALTER TABLE `orderdrug`
  ADD CONSTRAINT `orderdrug_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdrug_ibfk_2` FOREIGN KEY (`DrugId`) REFERENCES `drugs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `statements`
--
ALTER TABLE `statements`
  ADD CONSTRAINT `statements_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
