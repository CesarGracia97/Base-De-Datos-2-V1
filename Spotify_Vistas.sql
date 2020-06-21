-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 161.35.61.150    Database: Spotify
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Artistas`
--

DROP TABLE IF EXISTS `Artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artistas` (
  `Id_Artista` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Artista` varchar(50) DEFAULT NULL,
  `Apellido_Artista` varchar(50) DEFAULT NULL,
  `Nombre_Artistico` varchar(100) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `NumeroSeguidores` int(11) NOT NULL,
  `Foto` blob NOT NULL,
  `N_Seguidores` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Artista`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artistas`
--

LOCK TABLES `Artistas` WRITE;
/*!40000 ALTER TABLE `Artistas` DISABLE KEYS */;
INSERT INTO `Artistas` VALUES (1,'Zephania','Galloway','Hannah, Plato, Walker, Cassidy','2028-03-20','Mauritius','EMC13XHH0ZV',45,'877',156),(2,'Cyrus','Webb','Ulric, Mallory, Vivian, Byron','2013-04-20','Bulgaria','EIA30AES8KN',19,'877',220),(3,'Kadeem','Duran','Damian, Ezra, Jin, Baxter','2023-03-20','Heard Island and Mcdonald Islands','AWV13EAE0GH',51,'877',899),(4,'Blake','Henson','Quintessa, Thaddeus, Lucy, Roary','2019-05-21','Sao Tome and Principe','DBR06HSY7YR',40,'877',406);
/*!40000 ALTER TABLE `Artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auditoria`
--

DROP TABLE IF EXISTS `Auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auditoria` (
  `Id_Auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `Procedimiento` varchar(45) DEFAULT NULL,
  `InicioSesion` datetime NOT NULL,
  `CierreSesion` datetime NOT NULL,
  PRIMARY KEY (`Id_Auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auditoria`
--

LOCK TABLES `Auditoria` WRITE;
/*!40000 ALTER TABLE `Auditoria` DISABLE KEYS */;
INSERT INTO `Auditoria` VALUES (1,'Leah Foreman','2020-09-20 22:04:27','2019-07-09 17:47:47'),(2,'Graiden Camacho','2019-07-17 05:34:38','2019-08-29 13:55:36'),(3,'Tara F. Bowman','2019-08-02 02:29:17','2020-04-23 12:48:16'),(4,'Courtney X. Rice','2021-04-27 21:46:29','2021-01-08 08:24:26');
/*!40000 ALTER TABLE `Auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cancion`
--

DROP TABLE IF EXISTS `Cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cancion` (
  `Id_Cancion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Cancion` varchar(50) DEFAULT NULL,
  `Numero_Visitas` int(11) NOT NULL,
  `Duracion_Cancion` int(11) NOT NULL,
  `Descripcion_Cancion` varchar(50) DEFAULT NULL,
  `Id_Disco` int(11) NOT NULL,
  PRIMARY KEY (`Id_Cancion`),
  KEY `Id_Disco` (`Id_Disco`),
  CONSTRAINT `Id_Disco` FOREIGN KEY (`Id_Disco`) REFERENCES `Disco` (`Id_Disco`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cancion`
--

LOCK TABLES `Cancion` WRITE;
/*!40000 ALTER TABLE `Cancion` DISABLE KEYS */;
INSERT INTO `Cancion` VALUES (1,'Dillon',54,238,'Aliquam Industries',1),(2,'Steel',407,245,'Mauris Company',2),(3,'Dominic',773,207,'Non LLP',3),(4,'Talon',414,455,'Tempus Consulting',4);
/*!40000 ALTER TABLE `Cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disco`
--

DROP TABLE IF EXISTS `Disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disco` (
  `Id_Disco` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Disco` varchar(50) DEFAULT NULL,
  `N_Canciones` int(11) DEFAULT NULL,
  `Id_Artista` int(11) NOT NULL,
  `Fecha_Lansamiento` date DEFAULT NULL,
  `Descripcion_Disco` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Disco`),
  KEY `Id_Artista` (`Id_Artista`),
  CONSTRAINT `Id_Artista` FOREIGN KEY (`Id_Artista`) REFERENCES `Artistas` (`Id_Artista`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disco`
--

LOCK TABLES `Disco` WRITE;
/*!40000 ALTER TABLE `Disco` DISABLE KEYS */;
INSERT INTO `Disco` VALUES (1,'Lionel',3,1,'2007-05-24','Cras Company'),(2,'Jeremy',2,2,'2015-08-22','Lorem Ac LLP'),(3,'Dale',6,3,'2031-08-24','Auctor Ullamcorper Nisl Incorporated'),(4,'Drew',1,4,'2013-06-25','Ultricies Adipiscing Foundation');
/*!40000 ALTER TABLE `Disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorito`
--

DROP TABLE IF EXISTS `Favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Favorito` (
  `Id_Favorito` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Cancion` int(11) NOT NULL,
  PRIMARY KEY (`Id_Favorito`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `Id_Cancion` (`Id_Cancion`),
  CONSTRAINT `Id_Cancion` FOREIGN KEY (`Id_Cancion`) REFERENCES `Cancion` (`Id_Cancion`),
  CONSTRAINT `Id_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorito`
--

LOCK TABLES `Favorito` WRITE;
/*!40000 ALTER TABLE `Favorito` DISABLE KEYS */;
INSERT INTO `Favorito` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `Favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lista_Reproduccion`
--

