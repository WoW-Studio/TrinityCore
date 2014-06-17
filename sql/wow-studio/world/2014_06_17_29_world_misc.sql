-- Q: The Forgotten Tale (12291) & The Truth Shall Set Us Free (12301)

SET @Valonforth     := 27476; -- Captain Luc Valonforth
SET @FPeasant       := 27226; -- Forgotten Peasant -- Already had SAI, made some changes
SET @FFootman       := 27229; -- Forgotten Footman  -- Already had SAI, made some changes
SET @FCaptain       := 27220; -- Forgotten Captain -- Already had SAI, made some changes
SET @FKnight        := 27224; -- Forgotten Knight  -- Already had SAI, made some changes
SET @FRifleman      := 27225; -- Forgotten Rifleman  -- Already had SAI, made some changes
SET @Emissary       := 27492; -- Alliance Emissary
SET @PrinceArthas   := 27455; -- Prince Arthas
SET @Muradin        := 27480; -- Muradin
SET @OrbItem        := 37577; -- Orik's Crystalline Orb (Item)
SET @AuraForgotten  := 48864; -- Aura of the Forgotten
SET @OrikSpell      := 48866; -- Orik's Song (Spell)  -- Send Script Event (18014)
SET @ArthasSpell    := 48882; -- Spirit Redeemed (Spell)
SET @ForgottenSoul  := 27465; -- Forgotten Soul (npc)
SET @DespawnSoul    := 48811; -- Despawn Forgotten Soul (Spell) -- Mata soul? 


DELETE FROM creature_template_addon WHERE entry IN (27220,27224);
INSERT INTO creature_template_addon (`entry`,`mount`)VALUES
(@FCaptain,24447), (@FKnight,2410);

DELETE FROM creature_summon_groups WHERE summonerid=@Valonforth AND groupid=1;
INSERT INTO creature_summon_groups VALUES
(@Valonforth,0,1,@Ffootman,3093.6093,-1248.6965,10.7540,0.6420,3,43500),
(@Valonforth,0,1,@Ffootman,3091.3823,-1245.5709,10.4475,0.0712,3,43500),
(@Valonforth,0,1,@Ffootman,3089.9931,-1248.9025,10.5483,0.0712,3,43500),
(@Valonforth,0,1,@Ffootman,3088.4882,-1245.6225,10.3214,0.5183,3,43500),
(@Valonforth,0,1,@Ffootman,3086.1555,-1242.1805,10.3200,0.3025,3,43500),
(@Valonforth,0,1,@Ffootman,3101.2993,-1231.2617,10.2738,4.8548,3,43500), 
(@Valonforth,0,1,@Ffootman,3096.5869,-1232.9973,9.9625,4.8965,3,43500),
(@Valonforth,0,1,@Ffootman,3092.5539,-1251.9555,11.0228,0.7564,3,43500),
(@Valonforth,0,1,@Ffootman,3089.5644,-1239.8127,10.3610,6.0050,3,43500),
(@Valonforth,0,1,@Ffootman,3095.2739,-1250.8770,10.9930,0.9054,3,43500),
(@Valonforth,0,1,@FRifleman,3089.7722,-1242.4241,10.3311,0.3176,3,96000),
(@Valonforth,0,1,@FRifleman,3099.4746,-1234.2282,10.0952,4.8548,3,96000),
(@Valonforth,0,1,@FKnight,3088.7661,-1237.4055,10.4127,0.1172,3,96000),
(@Valonforth,0,1,@FKnight,3094.5632,-1233.2812,9.9865,5.0920,3,96000),
(@Valonforth,0,1,@FCaptain,3085.7636,-1224.5657,12.4462,5.2552,3,96000),
(@Valonforth,0,1,@FCaptain,3083.3088,-1238.1966,10.9768,6.0426,3,96000),
(@Valonforth,0,1,@Emissary,3087.9968,-1223.3319,11.3495,6.0426,3,40000);

