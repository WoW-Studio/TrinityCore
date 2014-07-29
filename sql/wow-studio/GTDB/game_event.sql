SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `game_event`
-- ----------------------------
DROP TABLE IF EXISTS `game_event`;
CREATE TABLE `game_event` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint(3) unsigned DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_event
-- ----------------------------
INSERT INTO `game_event` VALUES ('1', '2013-06-21 01:01:00', '2020-12-31 06:00:00', '525600', '20160', '341', 'Sonnenwendfest', '0', '2');
INSERT INTO `game_event` VALUES ('2', '2013-12-15 07:00:00', '2020-12-31 06:00:00', '525600', '25920', '141', 'Winterhauchfest', '0', '2');
INSERT INTO `game_event` VALUES ('3', '2013-02-03 01:01:00', '2020-12-31 06:00:00', '131040', '8639', '376', 'Dunkelmond-Jahrmarkt (Wälder von Terokkar)', '0', '2');
INSERT INTO `game_event` VALUES ('4', '2013-03-03 01:01:00', '2020-12-31 06:00:00', '131040', '8639', '374', 'Dunkelmond-Jahrmarkt (Wald von Elwynn)', '0', '2');
INSERT INTO `game_event` VALUES ('5', '2013-01-06 01:01:00', '2020-12-31 06:00:00', '131040', '8639', '375', 'Dunkelmond-Jahrmarkt (Mulgore)', '0', '2');
INSERT INTO `game_event` VALUES ('6', '2010-01-01 07:00:00', '2020-12-31 06:00:00', '525600', '120', '0', 'Neujahr', '0', '2');
INSERT INTO `game_event` VALUES ('7', '2013-01-27 01:01:00', '2020-12-31 06:00:00', '525600', '20160', '327', 'Mondfest', '0', '2');
INSERT INTO `game_event` VALUES ('8', '2013-02-10 01:01:00', '2020-12-31 06:00:00', '525600', '20160', '423', 'Liebe liegt in der Luft ', '0', '2');
INSERT INTO `game_event` VALUES ('9', '2014-04-20 00:01:00', '2020-12-31 06:00:00', '524160', '10080', '181', 'Nobelgartenfest', '0', '2');
INSERT INTO `game_event` VALUES ('10', '2012-04-29 00:01:00', '2020-12-31 06:00:00', '525600', '10080', '201', 'Kinderwoche', '0', '2');
INSERT INTO `game_event` VALUES ('11', '2013-09-13 01:01:00', '2020-12-31 06:00:00', '525600', '10080', '321', 'Erntedankfest', '0', '2');
INSERT INTO `game_event` VALUES ('12', '2013-10-18 02:00:00', '2020-12-31 06:00:00', '525600', '20160', '324', 'Schlotternächte', '0', '2');
INSERT INTO `game_event` VALUES ('22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '525600', '1', '0', 'Krieg von Ahn\'Qiraj', '0', '2');
INSERT INTO `game_event` VALUES ('17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '525600', '1', '0', 'Invasion der Geißel', '0', '2');
INSERT INTO `game_event` VALUES ('13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '525600', '1', '0', 'Invasion der Elementare', '0', '2');
INSERT INTO `game_event` VALUES ('14', '2012-01-01 01:00:00', '2020-12-31 06:00:00', '10080', '1440', '0', 'Anglerwettbewerb im Schlingendorntal Aufruf', '0', '2');
INSERT INTO `game_event` VALUES ('16', '2007-08-05 05:00:00', '2020-12-31 06:00:00', '180', '120', '0', 'Gurubashiarena', '0', '2');
INSERT INTO `game_event` VALUES ('15', '2012-01-01 15:00:00', '2020-12-31 06:00:00', '10080', '120', '301', 'Anglerwettbewerb im Schlingendorntal', '0', '2');
INSERT INTO `game_event` VALUES ('18', '2010-05-07 08:00:00', '2020-12-31 06:00:00', '60480', '6240', '283', 'Ruf zu den Waffen: Alteractal!', '0', '2');
INSERT INTO `game_event` VALUES ('19', '2010-04-02 08:00:00', '2020-12-31 06:00:00', '60480', '6240', '284', 'Ruf zu den Waffen: Kriegshymnenschlucht!', '0', '2');
INSERT INTO `game_event` VALUES ('20', '2010-04-23 08:00:00', '2020-12-31 06:00:00', '60480', '6240', '285', 'Ruf zu den Waffen: Arathibecken!', '0', '2');
INSERT INTO `game_event` VALUES ('21', '2010-04-30 08:00:00', '2020-12-31 06:00:00', '60480', '6240', '353', 'Ruf zu den Waffen: Auge des Sturms!', '0', '2');
INSERT INTO `game_event` VALUES ('23', '2011-03-03 01:01:00', '2020-12-31 06:00:00', '131040', '4320', '0', 'Dunkelmond-Jahrmarkt wird aufgebaut (Wald von Elwynn)', '0', '2');
INSERT INTO `game_event` VALUES ('24', '2013-09-20 01:01:00', '2020-12-31 06:00:00', '525600', '21600', '372', 'Braufest', '0', '2');
INSERT INTO `game_event` VALUES ('25', '2008-01-02 22:00:00', '2020-12-31 06:00:00', '1440', '720', '0', 'Nacht beginnt', '0', '2');
INSERT INTO `game_event` VALUES ('27', '2008-03-24 06:00:00', '2020-12-31 06:00:00', '86400', '21600', '0', 'Rand des Wahnsinns, Gri\'lek', '0', '2');
INSERT INTO `game_event` VALUES ('28', '2008-04-07 07:00:00', '2020-12-31 06:00:00', '86400', '21600', '0', 'Rand des Wahnsinns, Hazza\'rah', '0', '2');
INSERT INTO `game_event` VALUES ('29', '2008-04-21 07:00:00', '2020-12-31 06:00:00', '86400', '21600', '0', 'Rand des Wahnsinns, Renataki', '0', '2');
INSERT INTO `game_event` VALUES ('30', '2008-05-05 07:00:00', '2020-12-31 06:00:00', '86400', '21600', '0', 'Rand des Wahnsinns, Wushoolay', '0', '2');
INSERT INTO `game_event` VALUES ('31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arenaturnier', '0', '2');
INSERT INTO `game_event` VALUES ('32', '2008-05-15 21:00:00', '2020-01-01 08:00:00', '10080', '5', '0', 'L70ETC Konzert', '0', '2');
INSERT INTO `game_event` VALUES ('52', '2010-12-25 06:00:00', '2020-12-31 06:00:00', '525600', '11700', '0', 'Winter Veil: Gifts', '0', '2');
INSERT INTO `game_event` VALUES ('51', '2013-11-01 02:00:00', '2020-12-31 06:00:00', '525600', '2820', '409', 'Tag der Toten', '0', '2');
INSERT INTO `game_event` VALUES ('48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Wintergrasp Allianz Verteidigung', '5', '2');
INSERT INTO `game_event` VALUES ('49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Wintergrasp Horde Verteidigung', '5', '2');
INSERT INTO `game_event` VALUES ('53', '2010-04-09 08:00:00', '2020-12-31 10:00:00', '60480', '6240', '400', 'Ruf zu den Waffen: Strand der Uralten', '0', '2');
INSERT INTO `game_event` VALUES ('55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arena Season 3', '0', '2');
INSERT INTO `game_event` VALUES ('56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arena Season 4', '0', '2');
INSERT INTO `game_event` VALUES ('57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arena Season 5', '0', '2');
INSERT INTO `game_event` VALUES ('58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arena Season 6', '0', '2');
INSERT INTO `game_event` VALUES ('59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arena Season 7', '0', '2');
INSERT INTO `game_event` VALUES ('60', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5184000', '2592000', '0', 'Arena Season 8', '0', '2');
INSERT INTO `game_event` VALUES ('54', '2010-04-16 08:00:00', '2020-12-31 10:00:00', '60480', '6240', '420', 'Ruf zu den Waffen: Insel der Eroberung!', '0', '2');
INSERT INTO `game_event` VALUES ('50', '2013-09-19 01:01:00', '2020-12-31 05:00:00', '525600', '1440', '398', 'Piratentag', '0', '2');
INSERT INTO `game_event` VALUES ('61', '2010-09-07 01:00:00', '2010-10-10 01:00:00', '9999999', '47520', '0', 'Zalazanes Sturz', '0', '2');
INSERT INTO `game_event` VALUES ('62', '2012-01-01 15:00:00', '2020-12-31 06:00:00', '10080', '180', '0', 'Anglerwettbewerb im Schlingendorntal', '0', '2');
INSERT INTO `game_event` VALUES ('63', '2012-01-07 14:00:00', '2020-12-31 06:00:00', '10080', '180', '424', 'Angelwettstreit der Kalu\'ak', '0', '2');
INSERT INTO `game_event` VALUES ('64', '2012-01-07 15:00:00', '2020-12-31 06:00:00', '10080', '60', '0', 'Angelwettstreit der Kalu\'ak', '0', '2');
INSERT INTO `game_event` VALUES ('26', '2013-11-24 02:00:00', '2020-12-31 06:00:00', '525600', '10020', '404', 'Nobelgartenfest', '0', '2');
INSERT INTO `game_event` VALUES ('33', '2011-03-22 00:10:00', '2020-03-22 00:00:00', '30', '5', '0', 'Dalaran: Minigob', '0', '2');
