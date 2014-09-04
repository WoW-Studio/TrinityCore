-- Plagueborn Horror SAI
SET @ENTRY := 36879;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,5000,5000,10000,10000,11,69581,0,0,0,0,0,5,0,0,0,0,0,0,0,"Plagueborn Horror - In Combat - Cast 'Pustulant Flesh' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,4,5000,5000,10000,10000,11,70273,0,0,0,0,0,5,0,0,0,0,0,0,0,"Plagueborn Horror - In Combat - Cast 'Pustulant Flesh' (Heroic Dungeon)"),
(@ENTRY,0,2,0,0,0,100,6,8000,8000,8000,8000,11,70274,0,0,0,0,0,5,0,0,0,0,0,0,0,"Plagueborn Horror - In Combat - Cast 'Toxic Waste' (Dungeon)"),
(@ENTRY,0,3,0,2,0,100,6,15,15,0,0,11,69582,0,0,0,0,0,1,0,0,0,0,0,0,0,"Plagueborn Horror - Between 15-15% Health - Cast 'Blight Bomb' (Dungeon)"),
(@ENTRY,0,4,5,1,0,100,0,0,0,120000,120000,11,58051,2,0,0,0,0,1,0,0,0,0,0,0,0,"Plagueborn Horror - Out of Combat - Cast 'Summon Scourge Package'"),
(@ENTRY,0,5,0,61,0,100,0,0,0,120000,120000,11,63413,2,0,0,0,0,9,30887,0,4,0,0,0,0,"Plagueborn Horror - Out of Combat - Cast 'Rope Beam'"),
(@ENTRY,0,6,0,4,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,30887,0,10,0,0,0,0,"Plagueborn Horror - On Aggro - Set Data 1 1"),
(@ENTRY,0,7,8,25,0,100,0,0,0,0,0,11,58051,2,0,0,0,0,1,0,0,0,0,0,0,0,"Plagueborn Horror - On Reset - Cast 'Summon Scourge Package'"),
(@ENTRY,0,8,0,25,0,100,0,0,0,0,0,11,63413,2,0,0,0,0,9,30887,0,5,0,0,0,0,"Plagueborn Horror - On Reset - Cast");

UPDATE `creature` SET `spawndist`=15, `MovementType`=1 WHERE `guid` IN (201981,  201833, 202236, 201903);
UPDATE `creature_template` SET `scale`=0.5 WHERE  `entry`=30887;

