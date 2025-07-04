-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-07-2025 a las 19:43:04
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
('685ffa345a725', 'jose canseco', 'V-14587965', 'jova@go.com', '+(58) 412-952-4758', '', 0.0000, 0),
('685ffb29dbf82', 'Jovaani Daniel Franco Mujica', 'V-20975144', 'jovannifranco@gmail.com', '+(58) 424-926-5304', '0', 0.0000, 1),
('68619e027dba2', '', '', '', '', '', 0.0000, 0);

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
('6856987c2d4e2', 'Gestion de Seguridad', 'Seguridad', 1, 1);

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
(14, '685698498f2f4', '6861253393088'),
(15, '685698498f2f4', '686468b3c1e87'),
(16, '685698498f2f4', '6865d5d3a0e00'),
(18, '6856987c2d4e2', '685f1320579a0'),
(19, '6856987c2d4e2', '685f132f33d58');

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
('6865d5d3a0e00', 'relafidu', 'Relaciones Feduciarias', 0, 1);

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
(5, '2025-06-05', '125.0000', 1);

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
('68657b91c3c47', 'P01-A01', 2, 1, 1, 1),
('6865bfb8e72a5', 'PB-A01', 1, 2, 1, 1),
('6865c044884c4', 'P01-A02', 2, 2, 1, 1),
('6865caaee6611', 'P01-B01', 2, 1, 1, 1),
('6865cb0e1a922', 'P01-A01', 2, 1, 1, 1);

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
-- Indices de la tabla `department_data_table`
--
ALTER TABLE `department_data_table`
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
-- AUTO_INCREMENT de la tabla `model_department_data_table`
--
ALTER TABLE `model_department_data_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
