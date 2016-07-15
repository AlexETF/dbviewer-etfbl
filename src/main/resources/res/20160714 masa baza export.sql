CREATE DATABASE  IF NOT EXISTS `masa_20160712` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `masa_20160712`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: sql.lanaco.com    Database: masa_20160712
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dij_mkb10_sifarnik_dijagnoza`
--

DROP TABLE IF EXISTS `dij_mkb10_sifarnik_dijagnoza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dij_mkb10_sifarnik_dijagnoza` (
  `DIJ_IDENT` int(11) NOT NULL,
  `DIJ_NAZIV` varchar(200) NOT NULL,
  `DIJ_SIFRA` varchar(7) NOT NULL,
  PRIMARY KEY (`DIJ_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dij_mkb10_sifarnik_dijagnoza`
--

LOCK TABLES `dij_mkb10_sifarnik_dijagnoza` WRITE;
/*!40000 ALTER TABLE `dij_mkb10_sifarnik_dijagnoza` DISABLE KEYS */;
INSERT INTO `dij_mkb10_sifarnik_dijagnoza` VALUES (1,'Organski i simptomatski dusevni poremecaji','F00-F09'),(2,'Dusevni I poremecaji ponasanja nastali upotrebom psihoaktivnih supstanci','F10-F19'),(3,'Shizofrenija shizoidni poremecaji I sumanuta duševna oboljenja','F20-F29'),(4,'Poremecaji raspolozenja','F30-F39'),(5,'Neuroze, stresni I somatoformni poremecaji','F40-F48'),(6,'Sindromi ponasanja udruženi sa fiziološkim smetnjama I fizičkim činiocima','F50-F59'),(7,'Poremecaji ličnosti I poremećaji ponašanja odrasle osobe','F60-F69'),(8,'Duševna zaostalost','F70-F79'),(9,'Poremecaji psihičkog razvoja','F80-F89'),(10,'Drugi poremećaji emocija i poremećaji ponašanja nastali u detinjstvu i adolescenciji','F90-F98'),(11,'Neodredjeni dusevni poremecaji','F99');
/*!40000 ALTER TABLE `dij_mkb10_sifarnik_dijagnoza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drz_drzava`
--

DROP TABLE IF EXISTS `drz_drzava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drz_drzava` (
  `DRZ_IDENT` int(11) NOT NULL,
  `DRZ_KOD` char(3) NOT NULL,
  `DRZ_NAZIV` varchar(100) NOT NULL,
  PRIMARY KEY (`DRZ_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drz_drzava`
--

LOCK TABLES `drz_drzava` WRITE;
/*!40000 ALTER TABLE `drz_drzava` DISABLE KEYS */;
INSERT INTO `drz_drzava` VALUES (1,'BIH','Bosna i Hercegovina'),(2,'AUT','Austrija'),(3,'BEL','Belgija'),(4,'SRB','Srbija'),(5,'ESP','Španija'),(6,'RUS','Ruska Federacija');
/*!40000 ALTER TABLE `drz_drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etp_etnicka_pripadnost`
--

DROP TABLE IF EXISTS `etp_etnicka_pripadnost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etp_etnicka_pripadnost` (
  `ETP_IDENT` int(11) NOT NULL,
  `ETP_NAZIV` varchar(100) NOT NULL,
  PRIMARY KEY (`ETP_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etp_etnicka_pripadnost`
--

LOCK TABLES `etp_etnicka_pripadnost` WRITE;
/*!40000 ALTER TABLE `etp_etnicka_pripadnost` DISABLE KEYS */;
INSERT INTO `etp_etnicka_pripadnost` VALUES (1,'Srpska'),(2,'Španska'),(3,'Ukrajinska');
/*!40000 ALTER TABLE `etp_etnicka_pripadnost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupa_izvjestaja`
--

DROP TABLE IF EXISTS `grupa_izvjestaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupa_izvjestaja` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_NAZIV` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`),
  CONSTRAINT `FK_IMA_GRUPE` FOREIGN KEY (`KL_OZNAKA`) REFERENCES `klasa_izvjestaja` (`KL_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa_izvjestaja`
--

LOCK TABLES `grupa_izvjestaja` WRITE;
/*!40000 ALTER TABLE `grupa_izvjestaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupa_izvjestaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hijerarhija_tabela`
--

DROP TABLE IF EXISTS `hijerarhija_tabela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hijerarhija_tabela` (
  `TAB_TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `HIJ_NIVOST` decimal(2,0) NOT NULL DEFAULT '0',
  `HIJ_PARPOZ` decimal(2,0) NOT NULL DEFAULT '0',
  `HIJ_CHRBR` decimal(2,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TAB_TBL_KOD`,`TBL_KOD`,`HIJ_NIVOST`,`HIJ_PARPOZ`,`HIJ_CHRBR`),
  KEY `FK_CHILD` (`TBL_KOD`),
  CONSTRAINT `FK_CHILD` FOREIGN KEY (`TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`),
  CONSTRAINT `FK_PARENT` FOREIGN KEY (`TAB_TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hijerarhija_tabela`
--

LOCK TABLES `hijerarhija_tabela` WRITE;
/*!40000 ALTER TABLE `hijerarhija_tabela` DISABLE KEYS */;
INSERT INTO `hijerarhija_tabela` VALUES ('Database','Database',0,0,1),('Database','DIJ_MKB10_SIFARNIK_DIJAGNOZA',1,1,12),('Database','DRZ_DRZAVA',1,1,11),('Database','ETP_ETNICKA_PRIPADNOST',1,1,1),('PAT_PACIJENT','IMU_IMUNIZACIJA',2,8,3),('VIM_VRSTA_IMUNIZACIJE','IMU_IMUNIZACIJA',2,5,1),('PAT_PACIJENT','INV_INVALIDNOST',2,8,2),('VIN_VRSTA_INVALIDNOSTI','INV_INVALIDNOST',2,4,1),('Database','KOR_KORISNIK',1,1,7),('Database','KVA_KVALIFIKACIJE',1,1,2),('KVA_KVALIFIKACIJE','KVAL_MEDG_RAD',2,2,1),('MER_MEDICINSKI_RADNIK','KVAL_MEDG_RAD',2,9,3),('Database','LIJ_ATCKLASIFIKACIJA_LIJEKOVA',1,1,13),('DRZ_DRZAVA','LOKACIJA_ORGANIZACIJE',2,11,2),('ORG_ORGANIZACIJA','LOKACIJA_ORGANIZACIJE',2,6,5),('MER_MEDICINSKI_RADNIK','MED_RAD_RADI_U_ORG',2,9,2),('ORG_ORGANIZACIJA','MED_RAD_RADI_U_ORG',2,6,4),('Database','MER_MEDICINSKI_RADNIK',1,1,9),('DRZ_DRZAVA','OPS_OPSTINA',2,11,1),('Database','ORG_ORGANIZACIJA',1,1,6),('Database','ORT_ORGANIZACIJA_TIP',1,1,3),('PAT_PACIJENT','PAM_PACIJENT_MEDICINSKI_PODACI',2,8,6),('PAT_PACIJENT','PAS_PACIJENT_SOCIJALNI_PODACI',2,8,1),('Database','PAT_PACIJENT',1,1,8),('MER_MEDICINSKI_RADNIK','POS_POSJETA',2,9,1),('PAT_PACIJENT','POS_POSJETA',2,8,4),('LIJ_ATCKLASIFIKACIJA_LIJEKOVA','PREPISANI_LIJEKOVI',2,13,1),('MER_MEDICINSKI_RADNIK','PREPISANI_LIJEKOVI',2,9,5),('PAT_PACIJENT','PREPISANI_LIJEKOVI',2,8,8),('POS_POSJETA','PREPISANI_LIJEKOVI',3,1,2),('POS_POSJETA','PREPISANI_LIJEKOVI',3,4,2),('ORG_ORGANIZACIJA','SAL_SALA',2,6,1),('Database','TER_TERMIN',1,1,10),('ORG_ORGANIZACIJA','URE_MEDICINSKI_UREDJAJ',2,6,3),('DIJ_MKB10_SIFARNIK_DIJAGNOZA','USPOSTAVLJENE_DIJAGNOZE',2,12,1),('MER_MEDICINSKI_RADNIK','USPOSTAVLJENE_DIJAGNOZE',2,9,4),('PAT_PACIJENT','USPOSTAVLJENE_DIJAGNOZE',2,8,7),('POS_POSJETA','USPOSTAVLJENE_DIJAGNOZE',3,1,1),('POS_POSJETA','USPOSTAVLJENE_DIJAGNOZE',3,4,1),('Database','VIM_VRSTA_IMUNIZACIJE',1,1,5),('Database','VIN_VRSTA_INVALIDNOSTI',1,1,4),('ORG_ORGANIZACIJA','VOZ_VOZILO',2,6,2),('PAT_PACIJENT','ZAP_ISTORIJA_ZAPOSLENJA',2,8,5);
/*!40000 ALTER TABLE `hijerarhija_tabela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imu_imunizacija`
--

DROP TABLE IF EXISTS `imu_imunizacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imu_imunizacija` (
  `PAT_IDENT` int(11) NOT NULL,
  `VIM_IDENT` int(11) NOT NULL,
  `IMU_IDENT` int(11) NOT NULL,
  `IMU_DATUM` date NOT NULL,
  `IMU_NAPO` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PAT_IDENT`,`VIM_IDENT`,`IMU_IDENT`),
  KEY `FK_VRSTA_IMUNIZACIJE` (`VIM_IDENT`),
  CONSTRAINT `FK_IMUNIZACIJE_PACIJENTA` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pam_pacijent_medicinski_podaci` (`PAT_IDENT`),
  CONSTRAINT `FK_VRSTA_IMUNIZACIJE` FOREIGN KEY (`VIM_IDENT`) REFERENCES `vim_vrsta_imunizacije` (`VIM_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imu_imunizacija`
--

LOCK TABLES `imu_imunizacija` WRITE;
/*!40000 ALTER TABLE `imu_imunizacija` DISABLE KEYS */;
INSERT INTO `imu_imunizacija` VALUES (1,1,1,'1980-01-01','Prva vakcina'),(1,2,2,'1982-01-01','Druga vakcina');
/*!40000 ALTER TABLE `imu_imunizacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_invalidnost`
--

DROP TABLE IF EXISTS `inv_invalidnost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_invalidnost` (
  `PAT_IDENT` int(11) NOT NULL,
  `VIN_IDENT` int(11) NOT NULL,
  `INV_IDENT` int(11) NOT NULL,
  `INV_DAT` date NOT NULL,
  `INV_RAT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PAT_IDENT`,`VIN_IDENT`,`INV_IDENT`),
  KEY `FK_VRSTA_INVALIDNOSTI` (`VIN_IDENT`),
  CONSTRAINT `FK_INVALIDNOSTI_PACIJENTA` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pam_pacijent_medicinski_podaci` (`PAT_IDENT`),
  CONSTRAINT `FK_VRSTA_INVALIDNOSTI` FOREIGN KEY (`VIN_IDENT`) REFERENCES `vin_vrsta_invalidnosti` (`VIN_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_invalidnost`
--

LOCK TABLES `inv_invalidnost` WRITE;
/*!40000 ALTER TABLE `inv_invalidnost` DISABLE KEYS */;
INSERT INTO `inv_invalidnost` VALUES (1,1,1,'1999-02-02',0);
/*!40000 ALTER TABLE `inv_invalidnost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izvjestaji`
--

DROP TABLE IF EXISTS `izvjestaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `izvjestaji` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izvjestaji`
--

LOCK TABLES `izvjestaji` WRITE;
/*!40000 ALTER TABLE `izvjestaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `izvjestaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasa_izvjestaja`
--

DROP TABLE IF EXISTS `klasa_izvjestaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasa_izvjestaja` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `KL_NAZIV` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasa_izvjestaja`
--

LOCK TABLES `klasa_izvjestaja` WRITE;
/*!40000 ALTER TABLE `klasa_izvjestaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `klasa_izvjestaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kor_korisnik`
--

DROP TABLE IF EXISTS `kor_korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kor_korisnik` (
  `KOR_IDENT` int(11) NOT NULL,
  `MER_IDENT` int(11) DEFAULT NULL,
  `PAT_IDENT` int(11) DEFAULT NULL,
  `KOR_AKTIVAN` tinyint(1) NOT NULL,
  `KOR_KIME` varchar(100) NOT NULL,
  `KOR_LOZINKA` varchar(30) NOT NULL,
  PRIMARY KEY (`KOR_IDENT`),
  KEY `FK_KORISNIK_MEDICINSKI_RADNIK` (`MER_IDENT`),
  KEY `FK_KORISNIK_PACIJENT` (`PAT_IDENT`),
  CONSTRAINT `FK_KORISNIK_MEDICINSKI_RADNIK` FOREIGN KEY (`MER_IDENT`) REFERENCES `mer_medicinski_radnik` (`MER_IDENT`),
  CONSTRAINT `FK_KORISNIK_PACIJENT` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pat_pacijent` (`PAT_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kor_korisnik`
--

LOCK TABLES `kor_korisnik` WRITE;
/*!40000 ALTER TABLE `kor_korisnik` DISABLE KEYS */;
INSERT INTO `kor_korisnik` VALUES (1,NULL,1,1,'ognjen','klincov'),(2,1,NULL,1,'admin','admin');
/*!40000 ALTER TABLE `kor_korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kva_kvalifikacije`
--

DROP TABLE IF EXISTS `kva_kvalifikacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kva_kvalifikacije` (
  `KVA_IDENT` int(11) NOT NULL,
  `KVA_NAZIV` varchar(150) NOT NULL,
  PRIMARY KEY (`KVA_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kva_kvalifikacije`
--

LOCK TABLES `kva_kvalifikacije` WRITE;
/*!40000 ALTER TABLE `kva_kvalifikacije` DISABLE KEYS */;
INSERT INTO `kva_kvalifikacije` VALUES (1,'Grafički tehnolog'),(2,'Učitelj');
/*!40000 ALTER TABLE `kva_kvalifikacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kval_medg_rad`
--

DROP TABLE IF EXISTS `kval_medg_rad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kval_medg_rad` (
  `KVA_IDENT` int(11) NOT NULL,
  `MER_IDENT` int(11) NOT NULL,
  PRIMARY KEY (`KVA_IDENT`,`MER_IDENT`),
  KEY `FK_KVAL_MEDG_RAD2` (`MER_IDENT`),
  CONSTRAINT `FK_KVAL_MEDG_RAD` FOREIGN KEY (`KVA_IDENT`) REFERENCES `kva_kvalifikacije` (`KVA_IDENT`),
  CONSTRAINT `FK_KVAL_MEDG_RAD2` FOREIGN KEY (`MER_IDENT`) REFERENCES `mer_medicinski_radnik` (`MER_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kval_medg_rad`
--

LOCK TABLES `kval_medg_rad` WRITE;
/*!40000 ALTER TABLE `kval_medg_rad` DISABLE KEYS */;
INSERT INTO `kval_medg_rad` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `kval_medg_rad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lij_atcklasifikacija_lijekova`
--

DROP TABLE IF EXISTS `lij_atcklasifikacija_lijekova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lij_atcklasifikacija_lijekova` (
  `LIJ_IDENT` int(11) NOT NULL,
  `LIJ_NAZIV` varchar(300) NOT NULL,
  `LIJ_SIFRA` varchar(7) NOT NULL,
  PRIMARY KEY (`LIJ_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lij_atcklasifikacija_lijekova`
--

LOCK TABLES `lij_atcklasifikacija_lijekova` WRITE;
/*!40000 ALTER TABLE `lij_atcklasifikacija_lijekova` DISABLE KEYS */;
INSERT INTO `lij_atcklasifikacija_lijekova` VALUES (1,' Laksativi','A06'),(2,'Lijekovi s djelovanjem na žuč i jetreno tkivo','A05'),(3,'Spasmolitici i antikolinergici','A03'),(4,'Lijekovi za suzbijanje mučnine i nagona na povraćanje (antiemetici)','A04'),(5,'Lijekovi za olakšavanje probave uključivši probavne enzime','A09');
/*!40000 ALTER TABLE `lij_atcklasifikacija_lijekova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokacija_organizacije`
--

DROP TABLE IF EXISTS `lokacija_organizacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokacija_organizacije` (
  `ORG_IDENT` int(11) NOT NULL,
  `DRZ_IDENT` int(11) NOT NULL,
  PRIMARY KEY (`ORG_IDENT`,`DRZ_IDENT`),
  KEY `FK_LOKACIJA_ORGANIZACIJE2` (`DRZ_IDENT`),
  CONSTRAINT `FK_LOKACIJA_ORGANIZACIJE` FOREIGN KEY (`ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`),
  CONSTRAINT `FK_LOKACIJA_ORGANIZACIJE2` FOREIGN KEY (`DRZ_IDENT`) REFERENCES `drz_drzava` (`DRZ_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokacija_organizacije`
--

LOCK TABLES `lokacija_organizacije` WRITE;
/*!40000 ALTER TABLE `lokacija_organizacije` DISABLE KEYS */;
/*!40000 ALTER TABLE `lokacija_organizacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_rad_radi_u_org`
--

DROP TABLE IF EXISTS `med_rad_radi_u_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_rad_radi_u_org` (
  `MER_IDENT` int(11) NOT NULL,
  `ORG_IDENT` int(11) NOT NULL,
  PRIMARY KEY (`MER_IDENT`,`ORG_IDENT`),
  KEY `FK_MED_RAD_RADI_U_ORG2` (`ORG_IDENT`),
  CONSTRAINT `FK_MED_RAD_RADI_U_ORG` FOREIGN KEY (`MER_IDENT`) REFERENCES `mer_medicinski_radnik` (`MER_IDENT`),
  CONSTRAINT `FK_MED_RAD_RADI_U_ORG2` FOREIGN KEY (`ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_rad_radi_u_org`
--

LOCK TABLES `med_rad_radi_u_org` WRITE;
/*!40000 ALTER TABLE `med_rad_radi_u_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `med_rad_radi_u_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mer_medicinski_radnik`
--

DROP TABLE IF EXISTS `mer_medicinski_radnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mer_medicinski_radnik` (
  `MER_IDENT` int(11) NOT NULL,
  `KOR_IDENT` int(11) DEFAULT NULL,
  `MER_IME` varchar(60) NOT NULL COMMENT 'Ime pacijenta',
  `MER_PREZ` varchar(60) NOT NULL COMMENT 'Prezime pacijenta',
  `MER_DPREZ` varchar(60) DEFAULT NULL,
  `MER_JMBG` decimal(13,0) NOT NULL,
  `MER_POL` char(1) NOT NULL,
  `MER_DATR` date NOT NULL,
  `MER_ADR` varchar(150) NOT NULL,
  `MER_TELF` varchar(20) DEFAULT NULL,
  `MER_TELM` varchar(20) DEFAULT NULL,
  `MER_TELK` varchar(20) NOT NULL,
  `MER_EMAIL` varchar(20) DEFAULT NULL,
  `MER_NAPO` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`MER_IDENT`),
  KEY `FK_KORISNIK_MEDICINSKI_RADNIK2` (`KOR_IDENT`),
  CONSTRAINT `FK_KORISNIK_MEDICINSKI_RADNIK2` FOREIGN KEY (`KOR_IDENT`) REFERENCES `kor_korisnik` (`KOR_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mer_medicinski_radnik`
--

LOCK TABLES `mer_medicinski_radnik` WRITE;
/*!40000 ALTER TABLE `mer_medicinski_radnik` DISABLE KEYS */;
INSERT INTO `mer_medicinski_radnik` VALUES (1,2,'Jelena','Pajić',NULL,2036587452123,'Ž','1988-02-05','Karađorđeva 3','065 888 999','065 456 566','051 444 444','jecadoc@mail.com',NULL),(2,2,'Nikola','Zorić',NULL,2036587452856,'M','1975-02-05','Karađorđeva 3','065 999 999','065 565 566','051 444 498','nidze@mail.com',NULL);
/*!40000 ALTER TABLE `mer_medicinski_radnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ops_opstina`
--

DROP TABLE IF EXISTS `ops_opstina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_opstina` (
  `DRZ_IDENT` int(11) NOT NULL,
  `OPS_IDENT` int(11) NOT NULL,
  `OPS_NAZIV` varchar(100) NOT NULL,
  PRIMARY KEY (`DRZ_IDENT`,`OPS_IDENT`),
  CONSTRAINT `FK_LOKALNA_SAMOUPRAVA2` FOREIGN KEY (`DRZ_IDENT`) REFERENCES `drz_drzava` (`DRZ_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ops_opstina`
--

LOCK TABLES `ops_opstina` WRITE;
/*!40000 ALTER TABLE `ops_opstina` DISABLE KEYS */;
INSERT INTO `ops_opstina` VALUES (1,78000,'Banja Luka'),(1,78400,'Gradiška');
/*!40000 ALTER TABLE `ops_opstina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_organizacija`
--

DROP TABLE IF EXISTS `org_organizacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_organizacija` (
  `ORG_IDENT` int(11) NOT NULL,
  `ORG_ORG_IDENT` int(11) DEFAULT NULL,
  `ORT_IDENT` smallint(6) NOT NULL,
  `ORG_NAZIV` varchar(100) NOT NULL,
  `ORG_ADR` varchar(200) NOT NULL,
  `ORG_TELP` varchar(20) NOT NULL,
  `ORG_TELS` varchar(20) DEFAULT NULL,
  `ORG_JIB` decimal(13,0) DEFAULT NULL,
  `ORG_IB` decimal(12,0) DEFAULT NULL,
  `ORG_PDVO` tinyint(1) NOT NULL,
  `ORG_EMAIL` varchar(150) DEFAULT NULL,
  `ORG_FAX` varchar(20) DEFAULT NULL,
  `ORG_WEB` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORG_IDENT`),
  KEY `FK_ORG_JE_TIPA` (`ORT_IDENT`),
  KEY `FK_PRIPADA_ORGANIZACIJI` (`ORG_ORG_IDENT`),
  CONSTRAINT `FK_ORG_JE_TIPA` FOREIGN KEY (`ORT_IDENT`) REFERENCES `ort_organizacija_tip` (`ORT_IDENT`),
  CONSTRAINT `FK_PRIPADA_ORGANIZACIJI` FOREIGN KEY (`ORG_ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_organizacija`
--

LOCK TABLES `org_organizacija` WRITE;
/*!40000 ALTER TABLE `org_organizacija` DISABLE KEYS */;
INSERT INTO `org_organizacija` VALUES (1,NULL,1,'Klinički centar Banja Luka','Paprikovac 45','051 555 999','051 555 365',54125632144,54125632144,0,'infokl@mail.com','051524456','www.klin.ba'),(2,NULL,2,'Dom zdravlja Banja Luka','Jovana Dučića 87','051 444 999','051 565 365',54159632144,54128832144,0,'infodz@mail.com','051 555 456','www.dom.ba'),(3,2,2,'Dom zdravlja Banja Luka Borik','Patre  8','051 777 999','051 888 365',54159632884,54128888144,0,'infodzbor@mail.com','051 666 456','www.dom.ba');
/*!40000 ALTER TABLE `org_organizacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ort_organizacija_tip`
--

DROP TABLE IF EXISTS `ort_organizacija_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ort_organizacija_tip` (
  `ORT_IDENT` smallint(6) NOT NULL,
  `ORT_NAZIV` varchar(250) NOT NULL,
  PRIMARY KEY (`ORT_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ort_organizacija_tip`
--

LOCK TABLES `ort_organizacija_tip` WRITE;
/*!40000 ALTER TABLE `ort_organizacija_tip` DISABLE KEYS */;
INSERT INTO `ort_organizacija_tip` VALUES (1,'Klinički centar'),(2,'Dom zdravlja');
/*!40000 ALTER TABLE `ort_organizacija_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pam_pacijent_medicinski_podaci`
--

DROP TABLE IF EXISTS `pam_pacijent_medicinski_podaci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pam_pacijent_medicinski_podaci` (
  `PAT_IDENT` int(11) NOT NULL,
  `PAM_KRGR` char(2) NOT NULL,
  `PAM_RHF` char(1) NOT NULL,
  `PAM_DAORG` tinyint(1) DEFAULT NULL COMMENT 'Podrazumjevano false',
  `PAM_PUS` tinyint(1) DEFAULT NULL,
  `PAM_GOJ` tinyint(1) DEFAULT NULL,
  `PAM_POTH` tinyint(1) DEFAULT NULL,
  `PAM_ZLOUALKOH` tinyint(1) DEFAULT NULL,
  `PAM_DROG` tinyint(1) DEFAULT NULL,
  `PAM_HIPER` tinyint(1) DEFAULT NULL,
  `PAM_DIJAB` tinyint(1) DEFAULT NULL,
  `PAM_PRORG` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PAT_IDENT`),
  CONSTRAINT `FK_MEDICINSKI_PODACI_PACIJENTA` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pat_pacijent` (`PAT_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pam_pacijent_medicinski_podaci`
--

LOCK TABLES `pam_pacijent_medicinski_podaci` WRITE;
/*!40000 ALTER TABLE `pam_pacijent_medicinski_podaci` DISABLE KEYS */;
INSERT INTO `pam_pacijent_medicinski_podaci` VALUES (1,'A','+',0,0,1,0,1,0,1,0,0);
/*!40000 ALTER TABLE `pam_pacijent_medicinski_podaci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametri`
--

DROP TABLE IF EXISTS `parametri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametri` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametri`
--

LOCK TABLES `parametri` WRITE;
/*!40000 ALTER TABLE `parametri` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pas_pacijent_socijalni_podaci`
--

DROP TABLE IF EXISTS `pas_pacijent_socijalni_podaci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pas_pacijent_socijalni_podaci` (
  `PAT_IDENT` int(11) NOT NULL,
  `ETP_IDENT` int(11) NOT NULL,
  `KVA_IDENT` int(11) NOT NULL,
  `PAS_BRSTATUS` char(1) NOT NULL,
  `PAS_BRDJECE` decimal(2,0) DEFAULT NULL,
  `PAS_SOCSTATUS` char(1) DEFAULT NULL,
  `PAS_BRPOR` decimal(2,0) DEFAULT NULL,
  `PAS_MIGRANT` tinyint(1) NOT NULL,
  `PAS_BESKUCNIK` tinyint(1) NOT NULL,
  `PAS_SEZRADNIK` tinyint(1) NOT NULL,
  `PAS_STRSPR` char(3) NOT NULL,
  PRIMARY KEY (`PAT_IDENT`),
  KEY `FK_ETNICKA_PRIPADNOST_PACIJENTA` (`ETP_IDENT`),
  KEY `FK_KVALIFIKACIJE_PACIJENTA` (`KVA_IDENT`),
  CONSTRAINT `FK_ETNICKA_PRIPADNOST_PACIJENTA` FOREIGN KEY (`ETP_IDENT`) REFERENCES `etp_etnicka_pripadnost` (`ETP_IDENT`),
  CONSTRAINT `FK_KVALIFIKACIJE_PACIJENTA` FOREIGN KEY (`KVA_IDENT`) REFERENCES `kva_kvalifikacije` (`KVA_IDENT`),
  CONSTRAINT `FK_SOCIJALNI_PODACI_PACIJENTA` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pat_pacijent` (`PAT_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pas_pacijent_socijalni_podaci`
--

LOCK TABLES `pas_pacijent_socijalni_podaci` WRITE;
/*!40000 ALTER TABLE `pas_pacijent_socijalni_podaci` DISABLE KEYS */;
INSERT INTO `pas_pacijent_socijalni_podaci` VALUES (1,1,1,'O',3,NULL,5,0,0,0,'0');
/*!40000 ALTER TABLE `pas_pacijent_socijalni_podaci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pat_pacijent`
--

DROP TABLE IF EXISTS `pat_pacijent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pat_pacijent` (
  `PAT_IDENT` int(11) NOT NULL,
  `KOR_IDENT` int(11) DEFAULT NULL,
  `PAT_JMBG` decimal(13,0) NOT NULL COMMENT 'Jedinstveni maticni broj gradana. 13 cifara.',
  `PAT_IME` varchar(60) NOT NULL,
  `PAT_PREZIME` varchar(60) NOT NULL,
  `PAT_DPREZIME` varchar(60) DEFAULT NULL COMMENT 'Djevojacko prezime pacijenta. Nije obavezno polje.',
  `PAT_POL` char(1) NOT NULL,
  `PAT_RDATVRI` datetime NOT NULL,
  `PAT_SDATVRI` datetime DEFAULT NULL,
  `PAT_ADRESA` varchar(150) DEFAULT NULL,
  `PAT_TELEFONF` varchar(20) DEFAULT NULL,
  `PAT_TELEFONM` varchar(20) DEFAULT NULL,
  `PAT_EMAIL` varchar(150) DEFAULT NULL,
  `PAT_AKTIVAN` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PAT_IDENT`),
  KEY `FK_KORISNIK_PACIJENT2` (`KOR_IDENT`),
  CONSTRAINT `FK_KORISNIK_PACIJENT2` FOREIGN KEY (`KOR_IDENT`) REFERENCES `kor_korisnik` (`KOR_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pat_pacijent`
--

LOCK TABLES `pat_pacijent` WRITE;
/*!40000 ALTER TABLE `pat_pacijent` DISABLE KEYS */;
INSERT INTO `pat_pacijent` VALUES (1,NULL,259654789542,'Ognjen','Klincov',NULL,'M','1980-01-01 00:00:00',NULL,'Karađorđeva 979','051 569 564','065 856 422','ogizmaj@gmail.com',1),(2,NULL,4569854269874,'Maja','Malić','Klincov','Ž','1988-05-05 00:00:00',NULL,'Vidovdanska 98','051 453 486','065 895 521','majica@mail.com',1);
/*!40000 ALTER TABLE `pat_pacijent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podgrupa_izvjestaja`
--

DROP TABLE IF EXISTS `podgrupa_izvjestaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `podgrupa_izvjestaja` (
  `KL_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `GRU_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PG_OZNAKA` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `PG_NAZIV` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KL_OZNAKA`,`GRU_OZNAKA`,`PG_OZNAKA`),
  CONSTRAINT `FK_IMA_PODGRUPE` FOREIGN KEY (`KL_OZNAKA`, `GRU_OZNAKA`) REFERENCES `grupa_izvjestaja` (`KL_OZNAKA`, `GRU_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podgrupa_izvjestaja`
--

LOCK TABLES `podgrupa_izvjestaja` WRITE;
/*!40000 ALTER TABLE `podgrupa_izvjestaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `podgrupa_izvjestaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podsistemi`
--

DROP TABLE IF EXISTS `podsistemi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `podsistemi` (
  `PS_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PS_NAZIV` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`PS_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podsistemi`
--

LOCK TABLES `podsistemi` WRITE;
/*!40000 ALTER TABLE `podsistemi` DISABLE KEYS */;
/*!40000 ALTER TABLE `podsistemi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polja`
--

DROP TABLE IF EXISTS `polja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polja` (
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `POL_KOD` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `POL_LABELA` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TBL_KOD`,`POL_KOD`),
  CONSTRAINT `FK_POSEDUJE_POLJA` FOREIGN KEY (`TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polja`
--

LOCK TABLES `polja` WRITE;
/*!40000 ALTER TABLE `polja` DISABLE KEYS */;
INSERT INTO `polja` VALUES ('DIJ_MKB10_SIFARNIK_DIJAGNOZA','DIJ_IDENT','DIJ_IDENT'),('DIJ_MKB10_SIFARNIK_DIJAGNOZA','DIJ_NAZIV','DIJ_NAZIV'),('DRZ_DRZAVA','DRZ_IDENT','DRZ_IDENT'),('DRZ_DRZAVA','DRZ_KOD','DRZ_KOD'),('DRZ_DRZAVA','DRZ_NAZIV','DRZ_NAZIV'),('ETP_ETNICKA_PRIPADNOST','ETP_IDENT','ETP_IDENT'),('ETP_ETNICKA_PRIPADNOST','ETP_NAZIV','ETP_NAZIV'),('IMU_IMUNIZACIJA','IMU_DATUM','IMU_DATUM'),('IMU_IMUNIZACIJA','IMU_IDENT','IMU_IDENT'),('IMU_IMUNIZACIJA','IMU_NAPO','IMU_NAPO'),('IMU_IMUNIZACIJA','PAT_IDENT','PAT_IDENT'),('IMU_IMUNIZACIJA','VIM_IDENT','VIM_IDENT'),('INV_INVALIDNOST','INV_DAT','INV_DAT'),('INV_INVALIDNOST','INV_IDENT','INV_IDENT'),('INV_INVALIDNOST','INV_RAT','INV_RAT'),('INV_INVALIDNOST','PAT_IDENT','PAT_IDENT'),('INV_INVALIDNOST','VIN_IDENT','VIN_IDENT'),('KOR_KORISNIK','KOR_AKTIVAN','KOR_AKTIVAN'),('KOR_KORISNIK','KOR_IDENT','KOR_IDENT'),('KOR_KORISNIK','KOR_KIME','KOR_KIME'),('KOR_KORISNIK','KOR_LOZINKA','KOR_LOZINKA'),('KOR_KORISNIK','MER_IDENT','MER_IDENT'),('KOR_KORISNIK','PAT_IDENT','PAT_IDENT'),('KVA_KVALIFIKACIJE','KVA_IDENT','KVA_IDENT'),('KVA_KVALIFIKACIJE','KVA_NAZIV','KVA_NAZIV'),('KVAL_MEDG_RAD','KVA_IDENT','KVA_IDENT'),('KVAL_MEDG_RAD','MER_IDENT','MER_IDENT'),('LIJ_ATCKLASIFIKACIJA_LIJEKOVA','LIJ_IDENT','LIJ_IDENT'),('LIJ_ATCKLASIFIKACIJA_LIJEKOVA','LIJ_NAZIV','LIJ_NAZIV'),('LOKACIJA_ORGANIZACIJE','DRZ_IDENT','DRZ_IDENT'),('LOKACIJA_ORGANIZACIJE','ORG_IDENT','ORG_IDENT'),('MED_RAD_RADI_U_ORG','MER_IDENT','MER_IDENT'),('MED_RAD_RADI_U_ORG','ORG_IDENT','ORG_IDENT'),('MER_MEDICINSKI_RADNIK','KOR_IDENT','KOR_IDENT'),('MER_MEDICINSKI_RADNIK','MER_ADR','MER_ADR'),('MER_MEDICINSKI_RADNIK','MER_DATR','MER_DATR'),('MER_MEDICINSKI_RADNIK','MER_DPREZ','MER_DPREZ'),('MER_MEDICINSKI_RADNIK','MER_EMAIL','MER_EMAIL'),('MER_MEDICINSKI_RADNIK','MER_IDENT','MER_IDENT'),('MER_MEDICINSKI_RADNIK','MER_IME','MER_IME'),('MER_MEDICINSKI_RADNIK','MER_JMBG','MER_JMBG'),('MER_MEDICINSKI_RADNIK','MER_NAPO','MER_NAPO'),('MER_MEDICINSKI_RADNIK','MER_POL','MER_POL'),('MER_MEDICINSKI_RADNIK','MER_PREZ','MER_PREZ'),('MER_MEDICINSKI_RADNIK','MER_TELF','MER_TELF'),('MER_MEDICINSKI_RADNIK','MER_TELK','MER_TELK'),('MER_MEDICINSKI_RADNIK','MER_TELM','MER_TELM'),('OPS_OPSTINA','DRZ_IDENT','DRZ_IDENT'),('OPS_OPSTINA','OPS_IDENT','OPS_IDENT'),('OPS_OPSTINA','OPS_NAZIV','OPS_NAZIV'),('ORG_ORGANIZACIJA','ORG_ADR','ORG_ADR'),('ORG_ORGANIZACIJA','ORG_EMAIL','ORG_EMAIL'),('ORG_ORGANIZACIJA','ORG_FAX','ORG_FAX'),('ORG_ORGANIZACIJA','ORG_IB','ORG_IB'),('ORG_ORGANIZACIJA','ORG_IDENT','ORG_IDENT'),('ORG_ORGANIZACIJA','ORG_JIB','ORG_JIB'),('ORG_ORGANIZACIJA','ORG_NAZIV','ORG_NAZIV'),('ORG_ORGANIZACIJA','ORG_ORG_IDENT','ORG_ORG_IDENT'),('ORG_ORGANIZACIJA','ORG_PDVO','ORG_PDVO'),('ORG_ORGANIZACIJA','ORG_TELP','ORG_TELP'),('ORG_ORGANIZACIJA','ORG_TELS','ORG_TELS'),('ORG_ORGANIZACIJA','ORG_WEB','ORG_WEB'),('ORG_ORGANIZACIJA','ORT_IDENT','ORT_IDENT'),('ORT_ORGANIZACIJA_TIP','ORT_IDENT','ORT_IDENT'),('ORT_ORGANIZACIJA_TIP','ORT_NAZIV','ORT_NAZIV'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_DAORG','PAM_DAORG'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_DIJAB','PAM_DIJAB'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_DROG','PAM_DROG'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_GOJ','PAM_GOJ'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_HIPER','PAM_HIPER'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_KRGR','PAM_KRGR'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_POTH','PAM_POTH'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_PRORG','PAM_PRORG'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_PUS','PAM_PUS'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_RHF','PAM_RHF'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_ZLOUALKOH','PAM_ZLOUALKOH'),('PAM_PACIJENT_MEDICINSKI_PODACI','PAT_IDENT','PAT_IDENT'),('PAS_PACIJENT_SOCIJALNI_PODACI','ETP_IDENT','ETP_IDENT'),('PAS_PACIJENT_SOCIJALNI_PODACI','KVA_IDENT','KVA_IDENT'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_BESKUCNIK','PAS_BESKUCNIK'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_BRDJECE','PAS_BRDJECE'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_BRPOR','PAS_BRPOR'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_BRSTATUS','PAS_BRSTATUS'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_MIGRANT','PAS_MIGRANT'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_SEZRADNIK','PAS_SEZRADNIK'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_SOCSTATUS','PAS_SOCSTATUS'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_STRSPR','PAS_STRSPR'),('PAS_PACIJENT_SOCIJALNI_PODACI','PAT_IDENT','PAT_IDENT'),('PAT_PACIJENT','KOR_IDENT','KOR_IDENT'),('PAT_PACIJENT','PAT_ADRESA','PAT_ADRESA'),('PAT_PACIJENT','PAT_AKTIVAN','PAT_AKTIVAN'),('PAT_PACIJENT','PAT_DPREZIME','PAT_DPREZIME'),('PAT_PACIJENT','PAT_EMAIL','PAT_EMAIL'),('PAT_PACIJENT','PAT_IDENT','PAT_IDENT'),('PAT_PACIJENT','PAT_IME','PAT_IME'),('PAT_PACIJENT','PAT_JMBG','PAT_JMBG'),('PAT_PACIJENT','PAT_POL','PAT_POL'),('PAT_PACIJENT','PAT_PREZIME','PAT_PREZIME'),('PAT_PACIJENT','PAT_RDATVRI','PAT_RDATVRI'),('PAT_PACIJENT','PAT_SDATVRI','PAT_SDATVRI'),('PAT_PACIJENT','PAT_TELEFONF','PAT_TELEFONF'),('PAT_PACIJENT','PAT_TELEFONM','PAT_TELEFONM'),('POS_POSJETA','MER_IDENT','MER_IDENT'),('POS_POSJETA','ORG_IDENT','ORG_IDENT'),('POS_POSJETA','PAT_IDENT','PAT_IDENT'),('POS_POSJETA','POS_DAT','POS_DAT'),('POS_POSJETA','POS_IDENT','POS_IDENT'),('POS_POSJETA','POS_NAPO','POS_NAPO'),('PREPISANI_LIJEKOVI','LIJ_IDENT','LIJ_IDENT'),('PREPISANI_LIJEKOVI','MER_IDENT','MER_IDENT'),('PREPISANI_LIJEKOVI','PAT_IDENT','PAT_IDENT'),('PREPISANI_LIJEKOVI','POS_IDENT','POS_IDENT'),('SAL_SALA','ORG_IDENT','ORG_IDENT'),('SAL_SALA','SAL_BROJ','SAL_BROJ'),('SAL_SALA','SAL_IDENT','SAL_IDENT'),('SAL_SALA','SAL_NAPO','SAL_NAPO'),('SAL_SALA','SAL_NAZIV','SAL_NAZIV'),('TER_TERMIN','MER_IDENT','MER_IDENT'),('TER_TERMIN','ORG_IDENT','ORG_IDENT'),('TER_TERMIN','PAT_IDENT','PAT_IDENT'),('TER_TERMIN','POS_IDENT','POS_IDENT'),('TER_TERMIN','SAL_IDENT','SAL_IDENT'),('TER_TERMIN','SAL_ORG_IDENT','SAL_ORG_IDENT'),('TER_TERMIN','TER_DATUM','TER_DATUM'),('TER_TERMIN','TER_IDENT','TER_IDENT'),('TER_TERMIN','TER_KRAJ','TER_KRAJ'),('TER_TERMIN','TER_NAPO','TER_NAPO'),('TER_TERMIN','TER_POC','TER_POC'),('TER_TERMIN','TER_STATUS','TER_STATUS'),('TER_TERMIN','URE_IDENT','URE_IDENT'),('TER_TERMIN','URE_ORG_IDENT','URE_ORG_IDENT'),('TER_TERMIN','VOZ_IDENT','VOZ_IDENT'),('URE_MEDICINSKI_UREDJAJ','ORG_IDENT','ORG_IDENT'),('URE_MEDICINSKI_UREDJAJ','URE_DATISTEKA','URE_DATISTEKA'),('URE_MEDICINSKI_UREDJAJ','URE_DATPROIZV','URE_DATPROIZV'),('URE_MEDICINSKI_UREDJAJ','URE_IDENT','URE_IDENT'),('URE_MEDICINSKI_UREDJAJ','URE_MODEL','URE_MODEL'),('URE_MEDICINSKI_UREDJAJ','URE_PROIZV','URE_PROIZV'),('URE_MEDICINSKI_UREDJAJ','URE_STATUS','URE_STATUS'),('URE_MEDICINSKI_UREDJAJ','URE_VERZIJA','URE_VERZIJA'),('URE_MEDICINSKI_UREDJAJ','URT_IDENT','URT_IDENT'),('USPOSTAVLJENE_DIJAGNOZE','DIJ_IDENT','DIJ_IDENT'),('USPOSTAVLJENE_DIJAGNOZE','MER_IDENT','MER_IDENT'),('USPOSTAVLJENE_DIJAGNOZE','PAT_IDENT','PAT_IDENT'),('USPOSTAVLJENE_DIJAGNOZE','POS_IDENT','POS_IDENT'),('VIM_VRSTA_IMUNIZACIJE','VIM_IDENT','VIM_IDENT'),('VIM_VRSTA_IMUNIZACIJE','VIM_NAZIV','VIM_NAZIV'),('VIN_VRSTA_INVALIDNOSTI','VIN_IDENT','VIN_IDENT'),('VIN_VRSTA_INVALIDNOSTI','VIN_NAZIV','VIN_NAZIV'),('VOZ_VOZILO','ORG_IDENT','ORG_IDENT'),('VOZ_VOZILO','VOZ_IDENT','VOZ_IDENT'),('VOZ_VOZILO','VOZ_MARKA','VOZ_MARKA'),('VOZ_VOZILO','VOZ_REGBR','VOZ_REGBR'),('VOZ_VOZILO','VOZ_REGDAT','VOZ_REGDAT'),('ZAP_ISTORIJA_ZAPOSLENJA','PAT_IDENT','PAT_IDENT'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_ADRESA','ZAP_ADRESA'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_DATDO','ZAP_DATDO'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_DATOD','ZAP_DATOD'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_IDENT','ZAP_IDENT'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_JIB','ZAP_JIB'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_NFIRME','ZAP_NFIRME'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_OPIS','ZAP_OPIS'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_RIZ_VID','ZAP_RIZ_VID'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_RIZHEM','ZAP_RIZHEM'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_RIZNJUH','ZAP_RIZNJUH'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_RIZPRA','ZAP_RIZPRA'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_RIZSJE','ZAP_RIZSJE'),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_RIZSTA','ZAP_RIZSTA');
/*!40000 ALTER TABLE `polja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_posjeta`
--

DROP TABLE IF EXISTS `pos_posjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_posjeta` (
  `PAT_IDENT` int(11) NOT NULL,
  `MER_IDENT` int(11) NOT NULL,
  `POS_IDENT` int(11) NOT NULL,
  `ORG_IDENT` int(11) NOT NULL,
  `POS_DAT` date NOT NULL,
  `POS_NAPO` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PAT_IDENT`,`MER_IDENT`,`POS_IDENT`),
  KEY `FK_PREGLED_JE_OBAVIO_MEDICINSKI_RADNIK` (`MER_IDENT`),
  KEY `FK_PREGLED_JE_OBAVLJEN_U_USTANOVI` (`ORG_IDENT`),
  CONSTRAINT `FK_PREGLEDI_PACIJENTA` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pam_pacijent_medicinski_podaci` (`PAT_IDENT`),
  CONSTRAINT `FK_PREGLED_JE_OBAVIO_MEDICINSKI_RADNIK` FOREIGN KEY (`MER_IDENT`) REFERENCES `mer_medicinski_radnik` (`MER_IDENT`),
  CONSTRAINT `FK_PREGLED_JE_OBAVLJEN_U_USTANOVI` FOREIGN KEY (`ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_posjeta`
--

LOCK TABLES `pos_posjeta` WRITE;
/*!40000 ALTER TABLE `pos_posjeta` DISABLE KEYS */;
INSERT INTO `pos_posjeta` VALUES (1,1,1,2,'2016-02-02','Kašalj'),(1,1,2,2,'2016-03-06','Visoka temperatura');
/*!40000 ALTER TABLE `pos_posjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseduje_izvestaje`
--

DROP TABLE IF EXISTS `poseduje_izvestaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseduje_izvestaje` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseduje_izvestaje`
--

LOCK TABLES `poseduje_izvestaje` WRITE;
/*!40000 ALTER TABLE `poseduje_izvestaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `poseduje_izvestaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prepisani_lijekovi`
--

DROP TABLE IF EXISTS `prepisani_lijekovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepisani_lijekovi` (
  `LIJ_IDENT` int(11) NOT NULL,
  `PAT_IDENT` int(11) NOT NULL,
  `MER_IDENT` int(11) NOT NULL,
  `POS_IDENT` int(11) NOT NULL,
  PRIMARY KEY (`PAT_IDENT`,`MER_IDENT`,`LIJ_IDENT`,`POS_IDENT`),
  KEY `FK_PREPISANI_LIJEKOVI` (`LIJ_IDENT`),
  KEY `FK_PREPISANI_LIJEKOVI2` (`PAT_IDENT`,`MER_IDENT`,`POS_IDENT`),
  CONSTRAINT `FK_PREPISANI_LIJEKOVI` FOREIGN KEY (`LIJ_IDENT`) REFERENCES `lij_atcklasifikacija_lijekova` (`LIJ_IDENT`),
  CONSTRAINT `FK_PREPISANI_LIJEKOVI2` FOREIGN KEY (`PAT_IDENT`, `MER_IDENT`, `POS_IDENT`) REFERENCES `pos_posjeta` (`PAT_IDENT`, `MER_IDENT`, `POS_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepisani_lijekovi`
--

LOCK TABLES `prepisani_lijekovi` WRITE;
/*!40000 ALTER TABLE `prepisani_lijekovi` DISABLE KEYS */;
INSERT INTO `prepisani_lijekovi` VALUES (1,1,1,1),(2,1,1,1);
/*!40000 ALTER TABLE `prepisani_lijekovi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sadrzi`
--

DROP TABLE IF EXISTS `sadrzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sadrzi` (
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `PS_OZNAKA` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TBL_KOD`,`PS_OZNAKA`),
  KEY `FK_SADRZI2` (`PS_OZNAKA`),
  CONSTRAINT `FK_SADRZI` FOREIGN KEY (`TBL_KOD`) REFERENCES `tabele` (`TBL_KOD`),
  CONSTRAINT `FK_SADRZI2` FOREIGN KEY (`PS_OZNAKA`) REFERENCES `podsistemi` (`PS_OZNAKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sadrzi`
--

LOCK TABLES `sadrzi` WRITE;
/*!40000 ALTER TABLE `sadrzi` DISABLE KEYS */;
/*!40000 ALTER TABLE `sadrzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sal_sala`
--

DROP TABLE IF EXISTS `sal_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sal_sala` (
  `ORG_IDENT` int(11) NOT NULL,
  `SAL_IDENT` int(11) NOT NULL,
  `SAL_NAZIV` varchar(250) DEFAULT NULL,
  `SAL_BROJ` varchar(20) NOT NULL,
  `SAL_NAPO` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ORG_IDENT`,`SAL_IDENT`),
  CONSTRAINT `FK_SALA_PRIPADA_ORG` FOREIGN KEY (`ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sal_sala`
--

LOCK TABLES `sal_sala` WRITE;
/*!40000 ALTER TABLE `sal_sala` DISABLE KEYS */;
INSERT INTO `sal_sala` VALUES (1,1,'Sala za pregled 1','105',NULL),(1,2,'Sala za sastanke','103',NULL),(1,3,'Sala za konferencije','1003',NULL);
/*!40000 ALTER TABLE `sal_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabele`
--

DROP TABLE IF EXISTS `tabele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabele` (
  `TBL_KOD` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TBL_NAZIV` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TBL_SLICICA` longblob,
  `TBL_HIT_RATE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TBL_KOD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabele`
--

LOCK TABLES `tabele` WRITE;
/*!40000 ALTER TABLE `tabele` DISABLE KEYS */;
INSERT INTO `tabele` VALUES ('Database','Database',NULL,0),('DIJ_MKB10_SIFARNIK_DIJAGNOZA','DIJ_MKB10_SIFARNIK_DIJAGNOZA',NULL,0),('DRZ_DRZAVA','DRZ_DRZAVA',NULL,0),('ETP_ETNICKA_PRIPADNOST','ETP_ETNICKA_PRIPADNOST',NULL,0),('IMU_IMUNIZACIJA','IMU_IMUNIZACIJA',NULL,0),('INV_INVALIDNOST','INV_INVALIDNOST',NULL,0),('KOR_KORISNIK','KOR_KORISNIK',NULL,0),('KVA_KVALIFIKACIJE','KVA_KVALIFIKACIJE',NULL,0),('KVAL_MEDG_RAD','KVAL_MEDG_RAD',NULL,0),('LIJ_ATCKLASIFIKACIJA_LIJEKOVA','LIJ_ATCKLASIFIKACIJA_LIJEKOVA',NULL,0),('LOKACIJA_ORGANIZACIJE','LOKACIJA_ORGANIZACIJE',NULL,0),('MED_RAD_RADI_U_ORG','MED_RAD_RADI_U_ORG',NULL,0),('MER_MEDICINSKI_RADNIK','MER_MEDICINSKI_RADNIK',NULL,0),('OPS_OPSTINA','OPS_OPSTINA',NULL,0),('ORG_ORGANIZACIJA','ORG_ORGANIZACIJA',NULL,0),('ORT_ORGANIZACIJA_TIP','ORT_ORGANIZACIJA_TIP',NULL,0),('PAM_PACIJENT_MEDICINSKI_PODACI','PAM_PACIJENT_MEDICINSKI_PODACI',NULL,0),('PAS_PACIJENT_SOCIJALNI_PODACI','PAS_PACIJENT_SOCIJALNI_PODACI',NULL,0),('PAT_PACIJENT','PAT_PACIJENT',NULL,0),('POS_POSJETA','POS_POSJETA',NULL,0),('PREPISANI_LIJEKOVI','PREPISANI_LIJEKOVI',NULL,0),('SAL_SALA','SAL_SALA',NULL,0),('TER_TERMIN','TER_TERMIN',NULL,0),('URE_MEDICINSKI_UREDJAJ','URE_MEDICINSKI_UREDJAJ',NULL,0),('USPOSTAVLJENE_DIJAGNOZE','USPOSTAVLJENE_DIJAGNOZE',NULL,0),('VIM_VRSTA_IMUNIZACIJE','VIM_VRSTA_IMUNIZACIJE',NULL,0),('VIN_VRSTA_INVALIDNOSTI','VIN_VRSTA_INVALIDNOSTI',NULL,0),('VOZ_VOZILO','VOZ_VOZILO',NULL,0),('ZAP_ISTORIJA_ZAPOSLENJA','ZAP_ISTORIJA_ZAPOSLENJA',NULL,0);
/*!40000 ALTER TABLE `tabele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ter_termin`
--

DROP TABLE IF EXISTS `ter_termin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ter_termin` (
  `TER_IDENT` bigint(20) NOT NULL,
  `URE_IDENT` int(11) DEFAULT NULL,
  `ORG_IDENT` int(11) DEFAULT NULL,
  `VOZ_IDENT` int(11) DEFAULT NULL,
  `PAT_IDENT` int(11) DEFAULT NULL,
  `MER_IDENT` int(11) DEFAULT NULL,
  `POS_IDENT` int(11) DEFAULT NULL,
  `SAL_IDENT` int(11) DEFAULT NULL,
  `TER_DATUM` date NOT NULL,
  `TER_POC` time NOT NULL,
  `TER_KRAJ` time NOT NULL,
  `TER_STATUS` char(1) NOT NULL,
  `TER_NAPO` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`TER_IDENT`),
  KEY `FK_POSJETI_SU_PRIDRUZENI_TERMINI` (`PAT_IDENT`,`MER_IDENT`,`POS_IDENT`),
  KEY `FK_VOZILO_JE_REZERVISANO_NA_TERMIN` (`ORG_IDENT`,`VOZ_IDENT`),
  KEY `FK_MEDIICINSKI_UREDAJ_JE_REZERVISAN_ZA_TERMIN` (`URE_IDENT`),
  KEY `FK_SALA_JE_REZERVISANA_ZA_TERMIN` (`SAL_IDENT`),
  CONSTRAINT `FK_POSJETI_SU_PRIDRUZENI_TERMINI` FOREIGN KEY (`PAT_IDENT`, `MER_IDENT`, `POS_IDENT`) REFERENCES `pos_posjeta` (`PAT_IDENT`, `MER_IDENT`, `POS_IDENT`),
  CONSTRAINT `FK_VOZILO_JE_REZERVISANO_NA_TERMIN` FOREIGN KEY (`ORG_IDENT`, `VOZ_IDENT`) REFERENCES `voz_vozilo` (`ORG_IDENT`, `VOZ_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ter_termin`
--

LOCK TABLES `ter_termin` WRITE;
/*!40000 ALTER TABLE `ter_termin` DISABLE KEYS */;
INSERT INTO `ter_termin` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,'2016-06-06','08:00:00','08:15:00','R','termin za uređaj'),(2,NULL,1,1,NULL,NULL,NULL,NULL,'2016-06-06','08:00:00','08:20:00','R','termin za vozilo'),(3,NULL,1,NULL,1,1,1,NULL,'2016-07-07','09:00:00','09:15:00','Z','termin za pacijenta'),(4,NULL,1,NULL,NULL,NULL,NULL,1,'2016-02-02','10:00:00','11:00:00','Z','termin za salu');
/*!40000 ALTER TABLE `ter_termin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ure_medicinski_uredjaj`
--

DROP TABLE IF EXISTS `ure_medicinski_uredjaj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ure_medicinski_uredjaj` (
  `ORG_IDENT` int(11) NOT NULL,
  `URE_IDENT` int(11) NOT NULL,
  `URT_IDENT` int(11) NOT NULL,
  `URE_PROIZV` varchar(500) DEFAULT NULL,
  `URE_MODEL` varchar(20) DEFAULT NULL,
  `URE_VERZIJA` varchar(20) DEFAULT NULL,
  `URE_STATUS` char(1) NOT NULL,
  `URE_DATPROIZV` date DEFAULT NULL,
  `URE_DATISTEKA` date DEFAULT NULL,
  PRIMARY KEY (`ORG_IDENT`,`URE_IDENT`),
  KEY `FK_MED_UREDJ_JE_TIPA` (`URT_IDENT`),
  CONSTRAINT `FK_MED_UREDJ_JE_TIPA` FOREIGN KEY (`URT_IDENT`) REFERENCES `urt_tip_medicinskog_uredjaja` (`URT_IDENT`),
  CONSTRAINT `FK_MED_UREDJ_U_ORG` FOREIGN KEY (`ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ure_medicinski_uredjaj`
--

LOCK TABLES `ure_medicinski_uredjaj` WRITE;
/*!40000 ALTER TABLE `ure_medicinski_uredjaj` DISABLE KEYS */;
INSERT INTO `ure_medicinski_uredjaj` VALUES (1,1,1,'AMS medicos','Ab jh8','1.0.0.','A','2010-01-01','2030-01-01'),(1,2,1,'AMS medicos','AGk','1.0.1.','A','2010-01-02','2050-01-02'),(2,2,1,'Mos meic','dr55','1.0.0.','A','2005-01-01','2020-01-01');
/*!40000 ALTER TABLE `ure_medicinski_uredjaj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urt_tip_medicinskog_uredjaja`
--

DROP TABLE IF EXISTS `urt_tip_medicinskog_uredjaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urt_tip_medicinskog_uredjaja` (
  `URT_IDENT` int(11) NOT NULL,
  `URT_URT_IDENT` int(11) DEFAULT NULL,
  `URT_SIFRA` varchar(10) NOT NULL,
  `URT_NAZIV` varchar(100) NOT NULL,
  PRIMARY KEY (`URT_IDENT`),
  KEY `FK_PODTIP_MED_UREDJ` (`URT_URT_IDENT`),
  CONSTRAINT `FK_PODTIP_MED_UREDJ` FOREIGN KEY (`URT_URT_IDENT`) REFERENCES `urt_tip_medicinskog_uredjaja` (`URT_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urt_tip_medicinskog_uredjaja`
--

LOCK TABLES `urt_tip_medicinskog_uredjaja` WRITE;
/*!40000 ALTER TABLE `urt_tip_medicinskog_uredjaja` DISABLE KEYS */;
INSERT INTO `urt_tip_medicinskog_uredjaja` VALUES (1,NULL,'56955A','Dijagnostički uređaj'),(2,NULL,'54HUB','Terapeutski uređaj');
/*!40000 ALTER TABLE `urt_tip_medicinskog_uredjaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uspostavljene_dijagnoze`
--

DROP TABLE IF EXISTS `uspostavljene_dijagnoze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uspostavljene_dijagnoze` (
  `DIJ_IDENT` int(11) NOT NULL,
  `PAT_IDENT` int(11) NOT NULL,
  `MER_IDENT` int(11) NOT NULL,
  `POS_IDENT` int(11) NOT NULL,
  PRIMARY KEY (`PAT_IDENT`,`MER_IDENT`,`DIJ_IDENT`,`POS_IDENT`),
  KEY `FK_USPOSTAVLJENE_DIJAGNOZE` (`DIJ_IDENT`),
  KEY `FK_USPOSTAVLJENE_DIJAGNOZE2` (`PAT_IDENT`,`MER_IDENT`,`POS_IDENT`),
  CONSTRAINT `FK_USPOSTAVLJENE_DIJAGNOZE` FOREIGN KEY (`DIJ_IDENT`) REFERENCES `dij_mkb10_sifarnik_dijagnoza` (`DIJ_IDENT`),
  CONSTRAINT `FK_USPOSTAVLJENE_DIJAGNOZE2` FOREIGN KEY (`PAT_IDENT`, `MER_IDENT`, `POS_IDENT`) REFERENCES `pos_posjeta` (`PAT_IDENT`, `MER_IDENT`, `POS_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uspostavljene_dijagnoze`
--

LOCK TABLES `uspostavljene_dijagnoze` WRITE;
/*!40000 ALTER TABLE `uspostavljene_dijagnoze` DISABLE KEYS */;
INSERT INTO `uspostavljene_dijagnoze` VALUES (1,1,1,1),(2,1,1,1);
/*!40000 ALTER TABLE `uspostavljene_dijagnoze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vim_vrsta_imunizacije`
--

DROP TABLE IF EXISTS `vim_vrsta_imunizacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vim_vrsta_imunizacije` (
  `VIM_IDENT` int(11) NOT NULL,
  `VIM_NAZIV` varchar(300) NOT NULL,
  PRIMARY KEY (`VIM_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vim_vrsta_imunizacije`
--

LOCK TABLES `vim_vrsta_imunizacije` WRITE;
/*!40000 ALTER TABLE `vim_vrsta_imunizacije` DISABLE KEYS */;
INSERT INTO `vim_vrsta_imunizacije` VALUES (1,'BCG - protiv tuberkoloze'),(2,'HEP B - protiv zarazne žutice B'),(3,'OPV - protiv dječje paralize'),(4,'DTP - protiv difterije, tetanusa i velikog kašlja'),(5,'MMR - protiv malih boginja, zauški i rubeole'),(6,'DT - protiv difterije i tetanusa'),(7,'HIB - protiv hemofilus influencije tipa B');
/*!40000 ALTER TABLE `vim_vrsta_imunizacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vin_vrsta_invalidnosti`
--

DROP TABLE IF EXISTS `vin_vrsta_invalidnosti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vin_vrsta_invalidnosti` (
  `VIN_IDENT` int(11) NOT NULL,
  `VIN_NAZIV` varchar(300) NOT NULL,
  PRIMARY KEY (`VIN_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vin_vrsta_invalidnosti`
--

LOCK TABLES `vin_vrsta_invalidnosti` WRITE;
/*!40000 ALTER TABLE `vin_vrsta_invalidnosti` DISABLE KEYS */;
INSERT INTO `vin_vrsta_invalidnosti` VALUES (1,'Artritis'),(2,'Autizam'),(3,'Cerebralna paraliza'),(4,'Dečija paraliza'),(5,'Disleksija'),(6,'Distrofija'),(7,'Down sindrom'),(8,'Mentalna oštećenja'),(9,'Multipla skleroza'),(10,'Oštećenja kičme'),(11,'Oštećenje sluha'),(12,'Oštećenje vida'),(13,'Retov sindrom');
/*!40000 ALTER TABLE `vin_vrsta_invalidnosti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voz_vozilo`
--

DROP TABLE IF EXISTS `voz_vozilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voz_vozilo` (
  `ORG_IDENT` int(11) NOT NULL,
  `VOZ_IDENT` int(11) NOT NULL,
  `VOZ_REGBR` varchar(12) NOT NULL,
  `VOZ_MARKA` varchar(20) NOT NULL,
  `VOZ_REGDAT` date NOT NULL,
  PRIMARY KEY (`ORG_IDENT`,`VOZ_IDENT`),
  CONSTRAINT `FK_VOZILO_PRIPADA_ORG` FOREIGN KEY (`ORG_IDENT`) REFERENCES `org_organizacija` (`ORG_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voz_vozilo`
--

LOCK TABLES `voz_vozilo` WRITE;
/*!40000 ALTER TABLE `voz_vozilo` DISABLE KEYS */;
INSERT INTO `voz_vozilo` VALUES (1,1,'459-A-458','BMW','2016-01-01'),(1,2,'569-E-456','Opel','2016-01-01');
/*!40000 ALTER TABLE `voz_vozilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zap_istorija_zaposlenja`
--

DROP TABLE IF EXISTS `zap_istorija_zaposlenja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zap_istorija_zaposlenja` (
  `PAT_IDENT` int(11) NOT NULL,
  `ZAP_IDENT` int(11) NOT NULL,
  `ZAP_NFIRME` varchar(250) NOT NULL,
  `ZAP_JIB` decimal(13,0) DEFAULT NULL,
  `ZAP_ADRESA` varchar(250) DEFAULT NULL,
  `ZAP_OPIS` varchar(500) NOT NULL,
  `ZAP_RIZSJE` tinyint(1) NOT NULL,
  `ZAP_RIZSTA` tinyint(1) NOT NULL,
  `ZAP_RIZ_VID` tinyint(1) NOT NULL,
  `ZAP_RIZNJUH` tinyint(1) NOT NULL,
  `ZAP_RIZPRA` tinyint(1) NOT NULL,
  `ZAP_RIZHEM` tinyint(1) NOT NULL,
  `ZAP_DATOD` date NOT NULL,
  `ZAP_DATDO` date DEFAULT NULL,
  PRIMARY KEY (`PAT_IDENT`,`ZAP_IDENT`),
  CONSTRAINT `FK_ZAPOSLENJA_PACIJENTA` FOREIGN KEY (`PAT_IDENT`) REFERENCES `pat_pacijent` (`PAT_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zap_istorija_zaposlenja`
--

LOCK TABLES `zap_istorija_zaposlenja` WRITE;
/*!40000 ALTER TABLE `zap_istorija_zaposlenja` DISABLE KEYS */;
INSERT INTO `zap_istorija_zaposlenja` VALUES (1,1,'Doro D.O.O.',657897654323,'Patre 4','Informatičar',1,0,1,0,0,0,'2002-02-05','2010-02-05'),(1,2,'Jaous  D.O.O.',657897654765,'Vidovdanska 23','Elektroničar',1,1,1,0,0,0,'2010-02-05',NULL);
/*!40000 ALTER TABLE `zap_istorija_zaposlenja` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-14 12:11:40
