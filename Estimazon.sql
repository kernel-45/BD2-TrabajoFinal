-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2023 a las 19:34:13
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estimazon`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombreCategoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombreCategoria`) VALUES
('Alimentos'),
('Arte y manualidades'),
('Artículos para el hogar'),
('Electrónica'),
('Instrumentos musicales'),
('Juguetes'),
('Libros'),
('Oficina y papelería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprador`
--

CREATE TABLE `comprador` (
  `idPersona` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprador`
--

INSERT INTO `comprador` (`idPersona`, `correo`, `contraseña`, `nombre`, `apellido1`, `apellido2`) VALUES
(90, 'usuario90@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(91, 'usuario91@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(92, 'usuario92@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(93, 'usuario93@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(94, 'usuario94@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(95, 'usuario95@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(96, 'usuario96@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(97, 'usuario97@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(98, 'usuario98@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(99, 'usuario99@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(100, 'usuario100@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(101, 'usuario101@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(102, 'usuario102@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(103, 'usuario103@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(104, 'usuario104@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(105, 'usuario105@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(106, 'usuario106@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(107, 'usuario107@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(108, 'usuario108@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(109, 'usuario109@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(110, 'usuario110@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(111, 'usuario111@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(112, 'usuario112@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(113, 'usuario113@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(114, 'usuario114@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(115, 'usuario115@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(116, 'usuario116@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(117, 'usuario117@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(118, 'usuario118@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(119, 'usuario119@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(120, 'usuario120@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(121, 'usuario121@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(122, 'usuario122@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(123, 'usuario123@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(124, 'usuario124@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(125, 'usuario125@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(126, 'usuario126@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(127, 'usuario127@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(128, 'usuario128@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(129, 'usuario129@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(130, 'usuario130@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(131, 'usuario131@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(132, 'usuario132@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(133, 'usuario133@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(134, 'usuario134@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(135, 'usuario135@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(136, 'usuario136@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(137, 'usuario137@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(138, 'usuario138@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(139, 'usuario139@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(140, 'usuario140@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(141, 'usuario141@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(142, 'usuario142@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(143, 'usuario143@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(144, 'usuario144@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(145, 'usuario145@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(146, 'usuario146@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(147, 'usuario147@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(148, 'usuario148@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(149, 'usuario149@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(150, 'usuario150@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(151, 'usuario151@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(152, 'usuario152@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(153, 'usuario153@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(154, 'usuario154@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(155, 'usuario155@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(156, 'usuario156@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(157, 'usuario157@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(158, 'usuario158@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(159, 'usuario159@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(160, 'usuario160@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(161, 'usuario161@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(162, 'usuario162@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(163, 'usuario163@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(164, 'usuario164@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(165, 'usuario165@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(166, 'usuario166@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(167, 'usuario167@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(168, 'usuario168@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(169, 'usuario169@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(170, 'usuario170@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(171, 'usuario171@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(172, 'usuario172@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(173, 'usuario173@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(174, 'usuario174@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(175, 'usuario175@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(176, 'usuario176@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(177, 'usuario177@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(178, 'usuario178@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(179, 'usuario179@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(180, 'usuario180@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(181, 'usuario181@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(182, 'usuario182@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(183, 'usuario183@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(184, 'usuario184@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(185, 'usuario185@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(186, 'usuario186@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(187, 'usuario187@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(188, 'usuario188@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(189, 'usuario189@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(190, 'usuario190@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(191, 'usuario191@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(192, 'usuario192@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(193, 'usuario193@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(194, 'usuario194@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(195, 'usuario195@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(196, 'usuario196@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(197, 'usuario197@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(198, 'usuario198@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(199, 'usuario199@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(200, 'usuario200@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(201, 'usuario201@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(202, 'usuario202@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(203, 'usuario203@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(204, 'usuario204@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(205, 'usuario205@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(206, 'usuario206@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(207, 'usuario207@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(208, 'usuario208@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(209, 'usuario209@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(210, 'usuario210@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(211, 'usuario211@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(212, 'usuario212@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(213, 'usuario213@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(214, 'usuario214@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(215, 'usuario215@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(216, 'usuario216@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(217, 'usuario217@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(218, 'usuario218@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(219, 'usuario219@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(220, 'usuario220@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(221, 'usuario221@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(222, 'usuario222@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(223, 'usuario223@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(224, 'usuario224@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(225, 'usuario225@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(226, 'usuario226@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(227, 'usuario227@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(228, 'usuario228@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(229, 'usuario229@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(230, 'usuario230@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(231, 'usuario231@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(232, 'usuario232@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(233, 'usuario233@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(234, 'usuario234@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(235, 'usuario235@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(236, 'usuario236@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(237, 'usuario237@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(238, 'usuario238@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(239, 'usuario239@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(240, 'usuario240@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(241, 'usuario241@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(242, 'usuario242@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(243, 'usuario243@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(244, 'usuario244@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(245, 'usuario245@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(246, 'usuario246@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(247, 'usuario247@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(248, 'usuario248@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(249, 'usuario249@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(250, 'usuario250@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(251, 'usuario251@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(252, 'usuario252@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(253, 'usuario253@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(254, 'usuario254@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(255, 'usuario255@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(256, 'usuario256@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(257, 'usuario257@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(258, 'usuario258@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(259, 'usuario259@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(260, 'usuario260@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(261, 'usuario261@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(262, 'usuario262@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(263, 'usuario263@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(264, 'usuario264@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(265, 'usuario265@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(266, 'usuario266@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(267, 'usuario267@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(268, 'usuario268@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(269, 'usuario269@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(270, 'usuario270@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(271, 'usuario271@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(272, 'usuario272@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(273, 'usuario273@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(274, 'usuario274@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(275, 'usuario275@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(276, 'usuario276@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(277, 'usuario277@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(278, 'usuario278@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(279, 'usuario279@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(280, 'usuario280@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(281, 'usuario281@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(282, 'usuario282@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(283, 'usuario283@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(284, 'usuario284@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(285, 'usuario285@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(286, 'usuario286@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(287, 'usuario287@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(288, 'usuario288@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(289, 'usuario289@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(290, 'usuario290@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(291, 'usuario291@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(292, 'usuario292@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(293, 'usuario293@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(294, 'usuario294@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(295, 'usuario295@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(296, 'usuario296@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(297, 'usuario297@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(298, 'usuario298@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(299, 'usuario299@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(300, 'usuario300@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(301, 'usuario301@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(302, 'usuario302@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(303, 'usuario303@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(304, 'usuario304@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(305, 'usuario305@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(306, 'usuario306@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(307, 'usuario307@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(308, 'usuario308@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(309, 'usuario309@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(310, 'usuario310@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(311, 'usuario311@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(312, 'usuario312@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(313, 'usuario313@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(314, 'usuario314@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(315, 'usuario315@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(316, 'usuario316@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(317, 'usuario317@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(318, 'usuario318@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(319, 'usuario319@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(320, 'usuario320@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(321, 'usuario321@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(322, 'usuario322@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(323, 'usuario323@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(324, 'usuario324@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(325, 'usuario325@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(326, 'usuario326@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(327, 'usuario327@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(328, 'usuario328@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(329, 'usuario329@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(330, 'usuario330@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(331, 'usuario331@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(332, 'usuario332@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(333, 'usuario333@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(334, 'usuario334@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(335, 'usuario335@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(336, 'usuario336@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(337, 'usuario337@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(338, 'usuario338@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(339, 'usuario339@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(340, 'usuario340@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(341, 'usuario341@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(342, 'usuario342@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(343, 'usuario343@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(344, 'usuario344@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(345, 'usuario345@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(346, 'usuario346@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(347, 'usuario347@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(348, 'usuario348@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(349, 'usuario349@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(350, 'usuario350@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(351, 'usuario351@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(352, 'usuario352@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(353, 'usuario353@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(354, 'usuario354@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(355, 'usuario355@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(356, 'usuario356@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(357, 'usuario357@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(358, 'usuario358@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(359, 'usuario359@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(360, 'usuario360@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(361, 'usuario361@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(362, 'usuario362@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(363, 'usuario363@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(364, 'usuario364@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(365, 'usuario365@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(366, 'usuario366@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(367, 'usuario367@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(368, 'usuario368@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(369, 'usuario369@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(370, 'usuario370@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(371, 'usuario371@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(372, 'usuario372@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(373, 'usuario373@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(374, 'usuario374@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(375, 'usuario375@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(376, 'usuario376@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(377, 'usuario377@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(378, 'usuario378@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(379, 'usuario379@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(380, 'usuario380@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(381, 'usuario381@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(382, 'usuario382@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(383, 'usuario383@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(384, 'usuario384@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(385, 'usuario385@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(386, 'usuario386@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(387, 'usuario387@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(388, 'usuario388@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(389, 'usuario389@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(390, 'usuario390@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(391, 'usuario391@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(392, 'usuario392@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(393, 'usuario393@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(394, 'usuario394@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(395, 'usuario395@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(396, 'usuario396@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(397, 'usuario397@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(398, 'usuario398@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(399, 'usuario399@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(400, 'usuario400@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(401, 'usuario401@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(402, 'usuario402@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(403, 'usuario403@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(404, 'usuario404@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(405, 'usuario405@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(406, 'usuario406@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(407, 'usuario407@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(408, 'usuario408@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(409, 'usuario409@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(410, 'usuario410@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(411, 'usuario411@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(412, 'usuario412@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(413, 'usuario413@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(414, 'usuario414@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(415, 'usuario415@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(416, 'usuario416@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(417, 'usuario417@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(418, 'usuario418@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(419, 'usuario419@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(420, 'usuario420@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(421, 'usuario421@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(422, 'usuario422@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(423, 'usuario423@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(424, 'usuario424@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(425, 'usuario425@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(426, 'usuario426@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(427, 'usuario427@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(428, 'usuario428@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(429, 'usuario429@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(430, 'usuario430@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(431, 'usuario431@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(432, 'usuario432@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(433, 'usuario433@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(434, 'usuario434@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(435, 'usuario435@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(436, 'usuario436@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(437, 'usuario437@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(438, 'usuario438@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(439, 'usuario439@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(440, 'usuario440@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(441, 'usuario441@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(442, 'usuario442@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(443, 'usuario443@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(444, 'usuario444@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(445, 'usuario445@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(446, 'usuario446@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(447, 'usuario447@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(448, 'usuario448@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(449, 'usuario449@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(450, 'usuario450@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(451, 'usuario451@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(452, 'usuario452@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(453, 'usuario453@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(454, 'usuario454@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(455, 'usuario455@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(456, 'usuario456@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(457, 'usuario457@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(458, 'usuario458@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(459, 'usuario459@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(460, 'usuario460@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(461, 'usuario461@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(462, 'usuario462@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(463, 'usuario463@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(464, 'usuario464@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(465, 'usuario465@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(466, 'usuario466@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(467, 'usuario467@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(468, 'usuario468@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(469, 'usuario469@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(470, 'usuario470@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(471, 'usuario471@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(472, 'usuario472@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(473, 'usuario473@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(474, 'usuario474@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(475, 'usuario475@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(476, 'usuario476@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(477, 'usuario477@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(478, 'usuario478@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(479, 'usuario479@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(480, 'usuario480@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(481, 'usuario481@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(482, 'usuario482@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(483, 'usuario483@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(484, 'usuario484@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(485, 'usuario485@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(486, 'usuario486@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(487, 'usuario487@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(488, 'usuario488@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(489, 'usuario489@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(490, 'usuario490@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(491, 'usuario491@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(492, 'usuario492@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(493, 'usuario493@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(494, 'usuario494@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(495, 'usuario495@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(496, 'usuario496@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(497, 'usuario497@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(498, 'usuario498@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(499, 'usuario499@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(500, 'usuario500@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(501, 'usuario501@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(502, 'usuario502@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(503, 'usuario503@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(504, 'usuario504@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(505, 'usuario505@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(506, 'usuario506@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(507, 'usuario507@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(508, 'usuario508@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(509, 'usuario509@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(510, 'usuario510@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(511, 'usuario511@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(512, 'usuario512@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(513, 'usuario513@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(514, 'usuario514@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(515, 'usuario515@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(516, 'usuario516@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(517, 'usuario517@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(518, 'usuario518@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(519, 'usuario519@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(520, 'usuario520@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(521, 'usuario521@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(522, 'usuario522@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(523, 'usuario523@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(524, 'usuario524@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(525, 'usuario525@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(526, 'usuario526@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(527, 'usuario527@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(528, 'usuario528@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(529, 'usuario529@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(530, 'usuario530@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(531, 'usuario531@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(532, 'usuario532@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(533, 'usuario533@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(534, 'usuario534@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(535, 'usuario535@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(536, 'usuario536@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(537, 'usuario537@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(538, 'usuario538@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(539, 'usuario539@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(540, 'usuario540@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(541, 'usuario541@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(542, 'usuario542@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(543, 'usuario543@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(544, 'usuario544@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(545, 'usuario545@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(546, 'usuario546@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(547, 'usuario547@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(548, 'usuario548@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(549, 'usuario549@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(550, 'usuario550@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(551, 'usuario551@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(552, 'usuario552@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(553, 'usuario553@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(554, 'usuario554@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(555, 'usuario555@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(556, 'usuario556@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(557, 'usuario557@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(558, 'usuario558@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(559, 'usuario559@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(560, 'usuario560@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(561, 'usuario561@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(562, 'usuario562@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(563, 'usuario563@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(564, 'usuario564@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(565, 'usuario565@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(566, 'usuario566@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(567, 'usuario567@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(568, 'usuario568@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(569, 'usuario569@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(570, 'usuario570@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(571, 'usuario571@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(572, 'usuario572@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(573, 'usuario573@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(574, 'usuario574@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(575, 'usuario575@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(576, 'usuario576@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(577, 'usuario577@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(578, 'usuario578@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(579, 'usuario579@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(580, 'usuario580@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(581, 'usuario581@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(582, 'usuario582@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(583, 'usuario583@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(584, 'usuario584@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(585, 'usuario585@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(586, 'usuario586@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(587, 'usuario587@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(588, 'usuario588@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(589, 'usuario589@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(590, 'usuario590@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(591, 'usuario591@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(592, 'usuario592@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(593, 'usuario593@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(594, 'usuario594@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(595, 'usuario595@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(596, 'usuario596@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(597, 'usuario597@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(598, 'usuario598@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(599, 'usuario599@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(600, 'usuario600@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(601, 'usuario601@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(602, 'usuario602@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(603, 'usuario603@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(604, 'usuario604@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(605, 'usuario605@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(606, 'usuario606@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(607, 'usuario607@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(608, 'usuario608@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(609, 'usuario609@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(610, 'usuario610@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(611, 'usuario611@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(612, 'usuario612@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(613, 'usuario613@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(614, 'usuario614@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(615, 'usuario615@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(616, 'usuario616@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(617, 'usuario617@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(618, 'usuario618@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(619, 'usuario619@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(620, 'usuario620@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(621, 'usuario621@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(622, 'usuario622@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(623, 'usuario623@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(624, 'usuario624@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(625, 'usuario625@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(626, 'usuario626@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(627, 'usuario627@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(628, 'usuario628@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(629, 'usuario629@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(630, 'usuario630@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(631, 'usuario631@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(632, 'usuario632@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(633, 'usuario633@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(634, 'usuario634@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(635, 'usuario635@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(636, 'usuario636@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(637, 'usuario637@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(638, 'usuario638@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(639, 'usuario639@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(640, 'usuario640@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(641, 'usuario641@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(642, 'usuario642@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(643, 'usuario643@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(644, 'usuario644@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(645, 'usuario645@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(646, 'usuario646@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(647, 'usuario647@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(648, 'usuario648@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(649, 'usuario649@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(650, 'usuario650@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(651, 'usuario651@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(652, 'usuario652@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(653, 'usuario653@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(654, 'usuario654@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(655, 'usuario655@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(656, 'usuario656@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(657, 'usuario657@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(658, 'usuario658@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(659, 'usuario659@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(660, 'usuario660@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(661, 'usuario661@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(662, 'usuario662@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(663, 'usuario663@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(664, 'usuario664@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(665, 'usuario665@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(666, 'usuario666@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(667, 'usuario667@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(668, 'usuario668@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(669, 'usuario669@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad');
INSERT INTO `comprador` (`idPersona`, `correo`, `contraseña`, `nombre`, `apellido1`, `apellido2`) VALUES
(670, 'usuario670@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(671, 'usuario671@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(672, 'usuario672@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(673, 'usuario673@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(674, 'usuario674@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(675, 'usuario675@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(676, 'usuario676@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(677, 'usuario677@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(678, 'usuario678@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(679, 'usuario679@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(680, 'usuario680@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(681, 'usuario681@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(682, 'usuario682@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(683, 'usuario683@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(684, 'usuario684@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(685, 'usuario685@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(686, 'usuario686@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(687, 'usuario687@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(688, 'usuario688@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(689, 'usuario689@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(690, 'usuario690@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(691, 'usuario691@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(692, 'usuario692@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(693, 'usuario693@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(694, 'usuario694@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(695, 'usuario695@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(696, 'usuario696@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(697, 'usuario697@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(698, 'usuario698@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(699, 'usuario699@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(700, 'usuario700@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(701, 'usuario701@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(702, 'usuario702@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(703, 'usuario703@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(704, 'usuario704@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(705, 'usuario705@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(706, 'usuario706@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(707, 'usuario707@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(708, 'usuario708@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(709, 'usuario709@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(710, 'usuario710@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(711, 'usuario711@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(712, 'usuario712@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(713, 'usuario713@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(714, 'usuario714@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(715, 'usuario715@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(716, 'usuario716@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(717, 'usuario717@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(718, 'usuario718@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(719, 'usuario719@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(720, 'usuario720@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(721, 'usuario721@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(722, 'usuario722@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(723, 'usuario723@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(724, 'usuario724@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(725, 'usuario725@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(726, 'usuario726@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(727, 'usuario727@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(728, 'usuario728@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(729, 'usuario729@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(730, 'usuario730@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(731, 'usuario731@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(732, 'usuario732@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(733, 'usuario733@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(734, 'usuario734@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(735, 'usuario735@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(736, 'usuario736@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(737, 'usuario737@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(738, 'usuario738@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(739, 'usuario739@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(740, 'usuario740@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(741, 'usuario741@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(742, 'usuario742@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(743, 'usuario743@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(744, 'usuario744@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(745, 'usuario745@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(746, 'usuario746@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(747, 'usuario747@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(748, 'usuario748@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(749, 'usuario749@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(750, 'usuario750@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(751, 'usuario751@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(752, 'usuario752@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(753, 'usuario753@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(754, 'usuario754@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(755, 'usuario755@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(756, 'usuario756@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(757, 'usuario757@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(758, 'usuario758@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(759, 'usuario759@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(760, 'usuario760@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(761, 'usuario761@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(762, 'usuario762@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(763, 'usuario763@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(764, 'usuario764@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(765, 'usuario765@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(766, 'usuario766@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(767, 'usuario767@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(768, 'usuario768@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(769, 'usuario769@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(770, 'usuario770@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(771, 'usuario771@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(772, 'usuario772@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(773, 'usuario773@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(774, 'usuario774@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(775, 'usuario775@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(776, 'usuario776@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(777, 'usuario777@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(778, 'usuario778@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(779, 'usuario779@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(780, 'usuario780@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(781, 'usuario781@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(782, 'usuario782@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(783, 'usuario783@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(784, 'usuario784@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(785, 'usuario785@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(786, 'usuario786@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(787, 'usuario787@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(788, 'usuario788@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(789, 'usuario789@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(790, 'usuario790@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(791, 'usuario791@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(792, 'usuario792@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(793, 'usuario793@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(794, 'usuario794@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(795, 'usuario795@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(796, 'usuario796@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(797, 'usuario797@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(798, 'usuario798@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(799, 'usuario799@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(800, 'usuario800@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(801, 'usuario801@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(802, 'usuario802@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(803, 'usuario803@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(804, 'usuario804@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(805, 'usuario805@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(806, 'usuario806@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(807, 'usuario807@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(808, 'usuario808@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(809, 'usuario809@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(810, 'usuario810@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(811, 'usuario811@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(812, 'usuario812@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(813, 'usuario813@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(814, 'usuario814@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(815, 'usuario815@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(816, 'usuario816@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(817, 'usuario817@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(818, 'usuario818@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(819, 'usuario819@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(820, 'usuario820@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(821, 'usuario821@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(822, 'usuario822@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(823, 'usuario823@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(824, 'usuario824@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(825, 'usuario825@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(826, 'usuario826@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(827, 'usuario827@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(828, 'usuario828@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(829, 'usuario829@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(830, 'usuario830@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(831, 'usuario831@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(832, 'usuario832@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(833, 'usuario833@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(834, 'usuario834@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(835, 'usuario835@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(836, 'usuario836@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(837, 'usuario837@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(838, 'usuario838@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(839, 'usuario839@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(840, 'usuario840@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(841, 'usuario841@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(842, 'usuario842@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(843, 'usuario843@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(844, 'usuario844@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(845, 'usuario845@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(846, 'usuario846@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(847, 'usuario847@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(848, 'usuario848@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(849, 'usuario849@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad'),
(850, 'usuario850@ejemplo.com', 'contraseña123', 'Gabriel', 'Fuentelimpia', 'Navidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlador`
--

CREATE TABLE `controlador` (
  `idPersona` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `controlador`
--

INSERT INTO `controlador` (`idPersona`, `correo`, `contraseña`, `nombre`, `apellido1`, `apellido2`) VALUES
(850, 'controlador850@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(851, 'controlador851@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(852, 'controlador852@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(853, 'controlador853@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(854, 'controlador854@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(855, 'controlador855@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(856, 'controlador856@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(857, 'controlador857@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(858, 'controlador858@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(859, 'controlador859@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(860, 'controlador860@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(861, 'controlador861@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(862, 'controlador862@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(863, 'controlador863@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(864, 'controlador864@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(865, 'controlador865@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(866, 'controlador866@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(867, 'controlador867@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(868, 'controlador868@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(869, 'controlador869@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(870, 'controlador870@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(871, 'controlador871@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(872, 'controlador872@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(873, 'controlador873@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(874, 'controlador874@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(875, 'controlador875@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(876, 'controlador876@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(877, 'controlador877@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(878, 'controlador878@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(879, 'controlador879@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(880, 'controlador880@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(881, 'controlador881@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(882, 'controlador882@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(883, 'controlador883@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(884, 'controlador884@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(885, 'controlador885@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(886, 'controlador886@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(887, 'controlador887@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(888, 'controlador888@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(889, 'controlador889@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(890, 'controlador890@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(891, 'controlador891@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(892, 'controlador892@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(893, 'controlador893@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(894, 'controlador894@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(895, 'controlador895@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(896, 'controlador896@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(897, 'controlador897@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(898, 'controlador898@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(899, 'controlador899@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover'),
(900, 'controlador900@estimazon.com', 'contraseña123', 'Esperanza', 'Amengual', 'Alcover');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresadistribuidora`
--

CREATE TABLE `empresadistribuidora` (
  `idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresadistribuidora`
--

INSERT INTO `empresadistribuidora` (`idEmpresa`, `nombreEmpresa`) VALUES
(1, 'General Communication, Inc.'),
(2, 'Federal Realty Investment Trust'),
(3, 'Alamo Group, Inc.'),
(4, 'Goldman Sachs Group, Inc. (The)'),
(5, 'The Meet Group, Inc.'),
(6, 'WisdomTree Middle East Dividend Fund'),
(7, 'Atento S.A.'),
(8, 'Qumu Corporation'),
(9, 'BlackRock 2022 Global Income Opportunity Trust'),
(10, 'Pacific Ethanol, Inc.'),
(11, 'Eaton vance Floating-Rate Income Plus Fund'),
(12, 'Electrum Special Acquisition Corporation'),
(13, 'Continental Resources, Inc.'),
(14, 'TerraForm Global, Inc.'),
(15, 'Northern Trust Corporation'),
(16, 'BRT Apartments Corp.'),
(17, 'Duke Energy Corporation'),
(18, 'ChinaCache International Holdings Ltd.'),
(19, 'M I Acquisitions, Inc.'),
(20, 'Equity Lifestyle Properties, Inc.'),
(21, 'iPath US Treasury 2-year Bear ETN'),
(22, 'Origo Acquisition Corporation'),
(23, 'Blackrock Municipal 2020 Term Trust'),
(24, 'LivePerson, Inc.'),
(25, 'Norwood Financial Corp.'),
(26, 'Momo Inc.'),
(27, 'Mednax, Inc'),
(28, 'Antero Midstream GP LP'),
(29, 'Zions Bancorporation'),
(30, 'Allegion plc'),
(31, 'Comtech Telecommunications Corp.'),
(32, 'Aimmune Therapeutics, Inc.'),
(33, 'Berkshire Hathaway Inc.'),
(34, 'Cedar Realty Trust, Inc.'),
(35, 'Alkermes plc'),
(36, 'Global Partner Acquisition Corp.'),
(37, 'WisdomTree U.S. Quality Dividend Growth Fund'),
(38, 'United Community Bancorp'),
(39, 'John Hancock Preferred Income Fund'),
(40, 'Scorpio Tankers Inc.'),
(41, 'Highland Funds I'),
(42, 'Lion Biotechnologies, Inc.'),
(43, 'Pieris Pharmaceuticals, Inc.'),
(44, 'Allscripts Healthcare Solutions, Inc.'),
(45, 'Saban Capital Acquisition Corp.'),
(46, 'CoreCivic, Inc.'),
(47, 'CA Inc.'),
(48, 'John Wiley & Sons, Inc.'),
(49, 'Preformed Line Products Company'),
(50, 'Neurotrope, Inc.'),
(51, 'Aquinox Pharmaceuticals, Inc.'),
(52, 'Martin Midstream Partners L.P.'),
(53, 'SPI Energy Co., Ltd.'),
(54, 'The Advisory Board Company'),
(55, 'Cowen Inc.'),
(57, 'Interface, Inc.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `idIncidencia` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `idPedido` int(11) NOT NULL,
  `tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fechaConfirmacion` date DEFAULT NULL,
  `idZona` int(11) DEFAULT NULL,
  `idComprador` int(11) NOT NULL,
  `idRepartidor` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `idVendedor` int(11) NOT NULL,
  `nombreCategoria` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `precio`, `descripcion`, `stock`, `idVendedor`, `nombreCategoria`) VALUES
(1, 'Pan Integral', 2, 'Pan integral horneado diariamente, ideal para desayunos nutritivos.', 50, 93, 'alimentos'),
(2, 'Leche Entera', 1, 'Leche entera pasteurizada, rica en calcio y vitaminas.', 80, 58, 'alimentos'),
(3, 'Queso Cheddar', 4, 'Queso cheddar añejo, perfecto para gratinar o en sándwiches.', 70, 10, 'alimentos'),
(4, 'Yogur Natural', 1, 'Yogur natural sin azúcar añadido, ideal para un desayuno ligero.', 60, 77, 'alimentos'),
(5, 'Espinacas Frescas', 1, 'Hojas de espinaca frescas, una excelente fuente de hierro y vitaminas.', 90, 54, 'alimentos'),
(6, 'Zanahorias', 2, 'Zanahorias crujientes y dulces, perfectas para ensaladas o como snack.', 110, 39, 'alimentos'),
(7, 'Tomates Cherry', 2, 'Tomates cherry jugosos, ideales para aperitivos o ensaladas.', 120, 33, 'alimentos'),
(8, 'Pollo Entero', 8, 'Pollo entero, fresco y listo para cocinar.', 30, 45, 'alimentos'),
(9, 'Salmón Fresco', 10, 'Filetes de salmón fresco, ricos en omega 3.', 40, 28, 'alimentos'),
(10, 'Arroz Basmati', 3, 'Arroz basmati de grano largo, ideal para platos exóticos.', 70, 4, 'alimentos'),
(11, 'Lentejas', 2, 'Lentejas ricas en proteínas, perfectas para guisos y ensaladas.', 85, 37, 'alimentos'),
(12, 'Huevos de Corral', 2, 'Huevos de corral, frescos y nutritivos.', 95, 70, 'alimentos'),
(13, 'Chocolate Negro', 3, 'Chocolate negro con un 70% de cacao, rico y antioxidante.', 65, 38, 'alimentos'),
(14, 'Aceite de Oliva', 5, 'Aceite de oliva virgen extra, ideal para aderezos y cocinar.', 55, 79, 'alimentos'),
(15, 'Pasta Fusilli', 1, 'Pasta fusilli, perfecta para platos rápidos y sabrosos.', 100, 80, 'alimentos'),
(16, 'Té Verde', 4, 'Té verde, antioxidante y refrescante.', 80, 63, 'alimentos'),
(17, 'Café Molido', 4, 'Café molido de tueste natural, ideal para comenzar el día.', 75, 75, 'alimentos'),
(18, 'Almendras', 3, 'Almendras crudas, un snack saludable y energético.', 60, 85, 'alimentos'),
(19, 'Kit de Pinturas Acrílicas', 16, 'Set de pinturas acrílicas de colores variados para todo tipo de manualidades.', 40, 27, 'Arte y manualidades'),
(20, 'Pinceles de Diferentes Tamaños', 10, 'Juego de pinceles en varios tamaños, ideales para pintura detallada y de grandes superficies.', 35, 31, 'Arte y manualidades'),
(21, 'Papel de Origami', 5, 'Papel de origami en colores brillantes y estampados, para crear figuras y decoraciones únicas.', 50, 75, 'Arte y manualidades'),
(22, 'Set de Scrapbooking', 20, 'Kit completo para scrapbooking, incluye papeles, pegatinas y herramientas.', 30, 82, 'Arte y manualidades'),
(23, 'Hilo para Tejer', 7, 'Hilos de colores para tejer, suaves y duraderos, ideales para todo tipo de proyectos de tejido.', 45, 82, 'Arte y manualidades'),
(24, 'Perlas y Abalorios', 8, 'Variedad de perlas y abalorios para la creación de joyería y accesorios decorativos.', 55, 64, 'Arte y manualidades'),
(25, 'Kit de Modelado de Arcilla', 15, 'Kit completo para modelado de arcilla, incluye herramientas y arcilla de secado al aire.', 25, 72, 'Arte y manualidades'),
(26, 'Set de Sellos Decorativos', 9, 'Colección de sellos con distintos motivos y patrones, perfectos para personalizar tarjetas y proyectos de papel.', 40, 70, 'Arte y manualidades'),
(27, 'Pegamento para Manualidades', 4, 'Pegamento no tóxico, ideal para todo tipo de proyectos de manualidades.', 60, 33, 'Arte y manualidades'),
(28, 'Cintas Decorativas', 6, 'Cintas de varios colores y diseños, perfectas para decorar y embellecer proyectos.', 50, 52, 'Arte y manualidades'),
(29, 'Kit de Bordado Básico', 12, 'Kit de inicio para bordado que incluye hilos, agujas y tela, ideal para principiantes.', 30, 63, 'Arte y manualidades'),
(30, 'Juego de Sábanas de Algodón', 26, 'Sábanas de algodón suave, tamaño queen, incluye fundas de almohada.', 20, 94, 'Artículos para el hogar'),
(31, 'Set de Utensilios de Cocina', 35, 'Set completo de utensilios de cocina de acero inoxidable, incluye espátula, cucharón y más.', 15, 89, 'Artículos para el hogar'),
(32, 'Lámpara de Mesa Moderna', 46, 'Lámpara de mesa con diseño moderno, perfecta para salones o dormitorios.', 10, 61, 'Artículos para el hogar'),
(33, 'Toallas de Baño de Microfibra', 20, 'Juego de toallas de microfibra suaves, absorbentes y de secado rápido.', 30, 39, 'Artículos para el hogar'),
(34, 'Vajilla de Porcelana', 60, 'Juego de vajilla de porcelana para 6 personas, incluye platos, tazas y cuencos.', 12, 13, 'Artículos para el hogar'),
(35, 'Aspiradora Inalámbrica', 90, 'Aspiradora inalámbrica potente y ligera, ideal para todo tipo de suelos.', 8, 45, 'Artículos para el hogar'),
(36, 'Juego de Cuchillos de Chef', 55, 'Set de cuchillos de chef de alta calidad, incluye afilador y soporte.', 18, 85, 'Artículos para el hogar'),
(37, 'Cortinas Opacas', 40, 'Cortinas opacas para bloquear la luz, perfectas para dormitorios y salas de estar.', 25, 92, 'Artículos para el hogar'),
(38, 'Robot de Cocina', 120, 'Robot de cocina multifuncional, ideal para preparar una variedad de platos fácilmente.', 6, 5, 'Artículos para el hogar'),
(39, 'Manta de Lana', 30, 'Manta de lana suave y cálida, ideal para las noches frías.', 20, 47, 'Artículos para el hogar'),
(40, 'Smartphone de Alta Gama', 700, 'Smartphone con pantalla OLED de 6.5 pulgadas, cámara triple y 128GB de almacenamiento.', 20, 16, 'Electrónica'),
(41, 'Portátil Ultraligero', 850, 'Portátil ultraligero de 13 pulgadas, ideal para trabajo y entretenimiento.', 15, 39, 'Electrónica'),
(42, 'Auriculares Inalámbricos', 60, 'Auriculares inalámbricos con cancelación de ruido y calidad de sonido superior.', 30, 46, 'Electrónica'),
(43, 'Consola de Videojuegos', 399, 'Consola de videojuegos de última generación con gráficos 4K.', 25, 12, 'Electrónica'),
(44, 'Cámara Digital DSLR', 500, 'Cámara DSLR con lentes intercambiables y alta resolución para fotografía profesional.', 10, 24, 'Electrónica'),
(45, 'Tableta Gráfica', 200, 'Tableta gráfica con lápiz sensible a la presión, ideal para diseñadores y artistas.', 18, 81, 'Electrónica'),
(46, 'Smartwatch Deportivo', 150, 'Smartwatch deportivo con seguimiento de actividad, GPS integrado y resistencia al agua.', 22, 34, 'Electrónica'),
(47, 'Altavoz Bluetooth Portátil', 90, 'Altavoz Bluetooth portátil con excelente calidad de sonido y batería de larga duración.', 35, 24, 'Electrónica'),
(48, 'Drone con Cámara', 250, 'Drone con cámara HD, control remoto y características para vuelo estable.', 12, 20, 'Electrónica'),
(49, 'Impresora Multifuncional', 120, 'Impresora multifuncional con capacidad de imprimir, escanear y copiar documentos.', 20, 28, 'Electrónica'),
(50, 'Guitarra Acústica', 120, 'Guitarra acústica de madera con excelente sonido y acabado.', 15, 89, 'Instrumentos musicales'),
(51, 'Teclado Electrónico', 200, 'Teclado electrónico con múltiples modos de sonido y acompañamiento.', 10, 59, 'Instrumentos musicales'),
(52, 'Violín Clásico', 250, 'Violín clásico de tamaño completo, ideal para estudiantes y profesionales.', 8, 27, 'Instrumentos musicales'),
(53, 'Batería Electrónica', 300, 'Batería electrónica compacta, perfecta para práctica en espacios reducidos.', 5, 58, 'Instrumentos musicales'),
(54, 'Saxofón Alto', 400, 'Saxofón alto en acabado dorado, incluye estuche y accesorios.', 4, 8, 'Instrumentos musicales'),
(55, 'Flauta Travesera', 100, 'Flauta travesera de níquel plata, adecuada para principiantes y estudiantes.', 12, 66, 'Instrumentos musicales'),
(56, 'Ukelele Soprano', 60, 'Ukelele soprano con cuerpo de madera, ideal para músicos de todos los niveles.', 20, 6, 'Instrumentos musicales'),
(57, 'Micrófono Condensador', 80, 'Micrófono condensador de estudio, ideal para grabaciones de voz y instrumentos.', 15, 30, 'Instrumentos musicales'),
(58, 'Controlador DJ', 150, 'Controlador DJ con pads sensibles al tacto y software integrado.', 7, 32, 'Instrumentos musicales'),
(59, 'Amplificador para Guitarra', 130, 'Amplificador de guitarra de 50W, con efectos incorporados y salida para auriculares.', 10, 68, 'Instrumentos musicales'),
(60, 'Muñeca Interactiva', 30, 'Muñeca interactiva con voz y movimientos, ideal para niños de más de 3 años.', 30, 42, 'Juguetes'),
(61, 'Set de Bloques de Construcción', 20, 'Set de bloques de construcción en colores vivos, estimula la creatividad y la motricidad fina.', 40, 48, 'Juguetes'),
(62, 'Coche a Control Remoto', 35, 'Coche a control remoto de alta velocidad, con batería recargable y resistente a los choques.', 25, 13, 'Juguetes'),
(63, 'Peluche de Oso Gigante', 50, 'Peluche de oso gigante, suave y abrazable, perfecto para regalar.', 15, 20, 'Juguetes'),
(64, 'Juego de Mesa Familiar', 25, 'Juego de mesa familiar divertido y educativo, ideal para noches de juego en familia.', 20, 59, 'Juguetes'),
(65, 'Puzzle 3D', 15, 'Puzzle 3D con diseño desafiante, promueve el pensamiento lógico y la paciencia.', 30, 38, 'Juguetes'),
(66, 'Figuras de Acción Coleccionables', 10, 'Figuras de acción coleccionables, con detalles auténticos y articulaciones móviles.', 50, 9, 'Juguetes'),
(67, 'Kit de Ciencia para Niños', 30, 'Kit de ciencia educativo para niños, incluye experimentos seguros y divertidos.', 22, 34, 'Juguetes'),
(68, 'Dron para Niños', 45, 'Dron diseñado para niños, fácil de operar y con características de seguridad.', 18, 40, 'Juguetes'),
(69, 'Cocina de Juguete', 40, 'Cocina de juguete interactiva con luces y sonidos, incluye accesorios de cocina.', 20, 100, 'Juguetes'),
(70, 'Novela de Misterio \"La Sombra del Viento\"', 13, 'Novela de misterio ambientada en la Barcelona de posguerra, una trama envolvente y misteriosa.', 40, 90, 'Libros'),
(71, 'Libro de Cocina \"Sabores del Mundo\"', 25, 'Recetas de diferentes culturas, ideal para explorar nuevos sabores y técnicas culinarias.', 30, 13, 'Libros'),
(72, 'Guía de Viajes \"Europa en 30 Días\"', 18, 'Guía práctica para viajar por Europa, con consejos, mapas y recomendaciones.', 20, 94, 'Libros'),
(73, 'Biografía \"La Vida de Leonardo Da Vinci\"', 16, 'Biografía detallada de Leonardo Da Vinci, explorando su vida, obra y legado.', 25, 30, 'Libros'),
(74, 'Libro Infantil \"Aventuras en el Espacio\"', 10, 'Libro ilustrado para niños, lleno de aventuras y descubrimientos en el espacio.', 35, 68, 'Libros'),
(75, 'Manual de Jardinería \"El Jardín en Casa\"', 20, 'Guía completa para el cuidado de jardines, ideal para aficionados y expertos.', 15, 51, 'Libros'),
(76, 'Novela Histórica \"Imperio Perdido\"', 15, 'Novela que narra la historia de un imperio antiguo, llena de intriga y drama.', 22, 48, 'Libros'),
(77, 'Libro de Autoayuda \"Cambia tu Mente\"', 11, 'Consejos prácticos para mejorar la salud mental y el bienestar emocional.', 40, 88, 'Libros'),
(78, 'Colección de Poesía \"Versos del Alma\"', 14, 'Colección de poemas que exploran diferentes emociones y experiencias humanas.', 18, 97, 'Libros'),
(79, 'Ciencia Ficción \"Mundos Paralelos\"', 17, 'Novela de ciencia ficción con un viaje a través de universos paralelos y realidades alternas.', 20, 17, 'Libros'),
(80, 'Paquete de Papel A4', 6, 'Paquete de 500 hojas de papel A4, calidad premium, ideal para impresión y fotocopias.', 50, 72, 'Oficina y papelería'),
(81, 'Bolígrafos de Tinta Gel', 10, 'Set de 10 bolígrafos de tinta gel en colores variados, perfectos para notas y subrayado.', 60, 45, 'Oficina y papelería'),
(82, 'Calculadora Científica', 15, 'Calculadora científica avanzada, adecuada para estudiantes y profesionales.', 30, 10, 'Oficina y papelería'),
(83, 'Carpeta Organizadora', 8, 'Carpeta organizadora con múltiples compartimentos, ideal para documentos importantes.', 40, 13, 'Oficina y papelería'),
(84, 'Agenda Personal 2023', 13, 'Agenda personal para el año 2023 con espacio para notas y citas diarias.', 55, 34, 'Oficina y papelería'),
(85, 'Sobres Manilla Tamaño Carta', 5, 'Paquete de 25 sobres manilla tamaño carta, ideales para envíos postales y almacenamiento de documentos.', 70, 31, 'Oficina y papelería'),
(86, 'Marcadores Fluorescentes', 9, 'Set de 6 marcadores fluorescentes, duraderos y perfectos para resaltar texto.', 45, 52, 'Oficina y papelería'),
(87, 'Pizarra Blanca Magnética', 20, 'Pizarra blanca magnética de tamaño mediano, incluye marcadores y borrador.', 25, 67, 'Oficina y papelería'),
(88, 'Dispensador de Cinta Adhesiva', 7, 'Dispensador de cinta adhesiva práctico y resistente, incluye una cinta adhesiva.', 50, 78, 'Oficina y papelería'),
(89, 'Archivador de Palanca', 10, 'Archivador de palanca en tamaño A4, con capacidad para 500 hojas, ideal para organizar documentos.', 35, 89, 'Oficina y papelería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedadesproducto`
--

CREATE TABLE `propiedadesproducto` (
  `fechaDeLlegada` date DEFAULT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `qtt` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `idPersona` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`idPersona`, `idEmpresa`, `correo`, `contraseña`, `nombre`, `apellido1`, `apellido2`) VALUES
(900, 18, '900@18.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(901, 44, '901@44.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(902, 7, '902@7.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(903, 35, '903@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(904, 40, '904@40.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(905, 25, '905@25.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(906, 51, '906@51.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(907, 27, '907@27.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(908, 17, '908@17.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(909, 42, '909@42.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(910, 51, '910@51.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(911, 37, '911@37.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(912, 15, '912@15.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(913, 35, '913@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(914, 10, '914@10.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(915, 14, '915@14.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(916, 51, '916@51.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(917, 44, '917@44.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(918, 16, '918@16.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(919, 34, '919@34.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(920, 47, '920@47.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(921, 16, '921@16.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(922, 35, '922@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(923, 50, '923@50.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(924, 29, '924@29.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(925, 31, '925@31.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(926, 51, '926@51.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(927, 54, '927@54.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(928, 15, '928@15.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(929, 42, '929@42.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(930, 54, '930@54.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(931, 52, '931@52.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(932, 24, '932@24.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(933, 48, '933@48.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(934, 33, '934@33.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(935, 26, '935@26.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(936, 49, '936@49.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(937, 40, '937@40.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(938, 26, '938@26.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(939, 20, '939@20.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(940, 51, '940@51.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(941, 46, '941@46.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(942, 40, '942@40.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(943, 26, '943@26.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(944, 54, '944@54.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(945, 28, '945@28.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(946, 20, '946@20.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(947, 1, '947@1.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(948, 30, '948@30.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(949, 52, '949@52.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(950, 54, '950@54.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(951, 49, '951@49.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(952, 12, '952@12.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(953, 19, '953@19.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(954, 22, '954@22.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(955, 26, '955@26.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(956, 57, '956@57.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(957, 14, '957@14.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(958, 1, '958@1.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(959, 35, '959@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(960, 35, '960@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(961, 30, '961@30.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(962, 29, '962@29.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(963, 36, '963@36.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(964, 11, '964@11.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(965, 47, '965@47.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(966, 18, '966@18.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(967, 34, '967@34.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(968, 33, '968@33.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(969, 34, '969@34.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(970, 31, '970@31.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(971, 39, '971@39.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(972, 28, '972@28.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(973, 53, '973@53.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(974, 20, '974@20.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(975, 45, '975@45.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(976, 35, '976@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(977, 15, '977@15.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(978, 10, '978@10.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(979, 6, '979@6.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(980, 29, '980@29.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(981, 35, '981@35.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(982, 7, '982@7.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(983, 40, '983@40.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(984, 12, '984@12.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(985, 6, '985@6.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(986, 32, '986@32.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(987, 27, '987@27.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(988, 49, '988@49.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(989, 57, '989@57.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(990, 21, '990@21.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(991, 4, '991@4.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(992, 49, '992@49.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(993, 48, '993@48.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(994, 48, '994@48.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(995, 37, '995@37.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(996, 42, '996@42.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(997, 22, '997@22.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(998, 47, '998@47.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(999, 36, '999@36.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume'),
(1000, 48, '1000@48.com', 'contraseña123', 'Jaume', 'Jaume', 'Jaume');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_comprador_tarjetadecredito`
--

CREATE TABLE `r_comprador_tarjetadecredito` (
  `idComprador` int(11) NOT NULL,
  `numTarjeta` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_repartea`
--

CREATE TABLE `r_repartea` (
  `idEmpresa` int(11) NOT NULL,
  `idZona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_tienedomicilioen`
--

CREATE TABLE `r_tienedomicilioen` (
  `idComprador` int(11) NOT NULL,
  `idZona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_tieneedificiosen`
--

CREATE TABLE `r_tieneedificiosen` (
  `idZona` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetacredito`
--

CREATE TABLE `tarjetacredito` (
  `numTarjeta` varchar(16) NOT NULL,
  `CVC` varchar(4) NOT NULL,
  `fechaCad` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoincidencia`
--

CREATE TABLE `tipoincidencia` (
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoincidencia`
--

INSERT INTO `tipoincidencia` (`tipo`) VALUES
('Comprador/a no encontrado'),
('En proceso de repartimiento'),
('Entregado al comprador/a'),
('Entregado en otro domicilio'),
('Rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idPersona` int(11) NOT NULL,
  `numAvisos` int(11) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`idPersona`, `numAvisos`, `correo`, `contraseña`, `nombre`, `apellido1`, `apellido2`) VALUES
(1, 0, 'vendedor1@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(2, 1, 'vendedor2@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(3, 1, 'vendedor3@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(4, 0, 'vendedor4@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(5, 1, 'vendedor5@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(6, 0, 'vendedor6@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(7, 0, 'vendedor7@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(8, 0, 'vendedor8@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(9, 0, 'vendedor9@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(10, 1, 'vendedor10@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(11, 0, 'vendedor11@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(12, 0, 'vendedor12@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(13, 0, 'vendedor13@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(14, 0, 'vendedor14@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(15, 0, 'vendedor15@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(16, 1, 'vendedor16@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(17, 0, 'vendedor17@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(18, 0, 'vendedor18@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(19, 0, 'vendedor19@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(20, 1, 'vendedor20@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(21, 0, 'vendedor21@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(22, 1, 'vendedor22@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(23, 0, 'vendedor23@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(24, 0, 'vendedor24@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(25, 1, 'vendedor25@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(26, 0, 'vendedor26@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(27, 1, 'vendedor27@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(28, 0, 'vendedor28@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(29, 0, 'vendedor29@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(30, 1, 'vendedor30@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(31, 0, 'vendedor31@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(32, 0, 'vendedor32@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(33, 0, 'vendedor33@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(34, 0, 'vendedor34@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(35, 1, 'vendedor35@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(36, 0, 'vendedor36@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(37, 1, 'vendedor37@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(38, 0, 'vendedor38@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(39, 0, 'vendedor39@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(40, 0, 'vendedor40@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(41, 0, 'vendedor41@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(42, 0, 'vendedor42@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(43, 1, 'vendedor43@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(44, 0, 'vendedor44@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(45, 0, 'vendedor45@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(46, 1, 'vendedor46@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(47, 1, 'vendedor47@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(48, 1, 'vendedor48@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(49, 1, 'vendedor49@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(50, 0, 'vendedor50@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(51, 0, 'vendedor51@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(52, 1, 'vendedor52@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(53, 1, 'vendedor53@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(54, 0, 'vendedor54@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(55, 0, 'vendedor55@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(56, 1, 'vendedor56@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(57, 1, 'vendedor57@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(58, 1, 'vendedor58@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(59, 1, 'vendedor59@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(60, 1, 'vendedor60@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(61, 1, 'vendedor61@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(62, 0, 'vendedor62@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(63, 0, 'vendedor63@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(64, 1, 'vendedor64@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(65, 1, 'vendedor65@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(66, 1, 'vendedor66@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(67, 1, 'vendedor67@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(68, 1, 'vendedor68@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(69, 0, 'vendedor69@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(70, 0, 'vendedor70@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(71, 1, 'vendedor71@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(72, 0, 'vendedor72@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(73, 1, 'vendedor73@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(74, 1, 'vendedor74@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(75, 1, 'vendedor75@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(76, 0, 'vendedor76@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(77, 0, 'vendedor77@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(78, 0, 'vendedor78@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(79, 1, 'vendedor79@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(80, 0, 'vendedor80@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(81, 1, 'vendedor81@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(82, 0, 'vendedor82@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(83, 1, 'vendedor83@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(84, 1, 'vendedor84@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(85, 0, 'vendedor85@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(86, 1, 'vendedor86@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(87, 1, 'vendedor87@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(88, 1, 'vendedor88@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(89, 1, 'vendedor89@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(90, 0, 'vendedor90@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(91, 1, 'vendedor91@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(92, 1, 'vendedor92@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(93, 0, 'vendedor93@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(94, 1, 'vendedor94@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(95, 1, 'vendedor95@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(96, 0, 'vendedor96@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(97, 0, 'vendedor97@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(98, 1, 'vendedor98@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(99, 0, 'vendedor99@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb'),
(100, 0, 'vendedor100@ejemplo.com', 'contraseña123', 'Jeff', 'Bezos', 'Sozeb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `idZona` int(11) NOT NULL,
  `nombreZona` varchar(25) NOT NULL,
  `idZonaPadre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nombreCategoria`);

--
-- Indices de la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`idPersona`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `controlador`
--
ALTER TABLE `controlador`
  ADD PRIMARY KEY (`idPersona`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `empresadistribuidora`
--
ALTER TABLE `empresadistribuidora`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`idIncidencia`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idZona` (`idZona`),
  ADD KEY `idComprador` (`idComprador`),
  ADD KEY `idRepartidor` (`idRepartidor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idVendedor` (`idVendedor`),
  ADD KEY `nombreCategoria` (`nombreCategoria`);

--
-- Indices de la tabla `propiedadesproducto`
--
ALTER TABLE `propiedadesproducto`
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`idPersona`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `idEmpresa` (`idEmpresa`);

--
-- Indices de la tabla `r_comprador_tarjetadecredito`
--
ALTER TABLE `r_comprador_tarjetadecredito`
  ADD PRIMARY KEY (`idComprador`,`numTarjeta`),
  ADD KEY `numTarjeta` (`numTarjeta`);

--
-- Indices de la tabla `r_repartea`
--
ALTER TABLE `r_repartea`
  ADD PRIMARY KEY (`idEmpresa`,`idZona`),
  ADD KEY `idZona` (`idZona`);

--
-- Indices de la tabla `r_tienedomicilioen`
--
ALTER TABLE `r_tienedomicilioen`
  ADD PRIMARY KEY (`idComprador`,`idZona`),
  ADD KEY `idZona` (`idZona`);

--
-- Indices de la tabla `r_tieneedificiosen`
--
ALTER TABLE `r_tieneedificiosen`
  ADD PRIMARY KEY (`idZona`),
  ADD KEY `idEmpresa` (`idEmpresa`);

--
-- Indices de la tabla `tarjetacredito`
--
ALTER TABLE `tarjetacredito`
  ADD PRIMARY KEY (`numTarjeta`);

--
-- Indices de la tabla `tipoincidencia`
--
ALTER TABLE `tipoincidencia`
  ADD PRIMARY KEY (`tipo`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idPersona`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`idZona`),
  ADD KEY `idZonaPadre` (`idZonaPadre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprador`
--
ALTER TABLE `comprador`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;

--
-- AUTO_INCREMENT de la tabla `controlador`
--
ALTER TABLE `controlador`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=901;

--
-- AUTO_INCREMENT de la tabla `empresadistribuidora`
--
ALTER TABLE `empresadistribuidora`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `idIncidencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `idZona` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `incidencia_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `tipoincidencia` (`tipo`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idComprador`) REFERENCES `comprador` (`idPersona`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idRepartidor`) REFERENCES `repartidor` (`idPersona`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idPersona`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`nombreCategoria`) REFERENCES `categoria` (`nombreCategoria`);

--
-- Filtros para la tabla `propiedadesproducto`
--
ALTER TABLE `propiedadesproducto`
  ADD CONSTRAINT `propiedadesproducto_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `propiedadesproducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresadistribuidora` (`idEmpresa`);

--
-- Filtros para la tabla `r_comprador_tarjetadecredito`
--
ALTER TABLE `r_comprador_tarjetadecredito`
  ADD CONSTRAINT `r_comprador_tarjetadecredito_ibfk_1` FOREIGN KEY (`idComprador`) REFERENCES `comprador` (`idPersona`),
  ADD CONSTRAINT `r_comprador_tarjetadecredito_ibfk_2` FOREIGN KEY (`numTarjeta`) REFERENCES `tarjetacredito` (`numTarjeta`);

--
-- Filtros para la tabla `r_repartea`
--
ALTER TABLE `r_repartea`
  ADD CONSTRAINT `r_repartea_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresadistribuidora` (`idEmpresa`),
  ADD CONSTRAINT `r_repartea_ibfk_2` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`);

--
-- Filtros para la tabla `r_tienedomicilioen`
--
ALTER TABLE `r_tienedomicilioen`
  ADD CONSTRAINT `r_tienedomicilioen_ibfk_1` FOREIGN KEY (`idComprador`) REFERENCES `comprador` (`idPersona`),
  ADD CONSTRAINT `r_tienedomicilioen_ibfk_2` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`);

--
-- Filtros para la tabla `r_tieneedificiosen`
--
ALTER TABLE `r_tieneedificiosen`
  ADD CONSTRAINT `r_tieneedificiosen_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresadistribuidora` (`idEmpresa`),
  ADD CONSTRAINT `r_tieneedificiosen_ibfk_2` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`);

--
-- Filtros para la tabla `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `zona_ibfk_1` FOREIGN KEY (`idZonaPadre`) REFERENCES `zona` (`idZona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
