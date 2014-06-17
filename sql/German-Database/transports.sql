/*
Navicat MySQL Data Transfer

Source Server         : Gods of Nation
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : world335pve

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2014-06-17 07:13:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `transports`
-- ----------------------------
DROP TABLE IF EXISTS `transports`;
CREATE TABLE `transports` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

-- ----------------------------
-- Records of transports
-- ----------------------------
INSERT INTO `transports` VALUES ('1', '176495', 'Unterstadt, Tirisfal und Basislager von Grom\'gol, Schlingendorntal (\"Die Prinzessin Violetta\")', '');
INSERT INTO `transports` VALUES ('2', '176310', 'Hafen von Sturmwind und Auberdine, Dunkelküste (\"Die Bravado\")', '');
INSERT INTO `transports` VALUES ('3', '176244', 'Rut\'theran, Teldrassil und Auberdine, Dunkelküste (\"Die Mondgischt\")', '');
INSERT INTO `transports` VALUES ('4', '176231', 'Hafen von Menethil, Sumpfland und Inseln von Theramore, Düstermarschen (\"Die Lady Mehley\")', '');
INSERT INTO `transports` VALUES ('5', '175080', 'Orgrimmar, Durotar und Basislager von Grom\'gol, Schlingendorntal (\"Der Eiserne Adler\")', '');
INSERT INTO `transports` VALUES ('6', '164871', 'Orgrimmar, Durotar und Unterstadt, Tirisfal (\"Die Donnersturm\")', '');
INSERT INTO `transports` VALUES ('7', '20808', 'Dampfdruckpier, Ratschet und Beutebucht (\"Die Launische Minna\")', '');
INSERT INTO `transports` VALUES ('8', '177233', 'Die vergessene Küste, Feralas und Mondfederfeste, Insel Sardor, Feralas (\"Mondfederfähre\")', '');
INSERT INTO `transports` VALUES ('9', '181646', 'Valaars Steg, Azurmythosinsel und Auberdine, Dunkelküste (\"Elunes Segen\")', '');
INSERT INTO `transports` VALUES ('10', '181688', 'Hafen von Menethil, Sumpfland und Valgarde, Der heulende Fjord (\"Nordspeer\")', '');
INSERT INTO `transports` VALUES ('11', '181689', 'Unterstadt, Tirisfal und Hafe der Vergeltung, Der heulende Fjord (\"Die Wolkenkuss\")', '');
INSERT INTO `transports` VALUES ('12', '186238', 'Orgrimmar, Durotar und Kriegshymnenfeste, Boreanische Tundra (\"Die Windesmacht\")', '');
INSERT INTO `transports` VALUES ('13', '186371', 'Westwacht im heulende Fjord zum Bombardieren der Piraten (\"Zeppelin\")', '');
INSERT INTO `transports` VALUES ('14', '187038', 'Nicht besteigbar - Kreist im heulende Fjord (\"Gnädige Schwester\")', '');
INSERT INTO `transports` VALUES ('15', '187568', 'Unu\'pe, Boreanische Tundra und Hafen Moa\'ki, Drachenöde (\"Wellenreiter\")', '');
INSERT INTO `transports` VALUES ('16', '188511', 'Hafen Moa\'ki und Kamagua (\"Grüne Insel\")', '');
INSERT INTO `transports` VALUES ('17', '190536', 'Hafen von Sturmwind and Valianzfeste, Boreanische Tundra (\"Die Kraken\")', '');
INSERT INTO `transports` VALUES ('18', '192241', 'Nicht besteigbar - Kriegsschiff der Horde patroulliert über Eiskrone (\"Orgrims Hammer\")', '');
INSERT INTO `transports` VALUES ('19', '192242', 'Nicht besteigbar - Kriegsschiff der Allianz patroulliert über Eiskrone (\"Die Himmelsteiler\")', '');
INSERT INTO `transports` VALUES ('20', '190549', 'Orgrimmar, Durotar und Donnerfels, Mulgore (\"Die Zephyr\")', '');
