UPDATE `creature_template` SET `InhabitType`= 7, `ScriptName`= "npc_grauf" WHERE `entry`= 26893;

-- Written by Carbenium
DELETE FROM `spell_target_position` WHERE `id` = 61790;
INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
('61790', '0', '575', '480.84', '-511.95', '104.72', '2.71');

-- Without this modification the Harpoondamage will be affected by players spellpower
DELETE FROM `spell_bonus_data` WHERE `entry` IN (56578);
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
(56578,0,0,0,0,'Skadi - Harpoondamage');

-- HC-Spells
DELETE FROM `spelldifficulty_dbc` WHERE `id` IN(50228, 47579);
INSERT INTO `spelldifficulty_dbc` VALUES ('50228', '50228', '59322', '0', '0');
INSERT INTO `spelldifficulty_dbc` VALUES ('47579', '47579', '60020', '0', '0');