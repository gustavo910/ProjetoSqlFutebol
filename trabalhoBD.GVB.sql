-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.20-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para 2sis_futebol_gustavo_brendo
DROP DATABASE IF EXISTS `2sis_futebol_gustavo_brendo`;
CREATE DATABASE IF NOT EXISTS `2sis_futebol_gustavo_brendo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `2sis_futebol_gustavo_brendo`;

-- Copiando estrutura para procedure 2sis_futebol_gustavo_brendo.BuscaCampeonato
DROP PROCEDURE IF EXISTS `BuscaCampeonato`;
DELIMITER //
CREATE DEFINER=`910gustavo`@`localhost` PROCEDURE `BuscaCampeonato`(
	IN `busca` VARCHAR(50)

)
Begin
select @contador:=count(*) from  times where nome=busca;
if(@contador=1)
then select liga.nome,times.nome from liga,times where LIGA_idLIGA=idLIGA and times.nome=busca; 
else
select "Clube não cadastrado no sistema";
end if;
END//
DELIMITER ;

-- Copiando estrutura para procedure 2sis_futebol_gustavo_brendo.BuscaJogadoresPeloTime
DROP PROCEDURE IF EXISTS `BuscaJogadoresPeloTime`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscaJogadoresPeloTime`(
	IN `Busca` VARCHAR(50)

)
Begin
select @contador:=count(*) from  jogador_treinador where nome=Busca;
if(@contador=1)
then select liga.nome,times.nome,jogador_treinador.nome from liga,times,jogador_treinador where LIGA_idLIGA=idLIGA and jogador_treinador.nome=Busca and jogador_treinador.TIME_idClub=times.idClube; 
else
select "Jogador não cadastrado";
end if;
END//
DELIMITER ;

