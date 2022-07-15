CREATE DATABASE  IF NOT EXISTS `db_controllerfluxo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_controllerfluxo`;
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
  `descricao_elementos` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idelementos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_elementos`
--

LOCK TABLES `tb_elementos` WRITE;
/*!40000 ALTER TABLE `tb_elementos` DISABLE KEYS */;
INSERT INTO `tb_elementos` VALUES (1,'Nenhum'),(3,'Para deletar'),(4,'UPDADOOO'),(5,'UPDADO API'),(7,'Pela API'),(9,'UPDADO API');
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
  `data_item_fluxo` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_elementos_item_fluxo` int NOT NULL DEFAULT '1',
  `subelementos` int NOT NULL DEFAULT '1',
  `tipos` int NOT NULL DEFAULT '1',
  `subtipos` int NOT NULL DEFAULT '1',
  `minitipos` int NOT NULL DEFAULT '1',
  `nanotipos` int NOT NULL DEFAULT '1',
  `descricao_item_fluxo` varchar(100) NOT NULL,
  `valor_item_fluxo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `saldo_atual` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_item_fluxo`),
  KEY `cod_elementos_item_fluxo` (`cod_elementos_item_fluxo`),
  KEY `subelementos` (`subelementos`),
  KEY `tipos` (`tipos`),
  KEY `subtipos` (`subtipos`),
  KEY `minitipos` (`minitipos`),
  KEY `nanotipos` (`nanotipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_1` FOREIGN KEY (`cod_elementos_item_fluxo`) REFERENCES `tb_elementos` (`idelementos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_2` FOREIGN KEY (`subelementos`) REFERENCES `tb_subelementos` (`idsubelementos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_3` FOREIGN KEY (`tipos`) REFERENCES `tb_tipos` (`id_tipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_4` FOREIGN KEY (`subtipos`) REFERENCES `tb_subtipos` (`id_subtipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_5` FOREIGN KEY (`minitipos`) REFERENCES `tb_minitipos` (`id_minitipos`),
  CONSTRAINT `tb_fluxocaixa_ibfk_6` FOREIGN KEY (`nanotipos`) REFERENCES `tb_nanotipos` (`id_nanotipos`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fluxocaixa`
--

LOCK TABLES `tb_fluxocaixa` WRITE;
/*!40000 ALTER TABLE `tb_fluxocaixa` DISABLE KEYS */;
INSERT INTO `tb_fluxocaixa` VALUES (1,'2022-07-12 14:30:09',1,1,1,1,1,0,'Saldo Anterior',0.00,0.00),(13,'2022-07-13 17:24:55',1,1,1,1,1,0,'Teste',100.00,100.00),(14,'2022-07-13 17:43:21',1,1,1,1,1,1,'Teste',100.00,200.00);
/*!40000 ALTER TABLE `tb_fluxocaixa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tb_fluxocaixa_BEFORE_INSERT` BEFORE INSERT ON `tb_fluxocaixa` FOR EACH ROW BEGIN
	DECLARE UlitmoSaldo INT default ( SELECT saldo_atual FROM tb_fluxocaixa ORDER BY id_item_fluxo DESC LIMIT 1 );
    SET NEW.saldo_atual = UlitmoSaldo + NEW.valor_item_fluxo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_minitipos`
--

DROP TABLE IF EXISTS `tb_minitipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_minitipos` (
  `id_minitipos` int NOT NULL AUTO_INCREMENT,
  `descricao_minitipos` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_minitipos`),
  CONSTRAINT `tb_minitipos_chk_1` CHECK ((`descricao_minitipos` = _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_minitipos`
--

LOCK TABLES `tb_minitipos` WRITE;
/*!40000 ALTER TABLE `tb_minitipos` DISABLE KEYS */;
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
  `descricao_nanotipos` varchar(45) NOT NULL,
  PRIMARY KEY (`id_nanotipos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nanotipos`
--

LOCK TABLES `tb_nanotipos` WRITE;
/*!40000 ALTER TABLE `tb_nanotipos` DISABLE KEYS */;
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
  `descricao_subelementos` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idsubelementos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subelementos`
--

LOCK TABLES `tb_subelementos` WRITE;
/*!40000 ALTER TABLE `tb_subelementos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_subelementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subtipos`
--

DROP TABLE IF EXISTS `tb_subtipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_subtipos` (
  `id_subtipos` int NOT NULL AUTO_INCREMENT,
  `descricao_subtipos` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_subtipos`),
  CONSTRAINT `tb_subtipos_chk_1` CHECK ((`descricao_subtipos` = _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subtipos`
--

LOCK TABLES `tb_subtipos` WRITE;
/*!40000 ALTER TABLE `tb_subtipos` DISABLE KEYS */;
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
  `descricao_tipos` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tipos`),
  CONSTRAINT `tb_tipos_chk_1` CHECK ((`descricao_tipos` = _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipos`
--

LOCK TABLES `tb_tipos` WRITE;
/*!40000 ALTER TABLE `tb_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_controllerfluxo'
--

--
-- Dumping routines for database 'db_controllerfluxo'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_seExisteItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_seExisteItem`( id int ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE querySelecionada int;
    SET querySelecionada = ( select count(*) from tb_fluxocaixa where id_item_fluxo = id );
	IF ( querySelecionada > 0) THEN
		return (select 1);
    ELSE 
		return (select 0);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_atualizar_saldoatual_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_atualizar_saldoatual_fluxocaixa`()
BEGIN
	DECLARE saldoAtualizado decimal default (select sum(valor_item_fluxo) from tb_fluxocaixa);
    DECLARE ultimoId int default (select id_item_fluxo from tb_fluxocaixa order by id_item_fluxo desc limit 1);
	
	UPDATE tb_fluxocaixa SET saldo_atual = saldoAtualizado WHERE id_item_fluxo = ultimoId;
	SELECT sum(valor_item_fluxo) FROM tb_fluxocaixa ;
    
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_deletar_descricao`( in tabela_selecionada varchar(50), coluna_remocao varchar(50), id_removido int )
BEGIN
	DECLARE msgOk json default '{"situation":"true", "msg":"Registro deletado com sucesso"}';
    DECLARE resposta json;
    
	SET @deletar = CONCAT('DELETE FROM ',tabela_selecionada,' WHERE ',coluna_remocao,' = ', id_removido ,';' );
	PREPARE stmt2 FROM @deletar;
	EXECUTE stmt2;
    
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
	DECLARE msgErro json default '{ "situation":false, "msg":"Erro ao excluir o registro" }';
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro Deletado com sucesso" }';
    
	IF ( idEncontrado <= 1 ) THEN
		set resposta = msgErro;
       select resposta;
	ELSE
		set resposta = msgOk;
       select resposta;
		DELETE FROM tb_fluxocaixa WHERE id_item_fluxo = idEncontrado;
        call pr_atualizar_saldoatual_fluxocaixa();
	END IF;
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
	DECLARE msgOk json default '{"situation":"true", "msg":"Editado com sucesso"}';
    DECLARE resposta json;
	SET @editar = CONCAT('UPDATE ',tabela_selecionada,' SET ',coluna_editar,' = "',dados_editado,'" WHERE ',coluna_id,' = ', id_editado ,';' );
	PREPARE stmt5 FROM @editar;
	EXECUTE stmt5;
    
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
in id int
,in tipo_elemento int
 , in descricao varchar(100)
 , in valor decimal(10,2))
BEGIN
	DECLARE resposta json;
	DECLARE msgErro json default '{ "situation":false, "msg":"Algum dos campos acima estão vazios" }';
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro inserido com sucesso" }';
    
	IF ( id = '' or id <= 0 and descricao = '' and valor = '' ) THEN
		set resposta = msgErro;
       select resposta ;
	ELSE
		UPDATE tb_fluxocaixa SET cod_elementos_item_fluxo = tipo_elemento,
		descricao_item_fluxo = descricao,
		valor_item_fluxo = valor
		WHERE id_item_fluxo = id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_fluxocaixa_inserir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_fluxocaixa_inserir`( 
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
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro inserido com sucesso" }';
    
	IF ( cod_elemento = '' or cod_elemento <= 0 and descricao = '' and valor = '' ) THEN
		set resposta = msgErro;
       select resposta;
	ELSE
		set resposta = msgOk;
	insert into tb_fluxocaixa values ( default, default, cod_elemento, subelementos, tipos,subtipos, minitipos,nanotipos ,descricao, valor, saldoAnterior );
        
	/*	insert into tb_fluxocaixa ( id_item_fluxo , data_item_fluxo ,cod_elementos_item_fluxo,
        descricao_item_fluxo,
        valor_item_fluxo,
        saldo_atual ) values ( default, default, cod_elemento, descricao, valor, saldoAnterior );
        */
       select resposta;

	END IF;
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_inserir_descricao`( in tabela_selecionada varchar(100), in descricao_inserida varchar(100) )
BEGIN
	DECLARE msgOk json default '{"situation":"true", "msg":"Registro inserido com sucesso"}';
    DECLARE resposta json;
    
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
in valor decimal(10,2),
in saldoAnterior decimal(10,2)
)
BEGIN
	DECLARE resposta json;
	DECLARE msgErro json default '{ "situation":false, "msg":"Algum dos campos acima estão vazios" }';
	DECLARE msgOk json default '{ "situation":true, "msg":"Registro inserido com sucesso" }';
    
	IF ( cod_elemento = '' or cod_elemento <= 0 and descricao = '' and valor = '' ) THEN
		set resposta = msgErro;
       select resposta;
	ELSE
		set resposta = msgOk;
	insert into tb_fluxocaixa values ( default, default, cod_elemento, subelementos, tipos,subtipos, minitipos,nanotipos,descricao, valor, saldoAnterior );
        
	/*	insert into tb_fluxocaixa ( id_item_fluxo , data_item_fluxo ,cod_elementos_item_fluxo,
        descricao_item_fluxo,
        valor_item_fluxo,
        saldo_atual ) values ( default, default, cod_elemento, descricao, valor, saldoAnterior );
        */
       select resposta;

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_ver_todos_fluxocaixa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_ver_todos_fluxocaixa`()
BEGIN
	select * from tb_fluxocaixa;
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-14 11:25:47
