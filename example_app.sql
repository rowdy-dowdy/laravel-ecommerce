-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Feb 21, 2023 at 10:35 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `example_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`, `type`, `link`) VALUES
(1, 'Daily Deals', 'AirPods \r\nEarphones', 'banners/February2023/2htEJ8wt04xqOtf28v3j.jpg', '2023-02-21 03:29:00', '2023-02-21 03:29:17', 'home', '/category'),
(2, 'Top Product', 'Edifier\r\nStereo Bluetooth', 'banners/February2023/KmFklRnsUUOXTbyPoaDZ.jpg', '2023-02-21 03:41:00', '2023-02-21 03:43:42', 'home2', NULL),
(3, 'Top Product', 'Clearance', 'banners/February2023/3GPAiuQhsRcQ049mGIOS.jpg', '2023-02-21 03:41:00', '2023-02-21 03:43:48', 'home2', NULL),
(8, 'Top Product', 'Clearance', 'banners/February2023/GC65NGxsR1GZ31r2sYrh.jpg', '2023-02-21 03:41:00', '2023-02-21 03:43:52', 'home2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-02-20 09:15:44', '2023-02-20 09:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `title`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Feature', 'feature', NULL, NULL, '2023-02-21 03:52:52', '2023-02-21 03:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `collection_product`
--

CREATE TABLE `collection_product` (
  `id` int UNSIGNED NOT NULL,
  `collection_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collection_product`
--

INSERT INTO `collection_product` (`id`, `collection_id`, `product_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Việt Hùng', 'viet.hung.2898@gmail.com', NULL, NULL, '$2y$10$Y6caLJuhkQsYUmrq71AWueEgRom3j7Ds6mZpqblE55GZDxugFE36u', NULL, NULL, '2023-02-21 00:47:49', '2023-02-21 00:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'role_id', 'text', 'Role Id', 0, 0, 0, 0, 0, 0, '{}', 2),
(58, 7, 'name', 'text', 'Tên', 1, 1, 1, 0, 1, 1, '{}', 3),
(59, 7, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'password', 'password', 'Mật khẩu', 1, 0, 0, 1, 1, 0, '{}', 7),
(63, 7, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 8),
(64, 7, 'settings', 'text', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 9),
(65, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(66, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(67, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 8, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(70, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(71, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(72, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(73, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 9, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(75, 9, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 3),
(76, 9, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(77, 9, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5),
(78, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(79, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(80, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 10, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(82, 10, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 3),
(83, 10, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(84, 10, 'body', 'rich_text_box', 'Body', 0, 1, 1, 1, 1, 1, '{}', 5),
(85, 10, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 6),
(86, 10, 'images', 'Multiple Image Customs', 'Images', 0, 1, 1, 1, 1, 1, 'null', 7),
(87, 10, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{}', 8),
(88, 10, 'promotion', 'number', 'Promotion', 0, 1, 1, 1, 1, 1, '{}', 9),
(89, 10, 'sold', 'number', 'Sold', 0, 1, 1, 1, 1, 1, '{}', 10),
(90, 10, 'stock', 'number', 'Stock', 0, 1, 1, 1, 1, 1, '{}', 11),
(91, 10, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, '{\"on\":\"\\u0110\\u0103ng b\\u00e1n\",\"off\":\"\\u1ea8n s\\u1ea3n ph\\u1ea9m\",\"checked\":true}', 12),
(92, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(93, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(94, 10, 'product_belongstomany_collection_relationship', 'relationship', 'collections', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Collection\",\"table\":\"collections\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"collection_product\",\"pivot\":\"1\",\"taggable\":\"0\"}', 15),
(95, 8, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 7),
(96, 8, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(97, 8, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 8),
(98, 9, 'collection_belongstomany_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"collection_product\",\"pivot\":\"1\",\"taggable\":\"0\"}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'App\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(7, 'customers', 'customers', 'Khách hàng', 'Khách hàng', 'voyager-people', 'App\\Models\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-02-21 02:58:44', '2023-02-21 02:58:44'),
(8, 'banners', 'banners', 'Banner', 'Banners', NULL, 'App\\Models\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-21 03:06:35', '2023-02-21 03:28:13'),
(9, 'collections', 'collections', 'Danh mục sản phẩm', 'Danh mục sản phẩm', NULL, 'App\\Models\\Collection', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-21 03:16:44', '2023-02-21 03:58:52'),
(10, 'products', 'products', 'Sản phẩm', 'Sản phẩm', NULL, 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-21 03:20:06', '2023-02-21 10:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-02-20 09:13:34', '2023-02-20 09:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Bảng điều khiển', '', '_self', 'voyager-dashboard', '#000000', NULL, 1, '2023-02-20 09:13:34', '2023-02-21 08:13:13', 'voyager.dashboard', 'null'),
(2, 1, 'Đa phương tiện', '', '_self', 'voyager-images', '#000000', NULL, 5, '2023-02-20 09:13:34', '2023-02-21 08:11:43', 'voyager.media.index', 'null'),
(3, 1, 'Tài khoản quản trị', '', '_self', 'voyager-person', '#000000', 15, 1, '2023-02-20 09:13:34', '2023-02-21 02:59:38', 'voyager.users.index', 'null'),
(4, 1, 'Phân quyền', '', '_self', 'voyager-lock', '#000000', 15, 2, '2023-02-20 09:13:34', '2023-02-21 02:59:53', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2023-02-20 09:13:34', '2023-02-21 08:11:43', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-02-20 09:13:34', '2023-02-21 02:53:42', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2023-02-20 09:13:34', '2023-02-21 02:53:42', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2023-02-20 09:13:34', '2023-02-21 02:53:42', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2023-02-20 09:13:34', '2023-02-21 02:53:42', 'voyager.bread.index', NULL),
(10, 1, 'Cấu hình', '', '_self', 'voyager-settings', '#000000', NULL, 7, '2023-02-20 09:13:34', '2023-02-21 08:11:43', 'voyager.settings.index', 'null'),
(11, 1, 'Danh mục bài viết', '', '_self', 'voyager-window-list', '#000000', 17, 3, '2023-02-20 09:15:44', '2023-02-21 03:07:17', 'voyager.categories.index', 'null'),
(12, 1, 'Bài viết', '', '_self', 'voyager-news', '#000000', 17, 2, '2023-02-20 09:15:45', '2023-02-21 03:07:05', 'voyager.posts.index', 'null'),
(13, 1, 'Trang', '', '_self', 'voyager-file-text', '#000000', 17, 4, '2023-02-20 09:15:45', '2023-02-21 08:11:43', 'voyager.pages.index', 'null'),
(15, 1, 'Tài khoản', '', '_self', 'voyager-data', '#000000', NULL, 4, '2023-02-21 02:54:21', '2023-02-21 08:11:43', NULL, ''),
(16, 1, 'Khách hàng', '', '_self', 'voyager-people', NULL, 15, 3, '2023-02-21 02:58:44', '2023-02-21 02:59:20', 'voyager.customers.index', NULL),
(17, 1, 'Nội dung', '', '_self', 'voyager-pen', '#000000', NULL, 3, '2023-02-21 03:03:50', '2023-02-21 08:11:43', NULL, ''),
(18, 1, 'Banners', '', '_self', 'voyager-images', '#000000', 17, 1, '2023-02-21 03:06:35', '2023-02-21 03:07:31', 'voyager.banners.index', 'null'),
(19, 1, 'Danh mục sản phẩm', '', '_self', 'voyager-boat', '#000000', 21, 2, '2023-02-21 03:16:44', '2023-02-21 08:13:18', 'voyager.collections.index', 'null'),
(20, 1, 'Sản phẩm', '', '_self', 'voyager-pizza', '#000000', 21, 1, '2023-02-21 03:20:06', '2023-02-21 08:12:58', 'voyager.products.index', 'null'),
(21, 1, 'Cửa hàng', '', '_self', 'voyager-shop', '#000000', NULL, 2, '2023-02-21 08:11:17', '2023-02-21 08:11:43', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-02-20 09:15:45', '2023-02-20 09:15:45');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(2, 'browse_bread', NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(3, 'browse_database', NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(4, 'browse_media', NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(5, 'browse_compass', NULL, '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(6, 'browse_menus', 'menus', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(7, 'read_menus', 'menus', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(8, 'edit_menus', 'menus', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(9, 'add_menus', 'menus', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(10, 'delete_menus', 'menus', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(11, 'browse_roles', 'roles', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(12, 'read_roles', 'roles', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(13, 'edit_roles', 'roles', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(14, 'add_roles', 'roles', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(15, 'delete_roles', 'roles', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(16, 'browse_users', 'users', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(17, 'read_users', 'users', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(18, 'edit_users', 'users', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(19, 'add_users', 'users', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(20, 'delete_users', 'users', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(21, 'browse_settings', 'settings', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(22, 'read_settings', 'settings', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(23, 'edit_settings', 'settings', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(24, 'add_settings', 'settings', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(25, 'delete_settings', 'settings', '2023-02-20 09:13:35', '2023-02-20 09:13:35'),
(26, 'browse_categories', 'categories', '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(27, 'read_categories', 'categories', '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(28, 'edit_categories', 'categories', '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(29, 'add_categories', 'categories', '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(30, 'delete_categories', 'categories', '2023-02-20 09:15:44', '2023-02-20 09:15:44'),
(31, 'browse_posts', 'posts', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(32, 'read_posts', 'posts', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(33, 'edit_posts', 'posts', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(34, 'add_posts', 'posts', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(35, 'delete_posts', 'posts', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(36, 'browse_pages', 'pages', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(37, 'read_pages', 'pages', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(38, 'edit_pages', 'pages', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(39, 'add_pages', 'pages', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(40, 'delete_pages', 'pages', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(41, 'browse_customers', 'customers', '2023-02-21 02:58:44', '2023-02-21 02:58:44'),
(42, 'read_customers', 'customers', '2023-02-21 02:58:44', '2023-02-21 02:58:44'),
(43, 'edit_customers', 'customers', '2023-02-21 02:58:44', '2023-02-21 02:58:44'),
(44, 'add_customers', 'customers', '2023-02-21 02:58:44', '2023-02-21 02:58:44'),
(45, 'delete_customers', 'customers', '2023-02-21 02:58:44', '2023-02-21 02:58:44'),
(46, 'browse_banners', 'banners', '2023-02-21 03:06:35', '2023-02-21 03:06:35'),
(47, 'read_banners', 'banners', '2023-02-21 03:06:35', '2023-02-21 03:06:35'),
(48, 'edit_banners', 'banners', '2023-02-21 03:06:35', '2023-02-21 03:06:35'),
(49, 'add_banners', 'banners', '2023-02-21 03:06:35', '2023-02-21 03:06:35'),
(50, 'delete_banners', 'banners', '2023-02-21 03:06:35', '2023-02-21 03:06:35'),
(51, 'browse_collections', 'collections', '2023-02-21 03:16:44', '2023-02-21 03:16:44'),
(52, 'read_collections', 'collections', '2023-02-21 03:16:44', '2023-02-21 03:16:44'),
(53, 'edit_collections', 'collections', '2023-02-21 03:16:44', '2023-02-21 03:16:44'),
(54, 'add_collections', 'collections', '2023-02-21 03:16:44', '2023-02-21 03:16:44'),
(55, 'delete_collections', 'collections', '2023-02-21 03:16:44', '2023-02-21 03:16:44'),
(56, 'browse_products', 'products', '2023-02-21 03:20:06', '2023-02-21 03:20:06'),
(57, 'read_products', 'products', '2023-02-21 03:20:06', '2023-02-21 03:20:06'),
(58, 'edit_products', 'products', '2023-02-21 03:20:06', '2023-02-21 03:20:06'),
(59, 'add_products', 'products', '2023-02-21 03:20:06', '2023-02-21 03:20:06'),
(60, 'delete_products', 'products', '2023-02-21 03:20:06', '2023-02-21 03:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-02-20 09:15:45', '2023-02-20 09:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,0) NOT NULL,
  `promotion` decimal(10,0) DEFAULT NULL,
  `sold` int DEFAULT '0',
  `stock` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `body`, `image`, `images`, `price`, `promotion`, `sold`, `stock`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(2, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress2', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(3, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(4, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n1', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(5, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n11', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(6, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n111', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(7, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n1111', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(8, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n11111', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08'),
(9, 'Dark yellow lace cut out swing dress', 'dark-yellow-lace-cut-out-swing-dress21\r\n111111', 'Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing. Sed lectus.', '<div class=\"product-desc-content\">\r\n<h3>Product Information</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n<ul>\r\n<li>Nunc nec porttitor turpis. In eu risus enim. In vitae mollis elit.</li>\r\n<li>Vivamus finibus vel mauris ut vehicula.</li>\r\n<li>Nullam a magna porttitor, dictum risus nec, faucibus sapien.</li>\r\n</ul>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus.</p>\r\n</div>', 'products/February2023/DnjV8zQ9IK7GK5PNlbKr.jpg', '[\"products/1.jpg\",\"products/2.jpg\",\"products/3.jpg\",\"products/4.jpg\"]', 380000, 350000, NULL, 100, 1, '2023-02-21 03:48:00', '2023-02-21 03:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-02-20 09:13:34', '2023-02-20 09:13:34'),
(2, 'user', 'Normal User', '2023-02-20 09:13:34', '2023-02-20 09:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Molla - Bootstrap eCommerce Template', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Molla - Bootstrap eCommerce Template', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/February2023/WlWpOJdpaqLId2VrOYNs.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-02-20 09:15:45', '2023-02-20 09:15:45'),
(31, 'menu_items', 'title', 1, 'en', 'Dashboard', '2023-02-21 02:52:21', '2023-02-21 02:52:21'),
(32, 'menu_items', 'title', 3, 'en', 'Admin', '2023-02-21 02:52:37', '2023-02-21 02:52:37'),
(33, 'menu_items', 'title', 2, 'en', 'Media', '2023-02-21 02:52:51', '2023-02-21 02:52:51'),
(34, 'menu_items', 'title', 12, 'en', 'Posts', '2023-02-21 02:52:58', '2023-02-21 02:52:58'),
(35, 'menu_items', 'title', 13, 'en', 'Pages', '2023-02-21 02:53:04', '2023-02-21 02:53:04'),
(36, 'menu_items', 'title', 11, 'en', 'Categories', '2023-02-21 02:53:14', '2023-02-21 02:53:14'),
(38, 'menu_items', 'title', 15, 'en', 'Tài khoản', '2023-02-21 02:55:47', '2023-02-21 02:55:47'),
(39, 'menu_items', 'title', 4, 'en', 'Roles', '2023-02-21 02:56:05', '2023-02-21 02:56:05'),
(40, 'menu_items', 'title', 10, 'en', 'Settings', '2023-02-21 02:59:16', '2023-02-21 02:59:16'),
(41, 'menu_items', 'title', 17, 'en', 'Content', '2023-02-21 03:03:50', '2023-02-21 03:03:50'),
(42, 'menu_items', 'title', 18, 'en', 'Banners', '2023-02-21 03:07:31', '2023-02-21 03:07:31'),
(43, 'data_rows', 'display_name', 67, 'en', 'Id', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(44, 'data_rows', 'display_name', 68, 'en', 'Title', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(45, 'data_rows', 'display_name', 69, 'en', 'Slug', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(46, 'data_rows', 'display_name', 70, 'en', 'Image', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(47, 'data_rows', 'display_name', 71, 'en', 'Created At', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(48, 'data_rows', 'display_name', 72, 'en', 'Updated At', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(49, 'data_types', 'display_name_singular', 8, 'en', 'Banner', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(50, 'data_types', 'display_name_plural', 8, 'en', 'Banners', '2023-02-21 03:24:29', '2023-02-21 03:24:29'),
(51, 'data_rows', 'display_name', 95, 'en', 'Type', '2023-02-21 03:28:13', '2023-02-21 03:28:13'),
(52, 'data_rows', 'display_name', 80, 'en', 'Id', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(53, 'data_rows', 'display_name', 81, 'en', 'Title', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(54, 'data_rows', 'display_name', 82, 'en', 'Slug', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(55, 'data_rows', 'display_name', 83, 'en', 'Description', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(56, 'data_rows', 'display_name', 84, 'en', 'Body', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(57, 'data_rows', 'display_name', 85, 'en', 'Image', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(58, 'data_rows', 'display_name', 86, 'en', 'Images', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(59, 'data_rows', 'display_name', 87, 'en', 'Price', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(60, 'data_rows', 'display_name', 88, 'en', 'Promotion', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(61, 'data_rows', 'display_name', 89, 'en', 'Sold', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(62, 'data_rows', 'display_name', 90, 'en', 'Stock', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(63, 'data_rows', 'display_name', 91, 'en', 'Status', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(64, 'data_rows', 'display_name', 92, 'en', 'Created At', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(65, 'data_rows', 'display_name', 93, 'en', 'Updated At', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(66, 'data_rows', 'display_name', 94, 'en', 'collections', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(67, 'data_types', 'display_name_singular', 10, 'en', 'Sản phẩm', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(68, 'data_types', 'display_name_plural', 10, 'en', 'Sản phẩm', '2023-02-21 03:48:50', '2023-02-21 03:48:50'),
(69, 'data_rows', 'display_name', 73, 'en', 'Id', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(70, 'data_rows', 'display_name', 74, 'en', 'Title', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(71, 'data_rows', 'display_name', 75, 'en', 'Slug', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(72, 'data_rows', 'display_name', 76, 'en', 'Description', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(73, 'data_rows', 'display_name', 77, 'en', 'Image', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(74, 'data_rows', 'display_name', 78, 'en', 'Created At', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(75, 'data_rows', 'display_name', 79, 'en', 'Updated At', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(76, 'data_rows', 'display_name', 98, 'en', 'products', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(77, 'data_types', 'display_name_singular', 9, 'en', 'Danh mục sản phẩm', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(78, 'data_types', 'display_name_plural', 9, 'en', 'Danh mục sản phẩm', '2023-02-21 03:52:31', '2023-02-21 03:52:31'),
(79, 'menu_items', 'title', 21, 'en', 'Shop', '2023-02-21 08:11:17', '2023-02-21 08:11:17'),
(80, 'menu_items', 'title', 20, 'en', 'Sản phẩm', '2023-02-21 08:12:58', '2023-02-21 08:12:58'),
(81, 'menu_items', 'title', 19, 'en', 'Danh mục sản phẩm', '2023-02-21 08:13:18', '2023-02-21 08:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$NrslVVHTc.rs81xQKEoXwe9xU3uj1abiELW32/QjZSzsjfnQ9C/bC', 'ARtnTDWOzWhEB7P9OCaMnIBl5RaGcuQ9ml4iIrU0vAmc3ReKjZIPbBhcFaUc', '{\"locale\":\"vi\"}', '2023-02-20 09:15:44', '2023-02-21 02:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colections_slug_unique` (`slug`);

--
-- Indexes for table `collection_product`
--
ALTER TABLE `collection_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `collection_product`
--
ALTER TABLE `collection_product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
