-- Fix Quest Unterdrückt den Unterdrücker ID: 11090
insert into smart_scripts values
('22357','0','0','0','8','0','100','0','41291','0','0','0','22','1','0','0','0','0','0','1','0','0','0','0','0','0','0','on spell hit set phase 1'),
('22357','0','1','2','6','1','100','0','0','0','0','0','22','2','0','0','0','0','0','1','0','0','0','0','0','0','0','On death set phase 2'),
('22357','0','2','0','61','2','100','0','0','0','0','0','15','11090','0','0','0','0','0','7','0','0','0','0','0','0','0','Give quest credit on phase 2');

update creature_template set ainame='SmartAI' where entry=22357;

-- Fix NPC Schwarzherz der Hetzer ID: 18667
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
('0', '33676', '7', '', '', 'Blackheart the Inciter - Incite Chaos'), ('0', '33684', '7', '', '', 'Blackheart the Inciter - Incite Chaos b');
