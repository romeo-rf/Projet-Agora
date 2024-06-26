-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2024 at 08:07 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agora_francia`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `max_bid` decimal(10,2) NOT NULL,
  `bid_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `product_id`, `user_id`, `max_bid`, `bid_time`) VALUES
(5, 13, 4, '20.00', '2024-06-02 17:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '1',
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `price`) VALUES
(74, 4, 21, 1, '22.00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Livres', '2024-05-26 20:38:18'),
(2, 'Électronique', '2024-05-26 20:38:18'),
(3, 'Mode', '2024-05-28 14:40:58'),
(4, 'Maison', '2024-05-28 14:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `categories_sell`
--

CREATE TABLE `categories_sell` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_sell`
--

INSERT INTO `categories_sell` (`id`, `name`) VALUES
(1, 'Meilleure offre'),
(2, 'Transaction client-vendeur'),
(3, 'Achat immédiat');

-- --------------------------------------------------------

--
-- Table structure for table `criteres_recherche`
--

CREATE TABLE `criteres_recherche` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `prix_max` decimal(10,2) DEFAULT NULL,
  `actif` tinyint(1) DEFAULT '1',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categorie_sell` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criteres_recherche`
--

INSERT INTO `criteres_recherche` (`id`, `user_id`, `categorie`, `prix_max`, `actif`, `date_creation`, `categorie_sell`) VALUES
(3, 4, '1', '10.00', 1, '2024-06-02 18:41:16', '1');

-- --------------------------------------------------------

--
-- Table structure for table `demande_vendeur`
--

CREATE TABLE `demande_vendeur` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `raison` text,
  `statut` varchar(20) NOT NULL DEFAULT 'en_attente',
  `date_demande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `livraison`
--

CREATE TABLE `livraison` (
  `id` int(11) NOT NULL,
  `adresse_ligne1` varchar(255) NOT NULL,
  `adresse_ligne2` varchar(255) DEFAULT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `pays` varchar(100) NOT NULL,
  `numero_telephone` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livraison`
--

INSERT INTO `livraison` (`id`, `adresse_ligne1`, `adresse_ligne2`, `ville`, `code_postal`, `pays`, `numero_telephone`, `user_id`) VALUES
(5, '12 rue de la banque', '', 'Paris', '75002', 'France', '0783766618', 4);

-- --------------------------------------------------------

--
-- Table structure for table `negotiations`
--

CREATE TABLE `negotiations` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `initial_offer` decimal(10,2) NOT NULL,
  `counter_offer` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `round` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `negotiations`
--

INSERT INTO `negotiations` (`id`, `product_id`, `buyer_id`, `seller_id`, `initial_offer`, `counter_offer`, `status`, `round`, `created_at`, `updated_at`) VALUES
(1, 26, 7, 4, '15.00', '17.00', 'accepted', 3, '2024-05-30 09:30:14', '2024-05-30 09:36:00'),
(21, 21, 4, 7, '16.00', '22.00', 'accepted', 3, '2024-06-02 19:08:32', '2024-06-02 19:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text,
  `lu` tinyint(1) DEFAULT '0',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `lu`, `date_creation`) VALUES
(1, 4, 'Nouvel article disponible : Test', 0, '2024-06-02 18:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('Pending','Processing','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `card_id`, `address_id`, `total_price`, `status`, `created_at`) VALUES
(7, 4, 35, 5, '550.00', 'Delivered', '2024-06-02 15:40:48'),
(8, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:43:12'),
(9, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:45:29'),
(10, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:46:59'),
(11, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:48:24'),
(12, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:52:39'),
(13, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:55:19'),
(14, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:56:19'),
(15, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:57:19'),
(16, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:58:16'),
(17, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:58:36'),
(18, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 15:58:53'),
(19, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:00:05'),
(20, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:00:11'),
(21, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:03:34'),
(22, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:08:41'),
(23, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:11:46'),
(24, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:13:59'),
(25, 4, 35, 5, '55.00', 'Delivered', '2024-06-02 16:15:11'),
(26, 4, 35, 5, '12.00', 'Delivered', '2024-06-02 16:16:33'),
(27, 4, 35, 5, '10.00', 'Delivered', '2024-06-02 16:18:16'),
(28, 4, 35, 5, '10.00', 'Delivered', '2024-06-02 16:54:38'),
(29, 4, 35, 5, '50.00', 'Delivered', '2024-06-02 17:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `category_sell_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `created_at`, `user_id`, `end_time`, `category_sell_id`) VALUES
(2, 'Téléphone', 'Tres vintage', '300.00', '1', '2024-05-26 20:38:18', 4, '2024-05-30 00:00:00', 1),
(13, 'Trottinette', 'super rapide', '30.00', '1', '2024-05-28 09:40:45', 7, '2024-06-01 19:58:00', 1),
(21, 'Livre Tchoupi', 'TEST', '20.00', '1', '2024-05-28 18:05:53', 7, '2024-05-29 15:15:00', 2),
(23, 'Campus', 'Super chaussure!!!', '120.00', '3', '2024-05-28 18:11:46', 4, '2024-06-08 00:00:00', 1),
(24, 'TN ', 'Super stylé', '210.00', '3', '2024-05-28 18:12:47', 4, '2024-05-30 00:00:00', 1),
(26, 'Chaise', 'Tres confortable', '15.00', '4', '2024-05-28 18:15:58', 4, '2024-05-30 00:00:00', 2),
(27, 'Manteau', 'Super pour l\'hiver', '43.00', '3', '2024-05-28 18:16:41', 4, '2024-05-30 00:00:00', 3),
(28, 'Oscar pas chère ', 'Je m\'en débarrasse.', '0.01', '4', '2024-05-28 18:21:55', 4, '2024-05-30 00:00:00', 3),
(45, 'Livre Tchoupi', 'Trop Tchoupi', '25.00', '1', '2024-05-30 21:58:02', 4, '1970-01-01 00:00:00', 2),
(50, 'Test', 't', '10.00', '1', '2024-06-02 18:41:53', 7, '2024-06-02 20:41:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`) VALUES
(18, 27, 'img/manteau.jpg', '2024-05-30 15:58:07'),
(19, 23, 'img/Campus.jpg', '2024-05-30 16:01:55'),
(20, 2, 'img/Téléphone.jpg', '2024-05-30 16:02:14'),
(21, 24, 'img/TN.jpg', '2024-05-30 16:02:25'),
(23, 26, 'img/Chaise.jpg', '2024-05-30 16:02:45'),
(24, 21, 'img/Livre.jpg', '2024-05-30 20:38:52'),
(25, 13, 'img/Trottinette.jpg', '2024-05-30 20:39:47'),
(26, 45, 'img/Livre_1_1.jpg', '2024-05-30 21:58:02'),
(27, 45, 'img/oscar_1_1.jpg', '2024-05-30 21:58:02'),
(28, 45, 'img/R_1.jpg', '2024-05-30 21:58:02'),
(29, 45, 'img/Téléphone_1.jpg', '2024-05-30 21:58:02'),
(31, 28, 'img/Livre.jpg', '2024-06-02 14:30:19'),
(35, 50, 'img/Livre_1_2.jpg', '2024-06-02 18:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_videos`
--

INSERT INTO `product_videos` (`id`, `product_id`, `video_path`, `created_at`) VALUES
(3, 2, 'img/video (1080p) (1).mp4', '2024-06-02 14:59:20'),
(4, 26, 'img/video (1080p).mp4', '2024-06-02 15:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`) VALUES
(15, 4, 2, 1, 'Top', '2024-05-28 18:09:02'),
(17, 4, 13, 1, 'Top', '2024-05-28 18:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `user_type` enum('acheteur','vendeur','administrateur') NOT NULL DEFAULT 'acheteur',
  `background_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `address`, `profile_picture`, `user_type`, `background_image`) VALUES
(1, 'Alice Dupont', 'alice@example.com', 'motdepasse1', '2024-05-26 20:38:18', NULL, 'P.png', 'acheteur', ''),
(2, 'Bob Martin', 'bob@example.com', 'motdepasse2', '2024-05-26 20:38:18', NULL, NULL, 'acheteur', ''),
(4, 'Roméo Fondaneiche', 'titeulfondaneiche@gmail.com', '$2y$10$SPtQwIUUk1hpm7wU8z6gjuaSXDpvdrkNdwlLFb3k549uCWMgaPTHu', '2024-05-26 20:55:18', '12 rue de la banque', 'img/IMG_8768.jpg', 'administrateur', 'img/romeo8512_website_css_e-learning_videos_course_authentication_-_e7234e19-aa9d-4910-9a95-a16acef3a1c1_cleanup-transformed (1).png'),
(7, 'Test', 'hhhh@example.com', '$2y$10$YPV/Nr4ogr4U3tQRdxVxVOAHAmDX7WCcGWIz3fdrhH9Y6mzNbSRF6', '2024-05-29 15:23:14', NULL, NULL, 'vendeur', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_type` varchar(20) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `expiry_date` varchar(5) NOT NULL,
  `security_code` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_cards`
--

INSERT INTO `user_cards` (`id`, `user_id`, `card_type`, `card_number`, `expiry_date`, `security_code`, `created_at`) VALUES
(35, 4, 'Visa', '7777777777777777', '01/89', 210, '2024-06-02 15:40:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `categories_sell`
--
ALTER TABLE `categories_sell`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteres_recherche`
--
ALTER TABLE `criteres_recherche`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demande_vendeur`
--
ALTER TABLE `demande_vendeur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `card_id` (`card_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories_sell`
--
ALTER TABLE `categories_sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `criteres_recherche`
--
ALTER TABLE `criteres_recherche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `demande_vendeur`
--
ALTER TABLE `demande_vendeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `negotiations`
--
ALTER TABLE `negotiations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `demande_vendeur`
--
ALTER TABLE `demande_vendeur`
  ADD CONSTRAINT `demande_vendeur_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `negotiations`
--
ALTER TABLE `negotiations`
  ADD CONSTRAINT `negotiations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `negotiations_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `negotiations_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `user_cards` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `livraison` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD CONSTRAINT `user_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