-- Copiando estrutura para procedure 2sis_futebol_gustavo_brendo.BuscaTime
DROP PROCEDURE IF EXISTS `BuscaTime`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscaTime`(
	IN `busca` VARCHAR(50)



)
Begin
select @contador:=count(*) from  times where nome=busca;
if(@contador=1)
then select * from times where nome=busca;
else 
select "Clube não cadastrado no sistema";
end if;
END//
DELIMITER ;

-- Copiando estrutura para tabela 2sis_futebol_gustavo_brendo.jogador_treinador
DROP TABLE IF EXISTS `jogador_treinador`;
CREATE TABLE IF NOT EXISTS `jogador_treinador` (
  `idJOGADOR/TREINADOR` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `funcao/posicao` varchar(45) NOT NULL,
  `gols` int(11) DEFAULT NULL,
  `assistencias` int(11) DEFAULT NULL,
  `CartaoAmarelo` int(11) DEFAULT NULL,
  `CartaoVermelho` int(11) DEFAULT NULL,
  `Suspensao` int(11) NOT NULL,
  `TIME_idClub` int(11) NOT NULL,
  PRIMARY KEY (`idJOGADOR/TREINADOR`,`TIME_idClub`),
  KEY `fk_JOGADOR/TREINADOR_TIME1_idx` (`TIME_idClub`),
  CONSTRAINT `fk_JOGADOR/TREINADOR_TIME1` FOREIGN KEY (`TIME_idClub`) REFERENCES `times` (`idClube`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela 2sis_futebol_gustavo_brendo.jogador_treinador: ~124 rows (aproximadamente)
/*!40000 ALTER TABLE `jogador_treinador` DISABLE KEYS */;
INSERT INTO `jogador_treinador` (`idJOGADOR/TREINADOR`, `nome`, `funcao/posicao`, `gols`, `assistencias`, `CartaoAmarelo`, `CartaoVermelho`, `Suspensao`, `TIME_idClub`) VALUES
	(6, 'Paolo Guerreiro', 'Atacante', 1, 1, 0, 0, 0, 22),
	(7, 'D\' Alessandro', 'Meia', 2, 1, 3, 2, 3, 22),
	(8, 'Jonatan Alvez', 'Atacante', 3, 0, 9, 1, 4, 22),
	(10, 'Camilo', 'Meia', 1, 2, 0, 0, 0, 22),
	(11, 'Lucas Paqueta', 'Meia', 10, 1, 5, 0, 0, 23),
	(12, 'Victor Vinicius Coelho', 'Atacante', 2, 4, 2, 0, 0, 23),
	(13, 'Diego Ribas', 'Meia', 5, 2, 9, 1, 4, 23),
	(14, 'Henrique Dourado', 'Atacante', 5, 0, 6, 1, 0, 23),
	(15, 'Everton Ribeiro', 'Meia', 4, 5, 5, 1, 0, 23),
	(16, 'Nenê', 'Atacante', 8, 3, 7, 0, 0, 24),
	(17, 'Diego Souza', 'Meia', 11, 3, 1, 1, 0, 24),
	(18, 'Everton Cardoso', 'Meia', 5, 6, 6, 0, 0, 24),
	(19, 'Reinaldo', 'Defensor', 2, 2, 4, 0, 0, 24),
	(20, 'Hudson', 'Meia', 1, 0, 6, 0, 0, 24),
	(21, 'Everton Sousa', 'Atacante', 8, 3, 4, 0, 0, 25),
	(22, 'Luan', 'Atacante', 1, 6, 3, 0, 0, 25),
	(23, 'Maicon', 'Meia', 1, 0, 4, 0, 0, 25),
	(24, 'Pedro Geromel', 'Defensor', 2, 0, 2, 0, 0, 25),
	(25, 'Jael', 'Atacante', 4, 1, 1, 0, 0, 25),
	(26, 'Ricardo Oliveira', 'Atacante', 11, 5, 2, 0, 0, 26),
	(27, 'Luan Madson', 'Atacante', 3, 5, 6, 0, 0, 26),
	(28, 'Yimmi Chará', 'Atacante', 1, 4, 1, 0, 0, 26),
	(29, 'Juan Cazares', 'Meia', 5, 4, 1, 0, 0, 26),
	(30, 'Leonardo Silva', 'Defensor', 4, 0, 7, 0, 0, 26),
	(31, 'Carlos Andrés', 'Meia', 3, 4, 2, 0, 0, 27),
	(32, 'Gabriel Barbosa', 'Atacante', 16, 2, 6, 0, 0, 27),
	(33, 'Rodrygo Silva', 'Atacante', 6, 3, 1, 0, 0, 27),
	(34, 'Derlis González', 'Meia', 1, 5, 5, 0, 0, 27),
	(35, 'José Rodolfo', 'Defensor', 1, 2, 5, 0, 0, 27),
	(36, 'Dedé', 'Defensor', 3, 0, 5, 0, 0, 28),
	(37, 'Arrascaeta', 'Meia', 6, 6, 3, 0, 0, 28),
	(38, 'Thiago Neves', 'Meia', 3, 0, 3, 0, 0, 28),
	(39, 'Fred', 'Atacante', 1, 0, 1, 0, 0, 28),
	(40, 'Hérnan Barcos', 'Atacante', 1, 1, 1, 0, 0, 28),
	(41, 'Plabo Felipe', 'Atacante', 12, 2, 6, 0, 0, 29),
	(42, 'Guilherme', 'Atacante', 2, 0, 4, 0, 0, 29),
	(43, 'Jonathan ', 'Defensor', 1, 5, 3, 0, 0, 29),
	(44, 'Nikão', 'Meia', 2, 5, 5, 1, 0, 29),
	(45, 'Marcio ', 'Atacante', 1, 1, 1, 0, 0, 29),
	(46, 'Pedro', 'Atacante', 10, 2, 1, 0, 0, 30),
	(47, 'Gum', 'Defensor', 2, 1, 3, 0, 0, 30),
	(48, 'Junior', 'Meia', 1, 1, 6, 1, 0, 30),
	(49, 'Marcos Junior', 'Atacante', 2, 3, 0, 0, 0, 30),
	(50, 'Luciano da Rocha', 'Atacante', 3, 1, 2, 0, 0, 30),
	(51, 'José Rafael', 'Meia', 2, 3, 6, 0, 0, 31),
	(52, 'Gilberto Oliveira', 'Atacante', 8, 0, 2, 0, 0, 31),
	(53, 'Regis', 'Meia', 3, 2, 3, 0, 0, 31),
	(54, 'Vinicius', 'Meia', 4, 1, 3, 0, 0, 31),
	(55, 'Edigar Junio', 'Atacante', 4, 0, 0, 0, 0, 31),
	(56, 'Fagner', 'Defensor', 0, 3, 2, 0, 0, 32),
	(57, 'Angel Romero', 'Atacante', 6, 2, 7, 1, 0, 32),
	(58, 'Pedrinho', 'Meia', 0, 1, 2, 0, 0, 32),
	(59, 'Jadson', 'Meia', 4, 5, 0, 0, 0, 32),
	(60, 'Roger Rodrigues', 'Atacante', 4, 0, 3, 0, 0, 32),
	(61, 'Maxi Lopez', 'Atacante', 7, 3, 8, 0, 0, 33),
	(62, 'Andrey', 'Meia', 3, 2, 4, 1, 0, 33),
	(63, 'Yago Pikachu', 'Meia', 9, 3, 2, 1, 0, 33),
	(64, 'Leandro', 'Defensor', 0, 0, 3, 1, 0, 33),
	(65, 'Ramon de Morais', 'Defensor', 1, 0, 2, 0, 0, 33),
	(66, 'Matheus', 'Meia', 0, 1, 7, 1, 0, 34),
	(67, 'Erik Nascimento', 'Atacante', 1, 3, 2, 0, 0, 34),
	(68, 'Leonardo Valencia', 'Atacante', 2, 4, 2, 0, 0, 34),
	(69, 'João Paulo', 'Meia', 0, 0, 3, 0, 0, 34),
	(70, 'Rodrigo Lindoso', 'Meia', 7, 3, 5, 0, 0, 34),
	(71, 'Leandro Carvalho', 'Atacante', 4, 3, 4, 1, 0, 35),
	(72, 'Magno Alves', 'Atacante', 1, 0, 0, 0, 0, 35),
	(73, 'Ricardo Dias', 'Meia', 0, 1, 3, 0, 0, 35),
	(74, 'Wescley', 'Meia', 2, 0, 1, 0, 0, 35),
	(75, 'Juninho Quixadá', 'Atacante', 2, 2, 1, 0, 0, 35),
	(76, 'Neilton', 'Atacante', 6, 4, 7, 1, 0, 36),
	(77, 'Lucas Rios', 'Defensor', 1, 0, 0, 0, 0, 36),
	(78, 'Arouca', 'Meia', 0, 0, 4, 0, 0, 36),
	(79, 'Aderlan', 'Defensor', 1, 0, 3, 0, 0, 36),
	(80, 'Andre Lima', 'Atacante', 2, 0, 3, 0, 0, 36),
	(81, 'Rafael Moura', 'Atacante', 6, 2, 3, 1, 0, 37),
	(82, 'Luan Michel', 'Atacante', 1, 3, 4, 2, 0, 37),
	(83, 'Wesley', 'Meia', 0, 1, 4, 2, 0, 37),
	(84, 'Matheus Leonardo', 'Meia', 1, 0, 0, 0, 0, 37),
	(85, 'Giovanni', 'Defensor', 3, 1, 3, 0, 0, 37),
	(86, 'Wellington Paulista', 'Atacante', 5, 2, 7, 0, 0, 38),
	(87, 'Victor', 'Atacante', 0, 0, 1, 0, 0, 38),
	(88, 'Héctor Canteros', 'Meia', 2, 2, 4, 0, 0, 38),
	(89, 'Leandro ', 'Atacante', 7, 0, 6, 1, 0, 38),
	(90, 'Carlos Eduardo', 'Defensor', 0, 3, 3, 0, 0, 38),
	(91, 'Gabriel Santana', 'Atacante', 4, 2, 2, 0, 0, 39),
	(92, 'Hernane', 'Atacante', 1, 1, 0, 0, 0, 39),
	(93, 'Michel Bastos', 'Meia', 3, 3, 1, 0, 0, 39),
	(94, 'Jonathan Marlone', 'Meia', 2, 3, 1, 0, 0, 39),
	(95, 'Felipe Bastos', 'Meia', 1, 1, 3, 0, 0, 39),
	(96, 'Silvinho', 'Atacante', 3, 0, 2, 0, 0, 40),
	(97, 'Cleber', 'Defensor', 0, 0, 1, 1, 0, 40),
	(98, 'Maicosuel', 'Atacante', 0, 0, 0, 0, 0, 40),
	(99, 'Caio Henrique', 'Meia', 0, 3, 2, 0, 0, 40),
	(100, 'Guilherme ', 'Meia', 1, 0, 3, 0, 0, 40),
	(101, 'Hazard', 'Atacante', 7, 4, 0, 0, 0, 2),
	(102, 'willian', 'meia', 3, 0, 0, 0, 0, 2),
	(103, 'Pogba', 'meia', 3, 3, 1, 0, 0, 7),
	(104, 'Martial', 'atacante', 5, 0, 0, 0, 0, 7),
	(105, 'Harry Kane', 'atacante', 6, 0, 3, 0, 0, 4),
	(106, ' Eriksen', 'meia', 0, 2, 0, 0, 0, 4),
	(107, 'Aguero', 'atacante', 7, 4, 2, 0, 0, 1),
	(108, 'mendy', 'Defensor', 0, 5, 0, 0, 0, 1),
	(109, 'Sallah', 'atacante', 5, 3, 0, 0, 0, 3),
	(110, 'Firmino', 'atacante', 2, 2, 0, 0, 0, 3),
	(111, 'Belerin', 'defensor', 0, 4, 0, 0, 0, 5),
	(112, 'Aubameyang', 'atacante', 7, 1, 0, 0, 0, 5),
	(113, 'Callum Wilson', 'atacante', 6, 4, 0, 0, 0, 6),
	(114, 'Ryan Fraser', 'meia', 3, 5, 0, 0, 0, 6),
	(115, 'Richarlison', 'atacante', 6, 0, 0, 0, 0, 9),
	(116, 'Sigurdsson', 'meia', 5, 2, 0, 0, 0, 9),
	(117, 'vardy', 'atacante', 3, 1, 0, 0, 0, 10),
	(118, 'Holebas', 'Defensor', 1, 0, 6, 0, 0, 8),
	(119, 'Morgan', 'Defensor', 0, 0, 4, 2, 0, 10),
	(120, 'Arnaltovic', 'Atacante', 5, 1, 2, NULL, 0, 13),
	(121, 'Cristiano Ronaldo', 'Atacante', 7, 0, 0, 0, 0, 47),
	(122, 'Icardi', 'Atacante', 6, 0, 0, 0, 0, 48),
	(123, 'Insigne ', 'meia', 7, 0, 0, 0, 0, 49),
	(124, 'Mertens', 'Atacante', 7, 0, 0, 0, 0, 49),
	(125, 'Suares', 'Atacante', 9, 4, 0, 0, 0, 41),
	(126, 'Messi', 'Atacante', 7, 5, 0, 0, 0, 41),
	(127, 'Ben Yedder', 'Atacante', 5, 3, 0, 0, 0, 43),
	(128, 'José Mourinho', 'Treinador', NULL, NULL, NULL, NULL, 0, 7),
	(129, 'Mano Menezes', 'Treinador', NULL, NULL, NULL, NULL, 0, 28),
	(130, 'Pep Guardiola', 'Treinador', NULL, NULL, NULL, NULL, 0, 1);
/*!40000 ALTER TABLE `jogador_treinador` ENABLE KEYS */;

-- Copiando estrutura para tabela 2sis_futebol_gustavo_brendo.liga
DROP TABLE IF EXISTS `liga`;
CREATE TABLE IF NOT EXISTS `liga` (
  `idLIGA` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idLIGA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela 2sis_futebol_gustavo_brendo.liga: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` (`idLIGA`, `nome`) VALUES
	(1, 'Premier League'),
	(2, 'Brasileirao'),
	(3, 'La Liga'),
	(4, 'Serie A (Italia)');
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;

