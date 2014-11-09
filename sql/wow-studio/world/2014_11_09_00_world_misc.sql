-- Argent Champion SAI mechanic
SET @Arg_Champion := 33707;
SET @Script := 3370700;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='',`faction`=35,`gossip_menu_id`=10472, `unit_flags`=0, `npcflag`=1 WHERE `entry`=@Arg_Champion;
DELETE FROM `creature_template_addon` WHERE `entry`=33707;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(33707,0,28919,0,1,0,'63501 62852 64723');
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Arg_Champion;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@Script;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Arg_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - On Reset - Remove auras from Defend'),
(@Arg_Champion,0,1,2,62,0,100,0,10472,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Arg Champion - On gossip select - Close gossip'),
(@Arg_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - Linked with previous event - Call timed actionlist'),
(@Arg_Champion,0,3,0,52,0,100,0,0,@Arg_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'Arg Champion - On text over - Cast Charge'),
(@Arg_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'Arg Champion - IC - Cast Thrust'),
(@Arg_Champion,0,5,0,9,0,100,0,5,5,4000,7000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Arg Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@Arg_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - IC - Move forward 12 yards'),
(@Arg_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'Arg Champion - On 10-12 yard range - Cast Charge'),
(@Arg_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Arg Champion - Linked with previous event - Cast Shield-Breaker'),
(@Arg_Champion,0,9,0,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - On HP% between 1% and 6% - Change faction to 35'),
(@Arg_Champion,0,10,11,2,0,100,1,1,6,60000,60000,33,33708,0,0,0,0,0,7,0,0,0,0,0,0,0,'Arg Champion - On HP% between 1% and 6% - cast quest credit'),
(@Arg_Champion,0,11,12,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - Linked with previous event - Say text'),
(@Arg_Champion,0,12,0,61,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - Linked with previous event - Despawn in 3 sec'),
(@Arg_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - On player killed - Say text'),
(@Arg_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - Linked with previous event - Set unseen'),
(@Arg_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arg Champion - Linked with previous event - Despawn in 1 ms'),
-- Timed actionlist 1
(@Script,9,1,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run ON'),
(@Script,9,2,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run ON'),
(@Script,9,3,0,0,0,100,0,0,0,0,0,11,62719,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast Defend on self/Layer 1/'),
(@Script,9,4,0,0,0,100,0,0,0,0,0,11,62719,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast Defend on self/Layer 2/'),
(@Script,9,5,0,0,0,100,0,0,0,0,0,46,20,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Move forward 15 yards'),
(@Script,9,6,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run Off'),
(@Script,9,7,0,0,0,100,0,0,0,0,0,11,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast aura TriggerS for Defend /10 sec one/'),
(@Script,9,8,0,0,0,100,0,3500,3500,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Change faction to 14'),
(@Script,9,9,0,0,0,100,0,0,0,0,0,1,0,1500,0,0,0,0,2,0,0,0,0,0,0,0,'All champions - Script 1 - Say text');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @Arg_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextID`,`TextRange`,`comment`) VALUES
(@Arg_Champion,0,1,'Ready yourself!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,0,2,'Prepare yourself!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,0,3,'On your guard!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,0,4,'On your guard, Argent Champion!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,0,5,'Let it begin!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,0,6,'Argent Champion is looking winded!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,1,7,'Victory is mine!',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,1,8,'It seems you still need more practice. Perhaps another time.',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,1,9,'I have won. Better luck another time, friend.',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,1,10,'I am afraid you will need more practice to defeat me.',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,2,11,'I yield to you.',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,2,12,'That was a well fought battle. I yield to you.',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,2,13,'It would seem I underestimated your skills. Well done..',12,0,100,1,1000,0,0,0,'Argent Champion'),
(@Arg_Champion,2,14,'I have been defeated. Good fight!',12,0,100,1,1000,0,0,0,'Argent Champion');

-- Squire Danny gossip
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10343;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID` ) VALUES
( 10343, 0, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 1, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 2, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 3, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 4, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 5, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 6, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 7, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 8, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 ),
( 10343, 9, 0, 'I am ready to fight!', 0, 1, 1, 0, 0, 0, 0, '', 0 );

-- Squire Danny gossip  conditions
DELETE FROM `conditions` WHERE `SourceGroup`=10343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceID`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10343, 0, 0, 0, 9, 0, 13725, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on NE quest The Valiant's Challenge"),
(15, 10343, 0, 0, 0, 28, 0, 13725, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 0, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 1, 0, 0, 9, 0, 13724, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Exo quest The Valiant's Challenge"),
(15, 10343, 1, 0, 0, 28, 0, 13724, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed Exo The Valiant's Challenge objectives"),
(15, 10343, 1, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 1, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 2, 0, 0, 9, 0, 13723, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on GR quest The Valiant's Challenge"),
(15, 10343, 2, 0, 0, 28, 0, 13723, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed GR The Valiant's Challenge objectives"),
(15, 10343, 2, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 2, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 3, 0, 0, 9, 0, 13713, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on IF quest The Valiant's Challenge"),
(15, 10343, 3, 0, 0, 28, 0, 13713, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed IF The Valiant's Challenge objectives"),
(15, 10343, 3, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 3, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 4, 0, 0, 9, 0, 13726, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Org quest The Valiant's Challenge"),
(15, 10343, 4, 0, 0, 28, 0, 13726, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed Org The Valiant's Challenge objectives"),
(15, 10343, 4, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 4, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 5, 0, 0, 9, 0, 13727, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Sen quest The Valiant's Challenge"),
(15, 10343, 5, 0, 0, 28, 0, 13727, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed Sen The Valiant's Challenge objectives"),
(15, 10343, 5, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 5, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 6, 0, 0, 9, 0, 13731, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SM quest The Valiant's Challenge"),
(15, 10343, 6, 0, 0, 28, 0, 13731, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 6, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 6, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 7, 0, 0, 9, 0, 13699, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SW quest The Valiant's Challenge"),
(15, 10343, 7, 0, 0, 28, 0, 13699, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 7, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 7, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 8, 0, 0, 9, 0, 13728, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on TB quest The Valiant's Challenge"),
(15, 10343, 8, 0, 0, 28, 0, 13728, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 8, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 8, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 9, 0, 0, 9, 0, 13729, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on UC quest The Valiant's Challenge"),
(15, 10343, 9, 0, 0, 28, 0, 13729, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 9, 0, 0, 29, 0, 33707, 100, 0, 1, 0, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 9, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount");

-- Argent Champion gossip
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10472;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID` ) VALUES
( 10472, 0, 0, "I am ready to fight!", 0, 1, 1, 0, 0, 0, 0, '', 0 );
DELETE FROM `gossip_menu` WHERE `entry` = 10472;
INSERT INTO `gossip_menu` (`entry`, `text_id` ) VALUES
( 10472, 14421); 

-- Argent Champion gossip conditions
DELETE FROM `conditions` WHERE `SourceGroup`=10472;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceID`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10472, 0, 0, 0, 9, 0, 13725, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on NE quest The Valiant's Challenge"),
(15, 10472, 0, 0, 1, 9, 0, 13724, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Exo quest The Valiant's Challenge"),
(15, 10472, 0, 0, 2, 9, 0, 13723, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on GR quest The Valiant's Challenge"),
(15, 10472, 0, 0, 3, 9, 0, 13713, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on IF quest The Valiant's Challenge"),
(15, 10472, 0, 0, 4, 9, 0, 13726, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Org quest The Valiant's Challenge"),
(15, 10472, 0, 0, 5, 9, 0, 13727, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Sen quest The Valiant's Challenge"),
(15, 10472, 0, 0, 6, 9, 0, 13731, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SM quest The Valiant's Challenge"),
(15, 10472, 0, 0, 7, 9, 0, 13699, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SW quest The Valiant's Challenge"),
(15, 10472, 0, 0, 8, 9, 0, 13728, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on TB quest The Valiant's Challenge"),
(15, 10472, 0, 0, 9, 9, 0, 13729, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is on UC quest The Valiant's Challenge"),
(15, 10472, 0, 0, 0, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 2, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 3, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 4, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 5, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 6, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 7, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 8, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 9, 1, 0, 63034, 0, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10472, 0, 0, 0, 28, 0, 13725, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 1, 28, 0, 13724, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 2, 28, 0, 13723, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 3, 28, 0, 13713, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 4, 28, 0, 13726, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 5, 28, 0, 13727, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 6, 28, 0, 13731, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 7, 28, 0, 13699, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 8, 28, 0, 13728, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10472, 0, 0, 9, 28, 0, 13729, 0, 0, 1, 0, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives");

-- Spawn
SET @Script := 33518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=33518;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Script;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `target_type`, `target_param1`, `target_param2`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
( @Script, 0, 0, 0, 62, 100, 0, 10343, 0, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 1, 0, 62, 100, 0, 10343, 1, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 2, 0, 62, 100, 0, 10343, 2, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 3, 0, 62, 100, 0, 10343, 3, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 4, 0, 62, 100, 0, 10343, 4, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8541.494, 1083.819, 556.321, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 5, 0, 62, 100, 0, 10343, 5, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 6, 0, 62, 100, 0, 10343, 6, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 7, 0, 62, 100, 0, 10343, 7, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 8, 0, 62, 100, 0, 10343, 8, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 9, 0, 62, 100, 0, 10343, 9, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 10, 0, 62, 100, 0, 10343, 0, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 11, 0, 62, 100, 0, 10343, 1, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 12, 0, 62, 100, 0, 10343, 2, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 13, 0, 62, 100, 0, 10343, 3, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 14, 0, 62, 100, 0, 10343, 4, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 15, 0, 62, 100, 0, 10343, 5, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 16, 0, 62, 100, 0, 10343, 6, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 17, 0, 62, 100, 0, 10343, 7, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 18, 0, 62, 100, 0, 10343, 8, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 19, 0, 62, 100, 0, 10343, 9, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" );

-- Fix Quest Die Herausforderung des Recken ID: 13725
DELETE FROM `creature_queststarter` WHERE `quest` = 13725;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 13725;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 13725;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (33592, 13725);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 33592;
DELETE FROM `creature_questender` WHERE `quest` = 13725;
DELETE FROM `gameobject_questender` WHERE `quest` = 13725;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (33592, 13725);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=33592;
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES (13725, 2, 80, 77, 0, -241, 0, 0, 0, 0, 1101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13717, 0, 0, 0, 5, 74000, 132300, 0, 63518, 0, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 1094, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Valiant\'s Challenge', 'Speak with Squire Danny to summon your opponent. Once you have defeated the Argent Champion, return to Jaelyne Evensong at the Argent Tournament Grounds.$B$BIf you lose your lance, you can get another from any of the Lance Racks near the stables or in the Silver Covenant Pavilion.', 'You are nearly ready to compete on behalf of Darnassus in the grand melee. To prove yourself worthy to enter the lists on behalf of our city, you must defeat a champion of the Argent Crusade.$B$BGo to the stables outside the pavilion, equip your lance, and mount up. Speak to Squire Danny at the Argent Valiants\' Ring on the western edge of the grounds. The squire will call out your opponent when you\'re ready.$B$BAfter the battle is concluded, we will speak of the outcome.', '', 'You have proven yourself worthy of the title of champion, $n. You will compete at the tournament\'s highest level on behalf of Darnassus, riding in the grand melee with your weapon at the ready and our mighty pennant at your back.', 'Have you overcome the Argent champion?', 'Return to Jaelyne Evensong in Icecrown.', 33707, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Champion defeated', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

-- Fix Quest Den Täter ausschnüffeln ID: 12855 (Ist ein Hack)
DELETE FROM `creature_queststarter` WHERE `quest` = 12855;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 12855;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 12855;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (29650, 12855);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 29650;
DELETE FROM `creature_questender` WHERE `quest` = 12855;
DELETE FROM `gameobject_questender` WHERE `quest` = 12855;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (29579, 12855);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=29579;
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES (12855, 2, 80, 77, 0, 67, 0, 0, 0, 0, 1101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12858, 5, 74000, 132300, 0, 0, 0, 0, 0, 0, 41430, 1, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1068, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sniffing Out the Perpetrator', 'Use the Frosthound Collar at the Abandoned Camp to track down whoever took Brann\'s possessions. When you recover them, use the communication device and speak to whoever you can contact.', 'The tone of Brann\'s note suggests he meant to bury something with the note, maybe a pack of some kind. You\'re sure this was all you found?$B$BOkay, I\'m going to have you take one of these frosthounds with you. The frostborn use them for tracking. Bring it to the destroyed camp and let it get Brann\'s scent.$B$BIt should at least lead you to the location of those missing possessions, and if we\'re lucky, Brann himself. ', '', 'You... you\'re not a member of the Explorers\' League, at least not one I remember. But, if you recovered the communicator, they must\'ve sent you. Good, that\'s almost what I was hoping for.', 'Who are you?', 'Use the communication device and speak to whomever you can contact.', 29695, 0, 0, 0, 1, 0, 0, 0, 0, 0, 41430, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Track down thief', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

-- Fix NPC Fährtenleser Thulin ID: 29695
DELETE FROM `creature_loot_template` WHERE (`entry`=29695) AND (`item`=40971);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (29695, 40971, 100, 1, 0, 1, 1);

-- Fix NPC Njormeld ID: 30099
DELETE FROM `creature_template_addon` WHERE (`entry`=30099);

--
--
-- Fix Objekt Hodirs Horn ID: 192078
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (21079, 192078, 571, 1, 1, 7142.23, -2723.25, 787.769, -2.63544, 0, 0, -0.968147, 0.250383, 180, 255, 1);

-- Fix Objekt Hodir's Helm ID: 192080
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (270, 192080, 571, 1, 1, 7390.14, -2725.38, 874.256, -3.08918, 0, 0, -0.999657, 0.0262017, 600, 255, 1);

-- Fix Objekt Hodir's Helm ID: 192080
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (192080, 2, 8221, 'Hodir\'s Helm', '', '', '', 0, 32, 100, 0, 0, 0, 0, 0, 0, 0, 9218, 4, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

-- Fix Quest Den Helm polieren ID: 13006
DELETE FROM `creature_queststarter` WHERE `quest` = 13006;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 13006;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 13006;
INSERT INTO `gameobject_queststarter` (`id`, `quest`) VALUES (192080, 13006);
DELETE FROM `creature_questender` WHERE `quest` = 13006;
DELETE FROM `gameobject_questender` WHERE `quest` = 13006;
INSERT INTO `gameobject_questender` (`id`, `quest`) VALUES (192080, 13006);
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES (13006, 2, 80, 77, 0, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1119, 0, 3000, 0, 12987, 0, 0, 0, 5, 74000, 132300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4224, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1119, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Polishing the Helm', 'You are to enter Hibernal Cavern west of Dun Niffelem and collect 5 units of Viscous Oil from the Viscous Oils there.$b$bYou are then to return to Dun Niffelem and apply the oil to Hodir\'s Helm.', 'As you draw near the helm, you notice that the frigid environment is already taking its toll on the artifact\'s surface. What is now just a thin layer of ice will surely grow to envelop it entirely.$b$bNot about to let your hard efforts go to waste, you resolve to scour the region in search of a solution.$b$bJust as you set off, the eyes of the helm flash and an image of the nearby Hibernal Cavern enters your mind.', '', 'As you coat the helm with a thin layer of oil, the frost falls away and the surface gleams.', 'Frost is thickening on the helm as you watch, and icicles are beginning to form around its edges...', 'Return to Hodir\'s Helm at Dun Niffelem in The Storm Peaks.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42640, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

-- Fix NPC Scarlet Cannon Move ID: 28833
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (28833, 0, 0, 0, 0, 0, 25723, 0, 0, 0, 'Scarlet Cannon', '', 'Gunner', 0, 55, 55, 0, 35, 16777216, 0.01, 0.01, 1, 0, 0, 2000, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52435, 52576, 0, 0, 52588, 0, 0, 0, 0, 139, 0, 0, '', 0, 3, 1, 10, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '', 12340);
