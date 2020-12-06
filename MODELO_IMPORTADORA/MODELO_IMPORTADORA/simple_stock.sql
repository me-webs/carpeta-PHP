-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql311.mipropia.com
-- Tiempo de generación: 10-06-2020 a las 19:31:00
-- Versión del servidor: 5.6.47-87.0
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mipc_23207291_stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
(7, 'Arduinos', 'Arduinos', '0000-00-00 00:00:00'),
(13, 'JoyerÃ­a', 'Joyas', '2019-01-04 17:23:56'),
(5, 'Cable', 'Cable', '0000-00-00 00:00:00'),
(2, 'Transformador', 'Transformadores', '0000-00-00 00:00:00'),
(11, 'Instalaciones', 'Instalaciones', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `telefono_cliente` char(50) DEFAULT NULL,
  `email_cliente` varchar(50) DEFAULT NULL,
  `direccion_cliente` varchar(50) DEFAULT NULL,
  `status_cliente` tinyint(4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`) VALUES
(1, 'anonimus', '08002020', 'ano@nimus.com', 'anonimus', 1, '2018-07-22 13:57:27'),
(2, 'MarÃ­a Eugenia', '91074131', 'new16111987@gmail.com', 'Montevideo', 1, '2018-07-22 15:48:50'),
(8, 'S/N', 'S/N', 'sn@sn', 'S/N', 1, '2018-07-30 23:55:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `numero_factura` int(11) DEFAULT '0',
  `id_producto` int(11) DEFAULT '0',
  `cantidad` int(11) DEFAULT '0',
  `precio_venta` double DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `numero_factura`, `id_producto`, `cantidad`, `precio_venta`) VALUES
(185, 12, 88389, 1, 1200),
(184, 12, 88390, 1, 800),
(172, 6, 88390, 1, 800),
(179, 10, 88390, 1, 800),
(178, 10, 88391, 1, 1200),
(181, 11, 88390, 1, 800),
(180, 10, 88389, 1, 1200),
(183, 12, 88391, 1, 1200),
(175, 9, 88391, 2, 1200),
(182, 12, 88391, 1, 1200),
(173, 7, 88392, 1, 1200),
(177, 9, 88392, 2, 1200),
(176, 9, 88391, 2, 1200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
(0, 'INACTIVO'),
(1, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` int(11) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `condiciones` varchar(50) DEFAULT NULL,
  `total_venta` varchar(50) DEFAULT NULL,
  `estado_factura` tinyint(4) DEFAULT NULL,
  `canal` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `numero_factura`, `fecha_factura`, `id_cliente`, `id_vendedor`, `condiciones`, `total_venta`, `estado_factura`, `canal`) VALUES
(10, 10, '2019-11-14 18:08:30', 1, 5, '3', '3200', 1, '1'),
(9, 9, '2019-09-05 19:44:28', 1, 5, '1', '7200', 1, '1'),
(12, 12, '2020-04-03 09:12:34', 2, 5, '1', '4400', 1, '1'),
(7, 7, '2019-01-07 20:45:37', 1, 5, '2', '1200', 1, '1'),
(6, 6, '2019-01-06 07:29:57', 1, 5, '1', '800', 1, '1'),
(11, 11, '2020-02-07 11:12:55', 1, 4, '2', '800', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `nota` varchar(255) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `canal` varchar(107) DEFAULT NULL,
  `f_pago` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`, `canal`, `f_pago`) VALUES
(232, 88383, 6, '2018-12-27 18:16:22', 'testing eliminO por FACTURA Nro 3: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(231, 88383, 6, '2018-12-27 18:16:21', 'testing eliminO por FACTURA Nro 3: 1 producto(s) al inventario - ref TR003C4 ', 'FACTURA', 1, 'Contado', ''),
(228, 88384, 6, '2018-12-27 16:54:35', 'testing agregÃ³ 5 producto(s) al inventario - Ref: IN001C1', 'Ingreso de servicio por disponibilidad', 5, 'NEW', 'NEW'),
(229, 88384, 6, '2018-12-27 16:54:54', 'testing agregÃ³ 10 producto(s) al inventario - Ref: IN001C1', 'Ingreso de servicio por disponibilidad', 10, 'NEW', 'NEW'),
(230, 88387, 6, '2018-12-27 16:55:08', 'testing agregÃ³ 1 producto(s) al inventario - Ref: AR001C1', 'Ingreso de servicio por disponibilidad', 1, 'NEW', 'NEW'),
(233, 88385, 6, '2018-12-27 18:16:22', 'testing eliminO por FACTURA Nro 3: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(234, 88385, 6, '2018-12-27 18:17:54', 'testing eliminO por FACTURA Nro 2: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(235, 88385, 6, '2018-12-27 18:17:57', 'testing eliminO por FACTURA Nro 2: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(236, 88385, 6, '2018-12-27 18:17:57', 'testing eliminO por FACTURA Nro 2: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(237, 88385, 6, '2018-12-27 18:17:57', 'testing eliminO por FACTURA Nro 2: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(238, 88385, 6, '2018-12-27 18:17:57', 'testing eliminO por FACTURA Nro 2: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(239, 88385, 6, '2018-12-27 18:17:57', 'testing eliminO por FACTURA Nro 2: 1 producto(s) al inventario - ref TR001C1 ', 'FACTURA', 1, 'Contado', ''),
(240, 88383, 5, '2018-12-29 15:06:59', 'testing eliminO por FACTURA Nro 25: 1 producto(s) al inventario - ref TR002C5 ', 'FACTURA', 1, 'Contado', ''),
(241, 88384, 5, '2018-12-29 15:06:59', 'testing eliminO por FACTURA Nro 25: 1 producto(s) al inventario - ref TR002C5 ', 'FACTURA', 1, 'Contado', ''),
(242, 88385, 5, '2018-12-29 15:06:59', 'testing eliminO por FACTURA Nro 25: 1 producto(s) al inventario - ref TR002C5 ', 'FACTURA', 1, 'Contado', ''),
(243, 88386, 5, '2018-12-29 15:06:59', 'testing eliminO por FACTURA Nro 25: 1 producto(s) al inventario - ref TR002C5 ', 'FACTURA', 1, 'Contado', ''),
(244, 88387, 5, '2018-12-29 15:06:59', 'testing eliminO por FACTURA Nro 25: 1 producto(s) al inventario - ref TR002C5 ', 'FACTURA', 1, 'Contado', ''),
(245, 88388, 5, '2018-12-29 15:06:59', 'testing eliminO por FACTURA Nro 25: 1 producto(s) al inventario - ref TR002C5 ', 'FACTURA', 1, 'Contado', ''),
(246, 88386, 5, '2019-01-01 19:53:17', 'testing eliminO por FACTURA Nro 5: 2 producto(s) al inventario - ref CA001C5 ', 'FACTURA', 2, 'Contado', ''),
(247, 88389, 5, '2019-01-04 19:09:08', 'testing agregÃ³ 1 producto(s) al inventario', 'an001vdpl', 1, 'NEW', 'NEW'),
(248, 88390, 5, '2019-01-04 19:09:56', 'testing agregÃ³ 1 producto(s) al inventario', 'an002rjpl', 1, 'NEW', 'NEW'),
(249, 88391, 5, '2019-01-04 19:11:54', 'testing agregÃ³ 1 producto(s) al inventario', 'an003rspl', 1, 'NEW', 'NEW'),
(250, 88392, 5, '2019-01-04 19:12:26', 'testing agregÃ³ 1 producto(s) al inventario', 'an004rspl', 1, 'NEW', 'NEW'),
(251, 88392, 5, '2019-01-06 07:28:21', 'testing eliminÃ³ 1 producto(s) del inventario - Ref: an004rspl', 'prueba', 1, 'Facebook', 'CONTADO'),
(252, 88392, 5, '2019-01-06 07:28:43', 'testing agregÃ³ 1 producto(s) al inventario - Ref: an004rspl', 'prueba', 1, 'NEW', 'NEW'),
(253, 88390, 5, '2019-01-06 07:30:12', 'testing eliminO por FACTURA Nro 6: 1 producto(s) al inventario - ref an002rjpl ', 'FACTURA', 1, 'Contado', ''),
(254, 88390, 5, '2019-01-06 07:30:37', 'testing agregÃ³ 1 producto(s) al inventario - Ref: an002rjpl', 'prueba FACTURA', 1, 'NEW', 'NEW'),
(255, 88392, 5, '2019-01-07 20:45:00', 'testing agregÃ³ 1 producto(s) al inventario - Ref: an004rspl', 'EJEMPLO STREAMING', 1, 'NEW', NULL),
(256, 88392, 5, '2019-01-07 20:45:57', 'testing eliminO por FACTURA Nro 7: 1 producto(s) al inventario - ref an004rspl ', 'FACTURA', 1, 'Contado', NULL),
(257, 88391, 5, '2019-02-18 20:05:19', 'testing eliminO por FACTURA Nro 8: 1 producto(s) al inventario - ref an003rspl ', 'FACTURA', 1, 'Contado', ''),
(258, 88391, 5, '2019-02-18 20:05:33', 'testing agregÃ³ 1 producto(s) al inventario - Ref: an003rspl', 'prueba', 1, 'NEW', 'NEW'),
(259, 88391, 5, '2019-02-18 20:42:22', 'testing eliminO por FACTURA Nro 8: 1 producto(s) al inventario - ref an003rspl ', 'FACTURA', 1, 'Contado', ''),
(260, 88390, 5, '2019-02-18 21:29:02', 'testing agregÃ³ 100 producto(s) al inventario - Ref: an002rjpl', 'prueba', 100, 'NEW', 'NEW'),
(261, 88392, 5, '2019-03-24 01:53:44', 'testing eliminO por FACTURA Nro 7: 1 producto(s) al inventario - ref an004rspl ', 'FACTURA', 1, 'Contado', NULL),
(262, 88391, 5, '2019-04-09 16:21:32', 'testing eliminO por FACTURA Nro 8: 1 producto(s) al inventario - ref an003rspl ', 'FACTURA', 1, 'Contado', NULL),
(263, 88391, 5, '2019-04-26 15:31:58', 'testing eliminO por FACTURA Nro 8: 1 producto(s) al inventario - ref an003rspl ', 'FACTURA', 1, 'Contado', NULL),
(264, 88391, 5, '2019-05-01 09:30:56', 'testing eliminO por FACTURA Nro 8: 1 producto(s) al inventario - ref an003rspl ', 'FACTURA', 1, 'Contado', NULL),
(265, 88391, 5, '2019-09-05 19:44:57', 'testing eliminO por FACTURA Nro 9: 2 producto(s) al inventario - ref an003rspl ', 'FACTURA', 2, 'Contado', NULL),
(266, 88392, 5, '2019-09-05 19:44:57', 'testing eliminO por FACTURA Nro 9: 2 producto(s) al inventario - ref an003rspl ', 'FACTURA', 2, 'Contado', NULL),
(267, 88391, 5, '2019-09-05 19:44:57', 'testing eliminO por FACTURA Nro 9: 2 producto(s) al inventario - ref an003rspl ', 'FACTURA', 2, 'Contado', NULL),
(268, 88391, 5, '2019-11-17 17:39:40', 'testing eliminO por FACTURA Nro 8: 1 producto(s) al inventario - ref an003rspl ', 'FACTURA', 1, 'Contado', NULL),
(269, 88390, 5, '2020-02-06 22:41:37', 'testing eliminO por FACTURA Nro 10: 1 producto(s) al inventario - ref an001vdpl ', 'FACTURA', 1, 'Contado', NULL),
(270, 88391, 5, '2020-02-06 22:41:37', 'testing eliminO por FACTURA Nro 10: 1 producto(s) al inventario - ref an001vdpl ', 'FACTURA', 1, 'Contado', NULL),
(271, 88389, 5, '2020-02-06 22:41:37', 'testing eliminO por FACTURA Nro 10: 1 producto(s) al inventario - ref an001vdpl ', 'FACTURA', 1, 'Contado', NULL),
(272, 88391, 5, '2020-02-07 11:10:40', 'testing agregÃ³ 10 producto(s) al inventario - Ref: an003rspl', '', 10, 'NEW', 'NEW'),
(273, 88392, 5, '2020-02-07 11:11:43', 'testing agregÃ³ 12 producto(s) al inventario - Ref: an004rspl', '', 12, 'NEW', 'NEW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_talle` int(11) DEFAULT NULL,
  `modelo` char(3) DEFAULT NULL,
  `detalle` varchar(150) DEFAULT NULL,
  `codigo_barras` varchar(20) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `date_added`, `precio_producto`, `stock`, `id_categoria`, `id_talle`, `modelo`, `detalle`, `codigo_barras`, `img`, `id_estado`) VALUES
(88391, 'an003rspl', 'ANILLO PRINCESA CON GEMA ROSADA', '2019-01-04 19:11:54', 1200, 0, 13, 1, 'CHI', 'Delicado anillo, plata 925 con diseÃ±o de princesa con gema rosa.\r\n1,85 cms de diÃ¡metro.\r\n5,8 cms de circunferencia.\r\nUsado.\r\nBuen estado.\r\n', 'an003rspl', '', NULL),
(88390, 'an002rjpl', 'ANILLO DE LA ETERNIDAD CON GEMAS ROJAS', '2019-01-04 19:09:56', 800, 98, 13, 1, 'CHI', 'Delicado anillo,  plata 925 con diseÃ±o de eternidad y gema en su interior. MEDIDAS: 1,5 cms de diÃ¡metro. 4,7 cms de circunferencia. Usado.\r\nTiene to', 'an002rjpl', '', NULL),
(88389, 'an001vdpl', 'ANILLO ROMBO CON GEMA VERDE', '2019-01-04 19:09:08', 1200, 0, 13, 1, 'CHI', 'Delicado anillo plata 925 con diseÃ±o de rombo y gema en su interior.\r\n1,68 cms de diÃ¡metro.\r\n5.3 cms de circunferencia.\r\nUsado.\r\nBuen estado.', 'an001vdpl', '', NULL),
(88392, 'an004rspl', 'ANILLO OJO DE OSIRIS CON GEMA VERDE AGUA', '2019-01-04 19:12:26', 1200, 10, 13, 1, 'CHI', 'Delicado anillo, plata 925 con diseÃ±o Osiris con gema verde agua.\r\n1,7 cms de diÃ¡metro.\r\n5,3 cms de circunferencia.\r\nUsado.\r\nBuen estado.\r\n', 'an004rspl', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talles`
--

CREATE TABLE `talles` (
  `id_talle` int(11) NOT NULL,
  `nombre_talle` char(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_talle` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `talles`
--

INSERT INTO `talles` (`id_talle`, `nombre_talle`, `descripcion_talle`, `date_added`) VALUES
(1, 'c1', 'CategorÃ­a 1', '2018-06-28 01:01:01'),
(2, 'c2', 'CategorÃ­a 2', '0000-00-00 00:00:00'),
(3, 'c3', 'CategorÃ­a 3', '0000-00-00 00:00:00'),
(4, 'c4', 'CategorÃ­a 4', '0000-00-00 00:00:00'),
(5, 'c5', 'CategorÃ­a 5', '0000-00-00 00:00:00'),
(6, 'c6', 'CategorÃ­a 6', '0000-00-00 00:00:00'),
(7, 'c7', 'Categoria 7 ', '0000-00-00 00:00:00'),
(8, 'c8', 'CategorÃ­a 8', '0000-00-00 00:00:00'),
(9, 'c9', 'CategorÃ­a 9', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_tmp` int(11) DEFAULT NULL,
  `precio_tmp` double DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tmp`
--

INSERT INTO `tmp` (`id_tmp`, `id_producto`, `cantidad_tmp`, `precio_tmp`, `session_id`) VALUES
(54, 88385, 1, 501, '976b6dbbba195e549b0cd94a25280bdc'),
(55, 88383, 1, 3000, '763e9500d8817688c26f58b1d5119193'),
(56, 88383, 1, 3000, '763e9500d8817688c26f58b1d5119193'),
(112, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(111, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(110, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(116, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(117, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(118, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(119, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(120, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(121, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(122, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(123, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(124, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(125, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(126, 88391, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(127, 88389, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4'),
(128, 88392, 1, 1200, 'f42460c895d53446880bdea72ef8f4d4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`) VALUES
(4, 'adm', 'adm', 'adm', '$2y$10$H9xqsEghlCKG5.sE0SG0tOUP2zLKg/cvCZQ1okmN.26RdeCIU5pji', 'new16111987@gmal.com', '2018-06-28 01:13:20'),
(5, 'testing', 'testing', 'testing', '$2y$10$NKAZ9nXNjpDFuQ5Vb.TmO.sWbmdpWDofo7fzSsRQNlTSsykZ416AG', 'testing@testing.com', '2018-06-28 16:09:56');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `nombre_cliente` (`nombre_cliente`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `numero_factura` (`numero_factura`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `numero_factura` (`numero_factura`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_producto_2` (`id_producto`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `FK_products_estado` (`id_estado`);

--
-- Indices de la tabla `talles`
--
ALTER TABLE `talles`
  ADD PRIMARY KEY (`id_talle`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88393;

--
-- AUTO_INCREMENT de la tabla `talles`
--
ALTER TABLE `talles`
  MODIFY `id_talle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
