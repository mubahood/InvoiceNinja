-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 02:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoiceninja`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2023-04-15 14:24:57'),
(3, 0, 10, 'My Workers', 'fa-users', 'auth/users', NULL, NULL, '2023-04-22 08:00:52'),
(19, 0, 11, 'Edit my profile', 'fa-edit', 'auth/setting', NULL, '2023-01-02 09:32:35', '2023-04-22 08:00:52'),
(46, 0, 2, 'Create new Invoice', 'fa-plus', 'invoices/create', NULL, '2023-04-15 14:24:50', '2023-04-19 09:01:12'),
(48, 0, 9, 'Products', 'fa-tags', 'products', NULL, '2023-04-19 08:19:16', '2023-04-22 08:00:52'),
(49, 0, 6, 'Invoices', 'fa-file-text-o', 'invoices', NULL, '2023-04-19 08:21:09', '2023-04-22 08:00:52'),
(50, 0, 8, 'Sales', 'fa-dollar', 'invoice-items', NULL, '2023-04-19 09:00:25', '2023-04-22 08:00:52'),
(51, 0, 3, 'Create quotation', 'fa-plus-square-o', 'quotations/create', NULL, '2023-04-22 06:53:16', '2023-04-22 06:53:21'),
(52, 0, 5, 'Quotations', 'fa-quote-right', 'quotations', NULL, '2023-04-22 06:54:47', '2023-04-22 08:00:52'),
(53, 0, 7, 'Deliveries', 'fa-archive', 'deliveries', NULL, '2023-04-22 07:48:52', '2023-04-22 08:00:52'),
(54, 0, 4, 'Create delivery note', 'fa-plus-circle', 'deliveries/create', NULL, '2023-04-22 08:00:44', '2023-04-22 08:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `input` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'products', 'GET', '127.0.0.1', '[]', '2023-04-22 09:06:40', '2023-04-22 09:06:40'),
(2, 1, '/', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-04-22 09:06:41', '2023-04-22 09:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `http_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2022-08-25 07:26:35', '2023-04-15 15:27:04'),
(2, 'Receptionist', 'receptionist', '2022-08-25 08:43:46', '2023-04-15 15:27:16'),
(3, 'Manager', 'manager', '2023-04-15 15:27:39', '2023-04-15 15:27:39'),
(4, 'Accountant', 'accountant', '2023-04-15 15:28:04', '2023-04-15 15:28:04'),
(5, 'CEO', 'ceo', '2023-04-15 15:28:19', '2023-04-15 15:28:19');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 13, NULL, NULL),
(1, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 1, NULL, NULL),
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `customer_contact` text DEFAULT NULL,
  `invoice_date` text DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `paid` text DEFAULT NULL,
  `balance` text DEFAULT NULL,
  `customer_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_items`
--

