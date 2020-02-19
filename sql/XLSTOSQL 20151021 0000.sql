-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.44-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema teste
--

CREATE DATABASE IF NOT EXISTS teste;
USE teste;

--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Sobrenome` varchar(45) NOT NULL,
  `Idade` varchar(45) NOT NULL,
  `Telefone` varchar(12) NOT NULL,
  `Celular` varchar(12) NOT NULL,
  `Cidade` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;