--Kickin' Nass and Takin' Manes
SET @NPC_STEFAN := 28518;
SET @NPC_WITHERED_TROLL := 28519;
SET @NPC_NASS := 28521;
SET @NPC_NASS_TARGET_KC_BUNNY := 28523;
SET @SPELL_PLAYER_SUMMON_NASS := 51864;
SET @SPELL_SUMMON_NASS := 51865;
SET @SPELL_KICK_NASS := 51866;
SET @SPELL_COLLECT_HAIR_SAMPLE := 51870;
SET @SPELL_HAIR_SAMPLE_COLLECTED := 51872;
SET @SPELL_QUEST_ACCEPT_SUMMON_NASS := 51889;
SET @SPELL_KICKIN_NASS_QUEST_COMPLETION := 51910;

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SPELL_KICK_NASS,@SPELL_COLLECT_HAIR_SAMPLE,@SPELL_KICKIN_NASS_QUEST_COMPLETION);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,@SPELL_KICK_NASS,0,18,3,@NPC_NASS,0,0,'','Spell Kick Nass only targets Nass'),
(13,0,@SPELL_COLLECT_HAIR_SAMPLE,0,18,1,@NPC_NASS_TARGET_KC_BUNNY,0,0,'','Spell Collect Hair Sample only targets Nass Target KC Bunny'),
(13,0,@SPELL_KICKIN_NASS_QUEST_COMPLETION,0,18,3,@NPC_NASS,0,0,'','Spell Kickin'' Nass: Quest Completion only targets Nass');

-- Insert creature_text from sniff
DELETE FROM `creature_text` WHERE `entry` IN (@NPC_STEFAN,@NPC_NASS);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_STEFAN,0,0,'Not sure how ol'' Nass always finds his way back here. Must be by smell....',12,0,100,0,0,0,'Stefan Vadu'),
(@NPC_NASS,0,0,'Let''s go to Zul''Drak he says. We can get to the bottom of this mess, he says...',12,0,33,0,0,0,'Nass'),
(@NPC_NASS,0,1,'One more flock of scourge hair gained, one more shred of dignity lost...',12,0,33,0,0,0,'Nass'),
(@NPC_NASS,0,2,'Are we finished yet?',12,0,33,0,0,0,'Nass');

-- Spellscripts
DELETE FROM `spell_scripts` WHERE `id` IN (@SPELL_PLAYER_SUMMON_NASS,@SPELL_QUEST_ACCEPT_SUMMON_NASS,@SPELL_KICKIN_NASS_QUEST_COMPLETION);
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@SPELL_PLAYER_SUMMON_NASS,0,0,15,@SPELL_SUMMON_NASS,2,0,0,0,0,0), -- On Player Summon Nass cast - Cast Summon Nass
(@SPELL_QUEST_ACCEPT_SUMMON_NASS,0,0,15,@SPELL_SUMMON_NASS,2,0,0,0,0,0), -- On Quest Accept Summon Nass cast - Cast Summon Nass
(@SPELL_KICKIN_NASS_QUEST_COMPLETION,0,0,18,0,0,0,0,0,0,0); -- On Kickin' Nass: Quest Completion - Despawn Nass

