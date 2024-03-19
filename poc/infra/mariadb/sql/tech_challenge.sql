-- MariaDB dump 10.19-11.2.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tech_challenge
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB-1:11.2.2+maria~ubu2204

--
-- Grant configuration
--
CREATE DATABASE IF NOT EXISTS tech_challenge;

CREATE USER IF NOT EXISTS application_user IDENTIFIED BY 'senha123';

USE tech_challenge;

GRANT ALL PRIVILEGES ON tech_challenge.* TO 'application_user'@'%';


--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;

CREATE TABLE `orderitems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `additional_info` varchar(255) DEFAULT NULL,  
  `quantity` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm3mp87f5ygbbfuqfdhc09y9a` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client` varchar(255) NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `price` decimal(38,2) DEFAULT 0.00,
  `status` varchar(255) DEFAULT 'new',
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `product_entity_images`
--

DROP TABLE IF EXISTS `product_entity_images`;

CREATE TABLE `product_entity_images` (
  `product_entity_id` bigint(20) NOT NULL,
  `images` varchar(255) DEFAULT NULL,
  KEY `FK4t1q9clh52po3363yn5ki1ug9` (`product_entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Constraint configuration
--

ALTER TABLE tech_challenge.orderitems ADD CONSTRAINT orderitems_orders_FK FOREIGN KEY (order_id) REFERENCES tech_challenge.orders(id) ON DELETE CASCADE;

ALTER TABLE tech_challenge.orderitems ADD CONSTRAINT orderitems_products_FK FOREIGN KEY (product_id) REFERENCES tech_challenge.products(id) ON DELETE CASCADE;

ALTER TABLE tech_challenge.product_entity_images ADD CONSTRAINT product_entity_images_products_FK FOREIGN KEY (product_entity_id) REFERENCES tech_challenge.products(id) ON DELETE CASCADE;


--
-- Time Zone configuration
--

SET GLOBAL time_zone = 'Brazil/East';


--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
ALTER TABLE `products` DISABLE KEYS;

INSERT INTO `products` VALUES
(1,'Lanche','Misto Quente',12),
(2,'Lanche','Queijo Quente',12),
(3,'Lanche','X-Burger',21),
(4,'Lanche','X-Salada',23),
(5,'Lanche','X-Salada Bacon',25),
(6,'Lanche','Hot-Dog Simples',19),
(7,'Lanche','Hot-Dog Completo',25),
(8,'Bebida','Água Sem Gás (510ml)',5),
(9,'Bebida','Água Com Gás (510ml)',5),
(10,'Bebida','Refrigerante Lata (350ml)',8),
(11,'Bebida','Suco Kappo',8),
(12,'Bebida','Suco Natural de Limão (500ml)',12),
(13,'Bebida','Suco Natural de Laranja (500ml)',12),
(14,'Sobremesa','Crepe Suíço de Nutella',15),
(15,'Sobremesa','Crepe Suíço de Chocolate',12),
(16,'Sobremesa','Churros',10),
(17,'Sobremesa','Pipoca Doce',10);

ALTER TABLE `products` ENABLE KEYS;
UNLOCK TABLES;