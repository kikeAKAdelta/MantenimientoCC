-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-11-2019 a las 16:14:55
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mantenimiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `idCalendario` int(11) NOT NULL,
  `codInventario` varchar(10) NOT NULL,
  `idProMant` varchar(10) NOT NULL,
  `numero` decimal(10,0) DEFAULT NULL,
  `fecha` date NOT NULL,
  `idPem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `idHerramienta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientasProcedimiento`
--

CREATE TABLE `herramientasProcedimiento` (
  `idProcedimiento` int(11) NOT NULL,
  `idHerramienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `codInventario` varchar(10) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `numeroserie` varchar(100) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `condicion` varchar(60) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `vidautil` int(11) DEFAULT NULL,
  `garantia` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `codMaterial` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `idProveedor` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materialesProcedimiento`
--

CREATE TABLE `materialesProcedimiento` (
  `idProcedimiento` int(11) NOT NULL,
  `codMaterial` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenCompra`
--

CREATE TABLE `ordenCompra` (
  `idCompra` varchar(10) NOT NULL,
  `idMaterial` varchar(10) NOT NULL,
  `idStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenTrabajo`
--

CREATE TABLE `ordenTrabajo` (
  `idOrdenTrabajo` varchar(10) NOT NULL,
  `idSolicitud` varchar(10) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasos`
--

CREATE TABLE `pasos` (
  `idPaso` int(11) NOT NULL,
  `paso` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasosProcedimientos`
--

CREATE TABLE `pasosProcedimientos` (
  `idProcedimiento` int(11) NOT NULL,
  `idPaso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pem`
--

CREATE TABLE `pem` (
  `idPem` int(10) NOT NULL,
  `idResponsable` int(11) NOT NULL,
  `idProcedimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimiento`
--

CREATE TABLE `procedimiento` (
  `idProcedimiento` int(11) NOT NULL,
  `procedimiento` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimientosMantenimiento`
--

CREATE TABLE `procedimientosMantenimiento` (
  `idProMant` varchar(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `procedimientosMantenimiento`
--

INSERT INTO `procedimientosMantenimiento` (`idProMant`, `descripcion`) VALUES
('INSP', 'INSPECCIONES'),
('MC-NP', 'MANTENIMIENTO CORRECTIVO NO PLANIFICADO'),
('MC-PL', 'MANTENIMIENTO CORRECTIVO PLANIFICADO'),
('MI', 'MANTENIMIENTO INNOVATIVO'),
('MP-BCF', 'MANTENIMIENTO PREVENTIVO BASADO EN CUENTAS FIJAS'),
('MP-BTF', 'MANTENIMIENTO PREVENTIVO BASADO EN TIEMPOS FIJOS'),
('MP-MCO', 'MANTENIMIENTO BASADO EN CONDICIONES DE OPERACION'),
('OHQD', 'OPERAR HASTA QUE EL EQUIPO FALLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE `responsables` (
  `idResponsable` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudOrdenTrabajo`
--

CREATE TABLE `solicitudOrdenTrabajo` (
  `idSolicitud` varchar(10) NOT NULL,
  `idCalendario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechasolicitud` date NOT NULL,
  `tipofalla` decimal(10,0) NOT NULL,
  `descripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `idStatus` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`idStatus`, `estado`) VALUES
(1, 'EN PROCESO'),
(2, 'COMPLETADO'),
(3, 'CANCELADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(250) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`idCalendario`),
  ADD KEY `codInventario` (`codInventario`),
  ADD KEY `idProMant` (`idProMant`),
  ADD KEY `idPem` (`idPem`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`idHerramienta`);

--
-- Indices de la tabla `herramientasProcedimiento`
--
ALTER TABLE `herramientasProcedimiento`
  ADD PRIMARY KEY (`idProcedimiento`,`idHerramienta`),
  ADD KEY `idHerramienta` (`idHerramienta`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`codInventario`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`codMaterial`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `materialesProcedimiento`
--
ALTER TABLE `materialesProcedimiento`
  ADD PRIMARY KEY (`idProcedimiento`,`codMaterial`),
  ADD KEY `codMaterial` (`codMaterial`);

--
-- Indices de la tabla `ordenCompra`
--
ALTER TABLE `ordenCompra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idStatus` (`idStatus`);

--
-- Indices de la tabla `ordenTrabajo`
--
ALTER TABLE `ordenTrabajo`
  ADD PRIMARY KEY (`idOrdenTrabajo`),
  ADD KEY `idSolicitud` (`idSolicitud`),
  ADD KEY `idStatus` (`idStatus`);

--
-- Indices de la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD PRIMARY KEY (`idPaso`);

--
-- Indices de la tabla `pasosProcedimientos`
--
ALTER TABLE `pasosProcedimientos`
  ADD PRIMARY KEY (`idProcedimiento`,`idPaso`),
  ADD KEY `idPaso` (`idPaso`);

--
-- Indices de la tabla `pem`
--
ALTER TABLE `pem`
  ADD PRIMARY KEY (`idPem`),
  ADD UNIQUE KEY `idResponsable` (`idResponsable`),
  ADD KEY `idProcedimiento` (`idProcedimiento`);

--
-- Indices de la tabla `procedimiento`
--
ALTER TABLE `procedimiento`
  ADD PRIMARY KEY (`idProcedimiento`);

--
-- Indices de la tabla `procedimientosMantenimiento`
--
ALTER TABLE `procedimientosMantenimiento`
  ADD PRIMARY KEY (`idProMant`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`idResponsable`);

--
-- Indices de la tabla `solicitudOrdenTrabajo`
--
ALTER TABLE `solicitudOrdenTrabajo`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idCalendario` (`idCalendario`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pasos`
--
ALTER TABLE `pasos`
  MODIFY `idPaso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pem`
--
ALTER TABLE `pem`
  MODIFY `idPem` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `procedimiento`
--
ALTER TABLE `procedimiento`
  MODIFY `idProcedimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `idResponsable` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD CONSTRAINT `calendario_ibfk_1` FOREIGN KEY (`codInventario`) REFERENCES `inventario` (`codInventario`),
  ADD CONSTRAINT `calendario_ibfk_2` FOREIGN KEY (`idProMant`) REFERENCES `procedimientosMantenimiento` (`idProMant`),
  ADD CONSTRAINT `calendario_ibfk_3` FOREIGN KEY (`idPem`) REFERENCES `pem` (`idPem`);

--
-- Filtros para la tabla `herramientasProcedimiento`
--
ALTER TABLE `herramientasProcedimiento`
  ADD CONSTRAINT `herramientasProcedimiento_ibfk_1` FOREIGN KEY (`idHerramienta`) REFERENCES `herramientas` (`idHerramienta`),
  ADD CONSTRAINT `herramientasProcedimiento_ibfk_2` FOREIGN KEY (`idProcedimiento`) REFERENCES `procedimiento` (`idProcedimiento`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`);

--
-- Filtros para la tabla `materialesProcedimiento`
--
ALTER TABLE `materialesProcedimiento`
  ADD CONSTRAINT `materialesProcedimiento_ibfk_1` FOREIGN KEY (`codMaterial`) REFERENCES `materiales` (`codMaterial`),
  ADD CONSTRAINT `materialesProcedimiento_ibfk_2` FOREIGN KEY (`idProcedimiento`) REFERENCES `procedimiento` (`idProcedimiento`);

--
-- Filtros para la tabla `ordenCompra`
--
ALTER TABLE `ordenCompra`
  ADD CONSTRAINT `ordenCompra_ibfk_1` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`);

--
-- Filtros para la tabla `ordenTrabajo`
--
ALTER TABLE `ordenTrabajo`
  ADD CONSTRAINT `ordenTrabajo_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudOrdenTrabajo` (`idSolicitud`),
  ADD CONSTRAINT `ordenTrabajo_ibfk_2` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`);

--
-- Filtros para la tabla `pasosProcedimientos`
--
ALTER TABLE `pasosProcedimientos`
  ADD CONSTRAINT `pasosProcedimientos_ibfk_1` FOREIGN KEY (`idPaso`) REFERENCES `pasos` (`idPaso`),
  ADD CONSTRAINT `pasosProcedimientos_ibfk_2` FOREIGN KEY (`idProcedimiento`) REFERENCES `procedimiento` (`idProcedimiento`);

--
-- Filtros para la tabla `pem`
--
ALTER TABLE `pem`
  ADD CONSTRAINT `pem_ibfk_1` FOREIGN KEY (`idProcedimiento`) REFERENCES `procedimiento` (`idProcedimiento`),
  ADD CONSTRAINT `pem_ibfk_2` FOREIGN KEY (`idResponsable`) REFERENCES `responsables` (`idResponsable`);

--
-- Filtros para la tabla `solicitudOrdenTrabajo`
--
ALTER TABLE `solicitudOrdenTrabajo`
  ADD CONSTRAINT `solicitudOrdenTrabajo_ibfk_1` FOREIGN KEY (`idCalendario`) REFERENCES `calendario` (`idCalendario`),
  ADD CONSTRAINT `solicitudOrdenTrabajo_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
