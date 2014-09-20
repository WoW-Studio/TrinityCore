SET @CGuid := 213234;

-- Marnak
DELETE FROM `creature` WHERE `id` IN(30897, 30898, 30899);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGuid+1, 30897, 599, 1, 1, 0, 0, 895.933, 363.528, 219.338, 5.58505, 300, 0, 0, 17010, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGuid+2, 30897, 599, 1, 1, 0, 0, 891.69, 358.912, 219.338, 5.42797, 300, 0, 0, 17010, 0, 0, 0, 0, 0, 0);

-- Kaddrak
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGuid+3, 30898, 599, 1, 1, 0, 0, 928, 331.276, 219.733, 1.8326, 300, 0, 0, 17010, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGuid+4, 30898, 599, 1, 1, 0, 0, 923.868, 326.964, 219.733, 2.53003, 300, 0, 0, 17010, 0, 0, 0, 0, 0, 0);

-- Abedneum
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGuid+5, 30899, 599, 1, 1, 0, 0, 892.55, 331.646, 223.868, 0.680678, 300, 0, 0, 17010, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES (@CGuid+6, 30899, 599, 1, 1, 0, 0, 896.91, 326.629, 223.868, 0.680678, 300, 0, 0, 17010, 0, 0, 0, 0, 0, 0);

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 51001;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 51001, 0, 0, 31, 0, 3, 30897, 0, 0, 0, 0, '', 'Spell 51001 (EFFECT_0) only hits Marnak');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 51136;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 51136, 0, 0, 31, 0, 3, 30899, 0, 0, 0, 0, '', 'Spell 51136 (EFFECT_0) only hits Abedneum');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 59867;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 59867, 0, 0, 31, 0, 3, 30899, 0, 0, 0, 0, '', 'Spell 59867 (EFFECT_0) only hits Abedneum - Heroic');

-- Dark Matter
UPDATE `creature_template` SET `ScriptName` = 'npc_dark_matter';

-- Abedneum (creature_template)
UPDATE `creature_template` SET `InhabitType` = 4, `flags_extra` = 130 WHERE `entry` = 30899;