-- QUEST 12512 "Leave no one behind"

SET @JONATHAN := 28136;
SET @LAMOOF := 28142;
SET @JOSEPHINE := 28148;

UPDATE `creature_template` SET `gossip_menu_id`=9660 WHERE `entry`=@JONATHAN;
UPDATE `creature_template` SET `gossip_menu_id`=9659 WHERE `entry`=@LAMOOF;
UPDATE `creature_template` SET `gossip_menu_id`=9658 WHERE `entry`=@JOSEPHINE;
UPDATE `creature_template` SET `faction`=2070, `npcflag`=1, `unit_flags`=32768, `AIName`='SmartAI' WHERE `entry` IN (@JONATHAN,@LAMOOF,@JOSEPHINE);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@JONATHAN,@LAMOOF,@JOSEPHINE);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@JONATHAN*100,@LAMOOF*100,@JOSEPHINE*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@JONATHAN,0,0,1,54,0,100,0,0,0,0,0,11,50665,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - Just summoned - Spellcast Bleeding Out'),
(@JONATHAN,0,1,2,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Crusader Jonathan - Just summoned - Store targetlist'),
(@JONATHAN,0,2,3,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Crusader Jonathan - Just summoned - Follow envoker'),
(@JONATHAN,0,3,4,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - Just summoned - Set phase 1'),
(@JONATHAN,0,4,0,61,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - Just summoned - Reset unit_field_bytes1'),
(@JONATHAN,0,5,0,23,1,100,1,50665,0,0,0,80,@JONATHAN*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - Aura Bleeding Out missing (phase 1) - Call timed actionlist'),
(@JONATHAN,0,6,7,40,0,100,1,5,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On WP 5 reached - Set unit_field_bytes1'),
(@JONATHAN,0,7,0,61,0,100,0,0,0,0,0,41,20000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On WP 5 reached - Despawn after 20 seconds'),
(@JONATHAN,0,8,9,8,1,100,0,50669,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Set phase 2'),
(@JONATHAN,0,9,10,61,0,100,0,0,0,0,0,11,50671,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Cast Kill Credit Jonathan 01'),
(@JONATHAN,0,10,11,61,0,100,0,0,0,0,0,11,50709,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Cast Strip Aura Jonathan 01'),
(@JONATHAN,0,11,12,61,0,100,0,0,0,0,0,86,50680,0,12,1,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Crosscast Kill Credit Jonathan'),
(@JONATHAN,0,12,13,61,0,100,0,0,0,0,0,86,50710,0,12,1,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Crosscast Strip Aura Jonanthan'),
(@JONATHAN,0,13,14,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Stop follow'),
(@JONATHAN,0,14,15,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Say text'),
(@JONATHAN,0,15,16,61,0,100,0,0,0,0,0,53,0,@JONATHAN,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Start WP movement'),
(@JONATHAN,0,16,0,61,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan - On spellhit Quest Credit - Remove npcflag'),
(@JONATHAN*100,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan script - Say text'),
(@JONATHAN*100,9,1,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan script - Set phase 2'),
(@JONATHAN*100,9,2,0,0,0,100,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Crusader Jonathan script - Stop follow'),
(@JONATHAN*100,9,3,0,0,0,100,0,2000,2000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Jonathan script - Die'),

(@LAMOOF,0,0,1,54,0,100,0,0,0,0,0,11,50681,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - Just summoned - Spellcast Bleeding Out'),
(@LAMOOF,0,1,2,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Crusader Lamoof - Just summoned - Store targetlist'),
(@LAMOOF,0,2,3,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Crusader Lamoof - Just summoned - Follow envoker'),
(@LAMOOF,0,3,4,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - Just summoned - Set phase 1'),
(@LAMOOF,0,4,0,61,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - Just summoned - Reset unit_field_bytes1'),
(@LAMOOF,0,5,0,23,1,100,1,50681,0,0,0,80,@LAMOOF*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - Aura Bleeding Out missing (phase 1) - Call timed actionlist'),
(@LAMOOF,0,6,7,40,0,100,1,5,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On WP 5 reached - Set unit_field_bytes1'),
(@LAMOOF,0,7,0,61,0,100,0,0,0,0,0,41,20000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On WP 5 reached - Despawn after 20 seconds'),
(@LAMOOF,0,8,9,8,1,100,0,50669,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Set phase 2'),
(@LAMOOF,0,9,10,61,0,100,0,0,0,0,0,11,50683,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Cast Kill Credit Lamoof 01'),
(@LAMOOF,0,10,11,61,0,100,0,0,0,0,0,11,50723,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Cast Strip Aura Lamoof 01'),
(@LAMOOF,0,11,12,61,0,100,0,0,0,0,0,86,50684,0,12,1,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Crosscast Kill Credit Lamoof'),
(@LAMOOF,0,12,13,61,0,100,0,0,0,0,0,86,50722,0,12,1,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Crosscast Strip Aura Lamoof'),
(@LAMOOF,0,13,14,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Stop follow'),
(@LAMOOF,0,14,15,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Say text'),
(@LAMOOF,0,15,16,61,0,100,0,0,0,0,0,53,0,@LAMOOF,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Start WP movement'),
(@LAMOOF,0,16,0,61,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof - On spellhit Quest Credit - Remove npcflag'),
(@LAMOOF*100,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof script - Say text'),
(@LAMOOF*100,9,1,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof script - Set phase 2'),
(@LAMOOF*100,9,2,0,0,0,100,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Crusader Lamoof script - Stop follow'),
(@LAMOOF*100,9,3,0,0,0,100,0,2000,2000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Lamoof script - Die'),

(@JOSEPHINE,0,0,1,54,0,100,0,0,0,0,0,11,50695,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - Just summoned - Spellcast Bleeding Out'),
(@JOSEPHINE,0,1,2,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Crusader Josephine - Just summoned - Store targetlist'),
(@JOSEPHINE,0,2,3,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Crusader Josephine - Just summoned - Follow envoker'),
(@JOSEPHINE,0,3,4,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - Just summoned - Set phase 1'),
(@JOSEPHINE,0,4,0,61,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - Just summoned - Reset unit_field_bytes1'),
(@JOSEPHINE,0,5,0,23,1,100,1,50695,0,0,0,80,@JOSEPHINE*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - Aura Bleeding Out missing (phase 1) - Call timed actionlist'),
(@JOSEPHINE,0,6,7,40,0,100,1,4,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On WP 4 reached - Set unit_field_bytes1'),
(@JOSEPHINE,0,7,0,61,0,100,0,0,0,0,0,41,20000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On WP 4 reached - Despawn after 20 seconds'),
(@JOSEPHINE,0,8,9,8,1,100,0,50669,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Set phase 2'),
(@JOSEPHINE,0,9,10,61,0,100,0,0,0,0,0,11,50698,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Cast Kill Credit Jospehine 01'),
(@JOSEPHINE,0,10,11,61,0,100,0,0,0,0,0,11,50711,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Cast Strip Aura Josephine 01'),
(@JOSEPHINE,0,11,12,61,0,100,0,0,0,0,0,86,50699,0,12,1,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Crosscast Kill Credit Josephine'),
(@JOSEPHINE,0,12,13,61,0,100,0,0,0,0,0,86,50712,0,12,1,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Crosscast Strip Aura Josephine'),
(@JOSEPHINE,0,13,14,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Stop follow'),
(@JOSEPHINE,0,14,15,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Say text'),
(@JOSEPHINE,0,15,16,61,0,100,0,0,0,0,0,53,0,@JOSEPHINE,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Start WP movement'),
(@JOSEPHINE,0,16,0,61,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine - On spellhit Quest Credit - Remove npcflag'),
(@JOSEPHINE*100,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine script - Say text'),
(@JOSEPHINE*100,9,1,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine script - Set phase 2'),
(@JOSEPHINE*100,9,2,0,0,0,100,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Crusader Josephine script - Stop follow'),
(@JOSEPHINE*100,9,3,0,0,0,100,0,2000,2000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Crusader Josephine script - Die');

DELETE FROM `waypoints` WHERE `entry` IN (@JONATHAN,@LAMOOF,@JOSEPHINE);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`) VALUES
(@JONATHAN,1,5257.454,-3500.14,291.6933),
(@JONATHAN,2,5253.089,-3516.885,291.6786),
(@JONATHAN,3,5255.452,-3523.673,291.6932),
(@JONATHAN,4,5262.733,-3527.41,291.6934),
(@JONATHAN,5,5261.445,-3528.885,291.6929),

(@LAMOOF,1,5257.454,-3500.14,291.6933),
(@LAMOOF,2,5253.089,-3516.885,291.6786),
(@LAMOOF,3,5255.452,-3523.673,291.6932),
(@LAMOOF,4,5260.741,-3525.38,291.69343),
(@LAMOOF,5,5259.029,-3527.101,291.4913),

(@JOSEPHINE,1,5257.454,-3500.14,291.6933),
(@JOSEPHINE,2,5253.089,-3516.885,291.6786),
(@JOSEPHINE,3,5257.784,-3521.994,291.6931),
(@JOSEPHINE,4,5256.293,-3523.494,291.6933);

DELETE FROM `creature_text` WHERE `entry` IN (@JONATHAN,@LAMOOF,@JOSEPHINE) AND `groupid`=1;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@JONATHAN,1,0,'<sigh>... This is the end of me.',12,0,100,1,0,0,''),
(@LAMOOF,1,0,'<sigh>... This is the end of me.',12,0,100,1,0,0,''),
(@JOSEPHINE,1,0,'Ohhh, I... cannot go on....',12,0,100,1,0,0,'');

DELETE FROM `gossip_menu` WHERE `entry` IN (9658,9659,9660);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9658,13081),
(9659,13083),
(9660,13082);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (50709,50710,50711,50712,50722,50723);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(50709,-50665,1,'Strip Aura Jonathan 01 remove aura Bleeding Out'),
(50710,-50666,1,'Strip Aura Jonathan remove aura Jonathan Dying from player'),
(50711,-50695,1,'Strip Aura Josephine 01 remove aura Bleeding Out'),
(50712,-50693,1,'Strip Aura Josephine remove aura Josephine Dying from player'),
(50722,-50679,1,'Strip Aura Lamoof remove aura Lamoof Dying from player'),
(50723,-50681,1,'Strip Aura Lamoof 01 remove aura Bleeding Out');

SET @HARPOON := 30066;
SET @HAYSTACK := 30096;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (55896,55934);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@HAYSTACK;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,4,55896,0,0,31,0,3,@HAYSTACK,0,0,0,'','Spell Explosion effect2 targets Dry Haystack'),
(13,2,55934,0,0,31,0,3,30103,0,0,0,'','Spell Valkyrion Fire effect1 targets Valkyrion Fire Bunny'),
(22,1,@HAYSTACK,0,0,1,1,55934,0,0,1,0,'','SAI Dry Haystack triggers only if Dry Haystack has no aura of spell Valkyrion Fire');

UPDATE `creature_template` SET `npcflag`=16777216, `ScriptName`='' WHERE `entry`=@HARPOON;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@HARPOON,@HAYSTACK);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@HARPOON,@HAYSTACK) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARPOON,0,0,0,11,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Valkyrion Harpoon Gun - On spawn - Root'),

(@HAYSTACK,0,0,1,8,0,100,0,55896,0,0,0,11,55934,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Dry Haystack - On spellhit Explosion - Spellcast Valkyrion Fire'),
(@HAYSTACK,0,1,2,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dry Haystack - Linked - Set event phase 1'),
(@HAYSTACK,0,2,0,61,0,100,0,0,0,0,0,33,@HAYSTACK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Dry Haystack - Linked - Quest credit'),
(@HAYSTACK,0,3,4,23,1,100,0,55934,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dry Haystack - On spellfade Valkyrion Fire (phase 1) - Set event phase 0'),
(@HAYSTACK,0,4,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dry Haystack - Linked - Despawn');

UPDATE `spell_bonus_data` SET `direct_bonus`=0.25, `ap_bonus`=0.16 WHERE `entry`=54158;
UPDATE `spell_bonus_data` SET `direct_bonus`=0.22, `ap_bonus`=0.14 WHERE `entry`=31804;

DELETE FROM `creature_loot_template` WHERE (`entry`=29124) AND (`item`=43275);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (29124, 43275, 20, 1, 0, 1, 1);

DELETE FROM `creature_loot_template` WHERE (`entry`=26283) AND (`item`=43275);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (26283, 43275, 20, 1, 0, 1, 1);

-- Gnasher SAI
SET @ENTRY := 1206;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,1,0,0,8800,8800,11,3393,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gnasher - In Combat - Cast 'Consume Flesh' (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gnasher - Between 0-15% Health - Flee For Assist (No Repeat)");

-- Stonesplinter Skullthumper SAI
SET @ENTRY := 1163;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,10,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stonesplinter Skullthumper - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,1,0,0,0,75,0,1900,3700,10800,14800,11,1776,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stonesplinter Skullthumper - In Combat - Cast 'Gouge'"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Stonesplinter Skullthumper - Between 0-15% Health - Flee For Assist (No Repeat)");

-- Grawmug SAI
SET @ENTRY := 1205;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3600,5500,8800,12400,11,3229,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grawmug - In Combat - Cast 'Quick Bloodlust'"),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Grawmug - Between 0-15% Health - Flee For Assist (No Repeat)");

DELETE FROM creature_equip_template WHERE entry=2057;

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=6 WHERE `entry` IN (34566, 35216, 35268, 35269, 35347, 35348, 35349, 35350, 35351, 35352, 35447, 35448, 35449, 35615, 35616) AND `item`=3;

-- Marin Noggenfogger SAI
SET @ENTRY := 7564;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,2662,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marin Noggenfogger - On Quest '2662' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY :=  756400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marin Noggenfogger - On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,1,0,0,0,100,0,500,500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marin Noggenfogger - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,5,432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marin Noggenfogger - On Script - Play Emote 432"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marin Noggenfogger - On Script - Add Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry`=7564;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(7564, 0, 0, 'I''m going to carefully mix this - oops! ...Well, I spilled a little, but it''s ready!', 12, 0, 100, 0, 0, 0, 'Marin Noggenfogger', 4548);

-- Sprinkle SAI
SET @ENTRY := 7583;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,2641,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sprinkle - On Quest '' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 758300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sprinkle - On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,1,0,0,0,100,0,500,500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sprinkle - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,5,432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sprinkle - On Script - Play Emote 432"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sprinkle - On Script - Add Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry`=7583;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(7583, 0, 0, 'Just sit tight while i get this prepared for you!', 12, 0, 100, 0, 0, 0, 'Sprinkle', 3661);

-- Diseased Young Wolf SAI
SET @ENTRY := 299;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,71764,2,0,0,0,0,1,0,0,0,0,0,0,0,"Diseased Young Wolf - On Respawn - Cast 'Diseased'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,525,0,15,0,0,0,0,"Diseased Young Wolf - On Aggro - Set Data 1 1"),
(@ENTRY,0,2,0,38,0,100,0,1,1,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Diseased Young Wolf - On Data Set 1 1 - Set In Combat With Zone");

-- Mangy Wolf SAI
SET @ENTRY := 525;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mangy Wolf - On Data Set 1 1 - Set In Combat With Zone"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,45,0,0,0,0,0,0,9,299,0,15,0,0,0,0,"Mangy Wolf - On Aggro - Set Data 0 0");
