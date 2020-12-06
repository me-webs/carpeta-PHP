-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para simple_zapateria
CREATE DATABASE IF NOT EXISTS `simple_zapateria` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `simple_zapateria`;


-- Volcando estructura para tabla simple_zapateria.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(255) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla simple_zapateria.categorias: 4 rows
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
	(18, 'Naranja', 'nj', '2020-06-19 04:27:32'),
	(16, 'Azul', 'az', '2020-06-19 01:48:14'),
	(17, 'Negro', 'ng', '2020-06-19 01:48:23'),
	(15, 'Rojo', 'rj', '2020-06-19 01:48:04');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `telefono_cliente` char(50) DEFAULT NULL,
  `email_cliente` varchar(50) DEFAULT NULL,
  `direccion_cliente` varchar(50) DEFAULT NULL,
  `status_cliente` tinyint(4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `nombre_cliente` (`nombre_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_zapateria.clientes: 2 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`) VALUES
	(1, 'anonimus', '08002020', 'ano@nimus.com', 'anonimus', 1, '2018-07-22 13:57:27'),
	(8, 'S/N', 'S/N', 'sn@sn', 'S/N', 1, '2018-07-30 23:55:11');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.detalle_factura
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) DEFAULT 0,
  `id_producto` int(11) DEFAULT 0,
  `cantidad` int(11) DEFAULT 0,
  `precio_venta` double DEFAULT 0,
  PRIMARY KEY (`id_detalle`),
  KEY `id_producto` (`id_producto`),
  KEY `numero_factura` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_zapateria.detalle_factura: 4 rows
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` (`id_detalle`, `numero_factura`, `id_producto`, `cantidad`, `precio_venta`) VALUES
	(191, 4, 88403, 5, 4500),
	(190, 3, 88402, 1, 650),
	(189, 2, 88394, 1, 3500),
	(188, 1, 88393, 1, 3500);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla simple_zapateria.estado: 2 rows
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
	(0, 'INACTIVO'),
	(1, 'ACTIVO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `condiciones` varchar(50) DEFAULT NULL,
  `total_venta` varchar(50) DEFAULT NULL,
  `estado_factura` tinyint(4) DEFAULT NULL,
  `canal` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_factura` (`numero_factura`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_zapateria.facturas: 4 rows
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`id_factura`, `numero_factura`, `fecha_factura`, `id_cliente`, `id_vendedor`, `condiciones`, `total_venta`, `estado_factura`, `canal`) VALUES
	(18, 4, '2020-06-19 04:31:35', 1, 5, '1', '27450', 1, '1'),
	(17, 3, '2020-06-19 03:38:10', 1, 5, '1', '793', 0, '1'),
	(16, 2, '2020-06-19 03:09:15', 1, 5, '2', '4270', 1, '1'),
	(15, 1, '2020-06-19 03:05:46', 1, 5, '1', '4270', 1, '1');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.historial
