-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 04 fév. 2020 à 14:22
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `crowdin`
--

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `language`
--

INSERT INTO `language` (`id`, `label`) VALUES
(1, 'Anglais'),
(2, 'Français'),
(3, 'Allemand'),
(4, 'Espagnol'),
(5, 'Italien'),
(6, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `csv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `publication_date` datetime DEFAULT NULL,
  `last_update_date` datetime NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `translation` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`id`, `csv`, `title`, `content`, `publication_date`, `last_update_date`, `is_published`, `user_id`, `translation`) VALUES
(18, '5e2ee1a11c06f.csv', 'fzafzaf', 'fazfaz', '2020-01-27 13:12:01', '2020-01-27 13:12:01', 1, 2, NULL),
(19, '5e3035194354a.csv', 'qfz', '\"\";\r\n\r\n\"Plateforme\";D', '2020-01-28 13:20:25', '2020-01-28 13:20:25', 1, 2, NULL),
(20, '5e30361e4a186.csv', 'qfz', '\"\";\r\n\r\n\"Plateforme\";D', '2020-01-28 13:24:46', '2020-01-28 13:24:46', 1, 2, NULL),
(21, '5e30369feee16.csv', 'dzadaz', 'Je suis une phrase de csv avec un accént et voilà', '2020-01-28 13:26:55', '2020-01-28 13:26:55', 1, 2, 'test'),
(22, '5e303778c925f.csv', 'Je voudrais ce texte en anglais', 'Je suis une phrase de csv avec un accént et voilà', '2020-01-28 13:30:32', '2020-01-28 13:30:32', 1, 2, NULL),
(23, '5e3037a8b0516.csv', 'Je voudrais ce texte en anglais', 'Je suis une phrase de csv avec un accént et voilà', '2020-01-28 13:31:20', '2020-01-28 13:31:20', 1, 2, NULL),
(24, '5e3037c53b300.csv', 'Je voudrais ce texte en anglais', 'Je suis une phrase de csv avec un accént et voilà', '2020-01-28 13:31:49', '2020-01-28 13:31:49', 1, 2, NULL),
(25, '5e303836db1a2.csv', 'Je voudrais ce texte en anglais', 'Je suis une phrase de csv avec un accént et voilà', '2020-01-28 13:33:42', '2020-01-28 13:33:42', 1, 2, 'zafazfzafazfaz'),
(26, '5e3043686df8f.csv', 'TERENCE', 'Je suis une phrase de csv avec un accént et voilà', '2020-01-28 14:21:28', '2020-01-28 14:21:28', 1, 2, 'I\'m the csv with an accent');

-- --------------------------------------------------------

--
-- Structure de la table `project_language`
--

CREATE TABLE `project_language` (
  `project_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project_language`
--

INSERT INTO `project_language` (`project_id`, `language_id`) VALUES
(18, 1),
(19, 5),
(20, 5),
(21, 1),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 3);

-- --------------------------------------------------------

--
-- Structure de la table `translation`
--

CREATE TABLE `translation` (
  `id` int(11) NOT NULL,
  `translation` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(1, 'root@root.fr', 'a:0:{}', '$2y$13$7a3FYuYKH2NOA958uCj8COsIe3scuWD2S.ANO8XP5qmfI/I8dbYKy', 'nouveau'),
(2, 'terence@hotmail.fr', 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '$2y$13$63ZfB79sA4KKQoYEJeMwcerCqlZCkTkrRS73/bui.AW2Q6vRF1yhu', 'Terencelebg'),
(3, 'test@test.test', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$2y$13$b7h3rekuzK2CnfyTO0izGuMzld0ztpTWcR3uFilnvl2vf6//Mn27C', 'test'),
(4, 'vyterence@hotmail.fr', 'a:0:{}', '$2y$13$2aKRuBvfBf2.CFRsTSgx7.5V9wECBSZUcz.yo2NaXU.BWK2iiE5Ge', 'Terence'),
(5, 'toto@toto.toto', 'a:0:{}', '$2y$13$gInXdZ6Z339JnLZHiuCjUevQ5wDcBCIrSbAgnXNzF3bqWeB6itOXm', 'toto'),
(6, '12345@12345.12345', 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '$2y$13$SeemxIPXcg2G/xlHHAyKwu8eLaPChtX1aLxSkyKoUdsfi2nmcPO0y', '12345');

-- --------------------------------------------------------

--
-- Structure de la table `user_language`
--

CREATE TABLE `user_language` (
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_language`
--

INSERT INTO `user_language` (`user_id`, `language_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2FB3D0EEA76ED395` (`user_id`);

--
-- Index pour la table `project_language`
--
ALTER TABLE `project_language`
  ADD PRIMARY KEY (`project_id`,`language_id`),
  ADD KEY `IDX_E995FA6E166D1F9C` (`project_id`),
  ADD KEY `IDX_E995FA6E82F1BAF4` (`language_id`);

--
-- Index pour la table `translation`
--
ALTER TABLE `translation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_language`
--
ALTER TABLE `user_language`
  ADD PRIMARY KEY (`user_id`,`language_id`),
  ADD KEY `IDX_345695B5A76ED395` (`user_id`),
  ADD KEY `IDX_345695B582F1BAF4` (`language_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `translation`
--
ALTER TABLE `translation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK_2FB3D0EEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `project_language`
--
ALTER TABLE `project_language`
  ADD CONSTRAINT `FK_E995FA6E166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E995FA6E82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_language`
--
ALTER TABLE `user_language`
  ADD CONSTRAINT `FK_345695B582F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_345695B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