DROP TABLE IF EXISTS `Lista_Reproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lista_Reproduccion` (
  `Id_LR` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_LR` varchar(50) DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_LR`),
  KEY `Id_User` (`Id_Usuario`),
  CONSTRAINT `Id_User` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lista_Reproduccion`
--

LOCK TABLES `Lista_Reproduccion` WRITE;
/*!40000 ALTER TABLE `Lista_Reproduccion` DISABLE KEYS */;
INSERT INTO `Lista_Reproduccion` VALUES (1,'Keefe',1),(2,'Fitzgerald',2),(3,'Ivor',3),(4,'Stephen',4);
/*!40000 ALTER TABLE `Lista_Reproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Id_Login` int(11) NOT NULL AUTO_INCREMENT,
  `Correo_Electronico` varchar(50) DEFAULT NULL,
  `Password_U` varchar(50) DEFAULT NULL,
  `Reset_Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (1,'quis.pede.Praesent@adipiscing.net','UPC08VNF5TF','RKF21RSU9HD'),(2,'leo.elementum@sapienCras.org','OVA73LVU3YE','VMU96ANT4GB'),(3,'sodales.purus@ultricies.org','ODC71RLV1PQ','FUZ70DHT6KT'),(4,'sit.amet.nulla@Donec.com','UAK29FHY6FZ','AZP23POU9AY');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pago`
--

DROP TABLE IF EXISTS `Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pago` (
  `Id_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(11) NOT NULL,
  `Nombre_PTarjeta` varchar(100) DEFAULT NULL,
  `Numero_Tarjeta` varchar(20) DEFAULT NULL,
  `Fecha_Vencimiento` date DEFAULT NULL,
  `codigo_Seguridad_` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Id_Pago`),
  KEY `Id_Users` (`Id_Usuario`),
  CONSTRAINT `Id_Users` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pago`
--

LOCK TABLES `Pago` WRITE;
/*!40000 ALTER TABLE `Pago` DISABLE KEYS */;
INSERT INTO `Pago` VALUES (1,1,'Egestas Blandit Nam Corp.','1529394085','2024-06-22','855'),(2,2,'Sem Mollis Dui LLC','7281868113','2030-09-19','756'),(3,3,'Tellus Aenean Egestas Consulting','6552482539','2013-04-24','608'),(4,4,'Etiam Gravida Associates','7339957376','2022-10-22','625');
/*!40000 ALTER TABLE `Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Reporte de Ingreso 1`
--

DROP TABLE IF EXISTS `Reporte de Ingreso 1`;
/*!50001 DROP VIEW IF EXISTS `Reporte de Ingreso 1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Reporte de Ingreso 1` (
  `Nombre_Usuario` tinyint NOT NULL,
  `Id_Auditoria` tinyint NOT NULL,
  `InicioSesion` tinyint NOT NULL,
  `CierreSesion` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Restricion`
--

DROP TABLE IF EXISTS `Restricion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restricion` (
  `Id_Restricion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Restricion` varchar(50) DEFAULT NULL,
  `Descripcion_Restricion` varchar(100) DEFAULT NULL,
  `Id_Rol` int(11) NOT NULL,
  PRIMARY KEY (`Id_Restricion`),
  KEY `Id_Rol` (`Id_Rol`),
  CONSTRAINT `Id_Rol` FOREIGN KEY (`Id_Rol`) REFERENCES `Rol` (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restricion`
--

LOCK TABLES `Restricion` WRITE;
/*!40000 ALTER TABLE `Restricion` DISABLE KEYS */;
INSERT INTO `Restricion` VALUES (1,'Brooke','Campania',1),(2,'Jena','Leinster',2),(3,'Echo','IX',3),(4,'Diana','Nordrhein-Westphalen',4);
/*!40000 ALTER TABLE `Restricion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (1,'Carlos'),(2,'Kareem'),(3,'Kennan'),(4,'Kiara');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seguidor`
--

DROP TABLE IF EXISTS `Seguidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seguidor` (
  `Id_Seguidor` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Seguidor`),
  KEY `Id_Usuarios` (`Id_Usuario`),
  CONSTRAINT `Id_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seguidor`
--

LOCK TABLES `Seguidor` WRITE;
/*!40000 ALTER TABLE `Seguidor` DISABLE KEYS */;
INSERT INTO `Seguidor` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `Seguidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sugerencia_Canciones`
--

