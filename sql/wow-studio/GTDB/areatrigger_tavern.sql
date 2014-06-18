/*
Navicat MySQL Data Transfer

Source Server         : Gods of Nation
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : world335pve

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2014-06-17 07:10:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `areatrigger_tavern`
-- ----------------------------
DROP TABLE IF EXISTS `areatrigger_tavern`;
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- ----------------------------
-- Records of areatrigger_tavern
-- ----------------------------
INSERT INTO `areatrigger_tavern` VALUES ('71', 'Westfall - Späherkuppe Gasthaus');
INSERT INTO `areatrigger_tavern` VALUES ('562', 'Der Wald von Elwynn - Goldhain - Gasthaus zur Höhle des Löwen');
INSERT INTO `areatrigger_tavern` VALUES ('682', 'Das Rotkammgebirge - Rathaus von Seenhain');
INSERT INTO `areatrigger_tavern` VALUES ('707', 'Dämmerwald - Dunkelhain - Taverne Zum roten Raben');
INSERT INTO `areatrigger_tavern` VALUES ('708', 'Vorgebirge des Hügellands - Rathaus von Süderstade');
INSERT INTO `areatrigger_tavern` VALUES ('709', 'Die Düstermarschen - Die Insel Theramore');
INSERT INTO `areatrigger_tavern` VALUES ('710', 'Dun Morogh - Kharanos - Brauerei Donnerbräu');
INSERT INTO `areatrigger_tavern` VALUES ('712', 'Loch Modan - Thelsamar - Gasthof zum Starkbierlager');
INSERT INTO `areatrigger_tavern` VALUES ('713', 'Das Sumpfland - Hafen von Menethil - Tiefenwassertaverne');
INSERT INTO `areatrigger_tavern` VALUES ('715', 'Teldrassil - Dolanaar');
INSERT INTO `areatrigger_tavern` VALUES ('716', 'Dunkelküste - Auberdine');
INSERT INTO `areatrigger_tavern` VALUES ('717', 'Eschental - Astranaar');
INSERT INTO `areatrigger_tavern` VALUES ('719', 'Tirisfal - Brill - Taverne Zur Galgenschlinge');
INSERT INTO `areatrigger_tavern` VALUES ('720', 'Silberwald ');
INSERT INTO `areatrigger_tavern` VALUES ('721', 'Vorgebirge des Hügellands ');
INSERT INTO `areatrigger_tavern` VALUES ('722', 'Mulgore ');
INSERT INTO `areatrigger_tavern` VALUES ('742', 'Das Brachland ');
INSERT INTO `areatrigger_tavern` VALUES ('743', 'Das Brachland ');
INSERT INTO `areatrigger_tavern` VALUES ('843', 'Durotar ');
INSERT INTO `areatrigger_tavern` VALUES ('844', 'Die Sümpfe des Elends ');
INSERT INTO `areatrigger_tavern` VALUES ('862', 'Schlingendorntal ');
INSERT INTO `areatrigger_tavern` VALUES ('982', 'Das Brachland ');
INSERT INTO `areatrigger_tavern` VALUES ('4241', 'Blutmythosinsel - Gasthaus der Blutwacht');
INSERT INTO `areatrigger_tavern` VALUES ('1022', 'Das Steinkrallengebirge ');
INSERT INTO `areatrigger_tavern` VALUES ('1023', 'Tanaris ');
INSERT INTO `areatrigger_tavern` VALUES ('1024', 'Feralas ');
INSERT INTO `areatrigger_tavern` VALUES ('1025', 'Feralas ');
INSERT INTO `areatrigger_tavern` VALUES ('1606', 'Das Ödland ');
INSERT INTO `areatrigger_tavern` VALUES ('1646', 'Das Arathi Hochland ');
INSERT INTO `areatrigger_tavern` VALUES ('2266', 'Desolace ');
INSERT INTO `areatrigger_tavern` VALUES ('2267', 'Desolace ');
INSERT INTO `areatrigger_tavern` VALUES ('2286', 'Tausend Nadeln ');
INSERT INTO `areatrigger_tavern` VALUES ('2287', 'Winterquell ');
INSERT INTO `areatrigger_tavern` VALUES ('2610', 'Eschental ');
INSERT INTO `areatrigger_tavern` VALUES ('2786', 'Sturmwind backup rest');
INSERT INTO `areatrigger_tavern` VALUES ('4108', 'Gasthaus von Tristessa');
INSERT INTO `areatrigger_tavern` VALUES ('4240', 'Gasthaus der Azurwacht');
INSERT INTO `areatrigger_tavern` VALUES ('4336', 'Gasthaus von Thrallmar');
INSERT INTO `areatrigger_tavern` VALUES ('4337', 'Gasthaus der Ehrenfeste');
INSERT INTO `areatrigger_tavern` VALUES ('4373', 'Gasthaus von Zabra\'Jin');
INSERT INTO `areatrigger_tavern` VALUES ('4375', 'Gasthaus von Garadar');
INSERT INTO `areatrigger_tavern` VALUES ('4376', 'Gasthaus von Telaar');
INSERT INTO `areatrigger_tavern` VALUES ('4377', 'Gasthaus von Allerias Feste');
INSERT INTO `areatrigger_tavern` VALUES ('4382', 'Zuflucht des Cenarius');
INSERT INTO `areatrigger_tavern` VALUES ('4486', 'Gasthaus des Falkenplatzes');
INSERT INTO `areatrigger_tavern` VALUES ('4526', 'Gasthaus von Schattenmond');
INSERT INTO `areatrigger_tavern` VALUES ('4528', 'Gasthaus der Wildhammerfeste');
INSERT INTO `areatrigger_tavern` VALUES ('4595', 'Gasthaus von Mok\'Nathal');
INSERT INTO `areatrigger_tavern` VALUES ('4607', 'Gasthaus des Sanktums der Sterne');
INSERT INTO `areatrigger_tavern` VALUES ('4374', 'Gasthaus von Telredor');
INSERT INTO `areatrigger_tavern` VALUES ('4383', 'Gasthaus der Oreborzuflucht');
INSERT INTO `areatrigger_tavern` VALUES ('4381', 'Gasthaus des Temples von Thelamat');
INSERT INTO `areatrigger_tavern` VALUES ('4499', 'Gasthaus von Sylvanaar');
INSERT INTO `areatrigger_tavern` VALUES ('4558', 'Gasthaus von Toshleys Station');
INSERT INTO `areatrigger_tavern` VALUES ('4494', 'Gasthaus der Donnerfeste');
INSERT INTO `areatrigger_tavern` VALUES ('4640', 'Gasthaus des Ewigen Hains');
INSERT INTO `areatrigger_tavern` VALUES ('4521', 'Gasthaus der Area 52');
INSERT INTO `areatrigger_tavern` VALUES ('4555', 'Gasthaus der Sturmsäule');
INSERT INTO `areatrigger_tavern` VALUES ('4577', 'Gasthaus des Altars der Sha\'tar');
INSERT INTO `areatrigger_tavern` VALUES ('178', 'Strahnbrad');
INSERT INTO `areatrigger_tavern` VALUES ('1042', 'Burg Wildhammer');
INSERT INTO `areatrigger_tavern` VALUES ('3690', 'Dorf der Bruchhauer');
INSERT INTO `areatrigger_tavern` VALUES ('3886', 'Basislager von Grom\'gol');
INSERT INTO `areatrigger_tavern` VALUES ('4058', 'Kapelle des hoffnungsvollen Lichts');
INSERT INTO `areatrigger_tavern` VALUES ('3985', 'Burg Cenarius');
INSERT INTO `areatrigger_tavern` VALUES ('4090', 'Der Steinkrallengipfel');
INSERT INTO `areatrigger_tavern` VALUES ('3547', 'Unterstadt');
INSERT INTO `areatrigger_tavern` VALUES ('4769', 'Eisenschmiede');
INSERT INTO `areatrigger_tavern` VALUES ('4714', 'Gasthaus des Morastwinkels');
INSERT INTO `areatrigger_tavern` VALUES ('4775', 'Gasthaus von Brackenwall');
INSERT INTO `areatrigger_tavern` VALUES ('4847', 'Insel von Quel\'Danas, Gasthof beim Hafen der Sonnenweiten');
INSERT INTO `areatrigger_tavern` VALUES ('4961', 'Gashaus der Valianzfeste');
INSERT INTO `areatrigger_tavern` VALUES ('4867', 'Gasthaus der Landebahn Kurbelzisch');
INSERT INTO `areatrigger_tavern` VALUES ('4977', 'Gasthaus von Unu\'pe');
INSERT INTO `areatrigger_tavern` VALUES ('4868', 'Gasthaus von Taunka\'le');
INSERT INTO `areatrigger_tavern` VALUES ('4910', 'Kriegshymnenfeste');
INSERT INTO `areatrigger_tavern` VALUES ('4861', 'Gasthaus des Außenpostens Bor\'gorok');
INSERT INTO `areatrigger_tavern` VALUES ('4755', 'Gasthaus des Lagers der Winterhufe');
INSERT INTO `areatrigger_tavern` VALUES ('4756', 'Gasthaus von Fort Wildervar');
INSERT INTO `areatrigger_tavern` VALUES ('5045', 'Agmars Hammer');
INSERT INTO `areatrigger_tavern` VALUES ('4964', 'Sternruh');
INSERT INTO `areatrigger_tavern` VALUES ('4965', 'Gasthaus der Ammertannhütte');
INSERT INTO `areatrigger_tavern` VALUES ('4966', 'Lager der Westfallbrigade');
INSERT INTO `areatrigger_tavern` VALUES ('4967', 'Camp Oneqwah');
INSERT INTO `areatrigger_tavern` VALUES ('4970', 'Burg Siegeswall');
INSERT INTO `areatrigger_tavern` VALUES ('4975', 'Hafen Moa\'ki');
INSERT INTO `areatrigger_tavern` VALUES ('4976', 'Kamagua');
INSERT INTO `areatrigger_tavern` VALUES ('4979', 'Gallgrimm');
INSERT INTO `areatrigger_tavern` VALUES ('4993', 'Feste Wintergarde');
INSERT INTO `areatrigger_tavern` VALUES ('5030', 'Lager der Speerträger');
INSERT INTO `areatrigger_tavern` VALUES ('5062', 'Argentumstrand');
INSERT INTO `areatrigger_tavern` VALUES ('5164', 'Zim\'Torga');
INSERT INTO `areatrigger_tavern` VALUES ('5182', 'Eisfestung');
INSERT INTO `areatrigger_tavern` VALUES ('5183', 'K3');
INSERT INTO `areatrigger_tavern` VALUES ('5200', 'Brunnhildar');
INSERT INTO `areatrigger_tavern` VALUES ('5204', 'Bergfels\' Zuflucht');
INSERT INTO `areatrigger_tavern` VALUES ('5217', 'Nesingwarys Basislager');
INSERT INTO `areatrigger_tavern` VALUES ('5227', 'Argentumvorhut');
INSERT INTO `areatrigger_tavern` VALUES ('5323', 'Camp Tunka\'lo');
INSERT INTO `areatrigger_tavern` VALUES ('5327', 'Krasus\' Landeplatz');
INSERT INTO `areatrigger_tavern` VALUES ('4753', 'Gasthaus der Westwacht');
INSERT INTO `areatrigger_tavern` VALUES ('4265', 'Gasthaus der Morgenluft');
INSERT INTO `areatrigger_tavern` VALUES ('98', 'Nesingwarys Expedition');
INSERT INTO `areatrigger_tavern` VALUES ('4109', 'Oberes Gasthaus von Tristessa');
INSERT INTO `areatrigger_tavern` VALUES ('4300', 'Gasthaus der Zuflucht der Cenarius');
INSERT INTO `areatrigger_tavern` VALUES ('4378', 'Gasthaus der Steinbrecherfeste');
INSERT INTO `areatrigger_tavern` VALUES ('4380', 'Gasthaus der Falkenwacht');
INSERT INTO `areatrigger_tavern` VALUES ('4498', 'Gasthaus des Vorgebirges des alten Hügellands');
INSERT INTO `areatrigger_tavern` VALUES ('4608', 'Oberes Gasthaus des Sanktums der Sterne');
INSERT INTO `areatrigger_tavern` VALUES ('5314', 'Wyrmruhtempel');
INSERT INTO `areatrigger_tavern` VALUES ('5315', 'Wyrmruhtempel');
INSERT INTO `areatrigger_tavern` VALUES ('5316', 'Wyrmruhtempel');
INSERT INTO `areatrigger_tavern` VALUES ('5317', 'Wyrmruhtempel');
INSERT INTO `areatrigger_tavern` VALUES ('5360', 'Grom\'arsh Crash-Site');
