-- Adminer 4.8.0 MySQL 5.7.35-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `topic_id` bigint(20) NOT NULL,
                        `question_id` bigint(20) NOT NULL,
                        `number` int(6) NOT NULL,
                        `question` varchar(50) NOT NULL,
                        `lead_time` int(20) NOT NULL,
                        `date_creation` datetime NOT NULL,
                        `last_modified` datetime NOT NULL,
                        `version` int(20) NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `question_id` (`question_id`),
                        KEY `topic_id` (`topic_id`),
                        CONSTRAINT `card_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
                        CONSTRAINT `card_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
                        CONSTRAINT `card_ibfk_3` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
                        `id` bigint(50) NOT NULL AUTO_INCREMENT,
                        `session_id` bigint(50) NOT NULL,
                        `card_id` int(11) NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `session_id` (`session_id`),
                        KEY `card_id` (`card_id`),
                        CONSTRAINT `game_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
                        CONSTRAINT `game_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `desctiption` varchar(255) NOT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
                           `id` bigint(50) NOT NULL AUTO_INCREMENT,
                           `session_uuid` varchar(50) NOT NULL,
                           `date_creation` datetime NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
                         `id` bigint(20) NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2022-03-23 19:25:00