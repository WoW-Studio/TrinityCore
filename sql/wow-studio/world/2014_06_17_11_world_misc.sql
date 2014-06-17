--Getting the Bladespire Tanked
UPDATE `creature_template` SET `ainame`='', `scriptname`='npc_bloodmaul_brute' WHERE `entry`=19995;
DELETE FROM `smart_scripts` WHERE `entryorguid`=19995 AND `source_type`=0;