CREATE TABLE IF NOT EXISTS `historial` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `nota` varchar(255) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `canal` varchar(107) DEFAULT NULL,
  `f_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_producto` (`id_producto`),
  KEY `id_producto_2` (`id_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_zapateria.historial: 9 rows
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`, `canal`, `f_pago`) VALUES
	(285, 88403, 5, '2020-06-19 04:33:14', 'testing eliminó 1 producto(s) del inventario - Ref: z012ngt9', 'perdida stock', 1, 'Local', NULL),
	(284, 88403, 5, '2020-06-19 04:32:00', 'testing eliminO por FACTURA Nro 18: 5 producto(s) al inventario - ref z012ngt9 ', 'FACTURA', 5, 'Contado', NULL),
	(283, 88403, 5, '2020-06-19 04:29:36', 'testing agregó 15 producto(s) al inventario', 'z012ngt9', 15, 'NEW', NULL),
	(282, 88394, 5, '2020-06-19 03:38:39', 'testing eliminO por FACTURA Nro 16: 1 producto(s) al inventario - ref z002ngt9 ', 'FACTURA', 1, 'Contado', NULL),
	(281, 88402, 5, '2020-06-19 03:34:21', 'testing agregó 5 producto(s) al inventario', 'z010az09', 5, 'NEW', NULL),
	(280, 88393, 5, '2020-06-19 03:09:29', 'testing eliminO por FACTURA Nro 15: 1 producto(s) al inventario - ref z001ngt8 ', 'FACTURA', 1, 'Contado', NULL),
	(279, 88395, 5, '2020-06-19 03:00:25', 'testing agregó 6 producto(s) al inventario', 'z003azt6', 6, 'NEW', NULL),
	(278, 88394, 5, '2020-06-19 02:50:52', 'testing agregó 5 producto(s) al inventario', 'z002ngt9', 5, 'NEW', NULL),
	(277, 88393, 5, '2020-06-19 02:49:27', 'testing agregó 13 producto(s) al inventario', 'z001ngt8', 13, 'NEW', NULL);
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.products
CREATE TABLE IF NOT EXISTS `products` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_talle` int(11) DEFAULT NULL,
  `modelo` varchar(40) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  `codigo_barras` varchar(20) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_producto` (`codigo_producto`),
  KEY `FK_products_estado` (`id_estado`)
) ENGINE=MyISAM AUTO_INCREMENT=88404 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla simple_zapateria.products: 11 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `date_added`, `precio_producto`, `stock`, `id_categoria`, `id_talle`, `modelo`, `detalle`, `codigo_barras`, `img`, `id_estado`) VALUES
	(88397, 'z006ngt0', 'Zapato Vestir', '2020-06-19 03:21:06', 1333, 3, 17, 19, 'Mod', 'Taco aguja', '333444555', '', 1),
	(88398, 'z005ngt0', 'Zapato Vestir Combinado', '2020-06-19 03:26:46', 1333, 3, 17, 19, 'Mod', 'Taco aguja', '333444555', '', 1),
	(88399, 'z007ngt6', 'Zapato Vestir Combinado', '2020-06-19 03:27:46', 1333, 3, 17, 17, 'Mod', 'Taco aguja', '333444555', '', 1),
	(88400, 'z008ngt6', 'Zapato Vestir Combinado', '2020-06-19 03:29:21', 1333, 3, 17, 17, 'Mod', 'Taco aguja', '333444555', '', 1),
	(88393, 'z001ngt8', 'Zapato Mocasine Lux', '2020-06-19 02:49:27', 3500, 12, 17, 16, 'Mod', 'Cuero acabado con decoración. ', '111222333', '', 1),
	(88394, 'z002ngt9', 'Zapato Mocasine Lux', '2020-06-19 02:50:52', 3500, 4, 17, 18, 'Gen', 'Cuero negro con decoración', '111222332', '', 1),
	(88395, 'z003azt6', 'Zapato Casual', '2020-06-19 03:00:25', 2000, 6, 16, 17, 'Sin', 'En tela con suela de goma.', 'Código Barras', '', 1),
	(88396, 'z004rjt7', 'Zapato Casual Rojo', '2020-06-19 03:03:55', 1500, 3, 15, 15, 'Sin', 'Zapato de diseño combinado en tela y cuero.', '111222444', '', 1),
	(88401, 'z009az09', 'Zapato Mocasine', '2020-06-19 03:31:28', 650, 5, 16, 18, 'Elegante', 'Mocasine', '111666555', '', 1),
	(88402, 'z010az09', 'Zapato Mocasine', '2020-06-19 03:34:21', 650, 5, 16, 18, 'Elegante', 'Mocasine', '111666555', '', 1),
	(88403, 'z012ngt9', 'Zapato Negro Mocasine', '2020-06-19 04:29:36', 4500, 9, 17, 18, 'Modelo Exclusivo', 'En cuero.', '666999888', '', 1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.talles
CREATE TABLE IF NOT EXISTS `talles` (
  `id_talle` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_talle` char(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_talle` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id_talle`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla simple_zapateria.talles: 7 rows
/*!40000 ALTER TABLE `talles` DISABLE KEYS */;
INSERT INTO `talles` (`id_talle`, `nombre_talle`, `descripcion_talle`, `date_added`) VALUES
	(21, '41', 't1', '2020-06-19 04:27:46'),
	(20, '35', 't5', '2020-06-19 02:21:58'),
	(19, '40', 't0', '2020-06-19 02:21:50'),
	(18, '39', 't9', '2020-06-19 02:21:45'),
	(17, '36', 't6', '2020-06-19 02:21:38'),
	(16, '38', 't8', '2020-06-19 02:21:33'),
	(15, '37', 't7', '2020-06-19 02:21:27');
/*!40000 ALTER TABLE `talles` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.tmp
CREATE TABLE IF NOT EXISTS `tmp` (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_tmp` int(11) DEFAULT NULL,
  `precio_tmp` double DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tmp`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_zapateria.tmp: 1 rows
/*!40000 ALTER TABLE `tmp` DISABLE KEYS */;
INSERT INTO `tmp` (`id_tmp`, `id_producto`, `cantidad_tmp`, `precio_tmp`, `session_id`) VALUES
	(150, 88397, 1, 1333, '6j2d62618g075pit7meq099fvn');
/*!40000 ALTER TABLE `tmp` ENABLE KEYS */;


-- Volcando estructura para tabla simple_zapateria.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

-- Volcando datos para la tabla simple_zapateria.users: 2 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`) VALUES
	(4, 'adm', 'adm', 'adm', '$2y$10$H9xqsEghlCKG5.sE0SG0tOUP2zLKg/cvCZQ1okmN.26RdeCIU5pji', 'new16111987@gmal.com', '2018-06-28 01:13:20'),
	(5, 'testing', 'testing', 'testing', '$2y$10$NKAZ9nXNjpDFuQ5Vb.TmO.sWbmdpWDofo7fzSsRQNlTSsykZ416AG', 'testing@testing.com', '2018-06-28 16:09:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