-- Scourge Package SAI
SET @ENTRY := 30887;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,29,3,40,0,0,0,0,7,0,0,0,0,0,0,0,"Scourge Package - On Just Summoned - Start Follow Invoker"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,87,@ENTRY*100+00,@ENTRY*100+01,@ENTRY*100+02,@ENTRY*100+03,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Just Summoned - Run Random Script"),
(@ENTRY,0,2,0,38,0,100,0,1,1,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Data Set 1 1 - Despawn In 1000 ms");

-- Actionlist SAI
SET @ENTRY := 3088700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,58016,2,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Script - Cast 'Scourge Package Visual'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Script - Set Faction 35");

-- Actionlist SAI
SET @ENTRY := 3088701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,58022,2,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Scourge Package Visual'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Script - Set Faction 35");

-- Actionlist SAI
SET @ENTRY := 3088702;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,58020,2,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Scourge Package Visual'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Script - Set Faction 35");

-- Actionlist SAI
SET @ENTRY := 3088703;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,58023,2,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Scourge Package Visual'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Package - On Script - Set Faction 35");

-- Fix Hunter Trainers offering Hunter quest to Rogues
UPDATE `quest_template` SET `RequiredClasses`=4 WHERE `id` IN (6721,6722);

UPDATE `smart_scripts` SET `event_param1`=30000, `event_param2`=60000,`event_param3`=0 WHERE `entryorguid`=17953 AND `source_type`=0 AND `id`=1;

-- Quest fix "Feeding Arngrim" id: 13046.

-- Arngrim the Insatiable
SET @ENTRY := 30425;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,11,0,100,1,0,0,0,0,46,3,0,0,0,0,0,19,30423,0,0,0.0,0.0,0.0,0.0,"Arngrim the Insatiable - Move Forward on spawn - quest: Feeding Arngrim"),
(@ENTRY,@SOURCETYPE,1,4,61,0,100,1,0,0,0,0,33,30421,0,0,0,0,0,17,0,20,0,0.0,0.0,0.0,0.0,"Arngrim the Insatiable - Quest Credit (no repeat) - quest: Feeding Arngrim"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,1,3000,3000,0,0,5,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Arngrim the Insatiable - Play Emote: attack unarmed"),
(@ENTRY,@SOURCETYPE,3,1,1,0,100,1,5000,5000,0,0,41,0,0,0,0,0,0,19,30423,0,0,0.0,0.0,0.0,0.0,"Arngrim the Insatiable - Force despawn Disembodied Jormungar (no repeat)"),
(@ENTRY,@SOURCETYPE,4,0,61,0,100,1,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Arngrim the Insatiable - Force Despawn himself at last (no repeat)");

-- Disembodied Jormungar
SET @ENTRY := 30423;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,1,0,2,0,100,1,0,20,0,0,11,56732,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Disembodied Jormungar - Between 0-20% Health summon Arngrim (no repeat)");

-- Roaming Jormungar
SET @ENTRY := 30422;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,1,56727,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Roaming Jormungar - Force despawn on spellhit (quest: Feeding Arngrim)"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,1,56727,0,0,0,12,30423,4,30000,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Roaming Jormungar - Summon Disembodied on spellhit (quest: Feeding Arngrim)");

-- Update unit_flags on npc Disembodied Jormungar
UPDATE creature_template AS ct SET ct.`unit_flags` = 0 WHERE ct.`entry` = 30423;

UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=30423;

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= 30422;

DELETE FROM `smart_scripts` WHERE `entryorguid` =30422;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(30422, 0, 0, 1, 8,  0, 100, 0, 56727, 0, 0, 0, 12, 30423, 1, 240000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Roaming Jormungar - On Spellhit - Spawn Disembodied Jormungar'),
(30422, 0, 1, 0,61,  0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Roaming Jormungar - Linked with Previous Event - Despawn');


UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= 30423;

DELETE FROM `smart_scripts` WHERE `entryorguid` =30423;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(30423, 0, 0, 0, 2,  0, 100, 1, 0, 30, 0, 0, 11, 56732, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On 30% HP - Summon Arngrim'),
(30423, 0, 1, 2,38,  0, 100, 0, 1, 1, 0, 0, 11, 56731, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On Spellhit - Cast Kill Credit'),
(30423, 0, 2, 0,61,  0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - Linked with Previous Event - Despawn');


UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= 30425;

DELETE FROM `smart_scripts` WHERE `entryorguid` =30425;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(30425, 0, 0, 0,11,  0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 19, 30423, 200, 0, 0, 0, 0, 0, 'Arngrim - On Spawn - Move to closest disembodied jormungar'),
(30425, 0, 1, 2, 1,  0, 100, 0, 10000, 10000, 30000, 30000, 45, 1, 1, 0, 0, 0, 0, 19, 30423, 20, 0, 0, 0, 0, 0, 'Arngrim - OOC - Cast Ping Jormungar'),
(30425, 0, 2, 0,61,  0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arngrim - OOC - Linked with Previous Event - Despawn After 5 seconds');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`IN(13,17) AND `SourceEntry`=56727;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,56727,0,0,31,1,3,30422,0,0,0, '', 'Arngrims Tooth only hits Roaming Jormungar'),
(13,0,56727,0,0,31,1,3,30422,0,0,0, '', 'Arngrims Tooth only hits Roaming Jormungar');
	
	-- Central Lightning Forge
SET @ENTRY := 30211;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,56275,0,0,0,33,30211,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"AI for Destroy the Forges! (ID: 12988)");

-- North Lightning Forge
SET @ENTRY := 30209;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,56275,0,0,0,33,30209,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"AI for Destroy The Forges! (ID:12988)");

-- South Lightning Forge
SET @ENTRY := 30212;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,56275,0,0,0,33,30212,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"AI for Destroy the Forges! (ID: 12988)");

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN(30209,30211,30212);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(30209,30211,30212) AND `source_type`=0;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(30209, 0, 0, 0, 8, 0, 100, 0, 56275, 0, 0, 0, 33, 30209, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'North Lightning Forge - On Spellhit "Bouldercrags Bomb" - Give Kill Credit'),
(30211, 0, 0, 0, 8, 0, 100, 0, 56275, 0, 0, 0, 33, 30211, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Central Lightning Forge - On Spellhit "Bouldercrags Bomb" - Give Kill Credit'),
(30212, 0, 0, 0, 8, 0, 100, 0, 56275, 0, 0, 0, 33, 30212, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'South Lightning Forge - On Spellhit "Bouldercrags Bomb" - Give Kill Credit');

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN(95645,96491,96864);
