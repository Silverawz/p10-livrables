-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mer. 01 juil. 2020 à 14:45
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bibliotheque-microservice`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(11) NOT NULL,
  `book_author` varchar(35) NOT NULL,
  `book_editor` varchar(35) NOT NULL,
  `book_name` varchar(35) NOT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id_book`, `book_author`, `book_editor`, `book_name`) VALUES
(1, 'Richard', 'Pluton', 'La jungle éclairée'),
(4, 'Nicolas', 'Neptune', 'De rien!'),
(7, 'Cyril', 'Terre', 'Un jour peut être'),
(10, 'Jack', 'Lune', 'La ressource manquante'),
(12, 'Paul', 'Fleur', 'La fille de l\'est');

-- --------------------------------------------------------

--
-- Structure de la table `copy`
--

DROP TABLE IF EXISTS `copy`;
CREATE TABLE IF NOT EXISTS `copy` (
  `id_copy` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `book_id_book` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_copy`),
  KEY `FKdcr74s5bloxk7inpwe31wqhjc` (`book_id_book`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `copy`
--

INSERT INTO `copy` (`id_copy`, `status`, `book_id_book`) VALUES
(2, '0', 1),
(3, '0', 1),
(5, '0', 4),
(6, '0', 4),
(8, '0', 7),
(9, '0', 7),
(11, '1', 10),
(13, '0', 12);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(25),
(25),
(25),
(25),
(25);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_begin` varchar(10) NOT NULL,
  `date_end` varchar(10) NOT NULL,
  `is_archived` bit(1) NOT NULL,
  `copy_id_copy` int(11) DEFAULT NULL,
  `user_id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `FKqi7lhfwyhj9d36gskjq8oua3b` (`copy_id_copy`),
  KEY `FK25jqw2231pf7lr2l8u3c8kdtd` (`user_id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_begin`, `date_end`, `is_archived`, `copy_id_copy`, `user_id_user`) VALUES
(1, '10.10.2019', '29.06.2020', b'0', 11, 18);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `active` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `active`, `email`, `firstname`, `lastname`, `password`) VALUES
(14, b'1', 'dnicolas1500@gmail.com', 'Nicolas', 'Deroussen', '$2a$10$BciQex1enYjLMIQnPZp3IuL3iR69cjTQFrcx0k2ykELEFtnbcG7Gy'),
(15, b'1', 'bbb@aol.fr', 'Hely', 'Kyc', '$2a$10$WtbgtBNVOBQdF9b84/aSTOCjC6kR0Tn3RIPx7Lptj2tWaL./vlPRC'),
(16, b'1', 'ccc@aol.fr', 'Rick', 'Eyo', '$2a$10$lwYpSZZS4RAw63FKwlkqfeRms45JucpGyfvlvS04kP1dUy1FB95.q'),
(17, b'1', 'ddd@aol.fr', 'Morty', 'Rim', '$2a$10$QgD5H9rVIQ//ednUu0Nelu4ULv0e9kDchUGcnqqXwZ6ubKj9kPqQW'),
(18, b'1', 'eee@aol.fr', 'Hector', 'Koi', '$2a$10$8U17S1yN2GL/Y2RnFpXEYuNShF.eJRWOusXnUv5vNcJuKmMwYkrKC');

-- --------------------------------------------------------

--
-- Structure de la table `waiting_list_reservation`
--

DROP TABLE IF EXISTS `waiting_list_reservation`;
CREATE TABLE IF NOT EXISTS `waiting_list_reservation` (
  `id_waiting_list_reservation` int(11) NOT NULL,
  `date_mail_send` datetime DEFAULT NULL,
  `is_archived` bit(1) NOT NULL,
  `is_canceled` bit(1) NOT NULL,
  `position_in_queue` int(11) NOT NULL,
  `book_id_book` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_waiting_list_reservation`),
  KEY `FK4p0stfkewy3hiq3rpy53eplon` (`book_id_book`),
  KEY `FKir4fg3cxyxjgll3wf8ytdt9ft` (`user_id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `waiting_list_reservation`
--

INSERT INTO `waiting_list_reservation` (`id_waiting_list_reservation`, `date_mail_send`, `is_archived`, `is_canceled`, `position_in_queue`, `book_id_book`, `user_id_user`) VALUES
(23, NULL, b'0', b'0', 1, 10, 14),
(24, NULL, b'0', b'0', 2, 10, 15);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
