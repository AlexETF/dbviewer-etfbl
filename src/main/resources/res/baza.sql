-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.12-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Verzija:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for master_dbviewer
DROP DATABASE IF EXISTS `master_dbviewer`;
CREATE DATABASE IF NOT EXISTS `master_dbviewer` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `master_dbviewer`;


-- Dumping structure for table master_dbviewer.drzava
DROP TABLE IF EXISTS `drzava`;
CREATE TABLE IF NOT EXISTS `drzava` (
  `DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `NAS_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NM_IDENT` int(11) DEFAULT NULL,
  `DU_OZNAKA` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DRZ_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DR_NAZIV` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`DR_OZNAKA`),
  KEY `FK_GLAVNI_GRAD` (`NAS_DR_OZNAKA`,`NM_IDENT`),
  KEY `FK_PRAVNI_NASLEDNIK` (`DRZ_DR_OZNAKA`),
  KEY `FK_TEKUCE` (`DU_OZNAKA`),
  CONSTRAINT `FK_GLAVNI_GRAD` FOREIGN KEY (`NAS_DR_OZNAKA`, `NM_IDENT`) REFERENCES `naseljeno_mjesto` (`NM_DR_OZNAKA`, `NM_IDENT`),
  CONSTRAINT `FK_PRAVNI_NASLEDNIK` FOREIGN KEY (`DRZ_DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`),
  CONSTRAINT `FK_TEKUCE` FOREIGN KEY (`DU_OZNAKA`) REFERENCES `drzavno_ure_enje` (`DU_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.drzava: ~9 rows (approximately)
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` (`DR_OZNAKA`, `NAS_DR_OZNAKA`, `NM_IDENT`, `DU_OZNAKA`, `DRZ_DR_OZNAKA`, `DR_NAZIV`) VALUES
	('BA', 'BA', 2, 'RP', NULL, 'Bosna i Hercegovina'),
	('DE', 'DE', 4, 'RP', NULL, 'Njemacka'),
	('HR', 'HR', 3, 'RP', NULL, 'Hrvatska'),
	('MN', 'MN', 14, 'RP', NULL, 'Crna Gora'),
	('RS', 'RS', 1, 'RP', NULL, 'Srbija'),
	('SCG', 'RS', 1, 'RP', 'SRJ', 'Srbija i Crna Gora'),
	('SI', 'SI', 5, 'RP', NULL, 'Republika Slevenija'),
	('SRJ', 'RS', 1, 'RP', 'SRJ', 'Savezna Republika Jugoslavija'),
	('UK', 'UK', 6, 'MO', NULL, 'Ujedinjeno kraljevstvo');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.drzavno_ure_enje
DROP TABLE IF EXISTS `drzavno_ure_enje`;
CREATE TABLE IF NOT EXISTS `drzavno_ure_enje` (
  `DU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DU_NAZIV` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`DU_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.drzavno_ure_enje: ~10 rows (approximately)
/*!40000 ALTER TABLE `drzavno_ure_enje` DISABLE KEYS */;
INSERT INTO `drzavno_ure_enje` (`DU_OZNAKA`, `DU_NAZIV`) VALUES
	('DI', 'Diktatura'),
	('DS', 'Despotizam'),
	('FA', 'Fasizam'),
	('FU', 'Fundamentalizam'),
	('KO', 'Komunizam'),
	('MO', 'Monarhija'),
	('PD', 'Parlamentarna demokratija'),
	('RP', 'Republika'),
	('SO', 'Socijalizam'),
	('TR', 'Tiranija');
/*!40000 ALTER TABLE `drzavno_ure_enje` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.grupa_izvjestaja
DROP TABLE IF EXISTS `grupa_izvjestaja`;
CREATE TABLE IF NOT EXISTS `grupa_izvjestaja` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_NAZIV` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`),
  CONSTRAINT `FK_IMA_GRUPE` FOREIGN KEY (`KL_OZNAKA`) REFERENCES `klasa_izvjestaja` (`KL_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.grupa_izvjestaja: ~0 rows (approximately)
/*!40000 ALTER TABLE `grupa_izvjestaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupa_izvjestaja` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.hijerarhija_tabela
DROP TABLE IF EXISTS `hijerarhija_tabela`;
CREATE TABLE IF NOT EXISTS `hijerarhija_tabela` (
  `TAB_TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `HIJ_NIVOST` decimal(2,0) NOT NULL DEFAULT '0',
  `HIJ_PARPOZ` decimal(2,0) NOT NULL DEFAULT '0',
  `HIJ_CHRBR` decimal(2,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TAB_TBL_KOD`,`TBL_KOD`),
  KEY `FK_CHILD` (`TBL_KOD`),
  CONSTRAINT `FK_CHILD` FOREIGN KEY (`TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`),
  CONSTRAINT `FK_PARENT` FOREIGN KEY (`TAB_TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.hijerarhija_tabela: ~15 rows (approximately)
/*!40000 ALTER TABLE `hijerarhija_tabela` DISABLE KEYS */;
INSERT INTO `hijerarhija_tabela` (`TAB_TBL_KOD`, `TBL_KOD`, `HIJ_NIVOST`, `HIJ_PARPOZ`, `HIJ_CHRBR`) VALUES
	('Database', 'Database', 0, 0, 1),
	('Database', 'DR_DRZAVA', 1, 1, 4),
	('Database', 'DU_DRZAVNO_URE_ENJE', 1, 1, 2),
	('Database', 'RG_REGION', 1, 1, 3),
	('Database', 'VR_VRSTA_REGIONA', 1, 1, 1),
	('DR_DRZAVA', 'IU_ISTORIJA_URE_ENJA', 2, 4, 4),
	('DR_DRZAVA', 'NM_NASELJENO_MJESTO', 2, 4, 3),
	('DR_DRZAVA', 'OP_OPSTINA', 2, 4, 2),
	('DR_DRZAVA', 'SL_SLOZENA_DRZAVA', 2, 4, 1),
	('DU_DRZAVNO_URE_ENJE', 'IU_ISTORIJA_URE_ENJA', 2, 2, 1),
	('NM_NASELJENO_MJESTO', 'NR_NASELJA_U_REGIONU', 3, 3, 2),
	('NM_NASELJENO_MJESTO', 'ST_STRUKTURA', 3, 3, 1),
	('OP_OPSTINA', 'ST_STRUKTURA', 3, 2, 1),
	('RG_REGION', 'NR_NASELJA_U_REGIONU', 2, 3, 2),
	('RG_REGION', 'SR_SASTAV_REGIONA', 2, 3, 1);
/*!40000 ALTER TABLE `hijerarhija_tabela` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.istorija_ure_enja
DROP TABLE IF EXISTS `istorija_ure_enja`;
CREATE TABLE IF NOT EXISTS `istorija_ure_enja` (
  `DU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `IU_OD` date DEFAULT NULL,
  `IU_DO` date DEFAULT NULL,
  PRIMARY KEY (`DU_OZNAKA`,`DR_OZNAKA`),
  KEY `FK_ISTORIJA_URE_ENJA2` (`DR_OZNAKA`),
  CONSTRAINT `FK_ISTORIJA_URE_ENJA` FOREIGN KEY (`DU_OZNAKA`) REFERENCES `drzavno_ure_enje` (`DU_OZNAKA`),
  CONSTRAINT `FK_ISTORIJA_URE_ENJA2` FOREIGN KEY (`DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.istorija_ure_enja: ~2 rows (approximately)
/*!40000 ALTER TABLE `istorija_ure_enja` DISABLE KEYS */;
INSERT INTO `istorija_ure_enja` (`DU_OZNAKA`, `DR_OZNAKA`, `IU_OD`, `IU_DO`) VALUES
	('RP', 'SCG', '2002-03-14', '2006-01-01'),
	('RP', 'SRJ', '1992-04-27', '2002-03-14');
/*!40000 ALTER TABLE `istorija_ure_enja` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.izvjestaji
DROP TABLE IF EXISTS `izvjestaji`;
CREATE TABLE IF NOT EXISTS `izvjestaji` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PG_OZNAKA` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `IZV_OZBAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `IZV_NAZIV` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `IZV_SELSCR` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IZV_FORMATIZER` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IZV_VAZECI` smallint(6) DEFAULT '1',
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`,`PG_OZNAKA`,`IZV_OZBAKA`),
  CONSTRAINT `FK_IMA_IZVJESTAJE` FOREIGN KEY (`KL_OZNAKA`, `GRU_OZNAKA`, `PG_OZNAKA`) REFERENCES `podgrupa_izvjestaja` (`KL_OZNAKA`, `GRU_OZNAKA`, `PG_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.izvjestaji: ~0 rows (approximately)
/*!40000 ALTER TABLE `izvjestaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `izvjestaji` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.klasa_izvjestaja
DROP TABLE IF EXISTS `klasa_izvjestaja`;
CREATE TABLE IF NOT EXISTS `klasa_izvjestaja` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `KL_NAZIV` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.klasa_izvjestaja: ~0 rows (approximately)
/*!40000 ALTER TABLE `klasa_izvjestaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `klasa_izvjestaja` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.naselja_u_regionu
DROP TABLE IF EXISTS `naselja_u_regionu`;
CREATE TABLE IF NOT EXISTS `naselja_u_regionu` (
  `NM_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `NM_IDENT` int(11) NOT NULL,
  `REG_IDENT` int(11) NOT NULL,
  `REG_TIP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  PRIMARY KEY (`NM_DR_OZNAKA`,`NM_IDENT`,`REG_IDENT`,`REG_TIP`),
  KEY `FK_NASELJA_U_REGIONU2` (`REG_IDENT`,`REG_TIP`),
  CONSTRAINT `FK_NASELJA_U_REGIONU` FOREIGN KEY (`NM_DR_OZNAKA`, `NM_IDENT`) REFERENCES `naseljeno_mjesto` (`NM_DR_OZNAKA`, `NM_IDENT`),
  CONSTRAINT `FK_NASELJA_U_REGIONU2` FOREIGN KEY (`REG_IDENT`, `REG_TIP`) REFERENCES `region` (`REG_IDENT`, `REG_TIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.naselja_u_regionu: ~7 rows (approximately)
/*!40000 ALTER TABLE `naselja_u_regionu` DISABLE KEYS */;
INSERT INTO `naselja_u_regionu` (`NM_DR_OZNAKA`, `NM_IDENT`, `REG_IDENT`, `REG_TIP`) VALUES
	('RS', 12, 1, 'D'),
	('RS', 8, 2, 'D'),
	('RS', 9, 3, 'D'),
	('RS', 10, 3, 'D'),
	('RS', 11, 3, 'D'),
	('RS', 13, 4, 'D'),
	('RS', 1, 5, 'D');
/*!40000 ALTER TABLE `naselja_u_regionu` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.naseljeno_mjesto
DROP TABLE IF EXISTS `naseljeno_mjesto`;
CREATE TABLE IF NOT EXISTS `naseljeno_mjesto` (
  `NM_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `NM_IDENT` int(11) NOT NULL,
  `NM_NAZIV` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`NM_DR_OZNAKA`,`NM_IDENT`),
  CONSTRAINT `FK_IMA_NASELJA` FOREIGN KEY (`NM_DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.naseljeno_mjesto: ~14 rows (approximately)
/*!40000 ALTER TABLE `naseljeno_mjesto` DISABLE KEYS */;
INSERT INTO `naseljeno_mjesto` (`NM_DR_OZNAKA`, `NM_IDENT`, `NM_NAZIV`) VALUES
	('BA', 2, 'Sarajevo'),
	('BA', 7, 'Banja Luka'),
	('DE', 4, 'Berlin'),
	('HR', 3, 'Zagreb'),
	('MN', 14, 'Podgorica'),
	('RS', 1, 'Beograd'),
	('RS', 8, 'Nis'),
	('RS', 9, 'Kragujevac'),
	('RS', 10, 'Cacak'),
	('RS', 11, 'Kraljevo'),
	('RS', 12, 'Novi Sad'),
	('RS', 13, 'Pristina'),
	('SI', 5, 'Ljubljana'),
	('UK', 6, 'London');
/*!40000 ALTER TABLE `naseljeno_mjesto` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.opstina
DROP TABLE IF EXISTS `opstina`;
CREATE TABLE IF NOT EXISTS `opstina` (
  `DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `OP_IDENT` decimal(4,0) NOT NULL,
  `NAS_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `NM_IDENT` int(11) NOT NULL,
  `OP_NAZIV` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`DR_OZNAKA`,`OP_IDENT`),
  KEY `FK_ADMINISTRATIVNI_CENTAR` (`NAS_DR_OZNAKA`,`NM_IDENT`),
  CONSTRAINT `FK_ADMINISTRATIVNI_CENTAR` FOREIGN KEY (`NAS_DR_OZNAKA`, `NM_IDENT`) REFERENCES `naseljeno_mjesto` (`NM_DR_OZNAKA`, `NM_IDENT`),
  CONSTRAINT `FK_LOKALNA_SAMOUPRAVA` FOREIGN KEY (`DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.opstina: ~4 rows (approximately)
/*!40000 ALTER TABLE `opstina` DISABLE KEYS */;
INSERT INTO `opstina` (`DR_OZNAKA`, `OP_IDENT`, `NAS_DR_OZNAKA`, `NM_IDENT`, `OP_NAZIV`) VALUES
	('BA', 1, 'BA', 2, 'Opstina Sarajevo'),
	('BA', 2, 'BA', 7, 'Banja Luka'),
	('RS', 3, 'RS', 1, 'Opstina Beograd'),
	('RS', 4, 'RS', 12, 'Opstina Novi Sad');
/*!40000 ALTER TABLE `opstina` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.parametri
DROP TABLE IF EXISTS `parametri`;
CREATE TABLE IF NOT EXISTS `parametri` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PG_OZNAKA` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `IZV_OZBAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PAR_RBR` decimal(3,0) NOT NULL,
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POL_KOD` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAR_LABELA` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`,`PG_OZNAKA`,`IZV_OZBAKA`,`PAR_RBR`),
  KEY `FK_U_PARAMETRIMA_IZVJESTAJA` (`TBL_KOD`,`POL_KOD`),
  CONSTRAINT `FK_PARAMETRI_IZVESTAJA` FOREIGN KEY (`KL_OZNAKA`, `GRU_OZNAKA`, `PG_OZNAKA`, `IZV_OZBAKA`) REFERENCES `izvjestaji` (`KL_OZNAKA`, `GRU_OZNAKA`, `PG_OZNAKA`, `IZV_OZBAKA`),
  CONSTRAINT `FK_U_PARAMETRIMA_IZVJESTAJA` FOREIGN KEY (`TBL_KOD`, `POL_KOD`) REFERENCES `polja` (`TBL_KOD`, `POL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.parametri: ~0 rows (approximately)
/*!40000 ALTER TABLE `parametri` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametri` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.podgrupa_izvjestaja
DROP TABLE IF EXISTS `podgrupa_izvjestaja`;
CREATE TABLE IF NOT EXISTS `podgrupa_izvjestaja` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PG_OZNAKA` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `PG_NAZIV` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`,`PG_OZNAKA`),
  CONSTRAINT `FK_IMA_PODGRUPE` FOREIGN KEY (`KL_OZNAKA`, `GRU_OZNAKA`) REFERENCES `grupa_izvjestaja` (`KL_OZNAKA`, `GRU_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.podgrupa_izvjestaja: ~0 rows (approximately)
/*!40000 ALTER TABLE `podgrupa_izvjestaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `podgrupa_izvjestaja` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.podsistemi
DROP TABLE IF EXISTS `podsistemi`;
CREATE TABLE IF NOT EXISTS `podsistemi` (
  `PS_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PS_NAZIV` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`PS_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.podsistemi: ~0 rows (approximately)
/*!40000 ALTER TABLE `podsistemi` DISABLE KEYS */;
/*!40000 ALTER TABLE `podsistemi` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.polja
DROP TABLE IF EXISTS `polja`;
CREATE TABLE IF NOT EXISTS `polja` (
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `POL_KOD` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `POL_LABELA` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TBL_KOD`,`POL_KOD`),
  CONSTRAINT `FK_POSEDUJE_POLJA` FOREIGN KEY (`TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.polja: ~45 rows (approximately)
/*!40000 ALTER TABLE `polja` DISABLE KEYS */;
INSERT INTO `polja` (`TBL_KOD`, `POL_KOD`, `POL_LABELA`) VALUES
	('DR_DRZAVA', 'DR_NAZIV', 'DR_NAZIV'),
	('DR_DRZAVA', 'DR_OZNAKA', 'DR_OZNAKA'),
	('DR_DRZAVA', 'DRZ_DR_OZNAKA', 'DRZ_DR_OZNAKA'),
	('DR_DRZAVA', 'DU_OZNAKA', 'DU_OZNAKA'),
	('DR_DRZAVA', 'NAS_DR_OZNAKA', 'NAS_DR_OZNAKA'),
	('DR_DRZAVA', 'NM_IDENT', 'NM_IDENT'),
	('DU_DRZAVNO_URE_ENJE', 'DU_NAZIV', 'DU_NAZIV'),
	('DU_DRZAVNO_URE_ENJE', 'DU_OZNAKA', 'DU_OZNAKA'),
	('IU_ISTORIJA_URE_ENJA', 'DR_OZNAKA', 'DR_OZNAKA'),
	('IU_ISTORIJA_URE_ENJA', 'DU_OZNAKA', 'DU_OZNAKA'),
	('IU_ISTORIJA_URE_ENJA', 'IU_DO', 'IU_DO'),
	('IU_ISTORIJA_URE_ENJA', 'IU_OD', 'IU_OD'),
	('NM_NASELJENO_MJESTO', 'NM_DR_OZNAKA', 'NM_DR_OZNAKA'),
	('NM_NASELJENO_MJESTO', 'NM_IDENT', 'NM_IDENT'),
	('NM_NASELJENO_MJESTO', 'NM_NAZIV', 'NM_NAZIV'),
	('NR_NASELJA_U_REGIONU', 'NM_DR_OZNAKA', 'NM_DR_OZNAKA'),
	('NR_NASELJA_U_REGIONU', 'NM_IDENT', 'NM_IDENT'),
	('NR_NASELJA_U_REGIONU', 'REG_IDENT', 'REG_IDENT'),
	('NR_NASELJA_U_REGIONU', 'REG_TIP', 'REG_TIP'),
	('OP_OPSTINA', 'DR_OZNAKA', 'DR_OZNAKA'),
	('OP_OPSTINA', 'NAS_DR_OZNAKA', 'NAS_DR_OZNAKA'),
	('OP_OPSTINA', 'NM_IDENT', 'NM_IDENT'),
	('OP_OPSTINA', 'OP_IDENT', 'OP_IDENT'),
	('OP_OPSTINA', 'OP_NAZIV', 'OP_NAZIV'),
	('RG_REGION', 'DR_OZNAKA', 'DR_OZNAKA'),
	('RG_REGION', 'NAS_DR_OZNAKA', 'NAS_DR_OZNAKA'),
	('RG_REGION', 'NM_IDENT', 'NM_IDENT'),
	('RG_REGION', 'REG_IDENT', 'REG_IDENT'),
	('RG_REGION', 'REG_NAZIV', 'REG_NAZIV'),
	('RG_REGION', 'REG_TIP', 'REG_TIP'),
	('RG_REGION', 'VR_OZNAKA', 'VR_OZNAKA'),
	('SL_SLOZENA_DRZAVA', 'DR_OZNAKA', 'DR_OZNAKA'),
	('SL_SLOZENA_DRZAVA', 'DRZ_DR_OZNAKA', 'DRZ_DR_OZNAKA'),
	('SL_SLOZENA_DRZAVA', 'SL_DO', 'SL_DO'),
	('SL_SLOZENA_DRZAVA', 'SL_OD', 'SL_OD'),
	('SR_SASTAV_REGIONA', 'REG_IDENT', 'REG_IDENT'),
	('SR_SASTAV_REGIONA', 'REG_REG_IDENT', 'REG_REG_IDENT'),
	('SR_SASTAV_REGIONA', 'REG_REG_TIP', 'REG_REG_TIP'),
	('SR_SASTAV_REGIONA', 'REG_TIP', 'REG_TIP'),
	('ST_STRUKTURA', 'NM_DR_OZNAKA', 'NM_DR_OZNAKA'),
	('ST_STRUKTURA', 'NM_IDENT', 'NM_IDENT'),
	('ST_STRUKTURA', 'OP_IDENT', 'OP_IDENT'),
	('ST_STRUKTURA', 'OPS_DR_OZNAKA', 'OPS_DR_OZNAKA'),
	('VR_VRSTA_REGIONA', 'VR_NAZIV', 'VR_NAZIV'),
	('VR_VRSTA_REGIONA', 'VR_OZNAKA', 'VR_OZNAKA');
/*!40000 ALTER TABLE `polja` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.poseduje_izvestaje
DROP TABLE IF EXISTS `poseduje_izvestaje`;
CREATE TABLE IF NOT EXISTS `poseduje_izvestaje` (
  `PS_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PG_OZNAKA` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `IZV_OZBAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`,`PG_OZNAKA`,`PS_OZNAKA`,`IZV_OZBAKA`),
  KEY `FK_POSEDUJE_IZVESTAJE` (`PS_OZNAKA`),
  KEY `FK_POSEDUJE_IZVESTAJE2` (`KL_OZNAKA`,`GRU_OZNAKA`,`PG_OZNAKA`,`IZV_OZBAKA`),
  CONSTRAINT `FK_POSEDUJE_IZVESTAJE` FOREIGN KEY (`PS_OZNAKA`) REFERENCES `podsistemi` (`PS_OZNAKA`),
  CONSTRAINT `FK_POSEDUJE_IZVESTAJE2` FOREIGN KEY (`KL_OZNAKA`, `GRU_OZNAKA`, `PG_OZNAKA`, `IZV_OZBAKA`) REFERENCES `izvjestaji` (`KL_OZNAKA`, `GRU_OZNAKA`, `PG_OZNAKA`, `IZV_OZBAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.poseduje_izvestaje: ~0 rows (approximately)
/*!40000 ALTER TABLE `poseduje_izvestaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `poseduje_izvestaje` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.region
DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `REG_TIP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `REG_IDENT` int(11) NOT NULL,
  `NAS_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `NM_IDENT` int(11) NOT NULL,
  `DR_OZNAKA` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VR_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `REG_NAZIV` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REG_IDENT`,`REG_TIP`),
  KEY `FK_MATICNA_DRZAVA` (`DR_OZNAKA`),
  KEY `FK_SEDISTE_REGIONA` (`NAS_DR_OZNAKA`,`NM_IDENT`),
  KEY `FK_VRSTA_REGIONA` (`VR_OZNAKA`),
  CONSTRAINT `FK_MATICNA_DRZAVA` FOREIGN KEY (`DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`),
  CONSTRAINT `FK_SEDISTE_REGIONA` FOREIGN KEY (`NAS_DR_OZNAKA`, `NM_IDENT`) REFERENCES `naseljeno_mjesto` (`NM_DR_OZNAKA`, `NM_IDENT`),
  CONSTRAINT `FK_VRSTA_REGIONA` FOREIGN KEY (`VR_OZNAKA`) REFERENCES `vrsta_regiona` (`VR_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.region: ~8 rows (approximately)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`REG_TIP`, `REG_IDENT`, `NAS_DR_OZNAKA`, `NM_IDENT`, `DR_OZNAKA`, `VR_OZNAKA`, `REG_NAZIV`) VALUES
	('D', 1, 'RS', 12, 'RS', 'PO', 'Vojvodina'),
	('D', 2, 'RS', 8, 'RS', 'RG', 'Juzna i istocna Srbija'),
	('D', 3, 'RS', 9, 'RS', 'RG', 'Sumadija i zapadna Srbija'),
	('D', 4, 'RS', 13, 'RS', 'PO', 'Kosovo i Metohija'),
	('D', 5, 'RS', 1, 'RS', 'RG', 'Beograd'),
	('D', 6, 'RS', 12, 'RS', 'RG', 'Srem'),
	('D', 7, 'RS', 12, 'RS', 'RG', 'Banat'),
	('D', 8, 'RS', 12, 'RS', 'RG', 'Backa');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.sadrzi
DROP TABLE IF EXISTS `sadrzi`;
CREATE TABLE IF NOT EXISTS `sadrzi` (
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `PS_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TBL_KOD`,`PS_OZNAKA`),
  KEY `FK_SADRZI2` (`PS_OZNAKA`),
  CONSTRAINT `FK_SADRZI` FOREIGN KEY (`TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`),
  CONSTRAINT `FK_SADRZI2` FOREIGN KEY (`PS_OZNAKA`) REFERENCES `podsistemi` (`PS_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.sadrzi: ~0 rows (approximately)
/*!40000 ALTER TABLE `sadrzi` DISABLE KEYS */;
/*!40000 ALTER TABLE `sadrzi` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.sastav_regiona
DROP TABLE IF EXISTS `sastav_regiona`;
CREATE TABLE IF NOT EXISTS `sastav_regiona` (
  `REG_IDENT` int(11) NOT NULL,
  `REG_TIP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `REG_REG_IDENT` int(11) NOT NULL,
  `REG_REG_TIP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  PRIMARY KEY (`REG_IDENT`,`REG_TIP`,`REG_REG_IDENT`,`REG_REG_TIP`),
  KEY `FK_SASTAV_REGIONA2` (`REG_REG_IDENT`,`REG_REG_TIP`),
  CONSTRAINT `FK_SASTAV_REGIONA` FOREIGN KEY (`REG_IDENT`, `REG_TIP`) REFERENCES `region` (`REG_IDENT`, `REG_TIP`),
  CONSTRAINT `FK_SASTAV_REGIONA2` FOREIGN KEY (`REG_REG_IDENT`, `REG_REG_TIP`) REFERENCES `region` (`REG_IDENT`, `REG_TIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.sastav_regiona: ~3 rows (approximately)
/*!40000 ALTER TABLE `sastav_regiona` DISABLE KEYS */;
INSERT INTO `sastav_regiona` (`REG_IDENT`, `REG_TIP`, `REG_REG_IDENT`, `REG_REG_TIP`) VALUES
	(1, 'D', 6, 'D'),
	(1, 'D', 7, 'D'),
	(1, 'D', 8, 'D');
/*!40000 ALTER TABLE `sastav_regiona` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.slozena_drzava
DROP TABLE IF EXISTS `slozena_drzava`;
CREATE TABLE IF NOT EXISTS `slozena_drzava` (
  `DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DRZ_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `SL_OD` date NOT NULL,
  `SL_DO` date DEFAULT NULL,
  PRIMARY KEY (`DR_OZNAKA`,`DRZ_DR_OZNAKA`,`SL_OD`),
  KEY `FK_CLANICA` (`DRZ_DR_OZNAKA`),
  CONSTRAINT `FK_CLANICA` FOREIGN KEY (`DRZ_DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`),
  CONSTRAINT `FK_SLOZENA` FOREIGN KEY (`DR_OZNAKA`) REFERENCES `drzava` (`DR_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.slozena_drzava: ~3 rows (approximately)
/*!40000 ALTER TABLE `slozena_drzava` DISABLE KEYS */;
INSERT INTO `slozena_drzava` (`DR_OZNAKA`, `DRZ_DR_OZNAKA`, `SL_OD`, `SL_DO`) VALUES
	('SCG', 'MN', '2002-03-14', '2006-01-01'),
	('SCG', 'RS', '2002-03-14', '2006-01-01'),
	('SRJ', 'SCG', '1992-04-27', '2002-03-14');
/*!40000 ALTER TABLE `slozena_drzava` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.struktura
DROP TABLE IF EXISTS `struktura`;
CREATE TABLE IF NOT EXISTS `struktura` (
  `OPS_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `OP_IDENT` decimal(4,0) NOT NULL,
  `NM_DR_OZNAKA` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `NM_IDENT` int(11) NOT NULL,
  PRIMARY KEY (`OPS_DR_OZNAKA`,`OP_IDENT`,`NM_DR_OZNAKA`,`NM_IDENT`),
  KEY `FK_STRUKTURA2` (`NM_DR_OZNAKA`,`NM_IDENT`),
  CONSTRAINT `FK_STRUKTURA` FOREIGN KEY (`OPS_DR_OZNAKA`, `OP_IDENT`) REFERENCES `opstina` (`DR_OZNAKA`, `OP_IDENT`),
  CONSTRAINT `FK_STRUKTURA2` FOREIGN KEY (`NM_DR_OZNAKA`, `NM_IDENT`) REFERENCES `naseljeno_mjesto` (`NM_DR_OZNAKA`, `NM_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.struktura: ~3 rows (approximately)
/*!40000 ALTER TABLE `struktura` DISABLE KEYS */;
INSERT INTO `struktura` (`OPS_DR_OZNAKA`, `OP_IDENT`, `NM_DR_OZNAKA`, `NM_IDENT`) VALUES
	('BA', 1, 'BA', 2),
	('RS', 3, 'RS', 1),
	('RS', 4, 'RS', 12);
/*!40000 ALTER TABLE `struktura` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.tabele
DROP TABLE IF EXISTS `tabele`;
CREATE TABLE IF NOT EXISTS `tabele` (
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TBL_NAZIV` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TBL_SLICICA` longblob,
  `TBL_HIT_RATE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TBL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.tabele: ~12 rows (approximately)
/*!40000 ALTER TABLE `tabele` DISABLE KEYS */;
INSERT INTO `tabele` (`TBL_KOD`, `TBL_NAZIV`, `TBL_SLICICA`, `TBL_HIT_RATE`) VALUES
	('Database', 'Database', NULL, 0),
	('DR_DRZAVA', 'drzava', NULL, 0),
	('DU_DRZAVNO_URE_ENJE', 'drzavno_ure_enje', NULL, 0),
	('IU_ISTORIJA_URE_ENJA', 'istorija_ure_enja', NULL, 0),
	('NM_NASELJENO_MJESTO', 'naseljeno_mjesto', NULL, 0),
	('NR_NASELJA_U_REGIONU', 'naselja_u_regionu', NULL, 0),
	('OP_OPSTINA', 'opstina', NULL, 0),
	('RG_REGION', 'region', NULL, 0),
	('SL_SLOZENA_DRZAVA', 'slozena_drzava', NULL, 0),
	('SR_SASTAV_REGIONA', 'sastav_regiona', NULL, 0),
	('ST_STRUKTURA', 'struktura', NULL, 0),
	('VR_VRSTA_REGIONA', 'vrsta_regiona', NULL, 0);
/*!40000 ALTER TABLE `tabele` ENABLE KEYS */;


-- Dumping structure for table master_dbviewer.vrsta_regiona
DROP TABLE IF EXISTS `vrsta_regiona`;
CREATE TABLE IF NOT EXISTS `vrsta_regiona` (
  `VR_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VR_NAZIV` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`VR_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table master_dbviewer.vrsta_regiona: ~5 rows (approximately)
/*!40000 ALTER TABLE `vrsta_regiona` DISABLE KEYS */;
INSERT INTO `vrsta_regiona` (`VR_OZNAKA`, `VR_NAZIV`) VALUES
	('EN', 'Entitet'),
	('KT', 'Kanton'),
	('PO', 'Pokrajina'),
	('RG', 'Regija'),
	('RP', 'Republika');
/*!40000 ALTER TABLE `vrsta_regiona` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
