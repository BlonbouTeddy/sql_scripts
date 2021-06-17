
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

