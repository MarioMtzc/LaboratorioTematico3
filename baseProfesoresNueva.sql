-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: tematico3
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=412985 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos`
--

LOCK TABLES `archivos` WRITE;
/*!40000 ALTER TABLE `archivos` DISABLE KEYS */;
INSERT INTO `archivos` VALUES (5,1,'musica.pdf'),(12,1,'creatividadComputacional.pdf'),(412984,1,'SeguridadInformatica.pdf');
/*!40000 ALTER TABLE `archivos` ENABLE KEYS */;
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
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nickname` varchar(150) DEFAULT NULL,
  `idArchivo` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nickname` (`nickname`),
  KEY `idArchivo` (`idArchivo`),
  CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`nickname`) REFERENCES `usuario` (`nickname`),
  CONSTRAINT `publicaciones_ibfk_2` FOREIGN KEY (`idArchivo`) REFERENCES `archivos` (`idArchivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
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
INSERT INTO `usuario` VALUES ('Adriana Gabriela Ramirez de la Rosa',1,'623417',2),('Carlos Rodriguez Lucatero',1,'957815',2),('Christian Sanchez Sanchez',1,'978261',2),('Dominique Emlle Henry Decouchant',1,'152436',2),('Eduardo Leyva Del Foyo',1,'987654',2),('Erick de Jesus Lopez Ornelas',1,'398716',2),('Francisco de Asis Lopez Fuentes',1,'556399',3),('Hector Jimenez Salazar',1,'296627',2),('Joaquin Sergio Zepeda Hernandez',1,'957241',2),('Maria del Rocio Abascal Mena',1,'556399',2),('Otoniel Manuel Ortiz Ruiz',1,'465190',2),('Rafael Perez y Perez',1,'512899',2),('Santiago Negrete Yankelevich',1,'999887',2),('Tiburcio Moreno Olivos',1,'134562',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-30 15:17:52