CREATE TABLE `delivery_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(0, 'Default location', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(1, 'Buikwe', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(2, 'Bukomansimbi', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(3, 'Butambala', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(4, 'Buvuma', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(5, 'Gomba', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(6, 'Kalangala', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(7, 'Kalungu', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(8, 'Kampala', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(9, 'Kayunga', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(10, 'Kiboga', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(11, 'Kyankwanzi', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(12, 'Luweero', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(13, 'Lwengo', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(14, 'Lyantonde', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(15, 'Masaka', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(16, 'Mityana', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(17, 'Mpigi', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(18, 'Mubende', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(19, 'Mukono', '2023-02-03 08:34:03', '2023-02-03 08:34:03'),
(20, 'Nakaseke', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(21, 'Nakasongola', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(22, 'Rakai', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(23, 'Sembabule', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(24, 'Wakiso', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(25, 'Amuria', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(26, 'Budaka', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(27, 'Bududa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(28, 'Bugiri', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(29, 'Bukedea', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(30, 'Bulambuli', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(31, 'Busia', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(32, 'Butaleja', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(33, 'Buyende', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(34, 'Iganga', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(35, 'Jinja', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(36, 'Kaliro', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(37, 'Kamuli', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(38, 'Kapchorwa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(39, 'Katakwi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(40, 'Kibuku', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(41, 'Kumi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(42, 'Kween', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(43, 'Luuka', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(44, 'Manafwa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(45, 'Mayuge', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(46, 'Mbale', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(47, 'Namayingo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(48, 'Namutumba', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(49, 'Ngora', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(50, 'Pallisa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(51, 'Serere', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(52, 'Sironko', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(53, 'Soroti', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(54, 'Tororo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(55, 'Abim', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(56, 'Agago', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(57, 'Alebtong', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(58, 'Amolatar', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(59, 'Amudat', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(60, 'Amuru', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(61, 'Apac', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(62, 'Dokolo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(63, 'Gulu', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(64, 'Kaabong', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(65, 'Kitgum', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(66, 'Kole', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(67, 'Kotido', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(68, 'Lamwo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(69, 'Lira', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(70, 'Moroto', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(71, 'Nakapiripirit', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(72, 'Napak', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(73, 'Nwoya', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(74, 'Otuke', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(75, 'Oyam', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(76, 'Pader', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(77, 'Buhweju', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(78, 'Buliisa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(79, 'Bundibugyo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(80, 'Bushenyi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(81, 'Hoima', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(82, 'Ibanda', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(83, 'Isingiro', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(84, 'Kabale', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(85, 'Kabarole', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(86, 'Kamwenge', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(87, 'Kanungu', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(88, 'Kasese', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(89, 'Kibaale', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(90, 'Kiruhura', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(91, 'Kiryandongo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(92, 'Kisoro', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(93, 'Kyegegwa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(94, 'Kyenjojo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(95, 'Masindi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(96, 'Mbarara', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(97, 'Mitooma', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(98, 'Ntoroko', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(99, 'Ntungamo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(100, 'Rubirizi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(101, 'Rukungiri', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(102, 'Sheema', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(103, 'Kagadi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(104, 'Kakumiro', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(105, 'Omoro', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(106, 'Rubanda', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(107, 'Namisindwa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(108, 'Pakwach', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(109, 'Butebo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(110, 'Rukiga', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(111, 'Kyotera', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(112, 'Bunyangabu', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(113, 'Nabilatuk', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(114, 'Bugweri', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(115, 'Kasanda', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(116, 'Kapelebyong', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(117, 'Kibuube', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(118, 'Obongi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(119, 'Kazo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(120, 'Rwampara', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(121, 'Kitagwenda', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(122, 'Madi-Okollo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(123, 'Karenga', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(124, 'Kalaki', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(125, 'kaberamaido', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(126, 'Kwania', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(127, 'Bukwa', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(128, 'Terego', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(129, 'Kitegwenda', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(130, 'Arua', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(131, 'Koboko', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(132, 'Adjumani', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(133, 'Maracha', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(134, 'Moyo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(135, 'Nebbi', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(136, 'Yumbe', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(137, 'Zombo', '2023-02-03 08:34:04', '2023-02-03 08:34:04'),
(1000000, 'Other locations', '2023-02-03 08:34:04', '2023-02-03 08:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `invoice_date` text DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `paid` text DEFAULT NULL,
  `balance` text DEFAULT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `customer_contact` varchar(255) DEFAULT NULL,
  `processed` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `created_at`, `updated_at`, `name`, `parent`, `photo`, `details`, `order`) VALUES
(0, '2022-06-10 03:50:57', '2022-06-10 03:50:57', 'Default location', 0, NULL, NULL, 0),
(1, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Buikwe', 0, '', 'District', 1),
(2, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Bukomansimbi', 0, '', 'District', 2),
(3, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Butambala', 0, '', 'District', 3),
(4, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Buvuma', 0, '', 'District', 4),
(5, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Gomba', 0, '', 'District', 5),
(6, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Kalangala', 0, '', 'District', 6),
(7, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Kalungu', 0, '', 'District', 7),
(8, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Kampala', 0, '', 'District', 8),
(9, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Kayunga', 0, '', 'District', 9),
(10, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Kiboga', 0, '', 'District', 10),
(11, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Kyankwanzi', 0, '', 'District', 11),
(12, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Luweero', 0, '', 'District', 12),
(13, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Lwengo', 0, '', 'District', 13),
(14, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Lyantonde', 0, '', 'District', 14),
(15, '2022-06-10 03:50:57', '2022-06-10 03:57:54', 'Masaka', 0, '', 'District', 15),
(16, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mityana', 0, '', 'District', 16),
(17, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mpigi', 0, '', 'District', 17),
(18, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mubende', 0, '', 'District', 18),
(19, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mukono', 0, '', 'District', 19),
(20, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Nakaseke', 0, '', 'District', 20),
(21, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Nakasongola', 0, '', 'District', 21),
(22, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Rakai', 0, '', 'District', 22),
(23, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Sembabule', 0, '', 'District', 23),
(24, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Wakiso', 0, '', 'District', 24),
(25, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Amuria', 0, '', 'District', 25),
(26, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Budaka', 0, '', 'District', 26),
(27, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bududa', 0, '', 'District', 27),
(28, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bugiri', 0, '', 'District', 28),
(29, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bukedea', 0, '', 'District', 29),
(30, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bulambuli', 0, '', 'District', 31),
(31, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Busia', 0, '', 'District', 32),
(32, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Butaleja', 0, '', 'District', 33),
(33, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Buyende', 0, '', 'District', 34),
(34, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Iganga', 0, '', 'District', 35),
(35, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Jinja', 0, '', 'District', 36),
(36, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kaliro', 0, '', 'District', 38),
(37, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kamuli', 0, '', 'District', 39),
(38, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kapchorwa', 0, '', 'District', 40),
(39, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Katakwi', 0, '', 'District', 41),
(40, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kibuku', 0, '', 'District', 42),
(41, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kumi', 0, '', 'District', 43),
(42, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kween', 0, '', 'District', 44),
(43, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Luuka', 0, '', 'District', 45),
(44, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Manafwa', 0, '', 'District', 46),
(45, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mayuge', 0, '', 'District', 47),
(46, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mbale', 0, '', 'District', 48),
(47, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Namayingo', 0, '', 'District', 49),
(48, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Namutumba', 0, '', 'District', 50),
(49, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Ngora', 0, '', 'District', 51),
(50, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Pallisa', 0, '', 'District', 52),
(51, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Serere', 0, '', 'District', 53),
(52, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Sironko', 0, '', 'District', 54),
(53, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Soroti', 0, '', 'District', 55),
(54, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Tororo', 0, '', 'District', 56),
(55, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Abim', 0, '', 'District', 57),
(56, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Agago', 0, '', 'District', 59),
(57, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Alebtong', 0, '', 'District', 60),
(58, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Amolatar', 0, '', 'District', 61),
(59, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Amudat', 0, '', 'District', 62),
(60, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Amuru', 0, '', 'District', 63),
(61, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Apac', 0, '', 'District', 64),
(62, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Dokolo', 0, '', 'District', 66),
(63, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Gulu', 0, '', 'District', 67),
(64, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kaabong', 0, '', 'District', 68),
(65, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kitgum', 0, '', 'District', 69),
(66, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kole', 0, '', 'District', 71),
(67, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kotido', 0, '', 'District', 72),
(68, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Lamwo', 0, '', 'District', 73),
(69, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Lira', 0, '', 'District', 74),
(70, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Moroto', 0, '', 'District', 76),
(71, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Nakapiripirit', 0, '', 'District', 78),
(72, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Napak', 0, '', 'District', 79),
(73, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Nwoya', 0, '', 'District', 81),
(74, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Otuke', 0, '', 'District', 82),
(75, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Oyam', 0, '', 'District', 83),
(76, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Pader', 0, '', 'District', 84),
(77, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Buhweju', 0, '', 'District', 87),
(78, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Buliisa', 0, '', 'District', 88),
(79, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bundibugyo', 0, '', 'District', 89),
(80, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bushenyi', 0, '', 'District', 90),
(81, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Hoima', 0, '', 'District', 91),
(82, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Ibanda', 0, '', 'District', 92),
(83, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Isingiro', 0, '', 'District', 93),
(84, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kabale', 0, '', 'District', 94),
(85, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kabarole', 0, '', 'District', 95),
(86, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kamwenge', 0, '', 'District', 96),
(87, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kanungu', 0, '', 'District', 97),
(88, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kasese', 0, '', 'District', 98),
(89, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kibaale', 0, '', 'District', 99),
(90, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kiruhura', 0, '', 'District', 100),
(91, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kiryandongo', 0, '', 'District', 101),
(92, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kisoro', 0, '', 'District', 102),
(93, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kyegegwa', 0, '', 'District', 103),
(94, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kyenjojo', 0, '', 'District', 104),
(95, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Masindi', 0, '', 'District', 105),
(96, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mbarara', 0, '', 'District', 106),
(97, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Mitooma', 0, '', 'District', 107),
(98, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Ntoroko', 0, '', 'District', 108),
(99, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Ntungamo', 0, '', 'District', 109),
(100, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Rubirizi', 0, '', 'District', 110),
(101, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Rukungiri', 0, '', 'District', 111),
(102, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Sheema', 0, '', 'District', 112),
(103, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kagadi', 0, '', 'District', 113),
(104, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kakumiro', 0, '', 'District', 114),
(105, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Omoro', 0, '', 'District', 115),
(106, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Rubanda', 0, '', 'District', 116),
(107, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Namisindwa', 0, '', 'District', 117),
(108, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Pakwach', 0, '', 'District', 118),
(109, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Butebo', 0, '', 'District', 119),
(110, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Rukiga', 0, '', 'District', 120),
(111, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kyotera', 0, '', 'District', 121),
(112, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bunyangabu', 0, '', 'District', 122),
(113, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Nabilatuk', 0, '', 'District', 123),
(114, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bugweri', 0, '', 'District', 124),
(115, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kasanda', 0, '', 'District', 125),
(116, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kapelebyong', 0, '', 'District', 127),
(117, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kibuube', 0, '', 'District', 128),
(118, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Obongi', 0, '', 'District', 129),
(119, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kazo', 0, '', 'District', 130),
(120, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Rwampara', 0, '', 'District', 131),
(121, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kitagwenda', 0, '', 'District', 132),
(122, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Madi-Okollo', 0, '', 'District', 133),
(123, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Karenga', 0, '', 'District', 134),
(124, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kalaki', 0, '', 'District', 136),
(125, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'kaberamaido', 0, '', 'District', 137),
(126, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kwania', 0, '', 'District', 138),
(127, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Bukwa', 0, '', 'District', 30),
(128, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Terego', 0, '', 'District', 139),
(129, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Kitegwenda', 0, '', 'District', 140),
(130, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Arua', 0, '', 'District', 65),
(131, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Koboko', 0, '', 'District', 70),
(132, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Adjumani', 0, '', 'District', 58),
(133, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Maracha', 0, '', 'District', 75),
(134, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Moyo', 0, '', 'District', 77),
(135, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Nebbi', 0, '', 'District', 80),
(136, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Yumbe', 0, '', 'District', 85),
(137, '2022-06-10 03:50:57', '2022-06-10 03:57:55', 'Zombo', 0, '', 'District', 86),
(1000000, '2022-06-10 08:01:46', '2022-06-10 08:01:46', 'Other locations', 0, NULL, 'District', 0),
(1000001, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Arinyapi', 132, 'Adjumani East County', 'Subcounty', 13),
(1000002, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Dzaipi', 132, 'Adjumani East County', 'Subcounty', 14),
(1000003, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Itirikwa', 132, 'Adjumani East County', 'Subcounty', 15),
(1000004, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Ofua', 132, 'Adjumani East County', 'Subcounty', 16),
(1000005, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Pakele', 132, 'Adjumani East County', 'Subcounty', 17),
(1000006, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Pakele Town Council', 132, 'Adjumani East County', 'Subcounty', 18),
(1000007, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Adjumani Town Council', 132, 'Adjumani West County', 'Subcounty', 19),
(1000008, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Adropi', 132, 'Adjumani West County', 'Subcounty', 20),
(1000009, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Ciforo', 132, 'Adjumani West County', 'Subcounty', 21),
(1000010, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Pachara', 132, 'Adjumani West County', 'Subcounty', 22),
(1000011, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Ukusijoni', 132, 'Adjumani West County', 'Subcounty', 23),
(1000012, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Adilang', 56, 'Agago County', 'Subcounty', 24),
(1000013, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Adilang Town Council', 56, 'Agago County', 'Subcounty', 25),
(1000014, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Agago Town Council', 56, 'Agago County', 'Subcounty', 26),
(1000015, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Agengo', 56, 'Agago County', 'Subcounty', 27),
(1000016, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Ajali', 56, 'Agago County', 'Subcounty', 28),
(1000017, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Arum', 56, 'Agago County', 'Subcounty', 29),
(1000018, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'GereGere', 56, 'Agago County', 'Subcounty', 30),
(1000019, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'KotoMor', 56, 'Agago County', 'Subcounty', 31),
(1000020, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lamiyo', 56, 'Agago County', 'Subcounty', 32),
(1000021, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Laperebong', 56, 'Agago County', 'Subcounty', 33),
(1000022, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lira-Palwo', 56, 'Agago County', 'Subcounty', 34),
(1000023, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lira-Palwo Town Council', 56, 'Agago County', 'Subcounty', 35),
(1000024, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lokole', 56, 'Agago County', 'Subcounty', 36),
(1000025, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Omot', 56, 'Agago County', 'Subcounty', 37),
(1000026, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Patongo', 56, 'Agago County', 'Subcounty', 38),
(1000027, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Patongo Town Council', 56, 'Agago County', 'Subcounty', 39),
(1000028, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Kalongo Town Council', 56, 'Agago North County', 'Subcounty', 40),
(1000029, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Kyuwee', 56, 'Agago North County', 'Subcounty', 41),
(1000030, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lai-Mutto Town Council', 56, 'Agago North County', 'Subcounty', 42),
(1000031, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lapono', 56, 'Agago North County', 'Subcounty', 43),
(1000032, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lira Kato', 56, 'Agago North County', 'Subcounty', 44),
(1000033, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Omiya Pacwa', 56, 'Agago North County', 'Subcounty', 45),
(1000034, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Paimol', 56, 'Agago North County', 'Subcounty', 46),
(1000035, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Parabongo', 56, 'Agago North County', 'Subcounty', 47),
(1000036, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Wol', 56, 'Agago North County', 'Subcounty', 48),
(1000037, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Wol Town Council', 56, 'Agago North County', 'Subcounty', 49),
(1000038, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Abako', 57, 'Ajuri County', 'Subcounty', 50),
(1000039, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Adwir', 57, 'Ajuri County', 'Subcounty', 51),
(1000040, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Amugu', 57, 'Ajuri County', 'Subcounty', 52),
(1000041, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Amugu Town Council', 57, 'Ajuri County', 'Subcounty', 53),
(1000042, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Angetta', 57, 'Ajuri County', 'Subcounty', 54),
(1000043, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Omoro', 57, 'Ajuri County', 'Subcounty', 55),
(1000044, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Abia', 57, 'Moroto County', 'Subcounty', 56),
(1000045, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Akura', 57, 'Moroto County', 'Subcounty', 57),
(1000046, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Alebtong Town Council', 57, 'Moroto County', 'Subcounty', 58),
(1000047, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Aloi', 57, 'Moroto County', 'Subcounty', 59),
(1000048, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Aloi Town Council', 57, 'Moroto County', 'Subcounty', 60),
(1000049, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Apala', 57, 'Moroto County', 'Subcounty', 61),
(1000050, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Apala Town Council', 57, 'Moroto County', 'Subcounty', 62),
(1000051, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Abiliyep', 59, 'UPE County', 'Subcounty', 63),
(1000052, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Achorichor', 59, 'UPE County', 'Subcounty', 64),
(1000053, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Amudat', 59, 'UPE County', 'Subcounty', 65),
(1000054, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Amudat Town Council', 59, 'UPE County', 'Subcounty', 66),
(1000055, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Karita', 59, 'UPE County', 'Subcounty', 67),
(1000056, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Katabok', 59, 'UPE County', 'Subcounty', 68),
(1000057, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Kongorok', 59, 'UPE County', 'Subcounty', 69),
(1000058, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Lokales', 59, 'UPE County', 'Subcounty', 70),
(1000059, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Loroo', 59, 'UPE County', 'Subcounty', 71),
(1000060, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Losidok', 59, 'UPE County', 'Subcounty', 72),
(1000061, '2022-06-10 05:10:37', '2022-06-10 05:10:37', 'Abarilela', 25, 'Amuria County', 'Subcounty', 73),
(1000062, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Amolo', 25, 'Amuria County', 'Subcounty', 75),
(1000063, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Amuria Town Council', 25, 'Amuria County', 'Subcounty', 76),
(1000064, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Apeduru', 25, 'Amuria County', 'Subcounty', 77),
(1000065, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Asamuk', 25, 'Amuria County', 'Subcounty', 78),
(1000066, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kuju', 25, 'Amuria County', 'Subcounty', 79),
(1000067, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Wera', 25, 'Amuria County', 'Subcounty', 80),
(1000068, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Willa', 25, 'Amuria County', 'Subcounty', 81),
(1000069, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Akeriau', 25, 'Orungo County', 'Subcounty', 82),
(1000070, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Morungatuny', 25, 'Orungo County', 'Subcounty', 83),
(1000071, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ogolai', 25, 'Orungo County', 'Subcounty', 84),
(1000072, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ogongora', 25, 'Orungo County', 'Subcounty', 85),
(1000073, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Olwa', 25, 'Orungo County', 'Subcounty', 86),
(1000074, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Orungo', 25, 'Orungo County', 'Subcounty', 87),
(1000075, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Amuru', 60, 'Kilak South County', 'Subcounty', 88),
(1000076, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Amuru Town Council', 60, 'Kilak South County', 'Subcounty', 89),
(1000077, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Guru Guru', 60, 'Kilak South County', 'Subcounty', 90),
(1000078, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Lakang', 60, 'Kilak South County', 'Subcounty', 91),
(1000079, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Lamogi', 60, 'Kilak South County', 'Subcounty', 92),
(1000080, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Layima', 60, 'Kilak South County', 'Subcounty', 93),
(1000081, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Agulu Division', 61, 'Apac Municipality', 'Subcounty', 94),
(1000082, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Akere Division', 61, 'Apac Municipality', 'Subcounty', 95),
(1000083, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Arocha Division', 61, 'Apac Municipality', 'Subcounty', 96),
(1000084, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Atik Division', 61, 'Apac Municipality', 'Subcounty', 97),
(1000085, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Akokoro', 61, 'Maruzi County', 'Subcounty', 98),
(1000086, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Akokoro Town Council', 61, 'Maruzi County', 'Subcounty', 99),
(1000087, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Apac', 61, 'Maruzi County', 'Subcounty', 100),
(1000088, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Apoi', 61, 'Maruzi County', 'Subcounty', 101),
(1000089, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Chegere', 61, 'Maruzi County', 'Subcounty', 102),
(1000090, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ibuje', 61, 'Maruzi County', 'Subcounty', 103),
(1000091, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ibuje Town Council', 61, 'Maruzi County', 'Subcounty', 104),
(1000092, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Te-Boke', 61, 'Maruzi County', 'Subcounty', 105),
(1000093, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Arua Hill', 130, 'Arua Municipality', 'Subcounty', 106),
(1000094, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Oli River', 130, 'Arua Municipality', 'Subcounty', 107),
(1000095, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Adumi', 130, 'Ayivu County', 'Subcounty', 108),
(1000096, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Aroi', 130, 'Ayivu County', 'Subcounty', 109),
(1000097, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ayivuni', 130, 'Ayivu County', 'Subcounty', 110),
(1000098, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Dadamu', 130, 'Ayivu County', 'Subcounty', 111),
(1000099, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Manibe', 130, 'Ayivu County', 'Subcounty', 112),
(1000100, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Oluko', 130, 'Ayivu County', 'Subcounty', 113),
(1000101, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Pajulu', 130, 'Ayivu County', 'Subcounty', 114),
(1000102, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ewanga', 1000000, 'Other county', 'Subcounty', 115),
(1000103, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ogoko', 1000000, 'Other county', 'Subcounty', 116),
(1000104, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Pawor', 1000000, 'Other county', 'Subcounty', 117),
(1000105, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Rhino camp', 1000000, 'Other county', 'Subcounty', 118),
(1000106, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Rigbo', 1000000, 'Other county', 'Subcounty', 119),
(1000107, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Odupi', 130, 'Terego East County', 'Subcounty', 120),
(1000108, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Omugo', 130, 'Terego East County', 'Subcounty', 121),
(1000109, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Uriama', 130, 'Terego East County', 'Subcounty', 122),
(1000110, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Anyiribu', 1000000, 'Other county', 'Subcounty', 130),
(1000111, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Offaka', 1000000, 'Other county', 'Subcounty', 132),
(1000112, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Okollo', 1000000, 'Other county', 'Subcounty', 134),
(1000113, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Uleppi', 1000000, 'Other county', 'Subcounty', 137),
(1000114, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Ajia', 130, 'Vurra County', 'Subcounty', 142),
(1000115, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Arivu', 130, 'Vurra County', 'Subcounty', 143),
(1000116, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Logiri', 130, 'Vurra County', 'Subcounty', 144),
(1000117, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Vurra', 130, 'Vurra County', 'Subcounty', 145),
(1000118, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Budaka', 26, 'Budaka County', 'Subcounty', 146),
(1000119, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Budaka Town Council', 26, 'Budaka County', 'Subcounty', 147),
(1000120, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kabuna', 26, 'Budaka County', 'Subcounty', 148),
(1000121, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kachomo', 26, 'Budaka County', 'Subcounty', 149),
(1000122, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kachomo Town Council', 26, 'Budaka County', 'Subcounty', 150),
(1000123, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kaderuna', 26, 'Budaka County', 'Subcounty', 151),
(1000124, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kakule', 26, 'Budaka County', 'Subcounty', 152),
(1000125, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Lyama', 26, 'Budaka County', 'Subcounty', 153),
(1000126, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Naboa', 26, 'Budaka County', 'Subcounty', 154),
(1000127, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Naboa Town Council', 26, 'Budaka County', 'Subcounty', 155),
(1000128, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Nansanga', 26, 'Budaka County', 'Subcounty', 156),
(1000129, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Tademeri', 26, 'Budaka County', 'Subcounty', 157),
(1000130, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Iki-Iki', 26, 'Iki-Iki County', 'Subcounty', 160),
(1000131, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Iki-Iki Town Council', 26, 'Iki-Iki County', 'Subcounty', 161),
(1000132, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kadimukoli', 26, 'Iki-Iki County', 'Subcounty', 162),
(1000133, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kakoli', 26, 'Iki-Iki County', 'Subcounty', 164),
(1000134, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kameruka', 26, 'Iki-Iki County', 'Subcounty', 165),
(1000135, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kamonkoli', 26, 'Iki-Iki County', 'Subcounty', 167),
(1000136, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kamonkoli Town Council', 26, 'Iki-Iki County', 'Subcounty', 168),
(1000137, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Katira', 26, 'Iki-Iki County', 'Subcounty', 169),
(1000138, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Mugiti', 26, 'Iki-Iki County', 'Subcounty', 170),
(1000139, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bubiita', 27, 'Lutseshe County', 'Subcounty', 176),
(1000140, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bufuma', 27, 'Lutseshe County', 'Subcounty', 177),
(1000141, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bukalasi', 27, 'Lutseshe County', 'Subcounty', 178),
(1000142, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bulucheke', 27, 'Lutseshe County', 'Subcounty', 179),
(1000143, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bumayoka', 27, 'Lutseshe County', 'Subcounty', 180),
(1000144, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bumwalukani', 27, 'Lutseshe County', 'Subcounty', 181),
(1000145, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bundesi', 27, 'Lutseshe County', 'Subcounty', 182),
(1000146, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bushiyi', 27, 'Lutseshe County', 'Subcounty', 183),
(1000147, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Busiriwa', 27, 'Lutseshe County', 'Subcounty', 184),
(1000148, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Buwali', 27, 'Lutseshe County', 'Subcounty', 185),
(1000149, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Kuushu Town Council', 27, 'Lutseshe County', 'Subcounty', 186),
(1000150, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Mabono', 27, 'Lutseshe County', 'Subcounty', 187),
(1000151, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Nalwanza', 27, 'Lutseshe County', 'Subcounty', 188),
(1000152, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bududa', 27, 'Manjiya County', 'Subcounty', 190),
(1000153, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bududa Town Council', 27, 'Manjiya County', 'Subcounty', 191),
(1000154, '2022-06-10 05:12:49', '2022-06-10 05:12:49', 'Bukibino', 27, 'Manjiya County', 'Subcounty', 192),
(1000155, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukibokolo', 27, 'Manjiya County', 'Subcounty', 193),
(1000156, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukigai', 27, 'Manjiya County', 'Subcounty', 194),
(1000157, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukigai Town Council', 27, 'Manjiya County', 'Subcounty', 195),
(1000158, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bumasheti', 27, 'Manjiya County', 'Subcounty', 197),
(1000159, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bunabutiti', 27, 'Manjiya County', 'Subcounty', 198),
(1000160, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bunatsami', 27, 'Manjiya County', 'Subcounty', 200),
(1000161, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bushika', 27, 'Manjiya County', 'Subcounty', 201),
(1000162, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bushiribo', 27, 'Manjiya County', 'Subcounty', 203),
(1000163, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikholo Town Council', 27, 'Manjiya County', 'Subcounty', 204),
(1000164, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabweya', 27, 'Manjiya County', 'Subcounty', 207),
(1000165, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nakatsi', 27, 'Manjiya County', 'Subcounty', 210),
(1000166, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nangako Town Council', 27, 'Manjiya County', 'Subcounty', 211),
(1000167, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Eastern Division', 28, 'Bugiri Municipality', 'Subcounty', 212),
(1000168, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Western Division', 28, 'Bugiri Municipality', 'Subcounty', 213),
(1000169, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Budhaya', 28, 'Bukooli County Central', 'Subcounty', 214),
(1000170, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulesa', 28, 'Bukooli County Central', 'Subcounty', 215),
(1000171, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulidha', 28, 'Bukooli County Central', 'Subcounty', 216),
(1000172, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busowa Town Council', 28, 'Bukooli County Central', 'Subcounty', 218),
(1000173, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buwuni Town Council', 28, 'Bukooli County Central', 'Subcounty', 219),
(1000174, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buwunga', 28, 'Bukooli County Central', 'Subcounty', 220),
(1000175, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muterere', 28, 'Bukooli County Central', 'Subcounty', 221),
(1000176, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muterere Town Council', 28, 'Bukooli County Central', 'Subcounty', 222),
(1000177, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nankoma Town Council', 28, 'Bukooli County Central', 'Subcounty', 223),
(1000178, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nankoma', 28, 'Bukooli County Central', 'Subcounty', 224),
(1000179, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buluguyi', 28, 'Bukooli County North', 'Subcounty', 225),
(1000180, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Iwemba', 28, 'Bukooli County North', 'Subcounty', 226),
(1000181, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapyanga', 28, 'Bukooli County North', 'Subcounty', 227),
(1000182, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabukalu', 28, 'Bukooli County North', 'Subcounty', 228),
(1000183, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabukalu Town Council', 28, 'Bukooli County North', 'Subcounty', 229),
(1000184, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namayemba Town Council', 28, 'Bukooli County North', 'Subcounty', 230),
(1000185, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busembatia Town Council', 114, 'Bugweri County', 'Subcounty', 231),
(1000186, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyanga', 114, 'Bugweri County', 'Subcounty', 232),
(1000187, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ibulanku', 114, 'Bugweri County', 'Subcounty', 233),
(1000188, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Igombe', 114, 'Bugweri County', 'Subcounty', 234),
(1000189, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Makuutu', 114, 'Bugweri County', 'Subcounty', 235),
(1000190, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namalemba', 114, 'Bugweri County', 'Subcounty', 236),
(1000191, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bihanga', 77, 'Buhweju County', 'Subcounty', 239),
(1000192, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bitsya', 77, 'Buhweju County', 'Subcounty', 240),
(1000193, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhunga', 77, 'Buhweju County', 'Subcounty', 241),
(1000194, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Burere', 77, 'Buhweju County', 'Subcounty', 242),
(1000195, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Engaju', 77, 'Buhweju County', 'Subcounty', 243),
(1000196, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karungu', 77, 'Buhweju County', 'Subcounty', 244),
(1000197, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kashenyi-Kajani Town Council', 77, 'Buhweju County', 'Subcounty', 245),
(1000198, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyahenda', 77, 'Buhweju County', 'Subcounty', 246),
(1000199, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nsiika Town Council', 77, 'Buhweju County', 'Subcounty', 247),
(1000200, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakashaka Town Council', 77, 'Buhweju County', 'Subcounty', 248),
(1000201, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakaziba Town Council', 77, 'Buhweju County', 'Subcounty', 249),
(1000202, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakishana', 77, 'Buhweju County', 'Subcounty', 250),
(1000203, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rubengye', 77, 'Buhweju County', 'Subcounty', 251),
(1000204, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwengwe', 77, 'Buhweju County', 'Subcounty', 252),
(1000205, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buikwe', 1, 'Buikwe County South', 'Subcounty', 253),
(1000206, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buikwe Town Council', 1, 'Buikwe County South', 'Subcounty', 254),
(1000207, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiyindi Town Council', 1, 'Buikwe County South', 'Subcounty', 255),
(1000208, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Najja', 1, 'Buikwe County South', 'Subcounty', 256),
(1000209, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngogwe', 1, 'Buikwe County South', 'Subcounty', 257),
(1000210, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkokonjeru Town Council', 1, 'Buikwe County South', 'Subcounty', 259),
(1000211, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'SSI', 1, 'Buikwe County South', 'Subcounty', 260),
(1000212, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Central Division', 1, 'Lugazi Municipality', 'Subcounty', 261),
(1000213, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kawolo Division', 1, 'Lugazi Municipality', 'Subcounty', 262),
(1000214, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Najjembe Division', 1, 'Lugazi Municipality', 'Subcounty', 264),
(1000215, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Njeru Division', 1, 'Njeru Municipality', 'Subcounty', 265),
(1000216, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyenga Division', 1, 'Njeru Municipality', 'Subcounty', 266),
(1000217, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Wakisi Division', 1, 'Njeru Municipality', 'Subcounty', 267),
(1000218, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Aminit', 29, 'Bukedea County', 'Subcounty', 268),
(1000219, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukedea', 29, 'Bukedea County', 'Subcounty', 269),
(1000220, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukedea Town Council', 29, 'Bukedea County', 'Subcounty', 270),
(1000221, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabarwa', 29, 'Bukedea County', 'Subcounty', 271),
(1000222, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamutur', 29, 'Bukedea County', 'Subcounty', 272),
(1000223, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kangole', 29, 'Bukedea County', 'Subcounty', 273),
(1000224, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kidongole', 29, 'Bukedea County', 'Subcounty', 274),
(1000225, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kocheka', 29, 'Bukedea County', 'Subcounty', 275),
(1000226, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Koena', 29, 'Bukedea County', 'Subcounty', 276),
(1000227, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kolir', 29, 'Bukedea County', 'Subcounty', 277),
(1000228, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Molera', 29, 'Bukedea County', 'Subcounty', 278),
(1000229, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Malera', 29, 'Bukedea County', 'Subcounty', 279),
(1000230, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Aligoi', 29, 'Kachumbala County', 'Subcounty', 280),
(1000231, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kachumbala', 29, 'Kachumbala County', 'Subcounty', 281),
(1000232, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Komuge', 29, 'Kachumbala County', 'Subcounty', 282),
(1000233, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kongunga Town Council', 29, 'Kachumbala County', 'Subcounty', 283),
(1000234, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kwarikwar', 29, 'Kachumbala County', 'Subcounty', 284),
(1000235, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bigasa', 2, 'Bukomansimbi North County', 'Subcounty', 285),
(1000236, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukango', 2, 'Bukomansimbi North County', 'Subcounty', 286),
(1000237, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitanda', 2, 'Bukomansimbi North County', 'Subcounty', 287),
(1000238, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butenga', 2, 'Bukomansimbi South County', 'Subcounty', 288),
(1000239, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibinge', 2, 'Bukomansimbi South County', 'Subcounty', 289),
(1000240, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Amanang', 127, 'Kongasis County', 'Subcounty', 290),
(1000241, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Brim', 127, 'Kongasis County', 'Subcounty', 291),
(1000242, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukwa', 127, 'Kongasis County', 'Subcounty', 292),
(1000243, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukwo Town Council', 127, 'Kongasis County', 'Subcounty', 293),
(1000244, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Chepkwasta', 127, 'Kongasis County', 'Subcounty', 294),
(1000245, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Chesower', 127, 'Kongasis County', 'Subcounty', 295),
(1000246, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabei', 127, 'Kongasis County', 'Subcounty', 296),
(1000247, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamet', 127, 'Kongasis County', 'Subcounty', 297),
(1000248, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapkoros', 127, 'Kongasis County', 'Subcounty', 298),
(1000249, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapsarur', 127, 'Kongasis County', 'Subcounty', 299),
(1000250, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaptererwo', 127, 'Kongasis County', 'Subcounty', 300),
(1000251, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kortek', 127, 'Kongasis County', 'Subcounty', 301),
(1000252, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lwongon', 127, 'Kongasis County', 'Subcounty', 303),
(1000253, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mutushet', 127, 'Kongasis County', 'Subcounty', 304),
(1000254, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Riwo', 127, 'Kongasis County', 'Subcounty', 305),
(1000255, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Senendet', 127, 'Kongasis County', 'Subcounty', 306),
(1000256, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Suam', 127, 'Kongasis County', 'Subcounty', 307),
(1000257, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tulel', 127, 'Kongasis County', 'Subcounty', 308),
(1000258, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukhalu', 30, 'Bulambuli County', 'Subcounty', 309),
(1000259, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulambuli Town Council', 30, 'Bulambuli County', 'Subcounty', 310),
(1000260, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bumufuni', 30, 'Bulambuli County', 'Subcounty', 311),
(1000261, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bunalwere', 30, 'Bulambuli County', 'Subcounty', 312),
(1000262, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bunambutye', 30, 'Bulambuli County', 'Subcounty', 313),
(1000263, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyaga Town Council', 30, 'Bulambuli County', 'Subcounty', 314),
(1000264, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwikhonge', 30, 'Bulambuli County', 'Subcounty', 315),
(1000265, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muyembe', 30, 'Bulambuli County', 'Subcounty', 316),
(1000266, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabbongo', 30, 'Bulambuli County', 'Subcounty', 317),
(1000267, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bufumbo', 30, 'Elgon County', 'Subcounty', 318),
(1000268, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buginyanya', 30, 'Elgon County', 'Subcounty', 319),
(1000269, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulago', 30, 'Elgon County', 'Subcounty', 320),
(1000270, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulegeni', 30, 'Elgon County', 'Subcounty', 321),
(1000271, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulegeni Town Council', 30, 'Elgon County', 'Subcounty', 322),
(1000272, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buluganya', 30, 'Elgon County', 'Subcounty', 323),
(1000273, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bumasobo', 30, 'Elgon County', 'Subcounty', 324),
(1000274, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bumugibole', 30, 'Elgon County', 'Subcounty', 325),
(1000275, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamu', 30, 'Elgon County', 'Subcounty', 326),
(1000276, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lusha', 30, 'Elgon County', 'Subcounty', 327),
(1000277, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masira', 30, 'Elgon County', 'Subcounty', 328),
(1000278, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabiwutulu', 30, 'Elgon County', 'Subcounty', 329),
(1000279, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namisuni', 30, 'Elgon County', 'Subcounty', 330),
(1000280, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Simu', 30, 'Elgon County', 'Subcounty', 331),
(1000281, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sisiyi', 30, 'Elgon County', 'Subcounty', 332),
(1000282, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sotti', 30, 'Elgon County', 'Subcounty', 333),
(1000283, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Biiso', 78, 'Buliisa County', 'Subcounty', 334),
(1000284, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Biiso Town Council', 78, 'Buliisa County', 'Subcounty', 335),
(1000285, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buliisa', 78, 'Buliisa County', 'Subcounty', 336),
(1000286, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buliisa Town Council', 78, 'Buliisa County', 'Subcounty', 337),
(1000287, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butiaba', 78, 'Buliisa County', 'Subcounty', 338),
(1000288, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butiaba Town Council', 78, 'Buliisa County', 'Subcounty', 339),
(1000289, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigwera', 78, 'Buliisa County', 'Subcounty', 340),
(1000290, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kihungya', 78, 'Buliisa County', 'Subcounty', 341),
(1000291, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngwedo', 78, 'Buliisa County', 'Subcounty', 342),
(1000292, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukonzo', 79, 'Bughendera County', 'Subcounty', 343),
(1000293, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Burondo', 79, 'Bughendera County', 'Subcounty', 344),
(1000294, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butama-Mitunda Town Council', 79, 'Bughendera County', 'Subcounty', 345),
(1000295, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Harugali', 79, 'Bughendera County', 'Subcounty', 346),
(1000296, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagugu', 79, 'Bughendera County', 'Subcounty', 347),
(1000297, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasitu', 79, 'Bughendera County', 'Subcounty', 348),
(1000298, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mabere', 79, 'Bughendera County', 'Subcounty', 349),
(1000299, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mbatya', 79, 'Bughendera County', 'Subcounty', 350),
(1000300, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ndugutu', 79, 'Bughendera County', 'Subcounty', 351),
(1000301, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngamba', 79, 'Bughendera County', 'Subcounty', 352),
(1000302, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngite', 79, 'Bughendera County', 'Subcounty', 353),
(1000303, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ntandi Town Council', 79, 'Bughendera County', 'Subcounty', 354),
(1000304, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ntotoro', 79, 'Bughendera County', 'Subcounty', 355),
(1000305, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sindila', 79, 'Bughendera County', 'Subcounty', 356),
(1000306, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bubandi', 79, 'Bwamba County', 'Subcounty', 357),
(1000307, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bubukwanga', 79, 'Bwamba County', 'Subcounty', 358),
(1000308, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukanikere Town Council', 79, 'Bwamba County', 'Subcounty', 359),
(1000309, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bundibugyo Town Council', 79, 'Bwamba County', 'Subcounty', 360),
(1000310, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bundingoma Town Council', 79, 'Bwamba County', 'Subcounty', 361),
(1000311, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busaru', 79, 'Bwamba County', 'Subcounty', 362),
(1000312, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busunga Town Council', 79, 'Bwamba County', 'Subcounty', 363),
(1000313, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kirumya', 79, 'Bwamba County', 'Subcounty', 364),
(1000314, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisubba', 79, 'Bwamba County', 'Subcounty', 365),
(1000315, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mirambi', 79, 'Bwamba County', 'Subcounty', 366),
(1000316, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyahuka Town Council', 79, 'Bwamba County', 'Subcounty', 367),
(1000317, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tokwe', 79, 'Bwamba County', 'Subcounty', 368),
(1000318, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buheesi', 112, 'Bunyangabu County', 'Subcounty', 369),
(1000319, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buheesi Town Council', 112, 'Bunyangabu County', 'Subcounty', 370),
(1000320, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabonero', 112, 'Bunyangabu County', 'Subcounty', 371),
(1000321, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kateebwa', 112, 'Bunyangabu County', 'Subcounty', 372),
(1000322, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibiito', 112, 'Bunyangabu County', 'Subcounty', 373),
(1000323, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibiito Town Council', 112, 'Bunyangabu County', 'Subcounty', 374),
(1000324, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisomoro', 112, 'Bunyangabu County', 'Subcounty', 375),
(1000325, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiyombya', 112, 'Bunyangabu County', 'Subcounty', 376),
(1000326, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamukube Town Council', 112, 'Bunyangabu County', 'Subcounty', 377),
(1000327, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rubona Town Council', 112, 'Bunyangabu County', 'Subcounty', 378),
(1000328, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwimi', 112, 'Bunyangabu County', 'Subcounty', 379),
(1000329, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwimi Town Council', 112, 'Bunyangabu County', 'Subcounty', 380),
(1000330, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ishaka Division', 80, 'Bushenyi -Ishaka Municipality', 'Subcounty', 382),
(1000331, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakabirizi Division', 80, 'Bushenyi -Ishaka Municipality', 'Subcounty', 383),
(1000332, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bumbaire', 80, 'Igara County East', 'Subcounty', 384),
(1000333, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ibaare', 80, 'Igara County East', 'Subcounty', 385),
(1000334, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyabugimbi', 80, 'Igara County East', 'Subcounty', 386),
(1000335, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyabugimbi Town Council', 80, 'Igara County East', 'Subcounty', 387),
(1000336, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyeizooba', 80, 'Igara County East', 'Subcounty', 388),
(1000337, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruhumuro', 80, 'Igara County East', 'Subcounty', 389),
(1000338, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwentuha Town Council', 80, 'Igara County East', 'Subcounty', 390),
(1000339, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bitooma Town Council', 80, 'Igara County West', 'Subcounty', 391),
(1000340, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakanju', 80, 'Igara County West', 'Subcounty', 392),
(1000341, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kizinda Town Council', 80, 'Igara County West', 'Subcounty', 393),
(1000342, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamuhunga Town Council', 80, 'Igara County West', 'Subcounty', 394),
(1000343, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamuhunga', 80, 'Igara County West', 'Subcounty', 395),
(1000344, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkanga', 80, 'Igara County West', 'Subcounty', 396),
(1000345, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyabubare', 80, 'Igara County West', 'Subcounty', 397),
(1000346, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulumbi', 31, 'Samia Bugwe County North', 'Subcounty', 400);
INSERT INTO `locations` (`id`, `created_at`, `updated_at`, `name`, `parent`, `photo`, `details`, `order`) VALUES
(1000347, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busitema', 31, 'Samia Bugwe County North', 'Subcounty', 401),
(1000348, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buteba', 31, 'Samia Bugwe County North', 'Subcounty', 402),
(1000349, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Dabani', 31, 'Samia Bugwe County North', 'Subcounty', 404),
(1000350, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namugondi Town Council', 31, 'Samia Bugwe County North', 'Subcounty', 405),
(1000351, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sikuda', 31, 'Samia Bugwe County North', 'Subcounty', 406),
(1000352, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tiira Town Council', 31, 'Samia Bugwe County North', 'Subcounty', 407),
(1000353, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhehe', 31, 'Samia Bugwe County South', 'Subcounty', 408),
(1000354, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busime', 31, 'Samia Bugwe County South', 'Subcounty', 409),
(1000355, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lumino', 31, 'Samia Bugwe County South', 'Subcounty', 410),
(1000356, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lumino-Majani Town Council', 31, 'Samia Bugwe County South', 'Subcounty', 411),
(1000357, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lumino-Majanji Town Council', 31, 'Samia Bugwe County South', 'Subcounty', 412),
(1000358, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lunyo', 31, 'Samia Bugwe County South', 'Subcounty', 413),
(1000359, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Majanji', 31, 'Samia Bugwe County South', 'Subcounty', 414),
(1000360, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masaba', 31, 'Samia Bugwe County South', 'Subcounty', 415),
(1000361, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masafu', 31, 'Samia Bugwe County South', 'Subcounty', 416),
(1000362, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masafu Town Council', 31, 'Samia Bugwe County South', 'Subcounty', 417),
(1000363, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masinya', 31, 'Samia Bugwe County South', 'Subcounty', 418),
(1000364, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bufujja-Kachonga Town Council', 32, 'Bunyole East County', 'Subcounty', 419),
(1000365, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butaleja', 32, 'Bunyole East County', 'Subcounty', 420),
(1000366, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butaleja Town Council', 32, 'Bunyole East County', 'Subcounty', 421),
(1000367, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Himutu', 32, 'Bunyole East County', 'Subcounty', 422),
(1000368, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kachonga', 32, 'Bunyole East County', 'Subcounty', 423),
(1000369, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'MaziMasa', 32, 'Bunyole East County', 'Subcounty', 424),
(1000370, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabiganda Town Council', 32, 'Bunyole East County', 'Subcounty', 425),
(1000371, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Naweyo', 32, 'Bunyole East County', 'Subcounty', 426),
(1000372, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Budumba', 32, 'Bunyole West County', 'Subcounty', 427),
(1000373, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busaba', 32, 'Bunyole West County', 'Subcounty', 428),
(1000374, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busaba Town Council', 32, 'Bunyole West County', 'Subcounty', 429),
(1000375, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busabi', 32, 'Bunyole West County', 'Subcounty', 430),
(1000376, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busolwe', 32, 'Bunyole West County', 'Subcounty', 431),
(1000377, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busolwe Town Council', 32, 'Bunyole West County', 'Subcounty', 432),
(1000378, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawanjofu', 32, 'Bunyole West County', 'Subcounty', 433),
(1000379, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Budde', 3, 'Butambala County', 'Subcounty', 434),
(1000380, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulo', 3, 'Butambala County', 'Subcounty', 435),
(1000381, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Gombe Town Council', 3, 'Butambala County', 'Subcounty', 436),
(1000382, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kalamba', 3, 'Butambala County', 'Subcounty', 437),
(1000383, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibibi', 3, 'Butambala County', 'Subcounty', 438),
(1000384, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngando', 3, 'Butambala County', 'Subcounty', 439),
(1000385, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butebo', 109, 'Butebo County', 'Subcounty', 440),
(1000386, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabelai', 109, 'Butebo County', 'Subcounty', 441),
(1000387, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabwangasi', 109, 'Butebo County', 'Subcounty', 442),
(1000388, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabwangasi Town Council', 109, 'Butebo County', 'Subcounty', 443),
(1000389, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kachuru', 109, 'Butebo County', 'Subcounty', 444),
(1000390, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kadokolene', 109, 'Butebo County', 'Subcounty', 445),
(1000391, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakoro', 109, 'Butebo County', 'Subcounty', 446),
(1000392, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakoro Town Council', 109, 'Butebo County', 'Subcounty', 447),
(1000393, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanginima', 109, 'Butebo County', 'Subcounty', 448),
(1000394, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanyum', 109, 'Butebo County', 'Subcounty', 449),
(1000395, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapunyasi', 109, 'Butebo County', 'Subcounty', 450),
(1000396, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'MaiziMasa', 109, 'Butebo County', 'Subcounty', 451),
(1000397, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Petete', 109, 'Butebo County', 'Subcounty', 452),
(1000398, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Putti', 109, 'Butebo County', 'Subcounty', 453),
(1000399, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugaya', 4, 'Buvuma Islands County', 'Subcounty', 454),
(1000400, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busamuzi', 4, 'Buvuma Islands County', 'Subcounty', 455),
(1000401, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buvuma Town Council', 4, 'Buvuma Islands County', 'Subcounty', 456),
(1000402, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buwooya', 4, 'Buvuma Islands County', 'Subcounty', 457),
(1000403, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bweema', 4, 'Buvuma Islands County', 'Subcounty', 458),
(1000404, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lubya', 4, 'Buvuma Islands County', 'Subcounty', 459),
(1000405, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lubya Town Council', 4, 'Buvuma Islands County', 'Subcounty', 460),
(1000406, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lwaje', 4, 'Buvuma Islands County', 'Subcounty', 461),
(1000407, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lyabaana', 4, 'Buvuma Islands County', 'Subcounty', 462),
(1000408, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nairambi', 4, 'Buvuma Islands County', 'Subcounty', 463),
(1000409, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Gumpi', 33, 'Budiope East County', 'Subcounty', 465),
(1000410, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Irundu', 33, 'Budiope East County', 'Subcounty', 466),
(1000411, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Irundu Town Council', 33, 'Budiope East County', 'Subcounty', 467),
(1000412, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagulu', 33, 'Budiope East County', 'Subcounty', 468),
(1000413, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngandho', 33, 'Budiope East County', 'Subcounty', 469),
(1000414, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukungu Town Council', 33, 'Budiope West County', 'Subcounty', 470),
(1000415, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyanja', 33, 'Budiope West County', 'Subcounty', 471),
(1000416, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyende', 33, 'Budiope West County', 'Subcounty', 472),
(1000417, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyende Town Council', 33, 'Budiope West County', 'Subcounty', 473),
(1000418, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kidera', 33, 'Budiope West County', 'Subcounty', 474),
(1000419, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kidera Town Council', 33, 'Budiope West County', 'Subcounty', 475),
(1000420, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ndolwa', 33, 'Budiope West County', 'Subcounty', 476),
(1000421, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkondo', 33, 'Budiope West County', 'Subcounty', 477),
(1000422, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Adok', 62, 'Dokolo North County', 'Subcounty', 478),
(1000423, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Agwata Town Council', 62, 'Dokolo North County', 'Subcounty', 479),
(1000424, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Agwatta', 62, 'Dokolo North County', 'Subcounty', 480),
(1000425, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Amwoma', 62, 'Dokolo North County', 'Subcounty', 481),
(1000426, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bata Town Council', 62, 'Dokolo North County', 'Subcounty', 482),
(1000427, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Batta', 62, 'Dokolo North County', 'Subcounty', 483),
(1000428, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Dokolo', 62, 'Dokolo North County', 'Subcounty', 484),
(1000429, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Okwalongwen', 62, 'Dokolo North County', 'Subcounty', 485),
(1000430, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Adeknino', 62, 'Dokolo South County', 'Subcounty', 486),
(1000431, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Dokolo Town Council', 62, 'Dokolo South County', 'Subcounty', 487),
(1000432, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kangai', 62, 'Dokolo South County', 'Subcounty', 488),
(1000433, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kangai Town Council', 62, 'Dokolo South County', 'Subcounty', 489),
(1000434, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kwera', 62, 'Dokolo South County', 'Subcounty', 490),
(1000435, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Okwongodul', 62, 'Dokolo South County', 'Subcounty', 491),
(1000436, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanoni Town Council', 5, 'Gomba East County', 'Subcounty', 492),
(1000437, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyegonza', 5, 'Gomba East County', 'Subcounty', 493),
(1000438, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpenja', 5, 'Gomba East County', 'Subcounty', 494),
(1000439, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ttaba-Bbinzi', 5, 'Gomba East County', 'Subcounty', 495),
(1000440, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabulasoke', 5, 'Gomba West County', 'Subcounty', 496),
(1000441, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kifampa', 5, 'Gomba West County', 'Subcounty', 497),
(1000442, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyayi', 5, 'Gomba West County', 'Subcounty', 498),
(1000443, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Maddu', 5, 'Gomba West County', 'Subcounty', 499),
(1000444, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Maddu Town Council', 5, 'Gomba West County', 'Subcounty', 500),
(1000445, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Awach', 63, 'Aswa County', 'Subcounty', 501),
(1000446, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bungatira', 63, 'Aswa County', 'Subcounty', 502),
(1000447, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Laliya', 63, 'Aswa County', 'Subcounty', 503),
(1000448, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Omel', 63, 'Aswa County', 'Subcounty', 504),
(1000449, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Owalo', 63, 'Aswa County', 'Subcounty', 505),
(1000450, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Owoo', 63, 'Aswa County', 'Subcounty', 506),
(1000451, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Paibona', 63, 'Aswa County', 'Subcounty', 507),
(1000452, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Paicho', 63, 'Aswa County', 'Subcounty', 508),
(1000453, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Palaro', 63, 'Aswa County', 'Subcounty', 509),
(1000454, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Patiko', 63, 'Aswa County', 'Subcounty', 510),
(1000455, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Pukony', 63, 'Aswa County', 'Subcounty', 511),
(1000456, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Unyama', 63, 'Aswa County', 'Subcounty', 512),
(1000457, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bar-dege', 63, 'Gulu Municipality', 'Subcounty', 513),
(1000458, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Laroo', 63, 'Gulu Municipality', 'Subcounty', 514),
(1000459, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Layibi', 63, 'Gulu Municipality', 'Subcounty', 515),
(1000460, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Pece', 63, 'Gulu Municipality', 'Subcounty', 516),
(1000461, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhanika', 81, 'Bugahya County', 'Subcounty', 517),
(1000462, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buraru', 81, 'Bugahya County', 'Subcounty', 518),
(1000463, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buseruka', 81, 'Bugahya County', 'Subcounty', 519),
(1000464, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabaale', 81, 'Bugahya County', 'Subcounty', 520),
(1000465, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitoba', 81, 'Bugahya County', 'Subcounty', 521),
(1000466, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyabigambire', 81, 'Bugahya County', 'Subcounty', 522),
(1000467, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bujumbura Division', 81, 'Hoima Municipality', 'Subcounty', 523),
(1000468, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busiisi Division', 81, 'Hoima Municipality', 'Subcounty', 524),
(1000469, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kahoora Division', 81, 'Hoima Municipality', 'Subcounty', 525),
(1000470, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mparo Division', 81, 'Hoima Municipality', 'Subcounty', 526),
(1000471, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bombo', 81, 'Kigorobya County', 'Subcounty', 527),
(1000472, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapaapi', 81, 'Kigorobya County', 'Subcounty', 528),
(1000473, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiganja', 81, 'Kigorobya County', 'Subcounty', 529),
(1000474, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigorobya', 81, 'Kigorobya County', 'Subcounty', 530),
(1000475, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigorobya Town Council', 81, 'Kigorobya County', 'Subcounty', 531),
(1000476, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kijongo', 81, 'Kigorobya County', 'Subcounty', 532),
(1000477, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisukuma', 81, 'Kigorobya County', 'Subcounty', 533),
(1000478, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ishongororo', 82, 'Ibanda County North', 'Subcounty', 535),
(1000479, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ishongororo Town Council', 82, 'Ibanda County North', 'Subcounty', 536),
(1000480, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamarebe', 82, 'Ibanda County North', 'Subcounty', 538),
(1000481, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rushango Town Council', 82, 'Ibanda County North', 'Subcounty', 539),
(1000482, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwenkobwa Town Council', 82, 'Ibanda County North', 'Subcounty', 540),
(1000483, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Igorora Town Council', 82, 'Ibanda County South', 'Subcounty', 541),
(1000484, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Keihangara', 82, 'Ibanda County South', 'Subcounty', 542),
(1000485, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kicuzi', 82, 'Ibanda County South', 'Subcounty', 543),
(1000486, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikyenkye', 82, 'Ibanda County South', 'Subcounty', 544),
(1000487, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyabuhikye', 82, 'Ibanda County South', 'Subcounty', 545),
(1000488, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rukiri', 82, 'Ibanda County South', 'Subcounty', 546),
(1000489, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bisheshe Division', 82, 'Ibanda Municipality', 'Subcounty', 547),
(1000490, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bufunda Division', 82, 'Ibanda Municipality', 'Subcounty', 548),
(1000491, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagongo Division', 82, 'Ibanda Municipality', 'Subcounty', 549),
(1000492, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Northern Division', 34, 'Iganga Municipality', 'Subcounty', 551),
(1000493, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kidaago', 34, 'Kigulu County North', 'Subcounty', 552),
(1000494, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabitende', 34, 'Kigulu County North', 'Subcounty', 553),
(1000495, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nambale', 34, 'Kigulu County North', 'Subcounty', 554),
(1000496, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namungalwe', 34, 'Kigulu County North', 'Subcounty', 555),
(1000497, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawandala', 34, 'Kigulu County North', 'Subcounty', 556),
(1000498, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulamagi', 34, 'Kigulu County South', 'Subcounty', 557),
(1000499, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nakalama', 34, 'Kigulu County South', 'Subcounty', 558),
(1000500, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nakigo', 34, 'Kigulu County South', 'Subcounty', 559),
(1000501, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawanyingi', 34, 'Kigulu County South', 'Subcounty', 560),
(1000502, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugango Town Council', 83, 'Bukanga County', 'Subcounty', 561),
(1000503, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Endiinzi Town Council', 83, 'Bukanga County', 'Subcounty', 562),
(1000504, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Endinzi', 83, 'Bukanga County', 'Subcounty', 563),
(1000505, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakamba', 83, 'Bukanga County', 'Subcounty', 564),
(1000506, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kashumba', 83, 'Bukanga County', 'Subcounty', 565),
(1000507, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mbaare', 83, 'Bukanga County', 'Subcounty', 566),
(1000508, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngarama', 83, 'Bukanga County', 'Subcounty', 567),
(1000509, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rugaaga', 83, 'Bukanga County', 'Subcounty', 568),
(1000510, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rushasha', 83, 'Bukanga County', 'Subcounty', 569),
(1000511, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwanjogyera', 83, 'Bukanga County', 'Subcounty', 570),
(1000512, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Birere', 83, 'Isingiro County North', 'Subcounty', 571),
(1000513, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Isingiro Town Council', 83, 'Isingiro County North', 'Subcounty', 572),
(1000514, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaberebere Town Council', 83, 'Isingiro County North', 'Subcounty', 573),
(1000515, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabingo', 83, 'Isingiro County North', 'Subcounty', 574),
(1000516, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagarama', 83, 'Isingiro County North', 'Subcounty', 575),
(1000517, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masha', 83, 'Isingiro County North', 'Subcounty', 576),
(1000518, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamuyanja', 83, 'Isingiro County North', 'Subcounty', 577),
(1000519, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwetango', 83, 'Isingiro County North', 'Subcounty', 578),
(1000520, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabuyanda', 83, 'Isingiro County South', 'Subcounty', 579),
(1000521, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabuyanda Town Council', 83, 'Isingiro County South', 'Subcounty', 580),
(1000522, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamubeizi', 83, 'Isingiro County South', 'Subcounty', 581),
(1000523, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamubeizi Town Council', 83, 'Isingiro County South', 'Subcounty', 582),
(1000524, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikagate', 83, 'Isingiro County South', 'Subcounty', 583),
(1000525, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikagate Town Council', 83, 'Isingiro County South', 'Subcounty', 584),
(1000526, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ntungu', 83, 'Isingiro County South', 'Subcounty', 585),
(1000527, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakitunda', 83, 'Isingiro County South', 'Subcounty', 586),
(1000528, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruborogota]', 83, 'Isingiro County South', 'Subcounty', 588),
(1000529, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruborogota', 83, 'Isingiro County South', 'Subcounty', 589),
(1000530, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruhiira Town Council', 83, 'Isingiro County South', 'Subcounty', 590),
(1000531, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruyanga', 83, 'Isingiro County South', 'Subcounty', 591),
(1000532, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugembe Town Council', 35, 'Butembe County', 'Subcounty', 592),
(1000533, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busedde', 35, 'Butembe County', 'Subcounty', 593),
(1000534, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakira Town Council', 35, 'Butembe County', 'Subcounty', 594),
(1000535, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mafubira', 35, 'Butembe County', 'Subcounty', 595),
(1000536, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Jinja Central', 35, 'Jinja Municipality East', 'Subcounty', 596),
(1000537, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Walukuba/Masese', 35, 'Jinja Municipality East', 'Subcounty', 597),
(1000538, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kimaka/Mpumudde', 35, 'Jinja Municipality West', 'Subcounty', 599),
(1000539, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Budondo', 35, 'Kagoma Count', 'Subcounty', 600),
(1000540, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butagaya', 35, 'Kagoma Count', 'Subcounty', 601),
(1000541, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buwenge', 35, 'Kagoma Count', 'Subcounty', 602),
(1000542, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buwenge Town Council', 35, 'Kagoma Count', 'Subcounty', 603),
(1000543, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyengo', 35, 'Kagoma Count', 'Subcounty', 604),
(1000544, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaabong East', 64, 'Dodoth East County', 'Subcounty', 605),
(1000545, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaabong Town Council', 64, 'Dodoth East County', 'Subcounty', 606),
(1000546, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaabong West', 64, 'Dodoth East County', 'Subcounty', 607),
(1000547, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakamar', 64, 'Dodoth East County', 'Subcounty', 608),
(1000548, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kalapata', 64, 'Dodoth East County', 'Subcounty', 609),
(1000549, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kathile', 64, 'Dodoth East County', 'Subcounty', 610),
(1000550, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kathile South', 64, 'Dodoth East County', 'Subcounty', 611),
(1000551, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Labongia', 64, 'Dodoth East County', 'Subcounty', 612),
(1000552, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lodiko', 64, 'Dodoth East County', 'Subcounty', 613),
(1000553, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lolelia', 64, 'Dodoth East County', 'Subcounty', 614),
(1000554, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lolelia South', 64, 'Dodoth East County', 'Subcounty', 615),
(1000555, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lotim', 64, 'Dodoth East County', 'Subcounty', 616),
(1000556, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Loyoro', 64, 'Dodoth East County', 'Subcounty', 617),
(1000557, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sidok/Kopoth', 64, 'Dodoth East County', 'Subcounty', 618),
(1000558, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakwanga', 1000000, 'Other county', 'Subcounty', 619),
(1000559, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapedo', 1000000, 'Other county', 'Subcounty', 620),
(1000560, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karenga/Napore', 1000000, 'Other county', 'Subcounty', 621),
(1000561, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lobalangit', 1000000, 'Other county', 'Subcounty', 622),
(1000562, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lokori', 1000000, 'Other county', 'Subcounty', 623),
(1000563, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sangar', 1000000, 'Other county', 'Subcounty', 624),
(1000564, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamion', 64, 'Ik County', 'Subcounty', 625),
(1000565, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Morungole', 64, 'Ik County', 'Subcounty', 626),
(1000566, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Timu', 64, 'Ik County', 'Subcounty', 627),
(1000567, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabale Central', 84, 'Kabale Municipality', 'Subcounty', 628),
(1000568, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabale Northern', 84, 'Kabale Municipality', 'Subcounty', 629),
(1000569, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabale Southern', 84, 'Kabale Municipality', 'Subcounty', 630),
(1000570, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhara', 84, 'Ndorwa County East', 'Subcounty', 631),
(1000571, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaharo', 84, 'Ndorwa County East', 'Subcounty', 632),
(1000572, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyanamira', 84, 'Ndorwa County East', 'Subcounty', 633),
(1000573, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Maziba', 84, 'Ndorwa County East', 'Subcounty', 634),
(1000574, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butanda', 84, 'Ndorwa County West', 'Subcounty', 635),
(1000575, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kahungye', 84, 'Ndorwa County West', 'Subcounty', 636),
(1000576, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamuganguzi', 84, 'Ndorwa County West', 'Subcounty', 637),
(1000577, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katuna Town Council', 84, 'Ndorwa County West', 'Subcounty', 638),
(1000578, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibuga', 84, 'Ndorwa County West', 'Subcounty', 639),
(1000579, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitumba', 84, 'Ndorwa County West', 'Subcounty', 640),
(1000580, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rubaya', 84, 'Ndorwa County West', 'Subcounty', 641),
(1000581, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ryakarimira Town Council', 84, 'Ndorwa County West', 'Subcounty', 642),
(1000582, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukuuku', 85, 'Burahya County', 'Subcounty', 643),
(1000583, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busoro', 85, 'Burahya County', 'Subcounty', 644),
(1000584, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Hakibale', 85, 'Burahya County', 'Subcounty', 645),
(1000585, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Harugongo', 85, 'Burahya County', 'Subcounty', 646),
(1000586, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabende', 85, 'Burahya County', 'Subcounty', 647),
(1000587, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karago Town Council', 85, 'Burahya County', 'Subcounty', 648),
(1000588, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karami', 85, 'Burahya County', 'Subcounty', 649),
(1000589, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karambi', 85, 'Burahya County', 'Subcounty', 650),
(1000590, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karangura', 85, 'Burahya County', 'Subcounty', 651),
(1000591, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasenda', 85, 'Burahya County', 'Subcounty', 652),
(1000592, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasenda Town Council', 85, 'Burahya County', 'Subcounty', 653),
(1000593, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kicwamba', 85, 'Burahya County', 'Subcounty', 654),
(1000594, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiguma', 85, 'Burahya County', 'Subcounty', 655),
(1000595, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kijura Town Council', 85, 'Burahya County', 'Subcounty', 656),
(1000596, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiko Town Council', 85, 'Burahya County', 'Subcounty', 657),
(1000597, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mugusu Town Council', 85, 'Burahya County', 'Subcounty', 658),
(1000598, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mugusu', 85, 'Burahya County', 'Subcounty', 659),
(1000599, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruteete', 85, 'Burahya County', 'Subcounty', 660),
(1000600, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwengaju', 85, 'Burahya County', 'Subcounty', 661),
(1000601, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Southern Division', 85, 'Fort Portal Municipality', 'Subcounty', 663),
(1000602, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Isunga', 103, 'Buyaga East County', 'Subcounty', 683),
(1000603, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabamba', 103, 'Buyaga East County', 'Subcounty', 684),
(1000604, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagadi', 103, 'Buyaga East County', 'Subcounty', 685),
(1000605, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagadi Town Council', 103, 'Buyaga East County', 'Subcounty', 686),
(1000606, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamuroza', 103, 'Buyaga East County', 'Subcounty', 687),
(1000607, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kicucura', 103, 'Buyaga East County', 'Subcounty', 688),
(1000608, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kinyarugonjo', 103, 'Buyaga East County', 'Subcounty', 689),
(1000609, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiryanda', 103, 'Buyaga East County', 'Subcounty', 690),
(1000610, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyanaisoke', 103, 'Buyaga East County', 'Subcounty', 691),
(1000611, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyensige', 103, 'Buyaga East County', 'Subcounty', 692),
(1000612, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyenzige Town Council', 103, 'Buyaga East County', 'Subcounty', 693),
(1000613, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mabaale', 103, 'Buyaga East County', 'Subcounty', 694),
(1000614, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyabutanzi', 103, 'Buyaga East County', 'Subcounty', 695),
(1000615, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Pachwa', 103, 'Buyaga East County', 'Subcounty', 696),
(1000616, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhumuliro', 103, 'Buyaga West County', 'Subcounty', 697),
(1000617, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Burora', 103, 'Buyaga West County', 'Subcounty', 698),
(1000618, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwikara', 103, 'Buyaga West County', 'Subcounty', 699),
(1000619, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Galiboleka', 103, 'Buyaga West County', 'Subcounty', 700),
(1000620, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanyabeebe', 103, 'Buyaga West County', 'Subcounty', 701),
(1000621, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyakabadiima', 103, 'Buyaga West County', 'Subcounty', 702),
(1000622, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyaterekera', 103, 'Buyaga West County', 'Subcounty', 703),
(1000623, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyaterekera Town Council', 103, 'Buyaga West County', 'Subcounty', 704),
(1000624, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mairirwe', 103, 'Buyaga West County', 'Subcounty', 705),
(1000625, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpeefu', 103, 'Buyaga West County', 'Subcounty', 706),
(1000626, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpeefu Ya Sande Town Council', 103, 'Buyaga West County', 'Subcounty', 707),
(1000627, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muhorro', 103, 'Buyaga West County', 'Subcounty', 708),
(1000628, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muhorro Town Council', 103, 'Buyaga West County', 'Subcounty', 709),
(1000629, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakarongo', 103, 'Buyaga West County', 'Subcounty', 710),
(1000630, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rugashari', 103, 'Buyaga West County', 'Subcounty', 711),
(1000631, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katikara', 104, 'Bugangaizi East County', 'Subcounty', 713),
(1000632, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibijjo', 104, 'Bugangaizi East County', 'Subcounty', 714),
(1000633, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisiita', 104, 'Bugangaizi East County', 'Subcounty', 715),
(1000634, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisiita Town Council', 104, 'Bugangaizi East County', 'Subcounty', 716),
(1000635, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpasaana', 104, 'Bugangaizi East County', 'Subcounty', 717),
(1000636, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mwitanzige', 104, 'Bugangaizi East County', 'Subcounty', 718),
(1000637, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkooko', 104, 'Bugangaizi East County', 'Subcounty', 719),
(1000638, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Birembo', 104, 'Bugangaizi West County', 'Subcounty', 720),
(1000639, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwanswa', 104, 'Bugangaizi West County', 'Subcounty', 721),
(1000640, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Igayaza Town Council', 104, 'Bugangaizi West County', 'Subcounty', 722),
(1000641, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakindo', 104, 'Bugangaizi West County', 'Subcounty', 723),
(1000642, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakindo Town Council', 104, 'Bugangaizi West County', 'Subcounty', 724),
(1000643, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakumiro Town Council', 104, 'Bugangaizi West County', 'Subcounty', 725),
(1000644, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasambya', 104, 'Bugangaizi West County', 'Subcounty', 726),
(1000645, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kijangi', 104, 'Bugangaizi West County', 'Subcounty', 727),
(1000646, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikoora', 104, 'Bugangaizi West County', 'Subcounty', 728),
(1000647, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikwaya', 104, 'Bugangaizi West County', 'Subcounty', 729),
(1000648, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisengwe', 104, 'Bugangaizi West County', 'Subcounty', 730),
(1000649, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitaihuka', 104, 'Bugangaizi West County', 'Subcounty', 731),
(1000650, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyabasaija', 104, 'Bugangaizi West County', 'Subcounty', 732),
(1000651, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nalweyo', 104, 'Bugangaizi West County', 'Subcounty', 733),
(1000652, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Narweyo', 104, 'Bugangaizi West County', 'Subcounty', 734),
(1000653, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bujumba', 6, 'Bujumba County', 'Subcounty', 744),
(1000654, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kalangala Town Council', 6, 'Bujumba County', 'Subcounty', 745),
(1000655, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mugoye', 6, 'Bujumba County', 'Subcounty', 746),
(1000656, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bubeke', 6, 'Kyamuswa County', 'Subcounty', 747),
(1000657, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bufumira', 6, 'Kyamuswa County', 'Subcounty', 748),
(1000658, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamuswa', 6, 'Kyamuswa County', 'Subcounty', 749),
(1000659, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mazinga', 6, 'Kyamuswa County', 'Subcounty', 750),
(1000660, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Budomero', 36, 'Bulamogi County', 'Subcounty', 751),
(1000661, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulumba Town Council', 36, 'Bulamogi County', 'Subcounty', 752),
(1000662, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bumanya', 36, 'Bulamogi County', 'Subcounty', 753),
(1000663, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buyinda', 36, 'Bulamogi County', 'Subcounty', 754),
(1000664, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Gadumire', 36, 'Bulamogi County', 'Subcounty', 755),
(1000665, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaliro Town Council', 36, 'Bulamogi County', 'Subcounty', 756),
(1000666, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasokwe', 36, 'Bulamogi County', 'Subcounty', 757),
(1000667, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisinda', 36, 'Bulamogi County', 'Subcounty', 758),
(1000668, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namugongo', 36, 'Bulamogi County', 'Subcounty', 759),
(1000669, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namwiwa', 36, 'Bulamogi County', 'Subcounty', 760),
(1000670, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namwiwa Town Council', 36, 'Bulamogi County', 'Subcounty', 761),
(1000671, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukamba', 36, 'Bulamogi North West County', 'Subcounty', 762),
(1000672, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nansololo', 36, 'Bulamogi North West County', 'Subcounty', 763),
(1000673, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawaikoke', 36, 'Bulamogi North West County', 'Subcounty', 764),
(1000674, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawaikoke Town Council', 36, 'Bulamogi North West County', 'Subcounty', 765),
(1000675, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukulula', 7, 'Kalungu East County', 'Subcounty', 766),
(1000676, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lukaya Town Council', 7, 'Kalungu East County', 'Subcounty', 767),
(1000677, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lwabenge', 7, 'Kalungu East County', 'Subcounty', 768),
(1000678, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kalungu', 7, 'Kalungu West County', 'Subcounty', 769),
(1000679, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kalungu Town Council', 7, 'Kalungu West County', 'Subcounty', 770),
(1000680, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamulibwa', 7, 'Kalungu West County', 'Subcounty', 771),
(1000681, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamulibwa Town Council', 7, 'Kalungu West County', 'Subcounty', 772),
(1000682, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kampala Central', 8, 'Kampala Central Division', 'Subcounty', 773),
(1000683, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kawempe Division', 8, 'Kawempe Division North', 'Subcounty', 774),
(1000684, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Makerere University', 8, 'Kawempe Division South', 'Subcounty', 776),
(1000685, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Makindye Division', 8, 'Makindye Division East', 'Subcounty', 777),
(1000686, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nakawa', 8, 'Nakawa Division', 'Subcounty', 779),
(1000687, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rubaga Division', 8, 'Rubaga Division North', 'Subcounty', 780),
(1000688, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Balawoli', 37, 'Bugabula County North', 'Subcounty', 782),
(1000689, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Balawoli Town Council', 37, 'Bugabula County North', 'Subcounty', 783),
(1000690, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagumba', 37, 'Bugabula County North', 'Subcounty', 784),
(1000691, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabwigulu', 37, 'Bugabula County North', 'Subcounty', 785),
(1000692, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namasagali', 37, 'Bugabula County North', 'Subcounty', 786),
(1000693, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulopa', 37, 'Bugabula County South', 'Subcounty', 787),
(1000694, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butansi', 37, 'Bugabula County South', 'Subcounty', 788),
(1000695, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitayunjwa', 37, 'Bugabula County South', 'Subcounty', 789),
(1000696, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namwenda', 37, 'Bugabula County South', 'Subcounty', 790),
(1000697, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Namwenda Town Council', 37, 'Bugabula County South', 'Subcounty', 791),
(1000698, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugulumbya', 37, 'Buzaaya County', 'Subcounty', 792),
(1000699, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasambira Town Council', 37, 'Buzaaya County', 'Subcounty', 793),
(1000700, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisozi', 37, 'Buzaaya County', 'Subcounty', 794),
(1000701, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisozi Town Council', 37, 'Buzaaya County', 'Subcounty', 795),
(1000702, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Magogo', 37, 'Buzaaya County', 'Subcounty', 796),
(1000703, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mbulamuti', 37, 'Buzaaya County', 'Subcounty', 797),
(1000704, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mbulamuti Town Council', 37, 'Buzaaya County', 'Subcounty', 798),
(1000705, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawanyago', 37, 'Buzaaya County', 'Subcounty', 799),
(1000706, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nawanyago Town Council', 37, 'Buzaaya County', 'Subcounty', 800),
(1000707, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Wankole', 37, 'Buzaaya County', 'Subcounty', 801),
(1000708, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugodi Town Council', 1000000, 'Other county', 'Subcounty', 804),
(1000709, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busiriba', 1000000, 'Other county', 'Subcounty', 806),
(1000710, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabambiro', 1000000, 'Other county', 'Subcounty', 807),
(1000711, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabuga Town Council', 1000000, 'Other county', 'Subcounty', 808),
(1000712, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kahunge Town Council', 1000000, 'Other county', 'Subcounty', 809),
(1000713, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kahunge', 1000000, 'Other county', 'Subcounty', 810),
(1000714, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamwenge', 1000000, 'Other county', 'Subcounty', 811),
(1000715, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamwenge Town Council', 1000000, 'Other county', 'Subcounty', 812),
(1000716, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Biguli', 86, 'Kibale East County', 'Subcounty', 813),
(1000717, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwizi', 86, 'Kibale East County', 'Subcounty', 815),
(1000718, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkoma', 86, 'Kibale East County', 'Subcounty', 816),
(1000719, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkoma - Katalyeba Town Council', 86, 'Kibale East County', 'Subcounty', 817),
(1000720, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kambuga', 87, 'Kinkizi County East', 'Subcounty', 824),
(1000721, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kambuga Town Council', 87, 'Kinkizi County East', 'Subcounty', 825),
(1000722, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanungu Town Council', 87, 'Kinkizi County East', 'Subcounty', 826),
(1000723, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katete', 87, 'Kinkizi County East', 'Subcounty', 827),
(1000724, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kinaaba', 87, 'Kinkizi County East', 'Subcounty', 828),
(1000725, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kirima', 87, 'Kinkizi County East', 'Subcounty', 829),
(1000726, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rugyeyo', 87, 'Kinkizi County East', 'Subcounty', 830),
(1000727, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rutenga', 87, 'Kinkizi County East', 'Subcounty', 831),
(1000728, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butogota Town Council', 87, 'Kinkizi County West', 'Subcounty', 832),
(1000729, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanyantorogo', 87, 'Kinkizi County West', 'Subcounty', 833),
(1000730, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kayonza', 87, 'Kinkizi County West', 'Subcounty', 834),
(1000731, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kihiihi', 87, 'Kinkizi County West', 'Subcounty', 835),
(1000732, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kihiihi Town Council', 87, 'Kinkizi County West', 'Subcounty', 836),
(1000733, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyeshero', 87, 'Kinkizi County West', 'Subcounty', 837),
(1000734, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpungu', 87, 'Kinkizi County West', 'Subcounty', 838),
(1000735, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakinoni', 87, 'Kinkizi County West', 'Subcounty', 839),
(1000736, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamirama', 87, 'Kinkizi County West', 'Subcounty', 840),
(1000737, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyanga', 87, 'Kinkizi County West', 'Subcounty', 841),
(1000738, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'East Division', 38, 'Kapchorwa Municipality', 'Subcounty', 843),
(1000739, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'West Division', 38, 'Kapchorwa Municipality', 'Subcounty', 844),
(1000740, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Amukol', 38, 'Tingey County', 'Subcounty', 845),
(1000741, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Chema', 38, 'Tingey County', 'Subcounty', 846),
(1000742, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Chepterech', 38, 'Tingey County', 'Subcounty', 847),
(1000743, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Gamogo', 38, 'Tingey County', 'Subcounty', 848),
(1000744, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabeywa', 38, 'Tingey County', 'Subcounty', 849),
(1000745, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapsinda', 38, 'Tingey County', 'Subcounty', 850),
(1000746, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaptanya', 38, 'Tingey County', 'Subcounty', 851),
(1000747, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaserem', 38, 'Tingey County', 'Subcounty', 852),
(1000748, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kawowo', 38, 'Tingey County', 'Subcounty', 853),
(1000749, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Munarya', 38, 'Tingey County', 'Subcounty', 854),
(1000750, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sipi', 38, 'Tingey County', 'Subcounty', 855),
(1000751, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sipi Town Council', 38, 'Tingey County', 'Subcounty', 856),
(1000752, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Acinga', 116, 'Kapelebyong County', 'Subcounty', 857),
(1000753, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Acowa', 116, 'Kapelebyong County', 'Subcounty', 858),
(1000754, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Akoromit', 116, 'Kapelebyong County', 'Subcounty', 859),
(1000755, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Alito', 116, 'Kapelebyong County', 'Subcounty', 860),
(1000756, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapelebyong', 116, 'Kapelebyong County', 'Subcounty', 861),
(1000757, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Obalanga', 116, 'Kapelebyong County', 'Subcounty', 862),
(1000758, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Okungur', 116, 'Kapelebyong County', 'Subcounty', 863),
(1000759, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kawalakol', 64, 'Dodoth West County', 'Subcounty', 867),
(1000760, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukuya', 115, 'Bukuya County', 'Subcounty', 871),
(1000761, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukuya Town Council', 115, 'Bukuya County', 'Subcounty', 872),
(1000762, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kijjuna', 115, 'Bukuya County', 'Subcounty', 873),
(1000763, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Makokoto', 115, 'Bukuya County', 'Subcounty', 875),
(1000764, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mbirizi', 115, 'Bukuya County', 'Subcounty', 876),
(1000765, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kalwana', 115, 'Kassanda County North', 'Subcounty', 877),
(1000766, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamuli', 115, 'Kassanda County North', 'Subcounty', 878),
(1000767, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kassanda', 115, 'Kassanda County North', 'Subcounty', 879),
(1000768, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kassanda Town Council', 115, 'Kassanda County North', 'Subcounty', 880),
(1000769, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiganda', 115, 'Kassanda County South', 'Subcounty', 881),
(1000770, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiganda Town Council', 115, 'Kassanda County South', 'Subcounty', 882),
(1000771, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Manyogaseka', 115, 'Kassanda County South', 'Subcounty', 883),
(1000772, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Myanzi', 115, 'Kassanda County South', 'Subcounty', 884),
(1000773, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nalutuntu', 115, 'Kassanda County South', 'Subcounty', 885),
(1000774, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwera', 88, 'Bukonjo County West', 'Subcounty', 886),
(1000775, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ihandiro', 88, 'Bukonjo County West', 'Subcounty', 887),
(1000776, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Isango', 88, 'Bukonjo County West', 'Subcounty', 888),
(1000777, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitholu', 88, 'Bukonjo County West', 'Subcounty', 890),
(1000778, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpondwe/Lhubirira Town Council', 88, 'Bukonjo County West', 'Subcounty', 891),
(1000779, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakiyumbu', 88, 'Bukonjo County West', 'Subcounty', 892),
(1000780, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kinyameseke Town Council', 88, 'Bukonzo County East', 'Subcounty', 893),
(1000781, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisinga', 88, 'Bukonzo County East', 'Subcounty', 894),
(1000782, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisinga Town Council', 88, 'Bukonzo County East', 'Subcounty', 895),
(1000783, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitabu', 88, 'Bukonzo County East', 'Subcounty', 896),
(1000784, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyaruma', 88, 'Bukonzo County East', 'Subcounty', 897),
(1000785, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyaruma Town Council', 88, 'Bukonzo County East', 'Subcounty', 898);
INSERT INTO `locations` (`id`, `created_at`, `updated_at`, `name`, `parent`, `photo`, `details`, `order`) VALUES
(1000786, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyondo', 88, 'Bukonzo County East', 'Subcounty', 899),
(1000787, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mahango', 88, 'Bukonzo County East', 'Subcounty', 900),
(1000788, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Munkunyu', 88, 'Bukonzo County East', 'Subcounty', 901),
(1000789, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakatonzi', 88, 'Bukonzo County East', 'Subcounty', 902),
(1000790, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugoye', 88, 'Busongora County North', 'Subcounty', 903),
(1000791, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhuhira', 88, 'Busongora County North', 'Subcounty', 904),
(1000792, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwesumbu', 88, 'Busongora County North', 'Subcounty', 905),
(1000793, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Hima Town Council', 88, 'Busongora County North', 'Subcounty', 906),
(1000794, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ibanda-Kyanya Town Council', 88, 'Busongora County North', 'Subcounty', 907),
(1000795, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitswamba', 88, 'Busongora County North', 'Subcounty', 908),
(1000796, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyabarungira', 88, 'Busongora County North', 'Subcounty', 909),
(1000797, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Maliba', 88, 'Busongora County North', 'Subcounty', 910),
(1000798, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mubuku Town Council', 88, 'Busongora County North', 'Subcounty', 911),
(1000799, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rugendabara-Kikongo Town Council', 88, 'Busongora County North', 'Subcounty', 912),
(1000800, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kahokya', 88, 'Busongora County South', 'Subcounty', 913),
(1000801, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'karusandara', 88, 'Busongora County South', 'Subcounty', 914),
(1000802, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kilembe', 88, 'Busongora County South', 'Subcounty', 915),
(1000803, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lake Kabatoro Town Council', 88, 'Busongora County South', 'Subcounty', 916),
(1000804, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lake Katwe', 88, 'Busongora County South', 'Subcounty', 917),
(1000805, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mbunga', 88, 'Busongora County South', 'Subcounty', 918),
(1000806, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muhokya', 88, 'Busongora County South', 'Subcounty', 919),
(1000807, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakabingo', 88, 'Busongora County South', 'Subcounty', 920),
(1000808, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rukoki', 88, 'Busongora County South', 'Subcounty', 921),
(1000809, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulembia Division', 88, 'Kasese Municipality', 'Subcounty', 922),
(1000810, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamwamba Division', 88, 'Kasese Municipality', 'Subcounty', 924),
(1000811, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Amusia', 39, 'Toroma County', 'Subcounty', 925),
(1000812, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Angodingod', 39, 'Toroma County', 'Subcounty', 926),
(1000813, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapujan', 39, 'Toroma County', 'Subcounty', 927),
(1000814, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Magoro', 39, 'Toroma County', 'Subcounty', 928),
(1000815, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Magoro Town Council', 39, 'Toroma County', 'Subcounty', 929),
(1000816, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Omodoi', 39, 'Toroma County', 'Subcounty', 930),
(1000817, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Toroma', 39, 'Toroma County', 'Subcounty', 931),
(1000818, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Toroma Town Council', 39, 'Toroma County', 'Subcounty', 932),
(1000819, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Akoboi', 39, 'Usuk County', 'Subcounty', 933),
(1000820, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Getom', 39, 'Usuk County', 'Subcounty', 934),
(1000821, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Guyaguya', 39, 'Usuk County', 'Subcounty', 935),
(1000822, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katakwi', 39, 'Usuk County', 'Subcounty', 936),
(1000823, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katakwi Town Council', 39, 'Usuk County', 'Subcounty', 937),
(1000824, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngariam', 39, 'Usuk County', 'Subcounty', 938),
(1000825, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Okore', 39, 'Usuk County', 'Subcounty', 939),
(1000826, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Okulonyo', 39, 'Usuk County', 'Subcounty', 940),
(1000827, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ongongoja', 39, 'Usuk County', 'Subcounty', 941),
(1000828, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Palam', 39, 'Usuk County', 'Subcounty', 942),
(1000829, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Usuk', 39, 'Usuk County', 'Subcounty', 943),
(1000830, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Usuk Town Council', 39, 'Usuk County', 'Subcounty', 944),
(1000831, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bbale', 9, 'Bbale County', 'Subcounty', 945),
(1000832, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Galiraya', 9, 'Bbale County', 'Subcounty', 946),
(1000833, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitimbwa', 9, 'Bbale County', 'Subcounty', 948),
(1000834, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitimbwa Town Council', 9, 'Bbale County', 'Subcounty', 949),
(1000835, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busaana', 9, 'Ntenjeru County North', 'Subcounty', 950),
(1000836, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busaana Town Council', 9, 'Ntenjeru County North', 'Subcounty', 951),
(1000837, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kayunga', 9, 'Ntenjeru County North', 'Subcounty', 952),
(1000838, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kayunga Town Council', 9, 'Ntenjeru County North', 'Subcounty', 953),
(1000839, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kangulumira', 9, 'Ntenjeru County South', 'Subcounty', 954),
(1000840, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kangulumira Town Council', 9, 'Ntenjeru County South', 'Subcounty', 955),
(1000841, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nazigo Town Council', 9, 'Ntenjeru County South', 'Subcounty', 956),
(1000842, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nazigo', 9, 'Ntenjeru County South', 'Subcounty', 958),
(1000843, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buremba Town Council', 119, 'Kazo County', 'Subcounty', 959),
(1000844, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Burunga', 119, 'Kazo County', 'Subcounty', 960),
(1000845, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Engari', 119, 'Kazo County', 'Subcounty', 961),
(1000846, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanoni', 119, 'Kazo County', 'Subcounty', 962),
(1000847, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kazo', 119, 'Kazo County', 'Subcounty', 963),
(1000848, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kazo Town Council', 119, 'Kazo County', 'Subcounty', 964),
(1000849, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyampangara', 119, 'Kazo County', 'Subcounty', 965),
(1000850, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Migina', 119, 'Kazo County', 'Subcounty', 966),
(1000851, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkungu', 119, 'Kazo County', 'Subcounty', 967),
(1000852, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwemikoma', 119, 'Kazo County', 'Subcounty', 968),
(1000853, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bubango', 89, 'Buyanja County', 'Subcounty', 969),
(1000854, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bwamiramira', 89, 'Buyanja County', 'Subcounty', 970),
(1000855, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabasekende', 89, 'Buyanja County', 'Subcounty', 971),
(1000856, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karama', 89, 'Buyanja County', 'Subcounty', 972),
(1000857, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasimbi', 89, 'Buyanja County', 'Subcounty', 973),
(1000858, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kayanja', 89, 'Buyanja County', 'Subcounty', 974),
(1000859, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibaale Town Council', 89, 'Buyanja County', 'Subcounty', 975),
(1000860, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyakazihire', 89, 'Buyanja County', 'Subcounty', 976),
(1000861, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyebando', 89, 'Buyanja County', 'Subcounty', 977),
(1000862, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Matale', 89, 'Buyanja County', 'Subcounty', 978),
(1000863, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mugarama', 89, 'Buyanja County', 'Subcounty', 979),
(1000864, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamarunda', 89, 'Buyanja County', 'Subcounty', 980),
(1000865, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamarwa', 89, 'Buyanja County', 'Subcounty', 981),
(1000866, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukomero', 10, 'Kiboga East County', 'Subcounty', 982),
(1000867, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukomero Town Council', 10, 'Kiboga East County', 'Subcounty', 983),
(1000868, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ddwaniro', 10, 'Kiboga East County', 'Subcounty', 984),
(1000869, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapeke', 10, 'Kiboga East County', 'Subcounty', 985),
(1000870, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kayera', 10, 'Kiboga East County', 'Subcounty', 986),
(1000871, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibiga', 10, 'Kiboga East County', 'Subcounty', 987),
(1000872, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiboga Town Council', 10, 'Kiboga East County', 'Subcounty', 988),
(1000873, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyekumbya', 10, 'Kiboga East County', 'Subcounty', 989),
(1000874, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyomya', 10, 'Kiboga East County', 'Subcounty', 990),
(1000875, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lwamata', 10, 'Kiboga East County', 'Subcounty', 991),
(1000876, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lwamata Town Council', 10, 'Kiboga East County', 'Subcounty', 992),
(1000877, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muwanga', 10, 'Kiboga East County', 'Subcounty', 993),
(1000878, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nakasozi', 10, 'Kiboga East County', 'Subcounty', 994),
(1000879, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkandwa', 10, 'Kiboga East County', 'Subcounty', 995),
(1000880, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulangira', 40, 'Kabweri County', 'Subcounty', 996),
(1000881, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bulangira Town Council', 40, 'Kabweri County', 'Subcounty', 997),
(1000882, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Goli-Goli', 40, 'Kabweri County', 'Subcounty', 998),
(1000883, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabweri', 40, 'Kabweri County', 'Subcounty', 999),
(1000884, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kadama', 40, 'Kabweri County', 'Subcounty', 1000),
(1000885, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kadama Town Council', 40, 'Kabweri County', 'Subcounty', 1001),
(1000886, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kagumu', 40, 'Kabweri County', 'Subcounty', 1002),
(1000887, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakutu', 40, 'Kabweri County', 'Subcounty', 1003),
(1000888, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kenkebu', 40, 'Kabweri County', 'Subcounty', 1004),
(1000889, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kirika', 40, 'Kabweri County', 'Subcounty', 1005),
(1000890, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nabiswa', 40, 'Kabweri County', 'Subcounty', 1006),
(1000891, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nandere', 40, 'Kabweri County', 'Subcounty', 1007),
(1000892, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buseta', 40, 'Kibuku County', 'Subcounty', 1008),
(1000893, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasasira', 40, 'Kibuku County', 'Subcounty', 1009),
(1000894, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasasira Town Council', 40, 'Kibuku County', 'Subcounty', 1010),
(1000895, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibuku', 40, 'Kibuku County', 'Subcounty', 1011),
(1000896, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kibuku Town Council', 40, 'Kibuku County', 'Subcounty', 1012),
(1000897, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kituti', 40, 'Kibuku County', 'Subcounty', 1013),
(1000898, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lwatama', 40, 'Kibuku County', 'Subcounty', 1014),
(1000899, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nankodo', 40, 'Kibuku County', 'Subcounty', 1015),
(1000900, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tirinyi', 40, 'Kibuku County', 'Subcounty', 1016),
(1000901, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tirinyi Town Council', 40, 'Kibuku County', 'Subcounty', 1017),
(1000902, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugambe', 117, 'Buhaguzi County', 'Subcounty', 1018),
(1000903, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhimba', 117, 'Buhaguzi County', 'Subcounty', 1019),
(1000904, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buhimba Town Council', 117, 'Buhaguzi County', 'Subcounty', 1020),
(1000905, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kabwoya', 117, 'Buhaguzi County', 'Subcounty', 1021),
(1000906, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiziranfumbi', 117, 'Buhaguzi County', 'Subcounty', 1022),
(1000907, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyangwali', 117, 'Buhaguzi County', 'Subcounty', 1023),
(1000908, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kashongi', 90, 'Kashongi County', 'Subcounty', 1024),
(1000909, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitura', 90, 'Kashongi County', 'Subcounty', 1025),
(1000910, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Buremba', 1000000, 'Other county', 'Subcounty', 1026),
(1000911, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Akayanja', 90, 'Nyabushozi County', 'Subcounty', 1036),
(1000912, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanyaryeru', 90, 'Nyabushozi County', 'Subcounty', 1037),
(1000913, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kenshunga', 90, 'Nyabushozi County', 'Subcounty', 1038),
(1000914, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kikatsi', 90, 'Nyabushozi County', 'Subcounty', 1039),
(1000915, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kinoni', 90, 'Nyabushozi County', 'Subcounty', 1040),
(1000916, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiruhura Town Council', 90, 'Nyabushozi County', 'Subcounty', 1041),
(1000917, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakashashara', 90, 'Nyabushozi County', 'Subcounty', 1042),
(1000918, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rushere Town Council', 90, 'Nyabushozi County', 'Subcounty', 1043),
(1000919, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwenshande', 90, 'Nyabushozi County', 'Subcounty', 1044),
(1000920, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwetamu', 90, 'Nyabushozi County', 'Subcounty', 1045),
(1000921, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sanga', 90, 'Nyabushozi County', 'Subcounty', 1046),
(1000922, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sanga Town Council', 90, 'Nyabushozi County', 'Subcounty', 1047),
(1000923, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bweyale Town Council', 91, 'Kibanda North County', 'Subcounty', 1048),
(1000924, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Diima', 91, 'Kibanda North County', 'Subcounty', 1049),
(1000925, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Karuma Town Council', 91, 'Kibanda North County', 'Subcounty', 1050),
(1000926, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kichwabugingo', 91, 'Kibanda North County', 'Subcounty', 1051),
(1000927, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiryadongo', 91, 'Kibanda North County', 'Subcounty', 1052),
(1000928, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiryandongo Town Council', 91, 'Kibanda North County', 'Subcounty', 1053),
(1000929, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyankende', 91, 'Kibanda North County', 'Subcounty', 1054),
(1000930, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mutunda', 91, 'Kibanda North County', 'Subcounty', 1055),
(1000931, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyamahasa', 91, 'Kibanda North County', 'Subcounty', 1056),
(1000932, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigumba', 91, 'Kibanda South County', 'Subcounty', 1057),
(1000933, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigumba Town Council', 91, 'Kibanda South County', 'Subcounty', 1058),
(1000934, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masindi Port', 91, 'Kibanda South County', 'Subcounty', 1059),
(1000935, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mboira', 91, 'Kibanda South County', 'Subcounty', 1060),
(1000936, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bukimbiri', 92, 'Bufumbira County East', 'Subcounty', 1061),
(1000937, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanaba', 92, 'Bufumbira County East', 'Subcounty', 1062),
(1000938, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Murora', 92, 'Bufumbira County East', 'Subcounty', 1063),
(1000939, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakabande', 92, 'Bufumbira County East', 'Subcounty', 1064),
(1000940, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyundo', 92, 'Bufumbira County East', 'Subcounty', 1065),
(1000941, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Busanza', 92, 'Bufumbira County North', 'Subcounty', 1066),
(1000942, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kirundo', 92, 'Bufumbira County North', 'Subcounty', 1067),
(1000943, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyabwishenya', 92, 'Bufumbira County North', 'Subcounty', 1068),
(1000944, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyarubuye', 92, 'Bufumbira County North', 'Subcounty', 1069),
(1000945, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rubuguri Town Council', 92, 'Bufumbira County North', 'Subcounty', 1070),
(1000946, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bunagana Town Council', 92, 'Bufumbira County South', 'Subcounty', 1071),
(1000947, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Chahi', 92, 'Bufumbira County South', 'Subcounty', 1072),
(1000948, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Cyanika Town Council', 92, 'Bufumbira County South', 'Subcounty', 1073),
(1000949, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muramba', 92, 'Bufumbira County South', 'Subcounty', 1074),
(1000950, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakinama', 92, 'Bufumbira County South', 'Subcounty', 1075),
(1000951, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyarusiza', 92, 'Bufumbira County South', 'Subcounty', 1076),
(1000952, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'North Division', 92, 'Kisoro Municipality', 'Subcounty', 1078),
(1000953, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'South Division', 92, 'Kisoro Municipality', 'Subcounty', 1079),
(1000954, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Orom East', 65, 'Chua East County', 'Subcounty', 1091),
(1000955, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Orom', 65, 'Chua East County', 'Subcounty', 1092),
(1000956, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Omiya-Anyima West', 65, 'Chua East County', 'Subcounty', 1093),
(1000957, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Omiya-Anyima', 65, 'Chua East County', 'Subcounty', 1094),
(1000958, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nam-Okora North', 65, 'Chua East County', 'Subcounty', 1095),
(1000959, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nam-Okora', 65, 'Chua East County', 'Subcounty', 1096),
(1000960, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'NamOkora Town Council', 65, 'Chua East County', 'Subcounty', 1097),
(1000961, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muchwini West', 65, 'Chua East County', 'Subcounty', 1098),
(1000962, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muchwini East', 65, 'Chua East County', 'Subcounty', 1099),
(1000963, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muchwini', 65, 'Chua East County', 'Subcounty', 1100),
(1000964, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiteny', 65, 'Chua East County', 'Subcounty', 1101),
(1000965, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Akwang', 65, 'Chua West County', 'Subcounty', 1102),
(1000966, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitgum-Matidi', 65, 'Chua West County', 'Subcounty', 1103),
(1000967, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitgum-Matidi Town Council', 65, 'Chua West County', 'Subcounty', 1104),
(1000968, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Labongo-Amida', 65, 'Chua West County', 'Subcounty', 1105),
(1000969, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Labongo-Amida West', 65, 'Chua West County', 'Subcounty', 1106),
(1000970, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Labongo-Layamo', 65, 'Chua West County', 'Subcounty', 1107),
(1000971, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lagoro', 65, 'Chua West County', 'Subcounty', 1108),
(1000972, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lalano', 65, 'Chua West County', 'Subcounty', 1109),
(1000973, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Pager Division', 65, 'Kitgum Municipality', 'Subcounty', 1111),
(1000974, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Pandwong Division', 65, 'Kitgum Municipality', 'Subcounty', 1112),
(1000975, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Abuku', 131, 'Koboko North County', 'Subcounty', 1120),
(1000976, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ludara', 131, 'Koboko North County', 'Subcounty', 1121),
(1000977, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Aboke', 66, 'Kole North County', 'Subcounty', 1122),
(1000978, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Aboke Town Council', 66, 'Kole North County', 'Subcounty', 1123),
(1000979, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Alito Town Council', 66, 'Kole North County', 'Subcounty', 1124),
(1000980, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Okwerodot', 66, 'Kole North County', 'Subcounty', 1126),
(1000981, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Akalo', 66, 'Kole South County', 'Subcounty', 1127),
(1000982, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Akalo Town Council', 66, 'Kole South County', 'Subcounty', 1128),
(1000983, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ayer', 66, 'Kole South County', 'Subcounty', 1129),
(1000984, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bala', 66, 'Kole South County', 'Subcounty', 1130),
(1000985, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bala Town Council', 66, 'Kole South County', 'Subcounty', 1131),
(1000986, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Balla', 66, 'Kole South County', 'Subcounty', 1132),
(1000987, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kole Town Council', 66, 'Kole South County', 'Subcounty', 1133),
(1000988, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kacheri', 67, 'Jie County', 'Subcounty', 1134),
(1000989, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kacheri Town Council', 67, 'Jie County', 'Subcounty', 1135),
(1000990, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamor', 67, 'Jie County', 'Subcounty', 1136),
(1000991, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanair', 67, 'Jie County', 'Subcounty', 1137),
(1000992, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapeta', 67, 'Jie County', 'Subcounty', 1138),
(1000993, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kotido', 67, 'Jie County', 'Subcounty', 1139),
(1000994, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lokitelaebu Town Council', 67, 'Jie County', 'Subcounty', 1140),
(1000995, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Lokwakial', 67, 'Jie County', 'Subcounty', 1141),
(1000996, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Loletio', 67, 'Jie County', 'Subcounty', 1142),
(1000997, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Longaroe', 67, 'Jie County', 'Subcounty', 1143),
(1000998, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Maaru', 67, 'Jie County', 'Subcounty', 1144),
(1000999, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Napumpum', 67, 'Jie County', 'Subcounty', 1145),
(1001000, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Panyangara', 67, 'Jie County', 'Subcounty', 1146),
(1001001, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rengen', 67, 'Jie County', 'Subcounty', 1147),
(1001002, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kadami', 41, 'Kanyum County', 'Subcounty', 1152),
(1001003, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakures', 41, 'Kanyum County', 'Subcounty', 1153),
(1001004, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kamaca', 41, 'Kanyum County', 'Subcounty', 1154),
(1001005, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mukongoro', 41, 'Kanyum County', 'Subcounty', 1156),
(1001006, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Atutur', 41, 'Kumi County', 'Subcounty', 1157),
(1001007, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanapa', 41, 'Kumi County', 'Subcounty', 1158),
(1001008, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kumi', 41, 'Kumi County', 'Subcounty', 1159),
(1001009, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyero', 41, 'Kumi County', 'Subcounty', 1160),
(1001010, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ogooma', 41, 'Kumi County', 'Subcounty', 1161),
(1001011, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ongino', 41, 'Kumi County', 'Subcounty', 1162),
(1001012, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tisai', 41, 'Kumi County', 'Subcounty', 1163),
(1001013, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Benet', 42, 'Kween County', 'Subcounty', 1177),
(1001014, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Binyiny', 42, 'Kween County', 'Subcounty', 1178),
(1001015, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Binyiny Town Council', 42, 'Kween County', 'Subcounty', 1179),
(1001016, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Chepsukunya Town Council', 42, 'Kween County', 'Subcounty', 1180),
(1001017, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Greek River', 42, 'Kween County', 'Subcounty', 1181),
(1001018, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kapkwata', 42, 'Kween County', 'Subcounty', 1182),
(1001019, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaproron', 42, 'Kween County', 'Subcounty', 1183),
(1001020, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaproron Town Council', 42, 'Kween County', 'Subcounty', 1184),
(1001021, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaptoyoy', 42, 'Kween County', 'Subcounty', 1185),
(1001022, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaptum', 42, 'Kween County', 'Subcounty', 1186),
(1001023, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kaseko', 42, 'Kween County', 'Subcounty', 1187),
(1001024, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitawoi', 42, 'Kween County', 'Subcounty', 1188),
(1001025, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kwanyiy', 42, 'Kween County', 'Subcounty', 1189),
(1001026, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kwosir', 42, 'Kween County', 'Subcounty', 1190),
(1001027, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Moyok', 42, 'Kween County', 'Subcounty', 1191),
(1001028, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ngenge', 42, 'Kween County', 'Subcounty', 1192),
(1001029, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Sundet', 42, 'Kween County', 'Subcounty', 1193),
(1001030, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Tuikat', 42, 'Kween County', 'Subcounty', 1194),
(1001031, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bananywa', 11, 'Butemba County', 'Subcounty', 1195),
(1001032, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Banda', 11, 'Butemba County', 'Subcounty', 1196),
(1001033, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butemba', 11, 'Butemba County', 'Subcounty', 1197),
(1001034, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Butemba Town Council', 11, 'Butemba County', 'Subcounty', 1198),
(1001035, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Byerima', 11, 'Butemba County', 'Subcounty', 1199),
(1001036, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigando', 11, 'Butemba County', 'Subcounty', 1200),
(1001037, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyankwanzi', 11, 'Butemba County', 'Subcounty', 1201),
(1001038, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyankwanzi Town Council', 11, 'Butemba County', 'Subcounty', 1202),
(1001039, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nsambya', 11, 'Butemba County', 'Subcounty', 1203),
(1001040, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Gayaza', 11, 'Ntwetwe County', 'Subcounty', 1204),
(1001041, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kiryannongo', 11, 'Ntwetwe County', 'Subcounty', 1205),
(1001042, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kisala', 11, 'Ntwetwe County', 'Subcounty', 1206),
(1001043, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitabona', 11, 'Ntwetwe County', 'Subcounty', 1207),
(1001044, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Masodde-Kalagi Town Council', 11, 'Ntwetwe County', 'Subcounty', 1208),
(1001045, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mulagi', 11, 'Ntwetwe County', 'Subcounty', 1209),
(1001046, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Muwangi', 11, 'Ntwetwe County', 'Subcounty', 1210),
(1001047, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ntwetwe', 11, 'Ntwetwe County', 'Subcounty', 1212),
(1001048, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ntwetwe Town Council', 11, 'Ntwetwe County', 'Subcounty', 1213),
(1001049, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Wattuba', 11, 'Ntwetwe County', 'Subcounty', 1214),
(1001050, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Wattuba Town Council', 11, 'Ntwetwe County', 'Subcounty', 1215),
(1001051, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Hapuuyo', 93, 'Kyaka North County', 'Subcounty', 1216),
(1001052, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Hapuuyo Town Council', 93, 'Kyaka North County', 'Subcounty', 1217),
(1001053, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakabara', 93, 'Kyaka North County', 'Subcounty', 1218),
(1001054, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kakabara Town Council', 93, 'Kyaka North County', 'Subcounty', 1219),
(1001055, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kasule', 93, 'Kyaka North County', 'Subcounty', 1220),
(1001056, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigambo', 93, 'Kyaka North County', 'Subcounty', 1221),
(1001057, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'kyatega', 93, 'Kyaka North County', 'Subcounty', 1222),
(1001058, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyegegwa Town Council', 93, 'Kyaka North County', 'Subcounty', 1223),
(1001059, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Migongwe', 93, 'Kyaka North County', 'Subcounty', 1224),
(1001060, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkaakwa', 93, 'Kyaka North County', 'Subcounty', 1225),
(1001061, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kazinga Town Council', 93, 'Kyaka South County', 'Subcounty', 1226),
(1001062, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyegegwa', 93, 'Kyaka South County', 'Subcounty', 1227),
(1001063, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Migamba', 93, 'Kyaka South County', 'Subcounty', 1228),
(1001064, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpara', 93, 'Kyaka South County', 'Subcounty', 1229),
(1001065, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Mpara Town Council', 93, 'Kyaka South County', 'Subcounty', 1230),
(1001066, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nkanja', 93, 'Kyaka South County', 'Subcounty', 1231),
(1001067, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Ruyonza', 93, 'Kyaka South County', 'Subcounty', 1232),
(1001068, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rwentuha', 93, 'Kyaka South County', 'Subcounty', 1233),
(1001069, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bugaaki', 94, 'Mwenge Central County', 'Subcounty', 1234),
(1001070, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katooke', 94, 'Mwenge Central County', 'Subcounty', 1235),
(1001071, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Katooke Town Council', 94, 'Mwenge Central County', 'Subcounty', 1236),
(1001072, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyarusozi', 94, 'Mwenge Central County', 'Subcounty', 1237),
(1001073, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyarusozi Town Council', 94, 'Mwenge Central County', 'Subcounty', 1238),
(1001074, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Nyakisi', 94, 'Mwenge Central County', 'Subcounty', 1239),
(1001075, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Rugombe Town Council', 94, 'Mwenge Central County', 'Subcounty', 1240),
(1001076, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Batalika', 94, 'Mwenge County North', 'Subcounty', 1241),
(1001077, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Bufunjo', 94, 'Mwenge County North', 'Subcounty', 1242),
(1001078, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kanyegaramire', 94, 'Mwenge County North', 'Subcounty', 1243),
(1001079, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kigoyera', 94, 'Mwenge County North', 'Subcounty', 1244),
(1001080, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kitega', 94, 'Mwenge County North', 'Subcounty', 1245),
(1001081, '2022-06-10 05:12:50', '2022-06-10 05:12:50', 'Kyamutunzi Town Council', 94, 'Mwenge County North', 'Subcounty', 1246),
(1001082, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyembogo', 94, 'Mwenge County North', 'Subcounty', 1247),
(1001083, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mabira Town Council', 94, 'Mwenge County North', 'Subcounty', 1248),
(1001084, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyabirongo', 94, 'Mwenge County North', 'Subcounty', 1249),
(1001085, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyankwanzi', 94, 'Mwenge County North', 'Subcounty', 1250),
(1001086, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butiiti', 94, 'Mwenge County South', 'Subcounty', 1251),
(1001087, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butunduzi', 94, 'Mwenge County South', 'Subcounty', 1252),
(1001088, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butunduzi Town Council', 94, 'Mwenge County South', 'Subcounty', 1253),
(1001089, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kigaraale', 94, 'Mwenge County South', 'Subcounty', 1254),
(1001090, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kihuura', 94, 'Mwenge County South', 'Subcounty', 1255),
(1001091, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kisojo', 94, 'Mwenge County South', 'Subcounty', 1256),
(1001092, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kisojo Town Council', 94, 'Mwenge County South', 'Subcounty', 1257),
(1001093, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyakatwire Town Council', 94, 'Mwenge County South', 'Subcounty', 1258),
(1001094, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyenjojo Town Council', 94, 'Mwenge County South', 'Subcounty', 1259),
(1001095, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyabuharwa', 94, 'Mwenge County South', 'Subcounty', 1260),
(1001096, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyantungo', 94, 'Mwenge County South', 'Subcounty', 1261),
(1001097, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakuuto', 111, 'Kakuuto County', 'Subcounty', 1262),
(1001098, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasasa', 111, 'Kakuuto County', 'Subcounty', 1263),
(1001099, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasensero Town Council', 111, 'Kakuuto County', 'Subcounty', 1264),
(1001100, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyebe', 111, 'Kakuuto County', 'Subcounty', 1265),
(1001101, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mutukula Town Council', 111, 'Kakuuto County', 'Subcounty', 1266),
(1001102, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nangoma', 111, 'Kakuuto County', 'Subcounty', 1267),
(1001103, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kabira', 111, 'Kyotera County', 'Subcounty', 1268),
(1001104, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalisizo', 111, 'Kyotera County', 'Subcounty', 1269),
(1001105, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalisizo Town Council', 111, 'Kyotera County', 'Subcounty', 1270),
(1001106, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasaali Town Council', 111, 'Kyotera County', 'Subcounty', 1271),
(1001107, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyotera Town Council', 111, 'Kyotera County', 'Subcounty', 1272),
(1001108, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kirumba', 111, 'Kyotera County', 'Subcounty', 1273),
(1001109, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwankoni', 111, 'Kyotera County', 'Subcounty', 1274),
(1001110, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabigasa', 111, 'Kyotera County', 'Subcounty', 1275),
(1001111, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aceba', 68, 'Lamwo County', 'Subcounty', 1276),
(1001112, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agoro', 68, 'Lamwo County', 'Subcounty', 1277),
(1001113, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katum', 68, 'Lamwo County', 'Subcounty', 1278),
(1001114, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lamwo Town Council', 68, 'Lamwo County', 'Subcounty', 1279),
(1001115, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lokung', 68, 'Lamwo County', 'Subcounty', 1280),
(1001116, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lokung East', 68, 'Lamwo County', 'Subcounty', 1281),
(1001117, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Madi-Opei', 68, 'Lamwo County', 'Subcounty', 1282),
(1001118, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ogili', 68, 'Lamwo County', 'Subcounty', 1283),
(1001119, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Padibe East', 68, 'Lamwo County', 'Subcounty', 1284),
(1001120, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Padibe Town Council', 68, 'Lamwo County', 'Subcounty', 1285),
(1001121, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Padibe West', 68, 'Lamwo County', 'Subcounty', 1286),
(1001122, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Palabek Abera', 68, 'Lamwo County', 'Subcounty', 1287),
(1001123, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Palabek Nyimur', 68, 'Lamwo County', 'Subcounty', 1288),
(1001124, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Palabek-Gem', 68, 'Lamwo County', 'Subcounty', 1289),
(1001125, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Palabek-Kal', 68, 'Lamwo County', 'Subcounty', 1290),
(1001126, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Paloga', 68, 'Lamwo County', 'Subcounty', 1291),
(1001127, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Potika', 68, 'Lamwo County', 'Subcounty', 1292),
(1001128, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agweng', 69, 'Erute County North', 'Subcounty', 1293),
(1001129, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agweng Town Council', 69, 'Erute County North', 'Subcounty', 1294),
(1001130, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aromo', 69, 'Erute County North', 'Subcounty', 1295),
(1001131, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ayami', 69, 'Erute County North', 'Subcounty', 1296),
(1001132, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lira', 69, 'Erute County North', 'Subcounty', 1297),
(1001133, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ogur', 69, 'Erute County North', 'Subcounty', 1298),
(1001134, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Adekokwok', 69, 'Erute County South', 'Subcounty', 1299),
(1001135, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agali', 69, 'Erute County South', 'Subcounty', 1300),
(1001136, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Amach Town Council', 69, 'Erute County South', 'Subcounty', 1301),
(1001137, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Barr', 69, 'Erute County South', 'Subcounty', 1302),
(1001138, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Iwal', 69, 'Erute County South', 'Subcounty', 1303),
(1001139, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngetta', 69, 'Erute County South', 'Subcounty', 1304),
(1001140, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wiodyek', 69, 'Erute County South', 'Subcounty', 1305),
(1001141, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Adyel', 69, 'Lira Municipality', 'Subcounty', 1306),
(1001142, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lira Central', 69, 'Lira Municipality', 'Subcounty', 1307),
(1001143, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ojwina', 69, 'Lira Municipality', 'Subcounty', 1308),
(1001144, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Railways', 69, 'Lira Municipality', 'Subcounty', 1309),
(1001145, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukooma', 43, 'Luuka North County', 'Subcounty', 1310),
(1001146, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bulongo', 43, 'Luuka North County', 'Subcounty', 1311),
(1001147, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ikumbya', 43, 'Luuka North County', 'Subcounty', 1312),
(1001148, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Luuka Town Council', 43, 'Luuka North County', 'Subcounty', 1313),
(1001149, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukanga', 43, 'Luuka South County', 'Subcounty', 1314),
(1001150, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Irongo', 43, 'Luuka South County', 'Subcounty', 1315),
(1001151, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nawampiti', 43, 'Luuka South County', 'Subcounty', 1316),
(1001152, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Waibuga', 43, 'Luuka South County', 'Subcounty', 1317),
(1001153, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bunanika', 12, 'Bamunanika County', 'Subcounty', 1318),
(1001154, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumunanika', 12, 'Bamunanika County', 'Subcounty', 1319),
(1001155, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalagala', 12, 'Bamunanika County', 'Subcounty', 1320),
(1001156, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamira', 12, 'Bamunanika County', 'Subcounty', 1321),
(1001157, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kikyusa', 12, 'Bamunanika County', 'Subcounty', 1322),
(1001158, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Zirobwe', 12, 'Bamunanika County', 'Subcounty', 1323),
(1001159, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butuntumula', 12, 'Katikamu County North', 'Subcounty', 1324),
(1001160, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katikamu', 12, 'Katikamu County North', 'Subcounty', 1325),
(1001161, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Luwero Town Council', 12, 'Katikamu County North', 'Subcounty', 1326),
(1001162, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Luwero', 12, 'Katikamu County North', 'Subcounty', 1327),
(1001163, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bombo Town Council', 12, 'Katikamu County South', 'Subcounty', 1328),
(1001164, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukulubita', 12, 'Katikamu County South', 'Subcounty', 1330),
(1001165, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyimbwa', 12, 'Katikamu County South', 'Subcounty', 1331),
(1001166, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wobulenzi Town Council', 12, 'Katikamu County South', 'Subcounty', 1332),
(1001167, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kaliiro', 14, 'Kabula County', 'Subcounty', 1333),
(1001168, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kaliiro Town Council', 14, 'Kabula County', 'Subcounty', 1334),
(1001169, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasagama', 14, 'Kabula County', 'Subcounty', 1335),
(1001170, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kinuuka', 14, 'Kabula County', 'Subcounty', 1336),
(1001171, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lyakajura', 14, 'Kabula County', 'Subcounty', 1337),
(1001172, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lyantonde', 14, 'Kabula County', 'Subcounty', 1338),
(1001173, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lyantonde Town Council', 14, 'Kabula County', 'Subcounty', 1339),
(1001174, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mpumudde', 14, 'Kabula County', 'Subcounty', 1340),
(1001175, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugobero', 44, 'Bubulo County West', 'Subcounty', 1349),
(1001176, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukewa', 44, 'Bubulo County West', 'Subcounty', 1350),
(1001177, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukhadala', 44, 'Bubulo County West', 'Subcounty', 1351),
(1001178, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukhofu', 44, 'Bubulo County West', 'Subcounty', 1352),
(1001179, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukoma', 44, 'Bubulo County West', 'Subcounty', 1353),
(1001180, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukusu', 44, 'Bubulo County West', 'Subcounty', 1354),
(1001181, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bunabutsale', 44, 'Bubulo County West', 'Subcounty', 1355),
(1001182, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bunabwana', 44, 'Bubulo County West', 'Subcounty', 1356),
(1001183, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busukuya', 44, 'Bubulo County West', 'Subcounty', 1357),
(1001184, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butiru', 44, 'Bubulo County West', 'Subcounty', 1358),
(1001185, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butiru Town Council', 44, 'Bubulo County West', 'Subcounty', 1359),
(1001186, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butooto', 44, 'Bubulo County West', 'Subcounty', 1360),
(1001187, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butta', 44, 'Bubulo County West', 'Subcounty', 1361),
(1001188, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwagogo', 44, 'Bubulo County West', 'Subcounty', 1362),
(1001189, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwangani Town Council', 44, 'Bubulo County West', 'Subcounty', 1363),
(1001190, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buyinza Town Council', 44, 'Bubulo County West', 'Subcounty', 1364),
(1001191, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kaato', 44, 'Bubulo County West', 'Subcounty', 1365),
(1001192, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Khabutoola', 44, 'Bubulo County West', 'Subcounty', 1366),
(1001193, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kimaluli', 44, 'Bubulo County West', 'Subcounty', 1367),
(1001194, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukakata', 15, 'Bukoto County East', 'Subcounty', 1368),
(1001195, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukungwe', 15, 'Bukoto County East', 'Subcounty', 1370),
(1001196, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katwe/Butego', 15, 'Masaka Municipality', 'Subcounty', 1371),
(1001197, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kimaanya/Kabyakuza', 15, 'Masaka Municipality', 'Subcounty', 1372),
(1001198, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyendo/Ssenyange', 15, 'Masaka Municipality', 'Subcounty', 1373),
(1001199, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bikonzi', 95, 'Bujenje County', 'Subcounty', 1374),
(1001200, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buliima Town Council', 95, 'Bujenje County', 'Subcounty', 1376),
(1001201, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bwijanga', 95, 'Bujenje County', 'Subcounty', 1377),
(1001202, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kabango Town Council', 95, 'Bujenje County', 'Subcounty', 1378),
(1001203, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyantonzi', 95, 'Bujenje County', 'Subcounty', 1379),
(1001204, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kijunjubwa', 95, 'Buruli County', 'Subcounty', 1380),
(1001205, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kijunjubwa Town Council', 95, 'Buruli County', 'Subcounty', 1381),
(1001206, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kimengo', 95, 'Buruli County', 'Subcounty', 1382),
(1001207, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiruli', 95, 'Buruli County', 'Subcounty', 1383),
(1001208, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyatiri Town Council', 95, 'Buruli County', 'Subcounty', 1384),
(1001209, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Labongo', 95, 'Buruli County', 'Subcounty', 1385),
(1001210, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Miirya', 95, 'Buruli County', 'Subcounty', 1386),
(1001211, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pakanyi', 95, 'Buruli County', 'Subcounty', 1387),
(1001212, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Karujubu Division', 95, 'Masindi Municipality', 'Subcounty', 1389),
(1001213, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kigulya Division', 95, 'Masindi Municipality', 'Subcounty', 1390),
(1001214, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyangahya Division', 95, 'Masindi Municipality', 'Subcounty', 1391),
(1001215, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukabooli', 45, 'Bunya County East', 'Subcounty', 1392),
(1001216, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwaaya', 45, 'Bunya County East', 'Subcounty', 1393),
(1001217, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mpungwe', 45, 'Bunya County East', 'Subcounty', 1394),
(1001218, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugadde Town Council', 45, 'Bunya County South', 'Subcounty', 1395),
(1001219, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bwondha Town Council', 45, 'Bunya County South', 'Subcounty', 1396),
(1001220, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busakira', 45, 'Bunya County South', 'Subcounty', 1397),
(1001221, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Jacuzi', 45, 'Bunya County South', 'Subcounty', 1398),
(1001222, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kityerera', 45, 'Bunya County South', 'Subcounty', 1399),
(1001223, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Malongo', 45, 'Bunya County South', 'Subcounty', 1400),
(1001224, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Baitambogwe', 45, 'Bunya County West', 'Subcounty', 1401),
(1001225, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukatube', 45, 'Bunya County West', 'Subcounty', 1402),
(1001226, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Imanyiro', 45, 'Bunya County West', 'Subcounty', 1403),
(1001227, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'MagaMaga Town Council', 45, 'Bunya County West', 'Subcounty', 1404),
(1001228, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mayuge Town Council', 45, 'Bunya County West', 'Subcounty', 1405);
INSERT INTO `locations` (`id`, `created_at`, `updated_at`, `name`, `parent`, `photo`, `details`, `order`) VALUES
(1001229, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wairasa', 45, 'Bunya County West', 'Subcounty', 1406),
(1001230, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bubyangu', 46, 'Bungokho County North', 'Subcounty', 1407),
(1001231, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Budwale', 46, 'Bungokho County North', 'Subcounty', 1408),
(1001232, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukonde', 46, 'Bungokho County North', 'Subcounty', 1410),
(1001233, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Jewa Town Council', 46, 'Bungokho County North', 'Subcounty', 1411),
(1001234, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwasso', 46, 'Bungokho County North', 'Subcounty', 1412),
(1001235, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakaloke', 46, 'Bungokho County North', 'Subcounty', 1413),
(1001236, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakaloke Town Council', 46, 'Bungokho County North', 'Subcounty', 1414),
(1001237, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namabasa', 46, 'Bungokho County North', 'Subcounty', 1415),
(1001238, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namanyonyi', 46, 'Bungokho County North', 'Subcounty', 1416),
(1001239, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wanale', 46, 'Bungokho County North', 'Subcounty', 1417),
(1001240, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukasakya', 46, 'Bungokho County South', 'Subcounty', 1418),
(1001241, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukhiende', 46, 'Bungokho County South', 'Subcounty', 1419),
(1001242, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumasikye', 46, 'Bungokho County South', 'Subcounty', 1420),
(1001243, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumbobi', 46, 'Bungokho County South', 'Subcounty', 1421),
(1001244, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bungokho', 46, 'Bungokho County South', 'Subcounty', 1423),
(1001245, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busano', 46, 'Bungokho County South', 'Subcounty', 1424),
(1001246, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busiu', 46, 'Bungokho County South', 'Subcounty', 1425),
(1001247, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busiu Town Council', 46, 'Bungokho County South', 'Subcounty', 1426),
(1001248, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busoba', 46, 'Bungokho County South', 'Subcounty', 1427),
(1001249, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lukhonge', 46, 'Bungokho County South', 'Subcounty', 1428),
(1001250, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabumali Town Council', 46, 'Bungokho County South', 'Subcounty', 1429),
(1001251, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nauyo Town Council', 46, 'Bungokho County South', 'Subcounty', 1431),
(1001252, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nauyo-Bugema Town Council', 46, 'Bungokho County South', 'Subcounty', 1432),
(1001253, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyondo', 46, 'Bungokho County South', 'Subcounty', 1433),
(1001254, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Industrial Borough', 46, 'Mbale Municipality', 'Subcounty', 1434),
(1001255, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Northern Borough', 46, 'Mbale Municipality', 'Subcounty', 1435),
(1001256, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wanale Borough', 46, 'Mbale Municipality', 'Subcounty', 1436),
(1001257, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kagongi', 96, 'Kashari North County', 'Subcounty', 1437),
(1001258, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kashare', 96, 'Kashari North County', 'Subcounty', 1438),
(1001259, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubindi', 96, 'Kashari North County', 'Subcounty', 1439),
(1001260, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubindi-Ruhumba Town Council', 96, 'Kashari North County', 'Subcounty', 1440),
(1001261, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bubaare', 96, 'Kashari South County', 'Subcounty', 1441),
(1001262, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukiiro', 96, 'Kashari South County', 'Subcounty', 1442),
(1001263, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bwizibwera-Rutooma Town Council', 96, 'Kashari South County', 'Subcounty', 1443),
(1001264, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Runyamahembe', 96, 'Kashari South County', 'Subcounty', 1444),
(1001265, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Biharwe', 96, 'Mbarara Municipality', 'Subcounty', 1445),
(1001266, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakiika', 96, 'Mbarara Municipality', 'Subcounty', 1446),
(1001268, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamukuzi', 96, 'Mbarara Municipality', 'Subcounty', 1448),
(1001269, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyakayojo', 96, 'Mbarara Municipality', 'Subcounty', 1449),
(1001270, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyamitanga', 96, 'Mbarara Municipality', 'Subcounty', 1450),
(1001271, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugamba', 96, 'Rwampara County', 'Subcounty', 1451),
(1001272, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buteraniro-Nyeihanga Town Council', 96, 'Rwampara County', 'Subcounty', 1452),
(1001273, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kabura Town Council', 96, 'Rwampara County', 'Subcounty', 1453),
(1001274, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mwizi', 96, 'Rwampara County', 'Subcounty', 1454),
(1001275, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ndeija', 96, 'Rwampara County', 'Subcounty', 1455),
(1001277, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rweibogo-Kibingo Town Council', 96, 'Rwampara County', 'Subcounty', 1457),
(1001278, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kashenshero', 97, 'Ruhinda County', 'Subcounty', 1459),
(1001279, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kashenshero Town Council', 97, 'Ruhinda County', 'Subcounty', 1460),
(1001280, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katenga', 97, 'Ruhinda County', 'Subcounty', 1461),
(1001281, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mayanga', 97, 'Ruhinda County', 'Subcounty', 1462),
(1001282, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mutara', 97, 'Ruhinda County', 'Subcounty', 1463),
(1001283, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mitooma', 97, 'Ruhinda County', 'Subcounty', 1464),
(1001284, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mitooma Town Council', 97, 'Ruhinda County', 'Subcounty', 1465),
(1001285, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyakizinga', 97, 'Ruhinda County', 'Subcounty', 1467),
(1001286, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rurehe', 97, 'Ruhinda County', 'Subcounty', 1468),
(1001287, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bitereko', 97, 'Ruhinda North County', 'Subcounty', 1469),
(1001288, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kanyabwanga', 97, 'Ruhinda North County', 'Subcounty', 1470),
(1001289, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiyanga', 97, 'Ruhinda North County', 'Subcounty', 1471),
(1001290, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rutookye Town Council', 97, 'Ruhinda North County', 'Subcounty', 1472),
(1001291, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bbanda', 16, 'Busujju County', 'Subcounty', 1473),
(1001292, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bbanda Town Council', 16, 'Busujju County', 'Subcounty', 1474),
(1001293, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butayunja', 16, 'Busujju County', 'Subcounty', 1475),
(1001294, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakindu', 16, 'Busujju County', 'Subcounty', 1476),
(1001295, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Maanyi', 16, 'Busujju County', 'Subcounty', 1477),
(1001296, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Malangala', 16, 'Busujju County', 'Subcounty', 1478),
(1001297, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Zigoti Town Council', 16, 'Busujju County', 'Subcounty', 1479),
(1001298, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bulera', 16, 'Mityana County North', 'Subcounty', 1480),
(1001299, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalangaalo', 16, 'Mityana County North', 'Subcounty', 1481),
(1001300, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kikandwa', 16, 'Mityana County North', 'Subcounty', 1482),
(1001301, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busunju Town Council', 16, 'Mityana County South', 'Subcounty', 1483),
(1001302, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namungo', 16, 'Mityana County South', 'Subcounty', 1484),
(1001303, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ssekanyonyi', 16, 'Mityana County South', 'Subcounty', 1485),
(1001304, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ssekanyonyi Town Council', 16, 'Mityana County South', 'Subcounty', 1486),
(1001305, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busimbi Division', 16, 'Mityana Municipality', 'Subcounty', 1487),
(1001306, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ttamu Division', 16, 'Mityana Municipality', 'Subcounty', 1489),
(1001307, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Loputuk', 70, 'Matheniko County', 'Subcounty', 1490),
(1001308, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lotisan', 70, 'Matheniko County', 'Subcounty', 1491),
(1001309, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nadunget', 70, 'Matheniko County', 'Subcounty', 1492),
(1001310, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rupa', 70, 'Matheniko County', 'Subcounty', 1493),
(1001311, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katikekile', 70, 'Tepeth County', 'Subcounty', 1496),
(1001312, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Tapac', 70, 'Tepeth County', 'Subcounty', 1497),
(1001313, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aluru', 134, 'West Moyo County', 'Subcounty', 1498),
(1001314, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Dufile', 134, 'West Moyo County', 'Subcounty', 1499),
(1001315, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Laropi', 134, 'West Moyo County', 'Subcounty', 1500),
(1001316, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lefori', 134, 'West Moyo County', 'Subcounty', 1501),
(1001317, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Metu', 134, 'West Moyo County', 'Subcounty', 1502),
(1001318, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Moyo', 134, 'West Moyo County', 'Subcounty', 1503),
(1001319, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Moyo Town Council', 134, 'West Moyo County', 'Subcounty', 1504),
(1001320, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Otce', 134, 'West Moyo County', 'Subcounty', 1505),
(1001321, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kammengo', 17, 'Mawokota County North', 'Subcounty', 1506),
(1001322, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiringente', 17, 'Mawokota County North', 'Subcounty', 1507),
(1001323, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mpigi Town Council', 17, 'Mawokota County North', 'Subcounty', 1508),
(1001324, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Muduma', 17, 'Mawokota County North', 'Subcounty', 1509),
(1001325, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwama', 17, 'Mawokota County South', 'Subcounty', 1510),
(1001326, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwama Town Council', 17, 'Mawokota County South', 'Subcounty', 1511),
(1001327, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kayabwe Town Council', 17, 'Mawokota County South', 'Subcounty', 1512),
(1001328, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kituntu', 17, 'Mawokota County South', 'Subcounty', 1513),
(1001329, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nkozi', 17, 'Mawokota County South', 'Subcounty', 1514),
(1001330, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butoloogo', 18, 'Buwekula County', 'Subcounty', 1515),
(1001331, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kayebe', 18, 'Buwekula County', 'Subcounty', 1516),
(1001332, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiruuma', 18, 'Buwekula County', 'Subcounty', 1517),
(1001333, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kitenga', 18, 'Buwekula County', 'Subcounty', 1518),
(1001334, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiyuni', 18, 'Buwekula County', 'Subcounty', 1519),
(1001335, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Madudu', 18, 'Buwekula County', 'Subcounty', 1520),
(1001336, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bagezza', 18, 'Kasambya County', 'Subcounty', 1521),
(1001337, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasambya Town Council', 18, 'Kasambya County', 'Subcounty', 1523),
(1001338, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kabalinga', 18, 'Kasambya County', 'Subcounty', 1524),
(1001339, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lubimbiri', 18, 'Kasambya County', 'Subcounty', 1526),
(1001340, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabingoola', 18, 'Kasambya County', 'Subcounty', 1527),
(1001341, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabingoola Town Council', 18, 'Kasambya County', 'Subcounty', 1528),
(1001342, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyampisi', 19, 'Mukono County North', 'Subcounty', 1532),
(1001343, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nama', 19, 'Mukono County North', 'Subcounty', 1533),
(1001344, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mpatta', 19, 'Mukono County South', 'Subcounty', 1534),
(1001345, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mpunge', 19, 'Mukono County South', 'Subcounty', 1535),
(1001346, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakisunga', 19, 'Mukono County South', 'Subcounty', 1536),
(1001347, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ntenjeru-Kisoga Town Council', 19, 'Mukono County South', 'Subcounty', 1537),
(1001348, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Goma Division', 19, 'Mukono Municipality', 'Subcounty', 1538),
(1001349, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukono Division', 19, 'Mukono Municipality', 'Subcounty', 1539),
(1001350, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasawo', 19, 'Nakifuma County', 'Subcounty', 1540),
(1001351, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasawo Town Council', 19, 'Nakifuma County', 'Subcounty', 1541),
(1001352, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kimenyedde', 19, 'Nakifuma County', 'Subcounty', 1542),
(1001353, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nagojje', 19, 'Nakifuma County', 'Subcounty', 1543),
(1001354, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakifuma-Naggalama Town Council', 19, 'Nakifuma County', 'Subcounty', 1544),
(1001355, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namataba Town Council', 19, 'Nakifuma County', 'Subcounty', 1545),
(1001356, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namuganga', 19, 'Nakifuma County', 'Subcounty', 1546),
(1001357, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ntunda', 19, 'Nakifuma County', 'Subcounty', 1547),
(1001358, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kosike', 113, 'Pian County', 'Subcounty', 1548),
(1001359, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lolachat', 113, 'Pian County', 'Subcounty', 1549),
(1001360, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lorengedwat', 113, 'Pian County', 'Subcounty', 1550),
(1001361, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabitaluk', 113, 'Pian County', 'Subcounty', 1551),
(1001362, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Natirae', 113, 'Pian County', 'Subcounty', 1552),
(1001363, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kaawach', 71, 'Chekwii County (Kadam)', 'Subcounty', 1553),
(1001364, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakomongole', 71, 'Chekwii County (Kadam)', 'Subcounty', 1554),
(1001365, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lemusui', 71, 'Chekwii County (Kadam)', 'Subcounty', 1555),
(1001366, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Loregae', 71, 'Chekwii County (Kadam)', 'Subcounty', 1556),
(1001367, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Loreng', 71, 'Chekwii County (Kadam)', 'Subcounty', 1557),
(1001368, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Moruita', 71, 'Chekwii County (Kadam)', 'Subcounty', 1558),
(1001369, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakapiripirit', 71, 'Chekwii County (Kadam)', 'Subcounty', 1559),
(1001370, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namalu', 71, 'Chekwii County (Kadam)', 'Subcounty', 1560),
(1001371, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kikamulo', 20, 'Nakaseke North County', 'Subcounty', 1561),
(1001372, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kinyogoga', 20, 'Nakaseke North County', 'Subcounty', 1563),
(1001373, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kitto', 20, 'Nakaseke North County', 'Subcounty', 1564),
(1001374, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiwoko Town Council', 20, 'Nakaseke North County', 'Subcounty', 1565),
(1001375, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakaseke Butalangu Town Council', 20, 'Nakaseke North County', 'Subcounty', 1566),
(1001376, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngoma', 20, 'Nakaseke North County', 'Subcounty', 1567),
(1001377, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngoma Town Council', 20, 'Nakaseke North County', 'Subcounty', 1568),
(1001378, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wakyato', 20, 'Nakaseke North County', 'Subcounty', 1569),
(1001379, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kassangombe', 20, 'Nakaseke South County', 'Subcounty', 1570),
(1001380, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kapeeka', 20, 'Nakaseke South County', 'Subcounty', 1571),
(1001381, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakaseke', 20, 'Nakaseke South County', 'Subcounty', 1572),
(1001382, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakaseke Town Council', 20, 'Nakaseke South County', 'Subcounty', 1573),
(1001383, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Semuto', 20, 'Nakaseke South County', 'Subcounty', 1574),
(1001384, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Semuto Town Council', 20, 'Nakaseke South County', 'Subcounty', 1575),
(1001385, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwampanga', 21, 'Budyebo County', 'Subcounty', 1576),
(1001386, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Migyera Town Council', 21, 'Budyebo County', 'Subcounty', 1577),
(1001387, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabiswera', 21, 'Budyebo County', 'Subcounty', 1578),
(1001388, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakitoma', 21, 'Budyebo County', 'Subcounty', 1579),
(1001389, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwabatya', 21, 'Budyebo County', 'Subcounty', 1580),
(1001390, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakooge', 21, 'Nakasongola County', 'Subcounty', 1581),
(1001391, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakooge Town Council', 21, 'Nakasongola County', 'Subcounty', 1582),
(1001392, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalongo', 21, 'Nakasongola County', 'Subcounty', 1583),
(1001393, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalungi', 21, 'Nakasongola County', 'Subcounty', 1584),
(1001394, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mayirikiti Town Council', 21, 'Nakasongola County', 'Subcounty', 1585),
(1001395, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakasongola Town Council', 21, 'Nakasongola County', 'Subcounty', 1586),
(1001396, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wabinyonyi', 21, 'Nakasongola County', 'Subcounty', 1587),
(1001397, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukana', 47, 'Bukooli Island County', 'Subcounty', 1588),
(1001398, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lolwe', 47, 'Bukooli Island County', 'Subcounty', 1589),
(1001399, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Sigulu Islands', 47, 'Bukooli Island County', 'Subcounty', 1590),
(1001400, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Banda Town Council', 47, 'Bukooli South County', 'Subcounty', 1592),
(1001401, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buhemba', 47, 'Bukooli South County', 'Subcounty', 1593),
(1001402, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buswale', 47, 'Bukooli South County', 'Subcounty', 1594),
(1001403, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buyinja', 47, 'Bukooli South County', 'Subcounty', 1595),
(1001404, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mutumba', 47, 'Bukooli South County', 'Subcounty', 1596),
(1001405, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mutumba Town Council', 47, 'Bukooli South County', 'Subcounty', 1597),
(1001406, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namayingo Town Council', 47, 'Bukooli South County', 'Subcounty', 1598),
(1001407, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bubutu', 107, 'Namisindwa County', 'Subcounty', 1599),
(1001408, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukhabusi', 107, 'Namisindwa County', 'Subcounty', 1600),
(1001409, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukhaweka', 107, 'Namisindwa County', 'Subcounty', 1601),
(1001410, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukiabi', 107, 'Namisindwa County', 'Subcounty', 1602),
(1001411, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukoho', 107, 'Namisindwa County', 'Subcounty', 1603),
(1001412, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumbo', 107, 'Namisindwa County', 'Subcounty', 1604),
(1001413, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumbo Town Council', 107, 'Namisindwa County', 'Subcounty', 1605),
(1001414, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumityero', 107, 'Namisindwa County', 'Subcounty', 1606),
(1001415, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumumali', 107, 'Namisindwa County', 'Subcounty', 1607),
(1001416, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumwoni', 107, 'Namisindwa County', 'Subcounty', 1608),
(1001417, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bungati', 107, 'Namisindwa County', 'Subcounty', 1609),
(1001418, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bupoto', 107, 'Namisindwa County', 'Subcounty', 1610),
(1001419, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwabwala', 107, 'Namisindwa County', 'Subcounty', 1611),
(1001420, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwambwa', 107, 'Namisindwa County', 'Subcounty', 1612),
(1001421, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwatuwa', 107, 'Namisindwa County', 'Subcounty', 1613),
(1001422, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwakhakha Town Council', 107, 'Namisindwa County', 'Subcounty', 1614),
(1001423, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Magale Town Council', 107, 'Namisindwa County', 'Subcounty', 1615),
(1001424, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Magale', 107, 'Namisindwa County', 'Subcounty', 1616),
(1001425, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukhuyu', 107, 'Namisindwa County', 'Subcounty', 1617),
(1001426, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukoto', 107, 'Namisindwa County', 'Subcounty', 1618),
(1001427, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabitsikhi', 107, 'Namisindwa County', 'Subcounty', 1619),
(1001428, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namabya', 107, 'Namisindwa County', 'Subcounty', 1620),
(1001429, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namboko', 107, 'Namisindwa County', 'Subcounty', 1621),
(1001430, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namisindwa Town Council', 107, 'Namisindwa County', 'Subcounty', 1622),
(1001431, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namitsa', 107, 'Namisindwa County', 'Subcounty', 1623),
(1001432, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Tsekululu', 107, 'Namisindwa County', 'Subcounty', 1624),
(1001433, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ivukula', 48, 'Bukono County', 'Subcounty', 1625),
(1001434, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kibaale', 48, 'Bukono County', 'Subcounty', 1626),
(1001435, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kibale Town Council', 48, 'Bukono County', 'Subcounty', 1627),
(1001436, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabweyo', 48, 'Bukono County', 'Subcounty', 1628),
(1001437, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nangonde', 48, 'Bukono County', 'Subcounty', 1629),
(1001438, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugobi', 48, 'Busiki County', 'Subcounty', 1630),
(1001439, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugobi Town Council', 48, 'Busiki County', 'Subcounty', 1631),
(1001440, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bulange', 48, 'Busiki County', 'Subcounty', 1632),
(1001441, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiwanyi', 48, 'Busiki County', 'Subcounty', 1634),
(1001442, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kizuba', 48, 'Busiki County', 'Subcounty', 1635),
(1001443, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Magada', 48, 'Busiki County', 'Subcounty', 1636),
(1001444, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mazuba', 48, 'Busiki County', 'Subcounty', 1637),
(1001445, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namutumba', 48, 'Busiki County', 'Subcounty', 1638),
(1001446, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namutumba Town Council', 48, 'Busiki County', 'Subcounty', 1639),
(1001447, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nawaikona', 48, 'Busiki County', 'Subcounty', 1640),
(1001448, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nsinze', 48, 'Busiki County', 'Subcounty', 1641),
(1001449, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Apeitolim', 72, 'Bokora County', 'Subcounty', 1642),
(1001450, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Iriiri', 72, 'Bokora County', 'Subcounty', 1643),
(1001451, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kangole Town Council', 72, 'Bokora County', 'Subcounty', 1644),
(1001452, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lokiteded Town Council', 72, 'Bokora County', 'Subcounty', 1645),
(1001453, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lokopo', 72, 'Bokora County', 'Subcounty', 1646),
(1001454, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lopei', 72, 'Bokora County', 'Subcounty', 1647),
(1001455, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lorengecora', 72, 'Bokora County', 'Subcounty', 1648),
(1001456, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lotome', 72, 'Bokora County', 'Subcounty', 1649),
(1001457, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Matany', 72, 'Bokora County', 'Subcounty', 1650),
(1001458, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Matany Town Council', 72, 'Bokora County', 'Subcounty', 1651),
(1001459, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabwal', 72, 'Bokora County', 'Subcounty', 1652),
(1001460, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Napak Town Council', 72, 'Bokora County', 'Subcounty', 1653),
(1001461, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngoleriet', 72, 'Bokora County', 'Subcounty', 1654),
(1001462, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Poron', 72, 'Bokora County', 'Subcounty', 1655),
(1001463, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Abindu Division', 135, 'Nebbi Municipality', 'Subcounty', 1656),
(1001464, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Thatha Division', 135, 'Nebbi Municipality', 'Subcounty', 1657),
(1001465, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Acana', 135, 'Padyere County', 'Subcounty', 1658),
(1001466, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Akworo', 135, 'Padyere County', 'Subcounty', 1659),
(1001467, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Alala', 135, 'Padyere County', 'Subcounty', 1660),
(1001468, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Atego', 135, 'Padyere County', 'Subcounty', 1661),
(1001469, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Erussi', 135, 'Padyere County', 'Subcounty', 1662),
(1001470, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Jupangira', 135, 'Padyere County', 'Subcounty', 1663),
(1001471, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kucwiny', 135, 'Padyere County', 'Subcounty', 1664),
(1001472, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ndhew', 135, 'Padyere County', 'Subcounty', 1665),
(1001473, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nebbi', 135, 'Padyere County', 'Subcounty', 1666),
(1001474, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyaravur', 135, 'Padyere County', 'Subcounty', 1667),
(1001475, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Padwot', 135, 'Padyere County', 'Subcounty', 1668),
(1001476, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Parombo', 135, 'Padyere County', 'Subcounty', 1669),
(1001477, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Parombo Town Council', 135, 'Padyere County', 'Subcounty', 1670),
(1001478, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agirigiroi', 49, 'Ngora County', 'Subcounty', 1671),
(1001479, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Atoot', 49, 'Ngora County', 'Subcounty', 1672),
(1001480, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kapir', 49, 'Ngora County', 'Subcounty', 1673),
(1001481, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Morukakise', 49, 'Ngora County', 'Subcounty', 1674),
(1001482, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukura', 49, 'Ngora County', 'Subcounty', 1675),
(1001483, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukura Town Council', 49, 'Ngora County', 'Subcounty', 1676),
(1001484, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngora Town Council', 49, 'Ngora County', 'Subcounty', 1677),
(1001485, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngora', 49, 'Ngora County', 'Subcounty', 1678),
(1001486, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Odwarat', 49, 'Ngora County', 'Subcounty', 1679),
(1001487, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Opot Town Council', 49, 'Ngora County', 'Subcounty', 1680),
(1001488, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butungama', 98, 'Ntoroko County', 'Subcounty', 1681),
(1001489, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bweramule', 98, 'Ntoroko County', 'Subcounty', 1682),
(1001490, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kanara', 98, 'Ntoroko County', 'Subcounty', 1683),
(1001491, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kanara Town Council', 98, 'Ntoroko County', 'Subcounty', 1684),
(1001492, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Karugutu Town Council', 98, 'Ntoroko County', 'Subcounty', 1685),
(1001493, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Karugutu', 98, 'Ntoroko County', 'Subcounty', 1686),
(1001494, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kibuuku Town Council', 98, 'Ntoroko County', 'Subcounty', 1687),
(1001495, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nombe', 98, 'Ntoroko County', 'Subcounty', 1688),
(1001496, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwebisengo', 98, 'Ntoroko County', 'Subcounty', 1689),
(1001497, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwebisengo Town Council', 98, 'Ntoroko County', 'Subcounty', 1690),
(1001498, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bwongyera', 99, 'Kajara County', 'Subcounty', 1691),
(1001499, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ihunga', 99, 'Kajara County', 'Subcounty', 1692),
(1001500, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kagarama Town Council', 99, 'Kajara County', 'Subcounty', 1693),
(1001501, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kibatsi', 99, 'Kajara County', 'Subcounty', 1694),
(1001502, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyabihoko', 99, 'Kajara County', 'Subcounty', 1695),
(1001503, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyabushenyi', 99, 'Kajara County', 'Subcounty', 1696),
(1001504, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyamunuka Town Council', 99, 'Kajara County', 'Subcounty', 1697),
(1001505, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwamabondo Town Council', 99, 'Kajara County', 'Subcounty', 1698),
(1001506, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwashamaire Town Council', 99, 'Kajara County', 'Subcounty', 1699),
(1001507, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Itoojo', 99, 'Ruhaama County', 'Subcounty', 1703),
(1001508, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kafunjo-Mirama Town Council', 99, 'Ruhaama County', 'Subcounty', 1704),
(1001509, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kitwe Town Council', 99, 'Ruhaama County', 'Subcounty', 1705),
(1001510, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ntungamo', 99, 'Ruhaama County', 'Subcounty', 1706),
(1001511, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyakyera', 99, 'Ruhaama County', 'Subcounty', 1707),
(1001512, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyakyera Town Council', 99, 'Ruhaama County', 'Subcounty', 1708),
(1001513, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyamukana Town Council', 99, 'Ruhaama County', 'Subcounty', 1709),
(1001514, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyarutuntu', 99, 'Ruhaama County', 'Subcounty', 1710),
(1001515, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ruhaama', 99, 'Ruhaama County', 'Subcounty', 1711),
(1001516, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ruhaama East', 99, 'Ruhaama County', 'Subcounty', 1712),
(1001517, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rukoni East', 99, 'Ruhaama County', 'Subcounty', 1713),
(1001518, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rukoni West', 99, 'Ruhaama County', 'Subcounty', 1714),
(1001519, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rweikiniro', 99, 'Ruhaama County', 'Subcounty', 1715),
(1001520, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwoho Town Council', 99, 'Ruhaama County', 'Subcounty', 1716),
(1001521, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubaare', 99, 'Rushenyi County', 'Subcounty', 1719),
(1001522, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubaare Town Council', 99, 'Rushenyi County', 'Subcounty', 1720),
(1001523, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rugarama', 99, 'Rushenyi County', 'Subcounty', 1721),
(1001524, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rugarama North', 99, 'Rushenyi County', 'Subcounty', 1722),
(1001525, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwentobo-Rwahi Town Council', 99, 'Rushenyi County', 'Subcounty', 1723),
(1001526, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Alero', 73, 'Nwoya County', 'Subcounty', 1724),
(1001527, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Anaka/Payira', 73, 'Nwoya County', 'Subcounty', 1725),
(1001528, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Got Apwoyo', 73, 'Nwoya County', 'Subcounty', 1726),
(1001529, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Koch Goma Town Council', 73, 'Nwoya County', 'Subcounty', 1727),
(1001530, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Koch Goma', 73, 'Nwoya County', 'Subcounty', 1728),
(1001531, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lii', 73, 'Nwoya County', 'Subcounty', 1729),
(1001532, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lungulu', 73, 'Nwoya County', 'Subcounty', 1730),
(1001533, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nwoya Town Council', 73, 'Nwoya County', 'Subcounty', 1731),
(1001534, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Paminyai', 73, 'Nwoya County', 'Subcounty', 1732),
(1001535, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Purongo', 73, 'Nwoya County', 'Subcounty', 1733),
(1001536, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Purongo Town Council', 73, 'Nwoya County', 'Subcounty', 1734),
(1001537, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aliba', 118, 'Obongi County', 'Subcounty', 1735),
(1001538, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ewafa', 118, 'Obongi County', 'Subcounty', 1736),
(1001539, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Gimara', 118, 'Obongi County', 'Subcounty', 1737),
(1001540, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Itula', 118, 'Obongi County', 'Subcounty', 1738),
(1001541, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Obongi Town Council', 118, 'Obongi County', 'Subcounty', 1739),
(1001542, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Palorinya', 118, 'Obongi County', 'Subcounty', 1740),
(1001543, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Adwari', 74, 'Otuke County', 'Subcounty', 1741),
(1001544, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Adwari Town Council', 74, 'Otuke County', 'Subcounty', 1742),
(1001545, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Barjobi', 74, 'Otuke County', 'Subcounty', 1743),
(1001546, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ogor', 74, 'Otuke County', 'Subcounty', 1744),
(1001547, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ogwette', 74, 'Otuke County', 'Subcounty', 1745),
(1001548, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Okwang', 74, 'Otuke County', 'Subcounty', 1746),
(1001549, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Olilim', 74, 'Otuke County', 'Subcounty', 1747),
(1001550, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Orum', 74, 'Otuke County', 'Subcounty', 1748),
(1001551, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Otuke Town Council', 74, 'Otuke County', 'Subcounty', 1749),
(1001552, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Abok', 75, 'Oyam County North', 'Subcounty', 1750),
(1001553, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Achaba', 75, 'Oyam County North', 'Subcounty', 1751),
(1001554, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aleka', 75, 'Oyam County North', 'Subcounty', 1752),
(1001555, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Icheme', 75, 'Oyam County North', 'Subcounty', 1753),
(1001556, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ngai', 75, 'Oyam County North', 'Subcounty', 1754),
(1001557, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Otwal', 75, 'Oyam County North', 'Subcounty', 1755),
(1001558, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Oyam Town Council', 75, 'Oyam County North', 'Subcounty', 1756),
(1001559, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aber', 75, 'Oyam County South', 'Subcounty', 1757),
(1001560, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamdini', 75, 'Oyam County South', 'Subcounty', 1758),
(1001561, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamdini Town Council', 75, 'Oyam County South', 'Subcounty', 1759),
(1001562, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Loro', 75, 'Oyam County South', 'Subcounty', 1760),
(1001563, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Loro Town Council', 75, 'Oyam County South', 'Subcounty', 1761),
(1001564, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Minakulu Town Council', 75, 'Oyam County South', 'Subcounty', 1762),
(1001565, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Minakulu', 75, 'Oyam County South', 'Subcounty', 1763),
(1001566, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Myene', 75, 'Oyam County South', 'Subcounty', 1764),
(1001567, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Awere', 76, 'Aruu County', 'Subcounty', 1765),
(1001568, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lunyiri', 76, 'Aruu County', 'Subcounty', 1766),
(1001569, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ogom', 76, 'Aruu County', 'Subcounty', 1767),
(1001570, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pader', 76, 'Aruu County', 'Subcounty', 1768),
(1001571, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pader Town Council', 76, 'Aruu County', 'Subcounty', 1769),
(1001572, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pukor', 76, 'Aruu County', 'Subcounty', 1770),
(1001573, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Puranga', 76, 'Aruu County', 'Subcounty', 1771),
(1001574, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Te-Nam', 76, 'Aruu County', 'Subcounty', 1772),
(1001575, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Acholi-Bur', 76, 'Aruu North County', 'Subcounty', 1773),
(1001576, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ajan', 76, 'Aruu North County', 'Subcounty', 1774),
(1001577, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agangura', 76, 'Aruu North County', 'Subcounty', 1775),
(1001578, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Atanga', 76, 'Aruu North County', 'Subcounty', 1776),
(1001579, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Atanga Town Council', 76, 'Aruu North County', 'Subcounty', 1777),
(1001580, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bongtiko', 76, 'Aruu North County', 'Subcounty', 1778),
(1001581, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Laguti', 76, 'Aruu North County', 'Subcounty', 1779),
(1001582, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lapul', 76, 'Aruu North County', 'Subcounty', 1780),
(1001583, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Latanya', 76, 'Aruu North County', 'Subcounty', 1781),
(1001584, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Paiula', 76, 'Aruu North County', 'Subcounty', 1782),
(1001585, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Porogali', 76, 'Aruu North County', 'Subcounty', 1783),
(1001586, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Alwi', 108, 'Jonam County', 'Subcounty', 1784),
(1001587, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Dei', 108, 'Jonam County', 'Subcounty', 1785),
(1001588, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Packwach', 108, 'Jonam County', 'Subcounty', 1786),
(1001589, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Packwach Town Council', 108, 'Jonam County', 'Subcounty', 1787),
(1001590, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Panyango', 108, 'Jonam County', 'Subcounty', 1788),
(1001591, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Panyimur', 108, 'Jonam County', 'Subcounty', 1789),
(1001592, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Panyimur Town Council', 108, 'Jonam County', 'Subcounty', 1790),
(1001593, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pokwero', 108, 'Jonam County', 'Subcounty', 1791),
(1001594, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pokworo', 108, 'Jonam County', 'Subcounty', 1792),
(1001595, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ragem', 108, 'Jonam County', 'Subcounty', 1793),
(1001596, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wadelai', 108, 'Jonam County', 'Subcounty', 1794),
(1001597, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agule', 50, 'Agule County', 'Subcounty', 1795),
(1001598, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Agule Town Council', 50, 'Agule County', 'Subcounty', 1796),
(1001599, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Akisim', 50, 'Agule County', 'Subcounty', 1797),
(1001600, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Apopong', 50, 'Agule County', 'Subcounty', 1798),
(1001601, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Chelekura', 50, 'Agule County', 'Subcounty', 1799),
(1001602, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Gogonyo', 50, 'Agule County', 'Subcounty', 1800),
(1001603, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kameke', 50, 'Agule County', 'Subcounty', 1801),
(1001604, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kaukura', 50, 'Agule County', 'Subcounty', 1802),
(1001605, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Oboliso', 50, 'Agule County', 'Subcounty', 1803),
(1001606, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Obutet', 50, 'Agule County', 'Subcounty', 1804),
(1001607, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kibale', 86, 'Kibale County', 'Subcounty', 1805),
(1001608, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Opwateta', 86, 'Kibale County', 'Subcounty', 1807),
(1001609, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamuge', 50, 'Pallisa County', 'Subcounty', 1808),
(1001610, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamuge Town Council', 50, 'Pallisa County', 'Subcounty', 1809),
(1001611, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasodo', 50, 'Pallisa County', 'Subcounty', 1810),
(1001612, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Oboliso I', 50, 'Pallisa County', 'Subcounty', 1811),
(1001613, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Olok', 50, 'Pallisa County', 'Subcounty', 1812),
(1001614, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pallisa', 50, 'Pallisa County', 'Subcounty', 1813),
(1001615, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pallisa Town Council', 50, 'Pallisa County', 'Subcounty', 1814),
(1001616, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Puti-Puti', 50, 'Pallisa County', 'Subcounty', 1815),
(1001617, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kacheera', 22, 'Buyamba County', 'Subcounty', 1817),
(1001618, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kagamba(Buyamba)', 22, 'Buyamba County', 'Subcounty', 1818),
(1001619, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasangala', 22, 'Buyamba County', 'Subcounty', 1819),
(1001620, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwamaggwa', 22, 'Buyamba County', 'Subcounty', 1820),
(1001621, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Byakabanda', 22, 'Kooki County', 'Subcounty', 1821),
(1001622, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kibanda', 22, 'Kooki County', 'Subcounty', 1822),
(1001623, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kifamba', 22, 'Kooki County', 'Subcounty', 1823),
(1001624, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiziba', 22, 'Kooki County', 'Subcounty', 1824),
(1001625, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyalulangira', 22, 'Kooki County', 'Subcounty', 1825),
(1001626, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwanda', 22, 'Kooki County', 'Subcounty', 1826),
(1001627, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rakai Town Council', 22, 'Kooki County', 'Subcounty', 1827),
(1001628, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bubare', 106, 'Rubanda County East', 'Subcounty', 1828),
(1001629, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Hamurwa', 106, 'Rubanda County East', 'Subcounty', 1829),
(1001630, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Hamurwa Town Council', 106, 'Rubanda County East', 'Subcounty', 1830),
(1001631, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyamweeru', 106, 'Rubanda County East', 'Subcounty', 1831),
(1001632, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bufundi', 106, 'Rubanda County West', 'Subcounty', 1832),
(1001633, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ikumba', 106, 'Rubanda County West', 'Subcounty', 1833),
(1001634, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Muko', 106, 'Rubanda County West', 'Subcounty', 1834),
(1001635, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubanda Town Council', 106, 'Rubanda County West', 'Subcounty', 1835),
(1001636, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ruhija', 106, 'Rubanda County West', 'Subcounty', 1836),
(1001637, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katunguru', 100, 'Bunyaruguru County', 'Subcounty', 1837),
(1001638, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kichwamba', 100, 'Bunyaruguru County', 'Subcounty', 1838),
(1001639, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Magambo', 100, 'Bunyaruguru County', 'Subcounty', 1839),
(1001640, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubirizi Town Council', 100, 'Bunyaruguru County', 'Subcounty', 1840),
(1001641, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rutoto', 100, 'Bunyaruguru County', 'Subcounty', 1841),
(1001642, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ryeru', 100, 'Bunyaruguru County', 'Subcounty', 1842),
(1001643, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katanda', 100, 'Katerera County', 'Subcounty', 1843),
(1001644, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katerera', 100, 'Katerera County', 'Subcounty', 1844),
(1001645, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katerera Town Council', 100, 'Katerera County', 'Subcounty', 1845),
(1001646, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kirugu', 100, 'Katerera County', 'Subcounty', 1846),
(1001647, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyabakara', 100, 'Katerera County', 'Subcounty', 1847),
(1001648, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukinda', 110, 'Rukiga County', 'Subcounty', 1848),
(1001649, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamwezi', 110, 'Rukiga County', 'Subcounty', 1849),
(1001650, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kashambya', 110, 'Rukiga County', 'Subcounty', 1850),
(1001651, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mparo Town Council', 110, 'Rukiga County', 'Subcounty', 1851),
(1001652, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Muhanga Town Council', 110, 'Rukiga County', 'Subcounty', 1852),
(1001653, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwamucucu', 110, 'Rukiga County', 'Subcounty', 1853),
(1001654, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buyanja Town Council', 101, 'Rubabo County', 'Subcounty', 1855),
(1001655, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kebisoni', 101, 'Rubabo County', 'Subcounty', 1856),
(1001656, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kebisoni Town Council', 101, 'Rubabo County', 'Subcounty', 1857),
(1001657, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyakishenyi', 101, 'Rubabo County', 'Subcounty', 1858),
(1001658, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyarushanje', 101, 'Rubabo County', 'Subcounty', 1859),
(1001659, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bikurungu Town Council', 101, 'Rujumbura County', 'Subcounty', 1860),
(1001660, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugangari', 101, 'Rujumbura County', 'Subcounty', 1861),
(1001661, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bwambara', 101, 'Rujumbura County', 'Subcounty', 1863),
(1001662, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyakagyeme', 101, 'Rujumbura County', 'Subcounty', 1864),
(1001663, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ruhinda', 101, 'Rujumbura County', 'Subcounty', 1865),
(1001664, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rwerere Town Council', 101, 'Rujumbura County', 'Subcounty', 1866),
(1001665, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kadungulu', 51, 'Kasilo County', 'Subcounty', 1877),
(1001666, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kadungulu Town Council', 51, 'Kasilo County', 'Subcounty', 1878),
(1001667, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasilo Town Council', 51, 'Kasilo County', 'Subcounty', 1879),
(1001668, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kidetok Town Council', 51, 'Kasilo County', 'Subcounty', 1880),
(1001669, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Labor', 51, 'Kasilo County', 'Subcounty', 1881),
(1001670, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pingire', 51, 'Kasilo County', 'Subcounty', 1882),
(1001671, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Atiira', 51, 'Serere County', 'Subcounty', 1883),
(1001672, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kateta', 51, 'Serere County', 'Subcounty', 1884),
(1001673, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyere', 51, 'Serere County', 'Subcounty', 1885);
INSERT INTO `locations` (`id`, `created_at`, `updated_at`, `name`, `parent`, `photo`, `details`, `order`) VALUES
(1001674, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Serere Town Council', 51, 'Serere County', 'Subcounty', 1886),
(1001675, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Serere / Olio', 51, 'Serere County', 'Subcounty', 1887),
(1001676, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kigarama', 102, 'Sheema County North', 'Subcounty', 1889),
(1001677, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyangyenyi', 102, 'Sheema County North', 'Subcounty', 1890),
(1001678, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Masheruka', 102, 'Sheema County North', 'Subcounty', 1891),
(1001679, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Masheruka Town Council', 102, 'Sheema County North', 'Subcounty', 1892),
(1001680, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugongi Town Council', 102, 'Sheema County South', 'Subcounty', 1893),
(1001681, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasaana', 102, 'Sheema County South', 'Subcounty', 1894),
(1001682, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kitagata', 102, 'Sheema County South', 'Subcounty', 1895),
(1001683, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kitagata Town Council', 102, 'Sheema County South', 'Subcounty', 1896),
(1001684, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Shuuku', 102, 'Sheema County South', 'Subcounty', 1898),
(1001685, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Shuuku Town Council', 102, 'Sheema County South', 'Subcounty', 1899),
(1001686, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kabwohe Division', 102, 'Sheema Municipality', 'Subcounty', 1900),
(1001687, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kagango Division', 102, 'Sheema Municipality', 'Subcounty', 1901),
(1001688, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kashozi Division', 102, 'Sheema Municipality', 'Subcounty', 1902),
(1001689, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Sheema Central Division', 102, 'Sheema Municipality', 'Subcounty', 1903),
(1001690, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bubbeza', 52, 'Budadiri County West', 'Subcounty', 1904),
(1001691, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugambi', 52, 'Budadiri County West', 'Subcounty', 1905),
(1001692, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukhulo', 52, 'Budadiri County West', 'Subcounty', 1906),
(1001693, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukiyi', 52, 'Budadiri County West', 'Subcounty', 1907),
(1001694, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bunyafwa', 52, 'Budadiri County West', 'Subcounty', 1908),
(1001695, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busamaga', 52, 'Budadiri County West', 'Subcounty', 1909),
(1001696, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buteza', 52, 'Budadiri County West', 'Subcounty', 1910),
(1001697, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwalasi', 52, 'Budadiri County West', 'Subcounty', 1911),
(1001698, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buwasa', 52, 'Budadiri County West', 'Subcounty', 1912),
(1001699, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buyobo', 52, 'Budadiri County West', 'Subcounty', 1913),
(1001700, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Dahami', 52, 'Budadiri County West', 'Subcounty', 1914),
(1001701, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Luleni', 52, 'Budadiri County West', 'Subcounty', 1915),
(1001702, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lulena', 52, 'Budadiri County West', 'Subcounty', 1916),
(1001703, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mafuda', 52, 'Budadiri County West', 'Subcounty', 1917),
(1001704, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mafudu', 52, 'Budadiri County West', 'Subcounty', 1918),
(1001705, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nalusala', 52, 'Budadiri County West', 'Subcounty', 1920),
(1001706, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namugabwe', 52, 'Budadiri County West', 'Subcounty', 1921),
(1001707, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Sironko Town Council', 52, 'Budadiri County West', 'Subcounty', 1922),
(1001708, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Budadiri Town Council', 52, 'Budadiri County East', 'Subcounty', 1923),
(1001709, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bugitimwa', 52, 'Budadiri County East', 'Subcounty', 1924),
(1001710, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Buhugu', 52, 'Budadiri County East', 'Subcounty', 1925),
(1001711, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukiise', 52, 'Budadiri County East', 'Subcounty', 1926),
(1001712, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukyabo', 52, 'Budadiri County East', 'Subcounty', 1927),
(1001713, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bukyambi', 52, 'Budadiri County East', 'Subcounty', 1928),
(1001714, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumalimba', 52, 'Budadiri County East', 'Subcounty', 1929),
(1001715, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumasifwa', 52, 'Budadiri County East', 'Subcounty', 1930),
(1001716, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bumulisha', 52, 'Budadiri County East', 'Subcounty', 1931),
(1001717, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busiita', 52, 'Budadiri County East', 'Subcounty', 1932),
(1001718, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busulani', 52, 'Budadiri County East', 'Subcounty', 1933),
(1001719, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Butandiga', 52, 'Budadiri County East', 'Subcounty', 1934),
(1001720, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Elgon', 52, 'Budadiri County East', 'Subcounty', 1935),
(1001721, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kikobero', 52, 'Budadiri County East', 'Subcounty', 1936),
(1001722, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Legenya', 52, 'Budadiri County East', 'Subcounty', 1937),
(1001723, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namaguli', 52, 'Budadiri County East', 'Subcounty', 1939),
(1001724, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Zesui', 52, 'Budadiri County East', 'Subcounty', 1940),
(1001725, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Arapai', 53, 'Dakabela County', 'Subcounty', 1941),
(1001726, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Arapai Town Council', 53, 'Dakabela County', 'Subcounty', 1942),
(1001727, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katine', 53, 'Dakabela County', 'Subcounty', 1943),
(1001728, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Oculoi', 53, 'Dakabela County', 'Subcounty', 1944),
(1001729, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Tubur', 53, 'Dakabela County', 'Subcounty', 1945),
(1001730, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Tubur Town Council', 53, 'Dakabela County', 'Subcounty', 1946),
(1001731, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Amen Town Council', 53, 'Soroti County', 'Subcounty', 1947),
(1001732, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Asuret', 53, 'Soroti County', 'Subcounty', 1948),
(1001733, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aukot', 53, 'Soroti County', 'Subcounty', 1949),
(1001734, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Awaliwal', 53, 'Soroti County', 'Subcounty', 1950),
(1001735, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Gweri', 53, 'Soroti County', 'Subcounty', 1951),
(1001736, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kamuda', 53, 'Soroti County', 'Subcounty', 1952),
(1001737, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lalle', 53, 'Soroti County', 'Subcounty', 1953),
(1001738, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ocokican', 53, 'Soroti County', 'Subcounty', 1954),
(1001739, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Soroti', 53, 'Soroti County', 'Subcounty', 1955),
(1001740, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Eastern', 53, 'Soroti Municipality', 'Subcounty', 1956),
(1001741, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Northern', 53, 'Soroti Municipality', 'Subcounty', 1957),
(1001742, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Western', 53, 'Soroti Municipality', 'Subcounty', 1958),
(1001743, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyeera', 23, 'Lwemiyaga County', 'Subcounty', 1960),
(1001744, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwemiyaga', 23, 'Lwemiyaga County', 'Subcounty', 1961),
(1001745, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namitanga', 23, 'Lwemiyaga County', 'Subcounty', 1962),
(1001746, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ntuusi Town Council', 23, 'Lwemiyaga County', 'Subcounty', 1963),
(1001747, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katwe', 23, 'Mawogola County', 'Subcounty', 1964),
(1001748, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lwebitakuli', 23, 'Mawogola County', 'Subcounty', 1965),
(1001749, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mateete', 23, 'Mawogola County', 'Subcounty', 1966),
(1001750, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mateete Town Council', 23, 'Mawogola County', 'Subcounty', 1967),
(1001751, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mitete', 23, 'Mawogola County', 'Subcounty', 1968),
(1001752, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nakasenyi', 23, 'Mawogola County', 'Subcounty', 1969),
(1001753, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kawanda', 23, 'Mawogola North County', 'Subcounty', 1970),
(1001754, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Lugusulu', 23, 'Mawogola North County', 'Subcounty', 1971),
(1001755, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mabindo', 23, 'Mawogola North County', 'Subcounty', 1972),
(1001756, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mijwala', 23, 'Mawogola North County', 'Subcounty', 1973),
(1001757, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mitima', 23, 'Mawogola North County', 'Subcounty', 1974),
(1001758, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ssembabule Town Council', 23, 'Mawogola North County', 'Subcounty', 1975),
(1001759, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Tororo Eastern', 54, 'Tororo Municipality', 'Subcounty', 1976),
(1001760, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Tororo Western', 54, 'Tororo Municipality', 'Subcounty', 1977),
(1001761, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Akadot', 54, 'Tororo North County', 'Subcounty', 1978),
(1001762, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Apetai', 54, 'Tororo North County', 'Subcounty', 1979),
(1001763, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Merikit', 54, 'Tororo North County', 'Subcounty', 1980),
(1001764, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Molo', 54, 'Tororo North County', 'Subcounty', 1981),
(1001765, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mukuju', 54, 'Tororo North County', 'Subcounty', 1982),
(1001766, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kalait', 54, 'Tororo South County', 'Subcounty', 1983),
(1001767, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kayoro', 54, 'Tororo South County', 'Subcounty', 1984),
(1001768, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kwapa', 54, 'Tororo South County', 'Subcounty', 1985),
(1001769, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Malaba Town Council', 54, 'Tororo South County', 'Subcounty', 1986),
(1001770, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mella', 54, 'Tororo South County', 'Subcounty', 1987),
(1001771, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Morukatipe', 54, 'Tororo South County', 'Subcounty', 1988),
(1001772, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Osukuru', 54, 'Tororo South County', 'Subcounty', 1989),
(1001773, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katajula', 54, 'West Budama County North', 'Subcounty', 1990),
(1001774, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kirewa', 54, 'West Budama County North', 'Subcounty', 1991),
(1001775, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kisoko', 54, 'West Budama County North', 'Subcounty', 1992),
(1001776, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nagongera', 54, 'West Budama County North', 'Subcounty', 1993),
(1001777, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nagongera Town Council', 54, 'West Budama County North', 'Subcounty', 1994),
(1001778, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Paya', 54, 'West Budama County North', 'Subcounty', 1995),
(1001779, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Petta', 54, 'West Budama County North', 'Subcounty', 1996),
(1001780, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Soni', 54, 'West Budama County North', 'Subcounty', 1997),
(1001781, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'SopSop', 54, 'West Budama County North', 'Subcounty', 1998),
(1001782, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Iyolwa', 54, 'West Budama County South', 'Subcounty', 1999),
(1001783, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Iyolwa Town Council', 54, 'West Budama County South', 'Subcounty', 2000),
(1001784, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Magola', 54, 'West Budama County South', 'Subcounty', 2001),
(1001785, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mulanda', 54, 'West Budama County South', 'Subcounty', 2002),
(1001786, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mwello', 54, 'West Budama County South', 'Subcounty', 2003),
(1001787, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabuyoga', 54, 'West Budama County South', 'Subcounty', 2004),
(1001788, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabuyoga Town Council', 54, 'West Budama County South', 'Subcounty', 2005),
(1001789, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nyangole', 54, 'West Budama County South', 'Subcounty', 2006),
(1001790, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Osia', 54, 'West Budama County South', 'Subcounty', 2007),
(1001791, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Pajwenda Town Council', 54, 'West Budama County South', 'Subcounty', 2008),
(1001792, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Rubongi', 54, 'West Budama County South', 'Subcounty', 2009),
(1001793, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kyengera Town Council', 24, 'Busiro County East', 'Subcounty', 2010),
(1001794, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Mende', 24, 'Busiro County East', 'Subcounty', 2011),
(1001795, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wakiso', 24, 'Busiro County East', 'Subcounty', 2012),
(1001796, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Wakiso Town Council', 24, 'Busiro County East', 'Subcounty', 2013),
(1001797, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakiri', 24, 'Busiro County North', 'Subcounty', 2014),
(1001798, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kakiri Town Council', 24, 'Busiro County North', 'Subcounty', 2015),
(1001799, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kiziba(Masulita)', 24, 'Busiro County North', 'Subcounty', 2016),
(1001800, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Masuliita Town Council', 24, 'Busiro County North', 'Subcounty', 2017),
(1001801, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namayumba Town Council', 24, 'Busiro County North', 'Subcounty', 2018),
(1001802, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namayumba', 24, 'Busiro County North', 'Subcounty', 2020),
(1001803, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bussi', 24, 'Busiro County South', 'Subcounty', 2021),
(1001804, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kajjansi Town Council', 24, 'Busiro County South', 'Subcounty', 2022),
(1001805, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Katabi Town Council', 24, 'Busiro County South', 'Subcounty', 2023),
(1001806, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasanje', 24, 'Busiro County South', 'Subcounty', 2024),
(1001807, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Division A', 24, 'Entebbe Municipality', 'Subcounty', 2025),
(1001808, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Division B', 24, 'Entebbe Municipality', 'Subcounty', 2026),
(1001809, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bweyogerere Division', 24, 'Kira Municipality', 'Subcounty', 2027),
(1001810, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Namugongo Division', 24, 'Kira Municipality', 'Subcounty', 2029),
(1001811, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kasangati Town Council', 24, 'Kyadondo County East', 'Subcounty', 2030),
(1001812, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bunamwaya Division', 24, 'Makindye-Ssabagabo Municipality', 'Subcounty', 2031),
(1001813, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Masajja Division', 24, 'Makindye-Ssabagabo Municipality', 'Subcounty', 2032),
(1001814, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Ndejje Division', 24, 'Makindye-Ssabagabo Municipality', 'Subcounty', 2033),
(1001815, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Busukuma Division', 24, 'Nansana Municipality', 'Subcounty', 2034),
(1001816, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Gombe Division', 24, 'Nansana Municipality', 'Subcounty', 2035),
(1001817, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nabweru Division', 24, 'Nansana Municipality', 'Subcounty', 2036),
(1001818, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Nansana Division', 24, 'Nansana Municipality', 'Subcounty', 2037),
(1001819, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Apo', 136, 'Aringa County', 'Subcounty', 2038),
(1001820, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Aria', 136, 'Aringa County', 'Subcounty', 2039),
(1001821, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Bijo', 136, 'Aringa County', 'Subcounty', 2040),
(1001822, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kochi', 136, 'Aringa County', 'Subcounty', 2041),
(1001823, '2022-06-10 05:12:51', '2022-06-10 05:12:51', 'Kululu', 136, 'Aringa County', 'Subcounty', 2042),
(1001824, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kuru', 136, 'Aringa County', 'Subcounty', 2043),
(1001825, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kuru Town Council', 136, 'Aringa County', 'Subcounty', 2044),
(1001826, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lori', 136, 'Aringa County', 'Subcounty', 2045),
(1001827, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Romogi', 136, 'Aringa County', 'Subcounty', 2046),
(1001828, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Yumbe Town Council', 136, 'Aringa County', 'Subcounty', 2047),
(1001829, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Arilo', 136, 'Aringa North County', 'Subcounty', 2048),
(1001830, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kei', 136, 'Aringa North County', 'Subcounty', 2049),
(1001831, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Midigo', 136, 'Aringa North County', 'Subcounty', 2050),
(1001832, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Midigo Town Council', 136, 'Aringa North County', 'Subcounty', 2051),
(1001833, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kigandola', 45, 'Bunya County East', 'Subcounty', 2099),
(1001834, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kira Division', 24, 'Kira Municipality', 'Subcounty', 2028),
(1001835, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Bukomansimbi Town Council', 2, 'Bukomansimbi North County', 'Subcounty', 2052),
(1001836, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lwengo', 13, 'Bukoto County Mid-West', 'Subcounty', 2053),
(1001837, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lwengo Town Council', 13, 'Bukoto County Mid-West', 'Subcounty', 2054),
(1001838, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ndagwe', 13, 'Bukoto County Mid-West', 'Subcounty', 2055),
(1001839, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Katovu Town Council', 13, 'Bukoto County West', 'Subcounty', 2056),
(1001840, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kyazanga', 13, 'Bukoto County West', 'Subcounty', 2057),
(1001841, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kyazanga Town Council', 13, 'Bukoto County West', 'Subcounty', 2058),
(1001842, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Malango', 13, 'Bukoto County West', 'Subcounty', 2059),
(1001843, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kingo', 13, 'Bukoto County South', 'Subcounty', 2060),
(1001844, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kikoni Town Council', 13, 'Bukoto County South', 'Subcounty', 2061),
(1001845, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kisekka', 13, 'Bukoto County South', 'Subcounty', 2062),
(1001846, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kabonera', 15, 'Bukoto County Central', 'Subcounty', 2063),
(1001847, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kyanamukaka', 15, 'Bukoto County Central', 'Subcounty', 2064),
(1001848, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kyesiiga', 15, 'Bukoto County Central', 'Subcounty', 2065),
(1001849, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Koome Islands', 19, 'Mukono County South', 'Subcounty', 2066),
(1001850, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Katosi Town Council', 19, 'Mukono County South', 'Subcounty', 2067),
(1001851, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lwampanga Town Council', 21, 'Budyebo County', 'Subcounty', 2068),
(1001852, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ndaiga', 103, 'Buyaga West County', 'Subcounty', 2073),
(1001853, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Buhanda', 121, 'Kitagwenda County', 'Subcounty', 2074),
(1001854, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kabujogera Town Council', 121, 'Kitagwenda County', 'Subcounty', 2075),
(1001855, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kicheche', 121, 'Kitagwenda County', 'Subcounty', 2077),
(1001856, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Mahyoro', 121, 'Kitagwenda County', 'Subcounty', 2078),
(1001857, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ntara', 121, 'Kitagwenda County', 'Subcounty', 2079),
(1001858, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nyabbani', 121, 'Kitagwenda County', 'Subcounty', 2080),
(1001859, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Otuboi Town Council', 124, 'Kalaki County', 'Subcounty', 2081),
(1001860, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Otuboi', 124, 'Kalaki County', 'Subcounty', 2082),
(1001861, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ogwolo', 124, 'Kalaki County', 'Subcounty', 2083),
(1001862, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ocelakur', 124, 'Kalaki County', 'Subcounty', 2084),
(1001863, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kalaki', 124, 'Kalaki County', 'Subcounty', 2085),
(1001864, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'kakure', 124, 'Kalaki County', 'Subcounty', 2086),
(1001865, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Bululu', 124, 'Kalaki County', 'Subcounty', 2087),
(1001866, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Apapai', 124, 'Kalaki County', 'Subcounty', 2088),
(1001867, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Anyara', 124, 'Kalaki County', 'Subcounty', 2089),
(1001868, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Alwa', 125, 'kaberamaido County', 'Subcounty', 2090),
(1001869, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aperikira', 125, 'kaberamaido County', 'Subcounty', 2091),
(1001870, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'kaberamaido', 125, 'kaberamaido County', 'Subcounty', 2092),
(1001871, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'kaberamaido Town Council', 125, 'kaberamaido County', 'Subcounty', 2093),
(1001872, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kobulubulu', 125, 'kaberamaido County', 'Subcounty', 2094),
(1001873, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ochero', 125, 'kaberamaido County', 'Subcounty', 2095),
(1001874, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ochero Town Council', 125, 'kaberamaido County', 'Subcounty', 2096),
(1001875, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Okile', 125, 'kaberamaido County', 'Subcounty', 2097),
(1001876, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Oriamo', 125, 'kaberamaido County', 'Subcounty', 2098),
(1001877, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Bugondo', 51, 'Kasilo County', 'Subcounty', 2100),
(1001878, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Abim', 55, 'Labwor County', 'Subcounty', 2110),
(1001879, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Abim Town Council', 55, 'Labwor County', 'Subcounty', 2111),
(1001880, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Alerek', 55, 'Labwor County', 'Subcounty', 2112),
(1001881, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Atunga', 55, 'Labwor County', 'Subcounty', 2113),
(1001882, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Camkok', 55, 'Labwor County', 'Subcounty', 2115),
(1001883, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kiru Town Council', 55, 'Labwor County', 'Subcounty', 2116),
(1001884, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lotukei', 55, 'Labwor County', 'Subcounty', 2117),
(1001885, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Magamaga', 55, 'Labwor County', 'Subcounty', 2118),
(1001886, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Molurem', 55, 'Labwor County', 'Subcounty', 2119),
(1001887, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nyakwae', 55, 'Labwor County', 'Subcounty', 2120),
(1001888, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Opopongo', 55, 'Labwor County', 'Subcounty', 2121),
(1001889, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Awei', 57, 'Ajuri County', 'Subcounty', 2122),
(1001890, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Abeja', 58, 'Kioga County', 'Subcounty', 2123),
(1001891, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Acii', 58, 'Kioga County', 'Subcounty', 2124),
(1001892, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Agikdak', 58, 'Kioga County', 'Subcounty', 2125),
(1001893, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Agwingiri', 58, 'Kioga County', 'Subcounty', 2126),
(1001894, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Akwon', 58, 'Kioga County', 'Subcounty', 2127),
(1001895, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Amolatar Town Council', 58, 'Kioga County', 'Subcounty', 2128),
(1001896, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aputi', 58, 'Kioga County', 'Subcounty', 2129),
(1001897, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Arwotcek', 58, 'Kioga County', 'Subcounty', 2130),
(1001898, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Awello', 58, 'Kioga County', 'Subcounty', 2131),
(1001899, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Etam', 58, 'Kioga County', 'Subcounty', 2132),
(1001900, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Etam Town Council', 58, 'Kioga County', 'Subcounty', 2133),
(1001901, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Muntu', 58, 'Kioga County', 'Subcounty', 2134),
(1001902, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nalubwoyo', 58, 'Kioga County', 'Subcounty', 2135),
(1001903, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Namasale', 58, 'Kioga County', 'Subcounty', 2136),
(1001904, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Namasale Town Council', 58, 'Kioga County', 'Subcounty', 2137),
(1001905, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Opali', 58, 'Kioga County', 'Subcounty', 2138),
(1001906, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Atiak', 60, 'Kilak North County', 'Subcounty', 2139),
(1001907, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Atiak Town Council', 60, 'Kilak North County', 'Subcounty', 2140),
(1001908, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Elugu Town Council', 60, 'Kilak North County', 'Subcounty', 2141),
(1001909, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Opara', 60, 'Kilak North County', 'Subcounty', 2142),
(1001910, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Pabbo', 60, 'Kilak North County', 'Subcounty', 2143),
(1001911, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Pabbo Town Council', 60, 'Kilak North County', 'Subcounty', 2144),
(1001912, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Pogo', 60, 'Kilak North County', 'Subcounty', 2145),
(1001913, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aii-Vu/Ajivu', 130, 'Terego West County', 'Subcounty', 2146),
(1001914, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Beleafe', 130, 'Terego West County', 'Subcounty', 2147),
(1001915, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Katrini', 130, 'Terego West County', 'Subcounty', 2148),
(1001916, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Dranya', 131, 'Koboko County', 'Subcounty', 2149),
(1001917, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kuluba', 131, 'Koboko County', 'Subcounty', 2150),
(1001918, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lobule', 131, 'Koboko County', 'Subcounty', 2151),
(1001919, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Midia', 131, 'Koboko County', 'Subcounty', 2152),
(1001920, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Awiziru', 133, 'Maracha County', 'Subcounty', 2156),
(1001921, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kijomoro', 133, 'Maracha County', 'Subcounty', 2157),
(1001922, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Obiba', 133, 'Maracha County', 'Subcounty', 2158),
(1001923, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Okokoro Town Council', 133, 'Maracha County', 'Subcounty', 2159),
(1001924, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Olufe', 133, 'Maracha County', 'Subcounty', 2160),
(1001925, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Oluvu', 133, 'Maracha County', 'Subcounty', 2161),
(1001926, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ovujo Town Council', 133, 'Maracha County', 'Subcounty', 2162),
(1001927, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ajira', 133, 'Maracha East County', 'Subcounty', 2163),
(1001928, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Alikua', 133, 'Maracha East County', 'Subcounty', 2164),
(1001929, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Drambu', 133, 'Maracha East County', 'Subcounty', 2165),
(1001930, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Maracha Town Council', 133, 'Maracha East County', 'Subcounty', 2166),
(1001931, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nyadri', 133, 'Maracha East County', 'Subcounty', 2167),
(1001932, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nyadri South', 133, 'Maracha East County', 'Subcounty', 2168),
(1001933, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Oleba', 133, 'Maracha East County', 'Subcounty', 2169),
(1001934, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Paranga', 133, 'Maracha East County', 'Subcounty', 2170),
(1001935, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Tara', 133, 'Maracha East County', 'Subcounty', 2171),
(1001936, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Yivu', 133, 'Maracha East County', 'Subcounty', 2172),
(1001937, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Icheme Town Council', 75, 'Oyam County North', 'Subcounty', 2174),
(1001938, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Pajule', 76, 'Aruu North County', 'Subcounty', 2175),
(1001939, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Pajule Town Council', 76, 'Aruu North County', 'Subcounty', 2176),
(1001940, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kerwa', 136, 'Aringa North County', 'Subcounty', 2177),
(1001941, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Wandi', 136, 'Aringa North County', 'Subcounty', 2178),
(1001942, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Arafa', 136, 'Aringa South County', 'Subcounty', 2179),
(1001943, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ariwa', 136, 'Aringa South County', 'Subcounty', 2180),
(1001944, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Drajini/Arajim', 136, 'Aringa South County', 'Subcounty', 2181),
(1001945, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lodonga', 136, 'Aringa South County', 'Subcounty', 2182),
(1001946, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lodonga Town Council', 136, 'Aringa South County', 'Subcounty', 2183),
(1001947, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Odravu', 136, 'Aringa South County', 'Subcounty', 2184),
(1001948, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Odravu West', 136, 'Aringa South County', 'Subcounty', 2185),
(1001949, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Abanga', 137, 'Okoro County', 'Subcounty', 2186),
(1001950, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Athuma', 137, 'Okoro County', 'Subcounty', 2187),
(1001951, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'jangokoro', 137, 'Okoro County', 'Subcounty', 2188),
(1001952, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nyapea', 137, 'Okoro County', 'Subcounty', 2189),
(1001953, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Paidha', 137, 'Okoro County', 'Subcounty', 2190),
(1001954, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Paidha Town Council', 137, 'Okoro County', 'Subcounty', 2191),
(1001955, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Zombo Twon Council', 137, 'Okoro County', 'Subcounty', 2192),
(1001956, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Akaa', 137, 'Ora County', 'Subcounty', 2193),
(1001957, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Alangi', 137, 'Ora County', 'Subcounty', 2194),
(1001958, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Atyak', 137, 'Ora County', 'Subcounty', 2195),
(1001959, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Kango', 137, 'Ora County', 'Subcounty', 2196),
(1001960, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'warr', 137, 'Ora County', 'Subcounty', 2197),
(1001961, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Zeu', 137, 'Ora County', 'Subcounty', 2198),
(1001962, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Acet Town Council', 105, 'Omoro County', 'Subcounty', 2199),
(1001963, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Akidi', 105, 'Omoro County', 'Subcounty', 2200),
(1001964, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lakwana', 105, 'Omoro County', 'Subcounty', 2201),
(1001965, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lakwaya', 105, 'Omoro County', 'Subcounty', 2202),
(1001966, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Odek', 105, 'Omoro County', 'Subcounty', 2203),
(1001967, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lalogi', 105, 'Omoro County', 'Subcounty', 2204),
(1001968, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Omoro Town Council', 105, 'Omoro County', 'Subcounty', 2205),
(1001969, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Orapwoyo', 105, 'Omoro County', 'Subcounty', 2206),
(1001970, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Abuga', 105, 'Tochi County', 'Subcounty', 2207),
(1001971, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aremo', 105, 'Tochi County', 'Subcounty', 2208),
(1001972, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Bobi', 105, 'Tochi County', 'Subcounty', 2209),
(1001973, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Labora', 105, 'Tochi County', 'Subcounty', 2210),
(1001974, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Koro', 105, 'Tochi County', 'Subcounty', 2211),
(1001975, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ongako', 105, 'Tochi County', 'Subcounty', 2212),
(1001976, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Palenga Town Council', 105, 'Tochi County', 'Subcounty', 2213),
(1001977, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Abongomola', 126, 'Kwania County', 'Subcounty', 2214),
(1001978, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aduku', 126, 'Kwania County', 'Subcounty', 2215),
(1001979, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aduku Town Council', 126, 'Kwania County', 'Subcounty', 2216),
(1001980, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Akali', 126, 'Kwania County', 'Subcounty', 2217),
(1001981, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Atongtidi', 126, 'Kwania County', 'Subcounty', 2218),
(1001982, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ayabi', 126, 'Kwania County', 'Subcounty', 2219),
(1001983, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Ayabi Town Council', 126, 'Kwania County', 'Subcounty', 2220),
(1001984, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Cawente', 126, 'Kwania County', 'Subcounty', 2221),
(1001985, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Inomo', 126, 'Kwania County', 'Subcounty', 2222),
(1001986, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Inomo Town Council', 126, 'Kwania County', 'Subcounty', 2223),
(1001987, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Nambieso', 126, 'Kwania County', 'Subcounty', 2224),
(1001988, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'iceme', 75, 'Oyam County North', 'Subcounty', 2225),
(1001989, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aleke', 75, 'Oyam County North', 'Subcounty', 2227),
(1001990, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Oceme', 75, 'Oyam County North', 'Subcounty', 2228),
(1001991, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Asaba', 75, 'Oyam County North', 'Subcounty', 2229),
(1001992, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Mateete Rural', 23, 'Mawogola South', 'Subcounty', 2230),
(1001993, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'RIVANYAMAHEMBE TOWN COUNCIL', 96, 'Kashari South County', 'Subcounty', 2233),
(1001994, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Oluku', 130, 'Iyivu', 'Subcounty', 2234),
(1001995, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'muko ward', 99, 'Ntungamo Municipality', 'Subcounty', 2235),
(1001996, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'MIRAWA', 96, 'Rugando', 'Subcounty', 2236),
(1001997, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Bileare', 130, 'Terego West County', 'Subcounty', 2237),
(1001998, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Busukuuma', 24, 'Kyadondo County East', 'Subcounty', 2238),
(1001999, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Lyantonde Rural', 14, 'Kabula County', 'Subcounty', 2239),
(1002000, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Aii-Vu', 128, 'Terego West', 'Subcounty', 2243),
(1002001, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Bileafe', 128, 'Terego West', 'Subcounty', 2245),
(1002002, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Udupi', 128, 'Terego East', 'Subcounty', 2241),
(1002003, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Acaba', 75, 'Oyam County South', 'Subcounty', 2246),
(1002004, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'Idudi town council', 114, 'Bugweri County', 'Subcounty', 2248),
(1002005, '2022-06-10 05:12:52', '2022-06-10 05:12:52', 'My Own Town', 132, 'Adjumani East County', 'Subcounty', 2250),
(1002006, NULL, NULL, 'Default district', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_11_17_194240_create_courses_table', 1),
(7, '2021_11_17_202523_create_course_categories_table', 1),
(8, '2021_11_17_213921_create_course_chapters_table', 1),
(9, '2021_11_17_215028_create_course_topics_table', 1),
(10, '2021_11_18_223927_create_traffic_records_table', 1),
(11, '2021_11_18_225343_create_participants_table', 1),
(12, '2023_01_01_173551_create_post_categories_table', 2),
(13, '2023_01_01_190344_create_news_posts_table', 3),
(14, '2023_01_01_225808_create_eevnts_table', 4),
(15, '2023_01_01_234118_create_event_bookings_table', 5),
(16, '2023_01_01_235005_create_event_tickets_table', 5),
(17, '2023_01_02_013939_create_event_speakers_table', 6),
(18, '2023_01_02_123806_create_jobs_table', 7),
(19, '2023_02_24_195813_create_associations_table', 8),
(20, '2023_02_24_202642_create_groups_table', 9),
(21, '2023_02_24_211018_create_people_table', 10),
(22, '2023_02_24_212609_create_disabilities_table', 11),
(23, '2023_02_24_222515_create_institutions_table', 12),
(24, '2023_02_24_225942_create_counselling_centres_table', 13),
(25, '2023_02_26_001531_create_jobs_table', 14),
(26, '2023_02_26_005329_create_job_applications_table', 15),
(27, '2023_02_26_005851_create_products_table', 16),
(28, '2023_02_26_012005_create_product_orders_table', 17),
(29, '2023_04_13_103959_create_crop_categories_table', 18),
(30, '2023_04_13_105848_create_crop_protocols_table', 19),
(31, '2023_04_13_120242_create_gardens_table', 20),
(32, '2023_04_13_191025_create_garden_activities_table', 21),
(33, '2023_04_15_151249_create_candidates_table', 22),
(34, '2023_04_19_114339_create_invoices_table', 23),
(35, '2023_04_19_115400_create_invoice_items_table', 24),
(36, '2023_04_22_094032_create_quotations_table', 25),
(37, '2023_04_22_100121_create_quotation_items_table', 26),
(38, '2023_04_22_104503_create_deliveries_table', 27),
(39, '2023_04_22_105223_create_delivery_items_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `offer_type` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `subcounty_id` text DEFAULT NULL,
  `district_id` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_message` text DEFAULT NULL,
  `buyer_contact` text DEFAULT NULL,
  `buyer_contact_2` text DEFAULT NULL,
  `seller_message` text DEFAULT NULL,
  `stage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `invoice_date` text DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `paid` text DEFAULT NULL,
  `balance` text DEFAULT NULL,
  `customer_address` varchar(355) DEFAULT NULL,
  `customer_contact` varchar(355) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `created_at`, `updated_at`, `customer_name`, `invoice_date`, `invoice_no`, `total`, `paid`, `balance`, `customer_address`, `customer_contact`) VALUES
(1, '2023-04-22 07:14:21', '2023-04-22 07:16:23', 'Some name', '2023-04-20 00:00:00', NULL, NULL, NULL, NULL, 'Some address', '0752101213');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_items`
--

