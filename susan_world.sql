-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 26 Janvier 2015 à 16:06
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `susan_world`
--

-- --------------------------------------------------------

--
-- Structure de la table `alternate_title`
--

CREATE TABLE IF NOT EXISTS `alternate_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(11) unsigned NOT NULL,
  `title_old` varchar(60) NOT NULL,
  `title_change` text,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `attachement`
--

CREATE TABLE IF NOT EXISTS `attachement` (
  `attachement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attachement_name` varchar(60) NOT NULL,
  `attachement_note` varchar(255) DEFAULT NULL COMMENT 'Max : 255 c.',
  PRIMARY KEY (`attachement_id`),
  UNIQUE KEY `attachement_name` (`attachement_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(100) NOT NULL,
  `contact_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `contact_mail` (`contact_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cross_reference`
--

CREATE TABLE IF NOT EXISTS `cross_reference` (
  `cross_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id_base` int(10) unsigned NOT NULL,
  `image_id_link` int(10) unsigned NOT NULL COMMENT 'Reference of the pointed image',
  `cross_type` varchar(255) DEFAULT NULL COMMENT 'Link type',
  PRIMARY KEY (`cross_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `digital_file`
--

CREATE TABLE IF NOT EXISTS `digital_file` (
  `digital_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(11) unsigned NOT NULL,
  `digital_size` bigint(20) NOT NULL,
  `digital_note` varchar(255) NOT NULL COMMENT 'Max : 255 c.',
  `location_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`digital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `history_start` varchar(100) NOT NULL,
  `history_back` varchar(100) NOT NULL,
  `history_status` text NOT NULL COMMENT 'State of the artwork',
  `history_note` varchar(255) NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_archive` varchar(50) NOT NULL COMMENT 'File name',
  `image_name` text NOT NULL COMMENT 'Name of the artwork',
  `image_creation` varchar(60) NOT NULL,
  `image_width` int(10) unsigned NOT NULL,
  `image_height` int(10) unsigned NOT NULL,
  `image_type` text NOT NULL,
  `image_description` text NOT NULL,
  `image_reverse` varchar(100) NOT NULL,
  `image_condition` varchar(100) NOT NULL,
  `image_medium` varchar(100) NOT NULL,
  `image_transcript` text NOT NULL,
  `image_access` text NOT NULL,
  `image_note` varchar(255) NOT NULL,
  `set_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_archive` (`image_archive`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image_attachement`
--

CREATE TABLE IF NOT EXISTS `image_attachement` (
  `ia_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned NOT NULL,
  `attachement_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image_cross`
--

CREATE TABLE IF NOT EXISTS `image_cross` (
  `ic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned NOT NULL,
  `cross_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image_gallery`
--

CREATE TABLE IF NOT EXISTS `image_gallery` (
  `ig_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned NOT NULL,
  `set_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image_history`
--

CREATE TABLE IF NOT EXISTS `image_history` (
  `ih_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `history_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ih_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `image_tag`
--

CREATE TABLE IF NOT EXISTS `image_tag` (
  `it_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(200) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_name` (`location_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `set`
--

CREATE TABLE IF NOT EXISTS `set` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(100) NOT NULL,
  `set_gallery` tinyint(1) NOT NULL,
  PRIMARY KEY (`set_id`),
  UNIQUE KEY `set_name` (`set_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_content` text NOT NULL,
  `task_priority` smallint(5) unsigned NOT NULL COMMENT '1.Low  2.Medium  3.High',
  `user_id_creator` int(10) unsigned NOT NULL,
  `user_id_recipient` int(10) unsigned NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(30) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  `user_admin` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_login` (`user_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
