-- Richtiger Windzornspell Hardened Steel Berserker
UPDATE `creature_template_addon` SET `auras`= '32910' WHERE `entry` IN(28579, 30966);

-- Titanium Thunderer SAI
SET @ENTRY := 28965;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,2,0,40,12000,18000,11,52879,7,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - Between 0-40% Health - Cast 'Deflection' (Normal Dungeon)"),
(@ENTRY,0,1,0,2,0,100,4,0,65,12000,18000,11,59181,7,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - Between 0-65% Health - Cast 'Deflection' (Heroic Dungeon)"),
(@ENTRY,0,2,3,7,0,100,0,0,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - On Evade - Set Event Phase 5"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - On Evade - Set Sheath Melee"),
(@ENTRY,0,4,0,10,0,5,1,0,25,10000,20000,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Titanium Thunderer - Within 0-25 Range Out of Combat LoS - Start Attacking (No Repeat)"),
(@ENTRY,0,5,0,4,0,100,0,0,0,0,0,28,16245,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - On Aggro - Remove Aura 'Freeze Anim'"),
(@ENTRY,0,6,0,0,0,100,1,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - In Combat - Remove Flags Not Attackable & Not Selectable (No Repeat)");

-- Titanium Siegebreaker SAI
SET @ENTRY := 28961;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,2,0,40,10000,15000,11,52891,7,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Siegebreaker - At 40% HP - Cast Blade Turning"),
(@ENTRY,0,1,0,2,0,100,4,0,50,10000,15000,11,59173,7,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Siegebreaker - At 50% HP - Cast Blade Turning"),
(@ENTRY,0,2,3,7,0,100,0,0,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Siegebreaker - On Evade - Set Phase 5"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Siegebreaker - On Evade - Display melee weapon"),
(@ENTRY,0,4,0,10,0,5,1,0,25,10000,20000,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Titanium Thunderer - Within 0-25 Range Out of Combat LoS - Start Attacking (No Repeat)"),
(@ENTRY,0,5,0,4,0,100,0,0,0,0,0,28,16245,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - On Aggro - Remove Aura 'Freeze Anim'"),
(@ENTRY,0,6,0,0,0,100,1,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,"Titanium Thunderer - In Combat - Remove Flags Not Attackable & Not Selectable (No Repeat)");