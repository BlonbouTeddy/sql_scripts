
CREATE TABLE `dusoleil`.`platform`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`subscriber`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`user`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`convention`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`record`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`entourage`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`origin`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`paramenum`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`socialtrack`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`socialtracktype`(
    id bigint PRIMARY KEY
);

CREATE TABLE `dusoleil`.`terminatetype`(
    id bigint PRIMARY KEY
);


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Base de données :  `dusoleilsfeir`

-- --------------------------------------------------------
-- CREATION DES TABLES ------------------------------------
-- --------------------------------------------------------
USE `dusoleil`;
-- SET FOREIGN_KEY_CHECKS = 0;

--
-- Structure de la table `convention`
--

DROP TABLE `convention`;

CREATE TABLE `convention` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `convention`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `convention`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `entourage`
--

DROP TABLE `entourage`;

CREATE TABLE `entourage` (
  `id` bigint NOT NULL,
  `subscriber_id` int DEFAULT NULL,
  `civility` int(6) DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_entourage` int(6) DEFAULT NULL,
  `entourage_order` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `entourage`
  ADD PRIMARY KEY (`id`);
  

ALTER TABLE `entourage`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `origin`
--

DROP TABLE `origin`;

CREATE TABLE `origin` (
  `id` bigint NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `function` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `organism` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `origin`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `origin`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------  

--
-- Structure de la table `platform`
--

DROP TABLE `platform`;

CREATE TABLE `platform` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ipbx` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ipbxpassword` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `platform`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `platform`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `record`
--

DROP TABLE `record`;

CREATE TABLE `record` (
  `id` bigint NOT NULL,
  `subscriber_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `socialtrack_id` int DEFAULT NULL,
  `terminatetype_id` int DEFAULT NULL,
  `type` int(6) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `duration` int(6) NOT NULL,
  `recall` date DEFAULT NULL,
  `forward` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `record`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `record`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `socialtrack`
--

DROP TABLE `socialtrack`;

CREATE TABLE `socialtrack` (
  `id` bigint NOT NULL,
  `subscriber_id` int DEFAULT NULL,
  `socialtracktype_id` int DEFAULT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `socialtrack`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `socialtrack`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `socialtracktype`
--

DROP TABLE `socialtracktype`;

CREATE TABLE `socialtracktype` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `socialtracktype`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `socialtracktype`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `subscriber`
--

DROP TABLE `subscriber`;

CREATE TABLE `subscriber` (
  `id` bigint NOT NULL,
  `convention_id` int DEFAULT NULL,
  `origin_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `platform_id` int DEFAULT NULL,
  `civility` int(6) NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tel2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date NOT NULL,
  `status` int(6) NOT NULL,
  `familystatus` int(6) NOT NULL,
  `housing` int(6) NOT NULL,
  `reference` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthstatus` longtext COLLATE utf8_unicode_ci,
  `mobility` int(6) DEFAULT NULL,
  `view` int(6) DEFAULT NULL,
  `hearing` int(6) DEFAULT NULL,
  `speech` int(6) DEFAULT NULL,
  `consistency` int(6) DEFAULT NULL,
  `subscriber_order` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `origincomment` longtext COLLATE utf8_unicode_ci,
  `origindate` date DEFAULT NULL,
  `terminatedate` date DEFAULT NULL,
  `assigndate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subscriber`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `terminatetype`
--

DROP TABLE `terminatetype`;

CREATE TABLE `terminatetype` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `terminatetype`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `terminatetype`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE `user`;

CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `enabled` int(6) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `platform_id` int DEFAULT NULL,
  `roles` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;


DROP TABLE `paramenum`;

CREATE TABLE `paramenum` (
  `id` bigint NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `paramenum`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `paramenum`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
-- CREATION DES FOREIGN KEY -------------------------------
-- --------------------------------------------------------

ALTER TABLE `entourage`
  ADD KEY `IDX_entourage_subscriber_id` (`subscriber_id`);

ALTER TABLE `entourage`
  ADD CONSTRAINT `FK_entourage_subscriber_id` FOREIGN KEY (`subscriber_id`) REFERENCES `subscriber` (`id`);

ALTER TABLE `record`
  ADD KEY `IDX_record_subscriber_id` (`subscriber_id`),
  ADD KEY `IDX_recor_user_id` (`user_id`),
  ADD KEY `IDX_record_socialtrack_id` (`socialtrack_id`),
  ADD KEY `IDX_record_terminatetype_id` (`terminatetype_id`);

ALTER TABLE `socialtrack`
  ADD KEY `IDX_socialtrack_subscriber_id` (`subscriber_id`),
  ADD KEY `IDX_socialtrack_socialtracktype_id` (`socialtracktype_id`);

ALTER TABLE `subscriber`
  ADD KEY `IDX_subscriber_convention_id` (`convention_id`),
  ADD KEY `IDX_subscriber_origin_id` (`origin_id`),
  ADD KEY `IDX_subscriber_user_id` (`user_id`),
  ADD KEY `IDX_subscriber_platform_id` (`platform_id`);

ALTER TABLE `user`
  ADD KEY `IDX_user_platform_id` (`platform_id`);

-- SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

-- ---------------------------------------------------------------------------
-- TABLE platform ------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
truncate table `dusoleil`.`platform`;
INSERT INTO `dusoleil`.`platform` (`id`, `name`, `ip`, `ipbx`, `ipbxpassword`) VALUES ('1', 'VilleParisis', 'ip', 'ipbx', 'ipbtpwd');
INSERT INTO `dusoleil`.`platform` (`id`, `name`, `ip`, `ipbx`, `ipbxpassword`) VALUES ('2', 'Autun', 'ip', 'ipbx', 'ipbtpwd');
INSERT INTO `dusoleil`.`platform` (`id`, `name`, `ip`, `ipbx`, `ipbxpassword`) VALUES ('3', 'PlatForm Dev', 'ip', 'ipbx', 'ipbtpwd');
INSERT INTO `dusoleil`.`platform` (`id`, `name`, `ip`, `ipbx`, `ipbxpassword`) VALUES ('4', 'PlatForm Test', 'ip', 'ipbx', 'ipbtpwd');
INSERT INTO `dusoleil`.`platform` (`id`, `name`, `ip`, `ipbx`, `ipbxpassword`) VALUES ('5', 'PlatForm Formation', 'ip', 'ipbx', 'ipbtpwd');
-- TABLE platform ------------------------------------------------------------
truncate table `dusoleil`.`user`;
INSERT INTO `dusoleil`.`user` (`id`, `enabled`, `password`, `platform_id`, `roles`, `username`) VALUES ('1','1','$2a$10$6QuNrUKl2QJXFSwhs6FWQOEG/rPplrmUi.w7jg0zx9I5.kRyJm7w2','1','ADMIN','ADMIN');
INSERT INTO `dusoleil`.`user` (`id`, `enabled`, `password`, `platform_id`, `roles`, `username`) VALUES ('2','2','$2a$10$QYqZHzsB8oFtQQKzStQ.Ru6WEYdqvdMyHapQceQXEfL2iPE7P6gm2','2','ADMIN','ADMIN2');
INSERT INTO `dusoleil`.`user` (`id`, `enabled`, `password`, `platform_id`, `roles`, `username`) VALUES ('3','1','$2a$10$dg1/DN5IMCYryY69WyR9b.9o3NVFRfJ1.zLWkk7tj0x44vnlNm9vy','1','BENEVOLE','ERWAN');
INSERT INTO `dusoleil`.`user` (`id`, `enabled`, `password`, `platform_id`, `roles`, `username`) VALUES ('4','1','$2a$10$haO8SuVVrIXPiTRoINuDnu/M4WbcFIDAtvCJhmZRJ5i4aJzjPJ.YG','1','RESPONSABLE','MOSTAFA');
INSERT INTO `dusoleil`.`user` (`id`, `enabled`, `password`, `platform_id`, `roles`, `username`) VALUES ('5','3','$2a$10$slfBHY6w0eG.sW65TCzJZ.ikCv33AJtPygg5ln49QBlCQI65o5i/i','1','ADMIN','ADMIN3');
-- TABLE paramenum ------------------------------------------------------------
truncate table `dusoleil`.`paramenum`;
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('BENEVOLE','ACCOUNTROLE','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('RESPONSABLE','ACCOUNTROLE','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('ADMIN','ACCOUNTROLE','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mr','CIVILITY','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mme','CIVILITY','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mr et Mme','CIVILITY','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très Bon','SANTE','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bon','SANTE','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Moyen','SANTE','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mauvais','SANTE','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très mauvais','SANTE','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très Bon','MOBILITY','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bon','MOBILITY','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Moyen','MOBILITY','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mauvais','MOBILITY','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très mauvais','MOBILITY','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très Bon','SPEECH','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bon','SPEECH','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Moyen','SPEECH','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mauvais','SPEECH','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très mauvais','SPEECH','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très Bon','VIEW','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bon','VIEW','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Moyen','VIEW','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mauvais','VIEW','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très mauvais','VIEW','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très Bon','HEARING','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bon','HEARING','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Moyen','HEARING','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mauvais','HEARING','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très mauvais','HEARING','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très Bon','CONSISTENCY','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bon','CONSISTENCY','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Moyen','CONSISTENCY','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Mauvais','CONSISTENCY','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Très mauvais','CONSISTENCY','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Seul','FAMILYSTATUS','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Couple','FAMILYSTATUS','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Appartement','HOUSING','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Maison','HOUSING','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Chambre dans résidence','HOUSING','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('ASSOCIATION','ORIENTATION','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('AS_DU_CG','ORIENTATION','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('CAISSE_DE_RETRAITE','ORIENTATION','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('CCAS','ORIENTATION','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('CLIC','ORIENTATION','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('MDPH','ORIENTATION','5');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('FAMILLE','ORIENTATION','6');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('MUTELLE','ORIENTATION','7');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('ORGANISME_A_D','ORIENTATION','8');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('RESILIE','CRTYPE','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('NRP','CRTYPE','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('NRP AVEC MESSAGE TEL','CRTYPE','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('CR','CRTYPE','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('SUIVI SOCIAL','CRTYPE','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('','LINKENTOURAGE','0');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Ami','LINKENTOURAGE','1');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Intervenant extérieur','LINKENTOURAGE','2');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Travailleur social','LINKENTOURAGE','3');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Tuteur / Curateur','LINKENTOURAGE','4');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Voisin','LINKENTOURAGE','5');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Aucun','LINKENTOURAGE','6');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Bru ou gendre','LINKENTOURAGE','7');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Cousin','LINKENTOURAGE','8');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Femme','LINKENTOURAGE','9');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Fils','LINKENTOURAGE','10');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Fille','LINKENTOURAGE','11');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Frère / Soeur','LINKENTOURAGE','12');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Neveu / Nièce','LINKENTOURAGE','13');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Petit fils / Petite fille','LINKENTOURAGE','14');
INSERT INTO `dusoleil`.`paramenum` (`text`, `type`, `value`) VALUES ('Pas de CR ou de CR SUIVI SOCIAL existant','MSG_PAS_DE_CR','1');
-- TABLE convention ------------------------------------------------------------
truncate table `dusoleil`.`convention`;
INSERT INTO `dusoleil`.`convention` (`name`) VALUES ('Convention test 1');
INSERT INTO `dusoleil`.`convention` (`name`) VALUES ('Convention test numéro 2');
INSERT INTO `dusoleil`.`convention` (`name`) VALUES ('Convention test troisième 3');
-- TABLE socialtracktype ------------------------------------------------------------
truncate table `dusoleil`.`socialtracktype`;
INSERT INTO `dusoleil`.`socialtracktype` (`name`) VALUES ('MALTRAITANCE');
INSERT INTO `dusoleil`.`socialtracktype` (`name`) VALUES ('INJOIGNABLE');
-- TABLE terminatetype ------------------------------------------------------------
truncate table `dusoleil`.`terminatetype`;
INSERT INTO `dusoleil`.`terminatetype` (`name`) VALUES ('Décès');
INSERT INTO `dusoleil`.`terminatetype` (`name`) VALUES ('Fin de prise en charge');
SET FOREIGN_KEY_CHECKS = 1;
commit;
