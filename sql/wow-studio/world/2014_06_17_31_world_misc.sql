--On Ruby Wings 
 UPDATE `creature_template` SET `spell1`=50430, `spell2`=55987, `spell3`=50348, `InhabitType`=4 WHERE `entry`=27996;

    DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (27996);
    INSERT INTO `npc_spellclick_spells` VALUES (27996, 50343, 1, 0);

    DELETE FROM `creature_template_addon` WHERE `entry`=27996;
    INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
    (27996,0,0,50331648,0,0,'50345');

    UPDATE vehicle_template_accessory set minion=0 where entry=28018; 

    UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (28006,28018);

    Delete from creature_loot_template where entry =28006 and item=38305;

    Delete from creature_template_addon where entry =28006;

    DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=50348;
    INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
    (13,1,50348,0,1,31,0,3,28005,0,0,0,0,'','Flame Furor can only Hit Wastes Scavenger');

    DELETE FROM smart_scripts WHERE entryorguid = 28006;
    INSERT INTO smart_scripts VALUES
    (28006, 0, 0, 0, 0, 0, 100, 0, 7000, 7000, 18000, 18000, 11, 32863, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - Cast Demon Seed'),
    (28006, 0, 1, 0, 0, 0, 100, 0, 1100, 1100, 20000, 20000, 11, 50455, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - Cast Shadow Bolt'),
    (28006, 0, 2, 0, 1, 0, 100, 1, 9000, 11000, 30000, 30000, 1, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok -- OOC Random Yell'),
    (28006, 0, 3, 0, 38, 0, 100, 0, 0, 1, 0, 0, 28, 50494, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok -- On Set Data Remove Aura'),
    (28006, 0, 4, 0, 1, 0, 100, 1, 1000, 1000, 30000, 30000, 1, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok -- OOC Random Yell'),
    (28006, 0, 5, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 50494, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok -- On spawn Cast Shroud of Lightning'),
    (28006, 0, 6, 0, 2, 0, 100, 1, 0, 25, 0, 0, 11, 50497, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - Cast Scream of Chaos'),
    (28006, 0, 7, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 50472, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok - On Death Cast Drop Scythe of Antiok'),
    (28006, 0, 8, 9, 4, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok -- On Aggro Yell'),
    (28006, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 55984, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nekrolord Antiok -- On Aggro Cast Shadow Bolt');

    DELETE FROM smart_scripts WHERE entryorguid = 28018;
    INSERT INTO smart_scripts VALUES
    (28018, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 12000, 14000, 11, 50456, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast Thiassi''s Stormbolt'),
    (28018, 0, 1, 0, 0, 0, 100, 0, 9000, 9000, 15000, 19000, 11, 15593, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast War Stomp'),
    (28018, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 11, 28006, 10, 0, 0, 0, 0, 0, 'Set data on Antiok on Death');

    DELETE FROM creature_text WHERE entry = 28006;
    INSERT INTO creature_text VALUES
    (28006,0,1,'You think you have won, mortal? Face the unbridled power of Antiok!',14,0,100,0,0,0,'Antiok Yell1'),
    (28006,0,2,'Behold! The Scythe of Antiok!',14,0,100,0,0,0,'Antiok Yell2'),
    (28006,1,1,'Soon the bones of Galakrond will rise from their eternal slumber and wreak havoc upon this world!',14,0,100,0,0,0,'Antiok Yell3'),
    (28006,1,2,'The Lich King demands more frost wyrms be sent to Angrathar! Meet his demands or face my wrath!',14,0,100,0,0,0,'Antiok Yell4'),
    (28006,1,3,'Faster, dogs! We must not relent in our assault against the interlopers!',14,0,100,0,0,0,'Antiok Yell5'),
    (28006,2,1,'Attackers are upon us! Let none through to this ancient grave!',14,0,100,0,0,0,'Antiok Yell6'),
    (28006,2,2,'Hear me, minions! Hear your lord, Antiok! Double your efforts or pay the consequences of failure!',14,0,100,0,0,0,'Antiok Yell7');