-- Fix Quest Rescue from Town Square ID 12253
SET @Villager=27359;
SET @GEIST=27370;

UPDATE `creature_template` SET `ainame`='SmartAI',`scriptname`='' WHERE `entry` IN (@Villager,@GEIST);
UPDATE `creature_template` SET `exp`=1,`unit_flags`=`unit_flags`|33536 WHERE `entry`=@Villager;

DELETE FROM `creature_template_addon` WHERE `entry` IN (@Villager,@GEIST);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Villager,0,0,1,0, NULL), 
(@GEIST,0,0,1,0, NULL);

DELETE FROM `creature_text` WHERE `entry`=@Villager;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@Villager,0,0,'Good of you to come, champion! The beast almost had me!',12,0,0,0,0,0,''),
(@Villager,0,1,'Finally! A hero has come!',12,0,0,0,0,0,''),
(@Villager,0,2,'Thank you, kind soul.',12,0,0,0,0,0,''),
(@Villager,0,3,'I''ll never forget you, friend.',12,0,0,0,0,0,'');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GEIST AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GEIST,0,0,0,4,0,100,0,0,0,0,0,64,1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Vengeful Geist - On Aggro - Store Target List '),
(@GEIST,0,1,2,6,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@Villager,10,0,0,0,0,0,'Vengeful Geist - On Death - Send stored targets'),
(@GEIST,0,2,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@Villager,10,0,0,0,0,0,'Vengeful Geist - Link With Previous Event - Set Data 0 1 ');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Villager AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Villager*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Villager,0,0,1,38,0,100,0,0,1,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Trapped Wintergarde Villager - On Data Set 0 1 - Set Event Phase 1'),
(@Villager,0,1,0,61,1,100,0,0,0,0,0,80,2735900,0,0,0,0,0,1,0,0,0,0,0,0,0,'Trapped Wintergarde Villager - Link With Previous Event - Call Timed Actionlist Only if Event Phase is 1'),
(@Villager,0,2,0,34,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Trapped Wintergarde Villager - On Movementinform - Despawn'),
(@Villager*100,9,0,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Action 1 - Set Event Phase 2'),
(@Villager*100,9,1,0,0,0,100,0,0,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Action 2 - Play Emote Cheers'),
(@Villager*100,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Action 3 - Talk'),
(@Villager*100,9,3,0,0,0,100,0,0,0,0,0,33,27359,0,0,0,0,0,12,1,0,0,0,0,0,0,'Action 4 - Give Quest Credit'),
(@Villager*100,9,4,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Action 5 - Set Run'),
(@Villager*100,9,5,0,0,0,100,0,2000,2000,0,0,69,1,0,0,0,0,0,8,0,0,0,3719.13,-839.1,164.9,0,'Action 6 - Move To Pos');
