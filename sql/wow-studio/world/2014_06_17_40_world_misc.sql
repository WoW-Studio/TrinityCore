-- Sai for Explosive Sheep
    UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`  IN(2675);
    DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2675) and `source_type`=0;
    INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
    (2675, 0, 0, 0, 9,  0, 100, 1, 0, 1, 0, 0, 11, 4050 , 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Explosive Sheep - On Range - Cast Explosive sheep'),
    (2675, 0, 1, 0, 1,  0, 100, 1, 180000, 180000, 0, 0, 41, 0 , 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Explosive Sheep - OOC - Despawn');