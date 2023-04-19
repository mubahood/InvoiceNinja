-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 30, 2022 at 03:56 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `8learn`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 6, 'Admin', 'fa-tasks', '', NULL, NULL, '2022-08-25 07:31:32'),
(3, 2, 7, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2022-08-25 07:31:32'),
(4, 2, 8, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2022-08-25 07:31:32'),
(5, 2, 9, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2022-08-25 07:31:32'),
(6, 2, 10, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2022-08-25 07:31:32'),
(7, 2, 11, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2022-08-25 07:31:32'),
(8, 0, 2, 'Course categories', 'fa-certificate', 'course-categories', NULL, '2022-08-25 07:30:24', '2022-08-25 07:31:32'),
(9, 0, 3, 'Courses', 'fa-book', 'courses', NULL, '2022-08-25 07:30:49', '2022-08-25 07:31:32'),
(10, 0, 4, 'Settings', 'fa-cogs', 'settings', NULL, '2022-08-25 07:31:08', '2022-08-25 07:31:32'),
(11, 0, 5, 'Students', 'fa-users', 'participants', NULL, '2022-08-25 07:31:27', '2022-08-25 07:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '::1', '[]', '2022-08-23 15:07:03', '2022-08-23 15:07:03'),
(2, 1, 'admin/courses', 'GET', '::1', '[]', '2022-08-23 15:07:30', '2022-08-23 15:07:30'),
(3, 1, 'admin', 'GET', '::1', '[]', '2022-08-25 07:22:43', '2022-08-25 07:22:43'),
(4, 1, 'admin', 'GET', '::1', '[]', '2022-08-25 07:23:26', '2022-08-25 07:23:26'),
(5, 1, 'admin', 'GET', '::1', '[]', '2022-08-25 07:27:24', '2022-08-25 07:27:24'),
(6, 1, 'admin', 'GET', '::1', '[]', '2022-08-25 07:28:27', '2022-08-25 07:28:27'),
(7, 1, 'admin', 'GET', '::1', '[]', '2022-08-25 07:28:30', '2022-08-25 07:28:30'),
(8, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:28:35', '2022-08-25 07:28:35'),
(9, 1, 'admin/course-categories', 'GET', '::1', '[]', '2022-08-25 07:29:10', '2022-08-25 07:29:10'),
(10, 1, 'admin/course-categories/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:29:14', '2022-08-25 07:29:14'),
(11, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:29:47', '2022-08-25 07:29:47'),
(12, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Course categories\",\"icon\":\"fa-certificate\",\"uri\":\"course-categories\",\"roles\":[null],\"permission\":null,\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\"}', '2022-08-25 07:30:23', '2022-08-25 07:30:23'),
(13, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:30:24', '2022-08-25 07:30:24'),
(14, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:30:32', '2022-08-25 07:30:32'),
(15, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Courses\",\"icon\":\"fa-book\",\"uri\":\"courses\",\"roles\":[null],\"permission\":null,\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\"}', '2022-08-25 07:30:49', '2022-08-25 07:30:49'),
(16, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:30:49', '2022-08-25 07:30:49'),
(17, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Settings\",\"icon\":\"fa-cogs\",\"uri\":\"settings\",\"roles\":[null],\"permission\":null,\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\"}', '2022-08-25 07:31:07', '2022-08-25 07:31:07'),
(18, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:31:08', '2022-08-25 07:31:08'),
(19, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Students\",\"icon\":\"fa-users\",\"uri\":\"participants\",\"roles\":[null],\"permission\":null,\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\"}', '2022-08-25 07:31:27', '2022-08-25 07:31:27'),
(20, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:31:28', '2022-08-25 07:31:28'),
(21, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2022-08-25 07:31:32', '2022-08-25 07:31:32'),
(22, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:31:33', '2022-08-25 07:31:33'),
(23, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:31:35', '2022-08-25 07:31:35'),
(24, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2022-08-25 07:33:49', '2022-08-25 07:33:49'),
(25, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:33:50', '2022-08-25 07:33:50'),
(26, 1, 'admin/course-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:33:53', '2022-08-25 07:33:53'),
(27, 1, 'admin/course-categories/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:33:56', '2022-08-25 07:33:56'),
(28, 1, 'admin/course-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:34:06', '2022-08-25 07:34:06'),
(29, 1, 'admin/course-categories', 'GET', '::1', '[]', '2022-08-25 07:40:55', '2022-08-25 07:40:55'),
(30, 1, 'admin/course-categories/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:40:57', '2022-08-25 07:40:57'),
(31, 1, 'admin/course-categories', 'GET', '::1', '[]', '2022-08-25 07:40:57', '2022-08-25 07:40:57'),
(32, 1, 'admin/course-categories/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:42:02', '2022-08-25 07:42:02'),
(33, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:42:30', '2022-08-25 07:42:30'),
(34, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:42:35', '2022-08-25 07:42:35'),
(35, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:42:57', '2022-08-25 07:42:57'),
(36, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:43:21', '2022-08-25 07:43:21'),
(37, 1, 'admin/course-categories', 'POST', '::1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":null,\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"after-save\":\"1\"}', '2022-08-25 07:44:24', '2022-08-25 07:44:24'),
(38, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:44:25', '2022-08-25 07:44:25'),
(39, 1, 'admin/course-categories', 'POST', '::1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\",\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"after-save\":\"1\"}', '2022-08-25 07:44:42', '2022-08-25 07:44:42'),
(40, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:44:43', '2022-08-25 07:44:43'),
(41, 1, 'admin/course-categories', 'POST', '::1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here&nbsp;\",\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"after-save\":\"1\"}', '2022-08-25 07:45:14', '2022-08-25 07:45:14'),
(42, 1, 'admin/course-categories/create', 'GET', '::1', '[]', '2022-08-25 07:45:15', '2022-08-25 07:45:15'),
(43, 1, 'admin/course-categories', 'POST', '::1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"after-save\":\"1\"}', '2022-08-25 07:45:30', '2022-08-25 07:45:30'),
(44, 1, 'admin/course-categories/1/edit', 'GET', '::1', '[]', '2022-08-25 07:45:30', '2022-08-25 07:45:30'),
(45, 1, 'admin/course-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:45:57', '2022-08-25 07:45:57'),
(46, 1, 'admin/course-categories/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:50:11', '2022-08-25 07:50:11'),
(47, 1, 'admin/course-categories/1/edit', 'GET', '::1', '[]', '2022-08-25 07:50:14', '2022-08-25 07:50:14'),
(48, 1, 'admin/course-categories/1', 'PUT', '::1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/8learning\\/admin\\/course-categories\\/create\"}', '2022-08-25 07:50:33', '2022-08-25 07:50:33'),
(49, 1, 'admin/course-categories/1/edit', 'GET', '::1', '[]', '2022-08-25 07:50:33', '2022-08-25 07:50:33'),
(50, 1, 'admin/course-categories/1', 'PUT', '::1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"Ywxki3Kk9Ut8XxWENYFyiMeyhSL6c8gkJvyo46Um\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 07:50:54', '2022-08-25 07:50:54'),
(51, 1, 'admin/course-categories/1/edit', 'GET', '::1', '[]', '2022-08-25 07:50:54', '2022-08-25 07:50:54'),
(52, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-25 07:53:26', '2022-08-25 07:53:26'),
(53, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:53:29', '2022-08-25 07:53:29'),
(54, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 07:53:33', '2022-08-25 07:53:33'),
(55, 1, 'admin/course-categories/1', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/course-categories\"}', '2022-08-25 07:53:41', '2022-08-25 07:53:41'),
(56, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 07:53:41', '2022-08-25 07:53:41'),
(57, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 07:57:57', '2022-08-25 07:57:57'),
(58, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 07:58:03', '2022-08-25 07:58:03'),
(59, 1, 'admin/course-categories/1', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 07:58:13', '2022-08-25 07:58:13'),
(60, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 07:58:13', '2022-08-25 07:58:13'),
(61, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:25:33', '2022-08-25 08:25:33'),
(62, 1, 'admin/course-categories/1', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 08:25:42', '2022-08-25 08:25:42'),
(63, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:25:42', '2022-08-25 08:25:42'),
(64, 1, 'admin/course-categories/1', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 08:25:59', '2022-08-25 08:25:59'),
(65, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:25:59', '2022-08-25 08:25:59'),
(66, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:29:04', '2022-08-25 08:29:04'),
(67, 1, 'admin/course-categories/1', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here\\u00a0\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 08:29:39', '2022-08-25 08:29:39'),
(68, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:29:39', '2022-08-25 08:29:39'),
(69, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:33:02', '2022-08-25 08:33:02'),
(70, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:35:23', '2022-08-25 08:35:23'),
(71, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:36:07', '2022-08-25 08:36:07'),
(72, 1, 'admin/course-categories/1', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Technology\",\"details\":\"Some data go here.\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 08:36:26', '2022-08-25 08:36:26'),
(73, 1, 'admin/course-categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:36:26', '2022-08-25 08:36:26'),
(74, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:36:30', '2022-08-25 08:36:30'),
(75, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:36:34', '2022-08-25 08:36:34'),
(76, 1, 'admin/course-categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:36:39', '2022-08-25 08:36:39'),
(77, 1, 'admin/course-categories', 'POST', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Finance and Accounting\",\"details\":\"Some details\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/course-categories\"}', '2022-08-25 08:37:39', '2022-08-25 08:37:39'),
(78, 1, 'admin/course-categories/2/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:37:39', '2022-08-25 08:37:39'),
(79, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:37:42', '2022-08-25 08:37:42'),
(80, 1, 'admin/course-categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:37:43', '2022-08-25 08:37:43'),
(81, 1, 'admin/course-categories', 'POST', '127.0.0.1', '{\"parent_id\":null,\"name\":\"Human resource\",\"details\":\"Some details...\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/course-categories\"}', '2022-08-25 08:38:20', '2022-08-25 08:38:20'),
(82, 1, 'admin/course-categories', 'GET', '127.0.0.1', '[]', '2022-08-25 08:38:20', '2022-08-25 08:38:20'),
(83, 1, 'admin/course-categories', 'GET', '127.0.0.1', '[]', '2022-08-25 08:38:42', '2022-08-25 08:38:42'),
(84, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:38:45', '2022-08-25 08:38:45'),
(85, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:38:49', '2022-08-25 08:38:49'),
(86, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:39:34', '2022-08-25 08:39:34'),
(87, 1, 'admin/course-categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:39:40', '2022-08-25 08:39:40'),
(88, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:39:51', '2022-08-25 08:39:51'),
(89, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:39:55', '2022-08-25 08:39:55'),
(90, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:39:56', '2022-08-25 08:39:56'),
(91, 1, 'admin/course-categories', 'GET', '127.0.0.1', '[]', '2022-08-25 08:41:02', '2022-08-25 08:41:02'),
(92, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:41:04', '2022-08-25 08:41:04'),
(93, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:41:10', '2022-08-25 08:41:10'),
(94, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:41:15', '2022-08-25 08:41:15'),
(95, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container?step=1\"}', '2022-08-25 08:41:43', '2022-08-25 08:41:43'),
(96, 1, 'admin/participants', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:41:58', '2022-08-25 08:41:58'),
(97, 1, 'admin/participants/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:00', '2022-08-25 08:42:00'),
(98, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:05', '2022-08-25 08:42:05'),
(99, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:08', '2022-08-25 08:42:08'),
(100, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:26', '2022-08-25 08:42:26'),
(101, 1, 'admin/participants', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:30', '2022-08-25 08:42:30'),
(102, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:31', '2022-08-25 08:42:31'),
(103, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:37', '2022-08-25 08:42:37'),
(104, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:45', '2022-08-25 08:42:45'),
(105, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:42:47', '2022-08-25 08:42:47'),
(106, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:43:31', '2022-08-25 08:43:31'),
(107, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:43:33', '2022-08-25 08:43:33'),
(108, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"instructor\",\"name\":\"Instructor\",\"permissions\":[null],\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/roles\"}', '2022-08-25 08:43:46', '2022-08-25 08:43:46'),
(109, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2022-08-25 08:43:46', '2022-08-25 08:43:46'),
(110, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:43:52', '2022-08-25 08:43:52'),
(111, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:43:53', '2022-08-25 08:43:53'),
(112, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:43:56', '2022-08-25 08:43:56'),
(113, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$lyBaLTAt\\/d\\/qVIaJqipuvOfi4uN8Hh0FGRKvV9AneGzdqYwAGkety\",\"password_confirmation\":\"$2y$10$lyBaLTAt\\/d\\/qVIaJqipuvOfi4uN8Hh0FGRKvV9AneGzdqYwAGkety\",\"roles\":[\"1\",\"2\",null],\"permissions\":[null],\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/users\"}', '2022-08-25 08:44:02', '2022-08-25 08:44:02'),
(114, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 08:44:02', '2022-08-25 08:44:02'),
(115, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:44:04', '2022-08-25 08:44:04'),
(116, 1, 'admin/course-categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:44:09', '2022-08-25 08:44:09'),
(117, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:44:12', '2022-08-25 08:44:12'),
(118, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:44:21', '2022-08-25 08:44:21'),
(119, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/courses\"}', '2022-08-25 08:44:36', '2022-08-25 08:44:36'),
(120, 1, 'admin/courses/create', 'GET', '127.0.0.1', '[]', '2022-08-25 08:44:36', '2022-08-25 08:44:36'),
(121, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\"}', '2022-08-25 08:44:40', '2022-08-25 08:44:40'),
(122, 1, 'admin/courses/create', 'GET', '127.0.0.1', '[]', '2022-08-25 08:44:40', '2022-08-25 08:44:40'),
(123, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:44:43', '2022-08-25 08:44:43'),
(124, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:44:44', '2022-08-25 08:44:44'),
(125, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/courses\"}', '2022-08-25 08:44:50', '2022-08-25 08:44:50'),
(126, 1, 'admin/courses/create', 'GET', '127.0.0.1', '[]', '2022-08-25 08:44:50', '2022-08-25 08:44:50'),
(127, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"1\"}', '2022-08-25 08:44:52', '2022-08-25 08:44:52'),
(128, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\"}', '2022-08-25 08:45:01', '2022-08-25 08:45:01'),
(129, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"1\"}', '2022-08-25 08:45:01', '2022-08-25 08:45:01'),
(130, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"1?step=1\"}', '2022-08-25 08:45:04', '2022-08-25 08:45:04'),
(131, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/courses\\/create?step=1\"}', '2022-08-25 08:45:37', '2022-08-25 08:45:37'),
(132, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"1?step=1\"}', '2022-08-25 08:45:37', '2022-08-25 08:45:37'),
(133, 1, 'admin', 'GET', '::1', '[]', '2022-08-25 08:46:13', '2022-08-25 08:46:13'),
(134, 1, 'admin/courses', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:46:16', '2022-08-25 08:46:16'),
(135, 1, 'admin/courses/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:46:19', '2022-08-25 08:46:19'),
(136, 1, 'admin/courses', 'POST', '::1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"8hznWhZsxwFqpA0qRLceXdmCxXvrrQNzWlOcW2DY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost\\/8learning\\/admin\\/courses\"}', '2022-08-25 08:46:25', '2022-08-25 08:46:25'),
(137, 1, 'admin/courses/create', 'GET', '::1', '[]', '2022-08-25 08:46:26', '2022-08-25 08:46:26'),
(138, 1, 'admin/courses/create', 'GET', '::1', '{\"step\":\"1\"}', '2022-08-25 08:46:30', '2022-08-25 08:46:30'),
(139, 1, 'admin/courses/create', 'GET', '::1', '{\"step\":\"1?step=1\"}', '2022-08-25 08:46:32', '2022-08-25 08:46:32'),
(140, 1, 'admin/courses', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:46:40', '2022-08-25 08:46:40'),
(141, 1, 'admin/courses/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:46:42', '2022-08-25 08:46:42'),
(142, 1, 'admin/courses', 'POST', '::1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"8hznWhZsxwFqpA0qRLceXdmCxXvrrQNzWlOcW2DY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost\\/8learning\\/admin\\/courses\"}', '2022-08-25 08:46:52', '2022-08-25 08:46:52'),
(143, 1, 'admin/courses/create', 'GET', '::1', '[]', '2022-08-25 08:46:53', '2022-08-25 08:46:53'),
(144, 1, 'admin/courses', 'POST', '::1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"8hznWhZsxwFqpA0qRLceXdmCxXvrrQNzWlOcW2DY\",\"after-save\":\"1\"}', '2022-08-25 08:47:17', '2022-08-25 08:47:17'),
(145, 1, 'admin/courses/create', 'GET', '::1', '[]', '2022-08-25 08:47:18', '2022-08-25 08:47:18'),
(146, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/courses\\/create?step=1?step=1\"}', '2022-08-25 08:47:25', '2022-08-25 08:47:25'),
(147, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"1?step=1\"}', '2022-08-25 08:47:25', '2022-08-25 08:47:25'),
(148, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"1?step=2\"}', '2022-08-25 08:47:44', '2022-08-25 08:47:44'),
(149, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 08:47:55', '2022-08-25 08:47:55'),
(150, 1, 'admin/courses', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 08:52:32', '2022-08-25 08:52:32'),
(151, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"visibility\":\"0\",\"step\":\"2\",\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/courses\\/create?step=1%3Fstep%3D2\"}', '2022-08-25 08:53:28', '2022-08-25 08:53:28'),
(152, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 08:53:28', '2022-08-25 08:53:28'),
(153, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 09:03:18', '2022-08-25 09:03:18'),
(154, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 09:04:50', '2022-08-25 09:04:50'),
(155, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 09:04:52', '2022-08-25 09:04:52'),
(156, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 09:05:02', '2022-08-25 09:05:02'),
(157, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 09:06:08', '2022-08-25 09:06:08'),
(158, 1, 'admin/courses/create', 'GET', '127.0.0.1', '{\"step\":\"2?step=2\"}', '2022-08-25 09:06:20', '2022-08-25 09:06:20'),
(159, 1, 'admin/courses', 'POST', '127.0.0.1', '{\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"price\":\"32000\",\"total_hours\":\"1000\",\"level\":\"Beginner level\",\"has_certificate\":\"Yes\",\"tags\":[\"html\",\"web\",\"programming\",null],\"details\":\"Some details about this course\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/courses\\/create?step=2%3Fstep%3D2\"}', '2022-08-25 09:08:02', '2022-08-25 09:08:02'),
(160, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:08:02', '2022-08-25 09:08:02'),
(161, 1, 'admin/courses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 09:08:05', '2022-08-25 09:08:05'),
(162, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-25 09:08:08', '2022-08-25 09:08:08'),
(163, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:08:44', '2022-08-25 09:08:44'),
(164, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:11:33', '2022-08-25 09:11:33'),
(165, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:11:41', '2022-08-25 09:11:41'),
(166, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:14:34', '2022-08-25 09:14:34'),
(167, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:16:58', '2022-08-25 09:16:58'),
(168, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:17:55', '2022-08-25 09:17:55'),
(169, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:22:52', '2022-08-25 09:22:52'),
(170, 1, 'admin/courses/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"price\":\"32000\",\"total_hours\":\"1000\",\"level\":\"Beginner level\",\"has_certificate\":\"Yes\",\"tags\":[\"html\",\"web\",\"programming\",null],\"details\":\"Some details about this course\",\"visibility\":\"1\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 09:23:28', '2022-08-25 09:23:28'),
(171, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:23:28', '2022-08-25 09:23:28'),
(172, 1, 'admin/courses/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"price\":\"32000\",\"total_hours\":\"1000\",\"level\":\"Beginner level\",\"has_certificate\":\"Yes\",\"tags\":[\"html\",\"web\",\"programming\",null],\"details\":\"Some details about this course\",\"visibility\":\"1\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 09:24:56', '2022-08-25 09:24:56'),
(173, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:24:56', '2022-08-25 09:24:56'),
(174, 1, 'admin/courses/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"price\":\"32000\",\"total_hours\":\"1000\",\"level\":\"Beginner level\",\"has_certificate\":\"Yes\",\"tags\":[\"html\",\"web\",\"programming\",null],\"details\":\"Some details about this course\",\"visibility\":\"0\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 09:25:03', '2022-08-25 09:25:03'),
(175, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:25:04', '2022-08-25 09:25:04'),
(176, 1, 'admin/courses/1', 'PUT', '127.0.0.1', '{\"administrator_id\":\"1\",\"course_category_id\":\"1\",\"name\":\"HTML for web beginners\",\"price\":\"32000\",\"total_hours\":\"1000\",\"level\":\"Beginner level\",\"has_certificate\":\"Yes\",\"tags\":[\"html\",\"web\",\"programming\",null],\"details\":\"Some details about this course\",\"visibility\":\"1\",\"_token\":\"F99yRF7vBjYzgEwK8xUjyjI9h3N3bBPh3LB9VNJY\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-08-25 09:49:50', '2022-08-25 09:49:50'),
(177, 1, 'admin/courses/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-25 09:49:50', '2022-08-25 09:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2022-08-25 07:26:35', '2022-08-25 07:26:35'),
(2, 'Instructor', 'instructor', '2022-08-25 08:43:46', '2022-08-25 08:43:46');

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
(1, 2, NULL, NULL);

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
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$lyBaLTAt/d/qVIaJqipuvOfi4uN8Hh0FGRKvV9AneGzdqYwAGkety', 'Administrator', NULL, 'Lzc3AUq1WqNZmuosW9vFfQqJyhsa1C3s9Uhid9D6IgcdqoFAwV4bsMN6ulsr', '2022-08-25 07:26:35', '2022-08-25 07:26:35');

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
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `course_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `price` text COLLATE utf8mb4_unicode_ci,
  `total_hours` text COLLATE utf8mb4_unicode_ci,
  `level` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` text COLLATE utf8mb4_unicode_ci,
  `introduction_video` text COLLATE utf8mb4_unicode_ci,
  `has_certificate` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `prerequisits` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `language` text COLLATE utf8mb4_unicode_ci,
  `visibility` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `created_at`, `updated_at`, `administrator_id`, `course_category_id`, `name`, `price`, `total_hours`, `level`, `thumbnail`, `introduction_video`, `has_certificate`, `details`, `skills`, `prerequisits`, `tags`, `language`, `visibility`) VALUES
(1, '2022-08-25 09:08:02', '2022-08-25 09:49:50', 1, 1, 'HTML for web beginners', '32000', '1000', 'Beginner level', 'academy.jpeg', '88e5afdb7884f1da37c1bc8422525275.jpeg', 'Yes', 'Some details about this course', NULL, NULL, 'html,web,programming', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `created_at`, `updated_at`, `name`, `thumbnail`, `details`, `parent_id`) VALUES
(1, '2022-08-25 07:45:30', '2022-08-25 08:36:26', 'Technology', 'bg-1.jpeg', 'Some data go here.', NULL),
(2, '2022-08-25 08:37:39', '2022-08-25 08:37:39', 'Finance and Accounting', '2.jpeg', 'Some details', NULL),
(3, '2022-08-25 08:38:20', '2022-08-25 08:38:20', 'Human resource', 'mobo.jpeg', 'Some details...', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_chapters`
--

CREATE TABLE `course_chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_topics`
--

CREATE TABLE `course_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_chapter_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `type` text COLLATE utf8mb4_unicode_ci,
  `video` text COLLATE utf8mb4_unicode_ci,
  `youtube` text COLLATE utf8mb4_unicode_ci,
  `files` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `minutes` text COLLATE utf8mb4_unicode_ci,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(11, '2021_11_18_225343_create_participants_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traffic_records`
--

CREATE TABLE `traffic_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_chapters`
--
ALTER TABLE `course_chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_topics`
--
ALTER TABLE `course_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
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
-- Indexes for table `traffic_records`
--
ALTER TABLE `traffic_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_chapters`
--
ALTER TABLE `course_chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_topics`
--
ALTER TABLE `course_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `traffic_records`
--
ALTER TABLE `traffic_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
