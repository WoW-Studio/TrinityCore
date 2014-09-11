-- Fix Quest Der Sturz des Schwarzen Ritters ID:13664
 
SET @QUEST := 13664;
SET @NPC_BLACK_KNIGHT := 33785;
SET @NPC_BLACK_KNIGHT_GRYPHON = 33513; 
SET @NPC_CAVIN := 33522;
SET @SPELL_CHARGE := 63003;
SET @SPELL_SHIELD_BREAKER := 65147;
SET @SPELL_DARK_SHIELD := 64505;
SET @SPELL_BLACK_NIGHT_TRANSFORM := 64490; -- Apply Aura: Change Model (34104)
SET @SPELL_BLACK_NIGHT_TRANSFORM_2 := 64498; -- Apply Aura: Increase Max Health
SET @SPELL_FULL_HEAL := 25840;
SET @GOSSIP := 10383;
 
-- Add Gossip to NPC Cavin
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=1;
INSERT INTO `gossip_menu_option` VALUES
(@GOSSIP,1,0,'Ask Cavin to summon the Black Knight.',33802,1,1,0,0,0,0,NULL,0);
 
-- Add gossip_menu_option condition for 13664
DELETE FROM conditions WHERE SourceGroup=@GOSSIP AND SourceTypeOrReferenceId=15;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,@GOSSIP,1,0,9,@QUEST,0,0,0,'','Only show gossip when player is on quest The Black Knight\'s Fall');
 
