-- Adminer 4.8.0 MySQL 5.7.35-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `ekivoki`;
CREATE DATABASE `ekivoki` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ekivoki`;

DROP TABLE IF EXISTS `ek_card`;
CREATE TABLE `ek_card` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `question_number` tinyint(1) NOT NULL,
  `question_text` varchar(50) NOT NULL,
  `lead_time` tinyint(1) NOT NULL,
  `date_creation` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `version` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `ek_card_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `ek_topic` (`id`),
  CONSTRAINT `ek_card_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `ek_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ek_game`;
CREATE TABLE `ek_game` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` bigint(20) unsigned NOT NULL,
  `card_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `ek_game_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `ek_session` (`id`),
  CONSTRAINT `ek_game_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `ek_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ek_question`;
CREATE TABLE `ek_question` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ek_session`;
CREATE TABLE `ek_session` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_uuid` varchar(36) NOT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ek_topic`;
CREATE TABLE `ek_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2022-03-29 13:19:02
