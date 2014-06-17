/* 11343 - The Echo of Ymiron /*/
-- Object Spawn from sniff
SET @OGUID=9331858; -- need 1
SET @CGUID=9331874; -- need 16

-- Creature/GO Spawns from sniff
DELETE FROM `creature` WHERE `id` IN (24314,24315,24248,24327,23935);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@CGUID+0,24314,571,1,2,0,0,1073.562,-5029.705,9.805857,4.660029,300,0,0,5158,0,0,0,0,0), -- Ancient Male Vrykul
(@CGUID+1,24315,571,1,2,0,0,1074.889,-5033.892,9.711858,3.036873,300,0,0,5158,0,0,0,0,0), -- Ancient Female Vrykul
(@CGUID+2,24248,571,1,2,0,0,1054.514,-4918.391,10.14754,3.263766,300,0,0,1,0,0,0,0,0), -- The Lich King
(@CGUID+3,24327,571,1,2,0,0,1055.667,-4924.913,16.54569,3.281219,300,0,0,1,0,0,0,0,0), -- Val'kyr Soulclaimer
(@CGUID+4,24327,571,1,2,0,0,1054.277,-4909.997,16.50003,3.263766,300,0,0,1,0,0,0,0,0), -- Val'kyr Soulclaimer
(@CGUID+5,23935,571,1,2,0,0,927.0462,-4925.752,4.78267,0.1288379,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+6,23935,571,1,2,0,0,1036.007,-4926.114,12.45767,5.548763,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+7,23935,571,1,2,0,0,1026.868,-4944.088,12.0571,0.7522717,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+8,23935,571,1,2,0,0,1028.676,-5012.598,13.78496,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+9,23935,571,1,2,0,0,910.7372,-4961.667,33.09615,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+10,23935,571,1,2,0,0,934.7177,-4890.745,34.57682,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+11,23935,571,1,2,0,0,970.6052,-4993.673,29.27757,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+12,23935,571,1,2,0,0,1006.246,-4868.183,47.70948,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+13,23935,571,1,2,0,0,1046.627,-4824.385,47.09693,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+14,23935,571,1,2,0,0,1068.264,-4965.238,47.55685,0.2954222,300,0,0,1,0,2,0,0,0), -- Val'kyr Watcher
(@CGUID+15,23935,571,1,2,0,0,1037.688,-4934.398,31.88609,0.2954222,300,0,0,1,0,2,0,0,0); -- Val'kyr Watcher
DELETE FROM `gameobject` WHERE `id`=186664;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID,186664,571,1,2,1073.001,-5033.952,9.771218,1.518436,0,0,0.6883545,0.7253745,300,0,1); -- Baby in Crib

