-- Quest Maennchen oder Weibchen <http://de.wowhead.com/quest=13549>

-- creature_template richtige unit_flags setzen
UPDATE `creature_template` SET `unit_flags`= 0 WHERE `entry` IN(29319, 33007, 33008);

-- Icepaw Bear

-- Actionlist SAI
SET @ENTRY := 2931900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,52742,2,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Cast 'Sleep'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Set Faction 35"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Set Npc Flag Gossip"),
(@ENTRY,9,3,0,0,0,100,0,25000,25000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Evade"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Set Event Phase 0");

-- Female Icepaw Bear SAI
SET @ENTRY := 33011;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,30000,30000,0,0,36,29319,0,0,0,0,0,1,0,0,0,0,0,0,0,"Female Icepaw Bear - Out of Combat - Update Template To 'Icepaw Bear'");

-- Male Icepaw Bear SAI
SET @ENTRY := 33008;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,9000,11000,11,54632,0,0,0,0,0,2,0,0,0,0,0,0,0,"Male Icepaw Bear - In Combat - Cast 'Claws of Ice'"),
(@ENTRY,0,1,0,1,0,100,0,0,0,0,0,36,29319,0,0,0,0,0,1,0,0,0,0,0,0,0,"Male Icepaw Bear - Out of Combat - Update Template To 'Icepaw Bear'");


-- Frost Leopard

-- Actionlist SAI
SET @ENTRY := 2932700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,52742,2,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Cast 'Sleep'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Set Faction 35"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Set Npc Flag Gossip"),
(@ENTRY,9,3,0,0,0,100,0,25000,25000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Evade"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Set Event Phase 0");

-- Female Frost Leopard SAI
SET @ENTRY := 33010;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,30000,30000,0,0,36,29327,0,0,0,0,0,1,0,0,0,0,0,0,0,"Female Frost Leopard - Out of Combat - Update Template To 'Frost Leopard'");

-- Male Frost Leopard SAI
SET @ENTRY := 33007;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,9000,11000,11,54668,0,0,0,0,0,2,0,0,0,0,0,0,0,"Male Frost Leopard - In Combat - Cast 'Rake'"),
(@ENTRY,0,1,0,1,0,100,0,30000,30000,0,0,36,29327,0,0,0,0,0,1,0,0,0,0,0,0,0,"Male Frost Leopard - Out of Combat - Update Template To 'Frost Leopard'");