-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20250624.c910e1faac
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-07-2025 a las 16:31:20
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
('6867048c7287a', 'EUDES CHÁVEZ', 'V-0', 'aurajimenez0501@gmail.com', '+(58) 414-875-7142', '', 0.0000, 1),
('686704ef02be3', 'FELICIA DE AIELLO', 'V-0', 'aiello.john@yahoo.com', '+(58) 412-904-1763', '', 0.0000, 1),
('686705156466c', 'NORJUL GONZÁLEZ', 'V-0', 'norjulband@gmail.com', '+(58) 414-875-3380', '', 0.0000, 1),
('68670543ece17', 'ANA GALAVÍS', 'V-0', 'anitagalavis@gmail.com', '+(58) 414-872-7500', '', 0.0000, 1),
('6867056ad8b81', 'ANDRÉS JIMÉNEZ', 'V-0', 'ANDRESJOSEJIMENEZ@GMAIL.COM', '+(58) 000-000-0000', '', 0.0000, 1),
('686705862a2fd', 'CARMELA DE MOSSUTO', 'V-0', 'analisis.inmuebles.ori@gmail.com', '+(58) 000-000-0000', '', 0.0000, 1),
('686705b5c74cb', 'MIKER CEBALLOS', 'V-0', 'quinteromaikel5@gmail.com', '+(58) 412-193-6876', '', 0.0000, 1),
('686705dc03704', 'RODOLFO VERDE', 'V-0', 'rodolfo.verde@gmail.com', '+(58) 416-486-0443', '', 0.0000, 1),
('68670616c6115', 'ACHILLER PÉRSICO', 'V-0', 'achi3@me.com', '+(58) 000-000-0000', '', 0.0000, 1),
('6867066e51795', 'JUAN FERNÁNDEZ', 'V-0', 'juanfernandez26@hotmail.com', '+(58) 414-860-0262', '', 0.0000, 1),
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
('6867157acade9', 'EDUARDO CANELÓN', '-', 'eduardo_canelon@hotmail.com', '+(58) 414-853-3810', '', 0.0000, 1),
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
('68671f18ef50a', 'CARMEN GARCÍA', '-', 'carmen.garcia@corposistemas.net', '+(58) 414-889-2188', '', 0.0000, 1);

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
  `type` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `fixed` tinyint(1) NOT NULL DEFAULT '0',
  `expense` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `expense_accounts_data_table`
--

INSERT INTO `expense_accounts_data_table` (`id`, `type`, `code`, `fixed`, `expense`, `status`) VALUES
('6869260d82a19', 1, '1', 0, '1', 0),
('686926441810a', 3, 'SERV-02', 1, 'SERVICIO DE SUMINISTRO DE ENERGIA ELECTRICA', 1),
('686926b35aa97', 1, 'NOMI-05', 1, 'NOMINA VIGILANTE', 1),
('6869280a22d15', 4, 'SUMI-01', 0, 'COMPRA DE TUBERIA', 1),
('6869283fb8231', 4, 'SUMI-02', 0, 'COMPRA DE HERRAMIENTAS', 1),
('68692c9dd54e7', 1, 'NOMI-02', 1, 'NOMINA ADMINISTRATIVA', 1),
('68693254a580b', 3, 'SERV-03', 0, 'kjscinij', 0);

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
(13, '685698498f2f4', '685fca37cc263'),
(15, '685698498f2f4', '686468b3c1e87'),
(16, '685698498f2f4', '6865d5d3a0e00'),
(18, '6856987c2d4e2', '685f1320579a0'),
(19, '6856987c2d4e2', '685f132f33d58'),
(20, '6867c5a421535', '6861253393088'),
(22, '6856985d2b6d2', '68685896364bd'),
(23, '685698498f2f4', '68694ff24e79b');

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
('685dc00146424', 'usuario', 'Seccion de Usuarios', 0, 1),
('685f1320579a0', 'permisosperfil', 'Permisologia de Perfiles', 0, 1),
('685f132f33d58', 'permisosusuario', 'Permisologia de Usuarios', 0, 1),
('685fca37cc263', 'clientes', 'Clientes // Propietarios', 0, 1),
('6861253393088', 'tasacambiaria', 'Tasa Cambiaria', 0, 1),
('686468b3c1e87', 'unidaddepartamental', 'Unidad Departamental', 0, 1),
('6865d5d3a0e00', 'relafidu', 'Relaciones Feduciarias', 0, 1),
('68685896364bd', 'cuentagasto', 'Cuenta de Gastos', 0, 1),
('68694ff24e79b', 'proveedores', 'Proveedores', 0, 1);

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
(5, '2025-06-05', 125.0000, 1);

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
-- Estructura de tabla para la tabla `suplier_data_table`
--

CREATE TABLE `suplier_data_table` (
  `id` varchar(20) NOT NULL,
  `nameSuplier` varchar(100) NOT NULL,
  `statusSuplier` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(8, '686712cd6eb7a', '686707e883c4d'),
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
(77, '686705b5c74cb', '68670bcf30676');

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
-- Indices de la tabla `client_data_table`
--
ALTER TABLE `client_data_table`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `expense_type_data_table`
--
ALTER TABLE `expense_type_data_table`
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
-- AUTO_INCREMENT de la tabla `expense_type_data_table`
--
ALTER TABLE `expense_type_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `model_department_data_table`
--
ALTER TABLE `model_department_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `rate_data_table`
--
ALTER TABLE `rate_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rate_types_data_table`
--
ALTER TABLE `rate_types_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `unit_aliquot_data_table`
--
ALTER TABLE `unit_aliquot_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `unit_client_data_table`
--
ALTER TABLE `unit_client_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
