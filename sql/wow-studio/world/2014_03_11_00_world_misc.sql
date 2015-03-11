-- Fix Quest Stromausfall ID:12154
UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN (27075);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27075) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(27075,0,0,0,8,0,100,0,47935,0,0,0,33,27075,0,0,0,0,0,7,0,0,0,0,0,0,0,'Stromausfall Quest Credit - On Spell Hit (Kraftkern zerstören) - Quest Credit');


-- Fix Quest Anatol wird reden ID:12330
SET @SASHA := 26935;
SET @ANATOLY := 26971;
SET @HORSE := 27626;
SET @TATJANA := 27627;
SET @SPELL_SHOOT := 48815;
SET @SPELL_DART := 49134;
SET @SPELL_PING := 49135;
SET @SPELL_MOUNT_HORSE := 49138;
DELETE FROM `creature` WHERE `guid` IN (118152,118160);
DELETE FROM `creature_text` WHERE `entry` IN (@SASHA,@ANATOLY);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@SASHA,0,0,'I''m old enough to shoot beasts like you right between the eyes... at twice this distance.',12,0,100,0,0,0,0,0,'Sasha'),
(@SASHA,1,0,'Don''t you dare talk about my father, monster. He was twice the man you''ll ever be.',12,0,100,0,0,0,0,0,'Sasha'),
(@SASHA,2,0,'I''d rather be dead than be one of you! You think you''re still human? You''re... animals!',12,0,100,0,0,0,0,0,'Sasha'),
(@SASHA,3,0,'Surprise, you scum!  You''re going to tell me where my sister is or I''ll put a bucketful of truesilver bullets through your wife''s heart.',12,0,100,0,0,0,0,0,'Sasha'),
(@SASHA,4,0,'Where is Anya?',12,0,100,0,0,0,0,0,'Sasha'),
(@SASHA,5,0,'There is one last thing.  I need to know where Arugal is.',12,0,100,0,0,0,0,0,'Sasha'),
(@ANATOLY,0,0,'How old are you, lass?',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,1,0,'You won''t get away with this, you know? You''re just a kid.',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,2,0,'Your father was weak, Sasha... he didn''t have the guts to do what had to be done.',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,3,0,'We''ll all end up serving the Lich King, kid. Better this way than becoming a rotten corpse.',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,4,0,'Stop!  Do not shoot!  Do not hurt Tatjana!',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,5,0,'The brat''s held prisoner in the wolf den on the other side of the mountain.  She was to be taken to Arugal.  Are we free to go now?',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,6,0,'Forgive me, Tatjana... ',12,0,100,0,0,0,0,0,'Anatoly'),
(@ANATOLY,7,0,'Nothing you can do can compare to what Arugal can do to us!  I will tear you apart myself!',12,0,100,0,0,0,0,0,'Anatoly');

DELETE FROM `vehicle_template_accessory` WHERE `entry`=@HORSE;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(@HORSE,@TATJANA,0,0,'Tatjana''s Horse',8,30000);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@HORSE;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@HORSE,@SPELL_MOUNT_HORSE,1,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SPELL_DART,@SPELL_PING);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL_SHOOT;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,@SPELL_SHOOT,0,0,31,0,3,@ANATOLY,0,0,0,0,'','Spell Shoot targets Anatoly'),
(13,1,@SPELL_DART,0,0,31,0,3,@TATJANA,0,0,0,0,'','Spell Tranquilizer Dart targets Tatjana'),
(13,1,@SPELL_PING,0,0,31,0,3,@HORSE,0,0,0,0,'','Spell Tatjana Ping effect0 targets Tatjana''s Horse');

UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=@ANATOLY;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@SASHA,@ANATOLY,@TATJANA);

