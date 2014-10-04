-- Fix Quest Holt mich hier raus! ID: 6132

SET @ENTRY := 12277;
SET @QUEST := 6132;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,@QUEST,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On Quest Accept - Say Line 0'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,0,@ENTRY,0,0,0,2,1,0,0,0,0,0,0,0,'Melizza - On Quest Accept - Start WP'),
(@ENTRY,0,2,0,40,0,100,0,3,@ENTRY,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 3 reached - Pause Waypoint'),
(@ENTRY,0,3,0,40,0,100,1,3,12277,0,0,80,1227700,0,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 3 reached – start script'),
(@ENTRY,0,4,0,40,0,100,0,3,0,0,0,1,3,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 3 reached - Say Line 3'),
(@ENTRY,0,5,0,40,0,100,0,11,@ENTRY,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 11 reached - Pause Waypoint'),
(@ENTRY,0,6,0,40,0,100,1,11,12277,0,0,80,1227701,0,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 11 reached – start script'),
(@ENTRY,0,7,0,40,0,100,0,11,0,0,0,1,3,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 11 reached - Say Line 3'),
(@ENTRY,0,8,0,40,0,100,0,14,0,0,0,1,1,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 14 - Say Line 1'),
(@ENTRY,0,9,0,40,0,100,0,15,0,0,0,1,2,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 15 - Say Line 2'),
(@ENTRY,0,10,0,52,0,100,0,2,@ENTRY,0,0,15,@QUEST,0,0,0,0,0,18,30,0,0,0,0,0,0,'Melizza - On WP 15 - Quest Credit'),
(@ENTRY,0,11,0,52,0,100,0,2,@ENTRY,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Melizza - On WP 15 - Forced Despawn');


/* event_script for hostile group no. 1 */

DELETE From `smart_scripts` where `entryorguid`=1227700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1227700, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4654, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1230.881226, 2683.893799, 111.406906, 0.585910, 'Mauradon Scout1 - On Script - summon'),
(1227700, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4654, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1233.368286, 2690.353271, 111.304626, 0.300810, 'Mauradon Scout2 - On Script - summon'),
(1227700, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4654, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1233.378906, 2696.718994, 111.324974, 6.236766, 'Mauradon Scout3 - On Script - summon'),
(1227700, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4654, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1225.882568, 2677.321533, 111.935440, 0.819482, 'Mauradon Scout4 - On Script - summon');


/* event_script for hostile group no. 2 */
DELETE From `smart_scripts` where `entryorguid`=1227701;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1227701, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4655, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1389.771484, 2481.950439, 88.818817, 0.718083, 'Mauradon Wrangler1 - On Script - summon'),
(1227701, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4655, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1383.059082, 2479.752197, 88.836021, 1.519975, 'Mauradon Wrangler2 - On Script - summon'),
(1227701, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4655, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1376.298950, 2479.938477, 89.805046, 1.903642, 'Mauradon Wrangler3 - On Script - summon'),
(1227701, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4662, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1390.177612, 2485.176758, 89.841125, 0.560612, 'Magram Bonepaw1 - On Script - summon'),
(1227701, 9, 4, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4662, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1383.978149, 2482.120361, 88.817810, 1.309882, 'Magram Bonepaw2 - On Script - summon'),
(1227701, 9, 5, 0, 0, 0, 100, 1, 0, 0, 0, 0, 12, 4662, 4, 15000, 0, 0, 0, 8, 0, 0, 0, -1375.094604, 2483.220215, 90.291466, 1.871049, 'Magram Bonepaw3 - On Script - summon');


/* Texts for Melizza */
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@ENTRY,0,0,'Thanks $N. Now let\'s get out of here!',12,0,100,0,0,0,0,0,'Melizza'),
(@ENTRY,1,0,'We made it! Thanks again! I\'m going to run ahead!',12,0,100,0,0,0,0,0,'Melizza'),
(@ENTRY,2,0,'OK, good luck friend. Thanks for the help.',12,0,100,0,0,0,0,0,'Melizza'),
(@ENTRY,3,0,'Oh no they are coming!',12,0,100,0,0,0,0,0,'Melizza');


/* Waypoints for Melizza */
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,-1154.681763,2714.891602,111.416801,'Melizza'),
(@ENTRY,2,-1181.698975,2719.690186,111.533310,'Melizza'),
(@ENTRY,3,-1212.798950,2700.176758,111.128334,'Melizza'),
(@ENTRY,4,-1244.059326,2682.062256,111.554749,'Melizza'),
(@ENTRY,5,-1286.902954,2652.099609,111.557388,'Melizza'),
(@ENTRY,6,-1315.717896,2616.921143,111.881241,'Melizza'),
(@ENTRY,7,-1336.722656,2589.608398,111.557503,'Melizza'),
(@ENTRY,8,-1356.870239,2567.706055,111.551277,'Melizza'),
(@ENTRY,9,-1368.539063,2546.349365,106.010063,'Melizza'),
(@ENTRY,10,-1373.942749,2528.347900,100.073257,'Melizza'),
(@ENTRY,11,-1381.930664,2497.297363,90.161476,'Melizza'),
(@ENTRY,12,-1386.158447,2476.156006,88.818047,'Melizza'),
(@ENTRY,13,-1390.283325,2455.529297,88.446968,'Melizza'),
(@ENTRY,14,-1395.094604,2431.470703,88.620621,'Melizza'),
(@ENTRY,15,-1395.412720,2416.073975,88.636658,'Melizza');

-- Fix NCP Linda Ann Kastinglow ID: 32687
SET @Linda :=32687;
SET @Alec :=32692;

UPDATE creature_template SET `AIName`='SmartAI' WHERE entry IN (@Linda, @Alec);

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Linda AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Linda*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Linda*100+1 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Linda, 0, 0, 0, 10, 0, 100, 0, 1, 10, 600000, 600000, 87, @Linda*100, @Linda*100+1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Linda - OOC_LOS - RANDOM_TIMED_ACTIONLIST'),
(@Linda*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Linda - RANDOM_TIMED_ACTIONLIST -  talk'),
(@Linda*100+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,@Alec,5,0,0,0,0,0,'Linda - RANDOM_TIMED_ACTIONLIST -  talk');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=@Linda;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@Linda,0,5,1090,128,0,0,'','event require Kirin Tor Exalted');


DELETE FROM creature_text WHERE entry IN (@Linda, @Alec);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
(@Linda, 0, 0, 'There goes the finest $c I have the honor of knowing.', 12, 0, 100, 0, 0, 0, 'Linda Ann Kastinglow', 32866), 
(@Linda, 0, 1, '$n, you''re an inspiration.', 12, 0, 100, 0, 0, 0, 'Linda Ann Kastinglow', 32867), 
(@Linda, 0, 2, 'A fine example of a $g man:woman;, that $n.', 12, 0, 100, 0, 0, 0, 'Linda Ann Kastinglow', 32868), 
(@Linda, 0, 3, 'You couldn''t ask for a finer person than $n, I say.', 12, 0, 100, 0, 0, 0, 'Linda Ann Kastinglow', 32869), 
(@Linda, 0, 4, '$n, wonderful to see you. Wonderful.', 12, 0, 100, 0, 0, 0, 'Linda Ann Kastinglow', 32870),  
(@Linda, 0, 5, '$n! Ah, fantastic to see you out and about. Busy as always, hm?', 12, 0, 100, 0, 0, 0, 'Linda Ann Kastinglow', 32871),

(@Alec, 0, 0, 'There goes the finest $c I have the honor of knowing.', 12, 0, 100, 0, 0, 0, 'Arcanist Alec', 32866), 
(@Alec, 0, 1, '$n, you''re an inspiration.', 12, 0, 100, 0, 0, 0, 'Arcanist Alec', 32867), 
(@Alec, 0, 2, 'A fine example of a $g man:woman;, that $n.', 12, 0, 100, 0, 0, 0, 'Arcanist Alec', 32868), 
(@Alec, 0, 3, 'You couldn''t ask for a finer person than $n, I say.', 12, 0, 100, 0, 0, 0, 'Arcanist Alec', 32869), 
(@Alec, 0, 4, '$n, wonderful to see you. Wonderful.', 12, 0, 100, 0, 0, 0, 'Arcanist Alec', 32870),  
(@Alec, 0, 5, '$n! Ah, fantastic to see you out and about. Busy as always, hm?', 12, 0, 100, 0, 0, 0, 'Arcanist Alec', 32871);
