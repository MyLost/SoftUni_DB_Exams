CREATE TABLE `towns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `towns_UN` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_UN` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `best_before` date DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_UN` (`name`),
  KEY `products_FK` (`category_id`),
  KEY `products_FK_1` (`picture_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_FK_1` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addresses_UN` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` float NOT NULL,
  `has_parking` tinyint(1) DEFAULT 0,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stores_UN` (`name`),
  KEY `stores_FK` (`address_id`),
  CONSTRAINT `stores_FK` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(19,2) DEFAULT 0.00,
  `hire_date` date NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_FK` (`store_id`),
  KEY `employees_FK_1` (`manager_id`),
  CONSTRAINT `employees_FK` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `employees_FK_1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products_stores` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `products_stores_FK_1` (`store_id`),
  CONSTRAINT `products_stores_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_stores_FK_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



