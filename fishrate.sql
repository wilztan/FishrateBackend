-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 12:57 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fishrate`
--
CREATE DATABASE IF NOT EXISTS `fishrate` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fishrate`;

-- --------------------------------------------------------

--
-- Table structure for table `caught`
--

CREATE TABLE `caught` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `caught`
--

INSERT INTO `caught` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2018-02-07 11:01:18', '2018-02-07 11:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `detail_caught`
--

CREATE TABLE `detail_caught` (
  `id` int(10) UNSIGNED NOT NULL,
  `fish_id` int(10) UNSIGNED NOT NULL,
  `caught_id` int(10) UNSIGNED NOT NULL,
  `fish_caught` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `detail_caught`
--

INSERT INTO `detail_caught` (`id`, `fish_id`, `caught_id`, `fish_caught`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '2018-02-07 11:01:18', '2018-02-07 11:01:18'),
(2, 2, 1, 6, '2018-02-07 11:01:18', '2018-02-07 11:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `fish`
--

CREATE TABLE `fish` (
  `id` int(10) UNSIGNED NOT NULL,
  `fish_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fish_photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fish`
--

INSERT INTO `fish` (`id`, `fish_name`, `base_price`, `fish_photo`, `created_at`, `updated_at`) VALUES
(1, 'Gurame', '23000', 'anjZgnq_700b.jpg', '2018-02-07 10:45:59', '2018-02-07 10:45:59'),
(2, 'Bandeng', '34000', 'aXv46rv_700b.jpg', '2018-02-07 10:46:33', '2018-02-07 10:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `id` int(10) UNSIGNED NOT NULL,
  `market_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `market_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `market_detail`
--

CREATE TABLE `market_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `market_id` int(10) UNSIGNED NOT NULL,
  `fish_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `birthdate`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ADM0001', 'Andrew', '$2y$10$mmsepSxKvzDg1HIO0Q5yP.TFXaOez4PbpzbWEV4zGWXRTvxEp.DMi', '1990-11-18', 'Admin', NULL, '2018-02-07 10:42:40', '2018-02-07 10:42:40'),
(2, 'FSH0001', 'David', '$2y$10$Dyd41M.2H6LgMmbFpuH5ju0AmkyQ8jFSa5RlRqU5NEixMt8mEO7ZG', '1979-02-15', 'Fisherman', NULL, '2018-02-07 10:44:33', '2018-02-07 10:44:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caught`
--
ALTER TABLE `caught`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caught_user_id_foreign` (`user_id`);

--
-- Indexes for table `detail_caught`
--
ALTER TABLE `detail_caught`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_caught_fish_id_foreign` (`fish_id`),
  ADD KEY `detail_caught_caught_id_foreign` (`caught_id`);

--
-- Indexes for table `fish`
--
ALTER TABLE `fish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market_detail`
--
ALTER TABLE `market_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `market_detail_fish_id_foreign` (`fish_id`),
  ADD KEY `market_detail_market_id_foreign` (`market_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caught`
--
ALTER TABLE `caught`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `detail_caught`
--
ALTER TABLE `detail_caught`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fish`
--
ALTER TABLE `fish`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_detail`
--
ALTER TABLE `market_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `caught`
--
ALTER TABLE `caught`
  ADD CONSTRAINT `caught_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `detail_caught`
--
ALTER TABLE `detail_caught`
  ADD CONSTRAINT `detail_caught_caught_id_foreign` FOREIGN KEY (`caught_id`) REFERENCES `caught` (`id`),
  ADD CONSTRAINT `detail_caught_fish_id_foreign` FOREIGN KEY (`fish_id`) REFERENCES `fish` (`id`);

--
-- Constraints for table `market_detail`
--
ALTER TABLE `market_detail`
  ADD CONSTRAINT `market_detail_fish_id_foreign` FOREIGN KEY (`fish_id`) REFERENCES `fish` (`id`),
  ADD CONSTRAINT `market_detail_market_id_foreign` FOREIGN KEY (`market_id`) REFERENCES `market` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
