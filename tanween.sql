-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 18 Juin 2016 à 20:21
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `budgeto`
--
DROP DATABASE budgeto;
CREATE DATABASE IF NOT EXISTS budgeto;
USE budgeto;
-- --------------------------------------------------------

--
-- Structure de la table `categoriepersonnel`
--

CREATE TABLE IF NOT EXISTS `categoriepersonnel` (
  `idCat` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(60) NOT NULL,
  PRIMARY KEY (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorieRessource`
--

CREATE TABLE IF NOT EXISTS `categorieRessource` (
  `idCRes` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(60) NOT NULL,
  PRIMARY KEY (`idCRes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ressource`
--

CREATE TABLE IF NOT EXISTS `Ressource` (
  `idRes` int(11) NOT NULL AUTO_INCREMENT,
  `idCRes` int(11) NOT NULL,
  `nomRessource` varchar(60) NOT NULL,
  `prix_estime` int(11) NULL DEFAULT '0',
  PRIMARY KEY (`idRes`),
  KEY `idCRes` (`idCRes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Utiliser`
--

CREATE TABLE IF NOT EXISTS `Utiliser` (
  `idUse` int(11) NOT NULL AUTO_INCREMENT,
  `idRes` int(11) NOT NULL,
  `idCol` int(11) NOT NULL,
  `nbRessource` int(11) NOT NULL,
  `prix_reel` int(11) NULL DEFAULT '0',
  `date` date NULL,
  PRIMARY KEY (`idUse`,`idRes`,`idCol`),
  KEY `idRes` (`idRes`),
  KEY `idCol` (`idCol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE IF NOT EXISTS `date` (
  `idDate` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`idDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Structure de la table `colloque`
--

CREATE TABLE IF NOT EXISTS `colloque` (
  `idCol` int(11) NOT NULL AUTO_INCREMENT,
  `nomCol` varchar(60) NOT NULL,
  `dateColDebut` date NOT NULL,
  `dateColFin` date NOT NULL,
  `lieuCol` varchar(100) NOT NULL,
  `descCol` varchar(200) DEFAULT NULL,
  `nbParticipants` int(11) DEFAULT NULL,
  `droitCol` int(11) DEFAULT '0',
  `idUser` int(11) NOT NULL,
  PRIMARY KEY (`idCol`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `distribuer`
--

CREATE TABLE IF NOT EXISTS `distribuer` (
  `idDist` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL DEFAULT '0',
  `idGoo` int(11) NOT NULL DEFAULT '0',
  `nbGoo` int(11) NOT NULL,
  `date` date NULL,
  `prix_reel` int(11) NOT NULL,

  PRIMARY KEY (`idDist`,`idCol`,`idGoo`),
  KEY `idGoo` (`idGoo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE IF NOT EXISTS `equipement` (
  `idEqui` int(11) NOT NULL AUTO_INCREMENT,
  `nomEquipement` varchar(60) NOT NULL,
  `cout_estime` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEqui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `equiper`
--

CREATE TABLE IF NOT EXISTS `equiper` (
  `idEqui` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL DEFAULT '0',
  `nomEquipement` varchar(60) NOT NULL DEFAULT '',
  `nbexemplaire` int(11) DEFAULT NULL,
  `prix_reel` int(11) NOT NULL,
  `date` date NULL,
  `LivraisonEqui` int(11) NOT NULL,
  PRIMARY KEY (`idCol`,`idEqui`),
  KEY `idEqui` (`idEqui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `equiper`
--


-- --------------------------------------------------------

--
-- Structure de la table `goodies`
--

CREATE TABLE IF NOT EXISTS `goodies` (
  `idGoo` int(11) NOT NULL AUTO_INCREMENT,
  `nomGoo` varchar(60) DEFAULT NULL,
  `coutGoo` int(11) DEFAULT '0',
  PRIMARY KEY (`idGoo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE IF NOT EXISTS `hebergement` (
  `idH` int(11) NOT NULL AUTO_INCREMENT,
  `nomH` varchar(60) DEFAULT NULL,
  `prix_estime` int(11) DEFAULT '0',
  `classe` varchar(60) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `formule` varchar(60) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  PRIMARY KEY (`idH`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `heberger`
--

CREATE TABLE IF NOT EXISTS `heberger` (
  `idHeb` int(11) NOT NULL AUTO_INCREMENT,
  `idIntervenant` int(11) NOT NULL,
  `idH` int(11) NOT NULL,
  `prix_reel` int(11) DEFAULT '0',
  `dateDebut` date NULL DEFAULT '0000-00-00',
  `dateFin` date NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`idHeb`,`idIntervenant`,`idH`),
  KEY `idH` (`idH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE IF NOT EXISTS `intervenant` (
  `idIntervenant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) DEFAULT NULL,
  `prenome` varchar(60) DEFAULT NULL,
  `remuneration` int(11) DEFAULT '0',
  PRIMARY KEY (`idIntervenant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE IF NOT EXISTS `intervenir` (
  `idInt` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL DEFAULT '0',
  `idIntervenant` int(11) DEFAULT NULL,
  `dateDebut` date NULL DEFAULT '0000-00-00',
  `dateFin` date DEFAULT NULL,
  `renumInt` int(11) NOT NULL,
  PRIMARY KEY (`idInt`,`idCol`,`dateDebut`),
  KEY `idIntervenant` (`idIntervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `idLoc` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL DEFAULT '0',
  `idSalle` int(11) NOT NULL,
  `dateS` date NOT NULL DEFAULT '0000-00-00',
  `duree` int(4) DEFAULT NULL,
  `prix_reel` int(11) DEFAULT '0',
  PRIMARY KEY (`idLoc`,`idCol`,`idSalle`),
  KEY `idSalle` (`idSalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `publicite`
--

CREATE TABLE IF NOT EXISTS `publicite` (
  `idPub` int(11) NOT NULL AUTO_INCREMENT,
  `typePub` varchar(100) NOT NULL,
  `prix_estime` int(11) NOT NULL,
  PRIMARY KEY (`idPub`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `publier`
--

CREATE TABLE IF NOT EXISTS `publier` (
  `idPubl` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL ,
  `idPub` int(11) NOT NULL ,
  `prix_reel` int(11) NOT NULL,
  PRIMARY KEY (`idPubl`,`idCol`,`idPub`),
  KEY `idPub` (`idPub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

CREATE TABLE IF NOT EXISTS `repas` (
  `idRepas` int(11) NOT NULL AUTO_INCREMENT,
  `nomRepas` varchar(60) NOT NULL,
  `prix_estime` int(11) DEFAULT '0',
  PRIMARY KEY (`idRepas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `nomSalle` varchar(60) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `prix_estime` int(11) DEFAULT '0',
  `capacite` int(11) NOT NULL,
  `typeSalle` varchar(60) DEFAULT NULL,
  `surface` int(11) NOT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `servir`
--

CREATE TABLE IF NOT EXISTS `servir` (
  `idServ` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL DEFAULT '0',
  `idRepas` int(11) NOT NULL DEFAULT '0',
  `dateR` date NOT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `concernes` varchar(100) DEFAULT NULL,
  `nbRepas` int(11) NOT NULL DEFAULT '1',
  `prix_reel` int(11) DEFAULT '0',
  PRIMARY KEY (`idServ`,`idCol`,`idRepas`),
  KEY `idRepas` (`idRepas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `transport`
--

CREATE TABLE IF NOT EXISTS `transport` (
  `idTransport` int(11) NOT NULL AUTO_INCREMENT,
  `classe` varchar(32) DEFAULT NULL,
  `cout` int(11) DEFAULT NULL,
  `lieuDepart` varchar(60) DEFAULT NULL,
  `escale` varchar(60) DEFAULT NULL,
  `lieuArrivee` varchar(60) DEFAULT NULL,
  `typeTransport` varchar(60) DEFAULT NULL,
  `dateDepart` date DEFAULT NULL,
  `dateArrivee` date DEFAULT NULL,
  PRIMARY KEY (`idTransport`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

CREATE TABLE IF NOT EXISTS `travailler` (
  `idTrav` int(11) NOT NULL AUTO_INCREMENT,
  `idCol` int(11) NOT NULL DEFAULT '0',
  `idCat` int(11) NOT NULL,
  `nbrCategorie` int(11) DEFAULT NULL,
  `remuneration` int(11) DEFAULT '0',
  PRIMARY KEY (`idTrav`,`idCol`,`idCat`),
  KEY `idCat` (`idCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `nomuser` varchar(30) NOT NULL,
  `motpasse` varchar(60) NOT NULL,
  `adressemail` varchar(30) NOT NULL,
  `numtel` int(11) DEFAULT NULL,
  `active` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `voyager`
--

CREATE TABLE IF NOT EXISTS `voyager` (
  `idVoyager` int(11) NOT NULL AUTO_INCREMENT,
  `idIntervenant` int(11) NOT NULL DEFAULT '0',
  `idTransport` int(11) NOT NULL DEFAULT '0',
  `prix_reel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idVoyager`,`idIntervenant`,`idTransport`),
  KEY `idTransport` (`idTransport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `colloque`
--
ALTER TABLE `colloque`
  ADD CONSTRAINT `colloque_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`);


--
-- Contraintes pour la table `distribuer`
--
ALTER TABLE `distribuer`
  ADD CONSTRAINT `distribuer_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `distribuer_ibfk_2` FOREIGN KEY (`idGoo`) REFERENCES `goodies` (`idGoo`);

--
-- Contraintes pour la table `equiper`
--
ALTER TABLE `equiper`
  ADD CONSTRAINT `equiper_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `equiper_ibfk_2` FOREIGN KEY (`idEqui`) REFERENCES `equipement` (`idEqui`);

--
-- Contraintes pour la table `heberger`
--
ALTER TABLE `heberger`
  ADD CONSTRAINT `heberger_ibfk_1` FOREIGN KEY (`idIntervenant`) REFERENCES `intervenant` (`idIntervenant`),
  ADD CONSTRAINT `heberger_ibfk_2` FOREIGN KEY (`idH`) REFERENCES `hebergement` (`idH`);

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`idIntervenant`) REFERENCES `intervenant` (`idIntervenant`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`);

--
-- Contraintes pour la table `servir`
--
ALTER TABLE `servir`
  ADD CONSTRAINT `servir_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `servir_ibfk_2` FOREIGN KEY (`idRepas`) REFERENCES `repas` (`idRepas`);


--
-- Contraintes pour la table `publier`
--
ALTER TABLE `publier`
  ADD CONSTRAINT `publier_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `publier_ibfk_2` FOREIGN KEY (`idPub`) REFERENCES `publicite` (`idPub`);

--
-- Contraintes pour la table `voyager`
--
ALTER TABLE `voyager`
  ADD CONSTRAINT `voyager_ibfk_1` FOREIGN KEY (`idIntervenant`) REFERENCES `intervenant` (`idIntervenant`),
  ADD CONSTRAINT `voyager_ibfk_2` FOREIGN KEY (`idTransport`) REFERENCES `transport` (`idTransport`);

--
-- Contraintes pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD CONSTRAINT `travailler_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `travailler_ibfk_2` FOREIGN KEY (`idCat`) REFERENCES `categoriepersonnel` (`idCat`);

--
-- Contraintes pour la table `Ressource`
--
ALTER TABLE `Ressource`
  ADD CONSTRAINT `Ressource_ibfk_1` FOREIGN KEY (`idCRes`) REFERENCES `categorieRessource` (`idCRes`);
  

--
-- Contraintes pour la table `utiliser`
--
ALTER TABLE `Utiliser`
  ADD CONSTRAINT `Utiliser_ibfk_1` FOREIGN KEY (`idCol`) REFERENCES `colloque` (`idCol`),
  ADD CONSTRAINT `Utiliser_ibfk_2` FOREIGN KEY (`idRes`) REFERENCES `Ressource` (`idRes`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
