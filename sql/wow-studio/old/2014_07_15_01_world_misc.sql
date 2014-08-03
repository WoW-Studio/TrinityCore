-- Fix Quest Der Yeti von nebenan ID: 11284
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=24178; -- Shatterhorn

UPDATE `creature_model_info` SET `bounding_radius`=1.25,`combat_reach`=4.375,`gender`=0 WHERE `modelid`=22486; -- Shatterhorn

DELETE FROM `creature_template_addon` WHERE `entry` IN (24062,24178);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(24062,0,0,1,257,0, NULL), -- Wildervar Miner
(24178,0,0,3,1,0, '6606'); -- Shatterhorn, Self Visual - Sleep Until Cancelled  (DND)
DELETE FROM `creature_addon` WHERE `guid` IN (120419,120422,106573);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(120419,0,0,0,0,1,''), -- Wildervar Miner, talk
(120422,0,0,0,0,1,''); -- Wildervar Miner, talk

-- The ram meat spell may only be used if player is inside the mine
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=43209;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,43209,0,0,23,0,4534,0,0,0,39,0,'','Place Ram Meat can only be used in Wildervar Mine');

-- Insert missing spell_target_position for Place Ram Meat spell
DELETE FROM `spell_target_position` WHERE `id`=43209;
INSERT INTO `spell_target_position` (`id`,`effIndex`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`,`VerifiedBuild`) VALUES
(43209,0,571,2636.288086,-5050.891113,295.537445,5.374982,0);

-- Shatterhorn SAI
SET @ENTRY := 24178;
SET @SPELL_GROUND_SMASH := 12734; -- Ground Smash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Aggro - Say Line 0'),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,12000,13000,11,@SPELL_GROUND_SMASH,1,0,0,0,0,2,0,0,0,0,0,0,0,'Shatterhorn - In Combat - Cast Ground Smash'),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,41,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - Force Despawn 8 Seconds After Death'),
(@ENTRY,0,3,0,8,0,0,0,43209,0,0,0,19,0x300,1,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Place Meat spellhit remove unit flags'),
(@ENTRY,0,4,0,8,0,0,0,43209,0,0,0,28,6606,1,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Place Meat spellhit remove sleep aura'),
(@ENTRY,0,5,0,8,0,0,0,43209,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Place Meat spellhit remove byte1 3');

-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextID`) VALUES
(@ENTRY,0,0,'%s wakes up from the smell of fresh meat!',16,0,100,15,0,0,'Shatterhorn on aggro line and roar at same time',0);