UPDATE `creature_template` SET `speed_run`=1.28571, `AIName`='SmartAI' WHERE `entry`=@HORSE;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SASHA,@ANATOLY,@HORSE,@TATJANA) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SASHA*100,@ANATOLY*100,@ANATOLY*100+1,@ANATOLY*100+2,@ANATOLY*100+3,@ANATOLY*100+4,@HORSE*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SASHA,0,0,3,38,1,100,0,0,1,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 1 (phase 1) - Say line'),
(@SASHA,0,1,3,38,1,100,0,0,2,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 2 (phase 1) - Say line'),
(@SASHA,0,2,3,38,1,100,0,0,3,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 3 (phase 1) - Say line'),
(@SASHA,0,3,0,61,1,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - Linked with events 0,1,2 (phase 1) - Set data 0 0'),
(@SASHA,0,4,5,38,0,100,0,0,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On data set 0 4 - Set event phase 0'),
(@SASHA,0,5,0,61,0,100,0,0,0,0,0,80,@SASHA*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On data set 0 4 - Run script'),
(@SASHA,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On reset - Set event phase 1'),
(@ANATOLY,0,0,0,1,1,100,0,10000,20000,45000,60000,87,@ANATOLY*100+1,@ANATOLY*100+2,@ANATOLY*100+3,@ANATOLY*100+4,0,0,1,0,0,0,0,0,0,0,'Anatoly - On update OOC (phase 1) - Run random script'),
(@ANATOLY,0,1,2,38,0,100,0,0,1,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On data set 0 1 - Set event phase 0'),
(@ANATOLY,0,2,3,61,0,100,0,0,1,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On data set 0 1 - Set run'),
(@ANATOLY,0,3,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,4057.442,-4140.824,211.1911,0,'Anatoly - On data set 0 1 - Move to position'),
(@ANATOLY,0,4,5,34,0,100,0,0,1,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On movement inform - Set unit_field_bytes1 (kneel)'),
(@ANATOLY,0,5,0,61,0,100,0,0,0,0,0,80,@ANATOLY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On movement inform - Run script'),
(@ANATOLY,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On reset - Set event phase 1'),
(@HORSE,0,0,0,11,0,100,0,0,0,0,0,28,@SPELL_MOUNT_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spawn - Remove aura Mount Tatjana''s Horse'),
(@HORSE,0,1,2,8,0,100,0,@SPELL_PING,0,0,0,2,1812,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Set faction'),
(@HORSE,0,2,3,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Stop autoattack'),
(@HORSE,0,3,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Set eventphase 1'),
(@HORSE,0,4,0,8,1,100,0,@SPELL_MOUNT_HORSE,0,0,0,80,@HORSE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Mount Tatjana''s Horse (phase 1) - Run script'),
(@HORSE,0,5,6,40,0,100,0,19,0,0,0,28,@SPELL_MOUNT_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Remove aura Mount Tatjana''s Horse'),
(@HORSE,0,6,7,61,0,100,0,0,0,0,0,15,12330,0,0,0,0,0,21,2,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Quest credit'),
(@HORSE,0,7,8,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,@ANATOLY,0,30,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
(@HORSE,0,8,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Despawn'),
(@TATJANA,0,0,0,11,0,100,0,0,0,0,0,11,43671,0,0,0,0,0,9,@HORSE,0,5,0,0,0,0,'Tatjana - On respawn - Spellcast Ride Vehicle'),
(@TATJANA,0,1,2,8,0,100,0,@SPELL_DART,0,0,0,11,@SPELL_PING,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Spellcast Tatjana Ping'),
(@TATJANA,0,2,3,61,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Set faction'),
(@TATJANA,0,3,0,61,0,100,0,0,0,0,0,18,33024,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Set unit_flags'),
(@TATJANA,0,4,0,0,0,100,0,2000,6000,9000,12000,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tatjana - On update IC - Spellcast Cutdown'),
(@TATJANA,0,5,0,38,0,100,0,0,1,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On data set 0 1 - Despawn after 15 seconds'),
(@SASHA*100,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,1,0,0,0,100,0,17000,17000,0,0,1,4,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,2,0,0,0,100,0,16700,16700,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,3,0,0,0,100,0,10700,10700,0,0,11,@SPELL_SHOOT,0,0,0,0,0,9,@ANATOLY,0,30,0,0,0,0,'Sasha script - Say line'),
(@SASHA*100,9,4,0,0,0,100,0,60000,60000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha script - Set event phase 1'),
(@SASHA*100,9,5,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha script - Set data 0 0'),
(@ANATOLY*100,9,0,0,0,0,100,0,2400,2400,0,0,45,0,4,0,0,0,0,9,@SASHA,0,30,0,0,0,0,'Anatoly script 0 - Set data 0 4'),
(@ANATOLY*100,9,1,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,2,0,0,0,100,0,16800,16800,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,3,0,0,0,100,0,16800,16800,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,4,0,0,0,100,0,5000,5000,0,0,11,47457,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Spellcast Worgen Transform - Male'),
(@ANATOLY*100,9,5,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Reset unit_field_bytes1'),
(@ANATOLY*100,9,6,0,0,0,100,0,500,500,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Play emote'),
(@ANATOLY*100,9,7,0,0,0,100,0,150,150,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
(@ANATOLY*100,9,8,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,@TATJANA,0,10,0,0,0,0,'Anatoly script 0 - Set data 0 1'),
(@ANATOLY*100,9,9,0,0,0,100,0,1200,1200,0,0,69,0,0,0,0,0,0,8,0,0,0,4069.991,-4130.805,211.464,0,'Anatoly script 0 - Move to position'),
(@ANATOLY*100,9,10,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Despawn'),
(@ANATOLY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 1 - Say line'),
(@ANATOLY*100+1,9,1,0,0,0,100,0,2000,2000,0,0,45,0,1,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 1 - Set data 0 1'),
(@ANATOLY*100+2,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 2 - Say line'),
(@ANATOLY*100+2,9,1,0,0,0,100,0,3500,3500,0,0,45,0,1,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 2 - Set data 0 1'),
(@ANATOLY*100+3,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 3 - Say line'),
(@ANATOLY*100+3,9,1,0,0,0,100,0,5000,5000,0,0,45,0,2,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 3 - Set data 0 1'),
(@ANATOLY*100+4,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 4 - Say line'),
(@ANATOLY*100+4,9,1,0,0,0,100,0,5000,5000,0,0,45,0,3,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 4 - Set data 0 1'),
(@HORSE*100,9,0,0,0,0,100,0,500,500,0,0,53,1,@HORSE,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse script - Start WP movement');


DELETE FROM `creature_queststarter` WHERE `quest` = 12330;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 12330;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 12330;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (26935, 12330);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 26935;
DELETE FROM `creature_questender` WHERE `quest` = 12330;
DELETE FROM `gameobject_questender` WHERE `quest` = 12330;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (26935, 12330);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=26935;
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES (12330, 2, 75, 73, 0, 394, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12329, 0, 0, 0, 4, 0, 94200, 0, 0, 0, 0, 0, 0, 37665, 1, 0, 130, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38744, 38752, 38748, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anatoly Will Talk', 'Sasha at the White Pine Trading Post wants you to take the Tranquilizer Dart and use it on Tatjana in Solstice Village.  Bring Tatjana back to the White Pine Trading Post.', 'My sister is here somewhere, and I can\'t seem to get this monster to talk.$B$BHe doesn\'t seem to care about his own well-being, but I\'ve an idea.  I knew Anatoly\'s wife, Tatjana, from before the wolfcult arrived -- she was a horse-handler.$B$BTake this tranquillizer dart.  Bring her back alive, we\'re going to need her if we\'re to have any leverage with Anatoly.$B$BI will help you find the person behind all this once we save my sister.', 'Tatjana Delivered', 'That... that was close.$B$BWe need to save Anya.  Now!', 'I\'m glad to see you in one piece.', 'Return to Sasha at White Pine Trading Post in Grizzly Hills.', 0, 0, 0, 0, 0, 0, 0, 0, 37665, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);


-- Fix Credit Die gefallenen Schwestern ID:11314
UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN (23678);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23678) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23678,0,0,0,8,0,100,0,49624,0,0,0,33,23678,0,0,0,0,0,7,0,0,0,0,0,0,0,'Lurielle Pendant Quest Credit - On Spell Hit (Lurielle Pendant) - Quest Credit');


-- Fix Quest Die gefallenen Schwestern ID:11314
DELETE FROM `creature_queststarter` WHERE `quest` = 11314;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 11314;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 11314;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (24117, 11314);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 24117;
DELETE FROM `creature_questender` WHERE `quest` = 11314;
DELETE FROM `gameobject_questender` WHERE `quest` = 11314;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (24117, 11314);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=24117;
REPLACE INTO `quest_template` (`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`, `RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`, `RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`, `RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`, `RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`, `RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`, `RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`, `RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`, `RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`, `RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`, `Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`, `RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`, `RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `VerifiedBuild`) VALUES (11314, 2, 71, 69, 0, 495, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11313, 11319, 0, 0, 5, 47000, 24000, 0, 0, 0, 0, 0, 0, 33606, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Fallen Sisters', 'Lurielle at the Frozen Glade wants you to use her pendant on 7 Chill Nymphs.', 'To the southwest was a glade that used to look much like this one. Mysterious forces and alien magics are reshaping the land. The glade has thawed, the sisters living there driven mad by the sudden change.$B$BWe thought to reach out to them, but they attacked us. I fear many may be beyond saving, but I cannot give up hope.$B$BTake my pendant, travel southwest to the Vibrant Glade, and use it to try to free my sisters.', '', 'So there is hope for my sisters?$B$B<Lurielle looks away from you, then down at the ground.>$B$BI feel guilty for not thinking of the pendant sooner. We might have saved even more of the sisters.', 'Were you able to heal any of my sisters using the pendant?', 'Return to Lurielle at the Frozen Glade in Howling Fjord.', 23678, 0, 0, 0, 7, 0, 0, 0, 0, 33606, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chill Nymphs Freed', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12340);


-- Fix Quest Der Than von Voldrune ID:12255
DELETE FROM `creature_template_addon` WHERE `entry`=27292;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(27292, 0, 0, 33554432, 0, 0, '55971');