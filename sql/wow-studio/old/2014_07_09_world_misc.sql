DELETE FROM `disables` WHERE `sourceType`=7 AND `entry` IN (649,650);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(7, 649, 0, '', '', 'MMAPS - Trial of the Grand Crusader'),
(7, 650, 0, '', '', 'MMAPS - Trial of the Champion');