-- SAI for Ancient Female Vrykul
DELETE FROM `creature_template_addon` WHERE `entry`=24315;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(24315,0,0,1,0,0, '');
UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`=`flags_extra`|2, `unit_flags`=`unit_flags`|768 WHERE `entry`=24314;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (24314);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=2431400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24314, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Male Vrykul - Set Passive'),
(24314, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Male Vrykul - Set Phase 1'),
(24314, 0, 2, 3, 38, 1, 100, 0, 0, 1, 0, 0, 80, 2431400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Male Vrykul - Start Script (Phase 1)'),
(24314, 0, 3, 0, 61, 1, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Male Vrykul - Set Phase 0 (Phase 1)'),
(2431400,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Anchient Male Speach 1'),
(2431400,9,1,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Anchient Male Speach 2'),
(2431400,9,2,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,10,@CGUID+1,24315,0,0,0,0,0, 'Anchient Female Speach 1'),
(2431400,9,3,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Anchient Male Speach 2'),
(2431400,9,4,0,0,0,100,0,3000,3000,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Anchient Male emote ONESHOT_POINT'),
(2431400,9,5,0,0,0,100,0,6000,6000,0,0,45,0,1,0,0,0,0,10,@CGUID+1,24315,0,0,0,0,0, 'Anchient Female start path'),
(2431400,9,6,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,10,@CGUID+1,24315,0,0,0,0,0, 'Anchient Female Speach 2'), -- check timing
(2431400,9,7,0,0,0,100,0,4000,4000,0,0,5,18,0,0,0,0,0,10,@CGUID+1,24315,0,0,0,0,0, 'Anchient Female emote ONESHOT_CRY'),
(2431400,9,8,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Anchient Male Speach 3'),
(2431400,9,9,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,10,@CGUID+1,24315,0,0,0,0,0, 'Anchient Female Speach 2'),
(2431400,9,10,0,0,0,100,0,3000,3000,0,0,11,43458,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Quest Credit'),
(2431400,9,11, 0, 0,0,100,0, 7000, 7000, 0, 0,45,0,2,0, 0, 0, 0,10,@CGUID+1,24315,0,0,0,0,0, 'Anchient Female resume path'),
(2431400,9,12,0,0,0,100,0,60000,60000,0,0,22,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Ancient Male Vrykul - Set Phase 1');

-- SAI for Ancient Female Vrykul
UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`=`flags_extra`|2, `unit_flags`=`unit_flags`|768 WHERE `entry`=24315;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=24315;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (2431500,2431501);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(24315,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - Set Passive'),
(24315,0,1,0,38,0,100,0,0,1,0,0,80,2431500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - On data set 0 1 run script'),
(24315,0,2,0,38,0,100,0,0,2,0,0,80,2431501,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - On data set 0 2 run script'),
(24315,0,3,4,40,0,100,0,1,24315,0,0,54,40000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - Pause at wp talk'),
(24315,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,9,24315,0,15,0,0,0,0, 'Ancient Female Vrykul - turn to Ancient Male Vrykul'),
(24315,0,5,6,40,0,100,0,2,24315,0,0,55,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - Stop at wp home'),
(24315,0,6,7,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - turn to pos'),
(24315,0,7,0,61,0,100,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - kneel'),
(2431500,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - data set 0 0'),
(2431500,9,1,0,0,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - stand'),
(2431500,9,2,0,0,0,100,0,0,0,0,0,53,0,24315,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - wp start'),
(2431501,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - data set 0 0'),
(2431501,9,1,0,0,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Female Vrykul - wp resume');
-- Waypoints for Ancient Female Vrykul from sniff
DELETE FROM `waypoints` WHERE `entry`=24315;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(24315,1,1074.016,-5031.822,9.726947,'talk point'),
(24315,2,1074.889,-5033.892,9.711858,'home point');

-- TriggerScript
DELETE FROM `areatrigger_scripts` WHERE `entry`=4778;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(4778, 'SmartTrigger');
DELETE FROM `smart_scripts` WHERE `entryorguid`=4778 AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(4778,2,0,0,46,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@CGUID,24314,0,0.0,0.0,0.0,0.0,"On Trigger - Set Data 0 1 - Ancient Male Vulkrul");

-- Spell Condition for 43458
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (43458);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,43458,0,18,1,0,0,0, '', 'Spell 43458 target player');

-- NPC Text from sniff
DELETE FROM `creature_text` WHERE `entry` IN (24314,24315);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(24314,0,0, 'So then we too are cursed?',12,0,100,1,0,0, 'Ancient Male Vrykul'),
(24314,1,0, 'Ancient Male Vrykul points to the infant.',16,0,100,25,0,0, 'Ancient Male Vrykul'),
(24315,0,0, 'Ancient Female Vrykul sobs.',16,0,100,18,0,0, 'Ancient Female Vrykul'),
(24314,2,0, 'The gods have forsaken us! We must dispose of it before Ymiron is notified!',12,0,100,53,0,0, 'Ancient Male Vrykul'),
(24315,1,0, 'NO! You cannot! I beg of you! It is our child!',12,0,100,20,0,0, 'Ancient Female Vrykul'),
(24314,3,0, 'Then what are we to do, wife? The others cannot find out. Should they learn of this aberration, we will all be executed.',12,0,100,1,0,0, 'Ancient Male Vrykul'),
(24315,2,0, 'I… I will hide it. I will hide it until I find it a home, far away from here…',12,0,100,66,0,0, 'Ancient Female Vrykul');

-- Update The Lich King
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33280 WHERE `entry`=24248;
DELETE FROM `creature_template_addon` WHERE `entry`=24248;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(24248,0,0,0,1,0, '41408 0');

-- Update Val'kyr Soulclaimer & Val'kyr Watcher InhabitType
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (24327,23935);

-- Pathing for Val'kyr Watcher Entry: 23935
SET @NPC := @CGUID+5;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,946.877,-4950.67,8.72458,0,0,0,100,0),
(@PATH,2,927.046,-4925.75,8.09321,0,0,0,100,0),
(@PATH,3,929.734,-4899.67,9.95518,0,0,0,100,0),
(@PATH,4,939.552,-4878.05,10.4938,0,0,0,100,0),
(@PATH,5,929.734,-4899.67,9.95518,0,0,0,100,0),
(@PATH,6,927.046,-4925.75,8.09321,0,0,0,100,0);
-- Pathing for Val'kyr Watcher Entry: 23935
SET @NPC := @CGUID+6;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1036.835,-4931.16,12.83267,0,0,0,100,0),
(@PATH,2,1036.007,-4926.114,12.45767,0,0,0,100,0),
(@PATH,3,1023.932,-4912.754,10.5369,0,0,0,100,0),
(@PATH,4,1000.253,-4901.448,7.911896,0,0,0,100,0),
(@PATH,5,1023.932,-4912.754,10.5369,0,0,0,100,0),
(@PATH,6,1036.007,-4926.114,12.45767,0,0,0,100,0);
-- Pathing for Val'kyr Watcher Entry: 23935
SET @NPC := @CGUID+7;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1026.697,-4942.586,11.8071,0,0,0,100,0),
(@PATH,2,1030.085,-4970.878,12.77823,0,0,0,100,0),
(@PATH,3,1034.023,-4972.842,13.0493,0,0,0,100,0),
(@PATH,4,1030.085,-4970.878,12.77823,0,0,0,100,0),
(@PATH,5,1026.868,-4944.088,12.0571,0,0,0,100,0);
-- Pathing for Val'kyr Watcher Entry: 23935
SET @NPC := @CGUID+8;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1103.122,-5055.239,13.92861,0,0,0,100,0),
(@PATH,2,1099.777,-5030.915,13.25463,0,0,0,100,0),
(@PATH,3,1088.535,-5001.179,13.00463,0,0,0,100,0),
(@PATH,4,1062.886,-4976.348,13.6743,0,0,0,100,0),
(@PATH,5,1044.221,-4979.022,13.7993,0,0,0,100,0),
(@PATH,6,1030.879,-4997.25,13.52823,0,0,0,100,0),
(@PATH,7,1028.676,-5012.598,13.78496,0,0,0,100,0),
(@PATH,8,1034.265,-5039.136,13.73875,0,0,0,100,0),
(@PATH,9,1045.199,-5071.371,13.72586,0,0,0,100,0),
(@PATH,10,1069.113,-5069.303,13.34213,0,0,0,100,0),
(@PATH,11,1091.871,-5063.042,13.38427,0,0,0,100,0);
-- Val'kyr Watcher Pathing
SET @NPC := @CGUID+9;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,919.0841,-4946.079,33.09615,0,0,0,100,0),
(@PATH,2,937.5836,-4953.232,30.76281,0,0,0,100,0),
(@PATH,3,936.755,-4970.46,30.76281,0,0,0,100,0),
(@PATH,4,929.6907,-4992.461,30.76281,0,0,0,100,0),
(@PATH,5,919.143,-5002.606,30.76281,0,0,0,100,0),
(@PATH,6,899.7684,-4997.275,30.76281,0,0,0,100,0),
(@PATH,7,894.8842,-4973.352,31.20726,0,0,0,100,0),
(@PATH,8,910.7372,-4961.667,33.09615,0,0,0,100,0);
SET @NPC := @CGUID+10;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,955.5239,-4883.864,28.91015,0,0,0,100,0),
(@PATH,2,975.0622,-4876.539,34.57682,0,0,0,100,0),
(@PATH,3,998.4828,-4882.556,34.57682,0,0,0,100,0),
(@PATH,4,1007.136,-4897.439,34.57682,0,0,0,100,0),
(@PATH,5,999.5431,-4915.003,34.57682,0,0,0,100,0),
(@PATH,6,977.8502,-4931.425,34.57682,0,0,0,100,0),
(@PATH,7,955.9329,-4951.924,34.57682,0,0,0,100,0),
(@PATH,8,932.5357,-4941.676,34.57682,0,0,0,100,0),
(@PATH,9,928.3145,-4926.969,35.49352,0,0,0,100,0),
(@PATH,10,934.7177,-4890.745,34.57682,0,0,0,100,0);
SET @NPC := @CGUID+11;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,985.4891,-4985.466,29.27757,0,0,0,100,0),
(@PATH,2,1003.236,-5007.198,29.27757,0,0,0,100,0),
(@PATH,3,1001.194,-5018.937,29.27757,0,0,0,100,0),
(@PATH,4,983.9544,-5038.578,29.27757,0,0,0,100,0),
(@PATH,5,965.2218,-5035.844,29.27757,0,0,0,100,0),
(@PATH,6,955.2875,-5023.462,29.27757,0,0,0,100,0),
(@PATH,7,964.6006,-5006.362,29.27757,0,0,0,100,0),
(@PATH,8,970.6052,-4993.673,29.27757,0,0,0,100,0);
SET @NPC := @CGUID+12;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,997.6531,-4837.691,50.98726,0,0,0,100,0),
(@PATH,2,978.2066,-4826.199,50.98726,0,0,0,100,0),
(@PATH,3,954.6121,-4846.288,50.98726,0,0,0,100,0),
(@PATH,4,915.1261,-4847.07,50.98726,0,0,0,100,0),
(@PATH,5,906.7595,-4877.092,50.98726,0,0,0,100,0),
(@PATH,6,911.5735,-4919.276,50.98726,0,0,0,100,0),
(@PATH,7,942.1261,-4946.08,42.51503,0,0,0,100,0),
(@PATH,8,978.0408,-4936.854,40.5428,0,0,0,100,0),
(@PATH,9,1002.55,-4900.139,38.45948,0,0,0,100,0),
(@PATH,10,1006.246,-4868.183,47.70948,0,0,0,100,0);
SET @NPC := @CGUID+13;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1022.976,-4810.128,38.31916,0,0,0,100,0),
(@PATH,2,996.8618,-4813.854,38.31916,0,0,0,100,0),
(@PATH,3,964.6756,-4838.639,38.31916,0,0,0,100,0),
(@PATH,4,940.3589,-4846.21,38.31916,0,0,0,100,0),
(@PATH,5,907.9418,-4846.479,34.20804,0,0,0,100,0),
(@PATH,6,887.7231,-4873.045,34.59694,0,0,0,100,0),
(@PATH,7,891.8184,-4898.238,30.04136,0,0,0,100,0),
(@PATH,8,912.4337,-4902.996,30.04136,0,0,0,100,0),
(@PATH,9,939.5068,-4887.826,30.04136,0,0,0,100,0),
(@PATH,10,961.7159,-4869.482,30.04136,0,0,0,100,0),
(@PATH,11,1005.307,-4881.67,30.04136,0,0,0,100,0),
(@PATH,12,1029.752,-4892.972,31.93025,0,0,0,100,0),
(@PATH,13,1067.775,-4894.65,39.06914,0,0,0,100,0),
(@PATH,14,1059.698,-4864.968,47.09693,0,0,0,100,0),
(@PATH,15,1060.522,-4845.491,47.09693,0,0,0,100,0),
(@PATH,16,1046.627,-4824.385,47.09693,0,0,0,100,0);
SET @NPC := @CGUID+14;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1044.91,-4980.383,47.55685,0,0,0,100,0),
(@PATH,2,1040.873,-5016.178,52.69574,0,0,0,100,0),
(@PATH,3,1054.767,-5042.476,52.69574,0,0,0,100,0),
(@PATH,4,1084.064,-5042.998,39.22352,0,0,0,100,0),
(@PATH,5,1106.236,-5031.327,39.22352,0,0,0,100,0),
(@PATH,6,1106.77,-4995.738,45.02908,0,0,0,100,0),
(@PATH,7,1086.711,-4972.376,47.55685,0,0,0,100,0),
(@PATH,8,1068.264,-4965.238,47.55685,0,0,0,100,0);
SET @NPC := @CGUID+15;
SET @PATH := @NPC*10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1066.911,-4940.557,48.88609,0,0,0,100,0),
(@PATH,2,1069.896,-4920.431,40.85831,0,0,0,100,0),
(@PATH,3,1057.342,-4903.877,40.85831,0,0,0,100,0),
(@PATH,4,1044.138,-4900.038,31.74721,0,0,0,100,0),
(@PATH,5,1023.748,-4899.741,28.21942,0,0,0,100,0),
(@PATH,6,1017.973,-4921.141,28.21942,0,0,0,100,0),
(@PATH,7,1037.688,-4934.398,31.88609,0,0,0,100,0);