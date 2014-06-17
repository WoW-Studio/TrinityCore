-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 10. Jun 2014 um 11:31
-- Server Version: 5.5.37
-- PHP-Version: 5.4.4-14+deb7u10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `trinity_world`
--

--
-- Daten für Tabelle `outdoorpvp_template`
--

UPDATE `outdoorpvp_template` SET `TypeId` = 1,`comment` = 'Höllenfeuerhalbinsel' WHERE `outdoorpvp_template`.`TypeId` = 1;
UPDATE `outdoorpvp_template` SET `TypeId` = 2,`comment` = 'Nagrand' WHERE `outdoorpvp_template`.`TypeId` = 2;
UPDATE `outdoorpvp_template` SET `TypeId` = 3,`comment` = 'Wälder von Terokkar' WHERE `outdoorpvp_template`.`TypeId` = 3;
UPDATE `outdoorpvp_template` SET `TypeId` = 4,`comment` = 'Zangarmarschen' WHERE `outdoorpvp_template`.`TypeId` = 4;
UPDATE `outdoorpvp_template` SET `TypeId` = 5,`comment` = 'Silithus' WHERE `outdoorpvp_template`.`TypeId` = 5;
UPDATE `outdoorpvp_template` SET `TypeId` = 6,`comment` = 'Östliche Pestländer' WHERE `outdoorpvp_template`.`TypeId` = 6;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
