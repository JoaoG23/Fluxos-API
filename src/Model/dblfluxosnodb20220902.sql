-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_controllerfluxo
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_elementos`
--

DROP TABLE IF EXISTS `tb_elementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_elementos` (
  `idelementos` int NOT NULL AUTO_INCREMENT,
  `descricao_elementos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idelementos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_elementos`
--

LOCK TABLES `tb_elementos` WRITE;
/*!40000 ALTER TABLE `tb_elementos` DISABLE KEYS */;
INSERT INTO `tb_elementos` VALUES (1,''),(2,'ativo'),(3,'passivo');
/*!40000 ALTER TABLE `tb_elementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fluxocaixa`
--

DROP TABLE IF EXISTS `tb_fluxocaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_fluxocaixa` (
  `id_item_fluxo` int NOT NULL AUTO_INCREMENT,
  `dia_item_fluxo` int NOT NULL DEFAULT (dayofmonth(now())),
  `mes_item_fluxo` int NOT NULL DEFAULT (month(now())),
  `ano_item_fluxo` int NOT NULL DEFAULT (year(now())),
  `hora_item_fluxo` time NOT NULL DEFAULT (now()),
  `cod_elementos_item_fluxo` int NOT NULL DEFAULT '1',
  `subelementos` int NOT NULL DEFAULT '1',
  `tipos` int NOT NULL DEFAULT '1',
  `subtipos` int NOT NULL DEFAULT '1',
  `minitipos` int NOT NULL DEFAULT '1',
  `nanotipos` int NOT NULL DEFAULT '1',
  `descricao_item_fluxo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `valor_item_fluxo` decimal(13,2) NOT NULL DEFAULT '0.00',
  `saldo_atual` decimal(13,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_item_fluxo`),
  KEY `cod_elementos_item_fluxo` (`cod_elementos_item_fluxo`),
  KEY `subelementos` (`subelementos`),
  KEY `tipos` (`tipos`),
  KEY `minitipos` (`minitipos`),
  KEY `nanotipos` (`nanotipos`),
  KEY `subtipos` (`subtipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_1` FOREIGN KEY (`cod_elementos_item_fluxo`) REFERENCES `tb_elementos` (`idelementos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_2` FOREIGN KEY (`subelementos`) REFERENCES `tb_subelementos` (`idsubelementos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_3` FOREIGN KEY (`tipos`) REFERENCES `tb_tipos` (`id_tipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_5` FOREIGN KEY (`minitipos`) REFERENCES `tb_minitipos` (`id_minitipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_6` FOREIGN KEY (`nanotipos`) REFERENCES `tb_nanotipos` (`id_nanotipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_7` FOREIGN KEY (`subtipos`) REFERENCES `tb_subtipos` (`idsubtipos`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fluxocaixa`
--

LOCK TABLES `tb_fluxocaixa` WRITE;
/*!40000 ALTER TABLE `tb_fluxocaixa` DISABLE KEYS */;
INSERT INTO `tb_fluxocaixa` VALUES (129,30,8,2022,'11:47:20',1,1,1,0,0,0,'fasfadsfa',20.00,20.00),(131,30,8,2022,'11:49:51',3,3,0,0,0,4,'novo gasto',10.00,30.00),(132,30,8,2022,'11:50:45',3,3,0,0,0,4,'Teste',-10.00,20.00),(133,30,8,2022,'12:14:10',3,3,0,0,0,0,'dsadsa',10.00,30.00),(150,1,11,2022,'00:00:09',1,1,1,1,1,1,'dados',10.00,0.00),(151,1,11,2022,'07:46:58',1,1,1,1,1,1,'dados',10.00,0.00),(152,1,11,2022,'07:47:48',1,1,1,1,1,1,'dados',10.00,0.00);
/*!40000 ALTER TABLE `tb_fluxocaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fluxocaixa_web`
--

DROP TABLE IF EXISTS `tb_fluxocaixa_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_fluxocaixa_web` (
  `id_item_fluxo` int NOT NULL AUTO_INCREMENT,
  `dia_item_fluxo` int NOT NULL DEFAULT (dayofmonth(now())),
  `mes_item_fluxo` int NOT NULL DEFAULT (month(now())),
  `ano_item_fluxo` int NOT NULL DEFAULT (year(now())),
  `hora_item_fluxo` time NOT NULL DEFAULT (now()),
  `cod_elementos_item_fluxo` int NOT NULL DEFAULT '1',
  `subelementos` int NOT NULL DEFAULT '1',
  `tipos` int NOT NULL DEFAULT '1',
  `subtipos` int NOT NULL DEFAULT '1',
  `minitipos` int NOT NULL DEFAULT '1',
  `nanotipos` int NOT NULL DEFAULT '1',
  `descricao_item_fluxo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `valor_item_fluxo` decimal(13,2) NOT NULL DEFAULT '0.00',
  `saldo_atual` decimal(13,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_item_fluxo`),
  KEY `cod_elementos_item_fluxo` (`cod_elementos_item_fluxo`),
  KEY `subelementos` (`subelementos`),
  KEY `tipos` (`tipos`),
  KEY `minitipos` (`minitipos`),
  KEY `nanotipos` (`nanotipos`),
  KEY `subtipos` (`subtipos`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fluxocaixa_web`
--

LOCK TABLES `tb_fluxocaixa_web` WRITE;
/*!40000 ALTER TABLE `tb_fluxocaixa_web` DISABLE KEYS */;
INSERT INTO `tb_fluxocaixa_web` VALUES (129,30,8,2022,'11:47:20',1,1,1,0,0,0,'fasfadsfa',20.00,20.00),(131,30,8,2022,'11:49:51',3,3,0,0,0,4,'novo gasto',10.00,30.00),(132,30,8,2022,'11:50:45',3,3,0,0,0,4,'Teste',-10.00,20.00),(133,30,8,2022,'12:14:10',3,3,0,0,0,0,'dsadsa',10.00,30.00);
/*!40000 ALTER TABLE `tb_fluxocaixa_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_login` (
  `id_login` int NOT NULL AUTO_INCREMENT,
  `nome_login` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nomeusuario_login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `senha_login` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_login` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel_login` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isadmin_login` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `email_login` (`email_login`),
  UNIQUE KEY `nomeusuario_login` (`nomeusuario_login`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login`
--

LOCK TABLES `tb_login` WRITE;
/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
INSERT INTO `tb_login` VALUES (10,'joaodev','joaodev','$2a$10$Ah5uHA4Zdu2MnihYi92qfOLq2.oRlwMU9m/NL19ICXrrRctcNrzWK','joaodev@ooo.com','318888-8888',1),(66,'Eduarda Goncalves','eduarda','$2a$10$uohMu4VurRdoJiFwNlqrzeZUPbq5Vy1dHwWAmDkO3UzJrAv.JUb1K','eduarda@eduarda.com','41 9999-00909',0),(67,'wanderson','wanderson','$2a$10$9BdBQVL4whwarRjS9CJG5utkuDSxRdPaQYy2dRw2973eDRLpZjRTy','wanderson','99999@99999',0),(68,'joazinho','joazinho','$2a$10$SueWmtiBgTiDUn5H2tVDi.O6T5J7Ey2IgCEk/v4KaXtoy9gwx69Iu','joazinho','joazinho',0);
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_minitipos`
--

DROP TABLE IF EXISTS `tb_minitipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_minitipos` (
  `id_minitipos` int NOT NULL AUTO_INCREMENT,
  `descricao_minitipos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_minitipos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_minitipos`
--

LOCK TABLES `tb_minitipos` WRITE;
/*!40000 ALTER TABLE `tb_minitipos` DISABLE KEYS */;
INSERT INTO `tb_minitipos` VALUES (1,''),(2,'Acões'),(3,'CDB'),(4,'Fundos imobiliarios'),(5,'Tesouro Direto');
/*!40000 ALTER TABLE `tb_minitipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nanotipos`
--

DROP TABLE IF EXISTS `tb_nanotipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_nanotipos` (
  `id_nanotipos` int NOT NULL AUTO_INCREMENT,
  `descricao_nanotipos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_nanotipos`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nanotipos`
--

LOCK TABLES `tb_nanotipos` WRITE;
/*!40000 ALTER TABLE `tb_nanotipos` DISABLE KEYS */;
INSERT INTO `tb_nanotipos` VALUES (1,''),(2,'Bradesco'),(3,'Carteira'),(4,'Nubank'),(5,'Picpay'),(6,'Next'),(7,'Easynvest'),(8,'Clean');
/*!40000 ALTER TABLE `tb_nanotipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subelementos`
--

DROP TABLE IF EXISTS `tb_subelementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_subelementos` (
  `idsubelementos` int NOT NULL AUTO_INCREMENT,
  `descricao_subelementos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idsubelementos`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subelementos`
--

LOCK TABLES `tb_subelementos` WRITE;
/*!40000 ALTER TABLE `tb_subelementos` DISABLE KEYS */;
INSERT INTO `tb_subelementos` VALUES (1,''),(3,'Bens de Consumo'),(4,'Bens de Uso'),(5,'Dizimo'),(6,'Academia'),(7,'Beleza'),(8,'Casa'),(9,'Aposentadoria'),(10,'Planos de Medio Prazo'),(11,'Planos de pequeno prazo');
/*!40000 ALTER TABLE `tb_subelementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subtipos`
--

DROP TABLE IF EXISTS `tb_subtipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_subtipos` (
  `idsubtipos` int NOT NULL AUTO_INCREMENT,
  `descricao_subtipos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idsubtipos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subtipos`
--

LOCK TABLES `tb_subtipos` WRITE;
/*!40000 ALTER TABLE `tb_subtipos` DISABLE KEYS */;
INSERT INTO `tb_subtipos` VALUES (1,''),(2,'Renda fixa'),(3,'Renda Variável');
/*!40000 ALTER TABLE `tb_subtipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipos`
--

DROP TABLE IF EXISTS `tb_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipos` (
  `id_tipos` int NOT NULL AUTO_INCREMENT,
  `descricao_tipos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tipos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipos`
--

LOCK TABLES `tb_tipos` WRITE;
/*!40000 ALTER TABLE `tb_tipos` DISABLE KEYS */;
INSERT INTO `tb_tipos` VALUES (1,''),(2,'Investimentos');
/*!40000 ALTER TABLE `tb_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_todos_dados_fluxocaixa_estatistica`
--

DROP TABLE IF EXISTS `vw_todos_dados_fluxocaixa_estatistica`;
/*!50001 DROP VIEW IF EXISTS `vw_todos_dados_fluxocaixa_estatistica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_todos_dados_fluxocaixa_estatistica` AS SELECT 
 1 AS `id_item_fluxo`,
 1 AS `dia_item_fluxo`,
 1 AS `mes_item_fluxo`,
 1 AS `ano_item_fluxo`,
 1 AS `hora_item_fluxo`,
 1 AS `cod_elementos_item_fluxo`,
 1 AS `descricao_elementos`,
 1 AS `subelementos`,
 1 AS `descricao_subelementos`,
 1 AS `tipos`,
 1 AS `descricao_tipos`,
 1 AS `subtipos`,
 1 AS `descricao_subtipos`,
 1 AS `minitipos`,
 1 AS `descricao_minitipos`,
 1 AS `nanotipos`,
 1 AS `descricao_nanotipos`,
 1 AS `descricao_item_fluxo`,
 1 AS `valor_item_fluxo`,
 1 AS `saldo_atual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_todos_dados_fluxocaixa_unificados`
--

DROP TABLE IF EXISTS `vw_todos_dados_fluxocaixa_unificados`;
/*!50001 DROP VIEW IF EXISTS `vw_todos_dados_fluxocaixa_unificados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_todos_dados_fluxocaixa_unificados` AS SELECT 
 1 AS `id_item_fluxo`,
 1 AS `dia_item_fluxo`,
 1 AS `mes_item_fluxo`,
 1 AS `ano_item_fluxo`,
 1 AS `hora_item_fluxo`,
 1 AS `descricao_elementos`,
 1 AS `descricao_subelementos`,
 1 AS `descricao_tipos`,
 1 AS `descricao_subtipos`,
 1 AS `descricao_minitipos`,
 1 AS `descricao_nanotipos`,
 1 AS `descricao_item_fluxo`,
 1 AS `valor_item_fluxo`,
 1 AS `saldo_atual`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_controllerfluxo'
--

--
-- Dumping routines for database 'db_controllerfluxo'
--
/*!50003 DROP PROCEDURE IF EXISTS `pr_atualiza_saldoatual_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_atualiza_saldoatual_fluxocaixa`()
parar:BEGIN
	DECLARE resposta json default '{"situacao":true , "msg":"Fluxo de caixa atualizado com sucesso"}';
    DECLARE totalDeGastos decimal(13,2) default (select SUM(valor_item_fluxo) from tb_fluxocaixa where valor_item_fluxo < 0);
    DECLARE totalDeGanhos decimal(13,2) default (select SUM(valor_item_fluxo) from tb_fluxocaixa where valor_item_fluxo > 0);
    DECLARE somaSaldoAtualizado decimal(13,2) default null;
    # busca o UltimoID 
    DECLARE ultimoId int default (SELECT id_item_fluxo FROM tb_fluxocaixa order by id_item_fluxo desc limit 1);
    # Soma o gasto
    SET somaSaldoAtualizado = totalDeGanhos + totalDeGastos;
    
    IF (ISNULL(somaSaldoAtualizado) > 0) THEN
		SET somaSaldoAtualizado = totalDeGanhos;
        UPDATE tb_fluxocaixa SET saldo_atual = somaSaldoAtualizado  WHERE id_item_fluxo = ultimoId;
        Select somaSaldoAtualizado ;
    ELSE     
		UPDATE tb_fluxocaixa SET saldo_atual = somaSaldoAtualizado  WHERE id_item_fluxo = ultimoId;
        Select somaSaldoAtualizado ;
	END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_busca_penutimoid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_busca_penutimoid`( )
BEGIN
    declare penultimoId int default (select id_item_fluxo from tb_fluxocaixa  order by id_item_fluxo desc limit 1 OFFSET 1);
    
    update tb_fluxocaixa set saldo_atual = saldo_atual + (SELECT sum(valor_item_fluxo) FROM tb_fluxocaixa) where id_item_fluxo = penultimoId;
    select penultimoId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_calcula_gastoganho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_calcula_gastoganho`( 
in mes_entrada int,
in ano_entrada int,
in coluna_selecionada_entrada varchar(50),
in maior_ou_menor_entrada varchar(2),
in dado_selecionado_entrada int,
in gasto_ou_ganho_entrada char(1))
BEGIN
	SET @buscaPorCriterio = CONCAT('SELECT ABS(SUM(valor_item_fluxo)) as resposta FROM vw_todos_dados_fluxocaixa_estatistica WHERE mes_item_fluxo = ',mes_entrada,
    ' AND ano_item_fluxo = ',ano_entrada,
    ' AND ',coluna_selecionada_entrada,
    ' ',maior_ou_menor_entrada,
    ' ',dado_selecionado_entrada,
    ' AND valor_item_fluxo ',gasto_ou_ganho_entrada,' 0;');
	prepare st7 from @buscaPorCriterio;
   execute st7;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_calcula_gastoganho_com_criterio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_calcula_gastoganho_com_criterio`( 
in mes_entrada int,
in ano_entrada int,
in coluna_selecionada_entrada varchar(50),
in maior_ou_menor_entrada varchar(2),
in dado_selecionado_entrada int,
in gasto_ou_ganho_entrada char(1))
BEGIN
	SET @buscaPorCriterio = CONCAT('SELECT descricao_subelementos as nomeCategoria, ABS(SUM(valor_item_fluxo)) as resposta FROM vw_todos_dados_fluxocaixa_estatistica WHERE mes_item_fluxo = ',mes_entrada,
    ' AND ano_item_fluxo = ',ano_entrada,
    ' AND ',coluna_selecionada_entrada,
    ' ',maior_ou_menor_entrada,
    ' ',dado_selecionado_entrada,
    ' AND valor_item_fluxo ',gasto_ou_ganho_entrada,' 0;');
	prepare st7 from @buscaPorCriterio;
   execute st7;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_conta_quantocampos_tabela` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_conta_quantocampos_tabela`( in tabela_selecionada varchar(50), colunaId varchar(50) )
BEGIN
	SET @query = CONCAT('SELECT ',colunaId,' + 1 AS resposta FROM ',tabela_selecionada,' ORDER BY ',colunaId,' DESC LIMIT 1;');
	prepare st1 from @query;
   execute st1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_dar_permissao_admin_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_dar_permissao_admin_usuario`( 
id int
)
BEGIN
	DECLARE resposta json default '{"situacao":true , "msg":"Registro cadastrado com sucesso"}';
    
	if ((select count(*) from tb_login WHERE id_login = id and isadmin_login = true > 0) > 0  ) then
        UPDATE tb_login SET isadmin_login = false WHERE id_login = id;
		SET resposta = '{"situacao":true, "msg":"Previlegio admininstrado retirado ao usuario" }';
        SELECT resposta;
	else
		UPDATE tb_login SET isadmin_login = true WHERE id_login = id;
		SET resposta = '{"situacao":true, "msg":"Previlegio admininstrado adicionado ao usuario" }';
        SELECT resposta;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_deletar_descricao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_deletar_descricao`( in tabela_selecionada varchar(50), coluna_remocao varchar(50), id_removido int )
BEGIN
	DECLARE msgOk json default '{"situation":"true", "msg":"Registro deletado com sucesso"}';
    DECLARE resposta json;
    
    SET foreign_key_checks = 0;
	SET @deletar = CONCAT('DELETE FROM ',tabela_selecionada,' WHERE ',coluna_remocao,' = ', id_removido ,';' );
	PREPARE stmt2 FROM @deletar;
	EXECUTE stmt2;
    
    SET foreign_key_checks = 1;
	 DEALLOCATE PREPARE stmt2;
     set resposta = msgOk;
	 select resposta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_deletar_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_deletar_fluxocaixa`( in idEncontrado int )
BEGIN
	DECLARE resposta json;
	DECLARE msgErro json default '{ "situation":false, "msg":"Erro ao excluir ou não existe o registro" }';
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro Deletado com sucesso" }';
    
    declare calculoTodosGastos decimal(13,2) default 0.0;
    declare penultimoId int default (select id_item_fluxo from tb_fluxocaixa  order by id_item_fluxo desc limit 1 OFFSET 1);
	set calculoTodosGastos = (SELECT sum(valor_item_fluxo) as resposta FROM tb_fluxocaixa); 
    
    
	IF ( idEncontrado <= 0) THEN
		set resposta = msgErro;
       select resposta;
	ELSE
		SET foreign_key_checks = 0;
		set resposta = msgOk;
       select resposta;
		DELETE FROM tb_fluxocaixa WHERE id_item_fluxo = idEncontrado;
         SET foreign_key_checks = 1;
         
        
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_deletar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_deletar_usuario`( 
id int
)
BEGIN
DECLARE resposta json default '{"situacao":true , "msg":"Registro deletado com sucesso"}';

	if ( id = '' or id = 0 ) then
		select '{"situacao":false, "msg":"o id esta vazio" }';
    end if;
    
	DELETE FROM tb_login WHERE id_login = id;
    SELECT resposta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_editar_descricao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_editar_descricao`( 
in tabela_selecionada varchar(50),
in coluna_editar varchar(50),
in dados_editado varchar(50),
in coluna_id varchar(50),
 in id_editado int )
BEGIN

	DECLARE msgOk json default '{"situation":true, "msg":"Editado com sucesso"}';
    DECLARE resposta json;
    
	SET foreign_key_checks = 0;
	SET @editar = CONCAT('UPDATE ',tabela_selecionada,' SET ',coluna_editar,' = "',dados_editado,'" WHERE ',coluna_id,' = ', id_editado ,';' );
	PREPARE stmt5 FROM @editar;
	EXECUTE stmt5;
    
    SET foreign_key_checks = 1;
	 DEALLOCATE PREPARE stmt5;
     set resposta = msgOk;
	 select resposta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_editar_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_editar_fluxocaixa`(
in id int,
in cod_elemento int,
in subelementos int,
in tipos int,
in subtipos int,
in minitipos int,
in nanotipos int,
in descricao varchar(100),
in valor decimal(10,2),
in saldoAnterior decimal(10,2)
 )
BEGIN
	DECLARE resposta json;
	DECLARE msgErro json default '{ "situation":false, "msg":"Algum dos campos acima estão vazios" }';
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro editado com sucesso" }';
    
	IF ( id = '' or id <= 0 and descricao = '' and valor = '' ) THEN
		set resposta = msgErro;
       select resposta ;
	ELSE
		SET foreign_key_checks = 0;
    
		UPDATE tb_fluxocaixa SET 
        cod_elementos_item_fluxo = cod_elemento,
        subelementos = subelementos,
        tipos = tipos,
        subtipos = subtipos,
        minitipos = minitipos,
        nanotipos = nanotipos,
		descricao_item_fluxo = descricao,
		valor_item_fluxo = valor
		WHERE id_item_fluxo = id;
        
		SET foreign_key_checks = 1;
        SET resposta = msgOk;
        
       SELECT resposta;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_editar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_editar_usuario`(
in id int,
in nome varchar(50),
in login varchar(50),
in senha varchar(300),
in email varchar(50),
in tel varchar(50),
in adm boolean
)
parar:BEGIN
	DECLARE resposta json default '{"situacao":true , "msg":"Usuario Editado com sucesso"}';
    
	if ( nome = '') then
		set resposta =  '{"situacao":false, "msg":"Nome vazio" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( CHAR_LENGTH(login) < 6 ) then
		set resposta = '{"situacao":false, "msg":"Usuario deve ser acima de 6 caracteres" }';
        select resposta;
        LEAVE parar;
    end if;
    
if ( CHAR_LENGTH(senha) < 6 ) then
		set resposta = '{"situacao":false, "msg":"Senha deve ser acima de 6 caracteres" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( email = '') then
		set resposta = '{"situacao":false, "msg":"email esta vazio" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( tel = '') then
		set resposta = '{"situacao":false, "msg":"Telefone nao pode ser vazio" }';
        select resposta;
        LEAVE parar;
    end if;
    
	UPDATE tb_login SET nome_login = nome,
		nomeusuario_login = login,
		senha_login = senha,
		email_login = email,
		tel_login = tel,
		isadmin_login = adm
	WHERE id_login = id;
    SELECT resposta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_gasto_ou_ganho_ultimo12meses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_gasto_ou_ganho_ultimo12meses`(
INOUT emailList varchar(4000)
)
BEGIN

	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE curEmail 
		CURSOR FOR 
			SELECT descricao_item_fluxo FROM tb_fluxocaixa;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curEmail;

	getEmail: LOOP
		FETCH curEmail INTO emailAddress;
		IF finished = 1 THEN 
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,";",emailList);
	END LOOP getEmail;
	CLOSE curEmail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_inserir_descricao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_inserir_descricao`( in tabela_selecionada varchar(100), in descricao_inserida varchar(100) )
BEGIN
	DECLARE msgOk json default '{"situation":true, "msg":"Registro inserido com sucesso"}';
    DECLARE resposta json;
    
	SET foreign_key_checks = 0;
  
	SET @inserir = CONCAT('INSERT INTO ',tabela_selecionada,' VALUES ( DEFAULT, "',descricao_inserida,'");');
	PREPARE stmt3 FROM @inserir;
	EXECUTE stmt3;
    
	 DEALLOCATE PREPARE stmt3;
     set resposta = msgOk;
	 select resposta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_inserir_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_inserir_fluxocaixa`( 
in cod_elemento int,
in subelementos int,
in tipos int,
in subtipos int,
in minitipos int,
in nanotipos int,
in descricao varchar(100),
in valor decimal(13,2),
in saldoAnterior decimal(13,2)
)
BEGIN
	DECLARE resposta json;
	DECLARE msgErro json default '{ "situation":false, "msg":"Algum dos campos acima estão vazios" }';
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro inserido com sucesso" }';
    
    SET foreign_key_checks = 0;
	IF ( cod_elemento = '' or cod_elemento <= 0 and descricao = '' and valor = '' ) THEN
		set resposta = msgErro;
       select resposta;
	ELSE
		set resposta = msgOk;
	insert into tb_fluxocaixa values ( default, default,default, default,default, cod_elemento, subelementos, tipos,subtipos, minitipos,nanotipos,descricao, valor, saldoAnterior );

       select resposta;
	SET foreign_key_checks = 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_registrar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_registrar_usuario`( 
nome varchar(40),
nome_usuario varchar(40),
senha_login text,
email_login varchar(70),
tel_login varchar(20),
isadmin boolean
)
parar:BEGIN

DECLARE resposta json default '{"situacao":true , "msg":"Registro cadastrado com sucesso"}';
	if ( nome = '') then
		set resposta =  '{"situacao":false, "msg":"Nome vazio" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( CHAR_LENGTH(nome_usuario) < 6 ) then
		set resposta = '{"situacao":false, "msg":"Usuario deve ser acima de 6 caracteres" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( CHAR_LENGTH(senha_login) < 6 ) then
		set resposta = '{"situacao":false, "msg":"Senha deve ser acima de 6 caracteres" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( email_login = '') then
		set resposta = '{"situacao":false, "msg":"email esta vazio" }';
        select resposta;
        LEAVE parar;
    end if;
    
	if ( tel_login = '') then
		set resposta = '{"situacao":false, "msg":"Telefone nao pode ser vazio" }';
        select resposta;
        LEAVE parar;
    end if;
    
    INSERT INTO tb_login VALUES ( default, nome , nome_usuario, senha_login, email_login, tel_login, false );
    select resposta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_selecionar_algum_elemento_caracteres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_selecionar_algum_elemento_caracteres`( in tabela_selecionada varchar(100),
 in coluna_selecionada varchar(50),
 in valor_a_encontrar varchar(45))
BEGIN
	SET @query = CONCAT('SELECT * FROM ',tabela_selecionada,' WHERE ',coluna_selecionada,' = "',valor_a_encontrar,'";');
	prepare st1 from @query;
   execute st1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_selecionar_um` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_selecionar_um`( in tabela_selecionada varchar(100), coluna_id varchar(50),id int )
BEGIN
	SET @query = CONCAT('SELECT * FROM ',tabela_selecionada,' WHERE ',coluna_id,' = ',id,';');
	prepare st1 from @query;
   execute st1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_verifica_existe_registro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_verifica_existe_registro`( in tabela_selecionada varchar(100), coluna_id varchar(50),id int )
BEGIN
	SET @query = CONCAT('SELECT count(*) AS resposta FROM ',tabela_selecionada,' WHERE ',coluna_id,' = ',id,';');
	prepare st1 from @query;
   execute st1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_ver_saldo_atual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_ver_saldo_atual`()
BEGIN
	DECLARE resposta decimal(13,2);
	SET resposta = (SELECT saldo_atual FROM tb_fluxocaixa order by id_item_fluxo desc limit 1);
    SELECT resposta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_ver_todos_todas_tabela_unidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_ver_todos_todas_tabela_unidas`( )
BEGIN
	SELECT * FROM vw_todos_dados_fluxocaixa_unificados order by id_item_fluxo desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_ver_tudo_tabela` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_ver_tudo_tabela`( in tabela_selecionada varchar(100) )
BEGIN
	SET @query = CONCAT('SELECT * FROM ',tabela_selecionada,';');
	prepare st from @query;
   execute st;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_web_inserir_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_web_inserir_fluxocaixa`( 
in dia int,
in mes int,
in ano int,
in cod_elemento int,
in subelementos int,
in tipos int,
in subtipos int,
in minitipos int,
in nanotipos int,
in descricao varchar(100),
in valor decimal(13,2),
in saldoAnterior decimal(13,2)
)
BEGIN
	DECLARE resposta text;
	DECLARE msgErro text default '{ "situation":false, "msg":"Algum dos campos acima estão vazios" }';
	DECLARE msgOk text default '{ "situation":true, "msg":"Registro inserido com sucesso" }';
    
    SET foreign_key_checks = 0;
	IF ( cod_elemento = '' or cod_elemento <= 0 and descricao = '' and valor = '' ) THEN
		set resposta = msgErro;
       select resposta;
	ELSE
		set resposta = msgOk;
	insert into tb_fluxocaixa values ( default, dia,mes,ano,now(), cod_elemento, subelementos, tipos,subtipos, minitipos,nanotipos,descricao, valor, saldoAnterior );

       select resposta;
	SET foreign_key_checks = 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_todos_dados_fluxocaixa_estatistica`
--

/*!50001 DROP VIEW IF EXISTS `vw_todos_dados_fluxocaixa_estatistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_todos_dados_fluxocaixa_estatistica` AS select `fl`.`id_item_fluxo` AS `id_item_fluxo`,`fl`.`dia_item_fluxo` AS `dia_item_fluxo`,`fl`.`mes_item_fluxo` AS `mes_item_fluxo`,`fl`.`ano_item_fluxo` AS `ano_item_fluxo`,`fl`.`hora_item_fluxo` AS `hora_item_fluxo`,`fl`.`cod_elementos_item_fluxo` AS `cod_elementos_item_fluxo`,`el`.`descricao_elementos` AS `descricao_elementos`,`fl`.`subelementos` AS `subelementos`,`subel`.`descricao_subelementos` AS `descricao_subelementos`,`fl`.`tipos` AS `tipos`,`tip`.`descricao_tipos` AS `descricao_tipos`,`fl`.`subtipos` AS `subtipos`,`subtip`.`descricao_subtipos` AS `descricao_subtipos`,`fl`.`minitipos` AS `minitipos`,`min`.`descricao_minitipos` AS `descricao_minitipos`,`fl`.`nanotipos` AS `nanotipos`,`nano`.`descricao_nanotipos` AS `descricao_nanotipos`,`fl`.`descricao_item_fluxo` AS `descricao_item_fluxo`,`fl`.`valor_item_fluxo` AS `valor_item_fluxo`,`fl`.`saldo_atual` AS `saldo_atual` from ((((((`tb_fluxocaixa` `fl` left join `tb_elementos` `el` on((`fl`.`cod_elementos_item_fluxo` = `el`.`idelementos`))) left join `tb_subelementos` `subel` on((`fl`.`subelementos` = `subel`.`idsubelementos`))) left join `tb_tipos` `tip` on((`fl`.`tipos` = `tip`.`id_tipos`))) left join `tb_subtipos` `subtip` on((`fl`.`subtipos` = `subtip`.`idsubtipos`))) left join `tb_minitipos` `min` on((`fl`.`minitipos` = `min`.`id_minitipos`))) left join `tb_nanotipos` `nano` on((`fl`.`nanotipos` = `nano`.`id_nanotipos`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_todos_dados_fluxocaixa_unificados`
--

/*!50001 DROP VIEW IF EXISTS `vw_todos_dados_fluxocaixa_unificados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_todos_dados_fluxocaixa_unificados` AS select `fl`.`id_item_fluxo` AS `id_item_fluxo`,`fl`.`dia_item_fluxo` AS `dia_item_fluxo`,`fl`.`mes_item_fluxo` AS `mes_item_fluxo`,`fl`.`ano_item_fluxo` AS `ano_item_fluxo`,`fl`.`hora_item_fluxo` AS `hora_item_fluxo`,`el`.`descricao_elementos` AS `descricao_elementos`,`subel`.`descricao_subelementos` AS `descricao_subelementos`,`tip`.`descricao_tipos` AS `descricao_tipos`,`subtip`.`descricao_subtipos` AS `descricao_subtipos`,`min`.`descricao_minitipos` AS `descricao_minitipos`,`nano`.`descricao_nanotipos` AS `descricao_nanotipos`,`fl`.`descricao_item_fluxo` AS `descricao_item_fluxo`,`fl`.`valor_item_fluxo` AS `valor_item_fluxo`,`fl`.`saldo_atual` AS `saldo_atual` from ((((((`tb_fluxocaixa` `fl` left join `tb_elementos` `el` on((`fl`.`cod_elementos_item_fluxo` = `el`.`idelementos`))) left join `tb_subelementos` `subel` on((`fl`.`subelementos` = `subel`.`idsubelementos`))) left join `tb_tipos` `tip` on((`fl`.`tipos` = `tip`.`id_tipos`))) left join `tb_subtipos` `subtip` on((`fl`.`subtipos` = `subtip`.`idsubtipos`))) left join `tb_minitipos` `min` on((`fl`.`minitipos` = `min`.`id_minitipos`))) left join `tb_nanotipos` `nano` on((`fl`.`nanotipos` = `nano`.`id_nanotipos`))) */;
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

-- Dump completed on 2022-09-02  8:48:15
