-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 02 déc. 2019 à 20:29
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `id_absence` int(11) NOT NULL AUTO_INCREMENT,
  `id_seance` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `justifiee` tinyint(1) NOT NULL,
  `comm_abs` text,
  PRIMARY KEY (`id_absence`),
  KEY `FK_Avoir` (`id_seance`),
  KEY `FK_concerne` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`id_absence`, `id_seance`, `id_user`, `justifiee`, `comm_abs`) VALUES
(2, 1, 4, 1, 'malade'),
(3, 1, 6, 0, NULL),
(4, 5, 6, 1, NULL),
(5, 12, 4, 0, NULL),
(24, 1, 2, 1, 'nonnnn');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_user` int(11) NOT NULL,
  `nom_admin` varchar(30) DEFAULT NULL,
  `prenom_admin` varchar(30) DEFAULT NULL,
  `email_admin` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_user`, `nom_admin`, `prenom_admin`, `email_admin`) VALUES
(1, 'EL HOUDAIGUI', 'Bilal', 'bilal.elhoudaigui@gmail.com'),
(7, 'DAMOUN', 'Farouk', 'damoun.farouk@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id_user` int(11) NOT NULL,
  `nom_ens` varchar(25) NOT NULL,
  `prenom_ens` varchar(25) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_user`, `nom_ens`, `prenom_ens`) VALUES
(3, 'DALAL', 'Imane'),
(5, 'SALHI', 'mourad'),
(8, 'AOI', 'Sora'),
(9, 'YAGAMI', 'Himiko');

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

DROP TABLE IF EXISTS `enseigner`;
CREATE TABLE IF NOT EXISTS `enseigner` (
  `id_user` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_module`),
  KEY `FK_affecter2` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`id_user`, `id_module`) VALUES
(3, 1),
(5, 2),
(5, 3),
(8, 3),
(8, 4),
(9, 4),
(8, 5),
(9, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_user` int(11) NOT NULL,
  `CNE` int(11) NOT NULL,
  `nom_etu` varchar(25) NOT NULL,
  `prenom_etu` varchar(25) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_user`, `CNE`, `nom_etu`, `prenom_etu`) VALUES
(2, 1985858585, 'SADKI', 'Hassan'),
(4, 1155774466, 'ALAOUI', 'Ali'),
(6, 1254879652, 'MORABET', 'ilyas'),
(11, 88556324, 'Jobs', 'Steve'),
(12, 10224578, 'HAFFANE', 'Sara'),
(21, 2147483647, 'HANAFI', 'Fadoua');

-- --------------------------------------------------------

--
-- Structure de la table `etudier`
--

DROP TABLE IF EXISTS `etudier`;
CREATE TABLE IF NOT EXISTS `etudier` (
  `id_user` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `Note` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_module`),
  KEY `FK_Etudier2` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudier`
--

INSERT INTO `etudier` (`id_user`, `id_module`, `Note`) VALUES
(2, 1, 0),
(2, 2, 0),
(2, 6, 0),
(2, 9, 0),
(4, 1, 0),
(4, 2, 0),
(4, 3, 0),
(4, 4, 0),
(6, 1, 0),
(6, 3, 0),
(6, 4, 0),
(6, 5, 0),
(6, 6, 0),
(11, 9, 0);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_module` varchar(30) NOT NULL,
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `intitule_module`) VALUES
(1, 'Developpement web'),
(2, 'JAVA'),
(3, 'Anglais'),
(4, 'Japonaise'),
(5, 'Calighraphie'),
(6, 'NoSQL'),
(9, 'Bioinformatics');

-- --------------------------------------------------------

--
-- Structure de la table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `idEtudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_idEtudiant` (`idEtudiant`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parent`
--

INSERT INTO `parent` (`id_user`, `nom`, `prenom`, `idEtudiant`) VALUES
(22, 'parent1', 'parent1', 2);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_seance` date NOT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `type_seance` varchar(15) NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `FK_Enseigne` (`id_user`),
  KEY `FK_Occupe` (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `id_module`, `id_user`, `date_seance`, `heure_debut`, `heure_fin`, `type_seance`) VALUES
(1, 1, 3, '2016-04-03', '13:30:00', '15:00:00', 'Cours'),
(2, 1, 3, '2016-04-07', '08:30:00', '10:00:00', 'TP'),
(3, 1, 3, '2016-04-11', '10:30:00', '12:00:00', 'Cours'),
(4, 2, 5, '2016-04-05', '10:30:00', '12:00:00', 'Cours'),
(5, 2, 5, '2016-04-07', '08:30:00', '10:00:00', 'TP'),
(6, 3, 5, '2016-04-06', '13:30:00', '15:00:00', 'Cours'),
(7, 3, 8, '2016-04-06', '15:30:00', '17:00:00', 'TD'),
(8, 4, 8, '2016-04-01', '15:30:00', '17:00:00', 'Cours'),
(9, 4, 9, '2016-04-02', '13:30:00', '15:00:00', 'Cours'),
(10, 5, 8, '2016-04-02', '08:30:00', '10:00:00', 'TD'),
(11, 5, 9, '2016-04-03', '10:30:00', '12:00:00', 'Cours'),
(12, 6, 3, '2016-03-01', '10:30:00', '12:00:00', 'Cours'),
(13, 6, 3, '2016-03-03', '08:30:00', '10:00:00', 'TP'),
(14, 6, 3, '2015-05-05', '08:30:00', '10:00:00', 'TP');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type_user` varchar(20) NOT NULL,
  `access` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `password`, `type_user`, `access`) VALUES
(1, 'bilal', '202cb962ac59075b964b07152d234b70', 'admin', 1),
(2, 'hassan', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(3, 'imane', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(4, 'Ali', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(5, 'SALHI', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(6, 'ilyas', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(7, 'farouk', '202cb962ac59075b964b07152d234b70', 'admin', 1),
(8, 'sora', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(9, 'himiko', '202cb962ac59075b964b07152d234b70', 'enseignant', 0),
(11, 'steve', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(12, 'sara', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(21, 'fadoua', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(22, 'parent1', 'parent1', 'parent', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `FK_Inheritance_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_Inheritance_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `etudier`
--
ALTER TABLE `etudier`
  ADD CONSTRAINT `FK_Etudier` FOREIGN KEY (`id_user`) REFERENCES `etudiant` (`id_user`),
  ADD CONSTRAINT `FK_Etudier2` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `FK_Enseigne` FOREIGN KEY (`id_user`) REFERENCES `enseignant` (`id_user`),
  ADD CONSTRAINT `FK_Occupe` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
