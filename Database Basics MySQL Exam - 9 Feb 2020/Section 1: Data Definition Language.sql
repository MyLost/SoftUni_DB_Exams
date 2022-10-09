CREATE TABLE `coaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `coach_level` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `towns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `towns_FK` (`country_id`),
  CONSTRAINT `towns_FK` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `stadiums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stadiums_FK` (`town_id`),
  CONSTRAINT `stadiums_FK` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `established` date NOT NULL,
  `fan_base` bigint(20) DEFAULT 0,
  `stadium_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_FK` (`stadium_id`),
  CONSTRAINT `teams_FK` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `skills_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dribbling` int(11) DEFAULT 0,
  `pace` int(11) DEFAULT 0,
  `passing` int(11) DEFAULT 0,
  `shooting` int(11) DEFAULT 0,
  `speed` int(11) DEFAULT 0,
  `strength` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL DEFAULT 0,
  `position` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00,
  `hire_date` datetime DEFAULT NULL,
  `skills_data_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `players_FK` (`skills_data_id`),
  KEY `players_FK_1` (`team_id`),
  CONSTRAINT `players_FK` FOREIGN KEY (`skills_data_id`) REFERENCES `skills_data` (`id`),
  CONSTRAINT `players_FK_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `players_coaches` (
  `player_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  KEY `players_coaches_FK` (`player_id`),
  KEY `players_coaches_FK_1` (`coach_id`),
  CONSTRAINT `players_coaches_FK` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `players_coaches_FK_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
