/*
Navicat MySQL Data Transfer

Source Server         : Gods of Nation
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : world335pve

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2014-06-17 07:11:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `locales_creature_text`
-- ----------------------------
DROP TABLE IF EXISTS `locales_creature_text`;
CREATE TABLE `locales_creature_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY (`entry`,`groupid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of locales_creature_text
-- ----------------------------
