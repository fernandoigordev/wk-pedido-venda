-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: wktechnology
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Uf` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Fernando Igor','Aquiraz','CE'),(2,'Nati Ferreira','Aquiraz','CE'),(3,'Fernando Antonio','Aquiraz','CE'),(4,'Carliete Ferreira','Eusebio','CE'),(5,'Karine Castro','Fortaleza','CE'),(6,'Eliete Pereira','São Paulo','SP'),(7,'Francisco de Castro','Rio de Janeiro','RJ'),(8,'Ismael Chagas','Salvador','BA'),(9,'Raimunda Lopes','Rio Branco','AC'),(10,'Cristina Branco','Maceió','AL'),(11,'Chico Fiscal','Maracanú','CE'),(12,'Teresa Leitão','Fortaleza','CE'),(13,'Vojvoda','Fortaleza','CE'),(14,'Marcelo Paz','Fortaleza','CE'),(15,'Neymar Jr','Santos','SP'),(16,'Tarcísio Romeu','São Paulo','SP'),(17,'Lara Rihana','Aquiraz','CE'),(18,'Reinaldo Tavarers','Maranguape','CE'),(19,'Arnoldo Camara','Brasília','DF'),(20,'Thayane Lera','São Luis','MA');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempedidovenda`
--

DROP TABLE IF EXISTS `itempedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itempedidovenda` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `NumeroPedido` int NOT NULL,
  `CodigoProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  `ValorUnitario` decimal(15,2) NOT NULL,
  `ValorTotal` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `pedido_venda_item_produto_FK` (`CodigoProduto`),
  KEY `pedido_venda_item_pedido_venda_FK` (`NumeroPedido`),
  CONSTRAINT `pedido_venda_item_pedido_venda_FK` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidovenda` (`Numero`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pedido_venda_item_produto_FK` FOREIGN KEY (`CodigoProduto`) REFERENCES `produto` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempedidovenda`
--

LOCK TABLES `itempedidovenda` WRITE;
/*!40000 ALTER TABLE `itempedidovenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itempedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidovenda`
--

DROP TABLE IF EXISTS `pedidovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidovenda` (
  `Numero` int NOT NULL,
  `DataEmissao` date NOT NULL,
  `CodigoCliente` int NOT NULL,
  `ValorTotal` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `pedido_venda_cliente_FK` (`CodigoCliente`),
  CONSTRAINT `pedido_venda_cliente_FK` FOREIGN KEY (`CodigoCliente`) REFERENCES `cliente` (`Codigo`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidovenda`
--

LOCK TABLES `pedidovenda` WRITE;
/*!40000 ALTER TABLE `pedidovenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  `PrecoVenda` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (3,'Chave de fenda Estrela',30.50),(4,'Serrote',50.25),(5,'Carro de mão',130.00),(6,'Culher de Pedreiro',50.00),(7,'Manta liquida',50.00),(8,'Textura cinza médio',100.00),(9,'Tinta latex cinza',50.00),(10,'Cimento Poty',45.00),(11,'Cimento Nassau 25 kg',40.00),(12,'Trena Amarela pequena',69.90),(13,'Refletor para jardin',200.00),(14,'1m de Areia grosa',150.00),(15,'Escada pequena para cozinha',300.00),(16,'Lâmpada florescente',20.00),(17,'Porta de vidro padrão',200.00),(18,'Box para Banheiro padrão',500.00),(19,'Vaso sanitário preto',1999.90),(20,'Móvel para pia de banheiro',699.90),(21,'Chuveiro elétrico',899.90),(22,'Pia padrão para banheiro',89.90);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wktechnology'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-01 15:55:38
