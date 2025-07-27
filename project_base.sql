-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-07-2025 a las 22:03:36
-- Versión del servidor: 8.0.19
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
('687587cb79c68', '2025-07-14 18:42:19', '2023-05-08', '31266738881', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, '1160.0000', 'Nota de Crédito', '-1.2000'),
('687587cb7f30a', '2025-07-14 18:42:19', '2023-05-08', '31266740878', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, '28000.0000', 'Nota de Crédito', '28000.0000'),
('687587cb8186c', '2025-07-14 18:42:19', '2023-05-08', '00000024775', 'TRF CR INM 0157 J410261374  COMERCIAL LA MAN', NULL, '4625.0000', 'Nota de Crédito', '-1.0000'),
('687587cb83905', '2025-07-14 18:42:19', '2023-05-08', '31288174176', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, '1569.6100', 'Nota de Crédito', '-0.3900'),
('687587cb86451', '2025-07-14 18:42:19', '2023-05-08', '31288223463', 'TRANS.CTAS. A TERCEROS BANESCO', NULL, '494.6400', 'Nota de Crédito', '494.6400'),
('68758a58549bf', '2025-07-14 18:53:12', '2023-05-02', '12740582842', 'COM. TRF. CR.INM.OB', NULL, '0.1300', 'Nota de Débito', '0.1300'),
('68758a5856e7e', '2025-07-14 18:53:12', '2023-05-02', '12740717854', 'TRF.OB 0108 V 14010128 ROMER RIVAS 0255', NULL, '3019.9200', 'Nota de Débito', '-0.0800'),
('68758a585aa81', '2025-07-14 18:53:12', '2023-05-02', '12741860737', 'TRF.OB 0102 V 12637102 DIOMELYS CUENCA 0255', NULL, '1980.0000', 'Nota de Débito', '-0.3775'),
('68758a585ddb6', '2025-07-14 18:53:12', '2023-05-02', '12742140506', 'TRF.OB 0108 V 17883529 EDGAR GUAINA 0255', NULL, '2348.1200', 'Nota de Débito', '2348.1200'),
('68758a5861435', '2025-07-14 18:53:12', '2023-05-02', '12742141850', 'TRF.OB 0108 V 12360990 ROGER PRADO 0255', NULL, '593.5200', 'Nota de Débito', '593.5200'),
('68758a5864849', '2025-07-14 18:53:12', '2023-05-02', '03405395167', 'TRF.MB 0134 J313641065 DISTRIBUIDORA Y C 0255', NULL, '11843.7400', 'Nota de Crédito', '11843.7400'),
('68758a58661e1', '2025-07-14 18:53:12', '2023-05-02', '02300580381', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, '21.1500', 'Nota de Débito', '21.1500'),
('68758a5867e76', '2025-07-14 18:53:12', '2023-05-02', '02300561543', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, '818.9400', 'Nota de Débito', '818.9400'),
('68758a5869932', '2025-07-14 18:53:12', '2023-05-02', '02300626065', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, '1637.1900', 'Nota de Débito', '1637.1900'),
('68758a586b3b9', '2025-07-14 18:53:12', '2023-05-02', '02300870823', 'INCLUSION DE PLANILLA SENIAT C/CTA', NULL, '3389.8200', 'Nota de Débito', '-1.1800'),
('68758a586ceb7', '2025-07-14 18:53:12', '2023-05-02', '03405342794', 'TRF.MB 0134 J308968099 TRANSPORTE CONFIS 0255', NULL, '1070.2600', 'Nota de Crédito', '1070.2600'),
('68758a586ede0', '2025-07-14 18:53:12', '2023-05-02', '03405733563', 'TRF.MB 0134 V012685370 MALDONADO GARCES  0255', NULL, '2970.0000', 'Nota de Débito', '2970.0000'),
('68758a58712bc', '2025-07-14 18:53:12', '2023-05-02', '03405768342', 'TRF.MB 0134 J297953582 COMERCIALIZADORA  0255', NULL, '173.2200', 'Nota de Crédito', '173.2200'),
('68758a5873060', '2025-07-14 18:53:12', '2023-05-02', '03405917321', 'TRF.MB 0134 J297953582 COMERCIALIZADORA  0255', NULL, '34650.0000', 'Nota de Crédito', '34650.0000'),
('68758a5875239', '2025-07-14 18:53:12', '2023-05-02', '03405932900', 'TRF.MB 0134 J297953582 COMERCIALIZADORA  0255', NULL, '634.1400', 'Nota de Crédito', '634.1400'),
('68758a587724c', '2025-07-14 18:53:12', '2023-05-02', '03405934009', 'TRF.MB 0134 J002076348 ALIMENTOS LE BISC 0255', NULL, '34650.0200', 'Nota de Débito', '34650.0200'),
('68758a5879eaf', '2025-07-14 18:53:12', '2023-05-02', '31221629533', 'BANESCOPAGOS 3100324017', NULL, '211.6700', 'Nota de Débito', '211.6700'),
('68758a587c702', '2025-07-14 18:53:12', '2023-05-02', '31221634574', 'BANESCOPAGOS 3100324033', NULL, '1200.5300', 'Nota de Débito', '1200.5300'),
('68758a587ec7d', '2025-07-14 18:53:12', '2023-05-02', '31221669366', 'BANESCOPAGOS 3100324071', NULL, '173.2200', 'Nota de Débito', '173.2200'),
('68758a5880f8a', '2025-07-14 18:53:12', '2023-05-03', '31233224442', 'Banesco Pago Movil', NULL, '1548.0200', 'Nota de Crédito', '1548.0200'),
('68758a5883cca', '2025-07-14 18:53:12', '2023-05-04', '05002776191', 'TodoTicket 2004 C.A.', NULL, '679.3700', 'Nota de Débito', '679.3700'),
('68758a588605b', '2025-07-14 18:53:12', '2023-05-04', '03406413151', 'TRF.MB 0134 V008275866 FUENTES RIOS ALEJ 0255', NULL, '45.0000', 'Nota de Débito', '45.0000'),
('68758a58882b9', '2025-07-14 18:53:12', '2023-05-04', '18479622106', 'Banesco Pago Movil', NULL, '497.4000', 'Nota de Débito', '497.4000'),
('68758a588b810', '2025-07-14 18:53:12', '2023-05-05', '00012393384', 'TRF CR INM 0105 J311487263 DISTRIBUCIONES CO', NULL, '2500.0000', 'Nota de Crédito', '2500.0000'),
('68758a588d377', '2025-07-14 18:53:12', '2023-05-05', '12744053219', 'TRF.OB 0105 V 13657787 JORGE BONILLA 0255', NULL, '2002.4000', 'Nota de Débito', '2002.4000');

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
('6873ad6c02425', '2025-07-08', '686983313e734', '686926b35aa97', 'PAGO DE NOMINA VIGILATE DEL PERIODO 15-06-2025 AL 30-06-2025', '350.0000', NULL, '350.0000', '2025-07-13', 0),
('6873bc39690d2', '2025-07-08', '6869888b438d2', '686926441810a', 'IUBN,WDVNBKIUD', '60.0000', NULL, '60.0000', '2025-07-13', 0),
('6878eb944af70', '2025-07-01', '6869888b438d2', '686926441810a', 'PAGO DE SERVICIO DE TELEFONIA MES DE JULIO', '50.0000', NULL, '50.0000', '2025-07-17', 0),
('6878f01403451', '2025-07-17', '6878ea6c22400', '6878e48409563', 'PAFO SERVICI', '150.0000', NULL, '150.0000', '2025-07-17', 0),
('6878f02f989b8', '2025-07-01', '6878eae8a7e99', '68692c9dd54e7', 'PAGO SUELDO DEL MES JULIO', '300.0000', NULL, '300.0000', '2025-07-17', 0),
('6878f0dfc70c6', '2025-07-01', '6878eaf6abcd9', '686926b35aa97', 'SALARIO MES DE JULIO 2025', '80.0000', NULL, '80.0000', '2025-07-17', 0),
('6878f97b28918', '2025-07-01', '6878eae8a7e99', '68692c9dd54e7', 'PAGO SALARIO MES DE JULIO', '300.0000', NULL, '16.8400', '2025-07-17', 1),
('6878f98a81a5a', '2025-07-01', '6878eaf6abcd9', '686926b35aa97', 'PAGO SALARIO MES DE JULIO', '150.0000', NULL, '89.1000', '2025-07-17', 1),
('6878f9bc18178', '2025-07-01', '6878ea6c22400', '6878f200b8acd', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '250.0000', NULL, '250.0000', '2025-07-17', 1),
('6878fa0939958', '2025-07-01', '6869888b438d2', '686926441810a', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '50.0000', NULL, '50.0000', '2025-07-17', 1),
('6878fa27a8f45', '2025-07-01', '68698896e4298', '686926441810a', 'PAGO SERVICIO DE AGUA MES DE JULIO', '50.0000', NULL, '50.0000', '2025-07-17', 1),
('6878faf59cae7', '2025-07-01', '6878fa3e7a8a7', '6878fabe09205', 'FUMIGACION DE EDIFIO', '350.0000', '50.0000', '311.2100', '2025-07-17', 1),
('6878fc5b680a5', '2025-07-01', '6878fc1e1a0df', '6878fb91b2125', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '50.0000', NULL, '50.0000', '2025-07-17', 1),
('6878fc86cfa68', '2025-07-01', '6878fc1e1a0df', '6878fba244c5f', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '20.0000', NULL, '20.0000', '2025-07-17', 1);

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
('688256ae061fc', '2025-07-24', '688204b7cd9ba', 0, 'ALQUIRER DE SALON DE EVENTOS', 0, NULL, '80.0000', '80.0000', 1),
('688256ca73ff8', '2025-07-24', '688204cc8e8aa', 1, 'BLOQUEO DE LLAVES', 0, NULL, '5.0000', '5.0000', 1),
('688257338a0c1', '2025-07-24', '688204cc8e8aa', 1, 'MORA', 1, '10.0000', NULL, '0.0000', 1),
('688257869a4cb', '2025-07-24', '688204cc8e8aa', 1, 'GASTOS ADMINISTRATIVO', 1, '5.0000', NULL, '0.0000', 1),
('688257e50ee17', '2025-07-24', '688204cc8e8aa', 1, 'COSAS', 0, NULL, '50.0000', '50.0000', 1);

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
(38, '6856985d2b6d2', '68820b11c109a'),
(39, '6856985d2b6d2', '6876d314238b2'),
(40, '6856985d2b6d2', '687eacf696665'),
(41, '6856985d2b6d2', '6873c5890614c'),
(42, '6856985d2b6d2', '6873f2371fb47');

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
('6873c5890614c', 'cxp', 'Modulo de Cuentas Por Pagar', 0, 1),
('6873f2371fb47', 'banco', 'Modulo de Banco', 0, 1),
('6876d314238b2', 'recibocobro', 'Modulo de Recibos de Cobro', 0, 1),
('687eacf696665', 'cxc', 'Modulo de Cuentas Por Cobrar', 0, 1),
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
(1, '2025-12-31', '12.0000', 1),
(2, '2025-12-31', '145.2500', 1),
(3, '2025-12-31', '102.4500', 1),
(4, '2025-06-04', '110.2500', 1),
(5, '2025-06-05', '125.0000', 1),
(6, '2023-05-08', '119.2400', 1),
(7, '2023-05-02', '105.2500', 1),
(8, '2023-05-03', '89.5400', 1),
(9, '2023-05-05', '105.2500', 1),
(10, '2023-05-04', '89.5400', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rate_types_data_table`
--

CREATE TABLE `rate_types_data_table` (
  `id` int NOT NULL,
  `exchangeratetypes` varchar(20) NOT NULL,
  `acronym` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `unitdep` varchar(10) NOT NULL,
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

INSERT INTO `receipts_data_table` (`id`, `cid`, `uid`, `daterec`, `numrec`, `nametenant`, `conceptreceipt`, `levelrec`, `unitdep`, `aliquotrec`, `emailrec`, `aumontgf`, `aumontgv`, `aumontp`, `aumonti`, `aumont`, `expirationdate`, `balencereceipt`, `statusrec`, `typerec`) VALUES
('68869ba07ad6e', '6', '686707b369f10', '2025-07-27', 'REC-001-2025', 'NAIKARYS BARRETO ', 'JULIO DE 2025', 'PB', 'PB-A01', '1.9870', 'NAYMAR8478@GMAIL.COM', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba0d3c74', '7', '686707bc60583', '2025-07-27', 'REC-002-2025', 'NAIKARYS BARRETO ', 'JULIO DE 2025', 'PB', 'PB-A02', '1.3003', 'NAYMAR8478@GMAIL.COM', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba107e87', '9', '686707f970a08', '2025-07-27', 'REC-003-2025', 'OCIRIS RAMÍREZ', 'JULIO DE 2025', 'P01', 'P01-A02', '1.3003', 'OCIRIS_RAMIREZ@HOTMAI', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba14ed89', '10', '6867095a1250f', '2025-07-27', 'REC-004-2025', 'BASSAM ABBOUD', 'JULIO DE 2025', 'P01', 'P01-A03', '1.2699', 'baab83@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba199448', '11', '68670814b4214', '2025-07-27', 'REC-005-2025', 'EGLEIDIS ROSEMIL OSUNA', 'JULIO DE 2025', 'P01', 'P01-A04', '0.8737', 'TRAUMATOSUNA@HOTMAIL.COM', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869ba1ed60e', '12', '6867096c3072f', '2025-07-27', 'REC-006-2025', 'EGLEIDIS ROSEMIL OSUNA', 'JULIO DE 2025', 'P02', 'P02-A01', '1.9870', 'TRAUMATOSUNA@HOTMAIL.COM', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba25061c', '13', '686707f0735a8', '2025-07-27', 'REC-007-2025', 'ARGELIA ARÉVALO', 'JULIO DE 2025', 'P02', 'P02-A02', '1.3003', 'argeliac7@gmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba29ac96', '14', '6867097a3b72a', '2025-07-27', 'REC-008-2025', 'JOHN AIELLO', 'JULIO DE 2025', 'P02', 'P02-A03', '1.2699', 'john.carlo.aiello@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba2ebaa4', '15', '68670981caf4d', '2025-07-27', 'REC-009-2025', 'VESTALIA HIGUEREY', 'JULIO DE 2025', 'P02', 'P02-A04', '0.8737', 'vestaliah@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869ba353459', '16', '6867098ac754f', '2025-07-27', 'REC-010-2025', 'JOSE SEQUEA', 'JULIO DE 2025', 'P03', 'P03-A01', '1.9870', 'noelsequea@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba3a1d91', '17', '68670991ebea9', '2025-07-27', 'REC-011-2025', 'TONY GONCALVES', 'JULIO DE 2025', 'P03', 'P03-A02', '1.3003', 'tonydani@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba3e7b1d', '18', '68670999bdcc3', '2025-07-27', 'REC-012-2025', 'OVIDIO HERNÁNDEZ', 'JULIO DE 2025', 'P03', 'P03-A03', '1.2699', '', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba424840', '19', '686709a31d4fd', '2025-07-27', 'REC-013-2025', 'OVIDIO HERNÁNDEZ', 'JULIO DE 2025', 'P03', 'P03-A04', '0.8737', '', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869ba471222', '20', '686709d1b7fc2', '2025-07-27', 'REC-014-2025', 'FERNANDO GARCÍA', 'JULIO DE 2025', 'P04', 'P04-A01', '1.9870', 'jennifferlisseth.garciaquijada@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba4c2212', '21', '686709d9261cb', '2025-07-27', 'REC-015-2025', 'MILAGROS MATAMORO', 'JULIO DE 2025', 'P04', 'P04-A02', '1.3003', 'mili650@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba51c0d8', '22', '686709e13db14', '2025-07-27', 'REC-016-2025', 'KAREN GONZÁLEZ', 'JULIO DE 2025', 'P04', 'P04-A03', '1.2699', 'kjgj15@yahoo.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba564401', '23', '68670751dafb8', '2025-07-27', 'REC-017-2025', 'EUDES CHAVEZ', 'JULIO DE 2025', 'PH', 'PH-A02', '2.1193', 'aurajimenez0501@gmail.com', '12.7158', '6.7818', '0.0000', '1.6954', '21.1930', '2025-08-11', '21.1930', 1, 'COBRO'),
('68869ba59e3df', '24', '68670745ad902', '2025-07-27', 'REC-018-2025', 'FELICIA DE AIELLO', 'JULIO DE 2025', 'PH', 'PH-A01', '2.2683', 'aiello.john@yahoo.com', '13.6098', '7.2586', '0.0000', '1.8146', '22.6830', '2025-08-11', '22.6830', 1, 'COBRO'),
('68869ba5dcf56', '25', '6867079e52a66', '2025-07-27', 'REC-019-2025', 'NORJUL GONZÁLEZ', 'JULIO DE 2025', 'P17', 'P17-A04', '0.8737', 'norjulband@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869ba62ebe3', '26', '6867078e317cc', '2025-07-27', 'REC-020-2025', 'ANA GALAVÍS', 'JULIO DE 2025', 'P17', 'P17-A03', '1.2699', 'anitagalavis@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba68430c', '27', '6867077a6d165', '2025-07-27', 'REC-021-2025', 'ANDRES JIMENEZ', 'JULIO DE 2025', 'P17', 'P17-A02', '1.3003', 'ANDRESJOSEJIMENEZ@GMAIL.COM', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba6e54eb', '28', '6867076e18368', '2025-07-27', 'REC-022-2025', 'CARMELA DE MOSSUTO', 'JULIO DE 2025', 'P17', 'P17-A01', '1.9870', 'analisis.inmuebles.ori@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba733b2f', '29', '686709e8db4c9', '2025-07-27', 'REC-023-2025', 'NOLVERTA SANDOVAL', 'JULIO DE 2025', 'P04', 'P04-A04', '0.8737', 'teresasandoval20@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869ba76e1cc', '30', '686709f13fb53', '2025-07-27', 'REC-024-2025', 'LUCY ROMERO', 'JULIO DE 2025', 'P05', 'P05-A01', '1.9870', 'lucyjromero65@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba7ba165', '31', '686709fbe076a', '2025-07-27', 'REC-025-2025', 'LEONEL MÁRQUEZ', 'JULIO DE 2025', 'P05', 'P05-A02', '1.3003', 'leomarquez4@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba818385', '32', '68670a041d8c6', '2025-07-27', 'REC-026-2025', 'ANA NAVARRO', 'JULIO DE 2025', 'P05', 'P05-A03', '1.2699', 'ana_navarro68@hotmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba874f36', '33', '68670a0c07c88', '2025-07-27', 'REC-027-2025', 'AMAELI FRANCISCO GUILLÉN', 'JULIO DE 2025', 'P05', 'P05-A04', '0.8737', 'agrosanjose30@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869ba8c913b', '34', '68670a13f2a0b', '2025-07-27', 'REC-028-2025', 'SUCESIÓN OLIVIA LÓPEZ', 'JULIO DE 2025', 'P06', 'P06-A01', '1.9870', 'libiatorres6@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869ba920eaf', '35', '68670a1c045d9', '2025-07-27', 'REC-029-2025', 'MILIZA CAMACARO', 'JULIO DE 2025', 'P06', 'P06-A02', '1.3003', 'bassansouki@gmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869ba9669a1', '36', '68670a2312072', '2025-07-27', 'REC-030-2025', 'EDUARDO CANELON', 'JULIO DE 2025', 'P06', 'P06-A03', '1.2699', 'eduardo_canelon@hotmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869ba9b3387', '37', '68670a2a4068e', '2025-07-27', 'REC-031-2025', 'RODOLFO VERDE', 'JULIO DE 2025', 'P06', 'P06-A04', '0.8737', 'rodolfo.verde@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869baa05801', '38', '68670a328e0d4', '2025-07-27', 'REC-032-2025', 'GISELA VÁZQUEZ', 'JULIO DE 2025', 'P07', 'P07-A01', '1.9870', 'gikavato@hotmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869baa4e258', '39', '68670a39d7fe0', '2025-07-27', 'REC-033-2025', 'ADIANA RIZZO', 'JULIO DE 2025', 'P07', 'P07-A02', '1.3003', 'adiana_r64@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869baaa7251', '40', '68670a480aae9', '2025-07-27', 'REC-034-2025', 'ROBERT RIVAS', 'JULIO DE 2025', 'P07', 'P07-A03', '1.2699', 'robertrivas01@hotmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869baaf040c', '41', '68670a520fef5', '2025-07-27', 'REC-035-2025', 'SUCESIÓN ROSA MARCANO', 'JULIO DE 2025', 'P07', 'P07-A04', '0.8737', 'vhalbornozt@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bab4ba6a', '42', '68670a5c7931f', '2025-07-27', 'REC-036-2025', 'ALFREDO GALLO', 'JULIO DE 2025', 'P08', 'P08-A01', '1.9870', 'agallocruz1@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bab96d13', '43', '68670a679bec4', '2025-07-27', 'REC-037-2025', 'JUANA MARTÍNEZ', 'JULIO DE 2025', 'P08', 'P08-A02', '1.3003', 'martinezseny@gmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869babf0c0a', '44', '68670a6e8de2a', '2025-07-27', 'REC-038-2025', 'AYSEN VALLADARES', 'JULIO DE 2025', 'P08', 'P08-A03', '1.2699', 'aysenvp@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bac371bc', '45', '68670a7644441', '2025-07-27', 'REC-039-2025', 'INVERSIONES MOZZARE, C.A.', 'JULIO DE 2025', 'P08', 'P08-A04', '0.8737', 'yoeldezordo@yahoo.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bac746b5', '46', '68670a7c680aa', '2025-07-27', 'REC-040-2025', 'RAFAEL RENAUD', 'JULIO DE 2025', 'P09', 'P09-A01', '1.9870', 'rafaelrenaud@yahoo.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bacc2f6d', '47', '68670a83da7e8', '2025-07-27', 'REC-041-2025', 'RAFAEL RENAUD', 'JULIO DE 2025', 'P09', 'P09-A02', '1.3003', 'rafaelrenaud@yahoo.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bad25b78', '48', '68670a9ee0f56', '2025-07-27', 'REC-042-2025', 'DARIANNY DE RMEITI', 'JULIO DE 2025', 'P09', 'P09-A03', '1.2699', 'dariannyp30@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bad8199e', '49', '68670aa6af633', '2025-07-27', 'REC-043-2025', 'MARÍA YSABEL MATAMOROS', 'JULIO DE 2025', 'P09', 'P09-A04', '0.8737', 'maribelmatamoros@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869badde553', '50', '68670aafcee36', '2025-07-27', 'REC-044-2025', 'INVERSIONES MAÑÓN, C.A.', 'JULIO DE 2025', 'P10', 'P10-A01', '1.9870', '', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bae3f3c9', '51', '68670af6d9750', '2025-07-27', 'REC-045-2025', 'ALICIA DE FERNÁNDEZ', 'JULIO DE 2025', 'P10', 'P10-A02', '1.3003', 'xoanfernandez@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bae7c8aa', '52', '68670b00ed844', '2025-07-27', 'REC-046-2025', 'C.A. STIING', 'JULIO DE 2025', 'P10', 'P10-A03', '1.2699', '2doalbarran@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869baecb7f5', '53', '68670b099c822', '2025-07-27', 'REC-047-2025', 'HUMBERTO LÓPEZ', 'JULIO DE 2025', 'P10', 'P10-A04', '0.8737', 'humbertolobra@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869baf34365', '54', '68670b120cfbe', '2025-07-27', 'REC-048-2025', 'REP. ANGOSTURA, C.A', 'JULIO DE 2025', 'P11', 'P11-A01', '1.9870', 'juanzurita@cantv.net', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869baf81975', '55', '68670b18c04aa', '2025-07-27', 'REC-049-2025', 'HORTENCIA TORRES', 'JULIO DE 2025', 'P11', 'P11-A02', '1.3003', 'torreshortencia27@gmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bafc4463', '56', '68670b20a0342', '2025-07-27', 'REC-050-2025', 'LIGIA ARZOLAY', 'JULIO DE 2025', 'P11', 'P11-A03', '1.2699', 'ligiarzolay@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bb020efe', '57', '68670b381b7cf', '2025-07-27', 'REC-051-2025', 'FREDDY RENDÓN', 'JULIO DE 2025', 'P11', 'P11-A04', '0.8737', 'rendonfreddy@yahoo.es', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bb055d92', '58', '68670b3f609df', '2025-07-27', 'REC-052-2025', 'IRENE BERTANI', 'JULIO DE 2025', 'P12', 'P12-A01', '1.9870', 'iberfrat3@hotmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bb099ac1', '59', '68670b45ee847', '2025-07-27', 'REC-053-2025', 'VÍCTOR COLLAZO', 'JULIO DE 2025', 'P12', 'P12-A02', '1.3003', 'collazovictor@yahoo.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bb0e068c', '60', '68670b4d0ef42', '2025-07-27', 'REC-054-2025', 'MIREYA FLORES', 'JULIO DE 2025', 'P12', 'P12-A03', '1.2699', 'mirflormendez@yahoo.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bb12142b', '61', '68670b55310af', '2025-07-27', 'REC-055-2025', 'ANA MEZA', 'JULIO DE 2025', 'P12', 'P12-A04', '0.8737', 'azem1940@hotmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bb164931', '62', '68670b5e45847', '2025-07-27', 'REC-056-2025', 'CRISTINA AIELLO', 'JULIO DE 2025', 'P13', 'P13-A01', '1.9870', 'cristiaiello@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bb1a2f0a', '63', '68670b6789b55', '2025-07-27', 'REC-057-2025', 'CONST. INTEGRALES ASOC., S.A.', 'JULIO DE 2025', 'P13', 'P13-A02', '1.3003', 'consciasa@gmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bb20406c', '64', '68670b728fb14', '2025-07-27', 'REC-058-2025', 'ROSINA CALCINA', 'JULIO DE 2025', 'P13', 'P13-A03', '1.2699', 'dtavilap@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bb243902', '65', '68670b7a85633', '2025-07-27', 'REC-059-2025', 'MARIA LUISA CORONADO', 'JULIO DE 2025', 'P13', 'P13-A04', '0.8737', 'mary_coronado@hotmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bb29b04c', '66', '68670b84cda0c', '2025-07-27', 'REC-060-2025', 'MARIO BARTRA', 'JULIO DE 2025', 'P14', 'P14-A01', '1.9870', 'espinozaalejandro183@gmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bb2ea333', '67', '68670b8d9d4f2', '2025-07-27', 'REC-061-2025', 'JOSÉ OLIVIERI', 'JULIO DE 2025', 'P14', 'P14-A02', '1.3003', 'holajoseolivieri@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bb34119a', '68', '68670b95e8e0d', '2025-07-27', 'REC-062-2025', 'MAURICIO ESPINOZA', 'JULIO DE 2025', 'P14', 'P14-A03', '1.2699', 'mauricioivanespinoza@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bb38e521', '69', '68670ba20486e', '2025-07-27', 'REC-063-2025', 'PEDRO MARCHETTA', 'JULIO DE 2025', 'P14', 'P14-A04', '0.8737', 'lgms2111@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bb3ea70e', '70', '6867199b3c485', '2025-07-27', 'REC-064-2025', 'CARMEN GARCÍA', 'JULIO DE 2025', 'P15', 'P15-A01', '1.9870', 'carmen.garcia@corposistemas.net', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bb43f29b', '71', '686719a63a73e', '2025-07-27', 'REC-065-2025', 'SUCESIÓN DOMINGO GARCÍA', 'JULIO DE 2025', 'P15', 'P15-A02', '1.3003', 'empiperez@hotmail.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bb488af5', '72', '686719aeac906', '2025-07-27', 'REC-066-2025', 'EMPERATRIZ PÉREZ', 'JULIO DE 2025', 'P15', 'P15-A03', '1.2699', 'empiperez@hotmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bb4dda84', '73', '686719b7d1b17', '2025-07-27', 'REC-067-2025', 'NIEVES BOADA', 'JULIO DE 2025', 'P15', 'P15-A04', '0.8737', 'azocarc@hotmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bb52d4d4', '74', '68670baede46b', '2025-07-27', 'REC-068-2025', 'JUAN FERNANDEZ', 'JULIO DE 2025', 'P16', 'P16-A01', '1.9870', 'juanfernandez26@hotmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869bb57c407', '75', '68670bb7e84b1', '2025-07-27', 'REC-069-2025', 'ACHILLER PERSICO', 'JULIO DE 2025', 'P16', 'P16-A02', '1.3003', 'achi3@me.com', '7.8018', '4.1610', '0.0000', '1.0402', '13.0030', '2025-08-11', '13.0030', 1, 'COBRO'),
('68869bb5d794b', '76', '68670bc25fe4a', '2025-07-27', 'REC-070-2025', 'RODOLFO VERDE', 'JULIO DE 2025', 'P16', 'P16-A03', '1.2699', 'rodolfo.verde@gmail.com', '7.6194', '4.0637', '0.0000', '1.0159', '12.6990', '2025-08-11', '12.6990', 1, 'COBRO'),
('68869bb62207b', '77', '68670bcf30676', '2025-07-27', 'REC-071-2025', 'MIKER CEBALLOS', 'JULIO DE 2025', 'P16', 'P16-A04', '0.8737', 'quinteromaikel5@gmail.com', '5.2422', '2.7958', '0.0000', '0.6990', '8.7370', '2025-08-11', '8.7370', 1, 'COBRO'),
('68869bb6671be', '78', '686707e883c4d', '2025-07-27', 'REC-072-2025', 'MAYRUMA ESPÓSITO', 'JULIO DE 2025', 'P01', 'P01-A01', '1.9870', 'mayruma2008@hotmail.com', '11.9220', '6.3584', '0.0000', '1.5896', '19.8700', '2025-08-11', '19.8700', 1, 'COBRO'),
('68869fb0aa60a', '13', '686707f0735a8', '2025-07-27', 'REC-073-2025', 'ARGELIA ARÉVALO', 'JULIO DE 2025', 'P02', 'P02-A02', '1.3003', 'argeliac7@gmail.com', '0.0000', '0.0000', '55.0000', '0.0000', '55.0000', '2025-08-11', '55.0000', 1, 'PENAL');

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
(1, '68869ba07ad6e', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(2, '68869ba07ad6e', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(3, '68869ba07ad6e', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(4, '68869ba07ad6e', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(5, '68869ba07ad6e', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(6, '68869ba07ad6e', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(7, '68869ba07ad6e', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(8, '68869ba07ad6e', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(9, '68869ba07ad6e', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(10, '68869ba0d3c74', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(11, '68869ba0d3c74', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(12, '68869ba0d3c74', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(13, '68869ba0d3c74', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(14, '68869ba0d3c74', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(15, '68869ba0d3c74', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(16, '68869ba0d3c74', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(17, '68869ba0d3c74', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(18, '68869ba0d3c74', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(19, '68869ba107e87', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(20, '68869ba107e87', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(21, '68869ba107e87', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(22, '68869ba107e87', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(23, '68869ba107e87', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(24, '68869ba107e87', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(25, '68869ba107e87', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(26, '68869ba107e87', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(27, '68869ba107e87', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(28, '68869ba14ed89', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(29, '68869ba14ed89', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(30, '68869ba14ed89', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(31, '68869ba14ed89', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(32, '68869ba14ed89', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(33, '68869ba14ed89', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(34, '68869ba14ed89', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(35, '68869ba14ed89', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(36, '68869ba14ed89', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(37, '68869ba199448', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(38, '68869ba199448', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(39, '68869ba199448', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(40, '68869ba199448', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(41, '68869ba199448', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(42, '68869ba199448', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(43, '68869ba199448', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(44, '68869ba199448', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(45, '68869ba199448', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(46, '68869ba1ed60e', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(47, '68869ba1ed60e', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(48, '68869ba1ed60e', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(49, '68869ba1ed60e', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(50, '68869ba1ed60e', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(51, '68869ba1ed60e', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(52, '68869ba1ed60e', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(53, '68869ba1ed60e', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(54, '68869ba1ed60e', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(55, '68869ba25061c', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(56, '68869ba25061c', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(57, '68869ba25061c', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(58, '68869ba25061c', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(59, '68869ba25061c', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(60, '68869ba25061c', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(61, '68869ba25061c', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(62, '68869ba25061c', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(63, '68869ba25061c', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(64, '68869ba29ac96', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(65, '68869ba29ac96', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(66, '68869ba29ac96', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(67, '68869ba29ac96', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(68, '68869ba29ac96', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(69, '68869ba29ac96', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(70, '68869ba29ac96', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(71, '68869ba29ac96', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(72, '68869ba29ac96', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(73, '68869ba2ebaa4', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(74, '68869ba2ebaa4', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(75, '68869ba2ebaa4', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(76, '68869ba2ebaa4', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(77, '68869ba2ebaa4', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(78, '68869ba2ebaa4', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(79, '68869ba2ebaa4', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(80, '68869ba2ebaa4', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(81, '68869ba2ebaa4', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(82, '68869ba353459', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(83, '68869ba353459', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(84, '68869ba353459', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(85, '68869ba353459', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(86, '68869ba353459', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(87, '68869ba353459', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(88, '68869ba353459', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(89, '68869ba353459', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(90, '68869ba353459', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(91, '68869ba3a1d91', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(92, '68869ba3a1d91', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(93, '68869ba3a1d91', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(94, '68869ba3a1d91', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(95, '68869ba3a1d91', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(96, '68869ba3a1d91', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(97, '68869ba3a1d91', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(98, '68869ba3a1d91', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(99, '68869ba3a1d91', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(100, '68869ba3e7b1d', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(101, '68869ba3e7b1d', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(102, '68869ba3e7b1d', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(103, '68869ba3e7b1d', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(104, '68869ba3e7b1d', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(105, '68869ba3e7b1d', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(106, '68869ba3e7b1d', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(107, '68869ba3e7b1d', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(108, '68869ba3e7b1d', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(109, '68869ba424840', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(110, '68869ba424840', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(111, '68869ba424840', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(112, '68869ba424840', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(113, '68869ba424840', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(114, '68869ba424840', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(115, '68869ba424840', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(116, '68869ba424840', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(117, '68869ba424840', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(118, '68869ba471222', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(119, '68869ba471222', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(120, '68869ba471222', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(121, '68869ba471222', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(122, '68869ba471222', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(123, '68869ba471222', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(124, '68869ba471222', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(125, '68869ba471222', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(126, '68869ba471222', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(127, '68869ba4c2212', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(128, '68869ba4c2212', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(129, '68869ba4c2212', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(130, '68869ba4c2212', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(131, '68869ba4c2212', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(132, '68869ba4c2212', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(133, '68869ba4c2212', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(134, '68869ba4c2212', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(135, '68869ba4c2212', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(136, '68869ba51c0d8', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(137, '68869ba51c0d8', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(138, '68869ba51c0d8', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(139, '68869ba51c0d8', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(140, '68869ba51c0d8', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(141, '68869ba51c0d8', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(142, '68869ba51c0d8', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(143, '68869ba51c0d8', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(144, '68869ba51c0d8', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(145, '68869ba564401', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '1.0597'),
(146, '68869ba564401', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '1.0597'),
(147, '68869ba564401', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '3.1790'),
(148, '68869ba564401', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '6.3579'),
(149, '68869ba564401', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '1.0597'),
(150, '68869ba564401', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '5.2983'),
(151, '68869ba564401', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '1.0597'),
(152, '68869ba564401', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.4239'),
(153, '68869ba564401', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.6954'),
(154, '68869ba59e3df', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '1.1342'),
(155, '68869ba59e3df', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '1.1342'),
(156, '68869ba59e3df', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '3.4025'),
(157, '68869ba59e3df', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '6.8049'),
(158, '68869ba59e3df', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '1.1342'),
(159, '68869ba59e3df', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '5.6708'),
(160, '68869ba59e3df', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '1.1342'),
(161, '68869ba59e3df', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.4537'),
(162, '68869ba59e3df', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.8146'),
(163, '68869ba5dcf56', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(164, '68869ba5dcf56', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(165, '68869ba5dcf56', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(166, '68869ba5dcf56', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(167, '68869ba5dcf56', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(168, '68869ba5dcf56', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(169, '68869ba5dcf56', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(170, '68869ba5dcf56', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(171, '68869ba5dcf56', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(172, '68869ba62ebe3', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(173, '68869ba62ebe3', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(174, '68869ba62ebe3', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(175, '68869ba62ebe3', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(176, '68869ba62ebe3', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(177, '68869ba62ebe3', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(178, '68869ba62ebe3', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(179, '68869ba62ebe3', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(180, '68869ba62ebe3', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(181, '68869ba68430c', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(182, '68869ba68430c', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(183, '68869ba68430c', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(184, '68869ba68430c', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(185, '68869ba68430c', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(186, '68869ba68430c', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(187, '68869ba68430c', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(188, '68869ba68430c', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(189, '68869ba68430c', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(190, '68869ba6e54eb', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(191, '68869ba6e54eb', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(192, '68869ba6e54eb', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(193, '68869ba6e54eb', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(194, '68869ba6e54eb', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(195, '68869ba6e54eb', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(196, '68869ba6e54eb', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(197, '68869ba6e54eb', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(198, '68869ba6e54eb', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(199, '68869ba733b2f', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(200, '68869ba733b2f', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(201, '68869ba733b2f', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(202, '68869ba733b2f', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(203, '68869ba733b2f', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(204, '68869ba733b2f', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(205, '68869ba733b2f', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(206, '68869ba733b2f', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(207, '68869ba733b2f', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(208, '68869ba76e1cc', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(209, '68869ba76e1cc', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(210, '68869ba76e1cc', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(211, '68869ba76e1cc', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(212, '68869ba76e1cc', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(213, '68869ba76e1cc', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(214, '68869ba76e1cc', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(215, '68869ba76e1cc', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(216, '68869ba76e1cc', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(217, '68869ba7ba165', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(218, '68869ba7ba165', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(219, '68869ba7ba165', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(220, '68869ba7ba165', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(221, '68869ba7ba165', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(222, '68869ba7ba165', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(223, '68869ba7ba165', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(224, '68869ba7ba165', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(225, '68869ba7ba165', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(226, '68869ba818385', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(227, '68869ba818385', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(228, '68869ba818385', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(229, '68869ba818385', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(230, '68869ba818385', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(231, '68869ba818385', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(232, '68869ba818385', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(233, '68869ba818385', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(234, '68869ba818385', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(235, '68869ba874f36', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(236, '68869ba874f36', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(237, '68869ba874f36', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(238, '68869ba874f36', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(239, '68869ba874f36', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(240, '68869ba874f36', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(241, '68869ba874f36', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(242, '68869ba874f36', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(243, '68869ba874f36', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(244, '68869ba8c913b', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(245, '68869ba8c913b', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(246, '68869ba8c913b', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(247, '68869ba8c913b', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(248, '68869ba8c913b', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(249, '68869ba8c913b', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(250, '68869ba8c913b', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(251, '68869ba8c913b', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(252, '68869ba8c913b', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(253, '68869ba920eaf', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(254, '68869ba920eaf', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(255, '68869ba920eaf', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(256, '68869ba920eaf', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(257, '68869ba920eaf', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(258, '68869ba920eaf', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(259, '68869ba920eaf', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(260, '68869ba920eaf', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(261, '68869ba920eaf', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(262, '68869ba9669a1', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(263, '68869ba9669a1', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(264, '68869ba9669a1', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(265, '68869ba9669a1', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(266, '68869ba9669a1', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(267, '68869ba9669a1', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(268, '68869ba9669a1', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(269, '68869ba9669a1', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(270, '68869ba9669a1', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(271, '68869ba9b3387', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(272, '68869ba9b3387', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(273, '68869ba9b3387', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(274, '68869ba9b3387', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(275, '68869ba9b3387', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(276, '68869ba9b3387', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(277, '68869ba9b3387', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(278, '68869ba9b3387', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(279, '68869ba9b3387', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(280, '68869baa05801', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(281, '68869baa05801', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(282, '68869baa05801', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(283, '68869baa05801', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(284, '68869baa05801', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(285, '68869baa05801', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(286, '68869baa05801', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(287, '68869baa05801', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(288, '68869baa05801', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(289, '68869baa4e258', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(290, '68869baa4e258', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(291, '68869baa4e258', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(292, '68869baa4e258', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(293, '68869baa4e258', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(294, '68869baa4e258', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(295, '68869baa4e258', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(296, '68869baa4e258', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(297, '68869baa4e258', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(298, '68869baaa7251', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(299, '68869baaa7251', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(300, '68869baaa7251', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(301, '68869baaa7251', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(302, '68869baaa7251', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(303, '68869baaa7251', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(304, '68869baaa7251', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(305, '68869baaa7251', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(306, '68869baaa7251', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(307, '68869baaf040c', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(308, '68869baaf040c', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(309, '68869baaf040c', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(310, '68869baaf040c', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(311, '68869baaf040c', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(312, '68869baaf040c', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(313, '68869baaf040c', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(314, '68869baaf040c', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(315, '68869baaf040c', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(316, '68869bab4ba6a', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(317, '68869bab4ba6a', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(318, '68869bab4ba6a', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(319, '68869bab4ba6a', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(320, '68869bab4ba6a', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(321, '68869bab4ba6a', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(322, '68869bab4ba6a', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(323, '68869bab4ba6a', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(324, '68869bab4ba6a', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(325, '68869bab96d13', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(326, '68869bab96d13', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(327, '68869bab96d13', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(328, '68869bab96d13', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(329, '68869bab96d13', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(330, '68869bab96d13', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(331, '68869bab96d13', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(332, '68869bab96d13', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(333, '68869bab96d13', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(334, '68869babf0c0a', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(335, '68869babf0c0a', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(336, '68869babf0c0a', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(337, '68869babf0c0a', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(338, '68869babf0c0a', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(339, '68869babf0c0a', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(340, '68869babf0c0a', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(341, '68869babf0c0a', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(342, '68869babf0c0a', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(343, '68869bac371bc', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(344, '68869bac371bc', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(345, '68869bac371bc', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(346, '68869bac371bc', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(347, '68869bac371bc', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(348, '68869bac371bc', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(349, '68869bac371bc', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(350, '68869bac371bc', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(351, '68869bac371bc', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(352, '68869bac746b5', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(353, '68869bac746b5', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(354, '68869bac746b5', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(355, '68869bac746b5', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(356, '68869bac746b5', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(357, '68869bac746b5', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(358, '68869bac746b5', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(359, '68869bac746b5', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(360, '68869bac746b5', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(361, '68869bacc2f6d', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(362, '68869bacc2f6d', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(363, '68869bacc2f6d', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(364, '68869bacc2f6d', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(365, '68869bacc2f6d', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(366, '68869bacc2f6d', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(367, '68869bacc2f6d', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(368, '68869bacc2f6d', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(369, '68869bacc2f6d', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(370, '68869bad25b78', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(371, '68869bad25b78', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(372, '68869bad25b78', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(373, '68869bad25b78', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(374, '68869bad25b78', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(375, '68869bad25b78', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(376, '68869bad25b78', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(377, '68869bad25b78', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(378, '68869bad25b78', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(379, '68869bad8199e', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(380, '68869bad8199e', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(381, '68869bad8199e', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(382, '68869bad8199e', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(383, '68869bad8199e', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(384, '68869bad8199e', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(385, '68869bad8199e', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(386, '68869bad8199e', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(387, '68869bad8199e', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(388, '68869badde553', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(389, '68869badde553', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(390, '68869badde553', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(391, '68869badde553', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(392, '68869badde553', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(393, '68869badde553', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(394, '68869badde553', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(395, '68869badde553', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(396, '68869badde553', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(397, '68869bae3f3c9', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(398, '68869bae3f3c9', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(399, '68869bae3f3c9', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(400, '68869bae3f3c9', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(401, '68869bae3f3c9', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(402, '68869bae3f3c9', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(403, '68869bae3f3c9', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(404, '68869bae3f3c9', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(405, '68869bae3f3c9', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(406, '68869bae7c8aa', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(407, '68869bae7c8aa', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(408, '68869bae7c8aa', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(409, '68869bae7c8aa', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(410, '68869bae7c8aa', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(411, '68869bae7c8aa', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(412, '68869bae7c8aa', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(413, '68869bae7c8aa', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(414, '68869bae7c8aa', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(415, '68869baecb7f5', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(416, '68869baecb7f5', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(417, '68869baecb7f5', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(418, '68869baecb7f5', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(419, '68869baecb7f5', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(420, '68869baecb7f5', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(421, '68869baecb7f5', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(422, '68869baecb7f5', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(423, '68869baecb7f5', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(424, '68869baf34365', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(425, '68869baf34365', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(426, '68869baf34365', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(427, '68869baf34365', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(428, '68869baf34365', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(429, '68869baf34365', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(430, '68869baf34365', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(431, '68869baf34365', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(432, '68869baf34365', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(433, '68869baf81975', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(434, '68869baf81975', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(435, '68869baf81975', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(436, '68869baf81975', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(437, '68869baf81975', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(438, '68869baf81975', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(439, '68869baf81975', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(440, '68869baf81975', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(441, '68869baf81975', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(442, '68869bafc4463', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(443, '68869bafc4463', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(444, '68869bafc4463', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(445, '68869bafc4463', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097');
INSERT INTO `receipts_items_data_table` (`id`, `idreceipt`, `typeexpense`, `idexpense`, `detailexpense`, `amountexpense`) VALUES
(446, '68869bafc4463', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(447, '68869bafc4463', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(448, '68869bafc4463', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(449, '68869bafc4463', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(450, '68869bafc4463', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(451, '68869bb020efe', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(452, '68869bb020efe', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(453, '68869bb020efe', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(454, '68869bb020efe', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(455, '68869bb020efe', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(456, '68869bb020efe', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(457, '68869bb020efe', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(458, '68869bb020efe', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(459, '68869bb020efe', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(460, '68869bb055d92', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(461, '68869bb055d92', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(462, '68869bb055d92', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(463, '68869bb055d92', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(464, '68869bb055d92', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(465, '68869bb055d92', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(466, '68869bb055d92', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(467, '68869bb055d92', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(468, '68869bb055d92', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(469, '68869bb099ac1', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(470, '68869bb099ac1', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(471, '68869bb099ac1', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(472, '68869bb099ac1', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(473, '68869bb099ac1', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(474, '68869bb099ac1', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(475, '68869bb099ac1', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(476, '68869bb099ac1', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(477, '68869bb099ac1', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(478, '68869bb0e068c', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(479, '68869bb0e068c', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(480, '68869bb0e068c', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(481, '68869bb0e068c', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(482, '68869bb0e068c', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(483, '68869bb0e068c', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(484, '68869bb0e068c', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(485, '68869bb0e068c', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(486, '68869bb0e068c', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(487, '68869bb12142b', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(488, '68869bb12142b', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(489, '68869bb12142b', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(490, '68869bb12142b', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(491, '68869bb12142b', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(492, '68869bb12142b', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(493, '68869bb12142b', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(494, '68869bb12142b', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(495, '68869bb12142b', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(496, '68869bb164931', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(497, '68869bb164931', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(498, '68869bb164931', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(499, '68869bb164931', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(500, '68869bb164931', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(501, '68869bb164931', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(502, '68869bb164931', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(503, '68869bb164931', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(504, '68869bb164931', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(505, '68869bb1a2f0a', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(506, '68869bb1a2f0a', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(507, '68869bb1a2f0a', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(508, '68869bb1a2f0a', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(509, '68869bb1a2f0a', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(510, '68869bb1a2f0a', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(511, '68869bb1a2f0a', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(512, '68869bb1a2f0a', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(513, '68869bb1a2f0a', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(514, '68869bb20406c', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(515, '68869bb20406c', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(516, '68869bb20406c', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(517, '68869bb20406c', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(518, '68869bb20406c', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(519, '68869bb20406c', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(520, '68869bb20406c', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(521, '68869bb20406c', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(522, '68869bb20406c', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(523, '68869bb243902', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(524, '68869bb243902', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(525, '68869bb243902', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(526, '68869bb243902', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(527, '68869bb243902', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(528, '68869bb243902', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(529, '68869bb243902', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(530, '68869bb243902', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(531, '68869bb243902', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(532, '68869bb29b04c', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(533, '68869bb29b04c', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(534, '68869bb29b04c', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(535, '68869bb29b04c', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(536, '68869bb29b04c', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(537, '68869bb29b04c', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(538, '68869bb29b04c', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(539, '68869bb29b04c', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(540, '68869bb29b04c', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(541, '68869bb2ea333', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(542, '68869bb2ea333', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(543, '68869bb2ea333', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(544, '68869bb2ea333', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(545, '68869bb2ea333', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(546, '68869bb2ea333', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(547, '68869bb2ea333', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(548, '68869bb2ea333', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(549, '68869bb2ea333', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(550, '68869bb34119a', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(551, '68869bb34119a', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(552, '68869bb34119a', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(553, '68869bb34119a', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(554, '68869bb34119a', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(555, '68869bb34119a', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(556, '68869bb34119a', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(557, '68869bb34119a', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(558, '68869bb34119a', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(559, '68869bb38e521', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(560, '68869bb38e521', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(561, '68869bb38e521', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(562, '68869bb38e521', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(563, '68869bb38e521', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(564, '68869bb38e521', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(565, '68869bb38e521', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(566, '68869bb38e521', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(567, '68869bb38e521', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(568, '68869bb3ea70e', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(569, '68869bb3ea70e', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(570, '68869bb3ea70e', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(571, '68869bb3ea70e', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(572, '68869bb3ea70e', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(573, '68869bb3ea70e', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(574, '68869bb3ea70e', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(575, '68869bb3ea70e', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(576, '68869bb3ea70e', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(577, '68869bb43f29b', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(578, '68869bb43f29b', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(579, '68869bb43f29b', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(580, '68869bb43f29b', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(581, '68869bb43f29b', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(582, '68869bb43f29b', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(583, '68869bb43f29b', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(584, '68869bb43f29b', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(585, '68869bb43f29b', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(586, '68869bb488af5', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(587, '68869bb488af5', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(588, '68869bb488af5', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(589, '68869bb488af5', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(590, '68869bb488af5', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(591, '68869bb488af5', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(592, '68869bb488af5', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(593, '68869bb488af5', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(594, '68869bb488af5', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(595, '68869bb4dda84', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(596, '68869bb4dda84', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(597, '68869bb4dda84', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(598, '68869bb4dda84', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(599, '68869bb4dda84', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(600, '68869bb4dda84', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(601, '68869bb4dda84', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(602, '68869bb4dda84', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(603, '68869bb4dda84', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(604, '68869bb52d4d4', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(605, '68869bb52d4d4', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(606, '68869bb52d4d4', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(607, '68869bb52d4d4', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(608, '68869bb52d4d4', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(609, '68869bb52d4d4', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(610, '68869bb52d4d4', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(611, '68869bb52d4d4', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(612, '68869bb52d4d4', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(613, '68869bb57c407', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6502'),
(614, '68869bb57c407', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6502'),
(615, '68869bb57c407', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9505'),
(616, '68869bb57c407', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.9009'),
(617, '68869bb57c407', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6502'),
(618, '68869bb57c407', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.2508'),
(619, '68869bb57c407', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6502'),
(620, '68869bb57c407', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2601'),
(621, '68869bb57c407', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0402'),
(622, '68869bb5d794b', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.6350'),
(623, '68869bb5d794b', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.6350'),
(624, '68869bb5d794b', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.9049'),
(625, '68869bb5d794b', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '3.8097'),
(626, '68869bb5d794b', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.6350'),
(627, '68869bb5d794b', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '3.1748'),
(628, '68869bb5d794b', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.6350'),
(629, '68869bb5d794b', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.2540'),
(630, '68869bb5d794b', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.0159'),
(631, '68869bb62207b', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.4369'),
(632, '68869bb62207b', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.4369'),
(633, '68869bb62207b', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '1.3106'),
(634, '68869bb62207b', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '2.6211'),
(635, '68869bb62207b', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.4369'),
(636, '68869bb62207b', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '2.1843'),
(637, '68869bb62207b', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.4369'),
(638, '68869bb62207b', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.1747'),
(639, '68869bb62207b', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '0.6990'),
(640, '68869bb6671be', '686926441810a', '6878fa0939958', 'PAGO DE SERVICION TELEFONICO MES DE JULIO', '0.9935'),
(641, '68869bb6671be', '686926441810a', '6878fa27a8f45', 'PAGO SERVICIO DE AGUA MES DE JULIO', '0.9935'),
(642, '68869bb6671be', '686926b35aa97', '6878f98a81a5a', 'PAGO SALARIO MES DE JULIO', '2.9805'),
(643, '68869bb6671be', '68692c9dd54e7', '6878f97b28918', 'PAGO SALARIO MES DE JULIO', '5.9610'),
(644, '68869bb6671be', '6878fabe09205', '6878faf59cae7', 'FUMIGACION DE EDIFIO', '0.9935'),
(645, '68869bb6671be', '6878f200b8acd', '6878f9bc18178', 'PAGO DE INSLACACION DE SISTEMA ADMINISTRATIVO PARA GESTION DE CONDOMINIO', '4.9675'),
(646, '68869bb6671be', '6878fb91b2125', '6878fc5b680a5', 'COMPRA DE TUBERIA DE 3/4 PARA RAPARACION DE AVERIA EN PISO 3', '0.9935'),
(647, '68869bb6671be', '6878fba244c5f', '6878fc86cfa68', 'COMPRA DE HOJAS DE MAQUINA PARA DEPARTAMENTO DE ADMINISTRACION DE CONDOMINIO', '0.3974'),
(648, '68869bb6671be', '688204b7cd9ba', '688256ae061fc', 'ALQUIRER DE SALON DE EVENTOS', '1.5896'),
(649, '68869fb0aa60a', '688204cc8e8aa', '688256ca73ff8', 'BLOQUEO DE LLAVES ', '5.0000'),
(650, '68869fb0aa60a', '688204cc8e8aa', '688257e50ee17', 'COSAS ', '50.0000');

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
(1, '', '2025-01-01', '1.0000', '1', '1.0000', '1.0000', '1.0000', 0),
(2, '', '2025-07-22', '119.2400', '31266738881', '9.7300', '11.3100', '1.5800', 0),
(3, '', '2025-07-22', '119.2400', '31266738881', '9.7300', '11.3100', '1.5800', 0),
(4, '687d7dd88776a', '2025-07-22', '119.2400', '31266738881', '9.7300', '11.3100', '1.5800', 0),
(5, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(6, '687d7dd88776a', '2025-07-22', '119.2400', '31266738881', '9.7300', '11.3100', '1.5800', 0),
(7, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(8, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(9, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(10, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(11, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(12, '687d9f45d35a8', '2025-07-22', '105.2500', '12741860737', '7.5000', '7.6000', '0.1000', 0),
(13, '687d9f45d35a8', '2025-07-22', '105.2500', '12741860737', '7.5000', '7.6000', '0.1000', 0),
(14, '687d7dd88776a', '2025-07-22', '105.2500', '12741860737', '18.8100', '11.3100', '-7.5000', 0),
(15, '687d9f45d35a8', '2025-07-22', '105.2500', '12741860737', '7.5000', '7.6000', '0.1000', 0),
(16, '687da0aada002', '2025-07-23', '0.0000', 'DIVISA', '10.0000', '11.9600', '1.9600', 1),
(17, '', '2025-01-01', '0.0000', '', '10.0000', '10.0000', '0.0000', 0),
(18, '687da0aada002', '2025-07-23', '0.0000', 'DIVISA', '10.0000', '11.9600', '1.9600', 1),
(19, '687d8617956bd', '2025-07-23', '0.0000', 'DIVISA', '5.0000', '8.0400', '3.0400', 1),
(20, '687d8617956bd', '2025-07-23', '119.2400', '31266738881', '9.7300', '3.0400', '-6.6900', 0),
(21, '687da0aada002', '2025-07-23', '119.2400', '31266738881', '6.6900', '1.9600', '-4.7300', 0),
(22, '', '2025-07-23', '119.2400', '31266738881', '4.7300', '30.0000', '25.2700', 0),
(23, '6878f97b28918', '2025-07-23', '119.2400', '31288174176', '13.1600', '30.0000', '16.8400', 0),
(24, '6878faf59cae7', '2025-07-23', '119.2400', '00000024775', '38.7900', '350.0000', '311.2100', 0),
(25, '6878f98a81a5a', '2025-07-23', '105.2500', '02300870823', '32.2100', '150.0000', '117.7900', 0),
(26, '6878f98a81a5a', '2025-07-23', '105.2500', '12740717854', '28.6900', '117.7900', '89.1000', 0);

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
(1, '1.9870'),
(2, '1.3003'),
(3, '1.2699'),
(4, '0.8737'),
(5, '2.2683'),
(6, '2.1193');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `rate_data_table`
--
ALTER TABLE `rate_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `rate_types_data_table`
--
ALTER TABLE `rate_types_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `receipts_items_data_table`
--
ALTER TABLE `receipts_items_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;

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
