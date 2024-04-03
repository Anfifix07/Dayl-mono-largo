-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2024 a las 23:38:47
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dayl2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoria', 7, 'add_categoria'),
(26, 'Can change categoria', 7, 'change_categoria'),
(27, 'Can delete categoria', 7, 'delete_categoria'),
(28, 'Can view categoria', 7, 'view_categoria'),
(29, 'Can add proveedor', 8, 'add_proveedor'),
(30, 'Can change proveedor', 8, 'change_proveedor'),
(31, 'Can delete proveedor', 8, 'delete_proveedor'),
(32, 'Can view proveedor', 8, 'view_proveedor'),
(33, 'Can add subcategoria', 9, 'add_subcategoria'),
(34, 'Can change subcategoria', 9, 'change_subcategoria'),
(35, 'Can delete subcategoria', 9, 'delete_subcategoria'),
(36, 'Can view subcategoria', 9, 'view_subcategoria'),
(37, 'Can add producto', 10, 'add_producto'),
(38, 'Can change producto', 10, 'change_producto'),
(39, 'Can delete producto', 10, 'delete_producto'),
(40, 'Can view producto', 10, 'view_producto'),
(41, 'Can add color', 11, 'add_color'),
(42, 'Can change color', 11, 'change_color'),
(43, 'Can delete color', 11, 'delete_color'),
(44, 'Can view color', 11, 'view_color'),
(45, 'Can add cliente', 12, 'add_cliente'),
(46, 'Can change cliente', 12, 'change_cliente'),
(47, 'Can delete cliente', 12, 'delete_cliente'),
(48, 'Can view cliente', 12, 'view_cliente'),
(49, 'Can add metodos pago', 13, 'add_metodospago'),
(50, 'Can change metodos pago', 13, 'change_metodospago'),
(51, 'Can delete metodos pago', 13, 'delete_metodospago'),
(52, 'Can view metodos pago', 13, 'view_metodospago'),
(53, 'Can add factura', 14, 'add_factura'),
(54, 'Can change factura', 14, 'change_factura'),
(55, 'Can delete factura', 14, 'delete_factura'),
(56, 'Can view factura', 14, 'view_factura'),
(57, 'Can add detalle factura', 15, 'add_detallefactura'),
(58, 'Can change detalle factura', 15, 'change_detallefactura'),
(59, 'Can delete detalle factura', 15, 'delete_detallefactura'),
(60, 'Can view detalle factura', 15, 'view_detallefactura'),
(61, 'Can add pedidos', 16, 'add_pedidos'),
(62, 'Can change pedidos', 16, 'change_pedidos'),
(63, 'Can delete pedidos', 16, 'delete_pedidos'),
(64, 'Can view pedidos', 16, 'view_pedidos'),
(65, 'Can add PayPal IPN', 17, 'add_paypalipn'),
(66, 'Can change PayPal IPN', 17, 'change_paypalipn'),
(67, 'Can delete PayPal IPN', 17, 'delete_paypalipn'),
(68, 'Can view PayPal IPN', 17, 'view_paypalipn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$LvgDYsnp6OAsHrsWhOqqht$UcguiSRzn1iefs8cdG7Vs+CBx3G0xl7uTh9fX9+NYgQ=', '2024-04-01 18:31:41.061439', 1, 'admin', '', '', '', 1, 1, '2024-02-07 15:31:12.293062'),
(2, 'pbkdf2_sha256$600000$ubSYIuknEvCg84Ut7wT08O$K5EsEFNSt3iVO0AHnQ3JHygKytM2r1gs0qH4YN3g604=', '2024-04-01 16:25:56.790552', 0, 'alejo-largo@hotmail.com', 'Jorge Alejandro', '', 'alejo-largo@hotmail.com', 0, 1, '2024-02-07 17:26:55.455600'),
(3, 'pbkdf2_sha256$600000$yHwPcLwi4NmhShPM3OOXiq$84pmi5+mtGepMWB9n55yHbltDFdaIAt1IA/esxw3aB0=', '2024-02-26 12:36:58.590582', 1, 'dayl@dayl.com', 'Dayl Admin', '', 'dayl@dayl.com', 1, 1, '2024-02-18 15:12:51.297068'),
(4, 'pbkdf2_sha256$600000$9UGxbAYIa0s3K5oquKRFIz$tgG/dLbeUPg9VofXNJhdglZbcBE17rDPj44Ms3iKj1I=', '2024-02-26 12:58:24.847742', 1, 'hdmaya@misena.edu.co', 'herctor maya', '', 'hdmaya@misena.edu.co', 0, 1, '2024-02-26 12:41:11.013447');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `imagen`) VALUES
(1, 'Jugueteria', 'imagen/productos/2ad26036405c42538da45171942d0c46.png'),
(2, 'Piñateria', 'imagen/productos/8637336673544fceb869cdffe9989a90.png'),
(5, 'Pruebas SENA', 'imagen/productos/99a29fed379a4394bfdbbd52c9ddb9a8.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `casa_apto` varchar(10) DEFAULT NULL,
  `ciudad` varchar(30) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `departamento` varchar(50) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tipo_persona` varchar(50) NOT NULL,
  `tipo_via` varchar(3) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `casa_apto`, `ciudad`, `complemento`, `departamento`, `descripcion`, `nit`, `nombre`, `numero`, `telefono`, `tipo_persona`, `tipo_via`, `user_id`) VALUES
(1, '3', 'Medellín', '88B-29', 'AMZ', 'Pedregal Medellin', NULL, 'Jorge Alejandro', '78c', '+573148847522', 'Natural', 'CLL', 2),
(2, '0', 'Medellín', '88B-29', 'ANT', 'Pedregal Medellin', NULL, 'Dayl Admin', '78c', '+573148847522', 'Natural', 'CRR', 3),
(3, '45', 'MEdellin', '56', 'ANT', 'sol asi', '342542532', 'herctor maya', '45', '32156455', 'Natural', 'CLL', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` bigint(20) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `color` varchar(26) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `imagen`, `color`, `stock`, `producto_id`) VALUES
(1, 'imagen/productos/0434118bf186470abc26abcfd16d6ff1.png', 'Circulo', 10, 1),
(2, 'imagen/productos/742ac020d849409ab1569d32bd559fcd.png', 'Among-us', 15, 1),
(3, 'imagen/productos/e166d87b562b4c8fa2ecefc4c080fd68.png', 'Corazon', 12, 1),
(4, 'imagen/productos/e410e2dabf2449bea6f089915167b341.png', 'Caballeros de plastico', 17, 2),
(5, 'imagen/productos/594978a1f439426da929ec2f072f65ed.png', 'Papa Noel', 8, 3),
(6, 'imagen/productos/f6e41b1309c24f2db2572fd21ec4d3d7.png', 'Hawaiano', 6, 3),
(7, 'imagen/productos/f8d3b5770113454d99629ad3fe98a76e.png', 'Pibe Valderrama', 18, 3),
(8, 'imagen/productos/9c99497a535a42fdbe65763d8f6131d4.png', 'Azul', 15, 4),
(9, 'imagen/productos/329f710cae864d93bbb6ae54eb20fc91.png', 'Variado', 18, 5),
(10, 'imagen/productos/c2c0bc49e39149c7a1fb046cf8fdd038.jpg', 'Cereza', 25, 6),
(11, 'imagen/productos/e3d24a791cbc48d8ae9065e49f0b1eb9.jpg', 'Menta', 15, 6),
(15, 'imagen/productos/5cd982708af643e380b68e823e81bf00.jpg', 'trans', 94, 14),
(16, 'imagen/productos/d735039223084070a6919bf4e600e203.jpg', 'trans', 34, 15),
(17, 'imagen/productos/b0dc2cb46c7b48c2a8c2acbc40ed816f.jpg', 'variado', 36, 16),
(18, 'imagen/productos/0696f9ace0844b96b8b4a9c5be2bf61e.jpg', 'azul', 123, 17),
(19, 'imagen/productos/6890d71e6fe246ad8f6332c64639cb42.jpg', 'trans', 32, 18),
(20, 'imagen/productos/0841b046fa294b17aac96e9f7167d57e.jpg', 'trans', 83, 19),
(21, 'imagen/productos/763e6286921e4512bba8529a22ebec2c.jpg', 'rojo', 50, 20),
(22, 'imagen/productos/b314062a78734b2787e28a4c3e54de5b.jpg', 'variado', 68, 21),
(23, 'imagen/productos/51e511e4677141f0b326899641e73d7c.jpg', 'azul', 96, 22),
(24, 'imagen/productos/b4550e9a21f547ba867a25cef9ec6acc.jpg', 'rojo', 89, 23),
(25, 'imagen/productos/f32cdfc8e2fe4f6e97b2cb54dd9f624e.jpg', 'variado', 65, 24),
(26, 'imagen/productos/92f03476f8ff4839b25fe462462cddec.jpg', 'variado', 52, 25),
(27, 'imagen/productos/b60ff511ba4243c78b1c811d8364b5a3.jpg', 'azul', 61, 26),
(28, 'imagen/productos/8f4d7c3da89443f2a2a427c1acd7a65c.jpg', 'rojo', 105, 27),
(29, 'imagen/productos/6c30ea8dda604e74a802502aa484700c.jpg', 'azul', 110, 28),
(30, 'imagen/productos/2f29d5a47ef94f41855c80ffed4c6b98.jpg', 'trans', 78, 29),
(31, 'imagen/productos/f26fb9f468194a2b82b9e1c482ab9d67.jpg', 'trans', 88, 30),
(32, 'imagen/productos/369125e3b55a48b0ab55cdd7c2e6ea38.jpg', 'variado', 54, 31),
(33, 'imagen/productos/8c169a9278064f9b90a4af734f7f5252.jpg', 'rojo', 140, 32),
(34, 'imagen/productos/d1626e63023d4241b367a359ddef0557.jpg', 'variado', 133, 33),
(35, 'imagen/productos/16b9eb2bad634ff0b47e8c312127385b.jpg', 'rojo', 146, 34),
(36, 'imagen/productos/8c38dc09d57c4cd3a8e1205c5a6dab95.jpg', 'azul', 26, 35),
(37, 'imagen/productos/6d94cfd48f4d470c99748b13e57a53fd.jpg', 'azul', 113, 36),
(38, 'imagen/productos/a676eb1e365244f5914706da18019689.jpg', 'variado', 47, 37),
(39, 'imagen/productos/d2730903b8234c8ca2ef11d12a96c742.jpg', 'trans', 131, 38),
(40, 'imagen/productos/252f886fb410402893894d6b22e3576b.jpg', 'trans', 17, 39),
(41, 'imagen/productos/984453097ba54b32b1d4285345ff66bd.jpg', 'azul', 54, 40),
(42, 'imagen/productos/fc45b45b047a4d0f832a62e499eb7a3e.jpg', 'rojo', 7, 41),
(43, 'imagen/productos/098ecf167c4d452b99cf25aad61c7085.jpg', 'azul', 54, 42),
(44, 'imagen/productos/6a1a13f0862840799f3727870233f3f2.jpg', 'azul', 140, 43),
(45, 'imagen/productos/c9f0c3cd5515462b812e35ee21c548f5.jpg', 'rojo', 30, 44),
(46, 'imagen/productos/b299d4c772fc4a239bfc7e0568229036.jpg', 'rojo', 106, 45),
(47, 'imagen/productos/b9f47b3c247641589aca6898d3c769cb.jpg', 'trans', 136, 46),
(48, 'imagen/productos/df455e3142c34bfea3099582ce172676.jpg', 'variado', 68, 47),
(49, 'imagen/productos/b550205d00024df79025f60cbdf70003.jpg', 'rojo', 39, 48),
(50, 'imagen/productos/86bc2af1e6de445b9cc30dbd8fd93519.jpg', 'azul', 107, 49),
(51, 'imagen/productos/26b02e4e119448639b2241cbf3a56cff.jpg', 'trans', 20, 50),
(52, 'imagen/productos/f67fffc9efbf41ca8e21e3b00bb668e2.jpg', 'rojo', 55, 51),
(53, 'imagen/productos/6e66d662a80a4d2abbe906770aa29892.jpg', 'azul', 84, 52),
(54, 'imagen/productos/bc6bc758671e4f3f917060421d52ea0c.jpg', 'variado', 21, 53),
(55, 'imagen/productos/2633fa868b6941d9a579225890ef3fda.jpg', 'rojo', 148, 54),
(56, 'imagen/productos/1b846e889fe74fab9bdfe7ec0eefc2b0.jpg', 'variado', 150, 55),
(57, 'imagen/productos/09aadc4255544d119cd83817ce8fbd89.jpg', 'rojo', 2, 56),
(58, 'imagen/productos/7f8af10eb1824316a31aa9f5933dfc9a.jpg', 'rojo', 96, 57),
(59, 'imagen/productos/077f514b83bc4dc3a398c93c91cb9ed5.jpg', 'rojo', 72, 58),
(60, 'imagen/productos/078d89dd6b8e47dca79352cd84c3be14.jpg', 'variado', 50, 59),
(61, 'imagen/productos/785e43cb7d444bd8ad38ab22e7775db6.jpg', 'variado', 25, 60),
(62, 'imagen/productos/9d61456bcc6340338a9fcf1a81f4c9c0.jpg', 'azul', 46, 61),
(63, 'imagen/productos/a252e2a00baf4c92879bac43b830dd97.jpg', 'azul', 132, 62),
(64, 'imagen/productos/f748cbd0b6b44f44a929d0cc2f5bf719.jpg', 'azul', 128, 63),
(65, 'imagen/productos/7c87f67bfd6744a88e02dfe46003cf02.jpg', 'variado', 6, 64),
(66, 'imagen/productos/f0cf3e4c329c4747b912f878d8386f6a.jpg', 'trans', 136, 65),
(67, 'imagen/productos/330387fb908c44e38d319d340e540613.jpg', 'trans', 6, 66),
(68, 'imagen/productos/97b3dc6f56dd4dadb488b1d9c2c96e2d.jpg', 'variado', 20, 67),
(69, 'imagen/productos/72fcdd22c0c54430b4f95a0c3e31da8c.jpg', 'rojo', 68, 68),
(70, 'imagen/productos/06599b83239a42659df558204f02a118.jpg', 'trans', 137, 69),
(71, 'imagen/productos/fe7a9c99123c415f898d9d08e8b93b63.jpg', 'trans', 129, 70),
(72, 'imagen/productos/5625abcd5cc7415ab3578f7b1dd360cd.jpg', 'rojo', 91, 71),
(73, 'imagen/productos/aa3566e071b04825b1d2f2c1071f96fc.jpg', 'azul', 95, 72),
(74, 'imagen/productos/207492b41727452fa1deba3f66d50880.jpg', 'rojo', 142, 73),
(75, 'imagen/productos/a9b80bf4d37943cfaa39f98ed12569bb.jpg', 'rojo', 61, 74),
(76, 'imagen/productos/dc23009b62ad43a8b034d4d76a0845b7.jpg', 'rojo', 94, 75),
(77, 'imagen/productos/fe3b29c8981648cbaf1226c8eaf87c59.jpg', 'trans', 24, 76),
(78, 'imagen/productos/7ec82327d6f14ba782269cc44aedecbb.jpg', 'trans', 46, 77),
(79, 'imagen/productos/00ab8dd402444aa0932ed6d4f5bc581c.jpg', 'variado', 77, 78),
(80, 'imagen/productos/9dae24109f344fc4b5c2d419ae20263d.jpg', 'rojo', 111, 79),
(81, 'imagen/productos/9b06b1c46ec545db9996058b8cc2969e.jpg', 'rojo', 17, 80),
(82, 'imagen/productos/2bd170f183b54b6f877d196053b753bd.jpg', 'trans', 27, 81),
(83, 'imagen/productos/8fef433330874e5ca9acf9de2e763863.jpg', 'azul', 101, 82),
(84, 'imagen/productos/5ea9c701402c461f846985d477e44cc2.jpg', 'trans', 43, 83),
(85, 'imagen/productos/224e3a82858f4ef989f3a97affaa7dfe.jpg', 'trans', 13, 84),
(86, 'imagen/productos/3834d4aa694c4878b96e661999d4810b.jpg', 'trans', 51, 85),
(87, 'imagen/productos/e568fc05f328488c942b69849d497f4c.jpg', 'variado', 149, 86),
(88, 'imagen/productos/97907d6b2b2c4e0586d799d8485499a7.jpg', 'variado', 16, 87),
(89, 'imagen/productos/51945d39cf8542198d2785f4796211e1.jpg', 'azul', 9, 88),
(90, 'imagen/productos/9cdc26e2a06a46fa8b2dc2b636138c76.jpg', 'variado', 78, 89),
(91, 'imagen/productos/e302e13c796a47bf8161859e84c2e191.jpg', 'trans', 78, 90),
(92, 'imagen/productos/492efb4b76db46b89241ff845c5a8f8d.jpg', 'trans', 64, 91),
(93, 'imagen/productos/df01fb1a5eb440b29de63f3a4b14a268.jpg', 'azul', 92, 92),
(94, 'imagen/productos/3c03676080274397badeae4851aaecf2.jpg', 'rojo', 22, 93),
(95, 'imagen/productos/1ca8902ae78c4a7bbe87645e0ef53b4b.jpg', 'trans', 79, 94),
(96, 'imagen/productos/e95edbc0479f4a7180d7cdefb9bb173f.jpg', 'azul', 63, 95),
(97, 'imagen/productos/b4111f44708040188da2eb4ee75254c8.jpg', 'trans', 115, 96),
(98, 'imagen/productos/807cc0705a194152ace0a16513de1ce5.jpg', 'azul', 144, 97),
(99, 'imagen/productos/1dbd16adcf3040ad8811671d123d22e7.jpg', 'trans', 96, 98),
(100, 'imagen/productos/27b9923dac33442cae0f25f1e3b09312.jpg', 'azul', 146, 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `iva` decimal(5,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `oferta` decimal(5,2) DEFAULT NULL,
  `factura_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'cliente', 'cliente'),
(5, 'contenttypes', 'contenttype'),
(15, 'factura', 'detallefactura'),
(14, 'factura', 'factura'),
(13, 'factura', 'metodospago'),
(16, 'factura', 'pedidos'),
(17, 'ipn', 'paypalipn'),
(7, 'producto', 'categoria'),
(11, 'producto', 'color'),
(10, 'producto', 'producto'),
(8, 'producto', 'proveedor'),
(9, 'producto', 'subcategoria'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-07 15:26:46.541627'),
(2, 'auth', '0001_initial', '2024-02-07 15:26:55.642907'),
(3, 'admin', '0001_initial', '2024-02-07 15:26:59.189349'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-07 15:26:59.220445'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-07 15:26:59.261758'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-07 15:26:59.961511'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-07 15:27:00.921780'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-07 15:27:01.077847'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-07 15:27:01.119928'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-07 15:27:02.422641'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-07 15:27:02.449448'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-07 15:27:02.506013'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-07 15:27:02.606994'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-07 15:27:02.723723'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-07 15:27:02.852171'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-07 15:27:02.893991'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-07 15:27:02.995485'),
(18, 'cliente', '0001_initial', '2024-02-07 15:27:03.279722'),
(19, 'cliente', '0002_clientes_casa_apto_clientes_ciudad_and_more', '2024-02-07 15:27:06.303132'),
(20, 'cliente', '0003_rename_clientes_cliente_alter_cliente_table', '2024-02-07 15:27:06.487393'),
(21, 'cliente', '0004_alter_cliente_table', '2024-02-07 15:27:06.659057'),
(22, 'cliente', '0005_remove_cliente_contraseña_and_more', '2024-02-07 15:27:06.933189'),
(23, 'cliente', '0006_alter_cliente_nombre', '2024-02-07 15:27:07.584118'),
(24, 'cliente', '0007_cliente_hola', '2024-02-07 15:27:07.740726'),
(25, 'cliente', '0008_remove_cliente_hola', '2024-02-07 15:27:07.857849'),
(26, 'cliente', '0009_cliente_hola', '2024-02-07 15:27:08.775337'),
(27, 'cliente', '0010_alter_cliente_hola', '2024-02-07 15:27:12.096721'),
(28, 'cliente', '0011_rename_hola_cliente_user', '2024-02-07 15:27:13.710196'),
(29, 'cliente', '0012_remove_cliente_user', '2024-02-07 15:27:15.236172'),
(30, 'cliente', '0013_cliente_user', '2024-02-07 15:27:16.225551'),
(31, 'producto', '0001_initial', '2024-02-07 15:27:18.145439'),
(32, 'producto', '0002_producto_color', '2024-02-07 15:27:22.384228'),
(33, 'producto', '0003_producto_descripcion', '2024-02-07 15:27:22.616475'),
(34, 'producto', '0004_rename_proveedor_id_producto_proveedor', '2024-02-07 15:27:23.769269'),
(35, 'producto', '0005_producto_estado', '2024-02-07 15:27:23.904587'),
(36, 'producto', '0006_rename_producto_id_color_producto', '2024-02-07 15:27:26.508076'),
(37, 'producto', '0007_alter_categoria_imagen_alter_color_imagen', '2024-02-07 15:27:26.638535'),
(38, 'producto', '0008_alter_categoria_imagen_alter_color_imagen', '2024-02-07 15:27:28.122737'),
(43, 'ipn', '0001_initial', '2024-02-07 15:27:39.354559'),
(44, 'ipn', '0002_paypalipn_mp_id', '2024-02-07 15:27:39.516234'),
(45, 'ipn', '0003_auto_20141117_1647', '2024-02-07 15:27:42.731365'),
(46, 'ipn', '0004_auto_20150612_1826', '2024-02-07 15:27:53.489104'),
(47, 'ipn', '0005_auto_20151217_0948', '2024-02-07 15:27:53.684185'),
(48, 'ipn', '0006_auto_20160108_1112', '2024-02-07 15:27:54.192457'),
(49, 'ipn', '0007_auto_20160219_1135', '2024-02-07 15:27:54.238291'),
(50, 'ipn', '0008_auto_20181128_1032', '2024-02-07 15:27:54.312822'),
(51, 'ipn', '0009_alter_paypalipn_id', '2024-02-07 15:27:54.999196'),
(52, 'sessions', '0001_initial', '2024-02-07 15:27:55.520116'),
(53, 'factura', '0001_initial', '2024-04-01 16:06:00.577371'),
(54, 'factura', '0002_pedido', '2024-04-01 16:06:00.801486'),
(55, 'factura', '0003_rename_pedido_pedidos_alter_pedidos_table', '2024-04-01 16:06:00.890910'),
(56, 'factura', '0004_factura_pedido_alter_factura_fecha_factura_and_more', '2024-04-01 16:06:01.002770'),
(57, 'factura', '0005_alter_pedidos_productos', '2024-04-01 16:06:01.147481');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('16wypfc33g865xpxc6ahifk9kg957hrt', '.eJxVjDEOgzAQBP_iOrKOMzaGMn3egO58JpBEWLKhQvw9IFEk7czsbqqndRn7tcTcT6I6her2y5jCO86nkBfNz6RDmpc8sT4TfdmiH0ni5361fwcjlfFYt2gEDFnH0GKNznpqqgOgExhMgIoc-4aB0RrkGsQjsauHhmCwKP44DZTztCTVbfv-BZgHO4E:1rcs7x:nJMJJ8u_BhsjFGRIK6_vxq8h1CvTEZmqlFt5wZUiwNg', '2024-03-06 19:19:33.309774'),
('1yh0mo5pg9ybnh5eeslfk0hiq2944a45', '.eJxVjDEOwjAMRe-SGUUhYLdhZOcMlWM7pIASqWknxN1ppQ6w_vfef5uBljkPS9NpGMVczNEcfrdI_NSyAXlQuVfLtczTGO2m2J02e6uir-vu_h1kanmtYw9JVj0ooiJDEPGMAInRsTuxdL1nh7FLiQIi8DmhBAEKqoHUm88XFoU5Qw:1rrMRZ:OW71KSatfFUZdMi0-rL7xhk1c6tBUotuYs27bKPK6ls', '2024-04-15 18:31:41.076599'),
('57tfozst7quirdiurh94hh04ze1th9gh', '.eJxVjDEOwjAMRe-SGUUhYLdhZOcMlWM7pIASqWknxN1ppQ6w_vfef5uBljkPS9NpGMVczNEcfrdI_NSyAXlQuVfLtczTGO2m2J02e6uir-vu_h1kanmtYw9JVj0ooiJDEPGMAInRsTuxdL1nh7FLiQIi8DmhBAEKqoHUm88XFoU5Qw:1rhNBH:0hon5sjCOdz_fDfX5zNfFTy9PGRSGHR3O21ubun58V4', '2024-03-19 05:17:35.302279'),
('6ixoc3jpgy4g6vkk5ls3mqgm4nvj9c2l', '.eJxVjDEOwjAMRe-SGUUhYLdhZOcMlWM7pIASqWknxN1ppQ6w_vfef5uBljkPS9NpGMVczNEcfrdI_NSyAXlQuVfLtczTGO2m2J02e6uir-vu_h1kanmtYw9JVj0ooiJDEPGMAInRsTuxdL1nh7FLiQIi8DmhBAEKqoHUm88XFoU5Qw:1rhXLe:wywT2lsYoBfWL-zLS2UKX-iOnS8PQ9ykLjvy3m4FHOc', '2024-03-19 16:08:58.968172'),
('8bmrlohwn34gcsclbcvcjr8aqqk4qv42', '.eJxVjDsOwjAQBe_iGln2xr9Q0nMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIsBnH63RLmB9cd0B3rrcnc6rrMSe6KPGiX10b8vBzu30HBXr61GqcA5B14ssYp5SxbsoOHrHSaCNigZx0cuzBwwgAJCEcIPlk0pIN4fwDIGDd6:1rbjNK:f8ueGmtNHti0ajW0UrtuWgmprEXQK54E6i4Xemh5AAg', '2024-03-03 15:46:42.864858'),
('apyewz95srhujycgif4xskqajt0h8sff', '.eJxVjDsOwjAQBe_iGln2xr9Q0nMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIsBnH63RLmB9cd0B3rrcnc6rrMSe6KPGiX10b8vBzu30HBXr61GqcA5B14ssYp5SxbsoOHrHSaCNigZx0cuzBwwgAJCEcIPlk0pIN4fwDIGDd6:1rbjJV:QmbVHWnKlCqPfUWOx8dEG-jDQnd9IqVp8SCD0OzqEPM', '2024-03-03 15:42:45.828684'),
('lnsg5n6mir8mv1iylualgszjp86n5dtl', '.eJxVjMsOgyAURP-FdUMELlJddu83mHt5VNsGEsCV8d-LiYt2OTNnzs5m3Ooyb8XneXVsZJLdfjtC-_bxHNwL4zNxm2LNK_ET4dda-JSc_zwu9k-wYFnam5QDAmcRoO9Chxg6YwE1DMKQMAAghXJ3bXqpsZEkUJEPLaihtaJJLea81sTG_Ti-zP477Q:1rhXL9:me4TXd9TFIFPXQqgeQDsP7zvyTSiEhrNIMm1_BsWsBI', '2024-03-19 16:08:27.234734'),
('lu6hf4rkvul9bvgwmnho06xzayhyc6g7', '.eJxVjDEOwjAMRe-SGUUhYLdhZOcMlWM7pIASqWknxN1ppQ6w_vfef5uBljkPS9NpGMVczNEcfrdI_NSyAXlQuVfLtczTGO2m2J02e6uir-vu_h1kanmtYw9JVj0ooiJDEPGMAInRsTuxdL1nh7FLiQIi8DmhBAEKqoHUm88XFoU5Qw:1rdWnf:-amvACdH3y6w-cotHOBQBTrXBJf1Xi9RLstgXvsdxGA', '2024-03-08 14:45:19.763521'),
('opubrskx4imc69zet1rd8kwj5stb359c', '.eJyVkcFOwzAMhl8F5Vy1adKkzY5wQELiGSondreOrZnSdpdp7447NhhwgVNs__Zvf8pJtDBPm3YeKbU9ipWoRHZf8xDeaFgE3MKwjnmIw5R6ny8t-VUd89eItHu89n4z2MC44enQKFIGnLUeZMAOm6qzpqvIdwEqTwGRXNCdRtVwjN4qBaFsXF0Hr7Vk0wAp9VMUq5OwbSmX95AizmGKl9NtJoa494l43UvcxoenuAOe648gVqXLROwoTRzLjAcp9GxlpJSL8zD1COxRZuIIu5hYcYYVCPN-3gHGWyFEVi_rSs76Paxp4H3FnrCH4iMvbmeNBVhsKChyJRAD66b0DpWuTWVCTdbn28NanDOhW_OLR9_xPMeU4vgJI_8LY-QPmEvhC8b8gcW4ytUNlF2lXaUsglOO2TpZK_5KwvwwMMv5_A4TMr0C:1redaB:tiZ_VhML8alqmVgnqQNTeoOVIKMTv3wZXttBKYDpFFc', '2024-03-11 16:11:59.223831'),
('ppis8ix1hoswknhwrktxk530q31wmhgm', '.eJxVjDEOwjAMRe-SGUUhYLdhZOcMlWM7pIASqWknxN1ppQ6w_vfef5uBljkPS9NpGMVczNEcfrdI_NSyAXlQuVfLtczTGO2m2J02e6uir-vu_h1kanmtYw9JVj0ooiJDEPGMAInRsTuxdL1nh7FLiQIi8DmhBAEKqoHUm88XFoU5Qw:1rXm0r:c1x-Hhx6Ad13JwlC1AGERkPb7FcidKgzOPtA11dui9w', '2024-02-21 17:47:09.710557'),
('qln1yc966mfgisv5cbw32vskz63x1piq', '.eJxVjE0OgyAYRO_CuiEWENFl957BfH9U20YS0JXx7tXERbubzLx5mxpgXcZhLZKHiVWnnLr9dgj0lvkc-AXzM2lK85In1Ceir7XoPrF8Hhf7JxihjMebghFTQ-s9QkUcObjo6-gEI4FDIWZpyUbLJhyZ0RsDdA9t0xBaWx1SgpynJalu2_cvOAo-TA:1reaP0:ntPgvggahrNTZfhBsij66b_GIiYLgpf0_HVrha3Vma0', '2024-03-11 12:48:14.916854'),
('x2y3z8de68kojpfptyhphnk1iwbhuhv9', 'eyJfcGFzc3dvcmRfcmVzZXRfdG9rZW4iOiJjNHN6aXctZjczNTJjNDM1YTQ5YjNjM2VlODdiYzg2YWE5NDY2MTkifQ:1rrKrV:r3S3ZgDZRVLgFwND3NgoQxuy7Nb_UtrIUOKclucX1no', '2024-04-15 16:50:21.023657'),
('y5xmugyqrvidges93g72ke8xdo4zuhgf', '.eJxVjDEOwjAMRe-SGUUhYLdhZOcMlWM7pIASqWknxN1ppQ6w_vfef5uBljkPS9NpGMVczNEcfrdI_NSyAXlQuVfLtczTGO2m2J02e6uir-vu_h1kanmtYw9JVj0ooiJDEPGMAInRsTuxdL1nh7FLiQIi8DmhBAEKqoHUm88XFoU5Qw:1rdWo7:f0z9UUeDvqfDvR7rp41ScEfKNTxKN1K8DtHZJsOpk8k', '2024-03-08 14:45:47.547605');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` bigint(20) NOT NULL,
  `fecha_factura` datetime(6) NOT NULL,
  `fecha_vencimiento` datetime(6) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `metodo_pago_id` bigint(20) DEFAULT NULL,
  `pedido_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_metodospago`
--

CREATE TABLE `factura_metodospago` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_metodospago`
--

INSERT INTO `factura_metodospago` (`id`, `nombre`) VALUES
(1, 'Paypal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` bigint(20) NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paypal_ipn`
--

INSERT INTO `paypal_ipn` (`id`, `business`, `charset`, `custom`, `notify_version`, `parent_txn_id`, `receiver_email`, `receiver_id`, `residence_country`, `test_ipn`, `txn_id`, `txn_type`, `verify_sign`, `address_country`, `address_city`, `address_country_code`, `address_name`, `address_state`, `address_status`, `address_street`, `address_zip`, `contact_phone`, `first_name`, `last_name`, `payer_business_name`, `payer_email`, `payer_id`, `auth_amount`, `auth_exp`, `auth_id`, `auth_status`, `exchange_rate`, `invoice`, `item_name`, `item_number`, `mc_currency`, `mc_fee`, `mc_gross`, `mc_handling`, `mc_shipping`, `memo`, `num_cart_items`, `option_name1`, `option_name2`, `payer_status`, `payment_date`, `payment_gross`, `payment_status`, `payment_type`, `pending_reason`, `protection_eligibility`, `quantity`, `reason_code`, `remaining_settle`, `settle_amount`, `settle_currency`, `shipping`, `shipping_method`, `tax`, `transaction_entity`, `auction_buyer_id`, `auction_closing_date`, `auction_multi_item`, `for_auction`, `amount`, `amount_per_cycle`, `initial_payment_amount`, `next_payment_date`, `outstanding_balance`, `payment_cycle`, `period_type`, `product_name`, `product_type`, `profile_status`, `recurring_payment_id`, `rp_invoice_id`, `time_created`, `amount1`, `amount2`, `amount3`, `mc_amount1`, `mc_amount2`, `mc_amount3`, `password`, `period1`, `period2`, `period3`, `reattempt`, `recur_times`, `recurring`, `retry_at`, `subscr_date`, `subscr_effective`, `subscr_id`, `username`, `case_creation_date`, `case_id`, `case_type`, `receipt_id`, `currency_code`, `handling_amount`, `transaction_subject`, `ipaddress`, `flag`, `flag_code`, `flag_info`, `query`, `response`, `created_at`, `updated_at`, `from_view`, `mp_id`, `option_selection1`, `option_selection2`) VALUES
(1, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '1FB648234T064034G', 'web_accept', 'ADX8qgCb1YTp2Ru1KZZiNkazvB8eAf7xpbBu7w4ewXW1bAnXUp4Drk1H', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '3', 'Total del Carrito', '', 'USD', 297.30, 5500.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-02-07 17:40:17.000000', 5500.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=5500.00&invoice=3&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=09%3A40%3A17+Feb+07%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=297.30&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=ADX8qgCb1YTp2Ru1KZZiNkazvB8eAf7xpbBu7w4ewXW1bAnXUp4Drk1H&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=1FB648234T064034G&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=297.30&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=5500.00&ipn_track_id=f16015246c1a5', 'VERIFIED', '2024-02-07 17:40:29.392474', '2024-02-07 17:40:30.274732', NULL, NULL, '', ''),
(2, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '9BL33982GK763833G', 'web_accept', 'AEHf9dbj7S-BrEZ7Qz9Dxbsyb0TXAdKAvssVX5ybF734SHf5BJgf9Dk1', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '4', 'Total del Carrito', '', 'USD', 1302.13, 24108.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-02-07 17:45:16.000000', 24108.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=24108.00&invoice=4&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=09%3A45%3A16+Feb+07%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=1302.13&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=AEHf9dbj7S-BrEZ7Qz9Dxbsyb0TXAdKAvssVX5ybF734SHf5BJgf9Dk1&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=9BL33982GK763833G&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=1302.13&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=24108.00&ipn_track_id=f278481a4a97f', 'VERIFIED', '2024-02-07 17:45:24.159777', '2024-02-07 17:45:24.182600', NULL, NULL, '', ''),
(3, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '7H584976M00731708', 'web_accept', 'A9mR-wx6UpIKvTf0FoIWqPz2rpCaAW6FKgB2ak-en-js20Ei7oFSNkMQ', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '8', 'Total del Carrito', '', 'USD', 4689.01, 86828.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-02-21 18:22:40.000000', 86828.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=86828.00&invoice=8&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=10%3A22%3A40+Feb+21%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=4689.01&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=A9mR-wx6UpIKvTf0FoIWqPz2rpCaAW6FKgB2ak-en-js20Ei7oFSNkMQ&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=7H584976M00731708&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=4689.01&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=86828.00&ipn_track_id=f82621406db01', 'VERIFIED', '2024-02-21 18:22:54.371397', '2024-02-21 18:22:54.405950', NULL, NULL, '', ''),
(4, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '6E300622TY3485421', 'web_accept', 'AX8ieAkKpYYejWHnkQpJQhiSXfgJAzo4tCKQn3wSJCeJf8BMuaboCeWE', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '9', 'Total del Carrito', '', 'USD', 2673.30, 49500.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-02-21 19:19:43.000000', 49500.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=49500.00&invoice=9&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=11%3A19%3A43+Feb+21%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=2673.30&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=AX8ieAkKpYYejWHnkQpJQhiSXfgJAzo4tCKQn3wSJCeJf8BMuaboCeWE&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=6E300622TY3485421&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=2673.30&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=49500.00&ipn_track_id=f370201c542c6', 'VERIFIED', '2024-02-21 19:19:52.257110', '2024-02-21 19:19:52.375592', NULL, NULL, '', ''),
(5, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '09G321997M3901711', 'web_accept', 'AzMNuzx0Y.L8WHwRvZF4MC0RLJ6EAdlRsIB8Ldp26-7k-P1Yjg04s-Bt', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '15', 'Total del Carrito', '', 'USD', 1292.63, 23932.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-02-26 12:02:18.000000', 23932.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=23932.00&invoice=15&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=04%3A02%3A18+Feb+26%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=1292.63&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=AzMNuzx0Y.L8WHwRvZF4MC0RLJ6EAdlRsIB8Ldp26-7k-P1Yjg04s-Bt&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=09G321997M3901711&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=1292.63&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=23932.00&ipn_track_id=f1014268ae630', 'VERIFIED', '2024-02-26 12:02:31.362358', '2024-02-26 12:02:31.944635', NULL, NULL, '', ''),
(6, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '7D0609476U034142A', 'web_accept', 'AknLzyAUQOHq1NgAtbHW4Ez6NJsdAItRybT1PVTWZqhyQWQeMzP6hsx3', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '21', 'Total del Carrito', '', 'USD', 1582.50, 29300.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-02-26 12:59:14.000000', 29300.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=29300.00&invoice=21&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=04%3A59%3A14+Feb+26%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=1582.50&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=AknLzyAUQOHq1NgAtbHW4Ez6NJsdAItRybT1PVTWZqhyQWQeMzP6hsx3&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=7D0609476U034142A&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=1582.50&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=29300.00&ipn_track_id=f746794c618dd', 'VERIFIED', '2024-02-26 12:59:27.613151', '2024-02-26 12:59:27.686893', NULL, NULL, '', ''),
(7, 'sb-nupvz26186010@business.example.com', 'UTF-8', '', 3.90, '', 'sb-nupvz26186010@business.example.com', 'HD4SZRQM43E74', 'CO', 1, '6H921266MG442081K', 'web_accept', 'A5m67iUjKM-Po4rcsZlHa.adJCg6ApByoNUJ3phKYyuWM1VgIfED4NGd', '', '', '', '', '', '', '', '', '', 'Jorge', 'Largo', '', 'sb-ajl6628241901@personal.example.com', 'JNEZKNMMMWJN4', 0.00, '', '', '', 0.0000000000000000, '22', 'Total del Carrito', '', 'USD', 728.87, 13492.00, 0.00, 0.00, '', 0, '', '', 'verified', '2024-03-05 16:08:39.000000', 13492.00, 'Completed', 'instant', '', 'Eligible', 1, '', 0.00, 0.00, '', 0.00, 'Default', 0.00, '', '', NULL, 0, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, '', '', '', '', '', '', '', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', '', '', '', '', 0, '', NULL, NULL, NULL, '', '', NULL, '', '', '', 'USD', 0.00, '', '127.0.0.1', 0, '', '', 'mc_gross=13492.00&invoice=22&protection_eligibility=Eligible&payer_id=JNEZKNMMMWJN4&payment_date=08%3A08%3A39+Mar+05%2C+2024+PST&payment_status=Completed&charset=UTF-8&first_name=Jorge&mc_fee=728.87&notify_version=3.9&custom=&payer_status=verified&business=sb-nupvz26186010%40business.example.com&quantity=1&verify_sign=A5m67iUjKM-Po4rcsZlHa.adJCg6ApByoNUJ3phKYyuWM1VgIfED4NGd&payer_email=sb-ajl6628241901%40personal.example.com&txn_id=6H921266MG442081K&payment_type=instant&last_name=Largo&receiver_email=sb-nupvz26186010%40business.example.com&payment_fee=728.87&shipping_discount=0.00&receiver_id=HD4SZRQM43E74&insurance_amount=0.00&txn_type=web_accept&item_name=Total+del+Carrito&discount=0.00&mc_currency=USD&item_number=&residence_country=CO&test_ipn=1&shipping_method=Default&transaction_subject=&payment_gross=13492.00&ipn_track_id=f4813626652ed', 'VERIFIED', '2024-03-05 16:08:50.977260', '2024-03-05 16:08:51.108029', NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `situacion` varchar(60) NOT NULL,
  `productos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`productos`)),
  `cliente_id` bigint(20) DEFAULT NULL,
  `metodo_pago_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `porcentaje_iva` decimal(3,1) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `oferta` decimal(4,2) DEFAULT NULL,
  `proveedor_id` bigint(20) DEFAULT NULL,
  `subcategoria_id` bigint(20) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `porcentaje_iva`, `precio`, `stock`, `oferta`, `proveedor_id`, `subcategoria_id`, `descripcion`, `estado`) VALUES
(1, 'Pop-its', 16.0, 10000.00, 37, 10.00, 1, 1, 'Entretenidos Pop-its para niños transtornados', 1),
(2, 'Caballeros lm', 16.0, 15000.00, 17, 5.00, 1, 1, 'Caballeros del zoodiaco', 1),
(3, 'Gorros', 10.0, 5000.00, 32, 0.00, 1, 3, 'Gorros para la fiesta :3 salvaje', 1),
(4, 'Cubo pulidor', 16.0, 12000.00, 15, 8.00, 1, 7, 'Cubo para pulir', 1),
(5, 'Moños caucho pequeño', 16.0, 2000.00, 18, 12.00, 1, 8, 'Moños de plastico', 1),
(6, 'Jojo Cola', 19.0, 5000.00, 40, 0.00, 3, 1, 'Es un tipo de basura que se puede atrapar con una caña de pescar durante todas las estaciones, en cualquier lugar.', 1),
(7, 'Kira', 16.0, 5000.00, 0, 0.00, 5, NULL, 'asdasdasdasda', 0),
(14, 'iPhone 9', 16.0, 549.00, 94, 12.00, 3, 8, 'An apple mobile which is nothing like apple', 1),
(15, 'iPhone X', 16.0, 899.00, 34, 17.00, 3, 7, 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...', 1),
(16, 'Samsung Universe 9', 16.0, 1249.00, 36, 15.00, 3, 9, 'Samsung\'s new variant which goes beyond Galaxy to the Universe', 1),
(17, 'OPPOF19', 16.0, 280.00, 123, 17.00, 3, 8, 'OPPO F19 is officially announced on April 2021.', 1),
(18, 'Huawei P30', 16.0, 499.00, 32, 10.00, 3, 8, 'Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.', 1),
(19, 'MacBook Pro', 16.0, 1749.00, 83, 11.00, 3, 9, 'MacBook Pro 2021 with mini-LED display may launch between September, November', 1),
(20, 'Samsung Galaxy Book', 16.0, 1499.00, 50, 4.00, 3, 8, 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 1),
(21, 'Microsoft Surface Laptop 4', 16.0, 1499.00, 68, 10.00, 3, 7, 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 1),
(22, 'Infinix INBOOK', 16.0, 1099.00, 96, 11.00, 3, 8, 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty', 1),
(23, 'HP Pavilion 15-DK1056WM', 16.0, 1099.00, 89, 6.00, 3, 7, 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10', 1),
(24, 'perfume Oil', 16.0, 13.00, 65, 8.00, 3, 8, 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil', 1),
(25, 'Brown Perfume', 16.0, 40.00, 52, 15.00, 3, 9, 'Royal_Mirage Sport Brown Perfume for Men & Women - 120ml', 1),
(26, 'Fog Scent Xpressio Perfume', 16.0, 13.00, 61, 8.00, 3, 7, 'Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men', 1),
(27, 'Eau De Perfume Spray', 16.0, 30.00, 105, 10.00, 3, 7, 'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality', 1),
(28, 'Hyaluronic Acid Serum', 16.0, 19.00, 110, 13.00, 3, 8, 'L\'OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid', 1),
(29, 'Tree Oil 30ml', 16.0, 12.00, 78, 4.00, 3, 7, 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 1),
(30, 'Oil Free Moisturizer 100ml', 16.0, 40.00, 88, 13.00, 3, 7, 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.', 1),
(31, 'Skin Beauty Serum.', 16.0, 46.00, 54, 10.00, 3, 7, 'Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m', 1),
(32, 'Freckle Treatment Cream- 15gm', 16.0, 70.00, 140, 16.00, 3, 8, 'Fair & Clear is Pakistan\'s only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects.', 1),
(33, '- Daal Masoor 500 grams', 16.0, 20.00, 133, 4.00, 3, 9, 'Fine quality Branded Product Keep in a cool and dry place', 1),
(34, 'Elbow Macaroni - 400 gm', 16.0, 14.00, 146, 15.00, 3, 7, 'Product details of Bake Parlor Big Elbow Macaroni - 400 gm', 1),
(35, 'Orange Essence Food Flavou', 16.0, 14.00, 26, 8.00, 3, 9, 'Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item', 1),
(36, 'cereals muesli fruit nuts', 16.0, 46.00, 113, 16.00, 3, 9, 'original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji', 1),
(37, 'Gulab Powder 50 Gram', 16.0, 70.00, 47, 13.00, 3, 9, 'Dry Rose Flower Powder Gulab Powder 50 Gram • Treats Wounds', 1),
(38, 'Plant Hanger For Home', 16.0, 41.00, 131, 17.00, 3, 7, 'Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf', 1),
(39, 'Flying Wooden Bird', 16.0, 51.00, 17, 15.00, 3, 9, 'Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm', 1),
(40, '3D Embellishment Art Lamp', 16.0, 20.00, 54, 16.00, 3, 7, '3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)', 1),
(41, 'Handcraft Chinese style', 16.0, 60.00, 7, 15.00, 3, 7, 'Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate', 1),
(42, 'Key Holder', 16.0, 30.00, 54, 2.00, 3, 7, 'Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality', 1),
(43, 'Mornadi Velvet Bed', 16.0, 40.00, 140, 17.00, 3, 9, 'Mornadi Velvet Bed Base with Headboard Slats Support Classic Style Bedroom Furniture Bed Set', 1),
(44, 'Sofa for Coffe Cafe', 16.0, 50.00, 30, 15.00, 3, 8, 'Ratttan Outdoor furniture Set Waterproof  Rattan Sofa for Coffe Cafe', 1),
(45, '3 Tier Corner Shelves', 16.0, 700.00, 106, 17.00, 3, 7, '3 Tier Corner Shelves | 3 PCs Wall Mount Kitchen Shelf | Floating Bedroom Shelf', 1),
(46, 'Plastic Table', 16.0, 50.00, 136, 4.00, 3, 8, 'V﻿ery good quality plastic table for multi purpose now in reasonable price', 1),
(47, '3 DOOR PORTABLE', 16.0, 41.00, 68, 7.00, 3, 9, 'Material: Stainless Steel and Fabric  Item Size: 110 cm x 45 cm x 175 cm Package Contents: 1 Storage Wardrobe', 1),
(48, 'Sleeve Shirt Womens', 16.0, 90.00, 39, 10.00, 3, 7, 'Cotton Solid Color Professional Wear Sleeve Shirt Womens Work Blouses Wholesale Clothing Casual Plain Custom Top OEM Customized', 1),
(49, 'ank Tops for Womens Girls', 16.0, 50.00, 107, 12.00, 3, 7, 'PACK OF 3 CAMISOLES ,VERY COMFORTABLE SOFT COTTON STUFF, COMFORTABLE IN ALL FOUR SEASONS', 1),
(50, 'sublimation plain kids tank', 16.0, 100.00, 20, 11.00, 3, 9, 'sublimation plain kids tank tops wholesale', 1),
(51, 'Women Sweaters Wool', 16.0, 600.00, 55, 17.00, 3, 7, '2021 Custom Winter Fall Zebra Knit Crop Top Women Sweaters Wool Mohair Cos Customize Crew Neck Women\' S Crop Top Sweater', 1),
(52, 'women winter clothes', 16.0, 57.00, 84, 13.00, 3, 8, 'women winter clothes thick fleece hoodie top with sweat pantjogger women sweatsuit set joggers pants two piece pants set', 1),
(53, 'NIGHT SUIT', 16.0, 55.00, 21, 15.00, 3, 8, 'NIGHT SUIT RED MICKY MOUSE..  For Girls. Fantastic Suits.', 1),
(54, 'Stiched Kurta plus trouser', 16.0, 80.00, 148, 15.00, 3, 8, 'FABRIC: LILEIN CHEST: 21 LENGHT: 37 TROUSER: (38) :ARABIC LILEIN', 1),
(55, 'frock gold printed', 16.0, 600.00, 150, 15.00, 3, 7, 'Ghazi fabric long frock gold printed ready to wear stitched collection (G992)', 1),
(56, 'Ladies Multicolored Dress', 16.0, 79.00, 2, 16.00, 3, 8, 'This classy shirt for women gives you a gorgeous look on everyday wear and specially for semi-casual wears.', 1),
(57, 'Malai Maxi Dress', 16.0, 50.00, 96, 5.00, 3, 7, 'Ready to wear, Unique design according to modern standard fashion, Best fitting ,Imported stuff', 1),
(58, 'women\'s shoes', 16.0, 40.00, 72, 16.00, 3, 8, 'Close: Lace, Style with bottom: Increased inside, Sole Material: Rubber', 1),
(59, 'Sneaker shoes', 16.0, 120.00, 50, 10.00, 3, 8, 'Synthetic Leather Casual Sneaker shoes for Women/girls Sneakers For Women', 1),
(60, 'Women Strip Heel', 16.0, 40.00, 25, 10.00, 3, 8, 'Features: Flip-flops, Mid Heel, Comfortable, Striped Heel, Antiskid, Striped', 1),
(61, 'Women Shoes', 16.0, 36.00, 46, 16.00, 3, 7, '2020 New Arrivals Genuine Leather Fashion Trend Platform Summer Women Shoes', 1),
(62, 'half sleeves T shirts', 16.0, 23.00, 132, 12.00, 3, 7, 'Many store is creating new designs and trend every month and every year. Daraz.pk have a beautiful range of men fashion brands', 1),
(63, 'FREE FIRE T Shirt', 16.0, 10.00, 128, 14.00, 3, 8, 'quality and professional print - It doesn\'t just look high quality, it is high quality.', 1),
(64, 'printed high quality T shirts', 16.0, 35.00, 6, 7.00, 3, 8, 'Brand: vintage Apparel ,Export quality', 1),
(65, 'Pubg Printed Graphic T-Shirt', 16.0, 46.00, 136, 16.00, 3, 8, 'Product Description Features: 100% Ultra soft Polyester Jersey. Vibrant & colorful printing on front. Feels soft as cotton without ever cracking', 1),
(66, 'Sneakers Joggers Shoes', 16.0, 40.00, 6, 12.00, 3, 8, 'Gender: Men , Colors: Same as DisplayedCondition: 100% Brand New', 1),
(67, 'Loafers for men', 16.0, 47.00, 20, 10.00, 3, 8, 'Men Shoes - Loafers for men - Rubber Shoes - Nylon Shoes - Shoes for men - Moccassion - Pure Nylon (Rubber) Expot Quality.', 1),
(68, 'formal offices shoes', 16.0, 57.00, 68, 12.00, 3, 8, 'Pattern Type: Solid, Material: PU, Toe Shape: Pointed Toe ,Outsole Material: Rubber', 1),
(69, 'Spring and summershoes', 16.0, 20.00, 137, 8.00, 3, 7, 'Comfortable stretch cloth, lightweight body; ,rubber sole, anti-skid wear;', 1),
(70, 'Stylish Casual Jeans Shoes', 16.0, 58.00, 129, 7.00, 3, 7, 'High Quality ,Stylish design ,Comfortable wear ,FAshion ,Durable', 1),
(71, 'Leather Straps Wristwatch', 16.0, 120.00, 91, 7.00, 3, 7, 'Style:Sport ,Clasp:Buckles ,Water Resistance Depth:3Bar', 1),
(72, 'Waterproof Leather Brand Watch', 16.0, 46.00, 95, 3.00, 3, 7, 'Watch Crown With Environmental IPS Bronze Electroplating; Display system of 12 hours', 1),
(73, 'Royal Blue Premium Watch', 16.0, 50.00, 142, 2.00, 3, 7, 'Men Silver Chain Royal Blue Premium Watch Latest Analog Watch', 1),
(74, 'Leather Strap Skeleton Watch', 16.0, 46.00, 61, 10.00, 3, 7, 'Leather Strap Skeleton Watch for Men - Stylish and Latest Design', 1),
(75, 'Stainless Steel Wrist Watch', 16.0, 47.00, 94, 17.00, 3, 8, 'Stylish Watch For Man (Luxury) Classy Men\'s Stainless Steel Wrist Watch - Box Packed', 1),
(76, 'Steel Analog Couple Watches', 16.0, 35.00, 24, 3.00, 3, 7, 'Elegant design, Stylish ,Unique & Trendy,Comfortable wear', 1),
(77, 'Fashion Magnetic Wrist Watch', 16.0, 60.00, 46, 16.00, 3, 7, 'Buy this awesome  The product is originally manufactured by the company and it\'s a top selling product with a very reasonable', 1),
(78, 'Stylish Luxury Digital Watch', 16.0, 57.00, 77, 9.00, 3, 8, 'Stylish Luxury Digital Watch For Girls / Women - Led Smart Ladies Watches For Girls', 1),
(79, 'Stainless Steel Women', 16.0, 35.00, 111, 8.00, 3, 8, 'Fashion Skmei 1830 Shell Dial Stainless Steel Women Wrist Watch Lady Bracelet Watch Quartz Watches Ladies', 1),
(80, 'Women Shoulder Bags', 16.0, 46.00, 17, 14.00, 3, 7, 'LouisWill Women Shoulder Bags Long Clutches Cross Body Bags Phone Bags PU Leather Hand Bags Large Capacity Card Holders Zipper Coin Purses Fashion Crossbody Bags for Girls Ladies', 1),
(81, 'Handbag For Girls', 16.0, 23.00, 27, 17.00, 3, 9, 'This fashion is designed to add a charming effect to your casual outfit. This Bag is made of synthetic leather.', 1),
(82, 'Fancy hand clutch', 16.0, 44.00, 101, 10.00, 3, 9, 'This fashion is designed to add a charming effect to your casual outfit. This Bag is made of synthetic leather.', 1),
(83, 'Leather Hand Bag', 16.0, 57.00, 43, 11.00, 3, 7, 'It features an attractive design that makes it a must have accessory in your collection. We sell different kind of bags for boys, kids, women, girls and also for unisex.', 1),
(84, 'Seven Pocket Women Bag', 16.0, 68.00, 13, 14.00, 3, 9, 'Seven Pocket Women Bag Handbags Lady Shoulder Crossbody Bag Female Purse Seven Pocket Bag', 1),
(85, 'Silver Ring Set Women', 16.0, 70.00, 51, 13.00, 3, 7, 'Jewelry Type:RingsCertificate Type:NonePlating:Silver PlatedShapeattern:noneStyle:CLASSICReligious', 1),
(86, 'Rose Ring', 16.0, 100.00, 149, 3.00, 3, 9, 'Brand: The Greetings Flower Colour: RedRing Colour: GoldenSize: Adjustable', 1),
(87, 'Elegant Female Pearl Earrings', 16.0, 30.00, 16, 12.00, 3, 8, 'Elegant Female Pearl Earrings Set Zircon Pearl Earings Women Party Accessories 9 Pairs/Set', 1),
(88, 'Chain Pin Tassel Earrings', 16.0, 45.00, 9, 17.00, 3, 8, 'Pair Of Ear Cuff Butterfly Long Chain Pin Tassel Earrings - Silver ( Long Life Quality Product)', 1),
(89, 'Round Silver Frame Sun Glasses', 16.0, 19.00, 78, 10.00, 3, 8, 'A pair of sunglasses can protect your eyes from being hurt. For car driving, vacation travel, outdoor activities, social gatherings,', 1),
(90, 'Kabir Singh Square Sunglass', 16.0, 50.00, 78, 15.00, 3, 7, 'Orignal Metal Kabir Singh design 2020 Sunglasses Men Brand Designer Sun Glasses Kabir Singh Square Sunglass', 1),
(91, 'Square Sunglasses', 16.0, 28.00, 64, 13.00, 3, 8, 'Fashion Oversized Square Sunglasses Retro Gradient Big Frame Sunglasses For Women One Piece Gafas Shade Mirror Clear Lens 17059', 1),
(92, 'LouisWill Men Sunglasses', 16.0, 50.00, 92, 11.00, 3, 8, 'LouisWill Men Sunglasses Polarized Sunglasses UV400 Sunglasses Day Night Dual Use Safety Driving Night Vision Eyewear AL-MG Frame Sun Glasses with Free Box for Drivers', 1),
(93, 'Bluetooth Aux', 16.0, 25.00, 22, 10.00, 3, 9, 'Bluetooth Aux Bluetooth Car Aux Car Bluetooth Transmitter Aux Audio Receiver Handfree Car Bluetooth Music Receiver Universal 3.5mm Streaming A2DP Wireless Auto AUX Audio Adapter With Mic For Phone MP3', 1),
(94, 'Qualcomm original Car Charger', 16.0, 40.00, 79, 17.00, 3, 8, 'best Quality CHarger , Highly Recommended to all best Quality CHarger , Highly Recommended to all', 1),
(95, 'Cycle Bike Glow', 16.0, 35.00, 63, 11.00, 3, 7, 'Universal fitment and easy to install no special wires, can be easily installed and removed. Fits most standard tyre air stem valves of road, mountain bicycles, motocycles and cars.Bright led will turn on w', 1),
(96, 'Black Motorbike', 16.0, 569.00, 115, 13.00, 3, 8, 'Engine Type:Wet sump, Single Cylinder, Four Stroke, Two Valves, Air Cooled with SOHC (Single Over Head Cam) Chain Drive Bore & Stroke:47.0 x 49.5 MM', 1),
(97, 'Wholesale cargo lashing Belt', 16.0, 930.00, 144, 17.00, 3, 7, 'Wholesale cargo lashing Belt Tie Down end Ratchet strap customized strap 25mm motorcycle 1500kgs with rubber handle', 1),
(98, 'lighting ceiling kitchen', 16.0, 30.00, 96, 14.00, 3, 7, 'Wholesale slim hanging decorative kid room lighting ceiling kitchen chandeliers pendant light modern', 1),
(99, 'Metal Ceramic Flower', 16.0, 35.00, 146, 10.00, 3, 7, 'Metal Ceramic Flower Chandelier Home Lighting American Vintage Hanging Lighting Pendant Lamp', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` bigint(20) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `nombre_completo` varchar(60) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `correo_electronico` varchar(200) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `ciudad`, `nombre_completo`, `nit`, `correo_electronico`, `telefono`, `direccion`) VALUES
(1, 'Medellin', 'Plasticos y Desechables Tejemelo', '544.325.223 - 7', 'tejemelo@hotmail.com', '4456628', 'Medellin - Antioquia'),
(3, 'Medellín', 'Plasticos J&T', '1028034536-5', 'alejo-largo@hotmail.com', '33333333333', 'Pedregal Medellin'),
(4, 'madrid', 'mono hi', '21321412', 'solo@solo.com', '3423455', 'cr 34 #34- 43'),
(5, 'Medellín', 'Hector Maya', '11111111-99', 'hector@hector.com', '8286498', 'Pedregal Medellin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `categoria_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `nombre`, `categoria_id`) VALUES
(1, 'Niños', 1),
(2, 'Niñas', 1),
(3, 'Gorros', 2),
(4, 'Accesorios', 2),
(7, 'Prueba 1', 5),
(8, 'Prueba 2', 5),
(9, 'Prueba 3', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_producto_id_6a39a137_fk_producto_id` (`producto_id`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Detalle_factura_factura_id_7db47fdb_fk_Factura_id` (`factura_id`),
  ADD KEY `Detalle_factura_producto_id_c8b169d9_fk_producto_id` (`producto_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Factura_cliente_id_533799f0_fk_cliente_id` (`cliente_id`),
  ADD KEY `Factura_metodo_pago_id_8ac8fbce_fk_factura_metodospago_id` (`metodo_pago_id`),
  ADD KEY `Factura_pedido_id_b8b113a9_fk_Pedidos_id` (`pedido_id`);

--
-- Indices de la tabla `factura_metodospago`
--
ALTER TABLE `factura_metodospago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura_pedido_cliente_id_431459be_fk_cliente_id` (`cliente_id`),
  ADD KEY `factura_pedido_metodo_pago_id_e24d59f8_fk_factura_metodospago_id` (`metodo_pago_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_subcategoria_id_555d6ddb_fk_subcategoria_id` (`subcategoria_id`),
  ADD KEY `producto_proveedor_id_a09ce3bf_fk_proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategoria_categoria_id_e594c1f4_fk_categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_metodospago`
--
ALTER TABLE `factura_metodospago`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_user_id_e7dabcb3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `color_producto_id_6a39a137_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `Detalle_factura_factura_id_7db47fdb_fk_Factura_id` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `Detalle_factura_producto_id_c8b169d9_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `Factura_cliente_id_533799f0_fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `Factura_metodo_pago_id_8ac8fbce_fk_factura_metodospago_id` FOREIGN KEY (`metodo_pago_id`) REFERENCES `factura_metodospago` (`id`),
  ADD CONSTRAINT `Factura_pedido_id_b8b113a9_fk_Pedidos_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `factura_pedido_cliente_id_431459be_fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `factura_pedido_metodo_pago_id_e24d59f8_fk_factura_metodospago_id` FOREIGN KEY (`metodo_pago_id`) REFERENCES `factura_metodospago` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_proveedor_id_a09ce3bf_fk_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  ADD CONSTRAINT `producto_subcategoria_id_555d6ddb_fk_subcategoria_id` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategoria` (`id`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_categoria_id_e594c1f4_fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