INSERT INTO `quotation_items` (`id`, `created_at`, `updated_at`, `quotation_id`, `product_id`, `name`, `price`, `quantity`, `total`) VALUES
(1, '2023-04-22 07:14:21', '2023-04-22 07:40:14', 1, 19, NULL, NULL, 1, NULL),
(2, '2023-04-22 07:40:59', '2023-04-22 07:40:59', 1, 10, NULL, NULL, 2, NULL),
(3, '2023-04-22 07:40:59', '2023-04-22 07:40:59', 1, 6, NULL, NULL, 12, NULL),
(4, '2023-04-22 07:40:59', '2023-04-22 07:40:59', 1, 6, NULL, NULL, 6, NULL),
(5, '2023-04-22 07:40:59', '2023-04-22 07:40:59', 1, 2, NULL, NULL, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `traffic_records`
--

CREATE TABLE `traffic_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `upload_id` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `original_name` text NOT NULL,
  `uploaded_by` text NOT NULL,
  `file_link` text NOT NULL,
  `file_size` int(11) NOT NULL,
  `upload_date` varchar(25) NOT NULL,
  `folder` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`upload_id`, `file_name`, `original_name`, `uploaded_by`, `file_link`, `file_size`, `upload_date`, `folder`) VALUES
(3, '1596512509_267163.png', '2.png', '1', 'uploads/2020/08/1596512509_267163.png', 0, '1596512509', 'uploads/2020/08'),
(4, '1596512509_267163.png', '2.png', '1', 'uploads/2020/08/small/1596512509_267163.png', 0, '1596512509', 'uploads/2020/08/small/'),
(5, '1596512517_708301.png', '2.png', '1', 'uploads/2020/08/1596512517_708301.png', 0, '1596512517', 'uploads/2020/08'),
(6, '1596512517_708301.png', '2.png', '1', 'uploads/2020/08/small/1596512517_708301.png', 0, '1596512517', 'uploads/2020/08/small/'),
(7, '1596512666_559310.png', '2.png', '1', 'uploads/2020/08/1596512666_559310.png', 0, '1596512666', 'uploads/2020/08'),
(8, '1596512666_559310.png', '2.png', '1', 'uploads/2020/08/small/1596512666_559310.png', 0, '1596512666', 'uploads/2020/08/small/'),
(17, '1596609333_628109.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609333_628109.pdf', 0, '1596609333', 'uploads/2020/08'),
(18, '1596609359_347309.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609359_347309.pdf', 0, '1596609359', 'uploads/2020/08'),
(19, '1596609372_33886.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609372_33886.pdf', 0, '1596609372', 'uploads/2020/08'),
(20, '1596609447_364322.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609447_364322.pdf', 0, '1596609447', 'uploads/2020/08'),
(21, '1596609488_167234.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609488_167234.pdf', 0, '1596609488', 'uploads/2020/08'),
(22, '1596609493_986169.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609493_986169.pdf', 0, '1596609493', 'uploads/2020/08'),
(23, '1596609595_848747.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609595_848747.pdf', 0, '1596609595', 'uploads/2020/08'),
(24, '1596609618_575706.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609618_575706.pdf', 0, '1596609618', 'uploads/2020/08'),
(25, '1596609663_934694.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609663_934694.pdf', 0, '1596609663', 'uploads/2020/08'),
(26, '1596609674_922609.pdf', 'farida (1).pdf', '1', 'uploads/2020/08/1596609674_922609.pdf', 0, '1596609674', 'uploads/2020/08'),
(27, '1596610010_87496.pdf', '29- June - 2020.pdf', '1', 'uploads/2020/08/1596610010_87496.pdf', 4, '1596610010', 'uploads/2020/08'),
(28, '1596620183_892673.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620183_892673.jpg', 0, '1596620183', 'uploads/2020/08'),
(29, '1596620200_708903.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620200_708903.jpg', 0, '1596620200', 'uploads/2020/08'),
(30, '1596620305_162627.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620305_162627.jpg', 0, '1596620305', 'uploads/2020/08'),
(31, '1596620342_7144.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620342_7144.jpg', 0, '1596620342', 'uploads/2020/08'),
(32, '1596620372_839317.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620372_839317.jpg', 0, '1596620372', 'uploads/2020/08'),
(33, '1596620447_40048.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620447_40048.jpg', 0, '1596620447', 'uploads/2020/08'),
(34, '1596620541_173081.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620541_173081.jpg', 0, '1596620541', 'uploads/2020/08'),
(35, '1596620550_173606.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620550_173606.jpg', 0, '1596620550', 'uploads/2020/08'),
(36, '1596620667_783550.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620667_783550.jpg', 0, '1596620667', 'uploads/2020/08'),
(37, '1596620855_356435.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596620855_356435.jpg', 0, '1596620855', 'uploads/2020/08'),
(38, '1596631213_432132.png', 'ugnews24_rounded_logo.png', '1', 'uploads/2020/08/1596631213_432132.png', 0, '1596631213', 'uploads/2020/08'),
(39, '1596631331_162269.png', 'ugnews24_rounded_logo.png', '1', 'uploads/2020/08/1596631331_162269.png', 0, '1596631331', 'uploads/2020/08'),
(40, '1596631348_181228.png', 'ugnews24_rounded_logo.png', '1', 'uploads/2020/08/1596631348_181228.png', 0, '1596631348', 'uploads/2020/08'),
(43, '1596631819_24148.jpg', '0.jpg', '1', 'uploads/2020/08/1596631819_24148.jpg', 1, '1596631819', 'uploads/2020/08'),
(44, '1596631937_888643.jpg', 'iuiu arua.jpg', '1', 'uploads/2020/08/1596631937_888643.jpg', 0, '1596631937', 'uploads/2020/08'),
(45, '1596664452_294714.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596664452_294714.png', 0, '1596664452', 'uploads/2020/08'),
(46, '1596665834_59390.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596665834_59390.png', 0, '1596665834', 'uploads/2020/08'),
(47, '1596668616_994008.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596668616_994008.png', 0, '1596668616', 'uploads/2020/08'),
(48, '1596668789_940095.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596668789_940095.png', 0, '1596668789', 'uploads/2020/08'),
(49, '1596668834_205047.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596668834_205047.png', 0, '1596668834', 'uploads/2020/08'),
(50, '1596669062_485310.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596669062_485310.png', 0, '1596669062', 'uploads/2020/08'),
(51, '1596669111_519861.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596669111_519861.png', 0, '1596669111', 'uploads/2020/08'),
(52, '1596669258_680050.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596669258_680050.png', 0, '1596669258', 'uploads/2020/08'),
(53, '1596669294_768211.png', 'Screenshot_17.png', '1', 'uploads/2020/08/1596669294_768211.png', 0, '1596669294', 'uploads/2020/08'),
(54, '1596669482_751711.png', 'download.png', '1', 'uploads/2020/08/1596669482_751711.png', 0, '1596669482', 'uploads/2020/08'),
(55, '1596693654_302819.png', 'Screenshot_13.png', '1', 'uploads/2020/08/1596693654_302819.png', 1, '1596693654', 'uploads/2020/08'),
(56, '1596694026_508062.png', 'Screenshot_13.png', '1', 'uploads/2020/08/1596694026_508062.png', 1, '1596694026', 'uploads/2020/08'),
(57, '1596694132_457618.png', 'Screenshot_13.png', '1', 'uploads/2020/08/1596694132_457618.png', 1, '1596694132', 'uploads/2020/08'),
(58, '1599849386_482103.jpg', 'img-1.jpg', '1', 'uploads/2020/09/1599849386_482103.jpg', 0, '1599849386', 'uploads/2020/09'),
(59, '1599849917_868625.jpg', 'img-68.jpg', '1', 'uploads/2020/09/1599849917_868625.jpg', 0, '1599849917', 'uploads/2020/09'),
(60, '1599854568_149946.jpg', 'img-35.jpg', '1', 'uploads/2020/09/1599854568_149946.jpg', 0, '1599854568', 'uploads/2020/09'),
(61, '1599856366_599026.jpg', 'img-15.jpg', '1', 'uploads/2020/09/1599856366_599026.jpg', 0, '1599856366', 'uploads/2020/09'),
(62, '1599897527_976470.jpg', 'img-41.jpg', '1', 'uploads/2020/09/1599897527_976470.jpg', 0, '1599897527', 'uploads/2020/09'),
(63, '1599904161_789144.jpg', 'img-61.jpg', '1', 'uploads/2020/09/1599904161_789144.jpg', 0, '1599904161', 'uploads/2020/09'),
(64, '1599904318_669120.jpg', 'img-72.jpg', '1', 'uploads/2020/09/1599904318_669120.jpg', 0, '1599904318', 'uploads/2020/09'),
(65, '1599906793_395416.jpg', 'img-3.jpg', '1', 'uploads/2020/09/1599906793_395416.jpg', 0, '1599906793', 'uploads/2020/09'),
(66, '1600163796_972833.png', 'iuiu-islamic-university-in-uganda-logo-51073D8E61-seeklogo.com.png', '1', 'uploads/2020/09/1600163796_972833.png', 0, '1600163796', 'uploads/2020/09'),
(67, '1600163838_842003.png', 'iuiu_alumni_logo.png', '1', 'uploads/2020/09/1600163838_842003.png', 0, '1600163838', 'uploads/2020/09'),
(68, '1600163838_842003.png', 'iuiu_alumni_logo.png', '1', 'uploads/2020/09/small/1600163838_842003.png', 0, '1600163838', 'uploads/2020/09/small/'),
(69, '1600202039_917842.pdf', 'Rich Dad Poor Dad by Robert T. Kiyosaki.pdf', '1', 'uploads/2020/09/1600202039_917842.pdf', 9, '1600202039', 'uploads/2020/09'),
(70, '1600637679_388822.png', 'iuiu-islamic-university-in-uganda-logo-51073D8E61-seeklogo.com.png', '1', 'uploads/2020/09/1600637679_388822.png', 0, '1600637679', 'uploads/2020/09'),
(71, '1600641617_591390.png', 'iuiu_alumni_logo.png', '1', 'uploads/2020/09/1600641617_591390.png', 0, '1600641617', 'uploads/2020/09'),
(72, '1600649206_535251.pdf', 'Rich Dad Poor Dad by Robert T. Kiyosaki.pdf', '1', 'uploads/2020/09/1600649206_535251.pdf', 9, '1600649206', 'uploads/2020/09'),
(73, '1600649206_585129.png', 'Muhindo Mubarak - Circular Image.png', '1', 'uploads/2020/09/1600649206_585129.png', 1, '1600649206', 'uploads/2020/09'),
(74, '1600649206_585129.png', 'Muhindo Mubarak - Circular Image.png', '1', 'uploads/2020/09/small/1600649206_585129.png', 1, '1600649206', 'uploads/2020/09/small/'),
(75, '1601394811_907939.pdf', 'Invoice-24452.pdf', '1', 'uploads/2020/09/1601394811_907939.pdf', 0, '1601394811', 'uploads/2020/09'),
(76, '1601394811_78731.jpg', 'team_kassim.jpg', '1', 'uploads/2020/09/1601394811_78731.jpg', 0, '1601394811', 'uploads/2020/09'),
(77, '1601394811_78731.jpg', 'team_kassim.jpg', '1', 'uploads/2020/09/small/1601394811_78731.jpg', 0, '1601394811', 'uploads/2020/09/small/'),
(78, '1601396682_214602.png', '1.png', '1', 'uploads/2020/09/1601396682_214602.png', 0, '1601396682', 'uploads/2020/09'),
(79, '1601396818_140969.png', '1.png', '1', 'uploads/2020/09/1601396818_140969.png', 0, '1601396818', 'uploads/2020/09'),
(80, '1601485575_266078.jpeg', '38B2521F-B7A9-4F0A-88ED-14F0DD8DB59C.jpeg', '1', 'uploads/2020/09/1601485575_266078.jpeg', 0, '1601485575', 'uploads/2020/09'),
(81, '1601485575_266078.jpeg', '38B2521F-B7A9-4F0A-88ED-14F0DD8DB59C.jpeg', '1', 'uploads/2020/09/small/1601485575_266078.jpeg', 0, '1601485575', 'uploads/2020/09/small/'),
(82, '1601596140_101986.jpg', 'Vision of Horn Aid  (2) (1).jpg', '1', 'uploads/2020/10/1601596140_101986.jpg', 0, '1601596140', 'uploads/2020/10'),
(83, '1601664345_373223.jpeg', 'AD476184-10B7-4DFC-B3D8-A6710F228BF3.jpeg', '1', 'uploads/2020/10/1601664345_373223.jpeg', 0, '1601664345', 'uploads/2020/10'),
(84, '1601664345_373223.jpeg', 'AD476184-10B7-4DFC-B3D8-A6710F228BF3.jpeg', '1', 'uploads/2020/10/small/1601664345_373223.jpeg', 0, '1601664345', 'uploads/2020/10/small/'),
(87, '1601667291_140295.jpg', 'passport pic.JPG', '1', 'uploads/2020/10/1601667291_140295.jpg', 0, '1601667291', 'uploads/2020/10'),
(88, '1601667291_140295.jpg', 'passport pic.JPG', '1', 'uploads/2020/10/small/1601667291_140295.jpg', 0, '1601667291', 'uploads/2020/10/small/'),
(89, '1601807673_470670.jpg', 'Dr. Mwebesa Umar.jpg', '1', 'uploads/2020/10/1601807673_470670.jpg', 1, '1601807673', 'uploads/2020/10'),
(90, '1601807673_470670.jpg', 'Dr. Mwebesa Umar.jpg', '1', 'uploads/2020/10/small/1601807673_470670.jpg', 1, '1601807673', 'uploads/2020/10/small/'),
(91, '1604110620_438209.png', 'IUIU ALUMNI BADGE-1.png', '1', 'uploads/2020/10/1604110620_438209.png', 0, '1604110620', 'uploads/2020/10'),
(92, '1641586419_811440.jpg', '1641585837029..jpg', '1', 'uploads/2022/01/1641586419_811440.jpg', 2, '1641586419', 'uploads/2022/01'),
(93, '1641586419_811440.jpg', '1641585837029..jpg', '1', 'uploads/2022/01/small/1641586419_811440.jpg', 2, '1641586419', 'uploads/2022/01/small/');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `reg_date` varchar(45) DEFAULT NULL,
  `last_seen` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `approved` tinyint(4) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `sex` varchar(25) DEFAULT NULL,
  `reg_number` varchar(50) NOT NULL,
  `country` varchar(35) NOT NULL,
  `occupation` varchar(225) NOT NULL,
  `profile_photo_large` text NOT NULL,
  `phone_number` varchar(35) NOT NULL,
  `location_lat` varchar(45) NOT NULL,
  `location_long` varchar(45) NOT NULL,
  `facebook` varchar(500) NOT NULL,
  `twitter` varchar(500) NOT NULL,
  `whatsapp` varchar(45) DEFAULT NULL,
  `linkedin` varchar(500) NOT NULL,
  `website` varchar(500) NOT NULL,
  `other_link` varchar(500) NOT NULL,
  `cv` varchar(500) NOT NULL,
  `language` varchar(50) NOT NULL,
  `about` varchar(600) NOT NULL,
  `address` varchar(325) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `name` varchar(355) DEFAULT NULL,
  `campus_id` bigint(20) NOT NULL DEFAULT 1,
  `complete_profile` tinyint(4) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `dob` timestamp NULL DEFAULT NULL,
  `intro` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `reg_date`, `last_seen`, `email`, `approved`, `profile_photo`, `user_type`, `sex`, `reg_number`, `country`, `occupation`, `profile_photo_large`, `phone_number`, `location_lat`, `location_long`, `facebook`, `twitter`, `whatsapp`, `linkedin`, `website`, `other_link`, `cv`, `language`, `about`, `address`, `created_at`, `updated_at`, `remember_token`, `avatar`, `name`, `campus_id`, `complete_profile`, `title`, `dob`, `intro`) VALUES
(1, 'mubs0x@gmail.com', '$2y$10$7y2ePx9gYeN.eeT2h./MEOJmtwgQbAohz4NZgh47hIMESbIOMXAku', 'Sumayya', 'Swaib', '1596135415', '1672508491', 'mubs0x@gmail.com', 1, 'uploads/2020/09/small/1600649206_585129.png', 'admin', 'Female', '160040009', 'Uganda', 'Computer Science &amp; Engineering student at Islamic university of technology', 'uploads/2020/09/1600649206_585129.png', '+880 6322 57609', '', '', 'https://facebook.com/ugnews24', 'https://twitter.com/ugnews24', '+256 7832 04665', 'https://youtube.com/ugnews24', 'https://ugnews24.info', '', 'files/Chairman\'s welcome rev. 1.pdf', 'English', '<p>Muhindo Mubarak is currently a commuter <strong>science</strong> and engineering <strong>student </strong>at Islamic universe of Technology - Daka</p>', 'Bwera, Kasese, Uganda', '2020-07-30 15:56:55', '2023-04-19 11:28:18', 'MyrLDzCiTkGovxFxAe5GGAQm6HLJDbYfzUXHgaW71tC2JJEKF5Ym3nOhTwGI', 'images/Angie.JPG', 'Sumayya Swaib', 1, 1, 'Mr', '1994-04-16 21:00:00', 'a'),
(12, 'walusansa@gmail.com', '$2y$10$ouzfOWY6dFDUQenu9IDzDOz.rmPmpDk7haVFqp3SsFJErgXjkielO', 'Yahaya', NULL, '1600019849', '1628537316', 'walusansa@gmail.com', 1, '', 'regular', '', '96/115', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-09-13 14:57:29', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Yahaya', 1, NULL, NULL, NULL, NULL),
(21, 'omulongo2@gmail.com', '$2y$10$7JymTHkjwOqET1S3PlTlGuoAUqTcBuBC4/Ijj0hQPIn2tiMegQCh.', 'Mousa Ali', 'Senkubuge', '1601485078', '1627052612', 'omulongo2@gmail.com', 1, 'uploads/2020/09/small/1601485575_266078.jpeg', 'admin', 'Male', '93/76', 'Uganda', 'Teacher', 'uploads/2020/09/1601485575_266078.jpeg', '', '', '', '', '', '', '', '', '', '', '', 'Mousa Senkubuge (BA Educ Literature/ELS) 1993-96, Secretary Genneral Students&rsquo; Guild. Currently in London, working with the Alumni Association as Interim Executive Secretary \r\n', 'London, UK', '2020-09-30 13:57:58', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Mousa Ali Senkubuge', 1, NULL, NULL, NULL, NULL),
(22, 'faizahnoordinfizzy@gmail.com', '$2y$10$h2iiZB9wEp2P4ZAaiUNfB.FqeAruYuFqHrvsq05unmWtLWHkG5CWG', 'Faizah Noordin', 'Ayikoru', '1601492404', '1602063241', 'faizahnoordinfizzy@gmail.com', 1, 'uploads/2020/10/small/1601664345_373223.jpeg', 'regular', 'Female', '116-033021-14446', 'Uganda', 'Assistant lecturer, project coordinator ', 'uploads/2020/10/1601664345_373223.jpeg', '', '', '', '', '', '', '', '', '', '', 'English', 'Faizah Noordin Ayikoru is a former Guild president of IUIU(females campus) 2018-2019.She graduated in 2019 with a First class degree hence winning the Alumni award as the second best student overall. She is a young and motivated lady with ambitious goals. Her most outstanding value is kindness and caring for others. She wishes that everyone could be nice to the other, spread love, laugh together and ofcourse make money together. May Allah bless the work of our hands. ', 'Kisaasi', '2020-09-30 16:00:04', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Faizah Noordin Ayikoru', 1, NULL, NULL, NULL, NULL),
(23, 'aishanur05@googlemail.com', '$2y$10$l5mXpccmZAk336JvSYdrA.etAAgBmS2OoJDoEPfbgyjaI9.gLQKwW', 'Aisha', 'Nambooze', '1601495803', '1603273630', 'aishanur05@googlemail.com', 1, '', 'regular', '', '93/142', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-09-30 16:56:43', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Aisha Nambooze', 1, NULL, NULL, NULL, NULL),
(24, 'shukuruchebukwa@gmail.com', '$2y$10$5vzO875AgMcwQYBgVo9ZRurYaosngnK5N9BdXKVQtAXRNDWP/VlHS', 'Shukuru', 'Chebukwa', '1601503416', '1612862260', 'shukuruchebukwa@gmail.com', 1, '', 'regular', '', '115-033141-13013', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-09-30 19:03:36', '2023-02-26 21:14:16', NULL, 'images/u-5.png', 'Shukuru Chebukwa', 1, NULL, NULL, NULL, NULL),
(25, 'kayiira2003@yahoo.co.uk', '$2y$10$JN4.Q/dlkxcDWZJ/xUx4f.IEv6PwpStuqcOUHfJGg/uu0h.me3.AC', 'Rashid', 'kayiira', '1601581336', '1602788407', 'kayiira2003@yahoo.co.uk', 1, '', 'regular', '', 'BM/99/282', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-01 16:42:16', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Rashid kayiira', 1, NULL, NULL, NULL, NULL),
(26, 'hjtmariambintu@gmail.com', '$2y$10$uES7f3rX4/EV2dY.8jEbKOqlCyNoaGffXEJHO3A8HFutDbC6u0Kwq', 'muwanga', 'mariam', '1601581718', '1601806084', 'hjtmariambintu@gmail.com', 1, '', 'regular', 'Female', '92/24', 'Uganda', 'Am a teacher', '', '0772554960', '', '', '', '', '', '', '', '', '', 'English', 'Am Muwanga Mariam completed BA/ED and MED at IUIU.Working at Bwikya MSSS as a Deputy Headteacher. Married with children. I like reading and Sharing with friends. Am self motivated and hard working woman.\r\n', 'Hoima District', '2020-10-01 16:48:38', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'muwanga mariam', 1, NULL, NULL, NULL, NULL),
(29, 'asekindi06@gmail.com', '$2y$10$okLLlptVs7.CXbHinapb3.jc7vrT9HMh.Fwi8AQVbe/utOVKA.2G2', 'Abdunur M', 'Sekindi', '1601654626', '1616921567', 'asekindi06@gmail.com', 1, 'uploads/2020/10/small/1601667291_140295.jpg', 'regular', 'Male', '93/41', 'Uganda', 'Foreign Service Officer (FSO) ', 'uploads/2020/10/1601667291_140295.jpg', '966553125385', '', '', '', '', '', '', '', '', '', 'English', 'Abdunur M Sekindi is a Ugandan Diplomat currently serving at the General Secretariat of the Organisation of Islamic Cooperation (OIC) in Jeddah, Kingdom of Saudi Arabia. ', 'P. O. Box 178 Jeddah 21411 Kingdom of Saudi Arabia ', '2020-10-02 13:03:46', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Abdunur M Sekindi', 1, NULL, NULL, NULL, NULL),
(31, 'ntwaha94@gmail.com', '$2y$10$4DdU7VQg2vwDiapWRPEyrOWuvRSwLPiK7.ip0K0GaUhC76toWvC/K', 'Nabirere', 'Twaha', '1601754206', '1641586451', 'ntwaha94@gmail.com', 1, '', 'regular', '', '97/FAS/149', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-03 16:43:26', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Nabirere Twaha', 1, NULL, NULL, NULL, NULL),
(32, 'mwebesaumar@gmail.com', '$2y$10$ye3UflG112oYkfhfYQeHfOVwbPB2Dhtoows4gcf4X7rs3vO4otaJm', 'Dr. Mwebesa', 'Umar', '1601801228', '1637416584', 'mwebesaumar@gmail.com', 1, 'uploads/2020/10/small/1601807673_470670.jpg', 'admin', 'Male', '87/26', 'Uganda', 'Currently, I work as Registrar of the Islamic University of Technology (IUT), Board Bazar, Gazipur-1704, Dhaka Bangladesh. ', 'uploads/2020/10/1601807673_470670.jpg', '8801833339000', '', '', 'https://www.facebook.com/mwebesa.umar.5', 'https://twitter.com/dr_mwebesa', '', '', 'http://www.iutoic-dhaka.edu/registrar_office', '', '', 'English', 'Dr. Mwebesa Umar. I am the Vice Chairman, IUIU-AA Interim Committee [Taskforce Team]. I am the 3rd Pioneer Guild President [1990-91]. Our enrolment date was 10.02.1988. Am married with one wife and four children; with a PhD in Education [Curriculum and Instruction] from the International Islamic University Malaysia (IIUM); 2010-2014. \r\n\r\n', 'Islamic University of Technology (IUT), Board Bazar, Gazipur-1704, Dhaka Bangladesh', '2020-10-04 05:47:08', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Dr. Mwebesa Umar', 1, NULL, NULL, NULL, NULL),
(33, 'nazziwaaisha948@gmail.com', '$2y$10$TaJNztR1EWxkrkygSMokGOvazLD9EhvdMHBS7nei622GBwgF4A/tW', 'Aisha', 'Nazziwa', '1601829427', '1601937327', 'nazziwaaisha948@gmail.com', 1, '', 'regular', '', 'IU509', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-04 13:37:07', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Aisha Nazziwa', 1, NULL, NULL, NULL, NULL),
(34, 'abdirahmanka1@gmail.com', '$2y$10$uFEfLiuGBVKn6h5F8uEFqeoGUxtwu3wtNm6xr29YnFTMcJdPhhXtO', 'Abdirahman', 'Mohamed', '1601837706', '1642564338', 'abdirahmanka1@gmail.com', 1, '', 'regular', '', '116-013021-14458', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-04 15:55:06', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Abdirahman Mohamed', 1, NULL, NULL, NULL, NULL),
(35, 'sulemanwaziri@gmail.com', '$2y$10$UFeiuUyYEUWF7jaW5AOC/OV4w5llS81c9Em5aggAVmTZWOtXQYHfG', 'Suleiman Umar', 'Waziri', '1601845901', '1601877255', 'sulemanwaziri@gmail.com', 0, '', 'regular', '', '5054', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-04 18:11:41', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Suleiman Umar Waziri', 1, NULL, NULL, NULL, NULL),
(36, 'kasumbaamiiru@gmail.com', '$2y$10$VOonpRndHXe67tTWfxyFm.Xl9eYwx8bSthp6abp0yOsKK8odzCzpG', 'Kasumba', 'Amiiru Ibrahim', '1601875982', '1602101905', 'kasumbaamiiru@gmail.com', 1, '', 'regular', '', '116-043011-15217', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 02:33:02', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Kasumba Amiiru Ibrahim', 1, NULL, NULL, NULL, NULL),
(37, 'stevogeral@gmail.com', '$2y$10$sbMG2UYphjFoYWKKo3c36eVCgnDR7o9SVsFo9Azj31iSveinLEzCq', 'WASUKIRA', 'GERALD', '1601899651', '1601899938', 'stevogeral@gmail.com', 1, '', 'regular', '', '110-033021-03952', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 09:07:31', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'WASUKIRA GERALD', 1, NULL, NULL, NULL, NULL),
(38, 'imranaahmad1990@yahoo.com', '$2y$10$TWDvcBCICmNgilNDzsob4OLRpi3NbPCYCSqLUgJpknb/wdNBEa2fC', 'Imrana', 'Ahmad', '1601903613', '1601903666', 'imranaahmad1990@yahoo.com', 1, '', 'regular', '', '115-033071-12828', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 10:13:33', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Imrana Ahmad', 1, NULL, NULL, NULL, NULL),
(39, 'Iliyasibrahimiliyas@gmail.com', '$2y$10$zKaB2dhELElWMteP9p.VS.M7NoPIz/VYgh07qvK6Dwq95./.fiaPS', 'Iliyas', 'Ibrahim', '1601904634', '1601925053', 'Iliyasibrahimiliyas@gmail.com', 1, '', 'regular', '', '113-063061-09486', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 10:30:34', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Iliyas Ibrahim', 1, NULL, NULL, NULL, NULL),
(40, 'Bilalmusak@gmail.com', '$2y$10$yDcelKcvLyprg/rrNxL/1eW7Pb8yoQaPS2kEcRYmXc2g9enhj.b.W', 'Bilal', 'Musa', '1601906775', '1601906795', 'Bilalmusak@gmail.com', 1, '', 'regular', '', '113-063111-10118', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 11:06:15', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'Bilal Musa', 1, NULL, NULL, NULL, NULL),
(41, 'nshalidu@gmail.com', '$2y$10$xdqv2.lQTsUp7NPkd9CDA.GCgYJ8sS0gnoWEW80eB.cORuAFlzgJC', 'Nasir', 'Salisu Halidu', '1601909056', '1601974361', 'nshalidu@gmail.com', 0, '', 'regular', '', '113-063061-09928', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 11:44:16', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Nasir Salisu Halidu', 1, NULL, NULL, NULL, NULL),
(42, 'abusadiq303@gmail.com', '$2y$10$lB0BH74xaJWJYEzTFmDhJOeREUZC73Hgjr1xEPgtdsXU8MqhyqJAO', 'Abubakar', 'Sadiq', '1601911724', '1601911755', 'abusadiq303@gmail.com', 0, '', 'regular', '', '115-063111-13893', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-05 12:28:44', '2023-02-26 21:14:16', NULL, 'images/u-5.png', 'Abubakar Sadiq', 1, NULL, NULL, NULL, NULL),
(43, 'Mukhtarbarade@gmail.com', '$2y$10$yej.Bembh8b.zNiO0sM8Ye3ROVMnG1VNxRGlITTgvzWQugqgkPzLa', 'Mukhtar', 'Danbarade', '1602148958', '1602149573', 'Mukhtarbarade@gmail.com', 0, '', 'regular', '', '11404501111303', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 06:22:38', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'Mukhtar Danbarade', 1, NULL, NULL, NULL, NULL),
(44, 'usmanlemah1554@gmail.com', '$2y$10$g70Uf9bSqLIYVShdV4xaPOL4aiYYsr.n8l9GaFKWQNsJ0etmKbgp6', 'Usman', 'Mohammed', '1602149278', '1602189292', 'usmanlemah1554@gmail.com', 0, '', 'regular', '', '114-045011-10441', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 06:27:58', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Usman Mohammed', 1, NULL, NULL, NULL, NULL),
(45, 'aliyudange@gmail.com', '$2y$10$PzTpB2wSXGC35oRX556vEeAtHLRnOy.1Hr2g90wWmHwnf.KxFwFxu', 'Aliyu', 'Dange', '1602149546', '1602149605', 'aliyudange@gmail.com', 0, '', 'regular', '', '114-045011-10545', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 06:32:26', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'Aliyu Dange', 1, NULL, NULL, NULL, NULL),
(46, 'ishaqshuni@gmail.com', '$2y$10$AurD8PRL1S5tdw4gMRCruOWzkxtQIJtKg/QEzb/nwQMwS1qzicr7y', 'Ishaq', 'Muhammad', '1602150356', '1602153819', 'ishaqshuni@gmail.com', 0, '', 'regular', '', '11404501110443', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 06:45:56', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Ishaq Muhammad', 1, NULL, NULL, NULL, NULL),
(47, 'mansurharuna7@gmail.com', '$2y$10$4IRmk.60B1sPg1wOP094ReH38MiS.CfZBw9AANiz33D23YT/twxTC', 'Mansur', 'Haruna', '1602150644', '1602166069', 'mansurharuna7@gmail.com', 0, '', 'regular', '', '114-065181-10392', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 06:50:44', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Mansur Haruna', 1, NULL, NULL, NULL, NULL),
(48, 'lukwagorajab@gmail.com', '$2y$10$01TaFydQBLpVuiZH4p9KzOd4THtgKFGz/2a8HRBF43hjg89gl8lAy', 'Rajab', 'Lukwago', '1602155754', '1602155755', 'lukwagorajab@gmail.com', 0, '', 'regular', '', '208-055011-01085', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 08:15:54', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Rajab Lukwago', 1, NULL, NULL, NULL, NULL),
(49, 'abubakarsahabi4@gmail.com', '$2y$10$TQ02nvIg.ipRtbmVUmvBSeBYoDHMusEC9nAquQdJ6jlEw6gtMGvbq', 'Abubakar', 'Sahabi', '1602159661', '1602159781', 'abubakarsahabi4@gmail.com', 0, '', 'regular', '', '114-045011-10844', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 09:21:01', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Abubakar Sahabi', 1, NULL, NULL, NULL, NULL),
(50, 'Sbkaroga@gmail.com', '$2y$10$ejjAoaCeGUwsAaOzi2QgzedULwxteeM8FszM4cDSZ/uo.21kRSCAS', 'Sani', 'Bello karoga', '1602168271', '1602759881', 'Sbkaroga@gmail.com', 0, '', 'regular', '', '11404501110420', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 11:44:31', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Sani Bello karoga', 1, NULL, NULL, NULL, NULL),
(51, 'mohammedumardogondaji@gmail.com', '$2y$10$DpuK6/fBrqY8yxzon3/kQO/IYwcA9g/EGcv2JRaho5U2uc0ktnj7O', 'Mohammed', 'Umar Dogondaji', '1602172212', '1602172393', 'mohammedumardogondaji@gmail.com', 0, '', 'regular', '', '114-045011-10465', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 12:50:12', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'Mohammed Umar Dogondaji', 1, NULL, NULL, NULL, NULL),
(52, 'nafiuumar127@gmail.com', '$2y$10$/UQhg2cSPbcQF29XFlG.Suxgzw/IA3MO.TDIA2/YpQ4PYJkKTOqPW', 'Nafiu', 'Umar', '1602192182', '1602676124', 'nafiuumar127@gmail.com', 0, '', 'regular', '', '114-063111-12178', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-08 18:23:02', '2023-02-26 21:14:16', NULL, 'images/u-2.png', 'Nafiu Umar', 1, NULL, NULL, NULL, NULL),
(53, 'abubakarjjabo@gmail.com', '$2y$10$tJvmZCMp8o0R5x2vIF2hZ.gmCu3BA1nzYQ6vl.973zu.NMiKUL5/e', 'Abubakar', 'Junaidu Jabo', '1602251597', '1602520178', 'abubakarjjabo@gmail.com', 0, '', 'regular', '', '114-045011-10571', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-09 10:53:17', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Abubakar Junaidu Jabo', 1, NULL, NULL, NULL, NULL),
(54, 'faridilwasa@gmail.com', '$2y$10$JSYJEgoqQObFJ2jic/nN4.vAEH/Yi77mOULVMask7WR2UnGHVaVEW', 'Faridi', 'Lwasa', '1602325381', '1602786491', 'faridilwasa@gmail.com', 0, '', 'regular', '', '111/043011/196', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-10 07:23:01', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Faridi Lwasa', 1, NULL, NULL, NULL, NULL),
(55, 'ibrabu99@gmail.com', '$2y$10$8cTRaoeSMll0y2hqEbhm/eelQnad.kBwoRWgcq2Ipf/PmvDh.ahAu', 'Abubaker', 'Ibrahim', '1602824163', '1602824164', 'ibrabu99@gmail.com', 0, '', 'regular', '', '114-053011-10701', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-16 01:56:03', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Abubaker Ibrahim', 1, NULL, NULL, NULL, NULL),
(56, 'nimulola@gmail.com', '$2y$10$uCgqIfZW10sr9Dhx1C16OuaxRCltTxUgFjWQHH5.AF1.gkLy/Jr7a', 'Maimuna', 'Nimulola', '1602846087', '1603261551', 'nimulola@gmail.com', 1, '', 'regular', 'Female', '88/30', 'Uganda', 'Senior Lecturer - Faculty of Education, Department of Educational Psychology; and Director Research, Publications and Innovation at Islamic University in Uganda', '', '256393512100', '', '', '', '', '', '', 'https://www.iuiu.ac.ug', '', '', 'English', 'I am a pioneer student IUIU', 'Islamic University in Uganda ', '2020-10-16 08:01:27', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Maimuna Nimulola', 1, NULL, NULL, NULL, NULL),
(57, 'halimkas@gmail.com', '$2y$10$Qvqmtfyor.NyJLvQGGML9.hz.VcVqMIpw6avAz8x7CguQV92Uf6zO', 'Chongomweru', 'Halimu', '1603437222', '1603437587', 'halimkas@gmail.com', 1, '', 'regular', '', '04/BIT/KC/011', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-23 04:13:42', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Chongomweru Halimu', 1, NULL, NULL, NULL, NULL),
(58, 'bwayopeter@gmail.com', '$2y$10$0.2CO3.IgLMlv4SNLOPzpON0hPbiam1QNXldf3l.bsVi3gla1B.yS', 'Bwayo', 'Peter', '1603460389', '1603460445', 'bwayopeter@gmail.com', 0, '', 'regular', '', '113-023032-08798', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-23 10:39:49', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Bwayo Peter', 1, NULL, NULL, NULL, NULL),
(59, 'rasnassa@gmail.com', '$2y$10$Z9ZMZeMV342oruLPpkccrO8.Z7yVzK/I11Nti9ULGpO4WgJPnW8.W', 'KAKEEMBO', 'NASIIFU', '1603468645', '1603468728', 'rasnassa@gmail.com', 0, '', 'regular', '', '05/FEA/839', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-23 12:57:25', '2023-02-26 21:14:16', NULL, 'images/u-2.png', 'KAKEEMBO NASIIFU', 1, NULL, NULL, NULL, NULL),
(60, 'akakaire@gmail.com', '$2y$10$9Qms6XXhIF9hqdFUutA.je12/6/c0aGHkSMBaZ1beAOKI1ApK63Dy', 'Kakaire Ayub', 'Kirunda', '1603484801', '1603485207', 'akakaire@gmail.com', 1, '', 'regular', '', '98/FAM/103', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-23 17:26:41', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'Kakaire Ayub Kirunda', 1, NULL, NULL, NULL, NULL),
(61, 'yumarabdullahi@gmail.com', '$2y$10$GfrJNX7aYTAxos34sxe3JelpefNfKsRZjNW962HSGlo6oHI6cpLce', 'Yusuf', 'Umar Abdullahi', '1603556659', '1603556731', 'yumarabdullahi@gmail.com', 0, '', 'regular', '', '114-045011-10559', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-24 13:24:19', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Yusuf Umar Abdullahi', 1, NULL, NULL, NULL, NULL),
(62, 'dembosaddam@gmail.com', '$2y$10$rvr3Jw7C8wDw3SNnx015/OJIoVpxLZMMl5VapEcQfZewWLVija1qS', 'Dembo', 'Saddam', '1603564455', '1603564571', 'dembosaddam@gmail.com', 0, '', 'regular', '', '114-043011-11831', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-24 15:34:15', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'Dembo Saddam', 1, NULL, NULL, NULL, NULL),
(63, 'ibralwembawo@gmail.com', '$2y$10$g5QyInw0iD4f0FEBXmmDuO7kyZ2Pyac2TWFCAVxvgc3B0l0qLGx3.', 'Lwembawo', 'Ibrahim', '1603737071', '1603737162', 'ibralwembawo@gmail.com', 0, '', 'regular', '', '115-063012-12918', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-26 15:31:11', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Lwembawo Ibrahim', 1, NULL, NULL, NULL, NULL),
(64, 'ugnewz24@gmail.com', '$2y$10$kCFg7gTKE22aEOvkDz92Ouv6F8AG9gswQNMXCrfLp9PEiLOFTu0M6', 'Bwambale', 'Muhidin', '1604112889', '1621582650', 'ugnewz24@gmail.com', 0, '', 'regular', '', '150029000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-30 23:54:49', '2023-02-26 21:14:16', NULL, 'images/u-2.png', 'Bwambale Muhidin', 1, NULL, NULL, NULL, NULL),
(65, 'karimasagazi@gmail.com', '$2y$10$Z838KahBmsQmX5z12WABnO132kNTD.bvCojhHb8yfLLlIujrCm3L6', 'Ssegawa', 'Abdulkarim', '1604125782', '1604125784', 'karimasagazi@gmail.com', 0, '', 'regular', '', '216-063011-08615', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-31 03:29:42', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'Ssegawa Abdulkarim', 1, NULL, NULL, NULL, NULL),
(66, 'habiibmusa@gmail.com', '$2y$10$1ji7b95gyujtbNajVJEdwuerzDM0VQrbqPCaHYb1uWKad5ulSRGBy', 'Ssemakula', 'Habiib Musa', '1604128885', '1642610091', 'habiibmusa@gmail.com', 0, '', 'regular', '', '97/FAM/44', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-31 04:21:25', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Ssemakula Habiib Musa', 1, NULL, NULL, NULL, NULL),
(67, 'abdjourn@gmail.com', '$2y$10$fYEeldnceg.w46nOgNTWnumE86D5p8Eng9K7X4GxkqAIBfgJ9psKy', 'Kinobe', 'Abdussalaam Ali', '1604137491', '1604137636', 'abdjourn@gmail.com', 0, '', 'regular', '', '05/FAM/049', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-31 06:44:51', '2023-02-26 21:14:16', NULL, 'images/u-5.png', 'Kinobe Abdussalaam Ali', 1, NULL, NULL, NULL, NULL),
(68, 'Dericnamakajo@gmail.com', '$2y$10$5b7I6SASBpaYrGcbDK2wde6j3mWJoLS2yIJ2NyWiXKx8dQMM6axVW', 'Namakajo', 'Deric', '1604141235', '1604141237', 'Dericnamakajo@gmail.com', 0, '', 'regular', '', '215-053012-07356', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-10-31 07:47:15', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Namakajo Deric', 1, NULL, NULL, NULL, NULL),
(69, 'balunywabaker@yahoo.com', '$2y$10$mGiIGfK968CaPHwxj3uyTuk7xNv/8/RxedcmBjMA8JiMEPlHwTj1O', 'Baker', 'Balunywa Nantawuna', '1604996032', '1604996876', 'balunywabaker@yahoo.com', 1, '', 'regular', '', '87/63', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-10 05:13:52', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Baker Balunywa Nantawuna', 1, NULL, NULL, NULL, NULL),
(70, 'kmarzwyze@gmail.com', '$2y$10$YawX.hfLAv5zIy1V.omwhumtp1vJh3ajaZC2lyDpXG5u26CMAcBsa', 'Kayinja', 'Mutwalibi', '1605337056', '1605337606', 'kmarzwyze@gmail.com', 0, '', 'regular', '', '115-043011-12734', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-14 03:57:36', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Kayinja Mutwalibi', 1, NULL, NULL, NULL, NULL),
(71, 'nmpira@yahoo.com', '$2y$10$Z5ILClQxcivTdtfEZRgRS.XdcnXMzdph21Vl77qVD7cLucfvYI5yS', 'Naima', 'Mpiira Kayira', '1605981249', '1605981781', 'nmpira@yahoo.com', 1, '', 'regular', '', '95/089', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-21 14:54:09', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Naima Mpiira Kayira', 1, NULL, NULL, NULL, NULL),
(72, 'kayira2000@yahoo.fr', '$2y$10$eKKNSfFjJUxit/F6VzttVuFHB6zjSd6rxMT4kTKFFQ5oMOjh1VdMq', 'Kassim', 'Kayiira Ibrahim', '1605982139', '1605982140', 'kayira2000@yahoo.fr', 1, '', 'regular', '', '93/SS/24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-21 15:08:59', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Kassim Kayiira Ibrahim', 1, NULL, NULL, NULL, NULL),
(73, 'zouffedd@gmail.com', '$2y$10$HHSw3OjSpABG7nhYEuzuBekaC9BsP7GfMh5WbQtA2Ef0mvJQqb38.', 'Yousoff', 'Abdul Qader edd', '1606226552', '1608784991', 'zouffedd@gmail.com', 0, '', 'regular', '', '115-063012-13739', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-24 11:02:32', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Yousoff Abdul Qader edd', 1, NULL, NULL, NULL, NULL),
(74, 'masturahnannono@gmail.com', '$2y$10$sEtDX2Sb0kAC7ouXUPMPOusxJlT.7tKfQxK7CrTBezTJjeqDiYURC', 'Masturah', 'Nannono', '1606556380', '1606556468', 'masturahnannono@gmail.com', 1, '', 'regular', '', '92/96', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-11-28 06:39:40', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Masturah Nannono', 1, NULL, NULL, NULL, NULL),
(81, 'Kayizziahmed72@gmail.com', '$2y$10$DuermTcfRRiXgExBW9MBJObSbBPJQD1Drxkwy2tTzqTKJRpZRPq1O', 'kayizzi', 'ahmed', '1608460117', '1608460241', 'Kayizziahmed72@gmail.com', 0, '', 'regular', '', '93/148', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-12-20 07:28:37', '2023-02-26 21:14:16', NULL, 'images/u-5.png', 'kayizzi ahmed', 1, NULL, NULL, NULL, NULL),
(82, 'jamilusaid@gmail.com', '$2y$10$vPw7wo8gjwf6OvNTY1MfNu.gDH7ftFt5QOfPE3PPSG5x9zqUimQJW', 'Jamilu', 'Hilal Said', '1609564356', '1620636442', 'jamilusaid@gmail.com', 1, '', 'regular', '', '210-033142-02992', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-01-02 02:12:36', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Jamilu Hilal Said', 1, NULL, NULL, NULL, NULL),
(83, 'jmsewanyana@gmail.com', '$2y$10$DUxhk9gwCURU4S2sgbtiE.scRQkcaLp0mLgZt0cKOLAnbEYcuXOx2', 'Jamil', 'Sewanyana', '1615218185', '1615218186', 'jmsewanyana@gmail.com', 1, '', 'regular', '', '90/67', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-03-08 12:43:05', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Jamil Sewanyana', 1, NULL, NULL, NULL, NULL),
(84, 'husseinghana@yahoo.com', '$2y$10$mfHT.cci2FdpYHqCs2nea.iJElabaFAfK8NIm4qUE0CWOQ0zFHWi.', 'Abdul Hussein', 'Ishaq', '1615309673', '1615310375', 'husseinghana@yahoo.com', 1, '', 'regular', '', '90/101', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-03-09 14:07:53', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'Abdul Hussein Ishaq', 1, NULL, NULL, NULL, NULL),
(85, 'kateregga69@gmail.com', '$2y$10$.ZXgYf78m9o4qCTVyC69Weqa3QY90Qb2opKzVwNT4co1Ye//nR6QG', 'Kateregga', 'Mahmood', '1615399070', '1615399152', 'kateregga69@gmail.com', 0, '', 'regular', '', '91/28', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-03-10 14:57:50', '2023-02-26 21:14:16', NULL, 'images/u-7.png', 'Kateregga Mahmood', 1, NULL, NULL, NULL, NULL),
(86, 'kadnan555@gmail.com', '$2y$10$dRiqU.rzJN3nOCCM5MO/PO.0orS82n26M7el1bFG93BmqgoHexsqG', 'Adnan', 'Kawooya', '1615885374', '1615885375', 'kadnan555@gmail.com', 0, '', 'regular', '', '97/FEA/010', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-03-16 06:02:54', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Adnan Kawooya', 1, NULL, NULL, NULL, NULL),
(87, 'mariamkiiza508@gmail.com', '$2y$10$8jpwFzOr/kfFHUWe6EzfneT3D8y/0tupEll3itxhmlXkwWgNleg/i', 'Kiiza', 'Violet Maryam', '1619155276', '1619155463', 'mariamkiiza508@gmail.com', 0, '', 'regular', '', '118-082131-17727', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-23 02:21:16', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Kiiza Violet Maryam', 1, NULL, NULL, NULL, NULL),
(88, 'aliconauf@gmail.com', '$2y$10$Gea4KTloBEu7nhZtmi7jxeYlvouFp5uPhFZZF4AWCnbCEAHcPEfwC', 'Tumwebaze', 'Alicon Auf', '1619175125', '1619175203', 'aliconauf@gmail.com', 0, '', 'regular', '', '03/FEA/035', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-23 07:52:05', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Tumwebaze Alicon Auf', 1, NULL, NULL, NULL, NULL),
(89, 'dafhas@gmail.com', '$2y$10$khfjo6NKXDSOHN.kAimIz.OE2/DZbL.5qSeqqs0/u45NbWboGUMyu', 'Dafala', 'Ibrahim', '1619175186', '1619242330', 'dafhas@gmail.com', 0, '', 'regular', '', '04/Sea/153', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-23 07:53:06', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Dafala Ibrahim', 1, NULL, NULL, NULL, NULL),
(90, 'lusibab@gmail.com', '$2y$10$McsxXmEak7eSU6sg0LYVEOQPh7nR/k/vLpD4NZ40B8e3UvqZfS.cC', 'LUSIBA', 'Badru', '1625943428', '1625943812', 'lusibab@gmail.com', 0, '', 'regular', '', 'Bsc001', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-07-10 15:57:08', '2023-02-26 21:14:16', NULL, 'images/u-2.png', 'LUSIBA Badru', 1, NULL, NULL, NULL, NULL),
(91, 'yakoubmasereka@gmail.com', '$2y$10$NYwbWjGA7MgJnR7lNtJx5OotSaFsJjiFp5gJipu/g/DSW5OkC0VTy', 'Masereka', 'Yakoub Ismail', '1626604261', '1626604339', 'yakoubmasereka@gmail.com', 0, '', 'regular', '', '05/FEA/949', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-07-18 07:31:01', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Masereka Yakoub Ismail', 1, NULL, NULL, NULL, NULL),
(92, 'hnurudeen@gmail.com', '$2y$10$.fszma8fTzN/MHRRzZ4tceos/7SHcl0tf8fabf0SdKZ3waN9ZmqUy', 'Nurudeen', 'Hamidu', '1626624497', '1626624498', 'hnurudeen@gmail.com', 0, '', 'regular', '', '93/150', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-07-18 13:08:17', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Nurudeen Hamidu', 1, NULL, NULL, NULL, NULL),
(93, 'lwangyus@gmail.com', '$2y$10$S7sc9A071yGG4wr3Xz13d.S/FZI/kmgA.HTqo1OhVz2NiHc3iwMf.', 'LWANGA', 'YUSUFU', '1626681687', '1626681722', 'lwangyus@gmail.com', 0, '', 'regular', '', '218-043024-12065', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-07-19 05:01:27', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'LWANGA YUSUFU', 1, NULL, NULL, NULL, NULL),
(94, 'tabubakar.isl@buk.edu.ng', '$2y$10$A9PKi6SNAyKw0Mt5ffgrMerVFjs8IquKVAsB/IPsgprMqP0uRMUOK', 'Taufiq Abubakar', 'Hussaini', '1626853846', '1626958491', 'tabubakar.isl@buk.edu.ng', 0, '', 'regular', '', '91/21', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-07-21 04:50:46', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Taufiq Abubakar Hussaini', 1, NULL, NULL, NULL, NULL),
(95, 'aziidah.n2017@gmail.com', '$2y$10$cg4MLFV42Mr2t9.eyJSmAOk3.FbeitQCHyzhdElYAqiXnPUpM5P0e', 'Nanyonga', 'Aziida', '1626959321', '1626959322', 'aziidah.n2017@gmail.com', 0, '', 'regular', '', '213-063011-05291', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-07-22 10:08:41', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Nanyonga Aziida', 1, NULL, NULL, NULL, NULL),
(96, 'Fauziahmugalu@gmail.com', '$2y$10$DT/nB3lhh.E//aDLl/.huuaERVGK2yDmmHYKbRnlneC0ZKfeycrLS', 'Aminah', 'Nakibuule', '1628131621', '1628131712', 'Fauziahmugalu@gmail.com', 0, '', 'regular', '', '214-033023-07265', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-08-04 23:47:01', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Aminah Nakibuule', 1, NULL, NULL, NULL, NULL),
(97, 'sserebe@gmail.com', '$2y$10$sM3i84.M8jrh4N5lGsR0GehvWfAvJ9gKMv593wOhaHC2ZTp0fhRtC', 'Ibrah', 'Sserebe', '1629283051', '1629283246', 'sserebe@gmail.com', 0, '', 'regular', '', '208-063012-00877', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-08-18 07:37:31', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Ibrah Sserebe', 1, NULL, NULL, NULL, NULL),
(98, 'aliah.asiimwe.km@gmail.com', '$2y$10$obmd32AFlJwNHdg/PQ83mumOu9H6FEhTdJp/eZuW/ofP55vUZ49YC', 'Aliah', 'Asiimwe', '1630143336', '1630143435', 'aliah.asiimwe.km@gmail.com', 0, '', 'regular', '', '97/FAS/370', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-08-28 06:35:36', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'Aliah Asiimwe', 1, NULL, NULL, NULL, NULL),
(99, 'amina.kye.sula@gma', '$2y$10$piLJLVXC3FDzGkZ8QjOjZOUFbTUAu7jn6H3ACRyrNyyglyKVOy2Ui', 'Amina', 'Nangonzi', '1630494453', '1630494538', 'amina.kye.sula@gma', 0, '', 'regular', '', '408-063011-00151', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-09-01 08:07:33', '2023-02-26 21:14:16', NULL, 'images/u-9.png', 'Amina Nangonzi', 1, NULL, NULL, NULL, NULL),
(100, 'makhoebe.lebohang@gmail.com', '$2y$10$1wAguRMVuvtGa4nTNWXvAeYaHc1kevHNpDwzaG7kgusLMJq3hwl8a', 'Lebohang', 'Makhoebe', '1637423155', '1637423180', 'makhoebe.lebohang@gmail.com', 0, '', 'regular', '', '1120330217179', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-20 12:45:55', '2023-02-26 21:14:16', NULL, 'images/u-8.png', 'Lebohang Makhoebe', 1, NULL, NULL, NULL, NULL),
(101, 'zoaline0@gmail.com', '$2y$10$uksWeCyKkmUFIA.LVVSIDeGcpu1eHj2E2xVPeq/d0eOHgbfyOd8I6', 'Zuhura', 'Ali', '1637425017', '1637425065', 'zoaline0@gmail.com', 0, '', 'regular', '', '123', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-20 13:16:57', '2023-02-26 21:14:16', NULL, 'images/u-5.png', 'Zuhura Ali', 1, NULL, NULL, NULL, NULL),
(102, 'kizitoshafik2@gmail.com', '$2y$10$UPuEH3eJr62S3hRfRs9j4eUOdQNDRGS3F1cxBvX3JCKrYorfSyLOi', 'Kizito', 'Shafik', '1637431418', '1637431425', 'kizitoshafik2@gmail.com', 0, '', 'regular', '', '215-063011-08159', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-20 15:03:38', '2023-02-26 21:14:16', NULL, 'images/u-3.png', 'Kizito Shafik', 1, NULL, NULL, NULL, NULL),
(103, 'imranahmad.ahmad667@gmail.com', '$2y$10$smDkYRzciWB7Byg1KC2lPO6.P8cMZUNQXCeNQLZXoB3hagtBR0SES', 'Imrana', 'Ahmad', '1637477441', '1637494174', 'imranahmad.ahmad667@gmail.com', 0, '', 'regular', '', '115-0331071-12828', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-21 03:50:41', '2023-02-26 21:14:16', NULL, 'images/u-2.png', 'Imrana Ahmad', 1, NULL, NULL, NULL, NULL),
(104, 'hadeist@live.com', '$2y$10$1/0kbtEVHhJNYN6MEOLOVua5AkOAvNLLRmUpr/c3l2lycN5nCMgyG', 'Hussein', 'Mustafa', '1637524514', '1637524541', 'hadeist@live.com', 0, '', 'regular', '', '112-053011-07993', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-21 16:55:14', '2023-02-26 21:14:16', NULL, 'images/u-4.png', 'Hussein Mustafa', 1, NULL, NULL, NULL, NULL),
(105, 'hishamy8@gmail.com', '$2y$10$TjXopSOVUHTvek4OGUDkkuNo.stwwuYBSc1CExwDb4P/PekR8fDAO', 'SHABANI', 'Haruna', '1637584277', '1637584326', 'hishamy8@gmail.com', 0, '', 'regular', '', '111-023051-05956', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-22 09:31:17', '2023-02-26 21:14:16', NULL, 'images/u-2.png', 'SHABANI Haruna', 1, NULL, NULL, NULL, NULL),
(106, 'maqim@gmail', '$2y$10$N0PDY9icR.JikzbRjXGX3Oo1WOVtmieVAsMJnXcTtFo8NcBYhwXG6', 'Muyingo', 'Makki Ibrahim', '1637606059', '1637606167', 'maqim@gmail', 0, '', 'regular', '', '93/141', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-22 15:34:19', '2023-02-26 21:14:16', NULL, 'images/u-6.png', 'Muyingo Makki Ibrahim', 1, NULL, NULL, NULL, NULL),
(107, 'abdoulshar@gmail.com', '$2y$10$.2BZ7sWKbSox3.GS3unC2eD7pdA9TQFcl.9QLpI4HhWpbG8gkfNbu', 'Nalubega', 'Hadijah', '1637647437', '1637765599', 'abdoulshar@gmail.com', 0, '', 'regular', '', '413-053011-01641', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-23 03:03:57', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'Nalubega Hadijah', 1, NULL, NULL, NULL, NULL),
(108, 'damasusmillinga@gmail.com', '$2y$10$so5pQe5A4liePtdAhe1PEOZDqhnpbMH0LemkEKna2DkwHWHaWaTYC', 'Damasus', 'Millinga', '1643207180', '1643207243', 'damasusmillinga@gmail.com', 0, '', 'regular', '', '98/FAS/313', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-01-26 11:26:20', '2023-02-26 21:14:16', NULL, 'images/u-10.png', 'Damasus Millinga', 1, NULL, NULL, NULL, NULL),
(109, 'mmmondera@gmail.com', '$2y$10$ZAFD3wmCyhenxCSejcIrquTTxl2kZiWJrQ7xd.VTOH/5cVD3RkESS', 'Mondera', 'Muhammed Musiho', '1645372968', '1645373000', 'mmmondera@gmail.com', 0, '', 'regular', '', '88/27', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-02-20 13:02:48', '2023-02-26 21:14:16', NULL, 'images/u-1.png', 'Mondera Muhammed Musiho', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_program`
--

CREATE TABLE `user_has_program` (
  `id` int(11) NOT NULL,
  `program_award` varchar(250) DEFAULT NULL,
  `program_name` varchar(250) DEFAULT NULL,
  `program_year` int(11) DEFAULT NULL,
  `campus_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_has_program`
--

INSERT INTO `user_has_program` (`id`, `program_award`, `program_name`, `program_year`, `campus_id`, `user_id`, `created_at`, `updated_at`) VALUES
(51, 'Bachelor\'s degree', 'BA Educ Lit/ELS', 1993, 1, 21, NULL, NULL),
(52, 'Bachelor\'s degree', 'Business Studies ', 2016, 6, 22, NULL, NULL),
(54, 'Bachelor\'s degree', 'Arabic Language Studies ', 1993, 1, 29, NULL, NULL),
(56, 'Bachelor\'s degree', 'BA/ED', 1992, 1, 26, NULL, NULL),
(63, 'Bachelor\'s degree', 'Bachelor of Islamic Studies and Arabic Language (specializing in Arabic Language).', 1988, 1, 32, NULL, NULL),
(64, 'Diploma', 'Post Graduate Diploma in Education (P.G.D.E)', 1991, 1, 32, NULL, NULL),
(65, 'Master\'s degree', 'Master of Education in Curriculum and Instruction', 2003, 1, 32, NULL, NULL),
(70, 'Bachelor\'s degree', 'Education', 1988, 1, 56, NULL, NULL),
(71, 'Diploma', 'Postgraduate Diploma in Education', 1992, 1, 56, NULL, NULL),
(72, 'Bachelor\'s degree', 'Information Technology', 2016, 1, 3, NULL, NULL),
(73, 'Bachelor\'s degree', 'Social sciences', 1997, 1, 31, NULL, NULL),
(74, 'Diploma', 'Post Graduate diploma in Education', 2003, 1, 31, NULL, NULL),
(75, 'Bachelor\'s degree', 'Computer science and engineering', 1994, 1, 1, '2022-12-31 20:09:16', '2022-12-31 20:24:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_items`
--
ALTER TABLE `delivery_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traffic_records`
--
ALTER TABLE `traffic_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_program`
--
ALTER TABLE `user_has_program`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_items`
--
ALTER TABLE `delivery_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002007;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `traffic_records`
--
ALTER TABLE `traffic_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `user_has_program`
--
ALTER TABLE `user_has_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
