-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2021 a las 00:01:25
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `codIngreso` int(11) NOT NULL,
  `numeroRegistro` int(11) NOT NULL,
  `nombre` varchar(90) NOT NULL,
  `cedula` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `vehiculo` varchar(20) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `horaIngreso` varchar(20) NOT NULL,
  `numeroCeldas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`codIngreso`, `numeroRegistro`, `nombre`, `cedula`, `placa`, `vehiculo`, `fechaIngreso`, `horaIngreso`, `numeroCeldas`) VALUES
(1, 1, 'Daniela Gomez Escobar', 1053858351, 'mjk64d', 'moto', '2021-08-10', '12:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `codRegistro` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `cedula` int(11) NOT NULL,
  `vehiculo` varchar(30) NOT NULL,
  `placa` varchar(30) NOT NULL,
  `fotografia` blob NOT NULL,
  `cilindraje` int(11) NOT NULL,
  `tiempos` int(11) NOT NULL,
  `modelo` int(11) NOT NULL,
  `numeroPuertas` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `marca` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`codRegistro`, `nombre`, `cedula`, `vehiculo`, `placa`, `fotografia`, `cilindraje`, `tiempos`, `modelo`, `numeroPuertas`, `serie`, `marca`) VALUES
(1, 'Daniela Gomez Escobar', 1053858351, 'moto', 'mjk64d', '', 125, 4, 2015, 0, 0, ''),
(2, 'Daniel Fernando', 21212, '', 'rbt11d', 0x30, 250, 4, 2016, 0, 0, 'kawasaki'),
(3, 'dada', 3121, '', 'das123', 0x30, 212, 4, 3221, 0, 0, 'kawasaki');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`codIngreso`),
  ADD UNIQUE KEY `numeroRegistro` (`numeroRegistro`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`codRegistro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso-registro` FOREIGN KEY (`numeroRegistro`) REFERENCES `registro` (`codRegistro`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
