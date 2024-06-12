-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/06/2024 às 02:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dropchina`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinhos_de_compra`
--

CREATE TABLE `carrinhos_de_compra` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinhos_de_compra`
--

INSERT INTO `carrinhos_de_compra` (`id`, `user_id`, `product_id`, `product_price`) VALUES
(15, 1, 6, 5999.00),
(16, 1, 21, 480.87),
(17, 1, 25, 2599.90),
(18, 1, 26, 1899.95),
(19, 1, 6, 5999.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `products`
--

INSERT INTO `products` (`id`, `name`, `price`) VALUES
(6, 'iphone 15', 5999.00),
(8, 'xbox', 2999.00),
(10, 'Drone Voador', 199.90),
(20, 'Faca Ak47', 549.90),
(21, 'Baby Alive', 480.87),
(24, 'Smartwatch', 54.90),
(25, 'Ps12 plus 512Tb', 2599.90),
(26, 'Ninfendo Twich 2', 1899.95),
(27, 'Maozinha amiga', 19.30),
(28, 'Camera Vigia', 299.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `email`, `is_admin`, `created_at`) VALUES
(1, 'Matheus', '$2y$10$6bT4tS6kWdiQ.oDGwlU4puXVGP2BuQWznWtK3oybrHjdBwoUiE/MO', 'matheus@gmail.com', 0, '2024-05-26 18:17:11'),
(2, 'Admin', '$2y$10$rtya0NRtd1e2eQEc6bTrbeGySy9VftKZU3g6MTw1JOJGaXelp1hmW', 'admin@gmail.com', 1, '2024-05-26 18:17:52'),
(3, 'Teste', '$2y$10$ELmVq8W84VFmyEq0HB5.GuhaugcWrdBe.YMKHx83pfsHKQuGQ4sMW', 'teste@gmail.com', 0, '2024-05-26 18:54:36');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinhos_de_compra`
--
ALTER TABLE `carrinhos_de_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinhos_de_compra`
--
ALTER TABLE `carrinhos_de_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinhos_de_compra`
--
ALTER TABLE `carrinhos_de_compra`
  ADD CONSTRAINT `carrinhos_de_compra_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `carrinhos_de_compra_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
