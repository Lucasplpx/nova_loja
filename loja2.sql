-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Dez-2018 às 20:43
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loja2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'LG'),
(2, 'Samsung'),
(3, 'AOC'),
(4, 'Apple');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `sub` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `sub`, `name`) VALUES
(1, NULL, 'Monitor'),
(2, NULL, 'Som'),
(3, 2, 'Headphones'),
(4, 2, 'Microfones'),
(5, 3, 'Com fio'),
(6, 3, 'Sem fio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `coupon_type` int(11) NOT NULL DEFAULT '0',
  `coupon_value` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `options`
--

CREATE TABLE `options` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `options`
--

INSERT INTO `options` (`id`, `name`) VALUES
(1, 'Cor'),
(2, 'Tamanho'),
(3, 'Memória RAM'),
(4, 'Polegadas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '0',
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`) VALUES
(1, 'Super Administrador'),
(2, 'Administrador'),
(3, 'Gerente'),
(5, 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_items`
--

CREATE TABLE `permission_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permission_items`
--

INSERT INTO `permission_items` (`id`, `name`, `slug`) VALUES
(1, 'Criar Cupom de Oferta', 'cupons_create'),
(2, 'Ver Permissões', 'permissions_view');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_links`
--

CREATE TABLE `permission_links` (
  `id` int(11) NOT NULL,
  `id_permission_group` int(11) NOT NULL,
  `id_permission_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permission_links`
--

INSERT INTO `permission_links` (`id`, `id_permission_group`, `id_permission_item`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2),
(6, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_category` int(11) NOT NULL DEFAULT '0',
  `id_brand` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `description` text,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_from` float NOT NULL,
  `rating` float NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `bestseller` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `options` varchar(200) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `length` float NOT NULL,
  `diameter` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `id_category`, `id_brand`, `name`, `description`, `stock`, `price`, `price_from`, `rating`, `featured`, `sale`, `bestseller`, `new_product`, `options`, `weight`, `width`, `height`, `length`, `diameter`) VALUES
(1, 1, 1, 'Monitor 31 polegadas', 'Monitor em alta definição', 10, 499, 599, 2, 1, 1, 1, 0, '1,2,4', 0.9, 20, 15, 20, 15),
(2, 1, 2, 'Monitor 21 polegadas', 'Monitor 1080p 3D', 10, 399, 499, 0, 1, 0, 1, 0, '1,2', 0.8, 20, 15, 20, 15),
(3, 1, 2, 'Monitor 24 polegadas', 'Monitor 4K Gamer', 10, 2599, 699, 2, 1, 1, 0, 1, '1,2', 0.7, 20, 15, 20, 15),
(4, 1, 3, 'Monitor 17 polegadas', 'Monitor 3D LED', 10, 779, 900, 0, 1, 0, 0, 0, '1,4', 0.6, 20, 15, 20, 15),
(5, 1, 1, 'Monitor 20 polegadas', 'Monitor HDR LED 1080p', 10, 299, 0, 0, 1, 0, 0, 1, '1', 0.5, 20, 15, 20, 15),
(6, 1, 3, 'Monitor 20 polegadas', 'Monitor 1080p 3D', 10, 699, 0, 0, 1, 1, 0, 0, '1,2,4', 0.4, 20, 15, 20, 15),
(7, 1, 3, 'Monitor 19 polegadas', 'Monitor 1080p Full HD', 10, 889, 999, 5, 1, 0, 0, 0, '2,4', 0.3, 20, 15, 20, 15),
(8, 1, 1, 'Monitor 18 polegadas', 'Monitor 4K Gamer', 10, 599, 699, 0, 1, 0, 0, 0, '4', 0.2, 20, 15, 20, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_images`
--

INSERT INTO `products_images` (`id`, `id_product`, `url`) VALUES
(1, 1, '1.jpg'),
(2, 2, '2.jpg'),
(3, 3, '3.jpg'),
(4, 4, '4.jpg'),
(5, 5, '4.jpg'),
(6, 6, '4.jpg'),
(7, 7, '7.jpg'),
(8, 8, '4.jpg'),
(9, 1, '4.jpg'),
(10, 1, '4.jpg'),
(11, 1, '3.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_options`
--

CREATE TABLE `products_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `id_option` int(11) NOT NULL DEFAULT '0',
  `p_value` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_options`
--

INSERT INTO `products_options` (`id`, `id_product`, `id_option`, `p_value`) VALUES
(1, 1, 1, 'Azul'),
(2, 1, 2, '23cm'),
(3, 1, 4, '31'),
(4, 2, 1, 'Azul'),
(5, 2, 2, '19cm'),
(6, 3, 1, 'Branco'),
(7, 3, 2, '20cm'),
(8, 4, 1, 'Preto'),
(9, 4, 4, '17'),
(10, 5, 1, 'Vermelho'),
(11, 6, 1, 'Cinza'),
(12, 6, 2, '18cm'),
(13, 6, 4, '20'),
(14, 7, 2, '18cm'),
(15, 7, 4, '19'),
(16, 8, 4, '18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_coupon` int(11) DEFAULT '0',
  `total_amount` float NOT NULL DEFAULT '0',
  `payment_type` varchar(100) DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `purchases`
--

INSERT INTO `purchases` (`id`, `id_user`, `id_coupon`, `total_amount`, `payment_type`, `payment_status`) VALUES
(1, 2, 0, 528.71, 'psckttransparente', 1),
(2, 2, 0, 528.71, 'psckttransparente', 1),
(3, 2, 0, 528.71, 'psckttransparente', 1),
(4, 2, 0, 528.71, 'psckttransparente', 1),
(5, 2, 0, 528.71, 'psckttransparente', 1),
(6, 2, 0, 528.71, 'psckttransparente', 1),
(7, 2, 0, 528.71, 'psckttransparente', 1),
(8, 2, 0, 528.71, 'psckttransparente', 1),
(9, 2, 0, 528.71, 'psckttransparente', 1),
(10, 2, 0, 528.71, 'psckttransparente', 1),
(11, 2, 0, 528.71, 'psckttransparente', 1),
(12, 2, 0, 528.71, 'psckttransparente', 1),
(13, 2, 0, 528.71, 'psckttransparente', 1),
(14, 2, 0, 528.71, 'psckttransparente', 1),
(15, 2, 0, 528.71, 'psckttransparente', 1),
(16, 4, 0, 814.31, 'mp', 1),
(17, 4, 0, 814.31, 'mp', 1),
(18, 4, 0, 814.31, 'mp', 1),
(19, 4, 0, 814.31, 'mp', 1),
(20, 4, 0, 814.31, 'mp', 1),
(21, 4, 0, 814.31, 'mp', 1),
(22, 4, 0, 814.31, 'mp', 1),
(23, 4, 0, 814.31, 'mp', 1),
(24, 4, 0, 814.31, 'mp', 1),
(25, 4, 0, 814.31, 'mp', 1),
(26, 4, 0, 814.31, 'mp', 1),
(27, 4, 0, 814.31, 'mp', 1),
(28, 4, 0, 925.21, 'mp', 1),
(29, 4, 0, 925.21, 'mp', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases_products`
--

CREATE TABLE `purchases_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) NOT NULL DEFAULT '0',
  `id_product` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `product_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `purchases_products`
--

INSERT INTO `purchases_products` (`id`, `id_purchase`, `id_product`, `quantity`, `product_price`) VALUES
(1, 2, 1, 1, 499),
(2, 3, 1, 1, 499),
(3, 4, 1, 1, 499),
(4, 5, 1, 1, 499),
(5, 6, 1, 1, 499),
(6, 7, 1, 1, 499),
(7, 8, 1, 1, 499),
(8, 9, 1, 1, 499),
(9, 10, 1, 1, 499),
(10, 11, 1, 1, 499),
(11, 12, 1, 1, 499),
(12, 13, 1, 1, 499),
(13, 14, 1, 1, 499),
(14, 15, 1, 1, 499),
(15, 16, 4, 1, 779),
(16, 17, 4, 1, 779),
(17, 18, 4, 1, 779),
(18, 19, 4, 1, 779),
(19, 20, 4, 1, 779),
(20, 21, 4, 1, 779),
(21, 22, 4, 1, 779),
(22, 23, 4, 1, 779),
(23, 24, 4, 1, 779),
(24, 25, 4, 1, 779),
(25, 26, 4, 1, 779),
(26, 27, 4, 1, 779),
(27, 28, 7, 1, 889),
(28, 29, 7, 1, 889);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_transactions`
--

CREATE TABLE `purchase_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `transaction_code` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rates`
--

CREATE TABLE `rates` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `date_rated` datetime NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `rates`
--

INSERT INTO `rates` (`id`, `id_product`, `id_user`, `date_rated`, `points`, `comment`) VALUES
(1, 1, 1, '2018-09-28 21:27:04', 2, 'Produto muito bom.'),
(2, 1, 1, '2018-09-28 21:27:36', 2, 'Produto meio ruim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_permission` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(32) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `id_permission`, `email`, `password`, `name`, `admin`, `token`) VALUES
(1, 1, 'lucas@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lucas Passos', 1, 'f6838a6b2a4df2f0141e4782be173ed7'),
(2, 0, 'c41388735159787216280@sandbox.pagseguro.com.br', 'W7kkCD0atP6lLf8h', '', 0, ''),
(4, 5, 'testemp@hotmail.com', '123', '', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_items`
--
ALTER TABLE `permission_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_links`
--
ALTER TABLE `permission_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases_products`
--
ALTER TABLE `purchases_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permission_items`
--
ALTER TABLE `permission_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_links`
--
ALTER TABLE `permission_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products_options`
--
ALTER TABLE `products_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `purchases_products`
--
ALTER TABLE `purchases_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
