-- Galak Assassin SAI
SET @ENTRY := 10720;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,10638,50,0,0,0,0,0,"Galak Assassin - On Just Summoned - Start Attacking");

-- Fix Quest Wir nennen ihn Stahlfeder ID: 11418
DELETE FROM `creature_queststarter` WHERE `quest` = 11418;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 11418;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 11418;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (24139, 11418);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 24139;
DELETE FROM `creature_questender` WHERE `quest` = 11418;
DELETE FROM `gameobject_questender` WHERE `quest` = 11418;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (24139, 11418);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=24139;
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES (11418, 2, 70, 68, 0, 495, 0, 0, 0, 0, 1101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11269, 0, 0, 0, 4, 34000, 5700, 0, 0, 0, 0, 0, 0, 34026, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1050, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'We Call Him Steelfeather', 'Locate Steelfeather circling Fort Wildervar and use the Feathered Charm to discover his secret. Report your findings to Gil Grisert.', 'We see one brave hippogryph circling over the fort, then swooping down and taking prey. Jethan over there has taken a couple of shots at the creature, but his arrows bounced right off!$B$BWe\'ve taken to calling this remarkable creature Steelfeather, but we can\'t see why he prefers the area around Fort Wildervar. Most hippogryphs are wary of people.$B$BResearcher Aderan has helped us fashion a charm from one of the creature\'s feathers. He claims it will allow the user to see through Steelfeather\'s eyes.', '', 'You saw a nest, with hatchlings? Hmm... so our "he" is actually a "she," eh?$b$bI guess that settles it. I suppose I wouldn\'t want to move a nest full of hatchlings just because of a new neighbor, either.$b$b<Gil favors Trapper Jethan with a mock glare.>$b$bI\'m sure we\'d get along just fine if ol\' Jethan would stop trying to make a trophy of her.', 'Did Aderan\'s charm work?', 'Return to Gil Grisert at Fort Wildervar in Howling Fjord.', 24515, 0, 0, 0, 1, 0, 0, 0, 0, 0, 34026, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Learn Steelfeather\'s Secret', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);

-- Fix Quest Wir nennen ihn Stahlfeder ID: 11418
SET @ENTRY := 24514;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,43969,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Faction 35"),
(@ENTRY,0,1,2,61,0,100,0,43969,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Reactstate Passive"),
(@ENTRY,0,2,3,61,0,100,0,43969,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Stop Attacking"),
(@ENTRY,0,3,4,61,0,100,0,43969,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2574.59,-5223.03,380.069,3.52568,"Steelfeather - On Spellhit 'Feathered Charm' - Move To Position"),
(@ENTRY,0,4,0,61,0,100,0,43969,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Event Phase 1"),
(@ENTRY,0,5,6,0,1,100,1,8000,8000,0,0,33,24515,0,0,0,0,0,7,0,0,0,0,0,0,0,"Steelfeather - In Combat - Quest Credit 'We Call Him Steelfeather' (Phase 1) (No Repeat)"),
(@ENTRY,0,6,0,61,1,100,1,8000,8000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - In Combat - Despawn Instant (Phase 1) (No Repeat)"),
(@ENTRY,0,7,0,0,0,100,0,3400,500,12400,14500,11,49865,0,0,0,0,0,2,0,0,0,0,0,0,0,"Steelfeather - In Combat - Cast 'Eye Peck'"),
(@ENTRY,0,8,0,0,0,100,0,2400,4000,8000,11400,11,18144,0,0,0,0,0,2,0,0,0,0,0,0,0,"Steelfeather - In Combat - Cast 'Swoop'");

--
DELETE FROM `gossip_menu` WHERE `text_id` IN (3522, 3525, 3495);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(2831, 3522),
(2831, 3525),
(2801, 3495);

--
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceEntry` IN (3522, 3525, 3495) AND `ConditionTypeOrReference`=8;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(14, 2831, 3522, 0, 0, 8, 0, 271, 0, 0, 0, 0, 0, '', 'Show gossip text if player has quest 271 completed'),
(14, 2831, 3525, 0, 0, 8, 0, 9305, 0, 0, 0, 0, 0, '', 'Show gossip text if player has quest 531 completed'),
(14, 2801, 3495, 0, 0, 8, 0, 531, 0, 0, 0, 0, 0, '', 'Show gossip text if player has quest 9305 completed');

DELETE FROM `smart_scripts` WHERE `entryorguid`=28161;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28161, 0, 0, 1, 8, 0, 100, 0, 51959, 0, 0, 0, 28, 51846, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Spellhit - Remove Aura Scared Chicken'),
(28161, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Spellhit - Set Npc Flag'),
(28161, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Spellhit - Forced Despawn'),
(28161, 0, 3, 4, 64, 0, 100, 0, 0, 0, 0, 0, 85, 51037, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Gossip Hello - Invoker Cast Capture Chicken Escapee'),
(28161, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Gossip Hello - Close Gossip'),
(28161, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Gossip Hello - Set Npcflag None'),
(28161, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 51846, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Gossip Hello - Remove Aura Scared Chicken'),
(28161, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Gossip Hello - Forced Despawn'),
(28161, 0, 8, 9, 25, 0, 100, 0, 0, 0, 0, 0, 11, 50734, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Reset - Cast Frenzyheart Chicken: Invisibility'),
(28161, 0, 9,10, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51846, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Reset - Cast Scared Chicken'),
(28161, 0,10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - On Reset - Set Npc Flags');

-- NPC 'Onyx Flamecaller' - 39814 & 39815
UPDATE creature_template SET mindmg = '422', maxdmg = '586', attackpower = '642', dmg_multiplier = '7.5' WHERE entry IN (39814,39815);

-- NPC 'Baltharus the Warborn' (Clone) - 39899 (N)
UPDATE creature_template SET mindmg = '497', maxdmg = '676', attackpower = '795', dmg_multiplier = '35' WHERE entry =39899;
-- NPC 'Baltharus the Warborn' (Clone) - 39922 (H)
UPDATE creature_template SET mindmg = '497', maxdmg = '497', attackpower = '795', dmg_multiplier = '70', baseattacktime = '2000' WHERE entry =39922;

-- NPC 'Saviana Ragefire' - 39747 (N)
UPDATE creature_template SET mindmg = '497', maxdmg = '676', attackpower = '795', dmg_multiplier = '35' WHERE entry =39747;
-- NPC 'Saviana Ragefire' - 39823 (H)
UPDATE creature_template SET mindmg = '497', maxdmg = '497', attackpower = '795', dmg_multiplier = '70' WHERE entry =39823;

-- NPC 'General Zarithrian' - 39746 (N)
UPDATE creature_template SET mindmg = '497', maxdmg = '676', attackpower = '795', dmg_multiplier = '35' WHERE entry =39746;
-- NPC 'General Zarithrian' - 39805 (H)
UPDATE creature_template SET mindmg = '497', maxdmg = '497', attackpower = '795', dmg_multiplier = '70' WHERE entry =39805;
