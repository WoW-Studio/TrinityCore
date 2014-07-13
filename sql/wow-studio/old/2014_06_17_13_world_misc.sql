-- Zeth'Gor Must Burn!
UPDATE `smart_scripts` SET `link`=3 WHERE `entryorguid` IN (22401,21182,22402,22403) AND `source_type`=0 AND `id`=2 AND `link`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22401,21182,22402,22403) AND `source_type`=0 AND `id`=3;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(22401,3,61,33,22401,7,'Zeth''Gor Quest Credit Marker, They Must Burn, Tower North - On spell hit - Give Quest Credit'),
(21182,3,61,33,21182,7,'Zeth''Gor Quest Credit Marker, They Must Burn, Tower South - On spell hit - Give Quest Credit'), 
(22402,3,61,33,22402,7,'Zeth''Gor Quest Credit Marker, They Must Burn, Tower Forge - On spell hit - Give Quest Credit'),
(22403,3,61,33,22403,7,'Zeth''Gor Quest Credit Marker, They Must Burn, Tower Foothill - On spell hit - Give Quest Credit');

UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN (20813,20815,20816,20814);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (20813,20815,20816,20814) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(20813,0,0,0,8,0,100,0,35724,0,0,0,33,20813,0,0,0,0,0,7,0,0,0,0,0,0,0,'Zeth''Gor Quest Credit Marker, Barracks - On Spell Hit (Throw Torch) - Quest Credit'),
(20814,0,0,0,8,0,100,0,35724,0,0,0,33,20814,0,0,0,0,0,7,0,0,0,0,0,0,0,'Zeth''Gor Quest Credit Marker, Stable - On Spell Hit (Throw Torch) - Quest Credit'),
(20815,0,0,0,8,0,100,0,35724,0,0,0,33,20815,0,0,0,0,0,7,0,0,0,0,0,0,0,'Zeth''Gor Quest Credit Marker, East Hovel - On Spell Hit (Throw Torch) - Quest Credit'),
(20816,0,0,0,8,0,100,0,35724,0,0,0,33,20816,0,0,0,0,0,7,0,0,0,0,0,0,0,'Zeth''Gor Quest Credit Marker, West Hovel - On Spell Hit (Throw Torch) - Quest Credit');