--
-- SAI for NPC Cavin 
--
UPDATE `creature_template` SET AIName='SmartAI' WHERE `entry`=@NPC_CAVIN;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_CAVIN;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@NPC_CAVIN*100;
INSERT INTO `smart_scripts` VALUES
(@NPC_CAVIN,0,0,1,62,0,100,0,@GOSSIP,1,0,0,80,@NPC_CAVIN*100,0,2,0,0,0,1,0,0,0,0,0,0,0,'Cavin - On gossip option select - Run script'),
(@NPC_CAVIN,0,1,2,61,0,100,0,0,0,0,0,12,@NPC_BLACK_KNIGHT,1,120000,0,0,0,8,0,0,0,8436.9,970.9,544.7,0,'Cavin - On gossip option select - Summon the Black Knight'),
(@NPC_CAVIN,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cavin - On gossip option select - Close gossip'),
(@NPC_CAVIN*100,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cavin - On Script - Turn off Gossip & Gossip flags'),
(@NPC_CAVIN*100,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cavin - On Script - Say text 0'),
(@NPC_CAVIN*100,9,2,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cavin - On Script - Say text 1');
 
-- Add text for NPC Cavin
DELETE FROM `creature_text` WHERE `entry`=@NPC_CAVIN;
INSERT INTO `creature_text` VALUES 
(@NPC_CAVIN,0,0,'$N challenges the Black Knight to trial by combat!',14,0,0,0,0,0,'yell',0),
(@NPC_CAVIN,1,0,'Good luck, $N.',12,0,0,0,0,0,'say',0);
 
--
-- SAI for NPC The Black Knight 
--
UPDATE `creature_template` SET AIName='SmartAI' WHERE `entry`=@NPC_BLACK_KNIGHT;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_BLACK_KNIGHT;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@NPC_BLACK_KNIGHT*100;
INSERT INTO `smart_scripts` VALUES
(@NPC_BLACK_KNIGHT,0,0,0,54,0,100,1,0,0,0,0,43,@NPC_BLACK_KNIGHT_GRYPHON,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - Just Summoned - Mount to entry'),
(@NPC_BLACK_KNIGHT,0,1,0,4,0,100,1,0,0,0,0,11,@SPELL_CHARGE,0,0,0,0,0,2,0,0,0,0,0,0,0,'Blackknight - On Aggro - Cast Charge'),
(@NPC_BLACK_KNIGHT,0,2,3,0,0,100,0,15000,20000,15000,20000,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Aggro - Set Phase 1'),
(@NPC_BLACK_KNIGHT,0,3,0,61,1,100,0,0,0,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - In Phase 1 - Flee for assist'),
(@NPC_BLACK_KNIGHT,0,4,0,9,1,100,0,5,30,1000,1000,11,@SPELL_CHARGE,0,0,0,0,0,2,0,0,0,0,0,0,0,'Blackknight - In Phase 1 - Cast Charge'),
(@NPC_BLACK_KNIGHT,0,5,0,9,1,100,0,3,30,1500,2000,11,@SPELL_SHIELD_BREAKER,0,0,0,0,0,2,0,0,0,0,0,0,0,'Blackknight - In Phase 1 & On Range - Cast Shield Breaker'),
(@NPC_BLACK_KNIGHT,0,6,0,6,0,100,1,0,0,0,0,81,1,0,0,0,0,0,9,@NPC_CAVIN,0,200,0,0,0,0,'Blackknight - On Death - Turn on Gossip & Gossip flags on Cavin'),
(@NPC_BLACK_KNIGHT,0,7,8,1,0,100,0,60000,60000,80000,80000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - Out Of Combat after 60s - Despawn'),
(@NPC_BLACK_KNIGHT,0,8,0,61,0,100,0,0,0,0,0,81,1,0,0,0,0,0,9,@NPC_CAVIN,0,200,0,0,0,0,'Blackknight - Out Of Combat after 60s - Turn on Gossip & Gossip flags on Cavin'),
(@NPC_BLACK_KNIGHT,0,9,0,2,1,100,1,0,25,0,0,80,@NPC_BLACK_KNIGHT*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On 25% health - Run script'),
(@NPC_BLACK_KNIGHT*100,9,0,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Evade'),
(@NPC_BLACK_KNIGHT*100,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - State passive'),
(@NPC_BLACK_KNIGHT*100,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Say text 0'),
(@NPC_BLACK_KNIGHT*100,9,3,0,0,0,100,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Unmount'),
(@NPC_BLACK_KNIGHT*100,9,4,0,0,0,100,0,0,0,0,0,11,@SPELL_DARK_SHIELD,2,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Cast Dark Shield'),
(@NPC_BLACK_KNIGHT*100,9,5,0,0,0,100,0,6000,6000,0,0,11,@SPELL_BLACK_NIGHT_TRANSFORM,2,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Apply Aura'),
(@NPC_BLACK_KNIGHT*100,9,6,0,0,0,100,0,0,0,0,0,11,@SPELL_FULL_HEAL,2,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Full hp'),
(@NPC_BLACK_KNIGHT*100,9,7,0,0,0,100,0,1000,1000,0,0,11,@SPELL_BLACK_NIGHT_TRANSFORM_2,2,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Increase Max Health'),
(@NPC_BLACK_KNIGHT*100,9,8,0,0,0,100,0,0,0,0,0,43,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Blackknight - On Script - Unmount player'),
(@NPC_BLACK_KNIGHT*100,9,9,0,0,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - State Aggresive'),
(@NPC_BLACK_KNIGHT*100,9,10,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blackknight - On Script - Say text 1'),
(@NPC_BLACK_KNIGHT*100,9,11,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Blackknight - On Script - Start Attack');
 
-- Add text for NPC The Black Knight 
DELETE FROM `creature_text` WHERE `entry`=@NPC_BLACK_KNIGHT;
INSERT INTO `creature_text` VALUES 
(@NPC_BLACK_KNIGHT,0,0,'Get off that horse and fight me man-to-man!',14,0,0,0,0,0,'yell',0),
(@NPC_BLACK_KNIGHT,1,0,'I will not fail you, master!',14,0,0,0,0,0,'yell',0);

-- Fix Quest Spirituelle Eingebung ID:12028
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=47190;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(47190,47189,0,'Spirituelle Eingebung');