-- Copiando estrutura para tabela 2sis_futebol_gustavo_brendo.times
DROP TABLE IF EXISTS `times`;
CREATE TABLE IF NOT EXISTS `times` (
  `idClube` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `Jogos` int(11) NOT NULL,
  `Pontos` int(11) NOT NULL,
  `vitorias` int(11) NOT NULL,
  `empates` int(11) NOT NULL,
  `derrotas` int(11) NOT NULL,
  `golsMarcados` int(11) NOT NULL,
  `golsSofridos` int(11) NOT NULL,
  `valorElenco` varchar(50) DEFAULT NULL,
  `SaldodeGols` int(11) NOT NULL,
  `LIGA_idLIGA` int(11) NOT NULL,
  PRIMARY KEY (`idClube`,`LIGA_idLIGA`),
  KEY `fk_TIME_LIGA1_idx` (`LIGA_idLIGA`),
  CONSTRAINT `fk_TIME_LIGA1` FOREIGN KEY (`LIGA_idLIGA`) REFERENCES `liga` (`idLIGA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela 2sis_futebol_gustavo_brendo.times: ~49 rows (aproximadamente)
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` (`idClube`, `nome`, `Jogos`, `Pontos`, `vitorias`, `empates`, `derrotas`, `golsMarcados`, `golsSofridos`, `valorElenco`, `SaldodeGols`, `LIGA_idLIGA`) VALUES
	(1, 'Manchester City', 11, 29, 9, 2, 0, 33, 4, '1,09 Bi', 0, 1),
	(2, 'Chelsea', 11, 27, 8, 3, 0, 27, 8, '891,75 M', 0, 1),
	(3, 'Liverpool', 11, 27, 8, 3, 0, 21, 5, '913,00 M', 0, 1),
	(4, 'Totthenham', 12, 24, 8, 0, 3, 19, 10, '837,50 M', 0, 1),
	(5, 'Arsenal', 11, 23, 7, 2, 2, 25, 14, '574,00 M', 0, 1),
	(6, 'Bournemouth', 11, 20, 6, 2, 3, 20, 14, '192,25 M', 0, 1),
	(7, 'Manchester United', 11, 20, 6, 2, 3, 19, 18, '835,00 M', 0, 1),
	(8, 'Watford', 11, 19, 6, 1, 4, 16, 13, '167,70 M', 0, 1),
	(9, 'Everton', 11, 18, 6, 1, 4, 16, 13, '426,00 M', 0, 1),
	(10, 'Leicester', 11, 16, 5, 3, 3, 17, 16, '344,50 M', 0, 1),
	(11, 'wolverhampton', 11, 15, 4, 3, 4, 11, 12, '218,00 M', 0, 1),
	(12, 'Brighton & Hove Albion', 11, 14, 4, 2, 5, 12, 16, '177,00 M', 0, 1),
	(13, 'West Ham', 11, 11, 3, 2, 6, 13, 17, '287,50 M', 0, 1),
	(14, 'Crystal Palace', 11, 8, 2, 2, 7, 8, 16, '219,25 M', 0, 1),
	(15, 'Burley', 11, 8, 2, 2, 7, 12, 25, '181,75 M', 0, 1),
	(16, 'Southampton', 11, 7, 1, 4, 6, 7, 20, '266,10 M', 0, 1),
	(17, 'New Castle', 11, 6, 1, 3, 7, 7, 14, '174,00 M', 0, 1),
	(18, 'Cardiff City', 11, 5, 1, 2, 8, 9, 24, '94,15 M', 0, 1),
	(19, 'Fullham', 11, 5, 1, 2, 7, 11, 28, '250,50 M', 0, 1),
	(20, 'Huddersfield', 11, 3, 0, 3, 7, 4, 21, '120,60 M', 0, 1),
	(22, 'Internacional', 32, 61, 17, 10, 5, 44, 24, '48,75 M', 0, 2),
	(23, 'Flamengo', 32, 60, 17, 9, 6, 51, 25, '76,20 M', 0, 2),
	(24, 'São Paulo', 32, 57, 15, 12, 5, 43, 29, '51,95 M', 0, 2),
	(25, 'Grêmio', 32, 55, 15, 10, 7, 42, 23, '67,65 M', 0, 2),
	(26, 'Atlético MG\r\n', 32, 46, 13, 7, 12, 48, 38, '36,55 M', 0, 2),
	(27, 'Santos', 32, 46, 13, 10, 10, 40, 31, '61,20 M', 0, 2),
	(28, 'Cruzeiro', 32, 46, 12, 10, 10, 30, 29, '56,40 M', 0, 2),
	(29, 'Atlético PR', 32, 43, 12, 7, 13, 44, 32, '29,76 M', 0, 2),
	(30, 'Fluminense', 32, 40, 11, 7, 14, 31, 39, '28,73 M', 0, 2),
	(31, 'Bahia', 32, 40, 10, 10, 12, 33, 36, '30,60 M', 0, 2),
	(32, 'Corinthians', 32, 39, 10, 9, 13, 32, 31, '53,50 M', 0, 2),
	(33, 'Vasco da Gama', 32, 38, 9, 11, 12, 37, 43, '30,10 M', 0, 2),
	(34, 'Botafogo', 32, 38, 9, 11, 12, 31, 42, '31,30 M', 0, 2),
	(35, 'Ceará', 32, 37, 9, 10, 12, 28, 32, '17,40 M', 0, 2),
	(36, 'Vitória', 32, 34, 9, 7, 16, 31, 53, '27,83 M', 0, 2),
	(37, 'América MG', 32, 34, 8, 10, 14, 27, 38, '19,73 M', 0, 2),
	(38, 'Chapecoense', 32, 34, 8, 10, 14, 30, 46, '22,58 M', 0, 2),
	(39, 'Sport Recife', 32, 36, 9, 6, 16, 31, 53, '22,65 M', 0, 2),
	(40, 'Paraná', 32, 18, 3, 9, 20, 14, 51, '13,63 M', 0, 2),
	(41, 'Barcelona', 11, 24, 7, 3, 1, 31, 14, '1,23 Bi', 0, 3),
	(42, 'Espanyol', 11, 21, 6, 3, 1, 15, 8, '103', 0, 3),
	(43, 'Sevilla', 11, 20, 6, 2, 3, 22, 13, '256M', 0, 3),
	(44, 'Atl Madrid', 11, 20, 5, 5, 1, 13, 6, '898M', 0, 3),
	(45, 'Alavés', 11, 20, 6, 2, 3, 15, 11, '66M', 0, 3),
	(46, 'Real Madrid', 11, 17, 5, 2, 4, 16, 14, '1,03', 0, 3),
	(47, 'Juventus', 11, 31, 10, 1, 0, 24, 8, '783M', 0, 4),
	(48, 'Internazionale', 11, 25, 8, 1, 2, 21, 6, '555,10M', 0, 4),
	(49, 'Napoli', 11, 25, 8, 1, 2, 24, 12, '551,5M', 0, 4),
	(50, 'Milan', 11, 21, 6, 3, 2, 21, 14, '486M', 0, 4);
/*!40000 ALTER TABLE `times` ENABLE KEYS */;

-- Copiando estrutura para trigger 2sis_futebol_gustavo_brendo.delete_time
DROP TRIGGER IF EXISTS `delete_time`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_time` BEFORE DELETE ON `times` FOR EACH ROW /*Se deletar um time,precisa de deletar todos jogadores primeiro */
BEGIN 
DELETE FROM jogador_treinador  WHERE TIME_idClub = old.idClube;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger 2sis_futebol_gustavo_brendo.SG
DROP TRIGGER IF EXISTS `SG`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `SG` BEFORE INSERT ON `times` FOR EACH ROW /*Ao inserir dados de um novo time ,gerar obrigatoriamente o saldo de gols*/
BEGIN
 set new.SaldodeGols = new.golsMarcados-new.golsSofridos ;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger 2sis_futebol_gustavo_brendo.Suspensoes
DROP TRIGGER IF EXISTS `Suspensoes`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `Suspensoes` BEFORE UPDATE ON `jogador_treinador` FOR EACH ROW BEGIN


 set new.Suspensao= new.CartaoAmarelo/3+ old.CartaoVermelho;
 set new.Suspensao= old.CartaoAmarelo/3+ new.CartaoVermelho;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
