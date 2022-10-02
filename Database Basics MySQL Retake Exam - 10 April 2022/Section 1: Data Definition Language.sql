CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30)  NOT NULL UNIQUE,
  `continent` varchar(30)  NOT NULL,
  `currency` varchar(5)  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movies_additional_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` decimal(10,2) NOT NULL,
  `runtime` int(11) NOT NULL,
  `picture_url` varchar(80)  NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `release_date` date NOT NULL,
  `has_subtitles` tinyint(1) NOT NULL,
  `description` text  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50)  DEFAULT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70)  NOT NULL UNIQUE,
  `country_id` int(11) NOT NULL,
  `movie_info_id` int(11) NOT NULL UNIQUE,
  PRIMARY KEY (`id`),
  KEY `movies_FK` (`country_id`),
  KEY `movies_FK_1` (`movie_info_id`),
  CONSTRAINT `movies_FK` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `movies_FK_1` FOREIGN KEY (`movie_info_id`) REFERENCES `movies_additional_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `genres_movies` (
  `genre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  KEY `genres_movies_FK` (`genre_id`),
  KEY `genres_movies_FK_1` (`movie_id`),
  CONSTRAINT `genres_movies_FK` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `genres_movies_FK_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50)  NOT NULL,
  `last_name` varchar(50)  NOT NULL,
  `birthdate` date NOT NULL,
  `height` int(11) NOT NULL,
  `awards` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `actors_FK` (`country_id`),
  CONSTRAINT `actors_FK` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movies_actors` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  KEY `movies_actors_FK` (`actor_id`),
  KEY `movies_actors_FK_1` (`movie_id`),
  CONSTRAINT `movies_actors_FK` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  CONSTRAINT `movies_actors_FK_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

