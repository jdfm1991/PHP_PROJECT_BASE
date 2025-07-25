-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20250624.c910e1faac
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-07-2025 a las 10:19:53
-- Versión del servidor: 8.0.26
-- Versión de PHP: 8.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project_base`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_movements_data_table`
--

CREATE TABLE `bank_movements_data_table` (
  `id` varchar(20) NOT NULL,
  `dateload` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datemov` date NOT NULL,
  `referencemov` varchar(20) NOT NULL,
  `descriptionmov` varchar(100) NOT NULL,
  `detailmov` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `amountmov` decimal(28,4) NOT NULL,
  `typemov` varchar(20) NOT NULL,
  `balencemov` decimal(28,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `bank_movements_data_table`
--

INSERT INTO `bank_movements_data_table` (`id`, `dateload`, `datemov`, `referencemov`, `descriptionmov`, `detailmov`, `amountmov`, `typemov`, `balencemov`) VALUES
('687587cb79c68', '2025-07-14 18:42:19', '2023-05-08', '31266738881', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, 1160.0000, 'Nota de Crédito', -1.2000),
('687587cb7f30a', '2025-07-14 18:42:19', '2023-05-08', '31266740878', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, 28000.0000, 'Nota de Crédito', 28000.0000),
('687587cb8186c', '2025-07-14 18:42:19', '2023-05-08', '00000024775', 'TRF CR INM 0157 J410261374  COMERCIAL LA MAN', NULL, 4625.0000, 'Nota de Crédito', -1.0000),
('687587cb83905', '2025-07-14 18:42:19', '2023-05-08', '31288174176', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, 1569.6100, 'Nota de Crédito', -0.3900),
('687587cb86451', '2025-07-14 18:42:19', '2023-05-08', '31288223463', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, 494.6400, 'Nota de Crédito', 494.6400),
('68758a58549bf', '2025-07-14 18:53:12', '2023-05-02', '12740582842', 'COM. TRF. CR.INM.OB', NULL, 0.1300, 'Nota de Débito', 0.1300),
('68758a5856e7e', '2025-07-14 18:53:12', '2023-05-02', '12740717854', 'TRF.OB 0108 V 14010128 ROMER RIVAS 0255', NULL, 3019.9200, 'Nota de Débito', -0.0800),
('68758a585aa81', '2025-07-14 18:53:12', '2023-05-02', '12741860737', 'TRF.OB 0102 V 12637102 DIOMELYS CUENCA 0255', NULL, 1980.0000, 'Nota de Débito', -0.3775),
('68758a585ddb6', '2025-07-14 18:53:12', '2023-05-02', '12742140506', 'TRF.OB 0108 V 17883529 EDGAR GUAINA 0255', NULL, 2348.1200, 'Nota de Débito', 2348.1200),
('68758a5861435', '2025-07-14 18:53:12', '2023-05-02', '12742141850', 'TRF.OB 0108 V 12360990 ROGER PRADO 0255', NULL, 593.5200, 'Nota de Débito', 593.5200),
('68758a5864849', '2025-07-14 18:53:12', '2023-05-02', '03405395167', 'TRF.MB 0134 J313641065 DISTRIBUIDORA Y C 0255', NULL, 11843.7400, 'Nota de Crédito', 11843.7400),
('68758a58661e1', '2025-07-14 18:53:12', '2023-05-02', '02300580381', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, 21.1500, 'Nota de Débito', 21.1500),
('68758a5867e76', '2025-07-14 18:53:12', '2023-05-02', '02300561543', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, 818.9400, 'Nota de Débito', 818.9400),
('68758a5869932', '2025-07-14 18:53:12', '2023-05-02', '02300626065', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, 1637.1900, 'Nota de Débito', 1637.1900),
('68758a586b3b9', '2025-07-14 18:53:12', '2023-05-02', '02300870823', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, 3389.8200, 'Nota de Débito', -1.1800),
('68758a586ceb7', '2025-07-14 18:53:12', '2023-05-02', '03405342794', 'TRF.MB 0134 J308968099 TRANSPORTE CONFIS 0255', NULL, 1070.2600, 'Nota de Crédito', 1070.2600),
('68758a586ede0', '2025-07-14 18:53:12', '2023-05-02', '03405733563', 'TRF.MB 0134 V012685370 MALDONADO GARCES  0255', NULL, 2970.0000, 'Nota de Débito', 2970.0000),
('68758a58712bc', '2025-07-14 18:53:12', '2023-05-02', '03405768342', 'TRF.MB 0134 J297953582 COMERCIALIZADORA  0255', NULL, 173.2200, 'Nota de Crédito', 173.2200),
('68758a5873060', '2025-07-14 18:53:12', '2023-05-02', '03405917321', 'TRF.MB 0134 J297953582 COMERCIALIZADORA  0255', NULL, 34650.0000, 'Nota de Crédito', 34650.0000),
('68758a5875239', '2025-07-14 18:53:12', '2023-05-02', '03405932900', 'TRF.MB 0134 J297953582 COMERCIALIZADORA  0255', NULL, 634.1400, 'Nota de Crédito', 634.1400),
('68758a587724c', '2025-07-14 18:53:12', '2023-05-02', '03405934009', 'TRF.MB 0134 J002076348 ALIMENTOS LE BISC 0255', NULL, 34650.0200, 'Nota de Débito', 34650.0200),
('68758a5879eaf', '2025-07-14 18:53:12', '2023-05-02', '31221629533', 'BANESCOPAGOS 3100324017', NULL, 211.6700, 'Nota de Débito', 211.6700),
('68758a587c702', '2025-07-14 18:53:12', '2023-05-02', '31221634574', 'BANESCOPAGOS 3100324033', NULL, 1200.5300, 'Nota de Débito', 1200.5300),
('68758a587ec7d', '2025-07-14 18:53:12', '2023-05-02', '31221669366', 'BANESCOPAGOS 3100324071', NULL, 173.2200, 'Nota de Débito', 173.2200),
('68758a5880f8a', '2025-07-14 18:53:12', '2023-05-03', '31233224442', 'Banesco Pago Movil', NULL, 1548.0200, 'Nota de Crédito', 1548.0200),
('68758a5883cca', '2025-07-14 18:53:12', '2023-05-04', '05002776191', 'TodoTicket 2004 C.A.', NULL, 679.3700, 'Nota de Débito', 679.3700),
('68758a588605b', '2025-07-14 18:53:12', '2023-05-04', '03406413151', 'TRF.MB 0134 V008275866 FUENTES RIOS ALEJ 0255', NULL, 45.0000, 'Nota de Débito', 45.0000),
('68758a58882b9', '2025-07-14 18:53:12', '2023-05-04', '18479622106', 'Banesco Pago Movil', NULL, 497.4000, 'Nota de Débito', 497.4000),
('68758a588b810', '2025-07-14 18:53:12', '2023-05-05', '00012393384', 'TRF CR INM 0105 J311487263 DISTRIBUCIONES CO', NULL, 2500.0000, 'Nota de Crédito', 2500.0000),
('68758a588d377', '2025-07-14 18:53:12', '2023-05-05', '12744053219', 'TRF.OB 0105 V 13657787 JORGE BONILLA 0255', NULL, 2002.4000, 'Nota de Débito', 2002.4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_data_table`
--

CREATE TABLE `client_data_table` (
  `id` varchar(20) NOT NULL,
  `nameClient` varchar(100) NOT NULL,
  `dniClient` varchar(20) NOT NULL DEFAULT 'Sin Registrar',
  `emailClient` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'sinregistro@admin.com',
  `phoneClient` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '+00-000-00000',
  `phoneClientAlt` varchar(20) DEFAULT NULL,
  `balanceClient` double(28,4) NOT NULL DEFAULT '0.0000',
  `statusClient` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `client_data_table`
--

INSERT INTO `client_data_table` (`id`, `nameClient`, `dniClient`, `emailClient`, `phoneClient`, `phoneClientAlt`, `balanceClient`, `statusClient`) VALUES
('6867048c7287a', 'EUDES CHAVEZ', 'V-0', 'aurajimenez0501@gmail.com', '+(58) 414-875-7142', '', 0.0000, 1),
('686704ef02be3', 'FELICIA DE AIELLO', 'V-0', 'aiello.john@yahoo.com', '+(58) 412-904-1763', '', 0.0000, 1),
('686705156466c', 'NORJUL GONZÁLEZ', 'V-0', 'norjulband@gmail.com', '+(58) 414-875-3380', '', 0.0000, 1),
('68670543ece17', 'ANA GALAVÍS', 'V-0', 'anitagalavis@gmail.com', '+(58) 414-872-7500', '', 0.0000, 1),
('6867056ad8b81', 'ANDRES JIMENEZ', 'V-0', 'ANDRESJOSEJIMENEZ@GMAIL.COM', '+(58) 000-000-0000', '', 0.0000, 1),
('686705862a2fd', 'CARMELA DE MOSSUTO', 'V-0', 'analisis.inmuebles.ori@gmail.com', '+(58) 000-000-0000', '', 0.0000, 1),
('686705b5c74cb', 'MIKER CEBALLOS', 'V-0', 'quinteromaikel5@gmail.com', '+(58) 412-193-6876', '', 0.0000, 1),
('686705dc03704', 'RODOLFO VERDE', 'V-0', 'rodolfo.verde@gmail.com', '+(58) 416-486-0443', '', 0.0000, 1),
('68670616c6115', 'ACHILLER PERSICO', 'V-0', 'achi3@me.com', '+(58) 000-000-0000', '', 0.0000, 1),
('6867066e51795', 'JUAN FERNANDEZ', 'V-0', 'juanfernandez26@hotmail.com', '+(58) 414-860-0262', '', 0.0000, 1),
('686706a6b2e61', 'NIEVES BOADA', 'V-0', 'azocarc@hotmail.com', '+(58) 414-867-2641', '', 0.0000, 1),
('686706d574179', 'EMPERATRIZ PÉREZ', 'V-0', 'empiperez@hotmail.com', '+(58) 414-094-0590', '', 0.0000, 1),
('686712836921b', 'NAIKARYS BARRETO ', '-', 'NAYMAR8478@GMAIL.COM', '', '', 0.0000, 1),
('686712a784b9d', 'MARY SOL LONDOÑO', '-', '', '', '', 0.0000, 1),
('686712cd6eb7a', 'MAYRUMA ESPÓSITO', '-', 'mayruma2008@hotmail.com', '+(58) 414-987-4651', '', 0.0000, 1),
('686713665dcce', 'OCIRIS RAMÍREZ', '-', 'OCIRIS_RAMIREZ@HOTMAI', '', '+1 (678) 9340709', 0.0000, 1),
('68671389ae950', 'BASSAM ABBOUD', '4-147650207', 'baab83@gmail.com', '', '', 0.0000, 1),
('6867139f16e5d', 'EGLEIDIS ROSEMIL OSUNA', '-', 'TRAUMATOSUNA@HOTMAIL.COM', '+(58) 414-764-3476', '', 0.0000, 1),
('686713b0d85f8', 'JORGE LUIS INFANTE', '-', 'presidencia.jorin@gmail.com', '', '', 0.0000, 1),
('686713c2f0ba8', 'ARGELIA ARÉVALO', '4-148728340', 'argeliac7@gmail.com', '', '', 0.0000, 1),
('686713d876f36', 'JOHN AIELLO', '-', 'john.carlo.aiello@gmail.com', '', '', 0.0000, 1),
('686713f362bba', 'VESTALIA HIGUEREY', '-', 'vestaliah@gmail.com', '+(58) 414-094-6488', '', 0.0000, 1),
('6867140e4cfca', 'JOSE SEQUEA', '-', 'noelsequea@gmail.com', '+(58) 414-892-8608', '', 0.0000, 1),
('6867142635a99', 'TONY GONCALVES', '-', 'tonydani@hotmail.com', '', '+554187714403', 0.0000, 1),
('686714390e468', 'OVIDIO HERNÁNDEZ', '-', '', '+(58) 414-891-3033', '', 0.0000, 1),
('68671456bea6f', 'LANA MCCAULEY', '-', 'LJMCCAULEY@HOTMAIL.COM', '+(58) 414-095-9831', '', 0.0000, 1),
('6867149bdb4e9', 'FERNANDO GARCÍA', '-', 'jennifferlisseth.garciaquijada@gmail.com', '+(58) 412-606-8206', '', 0.0000, 1),
('686714ba43817', 'MILAGROS MATAMORO', '-', 'mili650@hotmail.com', '+(58) 414-868-6950', '', 0.0000, 1),
('686714d257bf4', 'KAREN GONZÁLEZ', '-', 'kjgj15@yahoo.com', '+(58) 414-094-2997', '', 0.0000, 1),
('686714e455b09', 'NOLVERTA SANDOVAL', '-', 'teresasandoval20@gmail.com', '+(58) 416-686-2384', '', 0.0000, 1),
('686714fa8fd34', 'LUCY ROMERO', '-', 'lucyjromero65@gmail.com', '+(58) 424-920-8854', '', 0.0000, 1),
('686715221ace4', 'LEONEL MÁRQUEZ', '-', 'leomarquez4@hotmail.com', '+(58) 414-880-7478', '', 0.0000, 1),
('686715323f493', 'ANA NAVARRO', '-', 'ana_navarro68@hotmail.com', '+(58) 424-974-4355', '', 0.0000, 1),
('686715488d3c9', 'AMAELI FRANCISCO GUILLÉN', '-', 'agrosanjose30@gmail.com', '+(58) 414-830-3606', '', 0.0000, 1),
('686715556bf03', 'SUCESIÓN OLIVIA LÓPEZ', '-', 'libiatorres6@gmail.com', '', '', 0.0000, 1),
('686715660009b', 'MILIZA CAMACARO', '-', 'bassansouki@gmail.com', '+(58) 414-872-2780', '', 0.0000, 1),
('6867157acade9', 'EDUARDO CANELON', '-', 'eduardo_canelon@hotmail.com', '+(58) 414-853-3810', '', 0.0000, 1),
('686715d643467', 'GISELA VÁZQUEZ', '-', 'gikavato@hotmail.com', '+(58) 414-869-2272', '', 0.0000, 1),
('686715ee2b961', 'ADIANA RIZZO', '-', 'adiana_r64@hotmail.com', '+(58) 424-559-4858', '', 0.0000, 1),
('686715feb5909', 'ROBERT RIVAS', '-', 'robertrivas01@hotmail.com', '+(58) 424-919-7289', '', 0.0000, 1),
('6867161376020', 'SUCESIÓN DOMINGO GARCÍA', '-', 'empiperez@hotmail.com', '+(58) 414-094-0590', '', 0.0000, 1),
('68671ba825326', 'SUCESIÓN ROSA MARCANO', '-', 'vhalbornozt@gmail.com', '+(58) 414-881-3803', '', 0.0000, 1),
('68671bda76095', 'ALFREDO GALLO', '-', 'agallocruz1@gmail.com', '+(58) 416-686-7855', '', 0.0000, 1),
('68671beed0ef2', 'JUANA MARTÍNEZ', '-', 'martinezseny@gmail.com', '', '', 0.0000, 1),
('68671c10504b6', 'AYSEN VALLADARES', '-', 'aysenvp@gmail.com', '+(58) 414-380-9819', '', 0.0000, 1),
('68671c2e9291f', 'INVERSIONES MOZZARE, C.A.', '-', 'yoeldezordo@yahoo.com', '+(58) 414-881-3621', '', 0.0000, 1),
('68671c4b28625', 'RAFAEL RENAUD', '-', 'rafaelrenaud@yahoo.com', '+(58) 414-867-2017', '', 0.0000, 1),
('68671c6b19940', 'DARIANNY DE RMEITI', '-', 'dariannyp30@gmail.com', '+(58) 424-912-3352', '', 0.0000, 1),
('68671c8dba794', 'MARÍA YSABEL MATAMOROS', '-', 'maribelmatamoros@gmail.com', '+(58) 414-868-6950', '', 0.0000, 1),
('68671ca3b68cd', 'INVERSIONES MAÑÓN, C.A.', '-', '', '+(58) 424-974-4312', '', 0.0000, 1),
('68671cbb6111c', 'ALICIA DE FERNÁNDEZ', '-', 'xoanfernandez@hotmail.com', '+(58) 414-860-2253', '', 0.0000, 1),
('68671ce21679d', 'C.A. STIING', '-', '2doalbarran@gmail.com', '+(58) 414-894-9311', '', 0.0000, 1),
('68671d23627d7', 'HUMBERTO LÓPEZ', '-', 'humbertolobra@gmail.com', '+(58) 424-953-7516', '', 0.0000, 1),
('68671d41c5b65', 'REP. ANGOSTURA, C.A', '-', 'juanzurita@cantv.net', '+(58) 414-898-7274', '', 0.0000, 1),
('68671d5d9abf3', 'HORTENCIA TORRES', '-', 'torreshortencia27@gmail.com', '+(58) 424-910-4504', '', 0.0000, 1),
('68671d7c562d4', 'LIGIA ARZOLAY', '-', 'ligiarzolay@gmail.com', '+(58) 412-875-5626', '', 0.0000, 1),
('68671d96aab72', 'FREDDY RENDÓN', '-', 'rendonfreddy@yahoo.es', '+(58) 414-385-2849', '', 0.0000, 1),
('68671db558f00', 'IRENE BERTANI', '-', 'iberfrat3@hotmail.com', '+(58) 414-385-1401', '', 0.0000, 1),
('68671dcee2f1c', 'VÍCTOR COLLAZO', '-', 'collazovictor@yahoo.com', '+(58) 414-091-2121', '', 0.0000, 1),
('68671df1a9965', 'MIREYA FLORES', '-', 'mirflormendez@yahoo.com', '+(58) 414-334-2902', '', 0.0000, 1),
('68671e0c76bd4', 'ANA MEZA', '-', 'azem1940@hotmail.com', '+(58) 414-285-4284', '', 0.0000, 1),
('68671e27ec8d1', 'CRISTINA AIELLO', '-', 'cristiaiello@gmail.com', '+(58) 424-915-7324', '', 0.0000, 1),
('68671e58d5e3c', 'CONST. INTEGRALES ASOC., S.A.', '-', 'consciasa@gmail.com', '+(58) 414-856-4246', '', 0.0000, 1),
('68671e68207c3', 'ROSINA CALCINA', '-', 'dtavilap@gmail.com', '', '', 0.0000, 1),
('68671e7e9f77e', 'MARIA LUISA CORONADO', '-', 'mary_coronado@hotmail.com', '+(58) 424-912-4340', '', 0.0000, 1),
('68671e978ec0b', 'MARIO BARTRA', '-', 'espinozaalejandro183@gmail.com', '+(58) 412-931-6595', '', 0.0000, 1),
('68671ec41ef87', 'JOSÉ OLIVIERI', '-', 'holajoseolivieri@hotmail.com', '+(58) 414-869-2615', '', 0.0000, 1),
('68671ee0915ad', 'MAURICIO ESPINOZA', '-', 'mauricioivanespinoza@gmail.com', '+(58) 416-892-4353', '', 0.0000, 1),
('68671efe989e1', 'PEDRO MARCHETTA', '-', 'lgms2111@gmail.com', '+(58) 424-966-5140', '', 0.0000, 1),
('68671f18ef50a', 'CARMEN GARCÍA', '-', 'carmen.garcia@corposistemas.net', '+(58) 414-889-2188', '', 0.0000, 1),
('686a855ee6b2a', 'JOVANNI FRANCO', 'V-20972144', 'jova@ho.com', '+(58) 424-959-0510', '', 0.0000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_suplier_data_table`
--

CREATE TABLE `client_suplier_data_table` (
  `id` int NOT NULL,
  `suplier` varchar(20) NOT NULL,
  `client` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `client_suplier_data_table`
--

INSERT INTO `client_suplier_data_table` (`id`, `suplier`, `client`) VALUES
(48, '6878fa3e7a8a7', '6867157acade9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department_data_table`
--

CREATE TABLE `department_data_table` (
  `id` varchar(20) NOT NULL,
  `nameDepartment` varchar(50) NOT NULL,
  `tagDepartment` varchar(20) NOT NULL,
  `statusDepartment` tinyint(1) NOT NULL DEFAULT '1',
  `availableDepartment` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `department_data_table`
--

INSERT INTO `department_data_table` (`id`, `nameDepartment`, `tagDepartment`, `statusDepartment`, `availableDepartment`) VALUES
('685698498f2f4', 'Gestion Administrativa', 'Administrativa', 1, 1),
('6856985d2b6d2', 'Gestion de Finanzas', 'Finanzas', 1, 1),
('6856987c2d4e2', 'Gestion de Seguridad', 'Seguridad', 1, 1),
('6867c5a421535', 'Ajuste de Sistema', 'Sistema', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_accounts_data_table`
--

CREATE TABLE `expense_accounts_data_table` (
  `id` varchar(20) NOT NULL,
  `typeaccount` int NOT NULL,
  `codeaccount` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fixedaccount` tinyint(1) NOT NULL DEFAULT '0',
  `expenseaccount` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `statusaccount` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `expense_accounts_data_table`
--

INSERT INTO `expense_accounts_data_table` (`id`, `typeaccount`, `codeaccount`, `fixedaccount`, `expenseaccount`, `statusaccount`) VALUES
('686926441810a', 3, 'SERV-01', 1, 'PAGO DE SERVICIO BASICOS', 1),
('686926b35aa97', 1, 'NOMI-02', 1, 'NOMINA VIGILANTE', 1),
('6869280a22d15', 4, 'SUMI-01', 0, 'COMPRA DE TUBERIA', 0),
('6869283fb8231', 4, 'SUMI-02', 0, 'COMPRA DE HERRAMIENTAS', 0),
('68692c9dd54e7', 1, 'NOMI-01', 1, 'NOMINA ADMINISTRATIVA', 1),
('6878e48409563', 1, 'NOMI-03', 1, 'NOMINA ESPECIAL', 1),
('6878f200b8acd', 3, 'SERV-02', 0, 'INSTALACION DE SISTEMAS', 1),
('6878fabe09205', 2, 'MANT-01', 1, 'MANTENIMIENTO DE EDIFICO', 1),
('6878fb91b2125', 4, 'SUMI-03', 0, 'COMPRA DE MATERIAL DE FERRETERIA', 1),
('6878fba244c5f', 4, 'SUMI-04', 0, 'COMPRA DE MATERIAL DE OFICINA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_data_table`
--

CREATE TABLE `expense_data_table` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dateExpense` date NOT NULL,
  `idSuplier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idExpenseAccount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expenseName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `montExpense` decimal(28,4) NOT NULL,
  `quotasExpense` decimal(28,4) DEFAULT NULL,
  `balanceExpense` decimal(28,4) NOT NULL,
  `dateRegExp` date NOT NULL,
  `statusExpense` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `expense_data_table`
--

INSERT INTO `expense_data_table` (`id`, `dateExpense`, `idSuplier`, `idExpenseAccount`, `expenseName`, `montExpense`, `quotasExpense`, `balanceExpense`, `dateRegExp`, `statusExpense`) VALUES
('6873ad6c02425', '2025-07-08', '686983313e734', '686926b35aa97', 'PAGO DE NOMINA VIGILATE DEL PERIODO 15-06-2025 AL 30-06-2025', 350.0000, NULL, 350.0000, '2025-07-13', 0),
('6873bc39690d2', '2025-07-08', '6869888b438d2', '686926441810a', 'IUBN,WDVNBKIUD', 60.0000, NULL, 60.0000, '2025-07-13', 0),
('6878eb944af70', '2025-07-01', '6869888b438d2', '686926441810a', 'PAGO DE SERVICIO DE TELEFONIA MES DE JULIO', 50.0000, NULL, 50.0000, '2025-07-17', 0),
('6878f01403451', '2025-07-17', '6878ea6c22400', '6878e48409563', 'PAFO SERVICI', 150.0000, NULL, 150.0000, '2025-07-17', 0),
('6878f02f989b8', '2025-07-01', '6878eae8a7e99', '68692c9dd54e7', 'PAGO SUELDO DEL MES JULIO', 300.0000, NULL, 300.0000, '2025-07-17', 0),
('6878f0dfc70c6', '2025-07-01', '6878eaf6abcd9', '686926b35aa97', 'SALARIO MES DE JULIO 2025', 80.0000, NULL, 80.0000, '2025-07-17', 0),
('6878f97b28918', '2025-07-01', '6878eae8a7e99', '68692c9dd54e7', 'PAGO SALARIO MES DE JULIO', 300.0000, NULL, 16.8400, '2025-07-17', 1),
('6878f98a81a5a', '2025-07-01', '6878eaf6abcd9', '686926b35aa97', 'PAGO SALARIO MES DE JULIO', 150.0000, NULL, 89.1000, '2025-07-17', 1),
('6878f9bc18178', '2025-07-01', '6878ea6c22400', '6878f200b8acd', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', 250.0000, NULL, 250.0000, '2025-07-17', 1),
('6878fa0939958', '2025-07-01', '6869888b438d2', '686926441810a', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', 50.0000, NULL, 50.0000, '2025-07-17', 1),
('6878fa27a8f45', '2025-07-01', '68698896e4298', '686926441810a', 'PAGO SERVICIO DE AGUA MES DE JULIO', 50.0000, NULL, 50.0000, '2025-07-17', 1),
('6878faf59cae7', '2025-07-01', '6878fa3e7a8a7', '6878fabe09205', 'FUMIGACION DE EDIFIO', 350.0000, 50.0000, 311.2100, '2025-07-17', 1),
('6878fc5b680a5', '2025-07-01', '6878fc1e1a0df', '6878fb91b2125', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', 50.0000, NULL, 50.0000, '2025-07-17', 1),
('6878fc86cfa68', '2025-07-01', '6878fc1e1a0df', '6878fba244c5f', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', 20.0000, NULL, 20.0000, '2025-07-17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_type_data_table`
--

CREATE TABLE `expense_type_data_table` (
  `id` int NOT NULL,
  `expensetypename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `expense_type_data_table`
--

INSERT INTO `expense_type_data_table` (`id`, `expensetypename`) VALUES
(1, 'NOMINA'),
(2, 'MANTENIMIENTO'),
(3, 'SERVICIO'),
(4, 'SUMINISTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income_accounts_data_table`
--

CREATE TABLE `income_accounts_data_table` (
  `id` varchar(20) NOT NULL,
  `typeaccount` int NOT NULL,
  `codeaccount` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incomeaccount` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `statusaccount` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `income_accounts_data_table`
--

INSERT INTO `income_accounts_data_table` (`id`, `typeaccount`, `codeaccount`, `incomeaccount`, `statusaccount`) VALUES
('688204b7cd9ba', 1, 'ALQU-01', 'ALQUILER DE ESPACIOS', 1),
('688204cc8e8aa', 2, 'PENA-01', 'PENALIZACIONES ADMINISTRATIVAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income_data_table`
--

CREATE TABLE `income_data_table` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `datereg` date NOT NULL,
  `incomeaccount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `byreceipt` tinyint(1) NOT NULL,
  `incomename` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `percent` tinyint(1) NOT NULL,
  `amountpercent` decimal(28,4) DEFAULT NULL,
  `incomeaumont` decimal(28,4) DEFAULT NULL,
  `incomebalance` decimal(28,4) NOT NULL DEFAULT '0.0000',
  `statusincome` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `income_data_table`
--

INSERT INTO `income_data_table` (`id`, `datereg`, `incomeaccount`, `byreceipt`, `incomename`, `percent`, `amountpercent`, `incomeaumont`, `incomebalance`, `statusincome`) VALUES
('688256ae061fc', '2025-07-24', '688204b7cd9ba', 0, 'ALQUIRER DE SALON DE EVENTOS', 0, NULL, 80.0000, 0.0000, 1),
('688256ca73ff8', '2025-07-24', '688204cc8e8aa', 1, 'BLOQUEO DE LLAVES', 0, NULL, 5.0000, 0.0000, 1),
('688257338a0c1', '2025-07-24', '688204cc8e8aa', 1, 'MORA', 1, 10.0000, NULL, 0.0000, 1),
('688257869a4cb', '2025-07-24', '688204cc8e8aa', 1, 'GASTOS ADMINISTRATIVO', 1, 5.0000, NULL, 0.0000, 1),
('688257e50ee17', '2025-07-24', '688204cc8e8aa', 1, 'COSAS', 1, 50.0000, NULL, 0.0000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income_type_data_table`
--

CREATE TABLE `income_type_data_table` (
  `id` int NOT NULL,
  `incometypename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `income_type_data_table`
--

INSERT INTO `income_type_data_table` (`id`, `incometypename`) VALUES
(1, 'ALQUILERES'),
(2, 'PENALIZACIONES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_department_data_table`
--

CREATE TABLE `model_department_data_table` (
  `id` int NOT NULL,
  `department` varchar(20) NOT NULL,
  `module` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `model_department_data_table`
--

INSERT INTO `model_department_data_table` (`id`, `department`, `module`) VALUES
(10, '6856987c2d4e2', '685dc00146424'),
(18, '6856987c2d4e2', '685f1320579a0'),
(19, '6856987c2d4e2', '685f132f33d58'),
(20, '6867c5a421535', '6861253393088'),
(27, '6867c5a421535', '686468b3c1e87'),
(31, '685698498f2f4', '685fca37cc263'),
(32, '685698498f2f4', '68694ff24e79b'),
(33, '685698498f2f4', '6865d5d3a0e00'),
(34, '685698498f2f4', '68685896364bd'),
(35, '685698498f2f4', '68816e7b132ad'),
(37, '6856985d2b6d2', '686ad2263a378'),
(38, '6856985d2b6d2', '68820b11c109a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module_data_table`
--

CREATE TABLE `module_data_table` (
  `id` varchar(20) NOT NULL,
  `nameModule` varchar(80) NOT NULL,
  `nameListModule` varchar(50) NOT NULL,
  `statusModule` tinyint(1) NOT NULL DEFAULT '1',
  `availableModule` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `module_data_table`
--

INSERT INTO `module_data_table` (`id`, `nameModule`, `nameListModule`, `statusModule`, `availableModule`) VALUES
('685dc00146424', 'usuario', 'Modulo de Usuarios', 0, 1),
('685f1320579a0', 'permisosperfil', 'Permisologia de Perfiles', 0, 1),
('685f132f33d58', 'permisosusuario', 'Permisologia de Usuarios', 0, 1),
('685fca37cc263', 'clientes', 'Modulo Clientes // Propietarios', 0, 1),
('6861253393088', 'tasacambiaria', 'Modulo Tasa Cambiaria', 0, 1),
('686468b3c1e87', 'unidaddepartamental', 'Modulo Unidad Departamental', 0, 1),
('6865d5d3a0e00', 'relafidu', 'Modulo Relaciones Fiduciarias', 0, 1),
('68685896364bd', 'cuentagasto', 'Modulo Cuenta de Gastos', 0, 1),
('68694ff24e79b', 'proveedores', 'Modulo de Proveedores', 0, 1),
('686ad2263a378', 'registrogasto', 'Modulo de Gastos', 0, 1),
('6873c5890614c', 'cxp', 'Modulo de Cuentas Por Pagar', 1, 1),
('6873f2371fb47', 'banco', 'Modulo de Banco', 1, 1),
('6876d314238b2', 'recibocobro', 'Modulo de Recibos de Cobro', 1, 1),
('687eacf696665', 'cxc', 'Modulo de Cuentas Por Cobrar', 1, 1),
('68816e7b132ad', 'cuentaingresos', 'Modulo Cuentas de Ingresos', 0, 1),
('68820b11c109a', 'registroingresos', 'Modulo de Ingresos', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rate_data_table`
--

CREATE TABLE `rate_data_table` (
  `id` int NOT NULL,
  `dateRate` date NOT NULL,
  `exchRate` decimal(28,4) NOT NULL,
  `typeRate` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rate_data_table`
--

INSERT INTO `rate_data_table` (`id`, `dateRate`, `exchRate`, `typeRate`) VALUES
(1, '2025-12-31', 12.0000, 1),
(2, '2025-12-31', 145.2500, 1),
(3, '2025-12-31', 102.4500, 1),
(4, '2025-06-04', 110.2500, 1),
(5, '2025-06-05', 125.0000, 1),
(6, '2023-05-08', 119.2400, 1),
(7, '2023-05-02', 105.2500, 1),
(8, '2023-05-03', 89.5400, 1),
(9, '2023-05-05', 105.2500, 1),
(10, '2023-05-04', 89.5400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rate_types_data_table`
--

CREATE TABLE `rate_types_data_table` (
  `id` int NOT NULL,
  `exchangeratetypes` varchar(20) NOT NULL,
  `acronym` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rate_types_data_table`
--

INSERT INTO `rate_types_data_table` (`id`, `exchangeratetypes`, `acronym`) VALUES
(1, 'Dolares $', 'USD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipts_data_table`
--

CREATE TABLE `receipts_data_table` (
  `id` varchar(20) NOT NULL,
  `cid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uid` varchar(20) NOT NULL,
  `daterec` date NOT NULL,
  `numrec` varchar(20) NOT NULL,
  `nametenant` varchar(150) NOT NULL,
  `conceptreceipt` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `levelrec` varchar(5) NOT NULL,
  `aliquotrec` decimal(28,4) NOT NULL,
  `emailrec` varchar(50) NOT NULL,
  `aumontgf` decimal(28,4) NOT NULL,
  `aumontgv` decimal(28,4) NOT NULL,
  `aumontp` decimal(28,4) NOT NULL,
  `aumonti` decimal(28,4) NOT NULL,
  `aumont` decimal(28,4) NOT NULL,
  `expirationdate` date NOT NULL,
  `balencereceipt` decimal(28,4) NOT NULL,
  `statusrec` tinyint(1) NOT NULL DEFAULT '1',
  `typerec` varchar(15) NOT NULL DEFAULT 'COBRO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `receipts_data_table`
--

INSERT INTO `receipts_data_table` (`id`, `cid`, `uid`, `daterec`, `numrec`, `nametenant`, `conceptreceipt`, `levelrec`, `aliquotrec`, `emailrec`, `aumontgf`, `aumontgv`, `aumontp`, `aumonti`, `aumont`, `expirationdate`, `balencereceipt`, `statusrec`, `typerec`) VALUES
('687d7dd88776a', '7', '686707bc60583', '2025-07-20', '1', 'NAIKARYS BARRETO ', 'JULIO DE 2025', 'PB', 1.3003, 'NAYMAR8478@GMAIL.COM', 7.1500, 4.1600, 0.0000, 0.0000, 11.3100, '2025-08-04', 0.0000, 1, 'COBRO'),
('687d8617956bd', '15', '68670981caf4d', '2025-07-21', '1', 'VESTALIA HIGUEREY', 'JULIO DE 2025', 'P02', 0.8737, 'vestaliah@gmail.com', 5.2500, 2.7900, 0.0000, 0.0000, 8.0400, '2025-08-04', 0.0000, 1, 'COBRO'),
('687d8c673255b', '15', '68670981caf4d', '2025-07-21', 'REC-003-2025', 'VESTALIA HIGUEREY', 'JULIO DE 2025', 'P02', 0.8737, 'vestaliah@gmail.com', 5.2500, 0.0000, 0.0000, 0.0000, 5.2500, '2025-08-04', 5.2500, 0, 'COBRO'),
('687d9ca8352b7', '13', '686707f0735a8', '2025-07-21', 'REC-004-2025', 'ARGELIA ARÉVALO', 'JULIO DE 2025', 'P02', 1.3003, 'argeliac7@gmail.com', 7.8000, 0.0000, 0.0000, 0.0000, 7.8000, '2025-08-04', 7.8000, 0, 'COBRO'),
('687d9f45d35a8', '14', '6867097a3b72a', '2025-07-21', 'REC-005-2025', 'JOHN AIELLO', 'JULIO DE 2025', 'P02', 1.2699, 'john.carlo.aiello@gmail.com', 7.6000, 0.0000, 0.0000, 0.0000, 7.6000, '2025-08-04', 0.1000, 1, 'COBRO'),
('687da0aada002', '13', '686707f0735a8', '2025-07-21', 'REC-006-2025', 'ARGELIA ARÉVALO', 'JULIO DE 2025', 'P02', 1.3003, 'argeliac7@gmail.com', 7.8000, 4.1600, 0.0000, 0.0000, 11.9600, '2025-08-04', 0.0000, 1, 'COBRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipts_items_data_table`
--

CREATE TABLE `receipts_items_data_table` (
  `id` int NOT NULL,
  `idreceipt` varchar(20) NOT NULL,
  `typeexpense` varchar(20) NOT NULL,
  `idexpense` varchar(20) NOT NULL,
  `detailexpense` varchar(150) NOT NULL,
  `amountexpense` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `receipts_items_data_table`
--

INSERT INTO `receipts_items_data_table` (`id`, `idreceipt`, `typeexpense`, `idexpense`, `detailexpense`, `amountexpense`) VALUES
(1, '687d7dd88776a', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO ', 0.6500),
(2, '687d7dd88776a', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO ', 1.9500),
(3, '687d7dd88776a', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO ', 3.9000),
(4, '687d7dd88776a', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO ', 0.6500),
(5, '687d7dd88776a', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO ', 3.2500),
(6, '687d7dd88776a', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3 ', 0.6500),
(7, '687d7dd88776a', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO ', 0.2600),
(8, '687d8617956bd', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO ', 0.4400),
(9, '687d8617956bd', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO ', 0.4400),
(10, '687d8617956bd', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO ', 1.3100),
(11, '687d8617956bd', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO ', 2.6200),
(12, '687d8617956bd', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO ', 0.4400),
(13, '687d8617956bd', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO ', 2.1800),
(14, '687d8617956bd', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3 ', 0.4400),
(15, '687d8617956bd', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO ', 0.1700),
(16, '687d8c673255b', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO ', 0.4400),
(17, '687d8c673255b', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO ', 0.4400),
(18, '687d8c673255b', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO ', 1.3100),
(19, '687d8c673255b', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO ', 2.6200),
(20, '687d8c673255b', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO ', 0.4400),
(21, '687d9ca8352b7', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO ', 0.6500),
(22, '687d9ca8352b7', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO ', 0.6500),
(23, '687d9ca8352b7', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO ', 1.9500),
(24, '687d9ca8352b7', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO ', 3.9000),
(25, '687d9ca8352b7', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO ', 0.6500),
(26, '687d9f45d35a8', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO ', 0.6300),
(27, '687d9f45d35a8', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO ', 0.6300),
(28, '687d9f45d35a8', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO ', 1.9000),
(29, '687d9f45d35a8', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO ', 3.8100),
(30, '687d9f45d35a8', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO ', 0.6300),
(31, '687da0aada002', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO ', 0.6500),
(32, '687da0aada002', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO ', 0.6500),
(33, '687da0aada002', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO ', 1.9500),
(34, '687da0aada002', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO ', 3.9000),
(35, '687da0aada002', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO ', 0.6500),
(36, '687da0aada002', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO ', 3.2500),
(37, '687da0aada002', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3 ', 0.6500),
(38, '687da0aada002', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO ', 0.2600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipt_pay_data_table`
--

CREATE TABLE `receipt_pay_data_table` (
  `id` int NOT NULL,
  `idrec` varchar(20) NOT NULL,
  `datereg` date NOT NULL,
  `ratepay` decimal(28,4) NOT NULL,
  `referpay` varchar(20) NOT NULL,
  `pay` decimal(28,4) NOT NULL,
  `balance` decimal(28,4) NOT NULL,
  `remaining` decimal(28,4) NOT NULL,
  `dollarpay` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `receipt_pay_data_table`
--

INSERT INTO `receipt_pay_data_table` (`id`, `idrec`, `datereg`, `ratepay`, `referpay`, `pay`, `balance`, `remaining`, `dollarpay`) VALUES
(1, '', '2025-01-01', 1.0000, '1', 1.0000, 1.0000, 1.0000, 0),
(2, '', '2025-07-22', 119.2400, '31266738881', 9.7300, 11.3100, 1.5800, 0),
(3, '', '2025-07-22', 119.2400, '31266738881', 9.7300, 11.3100, 1.5800, 0),
(4, '687d7dd88776a', '2025-07-22', 119.2400, '31266738881', 9.7300, 11.3100, 1.5800, 0),
(5, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(6, '687d7dd88776a', '2025-07-22', 119.2400, '31266738881', 9.7300, 11.3100, 1.5800, 0),
(7, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(8, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(9, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(10, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(11, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(12, '687d9f45d35a8', '2025-07-22', 105.2500, '12741860737', 7.5000, 7.6000, 0.1000, 0),
(13, '687d9f45d35a8', '2025-07-22', 105.2500, '12741860737', 7.5000, 7.6000, 0.1000, 0),
(14, '687d7dd88776a', '2025-07-22', 105.2500, '12741860737', 18.8100, 11.3100, -7.5000, 0),
(15, '687d9f45d35a8', '2025-07-22', 105.2500, '12741860737', 7.5000, 7.6000, 0.1000, 0),
(16, '687da0aada002', '2025-07-23', 0.0000, 'DIVISA', 10.0000, 11.9600, 1.9600, 1),
(17, '', '2025-01-01', 0.0000, '', 10.0000, 10.0000, 0.0000, 0),
(18, '687da0aada002', '2025-07-23', 0.0000, 'DIVISA', 10.0000, 11.9600, 1.9600, 1),
(19, '687d8617956bd', '2025-07-23', 0.0000, 'DIVISA', 5.0000, 8.0400, 3.0400, 1),
(20, '687d8617956bd', '2025-07-23', 119.2400, '31266738881', 9.7300, 3.0400, -6.6900, 0),
(21, '687da0aada002', '2025-07-23', 119.2400, '31266738881', 6.6900, 1.9600, -4.7300, 0),
(22, '', '2025-07-23', 119.2400, '31266738881', 4.7300, 30.0000, 25.2700, 0),
(23, '6878f97b28918', '2025-07-23', 119.2400, '31288174176', 13.1600, 30.0000, 16.8400, 0),
(24, '6878faf59cae7', '2025-07-23', 119.2400, '00000024775', 38.7900, 350.0000, 311.2100, 0),
(25, '6878f98a81a5a', '2025-07-23', 105.2500, '02300870823', 32.2100, 150.0000, 117.7900, 0),
(26, '6878f98a81a5a', '2025-07-23', 105.2500, '12740717854', 28.6900, 117.7900, 89.1000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suplier_data_table`
--

CREATE TABLE `suplier_data_table` (
  `id` varchar(20) NOT NULL,
  `nameSuplier` varchar(100) NOT NULL,
  `statusSuplier` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `suplier_data_table`
--

INSERT INTO `suplier_data_table` (`id`, `nameSuplier`, `statusSuplier`) VALUES
('686983313e734', 'Jovanni Franco', 0),
('6869888b438d2', 'CANTV', 1),
('68698896e4298', 'HIDROBOLIVAR', 1),
('6878ea6c22400', 'JOVANNI FRANCO', 1),
('6878eae8a7e99', 'MAIRA', 1),
('6878eaf6abcd9', 'EMPLEADO 1', 1),
('6878eafdc0eb4', 'EMPLEADO 2', 0),
('6878eb053775a', 'EMPLEADO 3', 0),
('6878fa3e7a8a7', 'FUMINCA', 1),
('6878fc1e1a0df', 'PROVEEDOR DE SERVICIO O SUMINISTRO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_aliquot_data_table`
--

CREATE TABLE `unit_aliquot_data_table` (
  `id` int NOT NULL,
  `aliquot` decimal(5,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unit_aliquot_data_table`
--

INSERT INTO `unit_aliquot_data_table` (`id`, `aliquot`) VALUES
(1, 1.9870),
(2, 1.3003),
(3, 1.2699),
(4, 0.8737),
(5, 2.2683),
(6, 2.1193);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_client_data_table`
--

CREATE TABLE `unit_client_data_table` (
  `id` int NOT NULL,
  `client` varchar(20) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unit_client_data_table`
--

INSERT INTO `unit_client_data_table` (`id`, `client`, `unit`) VALUES
(6, '686712836921b', '686707b369f10'),
(7, '686712836921b', '686707bc60583'),
(9, '686713665dcce', '686707f970a08'),
(10, '68671389ae950', '6867095a1250f'),
(11, '6867139f16e5d', '68670814b4214'),
(12, '6867139f16e5d', '6867096c3072f'),
(13, '686713c2f0ba8', '686707f0735a8'),
(14, '686713d876f36', '6867097a3b72a'),
(15, '686713f362bba', '68670981caf4d'),
(16, '6867140e4cfca', '6867098ac754f'),
(17, '6867142635a99', '68670991ebea9'),
(18, '686714390e468', '68670999bdcc3'),
(19, '686714390e468', '686709a31d4fd'),
(20, '6867149bdb4e9', '686709d1b7fc2'),
(21, '686714ba43817', '686709d9261cb'),
(22, '686714d257bf4', '686709e13db14'),
(23, '6867048c7287a', '68670751dafb8'),
(24, '686704ef02be3', '68670745ad902'),
(25, '686705156466c', '6867079e52a66'),
(26, '68670543ece17', '6867078e317cc'),
(27, '6867056ad8b81', '6867077a6d165'),
(28, '686705862a2fd', '6867076e18368'),
(29, '686714e455b09', '686709e8db4c9'),
(30, '686714fa8fd34', '686709f13fb53'),
(31, '686715221ace4', '686709fbe076a'),
(32, '686715323f493', '68670a041d8c6'),
(33, '686715488d3c9', '68670a0c07c88'),
(34, '686715556bf03', '68670a13f2a0b'),
(35, '686715660009b', '68670a1c045d9'),
(36, '6867157acade9', '68670a2312072'),
(37, '686705dc03704', '68670a2a4068e'),
(38, '686715d643467', '68670a328e0d4'),
(39, '686715ee2b961', '68670a39d7fe0'),
(40, '686715feb5909', '68670a480aae9'),
(41, '68671ba825326', '68670a520fef5'),
(42, '68671bda76095', '68670a5c7931f'),
(43, '68671beed0ef2', '68670a679bec4'),
(44, '68671c10504b6', '68670a6e8de2a'),
(45, '68671c2e9291f', '68670a7644441'),
(46, '68671c4b28625', '68670a7c680aa'),
(47, '68671c4b28625', '68670a83da7e8'),
(48, '68671c6b19940', '68670a9ee0f56'),
(49, '68671c8dba794', '68670aa6af633'),
(50, '68671ca3b68cd', '68670aafcee36'),
(51, '68671cbb6111c', '68670af6d9750'),
(52, '68671ce21679d', '68670b00ed844'),
(53, '68671d23627d7', '68670b099c822'),
(54, '68671d41c5b65', '68670b120cfbe'),
(55, '68671d5d9abf3', '68670b18c04aa'),
(56, '68671d7c562d4', '68670b20a0342'),
(57, '68671d96aab72', '68670b381b7cf'),
(58, '68671db558f00', '68670b3f609df'),
(59, '68671dcee2f1c', '68670b45ee847'),
(60, '68671df1a9965', '68670b4d0ef42'),
(61, '68671e0c76bd4', '68670b55310af'),
(62, '68671e27ec8d1', '68670b5e45847'),
(63, '68671e58d5e3c', '68670b6789b55'),
(64, '68671e68207c3', '68670b728fb14'),
(65, '68671e7e9f77e', '68670b7a85633'),
(66, '68671e978ec0b', '68670b84cda0c'),
(67, '68671ec41ef87', '68670b8d9d4f2'),
(68, '68671ee0915ad', '68670b95e8e0d'),
(69, '68671efe989e1', '68670ba20486e'),
(70, '68671f18ef50a', '6867199b3c485'),
(71, '6867161376020', '686719a63a73e'),
(72, '686706d574179', '686719aeac906'),
(73, '686706a6b2e61', '686719b7d1b17'),
(74, '6867066e51795', '68670baede46b'),
(75, '68670616c6115', '68670bb7e84b1'),
(76, '686705dc03704', '68670bc25fe4a'),
(77, '686705b5c74cb', '68670bcf30676'),
(78, '686712cd6eb7a', '686707e883c4d');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_data_table`
--

CREATE TABLE `unit_data_table` (
  `id` varchar(20) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `level` int NOT NULL,
  `aliquot` int NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unit_data_table`
--

INSERT INTO `unit_data_table` (`id`, `unit`, `level`, `aliquot`, `available`, `enable`) VALUES
('68670745ad902', 'PH-A01', 19, 5, 1, 0),
('68670751dafb8', 'PH-A02', 19, 6, 1, 0),
('6867076e18368', 'P17-A01', 18, 1, 1, 0),
('6867077a6d165', 'P17-A02', 18, 2, 1, 0),
('6867078e317cc', 'P17-A03', 18, 3, 1, 0),
('6867079e52a66', 'P17-A04', 18, 4, 1, 0),
('686707b369f10', 'PB-A01', 1, 1, 1, 0),
('686707bc60583', 'PB-A02', 1, 2, 1, 0),
('686707e883c4d', 'P01-A01', 2, 1, 1, 0),
('686707f0735a8', 'P02-A02', 3, 2, 1, 0),
('686707f970a08', 'P01-A02', 2, 2, 1, 0),
('68670814b4214', 'P01-A04', 2, 4, 1, 0),
('6867095a1250f', 'P01-A03', 2, 3, 1, 0),
('6867096c3072f', 'P02-A01', 3, 1, 1, 0),
('6867097a3b72a', 'P02-A03', 3, 3, 1, 0),
('68670981caf4d', 'P02-A04', 3, 4, 1, 0),
('6867098ac754f', 'P03-A01', 4, 1, 1, 0),
('68670991ebea9', 'P03-A02', 4, 2, 1, 0),
('68670999bdcc3', 'P03-A03', 4, 3, 1, 0),
('686709a31d4fd', 'P03-A04', 4, 4, 1, 0),
('686709d1b7fc2', 'P04-A01', 5, 1, 1, 0),
('686709d9261cb', 'P04-A02', 5, 2, 1, 0),
('686709e13db14', 'P04-A03', 5, 3, 1, 0),
('686709e8db4c9', 'P04-A04', 5, 4, 1, 0),
('686709f13fb53', 'P05-A01', 6, 1, 1, 0),
('686709fbe076a', 'P05-A02', 6, 2, 1, 0),
('68670a041d8c6', 'P05-A03', 6, 3, 1, 0),
('68670a0c07c88', 'P05-A04', 6, 4, 1, 0),
('68670a13f2a0b', 'P06-A01', 7, 1, 1, 0),
('68670a1c045d9', 'P06-A02', 7, 2, 1, 0),
('68670a2312072', 'P06-A03', 7, 3, 1, 0),
('68670a2a4068e', 'P06-A04', 7, 4, 1, 0),
('68670a328e0d4', 'P07-A01', 8, 1, 1, 0),
('68670a39d7fe0', 'P07-A02', 8, 2, 1, 0),
('68670a480aae9', 'P07-A03', 8, 3, 1, 0),
('68670a520fef5', 'P07-A04', 8, 4, 1, 0),
('68670a5c7931f', 'P08-A01', 9, 1, 1, 0),
('68670a679bec4', 'P08-A02', 9, 2, 1, 0),
('68670a6e8de2a', 'P08-A03', 9, 3, 1, 0),
('68670a7644441', 'P08-A04', 9, 4, 1, 0),
('68670a7c680aa', 'P09-A01', 10, 1, 1, 0),
('68670a83da7e8', 'P09-A02', 10, 2, 1, 0),
('68670a9ee0f56', 'P09-A03', 10, 3, 1, 0),
('68670aa6af633', 'P09-A04', 10, 4, 1, 0),
('68670aafcee36', 'P10-A01', 11, 1, 1, 0),
('68670af6d9750', 'P10-A02', 11, 2, 1, 0),
('68670b00ed844', 'P10-A03', 11, 3, 1, 0),
('68670b099c822', 'P10-A04', 11, 4, 1, 0),
('68670b120cfbe', 'P11-A01', 12, 1, 1, 0),
('68670b18c04aa', 'P11-A02', 12, 2, 1, 0),
('68670b20a0342', 'P11-A03', 12, 3, 1, 0),
('68670b381b7cf', 'P11-A04', 12, 4, 1, 0),
('68670b3f609df', 'P12-A01', 13, 1, 1, 0),
('68670b45ee847', 'P12-A02', 13, 2, 1, 0),
('68670b4d0ef42', 'P12-A03', 13, 3, 1, 0),
('68670b55310af', 'P12-A04', 13, 4, 1, 0),
('68670b5e45847', 'P13-A01', 14, 1, 1, 0),
('68670b6789b55', 'P13-A02', 14, 2, 1, 0),
('68670b728fb14', 'P13-A03', 14, 3, 1, 0),
('68670b7a85633', 'P13-A04', 14, 4, 1, 0),
('68670b84cda0c', 'P14-A01', 15, 1, 1, 0),
('68670b8d9d4f2', 'P14-A02', 15, 2, 1, 0),
('68670b95e8e0d', 'P14-A03', 15, 3, 1, 0),
('68670ba20486e', 'P14-A04', 15, 4, 1, 0),
('68670baede46b', 'P16-A01', 17, 1, 1, 0),
('68670bb7e84b1', 'P16-A02', 17, 2, 1, 0),
('68670bc25fe4a', 'P16-A03', 17, 3, 1, 0),
('68670bcf30676', 'P16-A04', 17, 4, 1, 0),
('6867199b3c485', 'P15-A01', 16, 1, 1, 0),
('686719a63a73e', 'P15-A02', 16, 2, 1, 0),
('686719aeac906', 'P15-A03', 16, 3, 1, 0),
('686719b7d1b17', 'P15-A04', 16, 4, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_level_data_table`
--

CREATE TABLE `unit_level_data_table` (
  `id` int NOT NULL,
  `level` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `unit_level_data_table`
--

INSERT INTO `unit_level_data_table` (`id`, `level`) VALUES
(1, 'PB'),
(2, 'P01'),
(3, 'P02'),
(4, 'P03'),
(5, 'P04'),
(6, 'P05'),
(7, 'P06'),
(8, 'P07'),
(9, 'P08'),
(10, 'P09'),
(11, 'P10'),
(12, 'P11'),
(13, 'P12'),
(14, 'P13'),
(15, 'P14'),
(16, 'P15'),
(17, 'P16'),
(18, 'P17'),
(19, 'PH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_data_table`
--

CREATE TABLE `user_data_table` (
  `id` varchar(20) NOT NULL,
  `nameuser` varchar(100) NOT NULL,
  `emailuser` varchar(100) NOT NULL,
  `loginuser` varchar(20) NOT NULL,
  `passworduser` varchar(100) NOT NULL,
  `leveluser` int NOT NULL,
  `statususer` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user_data_table`
--

INSERT INTO `user_data_table` (`id`, `nameuser`, `emailuser`, `loginuser`, `passworduser`, `leveluser`, `statususer`) VALUES
('685c635b19ebd', 'Jovanni Franco', 'jovannifranco@gmail.com', 'jfranco', '$2y$12$XWxnSHpB23ATbKEcEyqGtefN2RD01y79i61pNbWq7xkL/D6Kev2xS', 1, 1),
('685c64852c294', 'hbkjn', 'knkl', 'ljo', '$2y$12$tt4il3SmZ47ZkR47wUINeOuZkw9YB/.j8UIplGufFeWbae7z4hO02', 1, 0),
('685c64cd90edc', 'Daniel Franco', 'jdfm1991@gmail.com', 'dfranco', '$2y$12$sjvnlUGE22myYPTUR1sWqOI46Jup1t7y8gVJ9Ed6.jsLqtz4SJhfm', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_types_data_table`
--

CREATE TABLE `user_types_data_table` (
  `id` int NOT NULL,
  `nameusertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user_types_data_table`
--

INSERT INTO `user_types_data_table` (`id`, `nameusertype`) VALUES
(1, 'Super Administrador'),
(2, 'Administrador'),
(3, 'Gerente'),
(4, 'Operador'),
(5, 'Invitado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bank_movements_data_table`
--
ALTER TABLE `bank_movements_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client_data_table`
--
ALTER TABLE `client_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client_suplier_data_table`
--
ALTER TABLE `client_suplier_data_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client` (`client`);

--
-- Indices de la tabla `department_data_table`
--
ALTER TABLE `department_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense_accounts_data_table`
--
ALTER TABLE `expense_accounts_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense_data_table`
--
ALTER TABLE `expense_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense_type_data_table`
--
ALTER TABLE `expense_type_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `income_accounts_data_table`
--
ALTER TABLE `income_accounts_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `income_data_table`
--
ALTER TABLE `income_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `income_type_data_table`
--
ALTER TABLE `income_type_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_department_data_table`
--
ALTER TABLE `model_department_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `module_data_table`
--
ALTER TABLE `module_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rate_data_table`
--
ALTER TABLE `rate_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rate_types_data_table`
--
ALTER TABLE `rate_types_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receipts_data_table`
--
ALTER TABLE `receipts_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receipts_items_data_table`
--
ALTER TABLE `receipts_items_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receipt_pay_data_table`
--
ALTER TABLE `receipt_pay_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suplier_data_table`
--
ALTER TABLE `suplier_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit_aliquot_data_table`
--
ALTER TABLE `unit_aliquot_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit_client_data_table`
--
ALTER TABLE `unit_client_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit_data_table`
--
ALTER TABLE `unit_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit_level_data_table`
--
ALTER TABLE `unit_level_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_data_table`
--
ALTER TABLE `user_data_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_types_data_table`
--
ALTER TABLE `user_types_data_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client_suplier_data_table`
--
ALTER TABLE `client_suplier_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `expense_type_data_table`
--
ALTER TABLE `expense_type_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `income_type_data_table`
--
ALTER TABLE `income_type_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `model_department_data_table`
--
ALTER TABLE `model_department_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `rate_data_table`
--
ALTER TABLE `rate_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `rate_types_data_table`
--
ALTER TABLE `rate_types_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `receipts_items_data_table`
--
ALTER TABLE `receipts_items_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `receipt_pay_data_table`
--
ALTER TABLE `receipt_pay_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `unit_aliquot_data_table`
--
ALTER TABLE `unit_aliquot_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `unit_client_data_table`
--
ALTER TABLE `unit_client_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `unit_level_data_table`
--
ALTER TABLE `unit_level_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `user_types_data_table`
--
ALTER TABLE `user_types_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client_suplier_data_table`
--
ALTER TABLE `client_suplier_data_table`
  ADD CONSTRAINT `client_suplier_data_table_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client_data_table` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
