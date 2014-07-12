-- Fix für die Quest Ein Frosch und ein Messer ID: 11476

SET @ENTRY := 26503;
UPDATE `creature_template` SET `AIName`='SmartAI',`npcflag`=`npcflag`|1,`IconName`='LootAll' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,64,0,100,0,0,0,0,0,56,35803,1,0,0,0,0,7,0,0,0,0,0,0,0,"Scalawag Frog - Gossip Hello - Create Item Scalawag Frog"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scalawag Frog - Gossip Hello - Force Despawn");

-- Fix NPC Chat Spammer Berserkertrogg ID: 1393
DELETE FROM `smart_scripts` WHERE (`entryorguid`=1393 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(1393, 0, 0, 0, 4, 0, 10, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Berserk Trogg - On Aggro - Say Line 0"),
(1393, 0, 1, 2, 2, 0, 100, 1, 0, 40, 0, 0, 11, 3019, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Berserk Trogg - Between 0-40% Health - Cast 'Frenzy'"),
(1393, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Berserk Trogg - Between 0-40% Health - Say Line 1");
