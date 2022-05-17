-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2022 at 10:43 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliverer`
--

CREATE TABLE `deliverer` (
  `deliverer_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `phone_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliverer`
--

INSERT INTO `deliverer` (`deliverer_id`, `first_name`, `last_name`, `phone_number`) VALUES
(1, 'Nemanja', 'Komljenovic', '065 333-333'),
(2, 'Pera', 'Peric', '066 444-444');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(10) UNSIGNED NOT NULL,
  `deliverer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `cteated_at` datetime DEFAULT current_timestamp(),
  `delivery_location` varchar(255) DEFAULT NULL,
  `status` enum('requested delivery','active','delivered','failed to deliver') DEFAULT NULL,
  `expected_due` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `deliverer_id`, `order_id`, `cteated_at`, `delivery_location`, `status`, `expected_due`, `delivered_at`) VALUES
(1, 1, 2, '2022-04-08 10:14:52', NULL, 'active', '2022-04-14 17:39:01', NULL),
(2, 1, 1, '2022-04-08 10:14:52', NULL, 'delivered', NULL, '2022-04-08 09:20:00'),
(3, 2, 3, '2022-04-08 10:14:52', NULL, 'active', '2022-04-08 10:20:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `meal_id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`meal_id`, `menu_id`, `name`, `description`, `price`) VALUES
(1, 4, 'Pljeskavica Djacka', NULL, '2.50'),
(2, 4, 'Pljeskavica Blaga - mala', NULL, '3.50'),
(3, 4, 'Pljeskavica Blaga - velika', NULL, '4.50'),
(4, 4, 'Pljeskavica Ljuta - mala', NULL, '3.50'),
(5, 4, 'Pljeskavica Ljuta - velika', NULL, '4.50'),
(6, 4, 'Pljeskavica Gurmanska - mala', NULL, '4.50'),
(7, 4, 'Pljeskavica Gurmanska - velika', NULL, '6.00'),
(8, 4, 'Leskovacki Cevapi', NULL, '4.00'),
(9, 4, 'Banjalucki Cevapi', NULL, '4.00'),
(10, 5, 'Omlet Sa Sirom', '3 jajeta, pecivo', '5.00'),
(11, 5, 'Omlet Sa Sirom i Slaninom', '3 jajeta, pecivo', '6.00'),
(12, 5, 'Sareni Omlet', '3 jajeta, pecivo, sir', '6.50'),
(13, 5, 'Omlet Le Coq', '3 jajeta, pecivo, sir', '7.00'),
(14, 5, 'Hrenovke Sa Feta Sirom', '5 hrenovki, feta sir, pecivo', '6.00'),
(15, 5, 'Bavarski dorucak', NULL, '8.50'),
(16, 6, 'Piletina u Le Coq Sosu', 'uz pecivo a porciju, priloge i dodatke odaberite u narednom koraku', '9.00'),
(17, 6, 'Piletina Na Meksicki Nacin', 'pecivo, meksicko povrce', '9.00'),
(18, 6, 'Pileci Misici Sa Pomfritom', 'pecivo, meso pileceg bataka ocisceno od kostiju i kozice, peceno na rostilju, pomfrit', '6.00'),
(19, 6, 'Chicken Nuggets Sa Pomfritom', 'lepinja, pomfrit, sos po izboru (Le Coq ili slatko-ljuti)', '8.00'),
(20, 6, 'Rizoto Sa Piletinom', 'zeljenu porciju te opciju ljuto ili blago birajte u narednom koraku', '8.00'),
(21, 7, 'Pileci Cevapi', NULL, '4.50'),
(22, 7, 'Rostiljske Kobasice Sa Pomfritom', NULL, '5.00'),
(23, 7, 'Pilece Krpice', 'pecivo, pilece bijelo meso', '5.00'),
(24, 7, 'Le Coq Plata Za Dvije Osobe', 'Dvije male porcije Le Coq filea, mala porcija telecih krpica, mala porcija dimljene curetine, kobasice, pecena slanina, pomfrit', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `menu_type_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `restaurant_id`, `menu_type_id`, `name`) VALUES
(1, 1, 1, 'Le Coq paste'),
(2, 1, 4, 'Le Coq salate'),
(3, 1, 5, 'Le Coq slatki meni'),
(4, 2, 2, 'Cap Cap meni'),
(5, 1, 6, 'Le Coq dorucak'),
(6, 1, 7, 'Le Coq piletina'),
(7, 1, 2, 'Le Coq rostilj');

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `menu_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`menu_type_id`, `name`) VALUES
(1, 'Pasta'),
(2, 'Rostilj'),
(3, 'Brza hrana'),
(4, 'Salate'),
(5, 'Desert'),
(6, 'Dorucak'),
(7, 'Meso');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_meal`
--

CREATE TABLE `order_meal` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `meal_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_meal`
--

INSERT INTO `order_meal` (`order_id`, `meal_id`, `quantity`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 10, 1),
(2, 11, 1),
(2, 16, 1),
(2, 20, 1),
(3, 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone_number` varchar(12) NOT NULL,
  `web_address` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `name`, `description`, `location`, `phone_number`, `web_address`) VALUES
(1, 'Le Coq', NULL, 'Bulevar vojvode Stepe Stepanovica 88, Banja Luka', '051 439-666', 'lecoq.ba'),
(2, 'Cap Cap', NULL, 'Majke Jugovica 18, Banja Luka', '066 119-397', 'capcap-dummy.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `address`, `username`, `password`, `email`, `phone_number`) VALUES
(1, 'Gavrilo', 'Camber', 'Stevana Prvovencanog 4, Banja Luka', 'G45O', '3deffb1096f47b696f5fd30210ac24bf', 'gavrilo@gmail.com', '065 111-111'),
(2, 'Djordje', 'Karabuva', 'Dr. Vojislava Djede Kecmanovica 2A, Banja Luka', 'karabuva', '4dde7961733cf6df964b7fd37376b31c', 'karabuva03@gmail.com', '065 222-222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliverer`
--
ALTER TABLE `deliverer`
  ADD PRIMARY KEY (`deliverer_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `delivery_deliverer_id` (`deliverer_id`),
  ADD KEY `delivery_order_id` (`order_id`);

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`meal_id`),
  ADD UNIQUE KEY `uk_menu_id_name` (`menu_id`,`name`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `restaurant_menu_restaurant_id` (`restaurant_id`),
  ADD KEY `menu_meny_type_id` (`menu_type_id`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`menu_type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_orders_user_id` (`user_id`);

--
-- Indexes for table `order_meal`
--
ALTER TABLE `order_meal`
  ADD UNIQUE KEY `uk_order_meal_order_id_meal_id` (`order_id`,`meal_id`),
  ADD KEY `meal_order_meal_id` (`meal_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliverer`
--
ALTER TABLE `deliverer`
  MODIFY `deliverer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meal`
--
ALTER TABLE `meal`
  MODIFY `meal_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `menu_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_deliverer_id` FOREIGN KEY (`deliverer_id`) REFERENCES `deliverer` (`deliverer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE;

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `menu_meal_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_meny_type_id` FOREIGN KEY (`menu_type_id`) REFERENCES `menu_type` (`menu_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_menu_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `user_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_meal`
--
ALTER TABLE `order_meal`
  ADD CONSTRAINT `meal_order_meal_id` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_order_meal_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
