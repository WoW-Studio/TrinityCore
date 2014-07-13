UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (19988,19989,19990);
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (19988,19989,19990) AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(19988, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 85, 37466, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grishna Falconwing - Cast Understanding Ravenspeech on Death'),
(19989, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 85, 37466, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grishna Harbinger - Cast Understanding Ravenspeech on Death'),
(19990, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 85, 37466, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grishna Scorncrow - Cast Understanding Ravenspeech on Death');


UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (184950,184967,184968,184969);
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (184950,184967,184968,184969) AND `source_type`=1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(184950, 1, 0, 0, 23, 0, 100, 0, 37466, 1, 0, 0, 33, 22798, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[DND]Prophecy 1 Quest Credit - if Understanding Ravenspeech present'),
(184967, 1, 0, 0, 23, 0, 100, 0, 37466, 1, 0, 0, 33, 22799, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[DND]Prophecy 2 Quest Credit - if Understanding Ravenspeech present'),
(184968, 1, 0, 0, 23, 0, 100, 0, 37466, 1, 0, 0, 33, 22800, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[DND]Prophecy 3 Quest Credit - if Understanding Ravenspeech present'),
(184969, 1, 0, 0, 23, 0, 100, 0, 37466, 1, 0, 0, 33, 22801, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[DND]Prophecy 4 Quest Credit - if Understanding Ravenspeech present');

DELETE FROM `creature_text` WHERE `entry`=21851;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(21851, 0, 0, 'From the darkest night shall rise again the raven, shall take flight in the shadows, shall reveal the nature of its kind. Prepare yourself for its coming, for the faithful shall be elevated to take flight with the raven, the rest be forgotten to walk upon the ground, clipped wings and shame.', 15, 0, 100, 0, 0, 0, 'The Voice of the Raven God - The First Prophecy'),
(21851, 1, 0, 'Steel your minds and guard your thoughts. The dark wings will cloud and consume the minds of the weak, a flock of thralls whose feet may never leave the ground.', 15, 0, 100, 0, 0, 0, 'The Voice of the Raven God - The Second Prophecy'),
(21851, 2, 0, 'The Old blood will flow once again with the coming of the raven, the return of the darkness in the skies. Scarlet night, and the rise of the old.', 15, 0, 100, 0, 0, 0, 'The Voice of the Raven God - The Third Prophecy'),
(21851, 3, 0, 'The raven was struck down once for flying too high, unready. The eons have prepared the Dark Watcher for its ascent, to draw the dark cloak across the horizon.', 15, 0, 100, 0, 0, 0, 'The Voice of the Raven God - The Fourth Prophecy');

UPDATE `gameobject_template` SET `ScriptName`='go_raven_prophecy' WHERE `entry` IN (184950,184967,184968,184969);

-- Grishna Falconwing
SET @ENTRY := 19988;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,2500,5500,10000,11000,11,37587,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Grishna Falconwing - In Combat - Cast Bestial Wrath"),
(@ENTRY,@SOURCETYPE,1,0,6,0,20,0,0,0,0,0,85,37642,2,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Grishna Falconwing - On Death - Cast Understanding Ravenspeech");

-- Grishna Harbinger
SET @ENTRY := 19989;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,2500,5500,10000,11000,11,37589,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Grishna Harbinger - In Combat - Cast Shriveling Gaze"),
(@ENTRY,@SOURCETYPE,1,0,6,0,20,0,0,0,0,0,85,37642,2,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Grishna Harbringer - On Death - Cast Understanding Ravenspeech");

-- Grishna Scorncrow
SET @ENTRY := 19990;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,2500,5500,10000,11000,11,35321,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Grishna Scorncrow - In Combat - Cast Gushing Wound"),
(@ENTRY,@SOURCETYPE,1,0,6,0,20,0,0,0,0,0,85,37642,2,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Grishna Scorncrow - On Death - Cast Understanding Ravenspeech");