DELETE FROM event_scripts WHERE id=18014;
INSERT INTO event_scripts VALUES
(18014,0,10,@Valonforth,90000,0,3100.3500,-1252.466,11.6589,2.165); -- usar el item de Q, activa Event, sumonea Npcs.

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@Valonforth,@Emissary,@PrinceArthas,@Muradin,@FFootman, @FCaptain, @FKnight, @FRifleman,@FPeasant);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Valonforth,@Emissary,@PrinceArthas,@Muradin,@FFootman, @FCaptain, @FKnight, @FRifleman, @FPeasant);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Valonforth - Data 1
(@Valonforth,0,0,0,54,0,100,0,0,0,0,0,107,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Valonforth - Just Spawned - Summon Group"),
(@Valonforth,0,1,0,38,0,100,0,1,1,0,0,1,0,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Valonforth - On Data Set 1 1 - Say 0"),
(@Valonforth,0,2,0,52,0,100,0,0,@Valonforth,0,0,45,4,1,0,0,0,0,11,@Emissary,20,0,0,0,0,0,"Valonforth - End Say 0 - Set Data 4 1 Emissary"),
(@Valonforth,0,3,0,38,0,100,0,1,2,0,0,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Valonforth - On Data Set 1 2 - Say 1"),
(@Valonforth,0,4,0,52,0,100,0,1,@Valonforth,0,0,45,4,2,0,0,0,0,11,@Emissary,20,0,0,0,0,0,"Valonforth - End Say 1 - Set Data 4 2 Emissary"),
(@Valonforth,0,5,0,38,0,100,0,1,3,0,0,1,2,8000,0,0,0,0,1,0,0,0,0,0,0,0,"Valonforth - On Data Set 1 3 - Say 2"),
(@Valonforth,0,6,0,52,0,100,0,2,@Valonforth,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Valonforth - End Says 2 - Say 3"),
-- Prince Arthas - Data 3
(@PrinceArthas,0,0,0,54,0,100,0,0,0,0,0,53,1,@PrinceArthas,0,0,0,0,1,0,0,0,0,0,0,0,"Prince Arthas - Just Spawned - Start Waypoint"),
(@PrinceArthas,0,1,2,40,0,100,0,2,@PrinceArthas,0,0,54,45000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas- On reached WP2 - Pause Event'),
(@PrinceArthas,0,2,0,61,0,100,0,0,0,0,0,1,0,9000,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Linked Event - Says 0'),
(@PrinceArthas,0,3,0,52,0,100,0,0,@PrinceArthas,0,0,1,1,11000,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - End Says 0 - Says 1'),
(@PrinceArthas,0,4,0,52,0,100,0,1,@PrinceArthas,0,0,45,2,1,0,0,0,0,11,@Muradin,20,0,0,0,0,0,"Prince Arthas - End says 1 - Set Data 2 1 Muradin"),
(@PrinceArthas,0,5,0,38,0,100,0,3,1,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas- On Data Set 3 1 - Says 2'),
(@PrinceArthas,0,6,0,52,0,100,0,2,@PrinceArthas,0,0,45,2,2,0,0,0,0,11,@Muradin,20,0,0,0,0,0,"Prince Arthas - End says 2 - Set Data 2 2 Muradin"),
(@PrinceArthas,0,7,0,38,0,100,0,3,2,0,0,1,3,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas- On Data Set 3 2 - Says 3'),
(@PrinceArthas,0,8,0,40,0,100,0,3,@PrinceArthas,0,0,11,@ArthasSpell,0,0,0,0,0,11,0,35,0,0,0,0,0,'Prince Arthas - Reached WP 3 - Cast Spirit Redeemed'),
-- Muradin - Data 2
(@Muradin,0,0,0,54,0,100,0,0,0,0,0,53,1,@Muradin,0,0,0,0,1,0,0,0,0,0,0,0,"Muradin - Just Spawned - Start Waypoint"),
(@Muradin,0,1,0,40,0,100,0,2,@Muradin,0,0,54,19000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On reached WP2 - Pause Event'),
(@Muradin,0,2,0,38,0,100,0,2,1,0,0,1,0,2500,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On Data Set 2 1 - Says 0'),
(@Muradin,0,3,0,52,0,100,0,0,@Muradin,0,0,45,3,1,0,0,0,0,11,@PrinceArthas,20,0,0,0,0,0,"Muradin- End says 0 - Set Data 3 1 Arthas"),
(@Muradin,0,4,0,38,0,100,0,2,2,0,0,1,1,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On Data Set 2 2 - Says 1'),
(@Muradin,0,5,0,52,0,100,0,1,@Muradin,0,0,45,3,2,0,0,0,0,11,@PrinceArthas,20,0,0,0,0,0,"Muradin- End says 1 - Set Data 3 2 Arthas"),
-- Emissary - Data 4
(@Emissary,0,0,0,54,0,100,0,0,0,0,0,53,0,@Emissary,0,0,0,0,1,0,0,0,0,0,0,0,"Alliance Emissary - Just Spawned - Start Waypoint"),
(@Emissary,0,1,2,40,0,100,0,2,@Emissary,0,0,54,24000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alliance Emissary - On reached WP2 - Pause Event'),
(@Emissary,0,2,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,11,@Valonforth,100,0,0,0,0,0,'Alliance Emissary - Link - Set Data 1 1 Valonforth'),
(@Emissary,0,3,0,38,0,100,0,4,1,0,0,1,0,8500,0,0,0,0,1,0,0,0,0,0,0,0,'Alliance Emissary - On Data set 4 1 - Says 0'),
(@Emissary,0,4,0,52,0,100,0,0,@Emissary,0,0,45,1,2,0,0,0,0,11,@Valonforth,100,0,0,0,0,0,'Alliance Emissary - End says 0 - Set Data 1 2 Valonforth'),
(@Emissary,0,5,0,38,0,100,0,4,2,0,0,1,1,9000,0,0,0,0,1,0,0,0,0,0,0,0,'Alliance Emissary - On Data set 4 2  - Says 1'),
(@Emissary,0,6,7,52,0,100,0,1,@Emissary,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alliance Emissary - End says 1 - Resume WP'),
(@Emissary,0,7,0,61,0,100,0,0,0,0,0,45,1,3,0,0,0,0,11,@Valonforth,100,0,0,0,0,0,'Alliance Emissary - Link - Set Data 1 3 Valonforth'),
(@Emissary,0,8,9,40,0,100,0,3,@Emissary,0,0,45,3,1,0,0,0,0,11,@FFootman,30,0,0,0,0,0,"Alliance Emissary - On reached WP 3 - Set Data 3 1 Forgotten Footman"),
(@Emissary,0,9,10,61,0,100,0,0,0,0,0,12,@PrinceArthas,3,54000,0,0,0,8,0,0,0,3104.5910,-1226.6417,12.0252,4.4519,"Alliance Emissary - Link - Summon Prince Arthas"),
(@Emissary,0,10,11,61,0,100,0,0,0,0,0,12,@Muradin,3,54000,0,0,0,8,0,0,0,3105.9204,-1228.2515,11.6541,11.6541,"Alliance Emissary - Link - Summon Muradin"),
(@Emissary,0,11,0,61,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alliance Emissary - Link - Despawn"),

/* All those script below were already there, i just add the last lines. "Spell hit - Morph" and "link - die". 
Didn't find the way to make Forgotten soul die with an animation */

-- Forgottens: Captain
(27220,0,0,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Captain - Add Forgotten Aura if missing'),
(27220,0,1,0,0,0,100,0,6000,9000,8000,12000,11,51591,0,0,0,0,0,7,0,0,0,0,0,0,0,'Forgotten Captain - Cast Stormhammer'),
(27220,0,2,0,38,0,100,0,1,1,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Captain - Data Set 1 - Say'),
(27220,0,3,4,8,0,100,0,@ArthasSpell,0,0,0,3,27465,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Captain  - Spell Hit - Morph to Forgotten Soul'),
(27220,0,4,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Captain - Link - Die'),
-- Knight
(27224,0,0,1,62,0,100,0,9544,0,0,0,33,27473,0,0,0,0,0,21,10,0,0,0,0,0,0,'Forgotten Knight - On gossip option select quest credit'), -- deberia castear 48831, pero no lo toma.
(27224,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Forgotten Knight - Close Gossip'),
(27224,0,2,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Add Forgotten Aura if missing'),
(27224,0,3,4,4,0,100,0,0,0,0,0,11,38556,1,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Knight - Cast Throw on Aggro'),
(27224,0,4,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Set Phase 1 on Aggro'),
(27224,0,5,6,0,1,100,0,5,35,2300,3900,11,38556,1,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Knight - Cast Throw (Phase 1)'),
(27224,0,6,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Set Ranged Weapon Model (Phase 1)'),
(27224,0,7,8,9,1,100,0,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Start Combat Movement at 25 Yards (Phase 1)'),
(27224,0,8,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Knight - Start Melee at 25 Yards (Phase 1)'),
(27224,0,9,10,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Start Combat Movement Below 5 Yards (Phase 1)'),
(27224,0,10,11,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Set Ranged Weapon Model Below 5 Yards (Phase 1)'),
(27224,0,11,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Knight - Start Melee Below 5 Yards (Phase 1)'),
(27224,0,12,13,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Prevent Combat Movement at 15 Yards (Phase 1)'),
(27224,0,13,0,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Knight - Prevent Melee at 15 Yards (Phase 1)'),
(27224,0,14,0,7,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Set Melee Weapon Model on Evade'),
(27224,0,15,16,8,0,100,0,@ArthasSpell,0,0,0,3,27465,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Spell Hit - Morph to Forgotten Soul'),
(27224,0,16,0,61,0,100,0,0,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Knight - Link - Die'),
-- Peasant
(27226,0,0,1,62,0,100,0,9541,0,0,0,33,27472,0,0,0,0,0,21,10,0,0,0,0,0,0,'Forgotten Peasant - On gossip option select quest credit'), -- deberia castear 48829, pero no lo toma.
(27226,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Forgotten Peasant - Close Gossip'),
(27226,0,2,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Peasant - Add Forgotten Aura if missing'),
(27226,0,3,0,0,0,100,0,0,5,7000,10000,11,51601,1,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Peasant - Cast Bonk'),
-- Rifleman
(27225,0,0,1,62,0,100,0,9543,0,0,0,33,27471,0,0,0,0,0,21,10,0,0,0,0,0,0,'Forgotten Rifleman - On gossip option select quest credit'), -- deberia castear 48830, pero no lo toma.
(27225,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Forgotten Rifleman - Close Gossip'),
(27225,0,2,3,11,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Prevent Combat Movement on Spawn'),
(27225,0,3,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Prevent Melee on Spawn'),
(27225,0,4,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Add Forgotten Aura if missing'),
(27225,0,5,6,4,0,100,0,0,0,0,0,11,15547,1,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Rifleman - Cast Shoot on Aggro'),
(27225,0,6,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Set Phase 1 on Aggro'),
(27225,0,7,8,0,1,100,0,5,30,2300,3900,11,15547,1,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Rifleman - Cast Shoot (Phase 1)'),
(27225,0,8,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Set Ranged Weapon Model (Phase 1)'),
(27225,0,9,0,0,1,100,0,9000,12000,9000,14000,11,17174,1,1,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Rifleman - Cast Concussive Shot (Phase 1)'),
(27225,0,10,11,9,1,100,0,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Start Combat Movement at 25 Yards (Phase 1)'),
(27225,0,11,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Rifleman - Start Melee at 25 Yards (Phase 1)'),
(27225,0,12,13,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Start Combat Movement Below 5 Yards (Phase 1)'),
(27225,0,13,14,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Set Ranged Weapon Model Below 5 Yards (Phase 1)'),
(27225,0,14,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Rifleman - Start Melee Below 5 Yards (Phase 1)'),
(27225,0,15,16,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Prevent Combat Movement at 15 Yards (Phase 1)'),
(27225,0,16,0,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Rifleman - Prevent Melee at 15 Yards (Phase 1)'),
(27225,0,17,0,2,1,100,0,0,15,0,0,23,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Set Phase 2 at 15% HP'),
(27225,0,18,19,2,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Start Combat Movement at 15% HP (Phase 2)'),
(27225,0,19,20,61,2,100,1,0,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Flee at 15% HP (Phase 2)'),
(27225,0,20,0,61,2,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - set phase 1 at 15% HP (Phase 2)'),
(27225,0,21,0,7,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Set Melee Weapon Model on Evade'),
(27225,0,22,23,8,0,100,0,@ArthasSpell,0,0,0,3,27465,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman  - Morph to Forgotten Soul'),
(27225,0,23,0,61,0,100,0,0,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Rifleman - Link - Die'),
-- Footman
(27229,0,0,1,62,0,100,0,9545,0,0,0,33,27474,0,0,0,0,0,21,10,0,0,0,0,0,0,'Forgotten Footman - On gossip option select quest credit'), -- deberia Cast 48832
(27229,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Forgotten Footman - Close Gossip'),
(27229,0,2,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0,'Forgotten Footman - Add Forgotten Aura if missing'),
(27229,0,3,0,0,0,100,0,3000,7000,9000,12000,11,32587,0,0,0,0,0,2,0,0,0,0,0,0,0,'Forgotten Footman - Cast Shield Block'),
(27229,0,4,0,38,0,100,0,3,1,0,0,53,1,@FFootman,0,0,0,0,1,0,0,0,0,0,0,0,"Forgotten Footman - On Data set 3 1 - Start Waypoint");

DELETE FROM creature_text WHERE entry IN (@Valonforth,@Emissary,@PrinceArthas,@Muradin);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Valonforth,0,0,'I apologize, emissary, but the prince is away on an errand. What brings you to this desolate place?',12,0,100,1,3000,12719,'Valonforth 0'),
(@Valonforth,1,0,'We''re to just pick up and leave?',12,0,100,6,1500,12720,'Valonforth 1'),
(@Valonforth,2,0,'To hell with the undead! We''ll cut our way through the woods, men!',12,0,100,22,3000,12721,'Valonforth 2'),
(@Valonforth,3,0,'Well, milord, your father had our troops recalled at Lord Uther''s request.',12,0,100,1,3000,12722,'Valonforth 3'),
(@Emissary,0,0,'By royal edict, you men are to return to Lordaeron immediately. Lord Uther has convinced the king to recall this expedition.',12,0,100,25,3500,12723,'Alliance Emissary 0'),
(@Emissary,1,0,'That''s correct. My men report that the roads from here to the shore are held by the undead. You''ll need to find an alternate route back to your ships.',12,0,100,378,4000,12724,'Alliance Emissary 1'),
(@PrinceArthas,0,0,'Captain, why are the guards not at their posts?. ',12,0,100,397,2000,12725,'Prince Arthas 0'),
(@PrinceArthas,1,0,'Uther had my troops recalled? Damn it! If my warriors abandon me, I''ll never defeat Mal''Ganis. The ships must be burned before the men reach the shore!',12,0,100,5,3500,12726,'Prince Arthas 1'),
(@PrinceArthas,2,0,'Burned down to their frames! No one goes home until our job here is done!',12,0,100,25,1700,12727,'Prince Arthas 2'),
(@PrinceArthas,3,0,'Spare me, Muradin. You weren''t there to see what Mal''Ganis did to my homeland.',12,0,100,1,2200,12728,'Prince Arthas 3'),
(@Muradin,0,0,'Isn''t that a bit much, lad?',12,0,100,1,1500,12733,'Muradin 0'),
(@Muradin,1,0,'You lied to your men and betrayed the mercenaries who fought for you. What''s happening to you, Arthas? Is vengeance all that''s important to you?',12,0,100,1,3000,12734,'Muradin 1');

DELETE FROM `waypoints` WHERE entry IN (@Emissary,@PrinceArthas,@Muradin,@FFootman);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@Emissary,1,3087.9968,-1223.3319,11.3495,'Emissary Spawn'),
(@Emissary,2,3094.6638,-1241.1671,10.3504,'Emissary Talk'),
(@Emissary,3,3087.9968,-1223.3319,11.3495,'Emissary Despawn'),
(@PrinceArthas,1,3104.5910,-1226.6417,12.0252,'Prince Arthas Spawn'),
(@PrinceArthas,2,3101.1733,-1238.0469,10.3770,'Prince Arthas Talk'),
(@PrinceArthas,3,3098.1774,-1243.5205,10.6082,'Prince Arthas Cast'),
(@Muradin,1,3105.9204,-1228.2515,11.6541,'Muradin Spawn'),
(@Muradin,2,3103.4113,-1238.8131,10.6220,'Muradin Talk'),
(@FFootman,1,3061.2832,-1241.4072,11.5542,'Forgotten Footman Runaway');