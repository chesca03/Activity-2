-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 03:10 PM
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
-- Database: `user_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `attempt_time` datetime DEFAULT NULL,
  `attempt` enum('success','failed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `email`, `attempt_time`, `attempt`) VALUES
(9, 'fddfsdf@fsdfd', '2025-04-24 23:14:35', 'success'),
(10, 'fddfsdf@fsdfd', '2025-04-24 23:20:30', 'failed'),
(11, 'fddfsdf@fsdfd', '2025-04-24 23:20:32', 'failed'),
(12, 'fddfsdf@fsdfd', '2025-04-24 23:20:32', 'failed'),
(13, 'fddfsdf@fsdfd', '2025-04-24 23:20:33', 'failed'),
(14, 'fddfsdf@fsdfd', '2025-04-24 23:20:33', 'failed'),
(15, 'sdfsdfsd', '2025-04-26 00:15:58', 'failed'),
(16, 'sdfsf', '2025-04-26 00:21:16', 'failed'),
(17, 'asdfsdf', '2025-04-26 00:22:48', 'failed'),
(18, 'asdaasdfa@gmail.com', '2025-04-26 00:31:09', 'failed'),
(19, 'thelmajavierj@gmail.com', '2025-04-26 21:01:22', 'failed'),
(20, 'donut@gmail.com', '2025-04-26 21:02:10', 'success'),
(21, 'donut@gmail.com', '2025-04-26 21:02:19', 'failed'),
(22, 'donut@gmail.com', '2025-04-26 21:02:20', 'failed'),
(23, 'donut@gmail.com', '2025-04-26 21:02:21', 'failed'),
(24, 'donut@gmail.com', '2025-04-26 21:02:22', 'failed'),
(25, 'donut@gmail.com', '2025-04-26 21:02:23', 'failed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `created_at`) VALUES
(1, 'fdf', 'fddfsdf@fsdfd', '$2y$10$bO28COb5SNsf0VsmiWwF9uRqNK6pkG0NklZavuZW2uci/ns936.zm', '2025-04-25 06:00:58'),
(2, 'DONUT', 'dobut@gmail.com', '$2y$10$YJR1P50bZJwpYoipShXZq.4eBxuPVL96is5xZFBu9f4JNkLh5tuVO', '2025-04-25 16:26:22'),
(3, 'sdfsd', 'a@gmail.com', '$2y$10$pGb5j3zmfvtNFBOy3T0xbOKkbRyZ0.iFEmruDQfipr.boiriRhf/O', '2025-04-25 16:30:10'),
(6, 'sdfsd', 'jjo@gmail.com', '$2y$10$l4NZoa4Sm/XUcLDqllABeOPVsOC.ADdhyp4I2CNJWRqNotoTMtKy2', '2025-04-25 16:30:57'),
(7, 'donut', 'donut@gmail.com', '$2y$10$Gafv0r192GyqyV3VnJ8XeeBS0BjP579hEzS2rQiEyunOP8MdBHUdC', '2025-04-26 13:01:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