DROP TABLE IF EXISTS `Sugerencia_Canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sugerencia_Canciones` (
  `Id_Sugerencia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Sugerencia` varchar(60) DEFAULT NULL,
  `Id_LR` int(11) NOT NULL,
  `Id_Cancion` int(11) NOT NULL,
  PRIMARY KEY (`Id_Sugerencia`),
  KEY `Id_LR` (`Id_LR`),
  KEY `Id_CancionS` (`Id_Cancion`),
  CONSTRAINT `Id_CancionS` FOREIGN KEY (`Id_Cancion`) REFERENCES `Cancion` (`Id_Cancion`),
  CONSTRAINT `Id_LR` FOREIGN KEY (`Id_LR`) REFERENCES `Lista_Reproduccion` (`Id_LR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sugerencia_Canciones`
--

LOCK TABLES `Sugerencia_Canciones` WRITE;
/*!40000 ALTER TABLE `Sugerencia_Canciones` DISABLE KEYS */;
INSERT INTO `Sugerencia_Canciones` VALUES (1,'Volutpat Nulla Dignissim Institute',1,1),(2,'Quis LLC',2,2),(3,'Non Foundation',3,3),(4,'Magna Et Foundation',4,4);
/*!40000 ALTER TABLE `Sugerencia_Canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Top Canciones Mas Escuchadas`
--

DROP TABLE IF EXISTS `Top Canciones Mas Escuchadas`;
/*!50001 DROP VIEW IF EXISTS `Top Canciones Mas Escuchadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Top Canciones Mas Escuchadas` (
  `Id_Cancion` tinyint NOT NULL,
  `Nombre_Cancion` tinyint NOT NULL,
  `Descripcion_Cancion` tinyint NOT NULL,
  `Nombre_Artistico` tinyint NOT NULL,
  `Numero_Visitas` tinyint NOT NULL,
  `NumeroSeguidores` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` varchar(50) DEFAULT NULL,
  `Apellido_Usuario` varchar(50) DEFAULT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Foto` blob NOT NULL,
  `Id_Login` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `Id_Rols` (`Id_Rol`),
  KEY `Id_Login` (`Id_Login`),
  CONSTRAINT `Id_Login` FOREIGN KEY (`Id_Login`) REFERENCES `Login` (`Id_Login`),
  CONSTRAINT `Id_Rols` FOREIGN KEY (`Id_Rol`) REFERENCES `Rol` (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Berk A. Dawson','Goodwin','2017-03-20',1,'343',1),(2,'Ferdinand J. Stafford','Rios','2021-03-21',2,'343',2),(3,'Ifeoma W. Walker','Hahn','2019-06-19',3,'343',3),(4,'Guinevere T. Berg','Hardin','2007-03-20',4,'343',4);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Reporte de Ingreso 1`
--

/*!50001 DROP TABLE IF EXISTS `Reporte de Ingreso 1`*/;
/*!50001 DROP VIEW IF EXISTS `Reporte de Ingreso 1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Reporte de Ingreso 1` AS select `Usuario`.`Nombre_Usuario` AS `Nombre_Usuario`,`Auditoria`.`Id_Auditoria` AS `Id_Auditoria`,`Auditoria`.`InicioSesion` AS `InicioSesion`,`Auditoria`.`CierreSesion` AS `CierreSesion` from (`Usuario` join `Auditoria`) where `Usuario`.`Nombre_Usuario` = `Usuario`.`Nombre_Usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Top Canciones Mas Escuchadas`
--

/*!50001 DROP TABLE IF EXISTS `Top Canciones Mas Escuchadas`*/;
/*!50001 DROP VIEW IF EXISTS `Top Canciones Mas Escuchadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Top Canciones Mas Escuchadas` AS select `Cancion`.`Id_Cancion` AS `Id_Cancion`,`Cancion`.`Nombre_Cancion` AS `Nombre_Cancion`,`Cancion`.`Descripcion_Cancion` AS `Descripcion_Cancion`,`Artistas`.`Nombre_Artistico` AS `Nombre_Artistico`,`Cancion`.`Numero_Visitas` AS `Numero_Visitas`,`Artistas`.`NumeroSeguidores` AS `NumeroSeguidores` from (`Cancion` join `Artistas`) where `Cancion`.`Id_Cancion` = `Cancion`.`Id_Cancion` and `Cancion`.`Nombre_Cancion` = `Cancion`.`Nombre_Cancion` and `Cancion`.`Descripcion_Cancion` = `Cancion`.`Descripcion_Cancion` and `Artistas`.`Nombre_Artistico` = `Artistas`.`Nombre_Artistico` and `Cancion`.`Numero_Visitas` = `Cancion`.`Numero_Visitas` and `Artistas`.`NumeroSeguidores` = `Artistas`.`NumeroSeguidores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 19:33:34
