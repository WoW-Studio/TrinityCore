ALTER TABLE `command` CHANGE COLUMN `security` `permission` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `name`;

-- ----------------------------
-- Table structure for spell_custom_attr
-- ----------------------------
DROP TABLE IF EXISTS `spell_custom_attr`;
CREATE TABLE `spell_custom_attr` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell id',
  `attributes` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCustomAttributes',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SpellInfo custom attributes';

-- ----------------------------
-- Table structure for spell_phase
-- ----------------------------
DROP TABLE IF EXISTS `spell_phase`;
CREATE TABLE `spell_phase` (
  `id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `phasemask` bigint(20) unsigned NOT NULL DEFAULT '1',
  `terrainswapmap` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `reputation_reward_rate` ADD `quest_repeatable_rate` FLOAT NOT NULL DEFAULT '1' AFTER `quest_monthly_rate`;

ALTER TABLE creature_classlevelstats ADD attackpower SMALLINT(6) DEFAULT 0 NOT NULL;
ALTER TABLE creature_classlevelstats ADD rangedattackpower SMALLINT(6) DEFAULT 0 NOT NULL;
ALTER TABLE creature_classlevelstats ADD damage_base FLOAT DEFAULT 0 NOT NULL;
ALTER TABLE creature_classlevelstats ADD damage_exp1 FLOAT DEFAULT 0 NOT NULL;
ALTER TABLE creature_classlevelstats ADD damage_exp2 FLOAT DEFAULT 0 NOT NULL;
ALTER TABLE creature_classlevelstats ADD damage_exp3 FLOAT DEFAULT 0 NOT NULL;
ALTER TABLE creature_classlevelstats ADD `comment` BLOB;

ALTER TABLE `creature_questrelation` RENAME `creature_queststarter`;
ALTER TABLE `creature_involvedrelation` RENAME `creature_questender`;
ALTER TABLE `gameobject_questrelation` RENAME `gameobject_queststarter`;
ALTER TABLE `gameobject_involvedrelation` RENAME `gameobject_questender`;

UPDATE `command` SET
    `name` = 'reload gameobject_queststarter',
    `help` = 'Syntax: .reload gameobject_queststarter\nReload gameobject_queststarter table.'
WHERE
    `name` = 'reload gameobject_questrelation';

UPDATE `command` SET
    `name` = 'reload gameobject_questender',
    `help` = 'Syntax: .reload gameobject_questender\nReload gameobject_questender table.'
WHERE
    `name` = 'reload gameobject_questrelation';

UPDATE `command` SET
    `name` = 'reload creature_queststarter',
    `help` = 'Syntax: .reload creature_queststarter\nReload creature_queststarter table.'
WHERE
    `name` = 'reload creature_questrelation';

UPDATE `command` SET
    `name` = 'reload creature_questender',
    `help` = 'Syntax: .reload creature_questender\nReload creature_questender table.'
WHERE
    `name` = 'reload creature_involvedrelation';
	
-- Add new collum in the access_requirement table.
ALTER TABLE `access_requirement` ADD COLUMN `item_level` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `level_max`;

-- All WotLK Heroics require at least an average item level of 180.
UPDATE `access_requirement` SET `item_level`=180 WHERE `mapId` IN (574, 575, 576, 578, 595, 599, 600, 601, 602, 604, 608, 619) AND `difficulty`=1;
-- Trial of the Champion, Pit of Saron, and the Forge of Souls require an average item level of 200.
UPDATE `access_requirement` SET `item_level`=200 WHERE `mapId` IN (632, 650, 658);
-- Halls of Reflection requires an average item level of 219.
UPDATE `access_requirement` SET `item_level`=219 WHERE `mapId`=668;

ALTER TABLE `achievement_reward` ADD COLUMN `mailTemplate` MEDIUMINT(8) UNSIGNED NULL DEFAULT '0' AFTER `text`;

ALTER TABLE creature_formations ADD point_1 MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE creature_formations ADD point_2 MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0;

ALTER TABLE `phase_definitions` ADD COLUMN `phasemask` INT(10) UNSIGNED NULL DEFAULT '0' AFTER `phaseGroup`;
ALTER TABLE `phase_definitions` ADD COLUMN `terrainswapmap` INT(10) UNSIGNED NULL DEFAULT '0' AFTER `phasemask`;
ALTER TABLE `phase_definitions` ADD COLUMN `flags` INT(10) UNSIGNED NULL DEFAULT '0' AFTER `terrainswapmap`;