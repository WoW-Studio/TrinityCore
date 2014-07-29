SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `locales_achievement_reward`
-- ----------------------------
DROP TABLE IF EXISTS `locales_achievement_reward`;
CREATE TABLE `locales_achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_loc1` varchar(100) NOT NULL DEFAULT '',
  `subject_loc2` varchar(100) NOT NULL DEFAULT '',
  `subject_loc3` varchar(100) NOT NULL DEFAULT '',
  `subject_loc4` varchar(100) NOT NULL DEFAULT '',
  `subject_loc5` varchar(100) NOT NULL DEFAULT '',
  `subject_loc6` varchar(100) NOT NULL DEFAULT '',
  `subject_loc7` varchar(100) NOT NULL DEFAULT '',
  `subject_loc8` varchar(100) NOT NULL DEFAULT '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of locales_achievement_reward
-- ----------------------------
INSERT INTO `locales_achievement_reward` VALUES ('45', '', '', 'Ihr seid rumgekommen!', '', '', '', '', '', null, null, 'Nun seht Euch mal an!$B$BUnd ich dachte, ich hätte hier an diesem eisigen Ort schon einiges gesehen! Diesem Zwerg scheint es offensichtlich, dass das Feuer eines Forschers in Euren Augen brennt.$B$BTrage diesen Wappenrock mit Stolz, dann wissen Eure Freunde, wem sie nach dem Weg fragen müssen, wenn die Zeit gekommen ist!$B$BMacht weiter so!$B$BBrann Bronzebart', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('46', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('230', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('456', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('614', '', '', 'Für die Allianz!', '', '', '', '', '', null, null, 'Krieg überzieht unsere Länder. Nur die tapfersten aller Helden wagen es, der Horde dort einen Schlag zu versetzen, wo es wehtut. Ihr gehört zu eben diesen Helden.$B$BDer Schlag, den Ihr der Führung der Horde versetzt habt, bereitet unseren Weg für den finalen Angriff. Die Horde wird sich vor der Macht der Allianz verbeugen.$B$BEure Taten bleiben nicht ungewürdigt. Reitet mit Stolz!$B$B--Euer König', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('619', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('714', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('762', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('870', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('871', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('876', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('907', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('913', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('942', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('943', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('945', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('948', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('953', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('978', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1015', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1021', '', '', 'Ganz schön erfolgreich', '', '', '', '', '', null, null, 'Mir ist aufgefallen, was für eine eindrucksvolle Sammlung an Wappenröcken Ihr mit der Zeit gesammelt habt. Ihr könnt diesen hier genauso gut Eurer Sammlung hinzufügen. Er hat in meinem Schrank nur Staub angesetzt.', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1038', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1039', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1174', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1175', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1250', '', '', 'Stinkis neues Zuhause', '', '', '', '', '', null, null, 'Ich habe gehört, wie gut Ihr Euch um unsere pelzigen Freunde kümmert. Ich hoffe, es macht Euch nichts aus, aber ich muss Stinki ein neues Zuhause verschaffen. Er weigert sich einfach, friedlich mit den Anderen zu spielen.$B$BBitte stellt sicher, dass er zweimal täglich gefüttert wird. Und, ähm... er hat eine Schwäche für schwarze Katzen.$B$B--Breanni', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1400', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1402', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1516', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1563', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1656', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1657', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1658', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1681', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1682', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1683', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1684', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1691', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1692', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1693', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1707', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1784', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1793', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('1956', '', '', 'Hohe Schule', '', '', '', '', '', null, null, 'Herzlichen Glückwunsch zu Eurem Abschluss in den Schulen der arkanen Magie. In Anerkennung Eurer Hingabe lege ich diesen speziellen Buchband bei, der die Serie vervollständigt.$B$BIch denke, dass Ihr diesen Folianten sehr unterhaltsam finden werdet. Doch das dürft Ihr selbst entscheiden.$B$BHochachtungsvoll,$B$BRhonin', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2051', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2054', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2096', '', '', 'Der Münzenmeister', '', '', '', '', '', null, null, 'Grüße und Glückwünsche dazu, dass Ihr das gesamte Set der Dalaranmünzen gesammelt habt! Als Belohnung Eurer harten Arbeit habe ich diesem Schreiben ein frisch geprägtes Titansiegel von Dalaran beigelegt. Dies ist eine besondere Münze, die wir nur den leidenschaftlichsten aller Sammler verleihen.$B$BIch hoffe, Ihr findet Freude an dieser speziellen Belohnung. Ihr habt Sie Euch verdient!$B$BHochachtungsvoll,$B$BJepetto Spaßbrumm', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2136', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2143', '', '', 'Führen der Kavalerie', '', '', '', '', '', null, null, 'Ich konnte nicht umhin, zu sehen wie gut Ihr mit Tieren umgeht. Bei allem was hier vorgeht, laufen meine Geschäfte besser denn je.$B$BIch nehme nicht an, dass es Euch etwas ausmacht, für mich auf diesen Albinodrachen aufzupassen. Ich habe einfach nicht genug Zeit, mich um all diese Tiere zu kümmern.$B$BViele Grüße.$B$BMei', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2144', '', '', 'Ein ums andere Mal', '', '', '', '', '', null, null, 'Dadurch, dass in der Ferne immer die Kriegstrommeln ertönen, vergessen die Bewohner Azeroths nur allzu leicht all die Dinge, die das Leben zu bieten hat.$B$BIhr habt hingegen mit Eurer Fähigkeit, Euch daran zu erinnern, wofür wir letztlich kämpfen, die Erhabenheit der guten Völker Azeroths bewahrt. Unsere Siege nicht zu feiern wäre eine weitere Form der Niederlage. Denkt immer daran, Feiernder.$B$BMögen andere von Eurem Frohsinn inspiriert werden.$B$BAlextrasza, die Lebensbinderin', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2145', '', '', 'Ein ums andere Mal', '', '', '', '', '', null, null, 'Dadurch, dass in der Ferne immer die Kriegstrommeln ertönen, vergessen die Bewohner Azeroths nur allzu leicht all die Dinge, die das Leben zu bieten hat.$B$BIhr habt hingegen mit Eurer Fähigkeit, Euch daran zu erinnern, wofür wir letztlich kämpfen, die Erhabenheit der guten Völker Azeroths bewahrt. Unsere Siege nicht zu feiern wäre eine weitere Form der Niederlage. Denkt immer daran, Feiernder.$B$BMögen andere von Eurem Frohsinn inspiriert werden.$B$BAlextrasza, die Lebensbinderin', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2186', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2187', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2188', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2336', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2516', '', '', 'Wie man sich Freunde macht', '', '', '', '', '', null, null, 'Hallo!$B$BWie ich gehört habe, habt Ihr dem kleinen Stinker ein warmes und liebevolles Zuhause geschaffen... Ich frage mich nun, ob Ihr vielleicht Interesse daran hättet, ein weiteres, eigensinniges Waisenkind aufzunehmen?$B$BDieses kleine Kitz ist zwar ein wenig schüchtern, doch sollte es Euch dank des mitgesandten Gegenstandes ein leichtes sein, seine Freundschaft zu gewinnen: seinem Lieblingsleckstein!$B$B--Breanni', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2536', '', '', 'Tierisch viele Reittiere', '', '', '', '', '', null, null, 'Ich habe gehört, dass Eure Ställe inzwischen fast so groß sind wie meine. Beeindruckend! Vielleicht könnten wir einander aushelfen...$B$BIch habe einen Drachenfalken zuviel und hoffe, dass Ihr ihm ein neues Zuhause geben könnt. Natürlich ist es zum Reittier und nicht zum Jagdtier ausgebildet worden und Ihr werdet sehen, dass es Euch genauso loyal und unermüdlich wie jedes meiner anderen Tiere zur Seite stehen wird.$B$BMit freundlichen Grüßen.$B$BMei', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2537', '', '', 'Tierisch viele Reittiere', '', '', '', '', '', null, null, 'Ich habe gehört, dass Eure Ställe inzwischen fast so groß sind wie meine. Beeindruckend! Vielleicht könnten wir einander aushelfen...$B$BIch habe einen Drachenfalken zuviel und hoffe, dass Ihr ihm ein neues Zuhause geben könnt. Natürlich ist es zum Reittier und nicht zum Jagdtier ausgebildet worden und Ihr werdet sehen, dass es Euch genauso loyal und unermüdlich wie jedes meiner anderen Tiere zur Seite stehen wird.$B$BMit freundlichen Grüßen.$B$BMei', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2760', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2761', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2762', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2763', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2764', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2765', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2766', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2767', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2768', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2769', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2797', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2798', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2816', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2817', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2903', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2904', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2957', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('2958', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3036', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3037', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3117', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3259', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3316', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3478', '', '', 'Der vergessene Puter', '', '', '', '', '', null, null, 'Könnt Ihr begreifen, wie es dieser fette Truthahn es lebendig durch den November geschaft hat?!$B$BAlle seine Freunde sind auf den reich gedeckten Tischen serviert worden. Mit Moosbeerenchutney und Gewürzbrotfüllung und... OOOH... jetzt bekomme ich Hunger. Egal! Er ist jetzt ganz allein. Deswegen habe ich überlegt, ob Ihr Euch vielleicht um Ihn kümmern würdet. In meinem Laden ist einfach nicht mehr genug Platz für ihn!$B$BHaltet ihn nur bitte von Kochstellen fern. Er bekommt in ihrer Nähe immer so einen merkwürdigen Blick...$B$B--Breanni', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3656', '', '', 'Der vergessene Puter', '', '', '', '', '', null, null, 'Könnt Ihr begreifen, wie es dieser fette Truthahn es lebendig durch den November geschaft hat?!$B$BAlle seine Freunde sind auf den reich gedeckten Tischen serviert worden. Mit Moosbeerenchutney und Gewürzbrotfüllung und... OOOH... jetzt bekomme ich Hunger. Egal! Er ist jetzt ganz allein. Deswegen habe ich überlegt, ob Ihr Euch vielleicht um Ihn kümmern würdet. In meinem Laden ist einfach nicht mehr genug Platz für ihn!$B$BHaltet ihn nur bitte von Kochstellen fern. Er bekommt in ihrer Nähe immer so einen merkwürdigen Blick...$B$B--Breanni', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3857', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('3957', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4477', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4478', '', '', 'Streuner', '', '', '', '', '', null, null, 'Werter Meister der Geduld, wir möchten Eure Beharrlichkeit belohnen, mit der Ihr immer wieder Dungeons mit Leuten betretet, die Ihr wahrscheinlich noch nie zuvor getroffen habt. Hoffentlich habt Ihr ein paar Jungspunden zeigen können, wie der Hase läuft.$B$BLange Rede, kurzer Sinn. Wir haben zufällig gehört, dass Ihr mit Zufallsgruppen herumstreunt. Und wie der Zufall so will ist hier also ein kleiner Streuner, den wir Euch zufallen lassen, um mit Euch zu streunen, während Ihr zufälligen Zufällen zufallt, oder so.$B$BKnuddels.$B$BDas Entwickler-Team von WoW', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4530', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4583', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4584', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4597', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4598', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4079', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4078', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4080', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4156', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4602', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4603', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('13', '', '', 'Glückwunsch', '', '', '', '', '', null, null, 'Viele Glückwunsche bezüglich eurer Überzeugung, auch die 80. Saison der Abenteurer zu erreichen. Ihr seit zweifellos dem Ziel ergben, Azeroth vom Bösen zu befreien.$B$BObwohl der Weg hierher keine Kleinigkeit war, steht der wahre Kampf erst noch bevor.$B$BKämpft weiter!$B$BRhonin', null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4785', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `locales_achievement_reward` VALUES ('4784', '', '', '', '', '', '', '', '', null, null, null, null, null, null, null, null);
