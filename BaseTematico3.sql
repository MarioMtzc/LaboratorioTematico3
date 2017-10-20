-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: temático3
-- ------------------------------------------------------
--
-- Table structure for table `archivos`
--

DROP TABLE IF EXISTS `archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivos` (
  `idArchivo` int(11) NOT NULL AUTO_INCREMENT,
  `estatus` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`idArchivo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos`
--

LOCK TABLES `archivos` WRITE;
/*!40000 ALTER TABLE `archivos` DISABLE KEYS */;
INSERT INTO `archivos` VALUES (1,1,'algoritmia basica.pdf','mQENBFkl4jIBCACeDRQ13r4gBE6DY5picIMXt38xFYJgOQ8d7jl7SLlYmwHByZus');
/*!40000 ALTER TABLE `archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialA`
--

DROP TABLE IF EXISTS `historialA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialA` (
  `nickname` varchar(150) NOT NULL,
  `idArchivo` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` int(11) NOT NULL,
  PRIMARY KEY (`nickname`,`idArchivo`,`fecha`),
  KEY `idArchivo` (`idArchivo`),
  CONSTRAINT `historialA_ibfk_1` FOREIGN KEY (`nickname`) REFERENCES `usuario` (`nickname`),
  CONSTRAINT `historialA_ibfk_2` FOREIGN KEY (`idArchivo`) REFERENCES `archivos` (`idArchivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialA`
--

LOCK TABLES `historialA` WRITE;
/*!40000 ALTER TABLE `historialA` DISABLE KEYS */;
INSERT INTO `historialA` VALUES ('brendajan',13,'2017-03-02 15:02:00',0),('hersy',6,'2017-04-15 09:07:11',1),('macema30',4,'2017-07-09 19:18:00',2),('macema30',15,'2017-07-22 23:02:16',2),('macema30',17,'2017-07-22 22:50:36',2),('macema30',20,'2017-07-24 14:35:11',0),('menadel',9,'2017-06-30 08:50:10',1),('menadel',15,'2017-07-22 22:05:00',0),('menadel',17,'2017-07-22 22:37:36',1),('menadel',18,'2017-07-22 22:19:51',0),('menadel',19,'2017-07-22 22:22:00',0),('Vivian_987',5,'2017-06-30 10:58:22',0);
/*!40000 ALTER TABLE `historialA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialU`
--

DROP TABLE IF EXISTS `historialU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialU` (
  `nicknameU` varchar(150) NOT NULL,
  `nicknameA` varchar(150) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` int(11) NOT NULL,
  PRIMARY KEY (`nicknameA`,`nicknameU`,`fecha`),
  KEY `nicknameU` (`nicknameU`),
  CONSTRAINT `historialU_ibfk_1` FOREIGN KEY (`nicknameA`) REFERENCES `usuario` (`nickname`),
  CONSTRAINT `historialU_ibfk_2` FOREIGN KEY (`nicknameU`) REFERENCES `usuario` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialU`
--

LOCK TABLES `historialU` WRITE;
/*!40000 ALTER TABLE `historialU` DISABLE KEYS */;
INSERT INTO `historialU` VALUES ('alexgallo','laumoreno','0000-00-00 00:00:00',3),('domini26','laumoreno','0000-00-00 00:00:00',4),('julianaparis','laumoreno','0000-00-00 00:00:00',5),('onaranjo','laumoreno','0000-00-00 00:00:00',3),('tona82','laumoreno','2017-07-23 00:43:49',3),('tona82','laumoreno','2017-07-23 00:50:59',5),('tona82','laumoreno','2017-07-23 00:59:53',4);
/*!40000 ALTER TABLE `historialU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `perfil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Sólo puede ver el listado de los archivos que se encuentran en el servidor '),(2,'Puede ver, subir y descargar archivos. '),(3,'Puede ver, subir, descargar y eliminar archivos. '),(4,'Puede hacer todo lo de los anteriores y además cambiar los perfiles, contraseñas y estado de otros usuarios.');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `nickname` varchar(150) NOT NULL,
  `estatus` int(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `perfil` int(11) NOT NULL,
  PRIMARY KEY (`nickname`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`perfil`) REFERENCES `perfil` (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('aguevara',0,'123',2),('alexgallo',1,'123',1),('brendajan',1,'123',2),('domini26',0,'123',1),('hersy',1,'123',3),('hoberstudent',1,'123',1),('julianaparis',1,'123',3),('juribe',1,'123',1),('laumoreno',1,'123',4),('macema30',1,'123',3),('menadel',1,'123',2),('onaranjo',1,'123',1),('tona82',0,'2020',4),('Vivian_987',1,'123',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