-- SmartAIs
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768|256|8, `AIName`='SmartAI' WHERE `entry`=@NPC_NASS;
UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`=`flags_extra`|128 WHERE `entry`=@NPC_NASS_TARGET_KC_BUNNY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_STEFAN,@NPC_WITHERED_TROLL);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_STEFAN,@NPC_WITHERED_TROLL,@NPC_NASS,@NPC_NASS_TARGET_KC_BUNNY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_NASS*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_STEFAN,0,0,1,62,0,100,0,9709,0,0,0,11,@SPELL_PLAYER_SUMMON_NASS,0,0,0,0,0,7,0,0,0,0,0,0,0,'Stefan Vadu - On gossip select - Spellcast'),
(@NPC_STEFAN,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Stefan Vadu - On gossip select - Close gossip'),
(@NPC_STEFAN,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Stefan Vadu - On gossip select - Say line'),
(@NPC_STEFAN,0,3,0,19,0,100,0,12630,0,0,0,11,@SPELL_QUEST_ACCEPT_SUMMON_NASS,0,0,0,0,0,7,0,0,0,0,0,0,0,'Stefan Vadu - On quest accept - Spellcast'),

(@NPC_WITHERED_TROLL,0,0,0,9,0,100,0,0,5,7000,11000,11,54345,0,0,0,0,0,2,0,0,0,0,0,0,0,'Withered Troll - On range - Spellcast Withering Strike'),
(@NPC_WITHERED_TROLL,0,1,0,6,0,100,0,0,0,0,0,11,51869,3,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Troll - On death - Spellcast Summon Nass Target Bunny'),

(@NPC_NASS,0,0,1,54,0,100,0,0,0,0,0,11,51868,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On summon - Spellcast Nass Periodic Say'),
(@NPC_NASS,0,1,2,61,0,100,0,0,0,0,0,11,61438,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On summon - Spellcast Nass Heartbeat'),
(@NPC_NASS,0,2,3,61,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On summon - React defensive'),
(@NPC_NASS,0,3,0,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Nass - On summon - Follow'),
(@NPC_NASS,0,4,5,8,0,100,0,@SPELL_KICK_NASS,0,0,0,5,34,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On spellhit - Play emote'),
(@NPC_NASS,0,5,6,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,19,@NPC_NASS_TARGET_KC_BUNNY,20,0,0,0,0,0,'Nass - On spellhit - Move to closest Nass Target KC Bunny'),
(@NPC_NASS,0,6,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On spellhit - Set event phase'),
(@NPC_NASS,0,7,0,34,1,100,0,0,0,0,0,11,@SPELL_COLLECT_HAIR_SAMPLE,0,0,0,0,0,19,@NPC_NASS_TARGET_KC_BUNNY,5,0,0,0,0,0,'Nass - On movementinform (phase 1) - Spellcast'),
(@NPC_NASS,0,8,9,8,1,100,0,@SPELL_HAIR_SAMPLE_COLLECTED,0,0,0,11,51871,0,0,0,0,0,23,0,0,0,0,0,0,0,'Nass - On spellhit (phase 1) - Spellcast Nass Kill Credit'),
(@NPC_NASS,0,9,0,61,1,100,0,0,0,0,0,80,@NPC_NASS*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On spellhit (phase 1) - Run script'),
(@NPC_NASS,0,10,0,8,0,100,0,51867,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass - On spellhit Nass Say - Say line'),
(@NPC_NASS*100,9,0,0,0,1,100,0,1000,1000,0,0,29,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'Nass'' script - Follow'),
(@NPC_NASS*100,9,1,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass'' script - Set event phase'),

(@NPC_NASS_TARGET_KC_BUNNY,0,0,1,8,0,100,0,@SPELL_COLLECT_HAIR_SAMPLE,0,0,0,11,@SPELL_HAIR_SAMPLE_COLLECTED,0,0,0,0,0,7,0,0,0,0,0,0,0,'Nass Target KC Bunny - On spellhit - Spellcast'),
(@NPC_NASS_TARGET_KC_BUNNY,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nass Target KC Bunny - On spellhit - Despawn');

UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN (28519);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28519) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28519,0,0,0,8,0,100,0,51866,0,0,0,33,28519,0,0,0,0,0,7,0,0,0,0,0,0,0,'Narsch treten und Haare krümmen Quest Credit - On Spell Hit (Narsch treten) - Quest Credit');

DELETE FROM `creature_queststarter` WHERE `quest` = 12630;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 12630;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 12630;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (28518, 12630);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 28518;
DELETE FROM `creature_questender` WHERE `quest` = 12630;
DELETE FROM `gameobject_questender` WHERE `quest` = 12630;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (28518, 12630);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=28518;
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `WDBVerified`) VALUES (12630, 2, 75, 74, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12884, 0, 0, 0, 5, 59000, 125700, 0, 51909, 0, 0, 0, 0, 38659, 1, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kickin\' Nass and Takin\' Manes', 'Stefan in Ebon Watch wants you to use Nass to collect 10 hair samples from Withered Trolls.$b$bIf you lose Nass, return to Stefan to recover him.', 'Before you meet Nass, there\'s something you should know.$b$bHe got a toxic dose of blight back in the day, and now he\'s deaf, blind, and mostly numb.$b$bIt\'s not all bad, though. He\'s virtually immune to the stuff now, which makes him perfect for certain tasks - like the one I\'m about to give you.$b$bThere are many freshly scourged trolls nearby and we need to study the blight\'s effect on them. Take Nass, and this boot. When you\'ve slain a troll, give him a good kick and he\'ll know to take a hair sample.', '', 'You know, you remind me an awful lot of my Nass.$b$bMaybe it\'s just the nose...', 'How\'s that boot holding up, $r?', 'Return to Stefan Vadu at Ebon Watch in Zul\'Drak.', 28519, 0, 0, 0, 10, 0, 0, 0, 38659, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hair Samples Collected', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);
