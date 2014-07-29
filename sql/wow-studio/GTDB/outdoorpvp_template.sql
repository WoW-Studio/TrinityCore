SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `outdoorpvp_template`
-- ----------------------------
DROP TABLE IF EXISTS `outdoorpvp_template`;
CREATE TABLE `outdoorpvp_template` (
  `TypeId` tinyint(3) unsigned NOT NULL,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `comment` text,
  PRIMARY KEY (`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='OutdoorPvP Templates';

-- ----------------------------
-- Records of outdoorpvp_template
-- ----------------------------
INSERT INTO `outdoorpvp_template` VALUES ('1', 'outdoorpvp_hp', 'Höllenfeuerhalbinsel');
INSERT INTO `outdoorpvp_template` VALUES ('2', 'outdoorpvp_na', 'Nagrand');
INSERT INTO `outdoorpvp_template` VALUES ('3', 'outdoorpvp_tf', 'Wälder von Terokkar');
INSERT INTO `outdoorpvp_template` VALUES ('4', 'outdoorpvp_zm', 'Zangarmarschen');
INSERT INTO `outdoorpvp_template` VALUES ('5', 'outdoorpvp_si', 'Silithus');
INSERT INTO `outdoorpvp_template` VALUES ('6', 'outdoorpvp_ep', 'Östliche Pestländer');
