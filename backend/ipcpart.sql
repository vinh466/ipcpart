-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3360
-- Thời gian đã tạo: Th12 11, 2022 lúc 06:16 AM
-- Phiên bản máy phục vụ: 10.8.3-MariaDB
-- Phiên bản PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tmp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cpus`
--

DROP TABLE IF EXISTS `cpus`;
CREATE TABLE IF NOT EXISTS `cpus` (
  `cpuId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cpuTypeId` int(11) DEFAULT NULL,
  `coreCount` int(11) DEFAULT NULL,
  `coreClock` char(10) DEFAULT NULL,
  `coreBoost` char(10) DEFAULT NULL,
  `thread` int(11) DEFAULT NULL,
  `tdp` char(10) DEFAULT NULL,
  `iGpu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cpuId`),
  UNIQUE KEY `id_UNIQUE` (`cpuId`),
  KEY `cpuTypeId` (`cpuTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cpus`
--

INSERT IGNORE INTO `cpus` (`cpuId`, `cpuTypeId`, `coreCount`, `coreClock`, `coreBoost`, `thread`, `tdp`, `iGpu`) VALUES
('03601ea7-597f-4c27-889c-05fe7a30b146', 50, 24, '3.8 GHz', '4.5 GHz', 0, '280 W', 'None'),
('03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 52, 6, '3.7 GHz', '4.6 GHz', 0, '65 W', 'None'),
('0409b5c1-7e2a-4390-b9ad-fc17c3587696', 47, 6, '3.6 GHz', '4.2 GHz', 0, '65 W', 'None'),
('0613a5fe-ab62-4649-b702-b2ffce53a9b0', 6, 6, '2.6 GHz', '4.4 GHz', 0, '65 W', 'None'),
('06e27255-afe0-4833-a314-e3b95e82fc21', 52, 6, '3.9 GHz', '4.4 GHz', 0, '65 W', 'Radeon Vega 7'),
('0b23e0f6-1b1e-4396-b1e6-4a290ab9da16', 47, 4, '3.7 GHz', '4.2 GHz', 0, '65 W', 'Radeon Vega 11'),
('0d2e12c6-9df8-4705-bf8a-806bca02c524', 4, 16, '3.2 GHz', '5.2 GHz', 0, '125 W', 'Intel UHD Graphics 770'),
('1f5b79a7-c3f4-413c-91f4-d5dae1157c3d', 47, 6, '3.6 GHz', '4.2 GHz', 0, '65 W', 'None'),
('20639afa-7d89-4463-bfad-b2a0f2244024', 3, 16, '3.4 GHz', '5.4 GHz', 0, '125 W', 'Intel UHD Graphics 770'),
('2142571f-f66e-4ed9-b1a7-519aa5c72431', 4, 24, '3 GHz', '5.8 GHz', 0, '125 W', 'None'),
('2142927a-9be2-4d17-9682-218c996ad9b6', 3, 12, '2.1 GHz', '4.9 GHz', 0, '65 W', 'Intel UHD Graphics 770'),
('219266d4-3dad-475e-b8e3-388b9fa8ac35', 15, 8, '3.6 GHz', '4.9 GHz', 0, '95 W', 'Intel UHD Graphics 630'),
('229a7ae5-54d0-4c1f-beda-ff7fa5e91008', 49, 16, '3.5 GHz', '4.7 GHz', 0, '105 W', 'None'),
('2325f6e2-dd7a-46fd-bc13-9b1db3f26bd4', 14, 6, '2.9 GHz', '4.1 GHz', 0, '65 W', 'None'),
('241e4d63-0b06-43e9-8363-b5662f418373', 8, 8, '3.5 GHz', '5.3 GHz', 0, '125 W', 'Intel UHD Graphics 750'),
('242dd071-98a9-49a3-96d0-88effc7cd06c', 6, 6, '3.9 GHz', '4.9 GHz', 0, '125 W', 'None'),
('2a456f13-b167-46ef-b6f6-9ddf4d5dde16', 19, 6, '3.2 GHz', '4.6 GHz', 0, '65 W', 'Intel UHD Graphics 630'),
('2b2aea69-7483-4227-93f4-0cb251d02787', 39, 6, '3.2 GHz', '3.6 GHz', 0, '65 W', 'None'),
('2d900d23-e12c-42eb-8c1b-0cf7a7fe5475', 49, 12, '3.8 GHz', '4.6 GHz', 0, '105 W', 'None'),
('2eb82a0a-029b-4043-ba9a-c5f92621067f', 46, 4, '3.6 GHz', '4 GHz', 0, '65 W', 'Radeon Vega 8'),
('31ea8e58-bb8e-41e6-b84a-96dd4b28e7e3', 53, 8, '3.4 GHz', '4.5 GHz', 0, '105 W', 'None'),
('31f3a9a8-822e-4e31-ae18-027aeedfd283', 2, 14, '3.5 GHz', '5.1 GHz', 0, '125 W', 'Intel UHD Graphics 770'),
('34c58ab8-e354-49b6-8bec-9e3ac7e6a14a', 47, 6, '3.6 GHz', '4.1 GHz', 0, '65 W', 'None'),
('3ad6155b-9ebe-4222-8bb3-ff9fa2fdb011', 7, 8, '3.6 GHz', '5 GHz', 0, '125 W', 'None'),
('3d04eef4-0087-4532-8747-31f758d090bd', 4, 16, '3.2 GHz', '5.2 GHz', 0, '125 W', 'None'),
('3dd9b270-c52d-40a5-8713-fc4aa8d00247', 3, 16, '3.4 GHz', '5.4 GHz', 0, '125 W', 'None'),
('3e815ea2-d185-408d-9591-6b7d0ae5d7f3', 12, 10, '3.7 GHz', '5.3 GHz', 0, '125 W', 'None'),
('4095e1d4-9b8a-4b80-9126-29d5094e5706', 14, 6, '3.7 GHz', '4.6 GHz', 0, '95 W', 'Intel UHD Graphics 630'),
('428fd785-30b5-4684-abea-d969b60dbb38', 2, 6, '3 GHz', '4.6 GHz', 0, '65 W', 'Intel UHD Graphics 770'),
('438d2242-2b23-4d82-abf8-b830fd1bb525', 3, 12, '2.1 GHz', '4.9 GHz', 0, '65 W', 'None'),
('44207321-42a4-4009-89f2-6eaed007f838', 18, 6, '3.6 GHz', '4.3 GHz', 0, '95 W', 'Intel UHD Graphics 630'),
('4444100f-75ec-447e-81b0-e73030a3bcf0', 4, 24, '3 GHz', '5.8 GHz', 0, '125 W', 'Intel UHD Graphics 770'),
('44cf1d64-c8d7-4fdb-b44f-6e5179ea97be', 4, 16, '3.4 GHz', '5.5 GHz', 0, '150 W', 'Intel UHD Graphics 770'),
('46eb5c90-42bb-4402-be3d-a0670e77aa20', 42, 0, '', '', 0, '', ''),
('479a459d-c67c-4ec5-a4df-cc8e5efbda6a', 16, 8, '3.6 GHz', '5 GHz', 0, '95 W', 'Intel UHD Graphics 630'),
('4b15e83b-bbc9-4546-be87-e6093c784bb7', 57, 6, '4.7 GHz', '5.3 GHz', 0, '105 W', 'None'),
('4cadfcb6-8f02-4f8f-824c-9155488a5e1b', 9, 4, '3.6 GHz', '4.3 GHz', 0, '65 W', 'None'),
('4fcd429f-7188-4bab-90b0-529163435046', 1, 4, '3.3 GHz', '4.3 GHz', 0, '58 W', 'None'),
('5047de52-a049-4efa-a64f-e200e8830a7a', 48, 8, '3.9 GHz', '4.5 GHz', 0, '105 W', 'None'),
('53e07c73-eee5-42cf-b025-11f236e2b588', 58, 8, '4.5 GHz', '5.4 GHz', 0, '105 W', 'None'),
('5dbf27a3-4e1a-4cc9-a53e-e6ff19c0f636', 53, 8, '3.4 GHz', '4.6 GHz', 0, '65 W', 'None'),
('616511ce-0d95-423c-8aea-2585d289892c', 2, 6, '3.3 GHz', '4.8 GHz', 0, '65 W', 'Intel UHD Graphics 770'),
('61a9dc62-95cb-4b68-acd3-04d8cfba204d', 42, 0, '', '', 0, '', ''),
('65bb082e-9793-4162-a9d9-8c0dc720f4fc', 12, 10, '3.7 GHz', '5.3 GHz', 0, '125 W', 'Intel UHD Graphics 630'),
('66e1a0e1-33c6-4777-aeb0-997a0ee6c05c', 7, 8, '3.6 GHz', '5 GHz', 0, '125 W', 'Intel UHD Graphics 750'),
('6ae2378a-9a02-451d-8855-124a14a9bb65', 43, 6, '3.6 GHz', '4.2 GHz', 0, '95 W', 'None'),
('6d73d084-870d-4ae7-9751-2ac85f7040db', 53, 8, '3.8 GHz', '4.6 GHz', 0, '65 W', 'Radeon Vega 8'),
('6fb28465-067a-42c3-9541-87690a266ef6', 54, 16, '3.4 GHz', '4.9 GHz', 0, '105 W', 'None'),
('71b7d646-6954-4095-a10f-8530a19613f9', 2, 10, '3.7 GHz', '4.9 GHz', 0, '125 W', 'Intel UHD Graphics 770'),
('71d03b06-760e-4f96-82a7-42d738615434', 50, 32, '3.7 GHz', '4.5 GHz', 0, '280 W', 'None'),
('7561c4be-0afb-474d-a76d-19cec0f42cd3', 24, 4, '3.6 GHz', '4.2 GHz', 0, '65 W', 'Intel HD Graphics 630'),
('782b6c3f-2169-40b9-b2a4-2f2437cc798c', 44, 8, '3.2 GHz', '4.1 GHz', 0, '65 W', 'None'),
('7a400f43-4082-45f4-8fb2-a5a6b1379333', 42, 0, '', '', 0, '', ''),
('7c92c9f3-72ae-4bd8-9942-a9e5236c6633', 7, 8, '2.5 GHz', '4.9 GHz', 0, '65 W', 'None'),
('7e818558-1e87-4d15-a403-a478a606ec90', 54, 12, '3.7 GHz', '4.8 GHz', 0, '105 W', 'None'),
('84520ddb-ab90-4f37-bc6d-6b6f40c61dab', 42, 4, '3.5 GHz', '3.7 GHz', 0, '65 W', 'Radeon Vega 8'),
('889f9ed6-e511-43e3-8911-1addd9756680', 9, 4, '3.6 GHz', '4.3 GHz', 0, '65 W', 'Intel UHD Graphics 630'),
('8d0b226b-9814-4a86-802d-ebb9a96ef51b', 43, 6, '3.4 GHz', '3.9 GHz', 0, '65 W', 'None'),
('911c28f7-ca11-4f7d-9188-d1c6f1d4f63b', 27, 4, '3.5 GHz', '3.9 GHz', 0, '91 W', 'Intel HD Graphics 530'),
('94236b35-cf79-4013-89ce-b76efeab6573', 10, 6, '4.1 GHz', '4.8 GHz', 0, '125 W', 'Intel UHD Graphics 630'),
('98fc4c8d-cf4e-406f-ab14-a44843612031', 18, 6, '2.8 GHz', '4 GHz', 0, '65 W', 'Intel UHD Graphics 630'),
('9eccd79b-6bd0-481b-b4f5-0d8fd41e06ba', 12, 10, '3.6 GHz', '5.2 GHz', 0, '125 W', 'Intel UHD Graphics 630'),
('9faef5bd-3f08-4a46-a68c-5afff6dfa1b2', 2, 14, '3.5 GHz', '5.1 GHz', 0, '125 W', 'None'),
('a05327b9-3ef2-49ed-8942-40d1884b0b3b', 6, 6, '2.6 GHz', '4.4 GHz', 0, '65 W', 'Intel UHD Graphics 730'),
('a42cf1b7-3dd2-4f7b-b300-743ea693e5a7', 59, 12, '4.7 GHz', '5.6 GHz', 0, '170 W', 'None'),
('a61b5697-1013-41f4-aaf3-fc0258428ed3', 28, 4, '4 GHz', '4.2 GHz', 0, '91 W', 'Intel HD Graphics 530'),
('a75dcf7c-e938-4664-a025-4c2c234297a6', 11, 8, '2.9 GHz', '4.8 GHz', 0, '65 W', 'None'),
('aca4e220-5edd-4ccc-b6fd-095d8326b141', 50, 64, '2.9 GHz', '4.3 GHz', 0, '280 W', 'None'),
('ad4c1efe-50f5-4ce5-a2e6-4265b5e1ca02', 27, 4, '3.2 GHz', '3.6 GHz', 0, '65 W', 'Intel HD Graphics 530'),
('b1110170-ecca-442e-8f95-cc3a4720e29f', 39, 6, '3.2 GHz', '3.6 GHz', 0, '65 W', 'None'),
('b2ce92c7-ed2f-4ec8-be2c-b4f47dc4c61e', 10, 6, '4.1 GHz', '4.8 GHz', 0, '125 W', 'None'),
('b32f7970-a2d5-48cb-9f7d-b36f90c3000f', 48, 8, '3.6 GHz', '4.4 GHz', 0, '65 W', 'None'),
('bccc7fff-25f6-4747-949c-8e93c519218a', 48, 8, '3.6 GHz', '4.4 GHz', 0, '65 W', 'None'),
('bedbbd4a-7673-4bbd-8a45-9330c6a1ec86', 3, 12, '3.6 GHz', '5 GHz', 0, '125 W', 'Intel UHD Graphics 770'),
('c244c569-d27d-490e-83d7-b7cd4022f547', 45, 32, '3 GHz', '4.2 GHz', 0, '250 W', 'None'),
('c2d0b756-14da-4731-bf2c-1b88b8b393a8', 47, 6, '3.7 GHz', '4.2 GHz', 0, '65 W', 'Radeon Vega 7'),
('c425c814-5ddb-4542-9dd2-b3c4407b8883', 2, 6, '2.5 GHz', '4.4 GHz', 0, '65 W', 'None'),
('c43b6df6-f202-4eaf-a7ab-ee210aaba949', 19, 6, '3.7 GHz', '4.7 GHz', 0, '95 W', 'Intel UHD Graphics 630'),
('c800cdec-2bbc-483f-846d-511f8520534a', 11, 8, '3.8 GHz', '5.1 GHz', 0, '125 W', 'None'),
('c85fcebf-d84b-4165-ad44-fac8a2d1523b', 36, 4, '4 GHz', '4.4 GHz', 0, '88 W', 'Intel HD Graphics 4600'),
('ce6f7e9d-19c5-4a14-8191-7826bab890b9', 47, 6, '3.8 GHz', '4.4 GHz', 0, '95 W', 'None'),
('d1239da1-edf1-41fc-92e9-c6f19de790a5', 10, 6, '2.9 GHz', '4.3 GHz', 0, '65 W', 'Intel UHD Graphics 630'),
('d12a8218-73b3-4441-8093-a3f607e5f831', 46, 4, '3.6 GHz', '3.9 GHz', 0, '65 W', 'None'),
('d17d20ee-5e10-416f-9b1a-2d0f6463f17c', 59, 16, '4.5 GHz', '5.7 GHz', 0, '170 W', 'None'),
('d2930363-7a5e-46b9-aa24-dbfcd85b02af', 11, 8, '3.8 GHz', '5.1 GHz', 0, '125 W', 'Intel UHD Graphics 630'),
('d6aca123-fae4-46be-a804-fc1db6704cad', 52, 6, '3.5 GHz', '4.4 GHz', 0, '65 W', 'None'),
('df47c9bf-454e-4b1a-946d-577f4743fe01', 46, 4, '3.8 GHz', '4 GHz', 0, '65 W', 'None'),
('e03e2000-f301-4db7-84f2-18186c18c228', 1, 4, '3.3 GHz', '4.3 GHz', 0, '60 W', 'Intel UHD Graphics 730'),
('e49f386d-95d3-42b4-8c50-84efee8bc010', 52, 6, '3.6 GHz', '4.2 GHz', 0, '65 W', 'None'),
('e76bed0b-c965-4dc0-b5c0-047726d1cdd3', 2, 6, '2.5 GHz', '4.4 GHz', 0, '65 W', 'Intel UHD Graphics 730'),
('e92318d5-1166-4a31-bcd2-90536ca70cc6', 42, 0, '', '', 0, '', ''),
('e9675442-4988-479e-ae2b-34ccffdb088e', 10, 6, '2.9 GHz', '4.3 GHz', 0, '65 W', 'None'),
('ee110ca0-46d4-4531-b818-998184e7e817', 53, 8, '3.8 GHz', '4.7 GHz', 0, '105 W', 'None'),
('ef715643-0401-4507-88bd-058a6361901a', 11, 8, '2.9 GHz', '4.8 GHz', 0, '65 W', 'Intel UHD Graphics 630'),
('f2e2f4a4-651e-4bec-b502-dfd251a4a80c', 9, 4, '3.7 GHz', '4.4 GHz', 0, '65 W', 'None'),
('f41efddd-f7e6-4387-ba40-29ba2972a0e5', 24, 4, '4.2 GHz', '4.5 GHz', 0, '91 W', 'Intel HD Graphics 630'),
('f607dc03-587d-4cbb-b61f-3d2a8b414533', 44, 8, '3.7 GHz', '4.3 GHz', 0, '105 W', 'None'),
('f9265435-5a9c-43dc-bab3-f3f8e73c114b', 2, 10, '3.7 GHz', '4.9 GHz', 0, '125 W', 'None'),
('fa2cb150-8472-496c-ae09-600f20ce2dee', 3, 12, '3.6 GHz', '5 GHz', 0, '125 W', 'None'),
('fbcac052-52d6-4833-ae60-d2f3c10f1ec0', 6, 6, '3.9 GHz', '4.9 GHz', 0, '125 W', 'Intel UHD Graphics 750');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cpu_familys`
--

DROP TABLE IF EXISTS `cpu_familys`;
CREATE TABLE IF NOT EXISTS `cpu_familys` (
  `processor` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processor`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cpu_familys`
--

INSERT IGNORE INTO `cpu_familys` (`processor`, `brand`) VALUES
('A10', 'AMD '),
('A12', 'AMD '),
('A4', 'AMD '),
('A6', 'AMD '),
('A8', 'AMD '),
('Athlon', 'AMD '),
('Athlon II', 'AMD '),
('Athlon II X2', 'AMD '),
('Athlon II X3', 'AMD '),
('Athlon II X4', 'AMD '),
('Athlon X2', 'AMD '),
('Athlon X4', 'AMD '),
('E2-Series', 'AMD '),
('FX', 'AMD '),
('Opteron', 'AMD '),
('Phenom II X2', 'AMD '),
('Phenom II X3', 'AMD '),
('Phenom II X4', 'AMD '),
('Phenom II X6', 'AMD '),
('Ryzen 3', 'AMD '),
('Ryzen 5', 'AMD '),
('Ryzen 7', 'AMD '),
('Ryzen 9', 'AMD '),
('Sempron', 'AMD '),
('Sempron X2', 'AMD '),
('Threadripper', 'AMD '),
('Celeron', 'Intel'),
('Core 2 Duo', 'Intel'),
('Core 2 Extreme', 'Intel'),
('Core 2 Quad', 'Intel'),
('Core i3', 'Intel'),
('Core i5', 'Intel'),
('Core i7', 'Intel'),
('Core i7 Extreme', 'Intel'),
('Core i9', 'Intel'),
('Pentium', 'Intel'),
('Pentium Gold', 'Intel'),
('Xeon E', 'Intel'),
('Xeon E3', 'Intel'),
('Xeon E5', 'Intel');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cpu_generations`
--

DROP TABLE IF EXISTS `cpu_generations`;
CREATE TABLE IF NOT EXISTS `cpu_generations` (
  `gen` varchar(255) NOT NULL,
  `codename` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gen`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cpu_generations`
--

INSERT IGNORE INTO `cpu_generations` (`gen`, `codename`, `brand`) VALUES
('1000 Series', 'Summit Ridge', 'AMD '),
('10th', 'Comet Lake', 'Intel'),
('11th', 'Rocket Lake', 'Intel'),
('12th', 'Alder Lake', 'Intel'),
('2000 Series', 'Pinnacle Ridge', 'AMD '),
('3000 Series', 'Matisse', 'AMD '),
('4th', 'Broadwell', 'Intel'),
('5000 Series', 'Vermeer', 'AMD '),
('5th', 'Haswell', 'Intel'),
('6th', 'Skylake', 'Intel'),
('7000 Series', 'Raphael', 'AMD '),
('7th', 'Kaby Lake', 'Intel'),
('8th', 'Coffee Lake', 'Intel'),
('9th', 'Coffee Lake Refresh', 'Intel'),
('Threadripper 1000 Series', 'Whitehaven', 'AMD '),
('Threadripper 2000 Series', 'Colfax', 'AMD '),
('Threadripper 3000 Series', 'Castle Peak', 'AMD '),
('Threadripper 5000 Series', 'Castle Peak', 'AMD ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cpu_types`
--

DROP TABLE IF EXISTS `cpu_types`;
CREATE TABLE IF NOT EXISTS `cpu_types` (
  `cpuTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `processor` varchar(255) DEFAULT NULL,
  `gen` varchar(255) DEFAULT NULL,
  `socket` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cpuTypeId`),
  KEY `brand` (`brand`),
  KEY `processor` (`processor`),
  KEY `gen` (`gen`),
  KEY `socket` (`socket`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cpu_types`
--

INSERT IGNORE INTO `cpu_types` (`cpuTypeId`, `brand`, `processor`, `gen`, `socket`, `updatedAt`, `createdAt`) VALUES
(1, 'Intel', 'Core i3', '12th', 'LGA 1700', NULL, '2022-11-20 11:58:45'),
(2, 'Intel', 'Core i5', '12th', 'LGA 1700', NULL, '2022-11-20 11:58:45'),
(3, 'Intel', 'Core i7', '12th', 'LGA 1700', NULL, '2022-11-20 11:58:45'),
(4, 'Intel', 'Core i9', '12th', 'LGA 1700', NULL, '2022-11-20 11:58:45'),
(5, 'Intel', 'Core i3', '11th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(6, 'Intel', 'Core i5', '11th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(7, 'Intel', 'Core i7', '11th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(8, 'Intel', 'Core i9', '11th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(9, 'Intel', 'Core i3', '10th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(10, 'Intel', 'Core i5', '10th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(11, 'Intel', 'Core i7', '10th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(12, 'Intel', 'Core i9', '10th', 'LGA 1200', NULL, '2022-11-20 11:58:45'),
(13, 'Intel', 'Core i3', '9th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(14, 'Intel', 'Core i5', '9th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(15, 'Intel', 'Core i7', '9th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(16, 'Intel', 'Core i9', '9th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(17, 'Intel', 'Core i3', '8th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(18, 'Intel', 'Core i5', '8th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(19, 'Intel', 'Core i7', '8th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(20, 'Intel', 'Core i9', '8th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(21, 'Intel', 'Core i3', '7th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(22, 'Intel', 'Core i5', '7th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(23, 'Intel', 'Core i7', '7th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(24, 'Intel', 'Core i7', '7th', 'LGA 2066', NULL, '2022-11-20 11:58:45'),
(25, 'Intel', 'Core i9', '7th', 'LGA 2066', NULL, '2022-11-20 11:58:45'),
(26, 'Intel', 'Core i3', '6th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(27, 'Intel', 'Core i5', '6th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(28, 'Intel', 'Core i7', '6th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(29, 'Intel', 'Core i9', '6th', 'LGA 1151', NULL, '2022-11-20 11:58:45'),
(30, 'Intel', 'Core i3', '5th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(31, 'Intel', 'Core i5', '5th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(32, 'Intel', 'Core i7', '5th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(33, 'Intel', 'Core i9', '5th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(34, 'Intel', 'Core i3', '4th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(35, 'Intel', 'Core i5', '4th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(36, 'Intel', 'Core i7', '4th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(37, 'Intel', 'Core i9', '4th', 'LGA 1150', NULL, '2022-11-20 11:58:45'),
(38, 'AMD', 'Ryzen 3', '1000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(39, 'AMD', 'Ryzen 5', '1000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(40, 'AMD', 'Ryzen 7', '1000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(41, 'AMD', 'Threadripper', '1000 Series', 'TR4', NULL, '2022-11-20 11:58:45'),
(42, 'AMD', 'Ryzen 3', '2000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(43, 'AMD', 'Ryzen 5', '2000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(44, 'AMD', 'Ryzen 7', '2000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(45, 'AMD', 'Threadripper', '2000 Series', 'TR4', NULL, '2022-11-20 11:58:45'),
(46, 'AMD', 'Ryzen 3', '3000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(47, 'AMD', 'Ryzen 5', '3000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(48, 'AMD', 'Ryzen 7', '3000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(49, 'AMD', 'Ryzen 9', '3000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(50, 'AMD', 'Threadripper', '3000 Series', 'sTRX4', NULL, '2022-11-20 11:58:45'),
(51, 'AMD', 'Ryzen 3', '5000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(52, 'AMD', 'Ryzen 5', '5000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(53, 'AMD', 'Ryzen 7', '5000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(54, 'AMD', 'Ryzen 9', '5000 Series', 'AM4', NULL, '2022-11-20 11:58:45'),
(55, 'AMD', 'Threadripper', '5000 Series', 'sWRX8', NULL, '2022-11-20 11:58:45'),
(56, 'AMD', 'Ryzen 3', '7000 Series', 'AM5', NULL, '2022-11-20 11:58:45'),
(57, 'AMD', 'Ryzen 5', '7000 Series', 'AM5', NULL, '2022-11-20 11:58:45'),
(58, 'AMD', 'Ryzen 7', '7000 Series', 'AM5', NULL, '2022-11-20 11:58:45'),
(59, 'AMD', 'Ryzen 9', '7000 Series', 'AM5', NULL, '2022-11-20 11:58:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gpu_chipsets`
--

DROP TABLE IF EXISTS `gpu_chipsets`;
CREATE TABLE IF NOT EXISTS `gpu_chipsets` (
  `chipsetName` varchar(255) NOT NULL,
  `memoryType` varchar(255) DEFAULT NULL,
  `chipsetBrand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chipsetName`),
  KEY `chipsetBrand` (`chipsetBrand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `gpu_chipsets`
--

INSERT IGNORE INTO `gpu_chipsets` (`chipsetName`, `memoryType`, `chipsetBrand`) VALUES
('Arc A770', 'GDDR6', 'Intel'),
('GeForce GTX 1050 Ti', 'GDDR5', 'Nvidia'),
('GeForce GTX 1650 G6', 'GDDR6', 'Nvidia'),
('GeForce GTX 1660', 'GDDR5', 'Nvidia'),
('GeForce GTX 1660 SUPER', 'GDDR6', 'Nvidia'),
('GeForce RTX 2060', 'GDDR6', 'Nvidia'),
('GeForce RTX 3050 8GB', 'GDDR6', 'Nvidia'),
('GeForce RTX 3060', 'GDDR6', 'Nvidia'),
('GeForce RTX 3060 Ti', 'GDDR6', 'Nvidia'),
('GeForce RTX 3070', 'GDDR6', 'Nvidia'),
('GeForce RTX 3070 Ti', 'GDDR6X', 'Nvidia'),
('GeForce RTX 3080', 'GDDR6X', 'Nvidia'),
('GeForce RTX 3080 Ti', 'GDDR6X', 'Nvidia'),
('GeForce RTX 3090', 'GDDR6X', 'Nvidia'),
('GeForce RTX 3090 Ti', 'GDDR6X', 'Nvidia'),
('GeForce RTX 4090', 'GDDR6X', 'Nvidia'),
('Quadro GV100', 'HBM2', 'Nvidia'),
('Radeon RX 580', 'GDDR5', 'AMD'),
('Radeon RX 6500 XT', 'GDDR6', 'AMD'),
('Radeon RX 6600', 'GDDR6', 'AMD'),
('Radeon RX 6600 XT', 'GDDR6', 'AMD'),
('Radeon RX 6650 XT', 'GDDR6', 'AMD'),
('Radeon RX 6700 XT', 'GDDR6', 'AMD'),
('Radeon RX 6800 XT', 'GDDR6', 'AMD'),
('Radeon RX 6900 XT', 'GDDR6', 'AMD'),
('Radeon RX 6950 XT', 'GDDR6', 'AMD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mainboards`
--

DROP TABLE IF EXISTS `mainboards`;
CREATE TABLE IF NOT EXISTS `mainboards` (
  `mainboardId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `ramCap` int(11) DEFAULT NULL,
  `ramSlot` int(11) DEFAULT NULL,
  PRIMARY KEY (`mainboardId`),
  UNIQUE KEY `id_UNIQUE` (`mainboardId`),
  KEY `chipset` (`chipset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `mainboards`
--

INSERT IGNORE INTO `mainboards` (`mainboardId`, `chipset`, `form`, `color`, `ramCap`, `ramSlot`) VALUES
('02b53d23-f67b-4ece-a0f1-88ccb91294d9', 'B660', 'Micro ATX', 'Black / Silver', 128, 4),
('039dc174-6e3d-424e-b86a-6c44ef6cb79b', 'X570', 'ATX', 'Black / Silver', 128, 4),
('0749c7f1-55d9-4455-ac82-d7519f52bfe2', 'Z690', 'ATX', 'Silver / Black', 128, 4),
('0870579a-e5ef-4495-940d-1cb16f43a920', 'B550', 'ATX', 'Black / Red', 128, 4),
('1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 'Z790', 'EATX', 'Black', 128, 4),
('1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 'B550', 'Micro ATX', 'Black', 128, 4),
('188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 'B550', 'Micro ATX', 'Black', 128, 4),
('18ac3f5f-490d-482d-b656-ddd1b370df6a', 'Z790', 'ATX', 'Black', 128, 4),
('192a120c-b9c1-4f47-a39d-687ba09de46a', 'B550', 'ATX', 'Silver / Black', 128, 4),
('19330b04-6071-45d9-9187-b974c12bb101', 'A320', 'Micro ATX', 'Black / White', 32, 2),
('1ac716e7-ac0b-401a-8b1c-438e06e57a94', 'B450', 'ATX', 'Black', 128, 4),
('1f9ba36c-c4fd-4fff-afe9-e31713c9f537', 'Z790', 'ATX', 'Black', 128, 4),
('21dfb4b1-2f45-40be-8987-902d35e4ac57', 'Z790', 'EATX', 'Black / Silver', 128, 4),
('288c5573-84d1-47c6-a194-452de5118ce2', 'A320', 'Micro ATX', 'Black', 64, 2),
('29a91d3f-81a2-4d56-8f22-64accaee62ee', 'B550', 'ATX', 'Black / White', 128, 4),
('2c97644c-b536-4cbd-9c2c-145f6d086f14', 'B550', 'Micro ATX', 'Black', 128, 4),
('2f990233-021d-463d-adc0-50b8e0b98d3a', 'B450', 'Micro ATX', 'Black / Gray', 64, 4),
('2f9dde37-ab9a-4d5a-a83e-2171195f241b', 'B550', 'ATX', 'Silver / Black', 128, 4),
('3026dd4f-661a-4892-867e-4756369585cb', 'X670', 'ATX', 'Black', 128, 4),
('3079bace-a7ab-4f5e-9614-f882299c6d6f', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('3431eca3-c856-4b6c-b049-d3eeb3906bec', 'TRX40', 'EATX', 'Black / Silver', 256, 8),
('349c569e-8e92-4b2e-88fb-5014f6961f08', 'Z790', 'ATX', 'Black', 128, 4),
('37044220-5cb8-4dd0-a216-6a76dcb47782', 'B450', 'Micro ATX', 'Black / Silver', 64, 4),
('39885b1c-8192-453e-b75c-2b7e7923163c', 'B660', 'Micro ATX', 'Black', 128, 4),
('39a6aaef-a4c0-42e6-80c4-6e51aa47392d', 'B550', 'ATX', 'Black / Silver', 128, 4),
('3bc44b1a-a2ae-49ae-99fe-a4402f1e12bb', 'X570', 'ATX', 'Black / Red', 128, 4),
('3f668424-185f-4cd4-9788-8b103f816074', 'X670', 'Mini ITX', 'Black / Silver', 64, 2),
('3ff412bd-f41f-44fa-999c-4eda68af190d', 'B450', 'ATX', 'Black', 128, 4),
('4018d30b-0b79-45bc-8a9a-aa1a738fc49f', 'B550', 'Micro ATX', 'Silver / Black', 128, 4),
('41505087-475e-40f8-936e-1b4fb999971e', 'B660', 'Micro ATX', 'Silver / Black', 128, 4),
('4426e441-e7b5-44f7-b9eb-2c970b5cb6da', 'Z790', 'ATX', 'Black', 128, 4),
('45fc8fff-64fd-4321-af10-613395082224', 'A520', 'Micro ATX', 'Black', 64, 2),
('46682231-ff89-45ba-9e4b-1b094f000563', 'Z690', 'ATX', 'Black', 128, 4),
('469150d2-21c7-4bae-a479-05397836661a', 'B550', 'ATX', 'Black', 128, 4),
('4cb5e0f5-851a-4b8b-b877-811b034c55e5', 'X670', 'ATX', 'Black / White', 128, 4),
('4d7ed343-6ab7-4112-97d2-0dc707afbad0', 'X670', 'EATX', 'Black / Silver', 128, 4),
('4f262505-53a8-43ba-ba30-6db410352607', 'B660', 'ATX', 'Black / Silver', 128, 4),
('509dd4a6-267c-4fa4-9957-67254be20185', 'X670', 'ATX', 'Black / Silver', 128, 4),
('522f467a-388e-418c-9444-030048d00c9a', 'B550', 'ATX', 'Black', 128, 4),
('532e29e0-f50a-4777-80a8-7eaf09868456', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('53d23dea-6f37-4629-998f-e362726c681f', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('5cac8f8f-6e6d-4fe1-8488-06891c2cb615', 'B550', 'ATX', 'Black / Silver', 128, 4),
('621b499f-55a9-4da8-940d-49853f04298d', 'B550', 'ATX', 'Black', 128, 4),
('6cb6e916-de2a-4bad-be81-189f9248adc7', 'A320', 'Micro ATX', 'Black / White', 32, 2),
('6fe6e02b-c3e3-4659-86eb-c85de994b3a0', 'B660', 'Mini ITX', 'Silver / Black', 64, 2),
('6fee5ea6-e451-4bc0-aec5-34c8d17c93b9', 'X670', 'ATX', 'Black / Silver', 128, 4),
('72345b34-e311-4e2e-84b0-6f9ef978aa18', 'Z590', 'ATX', 'Black', 128, 4),
('723e114d-ebc4-412f-a5f7-2e79116b840b', 'Z690', 'ATX', 'Silver / Black', 128, 4),
('755142cd-9adf-4b3a-8893-e0c66d47a93f', 'B660', 'Mini ITX', 'Black / Silver', 64, 2),
('7adfc74a-afc9-4cb6-94c8-da33a6f04755', 'B550', 'Micro ATX', 'Black', 128, 4),
('7bfc130d-befc-4a8c-a3ec-770465a1dc44', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('7f23b4bb-4e00-46a3-9f52-daa77d2d832f', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('839da75e-e8ea-4829-bc86-9e7a5121df78', 'X570', 'ATX', 'Black', 128, 4),
('8497f42b-434a-4b28-b7bc-34c8d0cb6349', 'Z790', 'ATX', 'Black / Silver', 128, 4),
('851e187d-0128-4e04-81e1-205b696251ea', 'H510', 'Micro ATX', 'Black', 64, 2),
('8aa2b43b-48c9-417c-9cf9-112728c171ef', 'B550', 'ATX', 'Black / Gray', 128, 4),
('8c8fe1e8-4939-4035-9d47-d25baef2bb9f', 'B550', 'Micro ATX', 'Black / Gold', 128, 4),
('8df98631-420f-4af0-b799-a9ea26d4e20a', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('8e0cd140-2054-4820-814d-309d707f2e60', 'Z690', 'ATX', 'Black / Gray', 128, 4),
('90dd199a-25ef-404b-bef7-a272f579a303', 'Z690', 'ATX', 'Silver / Black', 128, 4),
('9182eef0-35b9-4660-8185-257495a0cad1', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('93ad0270-2481-44c8-b6b4-05950d352ac7', 'B650', 'ATX', 'Black / Silver', 128, 4),
('9a8051e3-f169-4ecc-829e-4d59913cd21f', 'X570', 'ATX', 'Black / Silver', 128, 4),
('9b553c66-3999-42e4-b401-c764e758a783', 'B650', 'ATX', 'Black', 128, 4),
('9e2568bf-585a-4a39-80b4-8d4f42765abd', 'B660', 'Micro ATX', 'Silver / Black', 128, 4),
('a04a3e6a-d341-4e63-9cb8-25b914689f09', 'Z690', 'ATX', 'Black', 128, 4),
('a56fe2d2-4e6b-49be-a1cb-c5bf06d65d86', 'B660', 'Micro ATX', 'Black', 128, 4),
('a61091a1-494f-4f0a-835f-42d307c61aee', 'B550', 'ATX', 'Black / Silver', 128, 4),
('a700c20f-5aa7-4720-b400-1c5b15eb7cd5', 'B660', 'ATX', 'Silver / Black', 128, 4),
('a873316d-4df3-45dc-ab7a-cee419799918', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('a93891c2-fab9-4de6-b27d-642ec5cc637f', 'Z490', 'ATX', 'Black / Silver', 128, 4),
('ab0562c2-6c08-4f87-9a4b-3869b9c74015', 'B550', 'ATX', 'Black / White', 128, 4),
('aca0eb69-933b-4fca-bd75-86cfdf592fc5', 'B550', 'Micro ATX', 'Silver / Black', 128, 4),
('aef723b8-eb3c-4f9f-b53d-bfff943a1f0d', 'B550', 'ATX', 'White / Black', 128, 4),
('afddf184-d274-4f0c-b81a-18af41d66d93', 'A520', 'Mini ITX', 'Black / Silver', 64, 2),
('b764d413-3f3e-4e71-865a-7fbc22620845', 'B550', 'ATX', 'Black / Silver', 128, 4),
('b7d6f2b6-2e8f-4c5f-b06f-7debccd3b292', 'X570', 'Mini ITX', 'Black', 64, 2),
('b89721fd-0a09-4bcc-b444-78e20c2fddaa', 'B660', 'Micro ATX', 'Gray / Black', 128, 4),
('b97d978c-60ac-49d1-8bb4-c8413a01e4e6', 'B450', 'ATX', 'Black / Silver', 64, 4),
('be2b9652-b237-4b54-a7e2-5979bb60fb2e', 'Z690', 'ATX', 'Black / Gray', 128, 4),
('bf63e64b-f555-45b5-b42e-e342ed02e852', 'A320', 'Micro ATX', 'Black', 32, 2),
('c6d5ef02-36e5-479c-8f02-b9717ef4306f', 'B660', 'ATX', 'Black / Silver', 128, 4),
('cafa8417-769a-4195-b90a-c92d88065d6f', 'B550', 'Mini ITX', 'Black', 64, 2),
('d27adf3f-53c6-4346-9e3a-97b00d40167a', 'B450', 'ATX', 'Red / Black', 64, 4),
('d369d654-9d00-463a-9619-bc0921783fd5', 'X570', 'ATX', 'Black', 128, 4),
('d38af7a4-fed4-437c-8d43-e80773209b4e', 'B660', 'ATX', 'Black', 128, 4),
('d67e3218-ee12-493a-b1b3-00ca1bd8a21b', 'B550', 'Mini ITX', 'Black / Silver', 64, 2),
('d80eaa42-c81d-4161-96df-06510ba8e2f1', 'Z690', 'ATX', 'Black / Gray', 128, 4),
('d8a2fa5d-0a0b-47d2-996d-90ee092508e8', 'B450', 'ATX', 'Brown / Black', 64, 4),
('dc3a0c32-568e-4d8c-b729-071640060e2c', 'B450', 'ATX', 'Black', 64, 4),
('de60b785-4015-4d09-9934-5ff263b9db54', 'B450', 'Micro ATX', 'Black', 128, 4),
('de6f2db6-0ffb-4e52-bf73-308e87c86fe5', 'B550', 'Mini ITX', 'Silver / Black', 64, 2),
('e2be46d7-071b-40f3-b0a9-7f239f59097d', 'X570', 'ATX', 'Black / Gold', 128, 4),
('eb0b4ac4-f26e-4a1f-be68-06a1a0d584f8', 'X670', 'ATX', 'Black / Orange', 128, 4),
('ebd0a778-caee-446d-b281-60288bf34a66', 'Z690', 'ATX', 'Black / Silver', 128, 4),
('edd2f6f7-2d7a-4336-a126-0be645915570', 'B660', 'Micro ATX', 'Black / Silver', 128, 4),
('efbaec2a-85a8-4597-97ca-303fcd9a7853', 'B660', 'ATX', 'Silver / Black', 128, 4),
('f4c8337e-37ad-4e67-8329-c888d0b15b87', 'Z790', 'ATX', 'Black', 128, 4),
('f99ec9ba-9f79-4d37-baa7-d20e8fe1992d', 'X570', 'ATX', 'Black / White', 128, 4),
('faec18d0-3f92-46d9-99a7-23cf7783ae94', 'B550', 'ATX', 'Black', 128, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mainboard_chipsets`
--

DROP TABLE IF EXISTS `mainboard_chipsets`;
CREATE TABLE IF NOT EXISTS `mainboard_chipsets` (
  `chipsetName` varchar(255) NOT NULL,
  `socket` varchar(255) DEFAULT NULL,
  `ramStandard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chipsetName`),
  KEY `socket` (`socket`),
  KEY `ramStandard` (`ramStandard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `mainboard_chipsets`
--

INSERT IGNORE INTO `mainboard_chipsets` (`chipsetName`, `socket`, `ramStandard`) VALUES
('A320', 'AM4', 'DDR4'),
('A520', 'AM4', 'DDR4'),
('B360', 'LGA 1151', 'DDR4'),
('B365', 'LGA 1151', 'DDR4'),
('B450', 'AM4', 'DDR4'),
('B460', 'LGA 1200', 'DDR4'),
('B550', 'AM4', 'DDR4'),
('B650', 'AM5', 'DDR5'),
('B660', 'LGA 1700', 'DDR5'),
('H310', 'LGA 1151', 'DDR4'),
('H370', 'LGA 1151', 'DDR4'),
('H410', 'LGA 1200', 'DDR4'),
('H470', 'LGA 1200', 'DDR4'),
('H510', 'LGA 1200', 'DDR4'),
('H570', 'LGA 1200', 'DDR4'),
('H610', 'LGA 1700', 'DDR4'),
('H670', 'LGA 1700', 'DDR4'),
('Q370', 'LGA 1151', 'DDR4'),
('Q470', 'LGA 1200', 'DDR4'),
('TRX40', 'sTRX4', 'DDR4'),
('W480', 'LGA 1200', 'DDR4'),
('W580', 'LGA 1200', 'DDR4'),
('X570', 'AM4', 'DDR4'),
('X670', 'AM5', 'DDR4'),
('Z370', 'LGA 1151', 'DDR4'),
('Z390', 'LGA 1151', 'DDR4'),
('Z490', 'LGA 1200', 'DDR4'),
('Z590', 'LGA 1200', 'DDR4'),
('Z690', 'LGA 1700', 'DDR5'),
('Z790', 'LGA 1700', 'DDR5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monitors`
--

DROP TABLE IF EXISTS `monitors`;
CREATE TABLE IF NOT EXISTS `monitors` (
  `monitorId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `screenSize` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `refreshRate` varchar(255) DEFAULT NULL,
  `responseTime` varchar(255) DEFAULT NULL,
  `panelType` varchar(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`monitorId`),
  UNIQUE KEY `id_UNIQUE` (`monitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `monitors`
--

INSERT IGNORE INTO `monitors` (`monitorId`, `screenSize`, `resolution`, `refreshRate`, `responseTime`, `panelType`, `ratio`) VALUES
('011752e6-7cd5-4b17-8a12-0e6cc5b39440', '32.0', '3840 x 2160', '240 Hz', '1 ms', 'VA', '16:9'),
('01f6e868-c3ed-4717-8ebf-bbb5933786c1', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('0223b2b5-a184-4fcb-afaa-95e709070a7f', '31.5', '7680 x 4320', '60 Hz', '6 ms', 'IPS', '16:9'),
('0848a1b1-d718-45d6-bb79-7718d9d49df9', '21.5', '1920 x 1080', '75 Hz', '4 ms', 'IPS', '16:9'),
('0ee70806-4c12-4e3c-95c0-1c3adda9372f', '31.5', '2560 x 1440', '144 Hz', '4 ms', 'VA', '16:9'),
('1088acf2-0ba0-4335-9a9b-b0cb1d2a2637', '24.0', '1920 x 1080', '144 Hz', '1 ms', 'IPS', '16:9'),
('1171c61f-b901-472f-88ca-d370d810ad15', '21.6', '3840 x 2160', '60 Hz', '1 ms', 'OLED', '16:9'),
('11bdc462-bd59-4a75-9e24-58769d3c2251', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('13c5cac6-d141-4d2d-80c0-3c712dbf1b10', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('141c9296-a7ec-4c32-9b32-76c19a46b067', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('18130170-c7cc-4ec9-8c40-abbb3cf2cb6d', '21.5', '1920 x 1080', '75 Hz', '5 ms', 'VA', '16:9'),
('18e5dc8d-b41c-4270-8daf-c4e0191e6814', '27.0', '1920 x 1080', '280 Hz', '1 ms', 'IPS', '16:9'),
('1f8252de-fffc-4272-a70b-6966e2028c75', '27.0', '2560 x 1440', '144 Hz', 'none', 'IPS', '16:9'),
('20cb1a56-9ee3-4fb9-be32-2583c162c40f', '27.0', '2560 x 1440', '170 Hz', '1 ms', 'IPS', '16:9'),
('20e99ea2-4b5b-4d80-a9a8-aabbbfb0f161', '28.0', '3840 x 2160', '60 Hz', '4 ms', 'IPS', '16:9'),
('24c11ced-c0c3-4d33-825a-b9f28adb99da', '31.5', '2560 x 1440', '240 Hz', '1 ms', 'VA', '16:9'),
('27e9193f-d842-4151-8016-2c5bab6d9c34', '24.0', '1920 x 1080', '165 Hz', '0.5 ms', 'TN', '16:9'),
('28a23cc2-4ec2-42db-8d20-efbe663d8252', '34.1', '3440 x 1440', '180 Hz', '1 ms', 'IPS', '21:9'),
('28ae8c86-f598-4aaf-a82a-1f435d2f9f87', '27.0', '2560 x 1440', '360 Hz', '1 ms', 'IPS', '16:9'),
('28e81dbf-87b4-4682-85c8-6a9a3992ada0', '18.5', '1366 x 768', 'none', '5 ms', 'TN', '16:9'),
('2a368276-b1cd-45d7-a7a2-2fb6b5cecf7f', '24.0', '1920 x 1080', '144 Hz', '1 ms', 'none', '16:9'),
('2b7e518a-81cb-4edc-b596-603f06ada90d', '55.0', '3840 x 2160', '165 Hz', '1 ms', 'VA', '16:9'),
('2c57f994-ab8b-44aa-98fa-2f1bf730add2', '27.0', '2560 x 1440', '155 Hz', '1 ms', 'TN', '16:9'),
('2d63a02b-909a-442d-a09b-440b884cb8f6', '49.0', '5120 x 1440', '240 Hz', '1 ms', 'VA', '32:9'),
('2e14db2d-0c01-4de4-9397-9ddd9e96102f', '23.8', '1920 x 1080', '75 Hz', '1 ms', 'IPS', '16:9'),
('302b687b-c846-4c4e-b8df-ffabdcbc3752', '27.0', '2560 x 1440', '240 Hz', '1 ms', 'VA', '16:9'),
('34c63972-e2ad-4dbf-a016-6be5cd34475f', '24.5', '1920 x 1080', '360 Hz', '1 ms', 'IPS', '16:9'),
('3b5cd2a3-820f-426b-9d60-5324ae419d05', '35.0', '3440 x 1440', '200 Hz', '2 ms', 'VA', '21:9'),
('3d216d00-8c46-4254-b9d9-9058f67fa347', '27.0', '1920 x 1080', '144 Hz', 'none', 'IPS', '16:9'),
('3dab87df-159f-4966-a41c-57a0cf7437b7', '23.8', '1920 x 1080', '75 Hz', 'none', 'IPS', '16:9'),
('3eda66b8-4e68-4bd3-8e53-f47b4027b7f9', '27.0', '2560 x 1440', '240 Hz', '1 ms', 'IPS', '16:9'),
('473e1dd4-599d-4841-bb0f-da4f19310509', '27.0', '2560 x 1440', '270 Hz', '0.5 ms', 'IPS', '16:9'),
('47f6e014-b62a-47d3-ab59-636a254a8345', '24.5', '1920 x 1080', '240 Hz', 'none', 'TN', '16:9'),
('4a6844d2-fd23-44a6-b116-3090e2ac2ca1', '24.0', '1920 x 1080', '144 Hz', '1 ms', 'IPS', '16:9'),
('4f02908f-3bf7-4b8c-8ad6-db455c408445', '27.0', '2560 x 1440', '240 Hz', '1 ms', 'IPS', '16:9'),
('4f9b99b2-02b2-479a-ba96-00554a78da28', '22.0', '1920 x 1080', '144 Hz', '5 ms', 'VA', '16:9'),
('503ef631-97bd-483b-ad6d-90f5720b9e8a', '23.8', '1920 x 1080', '180 Hz', 'none', 'IPS', '16:9'),
('52edab51-6a2a-4154-8246-9808000386f8', '20.0', '1600 x 900', '60 Hz', '5 ms', 'none', '16:9'),
('578b53d5-809a-4843-a2ea-f45584cd2b89', '27.0', '2560 x 1440', '144 Hz', '1 ms', 'IPS', '16:9'),
('61e04c0d-19e5-49f9-8379-0875910bae26', '24.5', '1920 x 1080', '360 Hz', '1 ms', 'IPS', '16:9'),
('620c9737-a633-4d31-99b9-bc6c6b0b6dff', '27.0', '2560 x 1440', '144 Hz', 'none', 'VA', '16:9'),
('62a6413a-0841-4e0e-9aba-0022f9f8c67f', '31.5', '3840 x 2160', '144 Hz', 'none', 'IPS', '16:9'),
('64ed2dfb-809a-4eaa-b6e3-a9d5e0df0661', '32.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('65e141bd-e72c-4bf1-8ea2-91608f59687b', '27.0', '1920 x 1080', '240 Hz', '1 ms', 'IPS', '16:9'),
('6965b6af-cabc-44c6-8642-6f00d72d10e0', '34.0', '3440 x 1440', '144 Hz', 'none', 'VA', '21:9'),
('6ccf8e8b-0974-490f-b128-6bafb422c849', '23.6', '1920 x 1080', '144 Hz', '1 ms', 'TN', '16:9'),
('6d0858e3-2017-4370-990d-01bcbbe13286', '23.6', '1920 x 1080', '144 Hz', '1 ms', 'VA', '16:9'),
('70e58565-a189-43f6-b012-a33c1a84d085', '27.0', '1920 x 1080', '144 Hz', 'none', 'IPS', '16:9'),
('78f64054-21e9-4867-8a57-c573a5d86a30', '23.8', '1920 x 1080', '144 Hz', 'none', 'IPS', '16:9'),
('7a944983-3410-4fdf-978e-073e95184e79', '30.0', '2560 x 1080', '200 Hz', '5 ms', 'VA', '21:9'),
('7bad8bce-6a26-4423-853b-7704d07da7e2', '19.0', '1280 x 1024', 'none', '5 ms', 'TN', '5:4'),
('7d66f14d-6e49-4a14-aba7-877b564c0b7e', '24.5', '1920 x 1080', '360 Hz', '1 ms', 'IPS', '16:9'),
('7fc17372-ae8a-4c83-97ff-74c7954742bc', '49.0', '5120 x 1440', '240 Hz', '1 ms', 'VA', '32:9'),
('80759eaa-92c5-4847-85d8-b02008fb885b', '27.0', '2560 x 1440', '144 Hz', '3 ms', 'IPS', '16:9'),
('844a9976-b690-4811-8ea6-7c240829abd5', '23.8', '1920 x 1080', '144 Hz', '1 ms', 'VA', '16:9'),
('8aa5d20e-26d5-4138-82d8-da435e011c63', '47.5', '3840 x 2160', '120 Hz', '0.1 ms', 'OLED', '16:9'),
('8ac5f34d-b60b-4afd-b00d-abfa54706f2c', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('91059566-c321-4adb-bc3d-2a6344fb012a', '24.0', '1920 x 1080', '144 Hz', 'none', 'IPS', '16:9'),
('952d02b3-6fb6-44c1-8a6a-e9437e7fd81f', '24.5', '1920 x 1080', '240 Hz', '1 ms', 'IPS', '16:9'),
('97b1f615-a740-4b45-b2a5-3e251ab7cfaa', '27.0', '2560 x 1440', '144 Hz', '1 ms', 'IPS', '16:9'),
('981fe987-4eec-4f46-bcfc-71d6f2dab90b', '28.0', '3840 x 2160', '144 Hz', '1 ms', 'IPS', '16:9'),
('98f1ea74-ac33-4909-99bc-8c80fe03aca6', '27.0', '3840 x 2160', '160 Hz', '1 ms', 'IPS', '16:9'),
('992c048f-6fc9-455d-b539-5ac6559f2938', '21.5', '1920 x 1080', '60 Hz', '1 ms', 'TN', '16:9'),
('9af84e85-f875-43e4-8ad4-869bd4ed4431', '27.0', '3840 x 2160', '144 Hz', '1 ms', 'IPS', '16:9'),
('9cf3c719-f44a-4836-8f5f-673ddd4b4d1b', '27.0', '2560 x 1440', '144 Hz', '1 ms', 'IPS', '16:9'),
('a77302db-7f03-42d3-b439-0a82774bb57a', '27.0', '2560 x 1440', '165 Hz', 'none', 'VA', '16:9'),
('aa614d51-a3b4-4c51-9926-b65bee29e6e5', '27.0', '2560 x 1440', '170 Hz', 'none', 'IPS', '16:9'),
('ab2e9c5f-79c6-4bab-a512-d35a738e674c', '27.0', '2560 x 1440', '170 Hz', 'none', 'IPS', '16:9'),
('af122586-efde-4113-94dd-3e8c485741dc', '27.0', '2560 x 1440', '170 Hz', '1 ms', 'IPS', '16:9'),
('af1f781f-2058-4c3f-bc56-9e568221966c', '28.0', '3840 x 2160', '144 Hz', '1 ms', 'IPS', '16:9'),
('b57f36d6-70af-4c09-b85f-21f5926f1616', '65.0', '3840 x 2160', '144 Hz', '4 ms', 'VA', '16:9'),
('b5eb8019-9f18-4499-9e6d-0b87b9e60c72', '24.0', '1920 x 1080', '165 Hz', '2 ms', 'VA', '16:9'),
('b76c3dce-82fa-46b9-af8f-8a6535d1788b', '27.0', '1920 x 1080', '165 Hz', '0.5 ms', 'TN', '16:9'),
('ba281bc7-c3e4-4b8b-b9ce-366f22e4008c', '32.0', '3840 x 2160', '120 Hz', '5 ms', 'IPS', '16:9'),
('bf405407-b7e8-4dd2-a9f5-a235580eb81d', '27.0', '2560 x 1440', '170 Hz', '1 ms', 'IPS', '16:9'),
('c458e508-ff20-4cff-b25c-524666c6275c', '27.0', '2560 x 1440', '165 Hz', '0.4 ms', 'TN', '16:9'),
('c701e16f-09e0-47e3-a9e8-a91e978d0ca7', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('c712eac4-b11e-4c67-a678-9003da39dc78', '24.5', '1920 x 1080', '240 Hz', '1 ms', 'IPS', '16:9'),
('c900efd7-6ef7-45d8-be58-efbb5c08c538', '32.0', '3840 x 2160', '120 Hz', '5 ms', 'IPS', '16:9'),
('cea12fcf-61fc-4a1f-8526-ff5350df17bf', '32.0', '3840 x 2160', '144 Hz', 'none', 'IPS', '16:9'),
('d1a550b0-834a-4e6f-a52a-774c33ab335a', '28.0', '3840 x 2160', '144 Hz', '1 ms', 'IPS', '16:9'),
('d292ef65-3f9b-4823-b290-547dea5a8fa3', '27.0', '2560 x 1440', '240 Hz', '1 ms', 'IPS', '16:9'),
('d33787ab-80d2-4525-b068-445af2841932', '31.5', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('d70df958-6e04-4236-a11f-ee6c72040f34', '27.0', '1920 x 1080', '240 Hz', '0.1 ms', 'IPS', '16:9'),
('d71ba2b3-89de-4f18-845d-f8444a64a6ef', '31.5', '2560 x 1440', '170 Hz', '1 ms', 'IPS', '16:9'),
('d77b2833-a731-4952-8df9-4726b2fd110a', '27.0', '1920 x 1080', '240 Hz', '1 ms', 'IPS', '16:9'),
('d924b28d-8e80-48c2-9790-1d3225e851fe', '27.0', '1920 x 1080', '144 Hz', '1 ms', 'IPS', '16:9'),
('d9c67704-a774-4ed7-8961-9e3b7944253b', '18.5', '1366 x 768', '60 Hz', '5 ms', 'TN', '16:9'),
('dadfe318-1e2a-44b7-9a04-d952a9fa7e4d', '27.0', '2560 x 1440', '165 Hz', '1 ms', 'IPS', '16:9'),
('dccc257b-f98e-4b10-81c7-6aeb56efcb39', '21.5', '1920 x 1080', '75 Hz', '1 ms', 'TN', '16:9'),
('e0e5fc07-635e-4c47-8da2-28ab429f9dc6', '24.5', '1920 x 1080', '280 Hz', '1 ms', 'IPS', '16:9'),
('e6cc7e14-cd47-41c6-9a21-ac02505a45b7', '34.2', '3440 x 1440', '175 Hz', '0.1 ms', 'QD-OLED', '21:9'),
('e7806e22-f29e-46a0-8342-266cf555fcc6', '24.0', '1920 x 1080', '60 Hz', '4 ms', 'VA', '16:9'),
('e8907455-e762-40aa-95d3-bb8d9e46b037', '27.0', '2560 x 1440', '240 Hz', '1 ms', 'IPS', '16:9'),
('e8965959-6f83-45f5-b204-c5de79190dd2', '19.5', '1600 x 900', '75 Hz', '5 ms', 'none', '16:9'),
('eca336be-9025-4dc9-981d-ace756c22164', '27.0', '1920 x 1080', '144 Hz', '1 ms', 'TN', '16:9'),
('ef1c7678-6a75-4af7-b4d2-93660a7df2ce', '23.6', '1920 x 1080', '144 Hz', 'none', 'VA', '16:9'),
('f0a00048-86f4-4bd8-9167-cb761936edfd', '23.8', '1920 x 1080', '144 Hz', '1 ms', 'IPS', '16:9'),
('f484c3c1-c4aa-4b0b-b28d-4001ba9bf416', '32.0', '7680 x 4320', '60 Hz', '6 ms', 'IPS', '16:9'),
('feee173d-cfc9-4dd7-9e0d-b71a1cca1c16', '27.0', '1920 x 1080', '165 Hz', '1 ms', 'IPS', '16:9');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mouses`
--

DROP TABLE IF EXISTS `mouses`;
CREATE TABLE IF NOT EXISTS `mouses` (
  `mouseId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trackingMethod` varchar(255) DEFAULT NULL,
  `connectType` varchar(255) DEFAULT NULL,
  `dpi` int(11) DEFAULT NULL,
  `hand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mouseId`),
  UNIQUE KEY `id_UNIQUE` (`mouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `mouses`
--

INSERT IGNORE INTO `mouses` (`mouseId`, `trackingMethod`, `connectType`, `dpi`, `hand`, `color`) VALUES
('04e96bd4-2a1e-42d5-88b9-c0c9fa804db4', 'Optical', 'Wireless', 8000, 'Right', 'White'),
('0705d5d7-7cff-4fa6-a712-1b21eb757808', 'Optical', 'Wired', 6400, 'Right', 'Black / Green'),
('0aef48a5-cff0-422c-92d4-f8e5246d6de5', 'Optical', 'Wireless', 18000, 'Right', 'Black'),
('0f2802ca-113a-4c8b-b7d2-59affeb2e895', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('103746a5-3259-419f-8854-0734f17b87b0', 'Optical', 'Wired', 20000, 'Both', 'Black'),
('10fb9239-5190-4479-9b43-feed314f8a01', 'Optical', 'Wireless', 12000, 'Right', 'White'),
('1446d128-ccd9-462a-aabe-1b3334e8b5b4', 'Optical', 'Wireless', 16000, 'Right', 'Black / Green'),
('156209a7-a0dc-4fcf-870d-bdb154183e41', 'Optical', 'Wired', 8500, 'Both', 'Black'),
('1777588b-b17c-4c38-a09c-79bd155ff60d', 'Optical', 'Wireless', 20000, 'Both', 'White'),
('1cc1dcbf-5caa-4c1a-81c7-c44de0ff1e7f', 'Optical', 'Wired', 16000, 'Right', 'Black'),
('21e1cc57-91a0-47a9-9c0f-e2934cf83046', 'Optical', 'Wired', 8500, 'Both', 'Black'),
('24203417-6b82-40ae-8dec-cb7dedbfe5cd', 'Optical', 'Wired', 8500, 'Right', 'Black'),
('24a559d3-4610-4375-8d3b-5a84139f0b69', 'Optical', 'Wired', 1000, 'Both', 'Black'),
('2c231c7d-6385-428f-842d-92294b45c5da', 'Optical', 'Wired, Wireless, Bluetooth Wireless', 30000, 'Right', 'Black'),
('2d83a7ac-9f0c-4ea4-89c1-193a9da5638e', 'Optical', 'Wireless', 19000, 'Right', 'Black'),
('2ecc1c1f-639b-4087-8a7c-1a84aba3edc2', 'Optical', 'Wired', 12000, 'Right', 'White'),
('320813e9-087c-43f1-9edc-61a3b435ab21', 'Optical', 'Wireless', 25600, 'Both', 'Black'),
('3acd7f96-c641-4cf8-9e68-f32a30eee1de', 'Optical', 'Wired', 16000, 'Both', 'White / Gray'),
('3fe2546b-036a-43ea-a6d2-59e39778fce8', 'Optical', 'Wired', 16000, 'Right', 'Black'),
('41f8edde-621f-4a55-a773-0602e5d53358', 'Laser', 'Wireless', 8200, 'Right', 'Black'),
('42f3f4db-4ed8-4e7c-b9ec-e067325a8575', 'Optical', 'Wired', 16000, 'Right', 'Black'),
('446147cc-dd9e-4e91-abaf-40de017a3163', 'Optical', 'Wireless', 18000, 'Right', 'Black'),
('45141fb1-5ae1-4c5e-a391-7e47c0315f95', 'Optical', 'Wired', 6200, 'Right', 'Black'),
('454a9055-0135-48e8-9fdb-a7f08eab9c06', 'Optical', 'Wireless', 19000, 'Right', 'Black'),
('4e2ca544-249d-4f04-9f2c-daec99715471', 'Optical', 'Wireless', 25600, 'Right', 'Black'),
('4f0e7dda-fa14-4368-bcf2-3816a6d0ca60', 'Optical', 'Wireless', 26000, 'Right', 'Black'),
('50342c90-f8e9-40f7-9632-2682dea6d240', 'Optical', 'Wireless', 26000, 'Right', 'Black'),
('536f3606-6856-4df1-ab2a-e0ad66f89ee8', 'Optical', 'Wired', 800, 'Both', 'Black'),
('54357928-390f-4398-b6d0-3f39bfd39594', 'Laser', 'Wired', 16000, 'Right', 'Black'),
('55c01d86-c782-43a4-9597-aec446980dce', 'Optical', 'Wireless', 20000, 'Both', 'Black'),
('56027e5b-5d39-4baf-9848-749948f48d15', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('565783e7-b283-4a10-8b8a-29a92efb6698', 'Optical', 'Wired', 16000, 'Right', 'Black / Green'),
('572e5a50-91d8-4d67-b8c3-d690a9ecd441', 'Optical', 'Wired', 7200, 'Right', 'Black'),
('582e6852-67f4-4582-80bf-5425b6b3dc9f', 'Optical', 'Wired', 17995, 'Right', 'White'),
('592d10e8-0a24-4836-9740-3e4fbc319a57', 'Optical', 'Wired', 12000, 'Right', 'White'),
('5c801214-40d0-419e-b2bf-eae430bdf8c8', 'Optical', 'Wireless', 20000, 'Both', 'Pink'),
('5d5eb544-2ebb-4025-a6e5-3d344da41a57', 'Optical', 'Wired', 25600, 'Right', 'Black / Blue'),
('602399c6-7e4a-4753-8838-a553a2e60039', 'Optical', 'Wireless', 12000, 'Both', 'Black / Blue'),
('60736668-7931-4417-9bb2-ca2fb1582d9b', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('62275c40-a4b0-4295-8883-08dc2516b715', 'Optical', 'Wired', 8000, 'Right', 'White'),
('656159ea-aaef-458f-ac36-22bc00f86c76', 'Optical', 'Wired', 26000, 'Right', 'Black'),
('6577f2fd-9aff-432e-9373-a9ed92d7dd5b', 'Optical', 'Wireless', 20000, 'Right', 'Black'),
('65f82329-c7ff-4dac-bcb6-2d95b67ce209', 'Optical', 'Wired', 18000, 'Right', 'Black'),
('67433207-7711-4117-aad1-8cd0f8729e90', 'Optical', 'Wireless', 25600, 'Both', 'Black'),
('68e89988-f8e4-4ca5-ac76-b62dca649240', 'Optical', 'Wired', 4000, 'Right', 'Black'),
('6a3e9798-c26c-459f-81cb-fd354d7f5e17', 'Optical', 'Wired', 16000, 'Right', 'White'),
('6dd5a329-937c-4e26-9c7d-d6f983658e15', 'Optical', 'Wired', 1000, 'Both', 'Black'),
('6f63334b-70bc-4639-8d07-0f25ef393a28', 'Optical', 'Wired', 25600, 'Right', 'Black'),
('70583094-79e6-4dca-a5fc-e09cac87f394', 'Optical', 'Wireless', 18000, 'Right', 'Black'),
('73d4a0d8-f837-43e3-86d7-d3a6952d0706', 'Optical', 'Wireless', 18000, 'Right', 'Black'),
('79d6439b-f737-4bfe-8b3d-b4a1d74c4bc7', 'Optical', 'Wired', 17997, 'Right', 'Black'),
('7afd723b-ccdc-4fce-9ccc-594d7e709809', 'Optical', 'Wireless', 18000, 'Right', 'Black'),
('7b9e5cc0-d1d1-4d33-ace7-3add9555dfda', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('7c4ab81b-7860-4e79-80f0-7a66eb586128', 'Optical', 'Wired', 20000, 'Right', 'Black'),
('825754ae-9c00-4aac-ba07-f8ff558c6962', 'Optical', 'Wired', 4000, 'Right', 'Black / Blue'),
('82b48d86-2785-44d8-ab37-df1b175f93b7', 'Optical', 'Wired', 3200, 'Right', 'Blue'),
('8306c31b-184c-449d-942f-70c0c5820118', 'Laser', 'Bluetooth Wireless', 1600, 'Right', 'Brown / Black'),
('89060f4b-fa6f-4cb2-996b-d31cafa8268f', 'Optical', 'Wired', 2500, 'Both', 'Black / Blue'),
('8e755289-d351-4bb0-a497-33674ab0cc16', 'Optical', 'Wireless', 26000, 'Right', 'Black / Silver'),
('91cf3504-ddda-4311-a738-0abc9f763a82', 'Optical', 'Wired', 8500, 'Both', 'Blue'),
('928ea5ce-ac0e-459f-a45a-6b41057c9b5c', 'Optical', 'Wireless', 16000, 'Right', 'Black'),
('98b2df6f-c138-42b3-92cf-e72bcd258ade', 'Optical', 'Wireless', 25600, 'Right', 'Black'),
('9bec3331-1e63-4340-a4ff-b88278609937', 'Laser', 'Wireless', 4000, 'Right', 'Black'),
('a26ec1bf-ae4e-4f62-97a6-8c55d45a4624', 'Optical', 'Wireless', 30000, 'Right', 'White'),
('a6d3d605-0bb8-4580-96c7-ffae6260c436', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('a8f44d11-8167-494f-acd3-113d38b92952', 'Optical', 'Wireless', 30000, 'Right', 'Black'),
('ad05569c-ce61-40a3-92f2-3c3461ff72d7', 'Optical', 'Wireless', 25600, 'Right', 'Black'),
('af187e18-a791-4a28-a9d1-76aa6feb7a6c', 'Optical', 'Wireless', 12000, 'Right', 'Black'),
('b585c6de-cc05-4b3b-b56f-84dbf13a04fc', 'Optical', 'Wireless', 25400, 'Right', 'White'),
('bd4aa9d3-317e-4323-a14b-f76fd2d15b9e', 'Optical', 'Wired', 18000, 'Right', 'Black'),
('bda0ad84-a01a-49f8-9bbc-4789132fd8a4', 'Optical', 'Wired', 12000, 'Right', 'Black / Orange'),
('bf5ddc3c-3f1f-47b5-9516-fa7634ab5cbe', 'Optical', 'Wireless', 20000, 'Right', 'Black'),
('c302f481-0ff7-4fe6-95b5-65f020a05335', 'Optical', 'Wired, Wireless, Bluetooth Wireless', 30000, 'Right', 'Black'),
('c38a2159-cad6-4603-8f0a-e64f21e2b290', 'Optical', 'Wired', 10000, 'Right', 'Black / Multicolor'),
('caa73790-b85c-4042-9fea-3467c3064ed6', 'Optical', 'Wireless', 20000, 'Right', 'Black'),
('cbe7be99-b871-4180-ac27-8f448666dc0e', 'Optical', 'Wireless', 8000, 'Right', 'Black'),
('d28229e2-7cef-4f3f-bad0-75486daf422a', 'Optical', 'Wired', 25600, 'Right', 'Black / Silver'),
('d30af531-7a62-4d27-a565-76f32c9771d3', 'Optical', 'Wired', 8500, 'Right', 'Black'),
('d3f8e70e-f726-47af-9093-8f44189242e2', 'Optical', 'Wireless', 10000, 'Right', 'Black'),
('d7066c62-8b5d-49a7-80c3-e0b3316a02c4', 'Optical', 'Wireless', 30000, 'Right', 'White'),
('d7bf4e84-f486-4520-9bd7-addad2a5f5de', 'Optical', 'Wireless', 8000, 'Right', 'Gray'),
('da0dff6c-7d07-4fb1-8eb5-f92caba1fa1c', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('dae6fea9-e591-4aa0-b732-a60e3379bc58', 'Optical', 'Wireless', 20000, 'Both', 'Black'),
('daff3363-f2cd-4dd9-a4a4-93caf0adf03f', 'Laser', 'Wireless', 4000, 'Right', 'Black / Silver'),
('db9772a1-a378-49a3-aaf8-0aee921b3368', 'Optical', 'Wireless', 12000, 'Right', 'Black'),
('dc1289ab-0067-4309-b4a8-d85c6987713c', 'Optical', 'Bluetooth Wireless', 18000, 'Right', 'Black'),
('dc430759-c837-4240-a4e2-627d415cf329', 'Optical', 'Wired', 12000, 'Right', 'Black'),
('dc98a70a-84ab-4e12-bcbf-68c60675f914', 'Optical', 'Wired', 8000, 'Right', 'Black'),
('dce7a339-e93d-435a-80e6-f864c255f1e6', 'Optical', 'Wired', 20000, 'Right', 'Black'),
('e882c5ac-ce04-4fcb-bf0e-cc23057f3318', 'Optical', 'Wireless', 12000, 'Right', 'Black'),
('ebfe9e31-6960-4a36-9fff-f95db4e98a29', 'Optical', 'Wireless', 19000, 'Right', 'White'),
('ed364aee-8333-40f5-8b63-b99c2ecf5dfe', 'Optical', 'Wired', 18000, 'Right', 'Black'),
('ef19377d-5105-4ede-9361-1b44343c5eb7', 'Optical', 'Wired', 18000, 'Right', 'Black'),
('f18f1268-bd68-4714-b834-ef6da534ee28', 'Optical', 'Wired', 16000, 'Right', 'Black'),
('f26f107f-86ba-4568-a32e-a4487e0484a5', 'Optical', 'Wireless', 18000, 'Right', 'White'),
('f4a2bc72-564d-4527-9b48-587c9182db05', 'Optical', 'Wired', 16000, 'Right', 'Black'),
('f5cdbf1c-81af-4161-b915-0fefc79e69be', 'Laser', 'Wired', 8200, 'Right', 'Black'),
('f849c7a1-71c3-45c4-b795-d623d9e66fd8', 'Optical', 'Wireless', 25400, 'Right', 'Black'),
('f8e219b3-4890-4d8a-9bd5-062ec8d9aadf', 'Optical', 'Wireless', 30000, 'Right', 'Black'),
('ff648c16-1571-4922-8ac1-bc8d532b28a8', 'Optical', 'Wired, Wired, Wireless', 25600, 'Right', 'Black');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` char(20) NOT NULL,
  `paymentMethod` char(20) NOT NULL,
  `paymentTotal` float NOT NULL,
  `status` char(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `status_ibfk_1` (`status`),
  KEY `username_ibfk_2` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT IGNORE INTO `orders` (`orderId`, `username`, `phone`, `paymentMethod`, `paymentTotal`, `status`, `address`, `city`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('2b6443a1-6de1-486b-9823-94c5bf77ba34', 'nguyenvinh', '0334680701', 'cod', 0, 'pending', 'cantho', 'Xuan Khanh Ninh Kieu Cần Thơ', '2022-12-10 18:17:54', NULL, NULL),
('3760e63d-569d-4ae2-b0e3-71bcb63c7f76', 'vinhvinh', '0334680701', 'cod', 69276.8, 'pending', '123/321 Xuan Khanh Ninh Kieu', 'Cần Thơ', '2022-12-05 15:56:37', '2022-12-07 21:44:24', NULL),
('43199965-0355-40a7-a0ac-39be6621545f', 'nguyenvinh', '0334680701', 'cod', 3142.75, 'pending', 'cantho', 'Cần Thơ', '2022-12-10 16:50:48', NULL, NULL),
('43fd9597-9419-412f-8fc8-f2b58ca739ed', 'nguyenvinh', '0334680701', 'cod', 3950, 'awaiting-payment', 'cantho', 'Cần Thơ', '2022-12-10 16:39:42', '2022-12-10 16:51:25', NULL),
('48475530-21f3-4182-a671-aa78629f8d17', 'nguyenvinh', '0334680701', 'cod', 53622.6, 'awaiting-pickup', 'Cần Thơ', 'cantho', '2022-12-10 16:50:56', '2022-12-10 16:51:26', NULL),
('604a4118-5345-4fed-acac-f45f48bc7f2e', 'vinhvinh', '0334680701', 'cod', 69276.8, 'awaiting-shipment', '123/321 Xuan Khanh Ninh Kieu', 'Cần Thơ', '2022-12-05 15:55:20', '2022-12-06 19:22:53', NULL),
('68a3fe79-9181-4283-8fc0-57e948255b37', 'nguyenvinh', '0334680701', 'cod', 174526, 'awaiting-shipment', 'Cần Thơ', 'cantho', '2022-12-10 16:50:35', '2022-12-10 16:51:28', NULL),
('6a844e0a-1990-40db-aff4-0bbb748a0b15', 'vinhvinh', '0334680701', 'cod', 69276.8, 'awaiting-pickup', '123/321 Xuan Khanh Ninh Kieu', 'Cần Thơ', '2022-12-05 03:39:15', '2022-12-06 17:51:57', NULL),
('6f59e670-a162-4c12-b00d-aac36bc03f7b', 'vinhvinh', '0334680701', 'cod', 3950, 'refunded', 'Cần Thơ', 'cantho', '2022-12-05 17:22:49', '2022-12-07 19:08:52', '2022-12-07 19:08:27'),
('73c4e55a-0229-4b9a-863b-828d50a41971', 'nguyenvinh', '0334680701', 'cod', 121999, 'compeleted', 'cantho', 'Cần Thơ', '2022-12-10 16:51:08', '2022-12-10 16:51:29', NULL),
('7ae50eae-25f4-4e41-8c37-0c4d2039154b', 'nguyenvinh', '0334680701', 'cod', 8499.75, 'cancelled', 'Cần Thơ', 'cantho', '2022-12-10 16:39:54', '2022-12-10 16:51:31', NULL),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', 'vinhvinh', '0334680701', 'cod', 42831.3, 'awaiting-payment', 'Cần Thơ', 'cantho', '2022-12-05 16:42:26', '2022-12-06 19:15:31', NULL),
('9b1cb3e6-e917-4ad0-a470-ac4b70eb52b9', 'vinhvinh', '0334680701', 'cod', 24999.8, 'awaiting-payment', 'cantho', 'Cần Thơ', '2022-12-05 17:21:45', '2022-12-09 04:05:58', NULL),
('a1f455d8-15ae-44cf-8f10-3978f7e688bd', 'nguyenvinh', '0334680701', 'cod', 3950, 'awaiting-payment', 'Xuan Khanh Ninh Kieu Cần Thơ', 'cantho', '2022-12-10 18:20:08', '2022-12-11 11:47:05', NULL),
('a4faee03-ff5b-462c-bc0e-b569f32982ce', 'vinhvinh', '0334680701', 'cod', 19268.2, 'pending', 'cantho', 'Cần Thơ', '2022-12-05 20:03:45', '2022-12-06 19:23:02', NULL),
('af296213-6ad2-4120-be9d-47b25d90e83f', 'vinhvinh', '0334680701', 'cod', 42831.3, 'awaiting-shipment', 'cantho', 'Cần Thơ', '2022-12-05 17:07:47', '2022-12-06 19:17:48', NULL),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', 'vinhvinh', '0334680701', 'cod', 42831.3, 'compeleted', 'Cần Thơ', 'cantho', '2022-12-05 17:08:18', '2022-12-06 19:13:31', NULL),
('cc04b8a0-416e-4cf2-b890-51dc3da4831b', 'vinhvinh', '0334680701', 'cod', 69276.8, 'cancelled', '123/321 Xuan Khanh Ninh Kieu', 'Cần Thơ', '2022-12-05 03:46:18', '2022-12-07 14:26:50', NULL),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', 'vinhvinh', '0334680701', 'cod', 42831.3, 'awaiting-payment', 'Cần Thơ', 'cantho', '2022-12-05 16:42:51', '2022-12-06 19:17:22', NULL),
('f2147fce-f983-4e7c-bcb2-48bd53c9ac3a', 'nguyenvinh', '0334680701', 'cod', 1124.75, 'refunded', 'Cần Thơ', 'cantho', '2022-12-10 16:51:43', '2022-12-10 16:51:52', NULL),
('f967eae8-47a3-4b11-824c-d2a6afe0582e', 'vinhvinh', '0334680701', 'cod', 34592.1, 'cancelled', 'cantho', 'Cần Thơ', '2022-12-06 01:22:44', '2022-12-09 04:06:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `orderId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `productId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`orderId`,`productId`),
  KEY `productId_ibfk_1` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT IGNORE INTO `order_items` (`orderId`, `productId`, `quantity`, `price`) VALUES
('2b6443a1-6de1-486b-9823-94c5bf77ba34', '0409b5c1-7e2a-4390-b9ad-fc17c3587696', 1, 0),
('3760e63d-569d-4ae2-b0e3-71bcb63c7f76', '02b53d23-f67b-4ece-a0f1-88ccb91294d9', 1, 3249.75),
('3760e63d-569d-4ae2-b0e3-71bcb63c7f76', '0749c7f1-55d9-4455-ac82-d7519f52bfe2', 1, 7749.75),
('3760e63d-569d-4ae2-b0e3-71bcb63c7f76', '1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 1, 2999.75),
('43199965-0355-40a7-a0ac-39be6621545f', '0f2802ca-113a-4c8b-b7d2-59affeb2e895', 1, 1118.75),
('43199965-0355-40a7-a0ac-39be6621545f', '10fb9239-5190-4479-9b43-feed314f8a01', 1, 949.75),
('43199965-0355-40a7-a0ac-39be6621545f', '1446d128-ccd9-462a-aabe-1b3334e8b5b4', 1, 949.5),
('43199965-0355-40a7-a0ac-39be6621545f', '156209a7-a0dc-4fcf-870d-bdb154183e41', 1, 124.75),
('43fd9597-9419-412f-8fc8-f2b58ca739ed', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('48475530-21f3-4182-a671-aa78629f8d17', '09b33991-e143-4ac8-8344-39f68b189e79', 1, 1999.5),
('48475530-21f3-4182-a671-aa78629f8d17', '0fa7bde4-0133-456a-931c-2c2c1ff1b2e4', 1, 1749.5),
('48475530-21f3-4182-a671-aa78629f8d17', '10365332-fcb0-407a-b2cc-705cb7d63f8c', 1, 12373.8),
('48475530-21f3-4182-a671-aa78629f8d17', '10e3523f-b9f3-4b45-a790-29251b739129', 1, 37499.8),
('604a4118-5345-4fed-acac-f45f48bc7f2e', '02b53d23-f67b-4ece-a0f1-88ccb91294d9', 1, 3249.75),
('604a4118-5345-4fed-acac-f45f48bc7f2e', '0749c7f1-55d9-4455-ac82-d7519f52bfe2', 1, 7749.75),
('604a4118-5345-4fed-acac-f45f48bc7f2e', '1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 1, 2999.75),
('68a3fe79-9181-4283-8fc0-57e948255b37', '035e9336-eba2-4c41-bb51-fd28adfa873d', 1, 8499.75),
('68a3fe79-9181-4283-8fc0-57e948255b37', '0613a5fe-ab62-4649-b702-b2ffce53a9b0', 1, 4044.75),
('68a3fe79-9181-4283-8fc0-57e948255b37', '0631b438-c1b7-44fc-8f40-cd7fd46abfa6', 1, 4058.25),
('68a3fe79-9181-4283-8fc0-57e948255b37', '081d93b0-30a3-4f23-a407-10eb02182108', 1, 5624.75),
('68a3fe79-9181-4283-8fc0-57e948255b37', '0d3f6a81-e194-4b7a-8def-525b2840a051', 1, 5749.75),
('68a3fe79-9181-4283-8fc0-57e948255b37', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('68a3fe79-9181-4283-8fc0-57e948255b37', '1171c61f-b901-472f-88ca-d370d810ad15', 1, 99975),
('68a3fe79-9181-4283-8fc0-57e948255b37', '1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 1, 2999.75),
('68a3fe79-9181-4283-8fc0-57e948255b37', '188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 1, 2824.5),
('68a3fe79-9181-4283-8fc0-57e948255b37', '18ac3f5f-490d-482d-b656-ddd1b370df6a', 1, 15749.8),
('6a844e0a-1990-40db-aff4-0bbb748a0b15', '02b53d23-f67b-4ece-a0f1-88ccb91294d9', 1, 3249.75),
('6a844e0a-1990-40db-aff4-0bbb748a0b15', '0749c7f1-55d9-4455-ac82-d7519f52bfe2', 1, 7749.75),
('6a844e0a-1990-40db-aff4-0bbb748a0b15', '1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 1, 2999.75),
('6f59e670-a162-4c12-b00d-aac36bc03f7b', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('73c4e55a-0229-4b9a-863b-828d50a41971', '069aaa3e-1157-452f-9636-54ced3eb831b', 1, 10749.8),
('73c4e55a-0229-4b9a-863b-828d50a41971', '08b866d8-eb34-40a5-9a45-2d2a9552f8ba', 1, 46249.8),
('73c4e55a-0229-4b9a-863b-828d50a41971', '0a47fca7-bff5-49df-b98c-445758564cc7', 1, 27499.8),
('73c4e55a-0229-4b9a-863b-828d50a41971', '10e3523f-b9f3-4b45-a790-29251b739129', 1, 37499.8),
('7ae50eae-25f4-4e41-8c37-0c4d2039154b', '035e9336-eba2-4c41-bb51-fd28adfa873d', 1, 8499.75),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '0409b5c1-7e2a-4390-b9ad-fc17c3587696', 1, 0),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '04dfb704-8e15-4b2f-b2f7-b6b389609e0b', 1, 1349.75),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '0613a5fe-ab62-4649-b702-b2ffce53a9b0', 1, 4044.75),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '06e27255-afe0-4833-a314-e3b95e82fc21', 1, 2762.75),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '07b65a08-2f81-4f39-a3c1-472b997d55cf', 1, 275),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 1, 2824.5),
('8b33d7a7-d01e-40c1-9d6b-f41e3ac6960e', '192a120c-b9c1-4f47-a39d-687ba09de46a', 1, 2624.75),
('9b1cb3e6-e917-4ad0-a470-ac4b70eb52b9', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('a1f455d8-15ae-44cf-8f10-3978f7e688bd', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('a4faee03-ff5b-462c-bc0e-b569f32982ce', '0613a5fe-ab62-4649-b702-b2ffce53a9b0', 1, 4044.75),
('a4faee03-ff5b-462c-bc0e-b569f32982ce', '0b23e0f6-1b1e-4396-b1e6-4a290ab9da16', 1, 3724.25),
('a4faee03-ff5b-462c-bc0e-b569f32982ce', '1088acf2-0ba0-4335-9a9b-b0cb1d2a2637', 1, 5249.5),
('a4faee03-ff5b-462c-bc0e-b569f32982ce', '11bdc462-bd59-4a75-9e24-58769d3c2251', 1, 6249.75),
('af296213-6ad2-4120-be9d-47b25d90e83f', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('af296213-6ad2-4120-be9d-47b25d90e83f', '0409b5c1-7e2a-4390-b9ad-fc17c3587696', 1, 0),
('af296213-6ad2-4120-be9d-47b25d90e83f', '04dfb704-8e15-4b2f-b2f7-b6b389609e0b', 1, 1349.75),
('af296213-6ad2-4120-be9d-47b25d90e83f', '0613a5fe-ab62-4649-b702-b2ffce53a9b0', 1, 4044.75),
('af296213-6ad2-4120-be9d-47b25d90e83f', '06e27255-afe0-4833-a314-e3b95e82fc21', 1, 2762.75),
('af296213-6ad2-4120-be9d-47b25d90e83f', '07b65a08-2f81-4f39-a3c1-472b997d55cf', 1, 275),
('af296213-6ad2-4120-be9d-47b25d90e83f', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('af296213-6ad2-4120-be9d-47b25d90e83f', '188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 1, 2824.5),
('af296213-6ad2-4120-be9d-47b25d90e83f', '192a120c-b9c1-4f47-a39d-687ba09de46a', 1, 2624.75),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '0409b5c1-7e2a-4390-b9ad-fc17c3587696', 1, 0),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '04dfb704-8e15-4b2f-b2f7-b6b389609e0b', 1, 1349.75),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '0613a5fe-ab62-4649-b702-b2ffce53a9b0', 1, 4044.75),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '06e27255-afe0-4833-a314-e3b95e82fc21', 1, 2762.75),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '07b65a08-2f81-4f39-a3c1-472b997d55cf', 1, 275),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 1, 2824.5),
('b5b42456-e897-4ca6-ab9a-613b1c2fee34', '192a120c-b9c1-4f47-a39d-687ba09de46a', 1, 2624.75),
('cc04b8a0-416e-4cf2-b890-51dc3da4831b', '02b53d23-f67b-4ece-a0f1-88ccb91294d9', 1, 3249.75),
('cc04b8a0-416e-4cf2-b890-51dc3da4831b', '0749c7f1-55d9-4455-ac82-d7519f52bfe2', 1, 7749.75),
('cc04b8a0-416e-4cf2-b890-51dc3da4831b', '1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 1, 2999.75),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 1, 3950),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '0409b5c1-7e2a-4390-b9ad-fc17c3587696', 1, 0),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '04dfb704-8e15-4b2f-b2f7-b6b389609e0b', 1, 1349.75),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '0613a5fe-ab62-4649-b702-b2ffce53a9b0', 1, 4044.75),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '06e27255-afe0-4833-a314-e3b95e82fc21', 1, 2762.75),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '07b65a08-2f81-4f39-a3c1-472b997d55cf', 1, 275),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 1, 2824.5),
('ea4ec9f5-a5b3-4caf-87b2-1b717aa51fb8', '192a120c-b9c1-4f47-a39d-687ba09de46a', 1, 2624.75),
('f2147fce-f983-4e7c-bcb2-48bd53c9ac3a', '0235630a-5c93-48fc-a4a4-b52682399016', 1, 1124.75),
('f967eae8-47a3-4b11-824c-d2a6afe0582e', '0f2802ca-113a-4c8b-b7d2-59affeb2e895', 1, 1118.75),
('f967eae8-47a3-4b11-824c-d2a6afe0582e', '1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 1, 24999.8),
('f967eae8-47a3-4b11-824c-d2a6afe0582e', '188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 3, 2824.5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `status` char(50) NOT NULL,
  `name` char(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT IGNORE INTO `order_status` (`status`, `name`, `description`) VALUES
('awaiting-payment', 'Chờ thanh toán', ''),
('awaiting-pickup', 'Đang lấy hàng', ''),
('awaiting-shipment', 'Đang vận chuyển', ''),
('cancelled', 'Đã hủy', ''),
('compeleted', 'Hoàn thành', ''),
('pending', 'Đang duyệt', ''),
('refunded', 'Đã trả hàng', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `producers`
--

DROP TABLE IF EXISTS `producers`;
CREATE TABLE IF NOT EXISTS `producers` (
  `brand` varchar(255) NOT NULL,
  `directLink` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `producers`
--

INSERT IGNORE INTO `producers` (`brand`, `directLink`, `imgUrl`) VALUES
('Acer', '', ''),
('Alienware', '', ''),
('AMD ', '', ''),
('AOC', '', ''),
('ASRock', '', ''),
('Asus', '', ''),
('BenQ', '', ''),
('Cooler Master', '', ''),
('Corsair', '', ''),
('Crucial', '', ''),
('Dell', '', ''),
('EVGA', '', ''),
('FinalMouse', '', ''),
('G.Skill', '', ''),
('Gigabyte', '', ''),
('Glorious', '', ''),
('HP', '', ''),
('Intel', '', ''),
('Kingston', '', ''),
('Lenovo', '', ''),
('Leven', '', ''),
('LG', '', ''),
('Logitech', '', ''),
('MSI', '', ''),
('Nvidia', '', ''),
('NZXT', '', ''),
('Patriot', '', ''),
('PNY', '', ''),
('PowerColor', '', ''),
('Razer', '', ''),
('Redragon', '', ''),
('Sabrent', '', ''),
('Samsung', '', ''),
('Sapphire', '', ''),
('Sceptre', '', ''),
('Seagate', '', ''),
('Silicon', '', ''),
('SK Hynix', '', ''),
('SteelSeries', '', ''),
('TEAMGROUP', '', ''),
('Timetec', '', ''),
('Trust', '', ''),
('Verbatim', '', ''),
('ViewSonic', '', ''),
('VIOTEK', '', ''),
('WD', '', ''),
('Western Digital', '', ''),
('XFX', '', ''),
('Zotac', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `productName` char(255) NOT NULL,
  `productBrand` char(255) NOT NULL,
  `productPhoto` char(255) NOT NULL,
  `productType` char(36) NOT NULL,
  `price` float DEFAULT 0,
  `inStock` int(10) DEFAULT 0,
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `createdAt` datetime DEFAULT current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`productId`),
  KEY `brand_ibfk_1` (`productBrand`),
  KEY `product_type_ibfk_1` (`productType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT IGNORE INTO `products` (`productId`, `productName`, `productBrand`, `productPhoto`, `productType`, `price`, `inStock`, `updatedAt`, `createdAt`, `deletedAt`) VALUES
('00efe89b-210e-4e10-9bc9-b28f3b09e67a', 'Western Digital Black SN850', 'Western Digital', '/images/products/storagedrive/d54938a88ad375113bb71ada129e2e8c.256p.jpg', 'storage drive', 5499.75, 50, NULL, '2022-11-21 12:00:58', NULL),
('011752e6-7cd5-4b17-8a12-0e6cc5b39440', 'Samsung Odyssey Neo G8 LS32BG852NNXGO', 'Samsung', '/images/products/monitor/41xt-MjqHXL.jpg', 'monitor', 32259.5, 195, NULL, '2022-11-20 19:15:09', NULL),
('01f6e868-c3ed-4717-8ebf-bbb5933786c1', 'MSI Optix G273QF', 'MSI', '/images/products/monitor/2432b5a9ff6456f6adb409344091d51b.256p.jpg', 'monitor', 6999.75, 59, NULL, '2022-11-20 19:15:09', NULL),
('0223b2b5-a184-4fcb-afaa-95e709070a7f', 'Dell UP3218K', 'Dell', '/images/products/monitor/d033ac72d7a1b3440f64bd9d9892fa49.256p.jpg', 'monitor', 100625, 52, NULL, '2022-11-20 19:15:09', NULL),
('02346ff1-69ae-4cc4-a7f3-4c97211e77eb', 'Silicon Power A55', 'Silicon', '/images/products/storagedrive/41gXg8ABtML.jpg', 'storage drive', 1274.75, 6, '2022-12-09 02:26:59', '2022-11-21 12:00:58', '2022-12-09 02:26:59'),
('0235630a-5c93-48fc-a4a4-b52682399016', 'TEAMGROUP T-Force Dark Za 16 GB', 'TEAMGROUP', '/images/products/ram/85cea43cca0974cb365560b8f8b963d3.256p.jpg', 'ram', 1124.75, 7, NULL, '2022-11-20 19:15:09', NULL),
('02b53d23-f67b-4ece-a0f1-88ccb91294d9', 'MSI PRO B660M-A DDR4', 'MSI', '/images/products/mainboard/cfd365831befdd481872962fb2c0d799.256p.jpg', 'mainboard', 3249.75, 146, NULL, '2022-11-20 19:15:09', NULL),
('0342a1ce-e392-44ba-a2cd-7fe3902c1730', 'Seagate BarraCuda', 'Seagate', '/images/products/storagedrive/51jzvyPoV6L.jpg', 'storage drive', 631, 90, '2022-12-09 02:25:42', '2022-11-21 12:00:58', '2022-12-09 02:25:42'),
('0359291e-5772-412f-8aa8-575fea2c2da3', 'MSI GAMING TRIO', 'MSI', '/images/products/videocard/399eae1daeaacdce9aae94f569032ce8.256p.jpg', 'video card', 59750, 72, NULL, '2022-11-20 19:15:09', NULL),
('035e9336-eba2-4c41-bb51-fd28adfa873d', 'Corsair Dominator Platinum RGB 32 GB', 'Corsair', '/images/products/ram/12b105580222aba6ee81efdb1addc00f.256p.jpg', 'ram', 8499.75, 196, NULL, '2022-11-20 19:15:09', NULL),
('03601ea7-597f-4c27-889c-05fe7a30b146', 'AMD Threadripper 3960X', 'AMD', '/images/products/cpu/amd-threadripper-3960x.jpg', 'cpu', 50252.5, 51, '2022-12-09 00:25:36', '2022-11-21 01:57:07', '2022-12-09 00:25:36'),
('039dc174-6e3d-424e-b86a-6c44ef6cb79b', 'Asus ROG X570 Crosshair VIII Dark Hero', 'Asus', '/images/products/mainboard/2df814ba2689b57e85f7f46b634f073e.256p.jpg', 'mainboard', 10412.8, 47, NULL, '2022-11-20 19:15:09', NULL),
('03ca25fe-6484-4d4b-80d0-928c3bb51b3e', 'AMD Ryzen 5 5600X', 'AMD', '/images/products/cpu/amd-ryzen-5-5600x.jpg', 'cpu', 3950, 163, NULL, '2022-11-21 01:57:07', NULL),
('0409b5c1-7e2a-4390-b9ad-fc17c3587696', 'AMD Ryzen 5 3600', 'AMD', '/images/products/cpu/amd-ryzen-5-3600.jpg', 'cpu', 0, 153, NULL, '2022-11-21 01:57:07', NULL),
('04dfb704-8e15-4b2f-b2f7-b6b389609e0b', 'G.Skill Ripjaws V 16 GB', 'G.Skill', '/images/products/ram/e5e3c1ef6198d9cbf66712ed5a0f45f0.256p.jpg', 'ram', 1349.75, 50, NULL, '2022-11-20 19:15:09', NULL),
('04e96bd4-2a1e-42d5-88b9-c0c9fa804db4', 'Logitech MX MASTER 3S', 'Logitech', '/images/products/mouse/487d6f4109b89a3e2c44fa934dd43b2c.256p.jpg', 'mouse', 2374.75, 40, '2022-12-09 03:42:57', '2022-11-20 19:15:09', '2022-12-09 03:42:57'),
('04f4c82d-b359-4992-87b6-1128d9670237', 'Silicon Power A60', 'Silicon', '/images/products/storagedrive/0502d0e9177bf57189386f69ba859b0e.256p.jpg', 'storage drive', 2987.25, 193, NULL, '2022-11-21 12:00:58', NULL),
('0613a5fe-ab62-4649-b702-b2ffce53a9b0', 'Intel Core i5-11400F', 'Intel', '/images/products/cpu/intel-core-i5-11400f.jpg', 'cpu', 4044.75, 153, NULL, '2022-11-21 01:57:07', NULL),
('0631b438-c1b7-44fc-8f40-cd7fd46abfa6', 'Kingston FURY Beast 32 GB', 'Kingston', '/images/products/ram/4108ce94c499008912266b2f019d061b.256p.jpg', 'ram', 4058.25, 134, NULL, '2022-11-20 19:15:09', NULL),
('0682bc08-759b-4015-8f82-49f83907cbb6', 'EVGA XC3 ULTRA GAMING', 'EVGA', '/images/products/videocard/ff4cbdae6cbb8fe15b9da4a022d88a06.256p.jpg', 'video card', 19747.5, 57, NULL, '2022-11-20 19:15:09', NULL),
('069aaa3e-1157-452f-9636-54ced3eb831b', 'PowerColor Red Devil', 'PowerColor', '/images/products/videocard/0494f4e94ea334306d4aaae9a0cc3d8c.256p.jpg', 'video card', 10749.8, 48, NULL, '2022-11-20 19:15:09', NULL),
('06e27255-afe0-4833-a314-e3b95e82fc21', 'AMD Ryzen 5 5600G', 'AMD', '/images/products/cpu/amd-ryzen-5-5600g.jpg', 'cpu', 2762.75, 96, NULL, '2022-11-21 01:57:07', NULL),
('0705d5d7-7cff-4fa6-a712-1b21eb757808', 'Razer DeathAdder Essential', 'Razer', '/images/products/mouse/430bfeab57e003dfb6c1d292339e1df8.256p.jpg', 'mouse', 474.5, 144, NULL, '2022-11-20 19:15:09', NULL),
('0749c7f1-55d9-4455-ac82-d7519f52bfe2', 'Asus ROG STRIX Z690-A GAMING WIFI D4', 'Asus', '/images/products/mainboard/519E97-55L.jpg', 'mainboard', 7749.75, 124, NULL, '2022-11-20 19:15:09', NULL),
('07ab664c-5266-4fca-9c76-9d07cc73b1d9', 'Gigabyte AORUS Gen4', 'Gigabyte', '/images/products/storagedrive/d59265eb1c1a742d7b7510e8259924db.256p.jpg', 'storage drive', 0, 82, '2022-12-09 03:06:16', '2022-11-21 12:00:58', '2022-12-09 03:06:16'),
('07b65a08-2f81-4f39-a3c1-472b997d55cf', 'Crucial CT25664AA667 2 GB', 'Crucial', '/images/products/ram/d8b2a9043e11bab8541b134b75b215f9.256p.jpg', 'ram', 275, 111, NULL, '2022-11-20 19:15:09', NULL),
('081d93b0-30a3-4f23-a407-10eb02182108', 'G.Skill Trident Z5 Neo RGB 32 GB', 'G.Skill', '/images/products/ram/a4cecff25f58230f3fbae1903d711e49.256p.jpg', 'ram', 5624.75, 143, NULL, '2022-11-20 19:15:09', NULL),
('0848a1b1-d718-45d6-bb79-7718d9d49df9', 'Acer SB220Q bi', 'Acer', '/images/products/monitor/51I3UjD-Q1L.jpg', 'monitor', 2499.75, 4, NULL, '2022-11-20 19:15:09', NULL),
('0870579a-e5ef-4495-940d-1cb16f43a920', 'Asus ROG STRIX B550-F GAMING WIFI II', 'Asus', '/images/products/mainboard/417jkaDUMWL.jpg', 'mainboard', 5124.75, 14, NULL, '2022-11-20 19:15:09', NULL),
('08b866d8-eb34-40a5-9a45-2d2a9552f8ba', 'Asus TUF GAMING OC', 'Asus', '/images/products/videocard/66ec45a84a19d73ec9b0b5098a0c9b00.256p.jpg', 'video card', 46249.8, 129, NULL, '2022-11-20 19:15:09', NULL),
('092609d8-cd0f-4b39-af2e-f6449f799200', 'Kingston NV1', 'Kingston', '/images/products/storagedrive/4b38e34b765a81eddcd84d5450a7f353.256p.jpg', 'storage drive', 1062.25, 175, NULL, '2022-11-21 12:00:58', NULL),
('09b33991-e143-4ac8-8344-39f68b189e79', 'Crucial P3 Plus', 'Crucial', '/images/products/storagedrive/2830bf3ba317c794ccde742efe4304be.256p.jpg', 'storage drive', 1999.5, 107, NULL, '2022-11-21 12:00:58', NULL),
('09caf6f8-3e6d-4bae-aeed-3aaa6f09d93a', 'Corsair Vengeance LPX 32 GB', 'Corsair', '/images/products/ram/ae9c14173c768f2fa9ad4d3c957e94a0.256p.jpg', 'ram', 2249.75, 127, NULL, '2022-11-20 19:15:09', NULL),
('09fe660c-9e3f-41a1-b31d-92e0fbff28e9', 'MSI GAMING X TRIO', 'MSI', '/images/products/videocard/41Z16iQUbL.jpg', 'video card', 18999.8, 179, '2022-11-21 12:05:54', '2022-11-20 19:15:09', NULL),
('0a47fca7-bff5-49df-b98c-445758564cc7', 'PowerColor Red Devil OC', 'PowerColor', '/images/products/videocard/5199e776d5e1c9d319b4a275139bbcf4.256p.jpg', 'video card', 27499.8, 30, NULL, '2022-11-20 19:15:09', NULL),
('0aef48a5-cff0-422c-92d4-f8e5246d6de5', 'Corsair IRONCLAW RGB WIRELESS', 'Corsair', '/images/products/mouse/31hR2kTeYoL.jpg', 'mouse', 1749.5, 11, NULL, '2022-11-20 19:15:09', NULL),
('0b23e0f6-1b1e-4396-b1e6-4a290ab9da16', 'AMD Ryzen 5 3400G', 'AMD', '/images/products/cpu/amd-ryzen-5-3400g.jpg', 'cpu', 3724.25, 47, NULL, '2022-11-21 01:57:07', NULL),
('0d2e12c6-9df8-4705-bf8a-806bca02c524', 'Intel Core i9-12900K', 'Intel', '/images/products/cpu/intel-core-i9-12900k.jpg', 'cpu', 12497.2, 15, NULL, '2022-11-21 01:57:07', NULL),
('0d3f6a81-e194-4b7a-8def-525b2840a051', 'Corsair Vengeance RGB Pro 64 GB', 'Corsair', '/images/products/ram/d851f1857c811d660d397c40970b77b8.256p.jpg', 'ram', 5749.75, 115, NULL, '2022-11-20 19:15:09', NULL),
('0df38cc7-e0ac-4e1f-b666-92e50e6e4840', 'Kingston FURY Beast 32 GB', 'Kingston', '/images/products/ram/4108ce94c499008912266b2f019d061b.256p.jpg', 'ram', 3749.75, 147, NULL, '2022-11-20 19:15:09', NULL),
('0ee70806-4c12-4e3c-95c0-1c3adda9372f', 'AOC AGON AG322QCX', 'AOC', '/images/products/monitor/41eHSGkYKNL.jpg', 'monitor', 4999.75, 18, NULL, '2022-11-20 19:15:09', NULL),
('0f2802ca-113a-4c8b-b7d2-59affeb2e895', 'Glorious MODEL O', 'Glorious', '/images/products/mouse/ab7f3f6e7b4d49a7dbaec72d7ec00b2b.256p.jpg', 'mouse', 1118.75, 96, NULL, '2022-11-20 19:15:09', NULL),
('0f737e8c-4329-4d38-bb95-dd325057c40b', 'G.Skill Aegis 16 GB', 'G.Skill', '/images/products/ram/9e003e10740c0e04136649de59fa2ab5.256p.jpg', 'ram', 1249.75, 189, NULL, '2022-11-20 19:15:09', NULL),
('0fa7bde4-0133-456a-931c-2c2c1ff1b2e4', 'Western Digital Black SN850', 'Western Digital', '/images/products/storagedrive/67ae19fe7847cb5bf67f4448e717e831.256p.jpg', 'storage drive', 1749.5, 90, NULL, '2022-11-21 12:00:58', NULL),
('10365332-fcb0-407a-b2cc-705cb7d63f8c', 'Western Digital Black SN850X', 'Western Digital', '/images/products/storagedrive/8e6dbae8a0f3c6572216c8758ce5a0b5.256p.jpg', 'storage drive', 12373.8, 144, NULL, '2022-11-21 12:00:58', NULL),
('103746a5-3259-419f-8854-0734f17b87b0', 'Razer Viper 8KHz', 'Razer', '/images/products/mouse/57e54358c52493a49f369c4374aaf201.256p.jpg', 'mouse', 1246.75, 2, NULL, '2022-11-20 19:15:09', NULL),
('1088acf2-0ba0-4335-9a9b-b0cb1d2a2637', 'LG 24GN600-B', 'LG', '/images/products/monitor/500fd3e8fbad9d6a810ab335406c0c5e.256p.jpg', 'monitor', 5249.5, 147, NULL, '2022-11-20 19:15:09', NULL),
('10e3523f-b9f3-4b45-a790-29251b739129', 'Sabrent Rocket 4 Plus', 'Sabrent', '/images/products/storagedrive/41OMsuF3ZKL.jpg', 'storage drive', 37499.8, 190, NULL, '2022-11-21 12:00:58', NULL),
('10fb9239-5190-4479-9b43-feed314f8a01', 'Logitech G305 (White)', 'Logitech', '/images/products/mouse/e5ae54669b6dc857c4d03a26e70ed9d5.256p.jpg', 'mouse', 949.75, 102, NULL, '2022-11-20 19:15:09', NULL),
('1104aaab-6c00-45c8-ad06-9f5d73b7dee0', 'Asus ROG MAXIMUS Z790 EXTREME', 'Asus', '/images/products/mainboard/0bdeb76dab36d2c0f3871d8000f30052.256p.jpg', 'mainboard', 24999.8, 5, NULL, '2022-11-20 19:15:09', NULL),
('1171c61f-b901-472f-88ca-d370d810ad15', 'Asus ProArt PQ22UC', 'Asus', '/images/products/monitor/419v6NRDdbL.jpg', 'monitor', 99975, 146, NULL, '2022-11-20 19:15:09', NULL),
('1198b9d6-7a84-4aab-9e1c-09f6f91c18e1', 'MSI B550M PRO-VDH WIFI', 'MSI', '/images/products/mainboard/57b4a5399dc626e9c5786f786aeb94ac.256p.jpg', 'mainboard', 2999.75, 18, NULL, '2022-11-20 19:15:09', NULL),
('11bdc462-bd59-4a75-9e24-58769d3c2251', 'Samsung S27AG50', 'Samsung', '/images/products/monitor/41OEutOvWVS.jpg', 'monitor', 6249.75, 83, NULL, '2022-11-20 19:15:09', NULL),
('12731fe4-444c-4eff-be7e-44441094d148', 'Crucial Ballistix 16 GB', 'Crucial', '/images/products/ram/aa34b3c28154431c4b8ebd2f90a647e4.256p.jpg', 'ram', 2496.25, 129, NULL, '2022-11-20 19:15:09', NULL),
('131c4488-7f0d-48f7-8706-3122439a7c1f', 'Silicon Power GAMING 16 GB', 'Silicon', '/images/products/ram/62a4ba196f5f165e68619a63ef5d0b70.256p.jpg', 'ram', 1024.25, 112, NULL, '2022-11-20 19:15:09', NULL),
('135c6b25-31d5-41ea-b1ed-168152a0b99a', 'Corsair Vengeance 64 GB', 'Corsair', '/images/products/ram/44511eed6b609f1979ca94fe5ed2e2ad.256p.jpg', 'ram', 6749.75, 59, NULL, '2022-11-20 19:15:09', NULL),
('13c5cac6-d141-4d2d-80c0-3c712dbf1b10', 'HP X27q', 'HP', '/images/products/monitor/24252ada5591ffda57b4099ad8c353d6.256p.jpg', 'monitor', 5600, 60, NULL, '2022-11-20 19:15:09', NULL),
('141c9296-a7ec-4c32-9b32-76c19a46b067', 'MSI Optix MAG274QRF-QD', 'MSI', '/images/products/monitor/30f6ad5628a5425e94939b431bd85d55.256p.jpg', 'monitor', 10198.8, 177, NULL, '2022-11-20 19:15:09', NULL),
('1430b398-682c-48b3-a767-5085d203fe67', 'Corsair Vengeance RGB 32 GB', 'Corsair', '/images/products/ram/ebca1cc55cb7829ce3ed0b8a13efce7e.256p.jpg', 'ram', 9382, 87, NULL, '2022-11-20 19:15:09', NULL),
('143f53e5-9439-45c6-bb39-ff5e0bd650ff', 'Gigabyte Vision OC', 'Gigabyte', '/images/products/videocard/41D-YkcTJBS.jpg', 'video card', 20874.5, 51, NULL, '2022-11-20 19:15:09', NULL),
('1446d128-ccd9-462a-aabe-1b3334e8b5b4', 'Razer Basilisk X HyperSpeed', 'Razer', '/images/products/mouse/41oOvmaIzYL.jpg', 'mouse', 949.5, 12, NULL, '2022-11-20 19:15:09', NULL),
('151d0101-1162-4bee-b4e9-b739b92885a4', 'Western Digital Black SN770', 'Western Digital', '/images/products/storagedrive/8fcb88c883df1ee3563538df639a08c8.256p.jpg', 'storage drive', 2427, 115, NULL, '2022-11-21 12:00:58', NULL),
('156209a7-a0dc-4fcf-870d-bdb154183e41', 'Verbatim 98113', 'Verbatim', '/images/products/mouse/e68c83700ec204d722f08c0a5c2a0b81.256p.jpg', 'mouse', 124.75, 172, NULL, '2022-11-20 19:15:09', NULL),
('16aff1ba-2864-471f-b52a-470bc2cc4cbb', 'MSI Radeon RX 6600 MECH 2X 8G', 'MSI', '/images/products/videocard/41R3RAPj-kL.jpg', 'video card', 4749.75, 96, NULL, '2022-11-20 19:15:09', NULL),
('16f5a1a0-abbe-42aa-82e4-a272195c818d', 'Corsair Vengeance LPX 64 GB', 'Corsair', '/images/products/ram/ef76582ad70db194abfb960a5e7d6add.256p.jpg', 'ram', 4699.75, 167, NULL, '2022-11-20 19:15:09', NULL),
('17010ec3-f88f-48dc-8db1-92716c0b6620', 'Samsung 980 Pro', 'Samsung', '/images/products/storagedrive/81d258654f0eb603dc240de6cbca9754.256p.jpg', 'storage drive', 1998.75, 149, NULL, '2022-11-21 12:00:58', NULL),
('1777588b-b17c-4c38-a09c-79bd155ff60d', 'Razer Viper Ultimate', 'Razer', '/images/products/mouse/83448f14ea7aad477596baf8ae892723.256p.jpg', 'mouse', 5450.5, 47, NULL, '2022-11-20 19:15:09', NULL),
('17a6f187-1eec-431b-a69e-441f534219e9', 'Samsung 870 Evo', 'Samsung', '/images/products/storagedrive/2c576ecaedba7428ac231ac4f1e12a4d.256p.jpg', 'storage drive', 9499.75, 32, NULL, '2022-11-21 12:00:58', NULL),
('17f4b732-21a3-46c8-a644-78f6afd96510', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/no-image.png', 'video card', 24.75, 72, '2022-12-09 03:08:11', '2022-11-20 19:15:09', '2022-12-09 03:08:11'),
('18078029-a2b8-4093-b4e0-a8a33a04ab5e', 'MSI GeForce RTX 3090 TI GAMING X TRIO 24G', 'MSI', '/images/products/videocard/bba9d8be3e2c922dd5dc2c9f4f3bb405.256p.jpg', 'video card', 39950, 125, NULL, '2022-11-20 19:15:09', NULL),
('18130170-c7cc-4ec9-8c40-abbb3cf2cb6d', 'LG 22MP400-B', 'LG', '/images/products/monitor/3f64b0dd6f73b9e81f6b9ba397735653.256p.jpg', 'monitor', 1999.5, 166, NULL, '2022-11-20 19:15:09', NULL),
('188b3f95-a4aa-4fe7-93c9-fc1a5acda735', 'MSI PRO B550M-VC WIFI', 'MSI', '/images/products/mainboard/3ba98d49243674bac25ebc39e6cc1fbc.256p.jpg', 'mainboard', 2824.5, 16, NULL, '2022-11-20 19:15:09', NULL),
('18ac3f5f-490d-482d-b656-ddd1b370df6a', 'Asus ROG MAXIMUS Z790 HERO', 'Asus', '/images/products/mainboard/05e4de174a09d66930ef0706d0cec194.256p.jpg', 'mainboard', 15749.8, 96, NULL, '2022-11-20 19:15:09', NULL),
('18b0a17d-4344-489f-9203-e873bba6a982', 'Western Digital Caviar Blue', 'Western Digital', '/images/products/storagedrive/daf819b70eccf7fec275bd65e3fe2b6a.256p.jpg', 'storage drive', 999.75, 138, NULL, '2022-11-21 12:00:58', NULL),
('18e5dc8d-b41c-4270-8daf-c4e0191e6814', 'Asus TUF Gaming VG279QM', 'Asus', '/images/products/monitor/07a61ae69ef1a71b2f3580da52ee2df1.256p.jpg', 'monitor', 7225, 86, NULL, '2022-11-20 19:15:09', NULL),
('192a120c-b9c1-4f47-a39d-687ba09de46a', 'ASRock B550 Pro4', 'ASRock', '/images/products/mainboard/9c582991edb4ccf7cdaaab81543bf668.256p.jpg', 'mainboard', 2624.75, 65, NULL, '2022-11-20 19:15:09', NULL),
('19330b04-6071-45d9-9187-b974c12bb101', 'ASRock A320M-HDV R4.0', 'ASRock', '/images/products/mainboard/319dae29c77ad8d77a67796eb1315465.256p.jpg', 'mainboard', 1474.5, 60, NULL, '2022-11-20 19:15:09', NULL),
('1a61c24d-e274-47cb-8e4f-e6678eb3dec3', 'Gigabyte EAGLE', 'Gigabyte', '/images/products/videocard/41HhGrOxeWL.jpg', 'video card', 5499.75, 141, NULL, '2022-11-20 19:15:09', NULL),
('1ac716e7-ac0b-401a-8b1c-438e06e57a94', 'Asus ROG STRIX B450-F GAMING II', 'Asus', '/images/products/mainboard/0f27bb84f57d51a9cb2b0c91d25efb0f.256p.jpg', 'mainboard', 5387, 164, NULL, '2022-11-20 19:15:09', NULL),
('1b05da25-b696-40dc-b767-183ab7d92d03', 'MSI VENTUS 2X OC', 'MSI', '/images/products/videocard/41ejsAM-YlS.jpg', 'video card', 13999.8, 190, NULL, '2022-11-20 19:15:09', NULL),
('1b8804ca-7d74-4cfa-979b-8524fd1bd998', 'Western Digital WD_BLACK', 'Western Digital', '/images/products/storagedrive/ec18382394ec2952a8e9d49c60848c98.256p.jpg', 'storage drive', 3249.75, 181, NULL, '2022-11-21 12:00:58', NULL),
('1cabfdee-34e0-4356-ba50-110eaf304d1d', 'EVGA XC3 ULTRA GAMING', 'EVGA', '/images/products/videocard/31f97a214359674c007e9255c39d5a33.256p.jpg', 'video card', 17498.8, 51, NULL, '2022-11-20 19:15:09', NULL),
('1cc1dcbf-5caa-4c1a-81c7-c44de0ff1e7f', 'Razer Mamba Elite', 'Razer', '/images/products/mouse/c2346112fa183f5096da60261edf05c2.256p.jpg', 'mouse', 998.75, 4, NULL, '2022-11-20 19:15:09', NULL),
('1cce692e-4d49-4c68-aea0-a281f6fa161c', 'Asus TUF GAMING OC', 'Asus', '/images/products/videocard/395c889b89aa11dc1c1ec7f2620cc0bf.256p.jpg', 'video card', 20380.5, 74, NULL, '2022-11-20 19:15:09', NULL),
('1ed8adb1-0ad9-4a3d-a934-90a3194c0025', 'Crucial P5 Plus', 'Crucial', '/images/products/storagedrive/43c2b68eaed9cd66fa6d7d71ee8e2756.256p.jpg', 'storage drive', 2749.75, 5, NULL, '2022-11-21 12:00:58', NULL),
('1f0da663-0f26-428c-91e9-5f75f61fb561', 'TEAMGROUP T-Force Delta RGB 16 GB', 'TEAMGROUP', '/images/products/ram/407b6b1ede8e4f885d02f2bcf32ed131.256p.jpg', 'ram', 1499.75, 3, NULL, '2022-11-20 19:15:09', NULL),
('1f5b79a7-c3f4-413c-91f4-d5dae1157c3d', 'AMD Ryzen 5 3600', 'AMD', '/images/products/cpu/amd-ryzen-5-3600.jpg', 'cpu', 0, 66, NULL, '2022-11-21 01:57:07', NULL),
('1f8252de-fffc-4272-a70b-6966e2028c75', 'Gigabyte G27Q', 'Gigabyte', '/images/products/monitor/733712e75da1ade84876cab068d301af.256p.jpg', 'monitor', 5999.75, 52, NULL, '2022-11-20 19:15:09', NULL),
('1f9ba36c-c4fd-4fff-afe9-e31713c9f537', 'Asus ROG STRIX Z790-E GAMING WIFI', 'Asus', '/images/products/mainboard/79687dad482d6163f14752ea4764c5f2.256p.jpg', 'mainboard', 12499.8, 90, NULL, '2022-11-20 19:15:09', NULL),
('20639afa-7d89-4463-bfad-b2a0f2244024', 'Intel Core i7-13700K', 'Intel', '/images/products/cpu/intel-core-i7-13700k.jpg', 'cpu', 10999.8, 154, NULL, '2022-11-21 01:57:07', NULL),
('20cb1a56-9ee3-4fb9-be32-2583c162c40f', 'Asus ROG Strix XG27AQ', 'Asus', '/images/products/monitor/394f734a8541b8110d82adb9537294d0.256p.jpg', 'monitor', 9475, 123, NULL, '2022-11-20 19:15:09', NULL),
('20e99ea2-4b5b-4d80-a9a8-aabbbfb0f161', 'Samsung U28R550', 'Samsung', '/images/products/monitor/ecaf41184fa6eb6ed23c9911976d42c5.256p.jpg', 'monitor', 6818.5, 125, NULL, '2022-11-20 19:15:09', NULL),
('20f04585-3807-4ed9-bb3b-5d6edfd4a89a', 'MSI VENTUS 3X PLUS OC', 'MSI', '/images/products/videocard/23bf667dbb8affead918141f26a7256c.256p.jpg', 'video card', 25725, 4, NULL, '2022-11-20 19:15:09', NULL),
('21130e81-e8e3-4f5d-ada6-be668940fdd0', 'Intel 660p', 'Intel', '/images/products/storagedrive/72ac6b04347d22c2592029d4a49bc5ed.256p.jpg', 'storage drive', 1999.75, 95, NULL, '2022-11-21 12:00:58', NULL),
('2142571f-f66e-4ed9-b1a7-519aa5c72431', 'Intel Core i9-13900KF', 'Intel', '/images/products/cpu/intel-core-i9-13900kf.jpg', 'cpu', 15749.8, 113, NULL, '2022-11-21 01:57:07', NULL),
('2142927a-9be2-4d17-9682-218c996ad9b6', 'Intel Core i7-12700', 'Intel', '/images/products/cpu/intel-core-i7-12700.jpg', 'cpu', 9499.25, 42, NULL, '2022-11-21 01:57:07', NULL),
('219266d4-3dad-475e-b8e3-388b9fa8ac35', 'Intel Core i7-9700K', 'Intel', '/images/products/cpu/intel-core-i7-9700k.jpg', 'cpu', 10750, 195, NULL, '2022-11-21 01:57:07', NULL),
('21dfb4b1-2f45-40be-8987-902d35e4ac57', 'Gigabyte Z790 AORUS MASTER', 'Gigabyte', '/images/products/mainboard/3e4762007b6ce3aed42a5fba22808f41.256p.jpg', 'mainboard', 12499.8, 18, NULL, '2022-11-20 19:15:09', NULL),
('21e1cc57-91a0-47a9-9c0f-e2934cf83046', 'Verbatim Bravo', 'Verbatim', '/images/products/mouse/5c388ef9bdfd2933f0cef41aa21ad5a1.256p.jpg', 'mouse', 149.75, 113, NULL, '2022-11-20 19:15:09', NULL),
('229a7ae5-54d0-4c1f-beda-ff7fa5e91008', 'AMD Ryzen 9 3950X', 'AMD', '/images/products/cpu/amd-ryzen-9-3950x.jpg', 'cpu', 15250, 128, NULL, '2022-11-21 01:57:07', NULL),
('2325f6e2-dd7a-46fd-bc13-9b1db3f26bd4', 'Intel Core i5-9400F', 'Intel', '/images/products/cpu/intel-core-i5-9400f.jpg', 'cpu', 3350, 30, NULL, '2022-11-21 01:57:07', NULL),
('23b058b2-176a-49b3-a856-f63e6b3a0e99', 'TEAMGROUP MP33', 'TEAMGROUP', '/images/products/storagedrive/567dfd409067c0a10aa67fc3c720c46d.256p.jpg', 'storage drive', 512.25, 91, NULL, '2022-11-21 12:00:58', NULL),
('241e4d63-0b06-43e9-8363-b5662f418373', 'Intel Core i9-11900K', 'Intel', '/images/products/cpu/intel-core-i9-11900k.jpg', 'cpu', 9224.5, 65, NULL, '2022-11-21 01:57:07', NULL),
('24203417-6b82-40ae-8dec-cb7dedbfe5cd', 'SteelSeries Rival 3', 'SteelSeries', '/images/products/mouse/24c3004e0bf166466ca2e8cf1ab55490.256p.jpg', 'mouse', 524.75, 115, NULL, '2022-11-20 19:15:09', NULL),
('24270300-8078-478e-b179-117534391580', 'PNY VCQGV100-PB', 'PNY', '/images/products/videocard/0eb40ca634c09fc68d229c92a2e23a14.256p.jpg', 'video card', 264000, 54, NULL, '2022-11-20 19:15:09', NULL),
('242dd071-98a9-49a3-96d0-88effc7cd06c', 'Intel Core i5-11600KF', 'Intel', '/images/products/cpu/intel-core-i5-11600kf.jpg', 'cpu', 4997.5, 4, NULL, '2022-11-21 01:57:07', NULL),
('24a559d3-4610-4375-8d3b-5a84139f0b69', 'Logitech M100', 'Logitech', '/images/products/mouse/0dd8486ae196d3bd49621b0647075be6.256p.jpg', 'mouse', 224.75, 8, NULL, '2022-11-20 19:15:09', NULL),
('24c11ced-c0c3-4d33-825a-b9f28adb99da', 'Samsung Odyssey G7 LC32G75TQSNXZA', 'Samsung', '/images/products/monitor/e82c8d87bd5ae8836cfc2258a686e596.256p.jpg', 'monitor', 15524.8, 166, NULL, '2022-11-20 19:15:09', NULL),
('25a0c20a-0a93-4d17-8bea-4cc0f33d7a22', 'TEAMGROUP T-Force Vulcan Z 32 GB', 'TEAMGROUP', '/images/products/ram/01da19f16d5e4c5808f64fb9049afb68.256p.jpg', 'ram', 2224.75, 44, NULL, '2022-11-20 19:15:09', NULL),
('26305cb5-1f6e-4596-a8c7-5c2f0df8d7df', 'MSI SUPRIM X', 'MSI', '/images/products/videocard/6fa33728c427e570c91d799eee263f6a.256p.jpg', 'video card', 24.75, 190, NULL, '2022-11-20 19:15:09', NULL),
('26f5d2d8-4ed1-407e-9fca-2f14ed49026f', 'G.Skill Flare X5 32 GB', 'G.Skill', '/images/products/ram/5bfb04d855b1e501d71ef7516d5c39f7.256p.jpg', 'ram', 4724.75, 100, NULL, '2022-11-20 19:15:09', NULL),
('27e9193f-d842-4151-8016-2c5bab6d9c34', 'Asus VG248QG', 'Asus', '/images/products/monitor/325b541af8d2441964716a67de7ec081.256p.jpg', 'monitor', 4725, 0, NULL, '2022-11-20 19:15:09', NULL),
('288c5573-84d1-47c6-a194-452de5118ce2', 'MSI A320M-A PRO', 'MSI', '/images/products/mainboard/f1398e1d4522992aeed28eb9f6385679.256p.jpg', 'mainboard', 1249.75, 73, NULL, '2022-11-20 19:15:09', NULL),
('28a23cc2-4ec2-42db-8d20-efbe663d8252', 'Asus ROG Strix XG349C', 'Asus', '/images/products/monitor/1bd060775d8fdea450f5fdca41c6ed75.256p.jpg', 'monitor', 19975, 42, NULL, '2022-11-20 19:15:09', NULL),
('28ae8c86-f598-4aaf-a82a-1f435d2f9f87', 'Asus ROG Swift 360Hz PG27AQN', 'Asus', '/images/products/monitor/70b4621850d1d81a6220fc4e25aaa2fb.256p.jpg', 'monitor', 0, 72, NULL, '2022-11-20 19:15:09', NULL),
('28aff048-dc8a-407e-9f0b-59f5d8d544b1', 'Kingston HyperX Fury 16 GB', 'Kingston', '/images/products/ram/253be8362d567f55b4ce7672e42a6cb2.256p.jpg', 'ram', 2947.5, 5, NULL, '2022-11-20 19:15:09', NULL),
('28e81dbf-87b4-4682-85c8-6a9a3992ada0', 'Dell E1914H', 'Dell', '/images/products/monitor/51lGDJiyuzL.jpg', 'monitor', 1373.75, 192, NULL, '2022-11-20 19:15:09', NULL),
('29a91d3f-81a2-4d56-8f22-64accaee62ee', 'Asus ROG STRIX B550-A GAMING', 'Asus', '/images/products/mainboard/5ac88d84f61dd91c0621ac30c4dc5480.256p.jpg', 'mainboard', 4249.75, 97, NULL, '2022-11-20 19:15:09', NULL),
('2a0c58af-4d46-469a-816d-1cf10916de47', 'Gigabyte GAMING OC', 'Gigabyte', '/images/products/videocard/e437fd1af18c7f0912c155544d597ae5.256p.jpg', 'video card', 16735, 75, NULL, '2022-11-20 19:15:09', NULL),
('2a368276-b1cd-45d7-a7a2-2fb6b5cecf7f', 'Asus VG248QE', 'Asus', '/images/products/monitor/c5fbd60e5912f11c9fba9cd58ff4dc08.256p.jpg', 'monitor', 4873.5, 100, NULL, '2022-11-20 19:15:09', NULL),
('2a456f13-b167-46ef-b6f6-9ddf4d5dde16', 'Intel Core i7-8700', 'Intel', '/images/products/cpu/intel-core-i7-8700.jpg', 'cpu', 8000, 85, NULL, '2022-11-21 01:57:07', NULL),
('2b2aea69-7483-4227-93f4-0cb251d02787', 'AMD Ryzen 5 1600', 'AMD', '/images/products/cpu/amd-ryzen-5-1600.jpg', 'cpu', 4402.5, 186, NULL, '2022-11-21 01:57:07', NULL),
('2b7e518a-81cb-4edc-b596-603f06ada90d', 'Samsung ARK', 'Samsung', '/images/products/monitor/f3be6199941e557b5433864e583620c9.256p.jpg', 'monitor', 75949.8, 33, NULL, '2022-11-20 19:15:09', NULL),
('2bf87014-e089-47b6-bcea-17606358a325', 'G.Skill Trident Z RGB 64 GB', 'G.Skill', '/images/products/ram/712c928dba9edee5be3380b33b612b50.256p.jpg', 'ram', 5374.75, 183, NULL, '2022-11-20 19:15:09', NULL),
('2c226346-ee6a-4f53-92df-9642206109df', 'Corsair Vengeance RGB Pro 16 GB', 'Corsair', '/images/products/ram/58ab1663c77627cbf3effd27df57aa92.256p.jpg', 'ram', 1824.5, 113, NULL, '2022-11-20 19:15:09', NULL),
('2c231c7d-6385-428f-842d-92294b45c5da', 'Razer Basilisk V3 Pro', 'Razer', '/images/products/mouse/b5ae883a17a1d332780a63f64f8df4b0.256p.jpg', 'mouse', 3999.75, 191, NULL, '2022-11-20 19:15:09', NULL),
('2c57f994-ab8b-44aa-98fa-2f1bf730add2', 'Dell S2719DGF', 'Dell', '/images/products/monitor/51ysFSsQSNL.jpg', 'monitor', 9499.75, 187, NULL, '2022-11-20 19:15:09', NULL),
('2c8da57f-2ce3-4ebc-a8d8-38646c20f629', 'EVGA FTW3 ULTRA GAMING LHR', 'EVGA', '/images/products/videocard/41VNsl3wFvS.jpg', 'video card', 25967.5, 187, NULL, '2022-11-20 19:15:09', NULL),
('2c90b498-f85a-4fdf-9874-fadc0f145bcb', 'Corsair Vengeance RGB Pro SL 32 GB', 'Corsair', '/images/products/ram/64079d85add71559122ffbd000911056.256p.jpg', 'ram', 2874.75, 72, NULL, '2022-11-20 19:15:09', NULL),
('2c97644c-b536-4cbd-9c2c-145f6d086f14', 'ASRock B550M PG RIPTIDE', 'ASRock', '/images/products/mainboard/1ff527bac6e377074a62cc55f571554b.256p.jpg', 'mainboard', 2249.75, 159, NULL, '2022-11-20 19:15:09', NULL),
('2d63a02b-909a-442d-a09b-440b884cb8f6', 'Samsung Odyssey G9 Neo S49AG952N', 'Samsung', '/images/products/monitor/c6fcac6db37eb233d14327846e128bd9.256p.jpg', 'monitor', 44975, 138, NULL, '2022-11-20 19:15:09', NULL),
('2d83a7ac-9f0c-4ea4-89c1-193a9da5638e', 'Glorious Model O', 'Glorious', '/images/products/mouse/2d8a80560eb714c71d668a6ec1bf4f96.256p.jpg', 'mouse', 1999.5, 132, NULL, '2022-11-20 19:15:09', NULL),
('2d900d23-e12c-42eb-8c1b-0cf7a7fe5475', 'AMD Ryzen 9 3900X', 'AMD', '/images/products/cpu/amd-ryzen-9-3900x.jpg', 'cpu', 8999.75, 20, NULL, '2022-11-21 01:57:07', NULL),
('2e03d7a6-a054-4ead-a0f4-e4af9e99709b', 'MSI GeForce RTX 3060 Ventus 2X 12G', 'MSI', '/images/products/videocard/dbc81b89efc82ce66fb2e3ab7e0f0658.256p.jpg', 'video card', 9234.75, 42, NULL, '2022-11-20 19:15:09', NULL),
('2e0b15d9-0806-48b0-b972-a01b2bea0f1b', 'Seagate IronWolf Pro', 'Seagate', '/images/products/storagedrive/01f719cd8e7e03916233fb39a9c5ca26.256p.jpg', 'storage drive', 3124.75, 130, '2022-12-09 02:26:25', '2022-11-21 12:00:58', '2022-12-09 02:26:25'),
('2e14db2d-0c01-4de4-9397-9ddd9e96102f', 'Acer Nitro VG240Y bmiix', 'Acer', '/images/products/monitor/51cBpEiQoML.jpg', 'monitor', 2999.75, 36, NULL, '2022-11-20 19:15:09', NULL),
('2eb82a0a-029b-4043-ba9a-c5f92621067f', 'AMD Ryzen 3 3200G', 'AMD', '/images/products/cpu/amd-ryzen-3-3200g.jpg', 'cpu', 2698.75, 43, NULL, '2022-11-21 01:57:07', NULL),
('2ecc1c1f-639b-4087-8a7c-1a84aba3edc2', 'Glorious MODEL O', 'Glorious', '/images/products/mouse/89c77ccaf0bdca3bde6bcc2d3890f6cb.256p.jpg', 'mouse', 1118.75, 79, NULL, '2022-11-20 19:15:09', NULL),
('2f990233-021d-463d-adc0-50b8e0b98d3a', 'Gigabyte B450 AORUS M', 'Gigabyte', '/images/products/mainboard/9c229eef9d9724da36a40412ab564c17.256p.jpg', 'mainboard', 5499.75, 79, NULL, '2022-11-20 19:15:09', NULL),
('2f9dde37-ab9a-4d5a-a83e-2171195f241b', 'ASRock B550 Phantom Gaming 4/ac', 'ASRock', '/images/products/mainboard/51S3r3XOy4L.jpg', 'mainboard', 3225, 163, NULL, '2022-11-20 19:15:09', NULL),
('3026dd4f-661a-4892-867e-4756369585cb', 'Gigabyte X670 AORUS ELITE AX (rev. 1.0)', 'Gigabyte', '/images/products/mainboard/ac3a77e0e11d610407a9ef39970b00d7.256p.jpg', 'mainboard', 7249.75, 176, NULL, '2022-11-20 19:15:09', NULL),
('302b687b-c846-4c4e-b8df-ffabdcbc3752', 'Samsung Odyssey G7', 'Samsung', '/images/products/monitor/c1cef36415ba8f85086b55459b9bf0aa.256p.jpg', 'monitor', 14309.5, 167, NULL, '2022-11-20 19:15:09', NULL),
('3079bace-a7ab-4f5e-9614-f882299c6d6f', 'MSI PRO Z690-A DDR4', 'MSI', '/images/products/mainboard/2fc4e6cbd108d11defb86e2298e675b8.256p.jpg', 'mainboard', 4999.75, 21, NULL, '2022-11-20 19:15:09', NULL),
('31047cb6-9d8f-49e7-8390-ea28a16c3ec3', 'Kingston KC3000', 'Kingston', '/images/products/storagedrive/31p3IUZVZL.jpg', 'storage drive', 5121.75, 51, '2022-11-21 12:07:59', '2022-11-21 12:00:58', NULL),
('31cdc51c-3dfb-43ee-a20b-4d0a8732fcb9', 'Asus DUAL', 'Asus', '/images/products/videocard/410qPWEm-L.jpg', 'video card', 6249.75, 57, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('31ea8e58-bb8e-41e6-b84a-96dd4b28e7e3', 'AMD Ryzen 7 5800X3D', 'AMD', '/images/products/cpu/amd-ryzen-7-5800x3d.jpg', 'cpu', 10055, 47, NULL, '2022-11-21 01:57:07', NULL),
('31f3a9a8-822e-4e31-ae18-027aeedfd283', 'Intel Core i5-13600K', 'Intel', '/images/products/cpu/intel-core-i5-13600k.jpg', 'cpu', 7500, 13, NULL, '2022-11-21 01:57:07', NULL),
('320813e9-087c-43f1-9edc-61a3b435ab21', 'Logitech G903 HERO', 'Logitech', '/images/products/mouse/bcef1163cebeee9d3001d5bafcf7d3d7.256p.jpg', 'mouse', 2687.5, 151, NULL, '2022-11-20 19:15:09', NULL),
('326039f1-d4ce-455c-b4aa-8629219c0aaf', 'Seagate FireCuda 520', 'Seagate', '/images/products/storagedrive/3a7b9a069c847e509654192111742930.256p.jpg', 'storage drive', 4499.75, 91, NULL, '2022-11-21 12:00:58', NULL),
('33dc5aa2-a7b0-47a2-b738-4ba19403ea55', 'SK Hynix Platinum P41', 'SK Hynix', '/images/products/storagedrive/31TAUSyRkcL.jpg', 'storage drive', 6499.75, 146, NULL, '2022-11-21 12:00:58', NULL),
('3431eca3-c856-4b6c-b049-d3eeb3906bec', 'Asus ROG ZENITH II TRX40 EXTREME ALPHA', 'Asus', '/images/products/mainboard/51Fq730c2aL.jpg', 'mainboard', 54225, 123, NULL, '2022-11-20 19:15:09', NULL),
('349c569e-8e92-4b2e-88fb-5014f6961f08', 'MSI MAG Z790 TOMAHAWK WIFI', 'MSI', '/images/products/mainboard/4776555bd90ed817bdfa00fc78ae3043.256p.jpg', 'mainboard', 7999.75, 113, NULL, '2022-11-20 19:15:09', NULL),
('34c58ab8-e354-49b6-8bec-9e3ac7e6a14a', 'AMD Ryzen 5 4500', 'AMD', '/images/products/cpu/amd-ryzen-5-4500.jpg', 'cpu', 1974.5, 188, NULL, '2022-11-21 01:57:07', NULL),
('34c63972-e2ad-4dbf-a016-6be5cd34475f', 'Alienware AW2521H', 'Alienware', '/images/products/monitor/bf54b599a671d72a70f21cd39bb1cc58.256p.jpg', 'monitor', 16249.8, 42, NULL, '2022-11-20 19:15:09', NULL),
('34e9bbe6-8e33-4c85-87d0-6e1a63f442a3', 'G.Skill Trident Z5 RGB 32 GB', 'G.Skill', '/images/products/ram/56a12aee0b658701128432341d027cb3.256p.jpg', 'ram', 6749.75, 174, NULL, '2022-11-20 19:15:09', NULL),
('37044220-5cb8-4dd0-a216-6a76dcb47782', 'Gigabyte B450M DS3H', 'Gigabyte', '/images/products/mainboard/176028811e50cad67b57ed0e604229c9.256p.jpg', 'mainboard', 1949.5, 90, NULL, '2022-11-20 19:15:09', NULL),
('3715b862-93ea-44ba-b116-dee93752dd4c', 'Crucial MX500', 'Crucial', '/images/products/storagedrive/d9cccb47a1d6da491f3c6e74ad51e80b.256p.jpg', 'storage drive', 1074.75, 51, NULL, '2022-11-21 12:00:58', NULL),
('37783c1d-2011-4658-9316-a753a73d6b1a', 'Asus TUF GAMING OC', 'Asus', '/images/products/videocard/9c8eb4b9a8bd5c79a1ee793ae814b5fd.256p.jpg', 'video card', 27570.2, 115, NULL, '2022-11-20 19:15:09', NULL),
('385684d7-26c4-403e-9402-3ff3e0025ac1', 'MSI SUPRIM LIQUID X', 'MSI', '/images/products/videocard/b53c2e7da8ed33a450a7b15ea5bd3ccd.256p.jpg', 'video card', 67372.2, 191, NULL, '2022-11-20 19:15:09', NULL),
('3967210d-574d-4283-840a-15d68ca4e8c0', 'MSI GAMING X TRIO', 'MSI', '/images/products/videocard/eb130b9910094804156c0743c5cbfe6e.256p.jpg', 'video card', 58725, 121, NULL, '2022-11-20 19:15:09', NULL),
('3979dc33-9489-46bc-89e5-755888b9d841', 'MSI MECH 2X OC', 'MSI', '/images/products/videocard/449a0be03664324be92d3b2f674c4f8a.256p.jpg', 'video card', 4274.75, 57, NULL, '2022-11-20 19:15:09', NULL),
('39885b1c-8192-453e-b75c-2b7e7923163c', 'Gigabyte B660M DS3H DDR4', 'Gigabyte', '/images/products/mainboard/9a09d966167a7cdc937d39d9bf9edc8b.256p.jpg', 'mainboard', 2749.75, 12, NULL, '2022-11-20 19:15:09', NULL),
('39a6aaef-a4c0-42e6-80c4-6e51aa47392d', 'Gigabyte B550 AORUS ELITE AX V2', 'Gigabyte', '/images/products/mainboard/001b11e828cffd833e978f7a0d9cf4d1.256p.jpg', 'mainboard', 4249.75, 30, NULL, '2022-11-20 19:15:09', NULL),
('3acd7f96-c641-4cf8-9e68-f32a30eee1de', 'Razer Lancehead Tournament Edition Mercury', 'Razer', '/images/products/mouse/41gHyYVxVwL.jpg', 'mouse', 5999.75, 171, NULL, '2022-11-20 19:15:09', NULL),
('3ad6155b-9ebe-4222-8bb3-ff9fa2fdb011', 'Intel Core i7-11700KF', 'Intel', '/images/products/cpu/intel-core-i7-11700kf.jpg', 'cpu', 7349.75, 58, NULL, '2022-11-21 01:57:07', NULL),
('3b0ff30f-927e-4b63-bcb9-58378411cf81', 'Asus TUF GAMING OC V2', 'Asus', '/images/products/videocard/41+XUf993BL.jpg', 'video card', 24.75, 111, NULL, '2022-11-20 19:15:09', NULL),
('3b5cd2a3-820f-426b-9d60-5324ae419d05', 'Acer PREDATOR X35 bmiphzx', 'Acer', '/images/products/monitor/41rKwLxBlaL.jpg', 'monitor', 62499.5, 66, NULL, '2022-11-20 19:15:09', NULL),
('3bc44b1a-a2ae-49ae-99fe-a4402f1e12bb', 'MSI MPG X570 GAMING PLUS', 'MSI', '/images/products/mainboard/92979c8799485abab31cc64ca7111ee9.256p.jpg', 'mainboard', 3674.75, 109, NULL, '2022-11-20 19:15:09', NULL),
('3cef228e-a13a-41fc-89ee-a3d99ef668b2', 'Gigabyte VISION OC Rev 2.0', 'Gigabyte', '/images/products/videocard/411nzxjTtfS.jpg', 'video card', 24.75, 5, NULL, '2022-11-20 19:15:09', NULL),
('3d04eef4-0087-4532-8747-31f758d090bd', 'Intel Core i9-12900KF', 'Intel', '/images/products/cpu/intel-core-i9-12900kf.jpg', 'cpu', 12225, 142, NULL, '2022-11-21 01:57:07', NULL),
('3d216d00-8c46-4254-b9d9-9058f67fa347', 'AOC 27G2', 'AOC', '/images/products/monitor/b7be79f3138ca4f6deaf8c68bd0a2096.256p.jpg', 'monitor', 5939.25, 57, NULL, '2022-11-20 19:15:09', NULL),
('3d7ab8ef-050e-4d0a-9c54-7de7a045213e', 'Corsair Vengeance LPX 32 GB', 'Corsair', '/images/products/ram/e79d504aff7beb267af80eb5820ca907.256p.jpg', 'ram', 2924.75, 128, NULL, '2022-11-20 19:15:09', NULL),
('3dab87df-159f-4966-a41c-57a0cf7437b7', 'Asus VA24EHE', 'Asus', '/images/products/monitor/d03df7d270d4abcce85e45c61f73ac98.256p.jpg', 'monitor', 3225, 45, NULL, '2022-11-20 19:15:09', NULL),
('3dd9b270-c52d-40a5-8713-fc4aa8d00247', 'Intel Core i7-13700KF', 'Intel', '/images/products/cpu/intel-core-i7-13700kf.jpg', 'cpu', 10535.2, 149, NULL, '2022-11-21 01:57:07', NULL),
('3e815ea2-d185-408d-9591-6b7d0ae5d7f3', 'Intel Core i9-10900KF', 'Intel', '/images/products/cpu/intel-core-i9-10900kf.jpg', 'cpu', 8499.75, 34, NULL, '2022-11-21 01:57:07', NULL),
('3eda66b8-4e68-4bd3-8e53-f47b4027b7f9', 'MSI Optix MAG274QRX', 'MSI', '/images/products/monitor/f2ce0f045bb407769c5afbc43774f30c.256p.jpg', 'monitor', 12999.8, 58, NULL, '2022-11-20 19:15:09', NULL),
('3f668424-185f-4cd4-9788-8b103f816074', 'Asus ROG STRIX X670E-I GAMING WIFI', 'Asus', '/images/products/mainboard/51Z-orLd3LL.jpg', 'mainboard', 11749.8, 163, NULL, '2022-11-20 19:15:09', NULL),
('3fe2546b-036a-43ea-a6d2-59e39778fce8', 'HP HyperX Pulsefire FPS Pro', 'HP', '/images/products/mouse/5427199f410131967602f3fc7a0b2c7a.256p.jpg', 'mouse', 624.75, 158, NULL, '2022-11-20 19:15:09', NULL),
('3ff412bd-f41f-44fa-999c-4eda68af190d', 'Gigabyte B450 AORUS ELITE V2', 'Gigabyte', '/images/products/mainboard/84c88ff577f173d87f25f0aec5ffa734.256p.jpg', 'mainboard', 2499.75, 15, NULL, '2022-11-20 19:15:09', NULL),
('4018d30b-0b79-45bc-8a9a-aa1a738fc49f', 'ASRock B550M Steel Legend', 'ASRock', '/images/products/mainboard/e45d552e13e60103e6fa9e4c89345e65.256p.jpg', 'mainboard', 5499.75, 168, NULL, '2022-11-20 19:15:09', NULL),
('4095e1d4-9b8a-4b80-9126-29d5094e5706', 'Intel Core i5-9600K', 'Intel', '/images/products/cpu/intel-core-i5-9600k.jpg', 'cpu', 5750, 32, NULL, '2022-11-21 01:57:07', NULL),
('40e70506-3bd1-4e3f-8b47-8e065d01dc85', 'Kingston FURY Beast 16 GB', 'Kingston', '/images/products/ram/f5b1674c2d725945298cd1f11d305fb7.256p.jpg', 'ram', 1499.75, 186, NULL, '2022-11-20 19:15:09', NULL),
('41505087-475e-40f8-936e-1b4fb999971e', 'Asus PRIME B660M-A WIFI D4', 'Asus', '/images/products/mainboard/51Cv4QAFllL.jpg', 'mainboard', 3749.75, 187, NULL, '2022-11-20 19:15:09', NULL),
('41b818e2-6470-42d0-a858-4ee9e8a26ca5', 'Seagate BarraCuda', 'Seagate', '/images/products/storagedrive/f2b81ef4f53b4566edfd5a5c7c60977d.256p.jpg', 'storage drive', 1599.5, 50, NULL, '2022-11-21 12:00:58', NULL),
('41c1ee34-da6e-4db7-8289-38ac19d4d3c1', 'MSI RTX 3060 Ventus 3X 12G OC', 'MSI', '/images/products/videocard/24f2250843caa631f82d234bc781e9d0.256p.jpg', 'video card', 9499.75, 2, NULL, '2022-11-20 19:15:09', NULL),
('41f8edde-621f-4a55-a773-0602e5d53358', 'Logitech G700s', 'Logitech', '/images/products/mouse/51VdAZz7I9L.jpg', 'mouse', 10500, 28, NULL, '2022-11-20 19:15:09', NULL),
('428fd785-30b5-4684-abea-d969b60dbb38', 'Intel Core i5-12500', 'Intel', '/images/products/cpu/intel-core-i5-12500.jpg', 'cpu', 5774.75, 178, NULL, '2022-11-21 01:57:07', NULL),
('42f3f4db-4ed8-4e7c-b9ec-e067325a8575', 'HP HyperX Pulsefire Haste', 'HP', '/images/products/mouse/41ZiHvROOGL.jpg', 'mouse', 749.75, 77, NULL, '2022-11-20 19:15:09', NULL),
('438d2242-2b23-4d82-abf8-b830fd1bb525', 'Intel Core i7-12700F', 'Intel', '/images/products/cpu/intel-core-i7-12700f.jpg', 'cpu', 8249.75, 167, NULL, '2022-11-21 01:57:07', NULL),
('44207321-42a4-4009-89f2-6eaed007f838', 'Intel Core i5-8600K', 'Intel', '/images/products/cpu/intel-core-i5-8600k.jpg', 'cpu', 6500, 49, NULL, '2022-11-21 01:57:07', NULL),
('4426e441-e7b5-44f7-b9eb-2c970b5cb6da', 'Asus ROG STRIX Z790-F GAMING WIFI', 'Asus', '/images/products/mainboard/c35f94251014862326456a00eabf270e.256p.jpg', 'mainboard', 10499.8, 159, NULL, '2022-11-20 19:15:09', NULL),
('4444100f-75ec-447e-81b0-e73030a3bcf0', 'Intel Core i9-13900K', 'Intel', '/images/products/cpu/intel-core-i9-13900k.jpg', 'cpu', 15625, 50, NULL, '2022-11-21 01:57:07', NULL),
('446147cc-dd9e-4e91-abaf-40de017a3163', 'Corsair DARK CORE RGB PRO', 'Corsair', '/images/products/mouse/41M52yTK5L.jpg', 'mouse', 1749.5, 112, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('4473cc87-4753-4211-b9db-0820e042f223', 'TEAMGROUP T-Create Classic 16 GB', 'TEAMGROUP', '/images/products/ram/c55feafbcea07e706822193c6d344a84.256p.jpg', 'ram', 1024.75, 84, NULL, '2022-11-20 19:15:09', NULL),
('44836a1a-2692-476c-a792-9cf447602357', 'XFX GTR XXX', 'XFX', '/images/products/videocard/7a8d66854d65f497aca573e84772d861.256p.jpg', 'video card', 3749.75, 169, NULL, '2022-11-20 19:15:09', NULL),
('449035e6-b5e2-4702-a095-73c6da6509b5', 'TEAMGROUP MP33', 'TEAMGROUP', '/images/products/storagedrive/567dfd409067c0a10aa67fc3c720c46d.256p.jpg', 'storage drive', 1583.5, 104, NULL, '2022-11-21 12:00:58', NULL),
('44cf1d64-c8d7-4fdb-b44f-6e5179ea97be', 'Intel Core i9-12900KS', 'Intel', '/images/products/cpu/intel-core-i9-12900ks.jpg', 'cpu', 14847.5, 150, NULL, '2022-11-21 01:57:07', NULL),
('45014e97-3ac7-47f9-9a2e-5231f9d228b4', 'TEAMGROUP MP33', 'TEAMGROUP', '/images/products/storagedrive/567dfd409067c0a10aa67fc3c720c46d.256p.jpg', 'storage drive', 799.75, 114, NULL, '2022-11-21 12:00:58', NULL),
('45141fb1-5ae1-4c5e-a391-7e47c0315f95', 'HP Pulsefire Core RGB', 'HP', '/images/products/mouse/7ec3d99e13b9e17b324d53e507b9b5d9.256p.jpg', 'mouse', 349.75, 15, NULL, '2022-11-20 19:15:09', NULL),
('454a9055-0135-48e8-9fdb-a7f08eab9c06', 'Asus P707 ROG SPATHA X', 'Asus', '/images/products/mouse/3b425661832992431efa165c454bd178.256p.jpg', 'mouse', 3749.75, 59, NULL, '2022-11-20 19:15:09', NULL),
('45fc8fff-64fd-4321-af10-613395082224', 'MSI A520M-A PRO', 'MSI', '/images/products/mainboard/f210cab1260cc8cd402ee007cc382029.256p.jpg', 'mainboard', 1499.75, 165, NULL, '2022-11-20 19:15:09', NULL),
('46682231-ff89-45ba-9e4b-1b094f000563', 'Asus ROG STRIX Z690-E GAMING WIFI', 'Asus', '/images/products/mainboard/415gDmtLY0L.jpg', 'mainboard', 10749.8, 60, NULL, '2022-11-20 19:15:09', NULL),
('46766d27-a320-4bd6-bbf0-942d7293a0b9', 'Samsung 870 Evo', 'Samsung', '/images/products/storagedrive/31ITAX-GoIL.jpg', 'storage drive', 2624.75, 102, NULL, '2022-11-21 12:00:58', NULL),
('4690c38d-c0e8-4fb7-b480-7a25f0195dfd', 'XFX Speedster SWFT 319', 'XFX', '/images/products/videocard/415w5OQ5haL.jpg', 'video card', 16749.8, 98, NULL, '2022-11-20 19:15:09', NULL),
('469150d2-21c7-4bae-a479-05397836661a', 'MSI MPG B550 GAMING PLUS', 'MSI', '/images/products/mainboard/2cbf78674d429ad783054d4572709dd4.256p.jpg', 'mainboard', 3999.75, 79, NULL, '2022-11-20 19:15:09', NULL),
('46c09484-ead9-4cc0-b863-aeaf2efd0989', 'Corsair Vengeance RGB Pro 32 GB', 'Corsair', '/images/products/ram/4c2ef123fb2d1ef82864c76341f83e53.256p.jpg', 'ram', 3749.75, 28, NULL, '2022-11-20 19:15:09', NULL),
('46eb5c90-42bb-4402-be3d-a0670e77aa20', 'productName22', 'AMD', 'http://localhost:3005http://localhost:3005http://localhost:3005productPhoto', 'cpu', 390625, 0, '2022-12-11 11:14:45', '2022-12-11 10:43:53', '2022-12-11 11:14:45'),
('473e1dd4-599d-4841-bb0f-da4f19310509', 'Asus ROG Strix XG27AQM', 'Asus', '/images/products/monitor/9fb82f9bdf64715826058f26a9fa0685.256p.jpg', 'monitor', 17475, 167, NULL, '2022-11-20 19:15:09', NULL),
('479a459d-c67c-4ec5-a4df-cc8e5efbda6a', 'Intel Core i9-9900K', 'Intel', '/images/products/cpu/intel-core-i9-9900k.jpg', 'cpu', 13000, 89, NULL, '2022-11-21 01:57:07', NULL),
('47f6e014-b62a-47d3-ab59-636a254a8345', 'BenQ Zowie XL2546K', 'BenQ', '/images/products/monitor/683a1e578f46379a1f3d18356601275d.256p.jpg', 'monitor', 10725, 186, NULL, '2022-11-20 19:15:09', NULL),
('482729be-93c5-40a8-b8a5-057d02bcf3b3', 'MSI VENTUS 3X OC', 'MSI', '/images/products/videocard/41oGp2NgDgS.jpg', 'video card', 15749.8, 166, NULL, '2022-11-20 19:15:09', NULL),
('486bcb32-f5be-415c-90e4-9ef9bdf6358f', 'ASRock Challenger D OC', 'ASRock', '/images/products/videocard/410gvYVbOKL.jpg', 'video card', 7249.75, 149, NULL, '2022-11-20 19:15:09', NULL),
('4886e104-2b6e-4c0f-9992-dd42f5b2fea4', 'EVGA SC ULTRA GAMING', 'EVGA', '/images/products/videocard/51qLoCBkwrL.jpg', 'video card', 6749.5, 195, NULL, '2022-11-20 19:15:09', NULL),
('4a5df5ca-f3f8-42d2-8b4b-6cc482de522d', 'Timetec 35TTFP6PCIE', 'Timetec', '/images/products/storagedrive/413qzIDzHL.jpg', 'storage drive', 0, 88, '2022-11-21 12:07:59', '2022-11-21 12:00:58', NULL),
('4a6844d2-fd23-44a6-b116-3090e2ac2ca1', 'LG 24GN650-B', 'LG', '/images/products/monitor/1ddaed6942bce9873c670d77f9bb2e60.256p.jpg', 'monitor', 5699.5, 68, NULL, '2022-11-20 19:15:09', NULL),
('4a786335-0376-4d39-8f0d-996f09ed1940', 'Asus ROG STRIX GAMING OC', 'Asus', '/images/products/videocard/2f15bdbbcac9a6fb9091729644f5f566.256p.jpg', 'video card', 18749.8, 155, NULL, '2022-11-20 19:15:09', NULL),
('4a95015a-e698-498b-8cd1-ad9bf1ea8548', 'G.Skill Ripjaws V 64 GB', 'G.Skill', '/images/products/ram/f32933ead8c97b0d50b26c83dc02ae6c.256p.jpg', 'ram', 4424.75, 29, NULL, '2022-11-20 19:15:09', NULL),
('4af4bf6b-96c0-423e-881a-fe96ad3f73a7', 'G.Skill Trident Z 32 GB', 'G.Skill', '/images/products/ram/cfb3f2908ff7e3436dfd9c962a08a68f.256p.jpg', 'ram', 25173.5, 124, NULL, '2022-11-20 19:15:09', NULL),
('4af90933-dce6-42d3-9e4e-13f0ce586110', 'Corsair Vengeance LPX 8 GB', 'Corsair', '/images/products/ram/ef1c9d46308283f227a0ba51e4179ff1.256p.jpg', 'ram', 749.75, 159, NULL, '2022-11-20 19:15:09', NULL),
('4b15e83b-bbc9-4546-be87-e6093c784bb7', 'AMD Ryzen 5 7600X', 'AMD', '/images/products/cpu/amd-ryzen-5-7600x.jpg', 'cpu', 7475, 113, NULL, '2022-11-21 01:57:07', NULL),
('4bdbd03d-a8fe-4448-8c3d-b23a612eb0ab', 'Seagate BarraCuda', 'Seagate', '/images/products/storagedrive/41wwwZwF7oL.jpg', 'storage drive', 1124.75, 110, NULL, '2022-11-21 12:00:58', NULL),
('4bfe5518-a3ac-45dc-93e6-c619ca785312', 'Silicon Power A60', 'Silicon', '/images/products/storagedrive/229130faab065e7908c58fd694f78e1a.256p.jpg', 'storage drive', 0, 148, NULL, '2022-11-21 12:00:58', NULL),
('4cadfcb6-8f02-4f8f-824c-9155488a5e1b', 'Intel Core i3-10100F', 'Intel', '/images/products/cpu/intel-core-i3-10100f.jpg', 'cpu', 2049.75, 87, NULL, '2022-11-21 01:57:07', NULL),
('4cb5e0f5-851a-4b8b-b877-811b034c55e5', 'MSI PRO X670-P WIFI', 'MSI', '/images/products/mainboard/270f20bdd07acc93f5221b539ab75a18.256p.jpg', 'mainboard', 7249.75, 158, NULL, '2022-11-20 19:15:09', NULL),
('4d5b7a78-bc96-46d9-9df9-de7665fd884f', 'MSI VENTUS 3X PLUS OC', 'MSI', '/images/products/videocard/b4c1da032bd8b99e3c828a9f2726b264.256p.jpg', 'video card', 20430.5, 58, NULL, '2022-11-20 19:15:09', NULL),
('4d7ed343-6ab7-4112-97d2-0dc707afbad0', 'Asus ROG CROSSHAIR X670E EXTREME', 'Asus', '/images/products/mainboard/879487c4a8edbf36caa7271342e4911d.256p.jpg', 'mainboard', 24999.8, 73, NULL, '2022-11-20 19:15:09', NULL),
('4e2ca544-249d-4f04-9f2c-daec99715471', 'Logitech G604 LIGHTSPEED', 'Logitech', '/images/products/mouse/e32b9e2d5144b118afe0cb32c5b83fed.256p.jpg', 'mouse', 1249.75, 53, NULL, '2022-11-20 19:15:09', NULL),
('4e88a97c-38cb-4d85-9264-d512732178cb', 'TEAMGROUP T-Force Vulcan Z 16 GB', 'TEAMGROUP', '/images/products/ram/96753a64597c28e46bf80ef7064b214b.256p.jpg', 'ram', 1174.75, 176, NULL, '2022-11-20 19:15:09', NULL),
('4f02908f-3bf7-4b8c-8ad6-db455c408445', 'Alienware AW2721D', 'Alienware', '/images/products/monitor/511pXUbce-L.jpg', 'monitor', 18099.2, 86, NULL, '2022-11-20 19:15:09', NULL),
('4f0c7492-90ec-48be-b88a-fedf0188d7b8', 'Western Digital Black SN770', 'Western Digital', '/images/products/storagedrive/310UZVOtlfL.jpg', 'storage drive', 1249.75, 152, NULL, '2022-11-21 12:00:58', NULL),
('4f0e7dda-fa14-4368-bcf2-3816a6d0ca60', 'Corsair SABRE RGB PRO WIRELESS CHAMPION SERIES', 'Corsair', '/images/products/mouse/63c4b5efa625cd67a2e4771c8cfd0f38.256p.jpg', 'mouse', 999.75, 177, NULL, '2022-11-20 19:15:09', NULL),
('4f262505-53a8-43ba-ba30-6db410352607', 'MSI PRO B660-A DDR4', 'MSI', '/images/products/mainboard/de7d51beb6dace39938b060916d3b967.256p.jpg', 'mainboard', 3499.75, 4, NULL, '2022-11-20 19:15:09', NULL),
('4f9b99b2-02b2-479a-ba96-00554a78da28', 'VIOTEK GFV22CB', 'VIOTEK', '/images/products/monitor/41pZWd-IPLL.jpg', 'monitor', 2999.75, 190, NULL, '2022-11-20 19:15:09', NULL),
('4fcd429f-7188-4bab-90b0-529163435046', 'Intel Core i3-12100F', 'Intel', '/images/products/cpu/intel-core-i3-12100f.jpg', 'cpu', 2649.5, 199, NULL, '2022-11-21 01:57:07', NULL),
('50342c90-f8e9-40f7-9632-2682dea6d240', 'Asus ROG Gladius III', 'Asus', '/images/products/mouse/d3386a7f3320b71c375d53436c318077.256p.jpg', 'mouse', 2433.25, 58, NULL, '2022-11-20 19:15:09', NULL),
('503ef631-97bd-483b-ad6d-90f5720b9e8a', 'Gigabyte G24F 2', 'Gigabyte', '/images/products/monitor/22fdcccdc4f3c5039d30914fb4acae36.256p.jpg', 'monitor', 3749.75, 185, NULL, '2022-11-20 19:15:09', NULL),
('5047de52-a049-4efa-a64f-e200e8830a7a', 'AMD Ryzen 7 3800X', 'AMD', '/images/products/cpu/amd-ryzen-7-3800x.jpg', 'cpu', 7000, 14, NULL, '2022-11-21 01:57:07', NULL),
('50769bf4-fadd-4f90-8893-a37a08a019d8', 'Zotac GAMING Trinity OC', 'Zotac', '/images/products/videocard/52c5be4a992a3075132620cb38b72b6f.256p.jpg', 'video card', 28725, 100, NULL, '2022-11-20 19:15:09', NULL),
('509dd4a6-267c-4fa4-9957-67254be20185', 'Asus ROG CROSSHAIR X670E HERO', 'Asus', '/images/products/mainboard/fc1500861d9fdb521459849de62b11d4.256p.jpg', 'mainboard', 17499.8, 163, NULL, '2022-11-20 19:15:09', NULL),
('51260211-81e4-4fa5-accb-45ae5d726909', 'G.Skill Ripjaws V 32 GB', 'G.Skill', '/images/products/ram/6bd09f5257f27371c8ebf94b3a331452.256p.jpg', 'ram', 2874.75, 163, NULL, '2022-11-20 19:15:09', NULL),
('522f467a-388e-418c-9444-030048d00c9a', 'Asus ROG STRIX B550-F GAMING', 'Asus', '/images/products/mainboard/2fab0cd72166896f8652fe39a7be1984.256p.jpg', 'mainboard', 4749.75, 190, NULL, '2022-11-20 19:15:09', NULL),
('52610dc8-bdef-4499-be89-8e2c1682e4d1', 'G.Skill Trident Z5 RGB 64 GB', 'G.Skill', '/images/products/ram/a007d2df78aaa2d26d69d7e2697863ed.256p.jpg', 'ram', 12249.8, 32, NULL, '2022-11-20 19:15:09', NULL),
('52edab51-6a2a-4154-8246-9808000386f8', 'HP W2072a (A3M50AA#ABA)', 'HP', '/images/products/monitor/31ypnQSDOKL.jpg', 'monitor', 8968.25, 8, NULL, '2022-11-20 19:15:09', NULL),
('532e29e0-f50a-4777-80a8-7eaf09868456', 'MSI MAG Z690 TOMAHAWK WIFI', 'MSI', '/images/products/mainboard/98ff551c0d220f3b6dcf9518649911d7.256p.jpg', 'mainboard', 6499.75, 182, NULL, '2022-11-20 19:15:09', NULL),
('536f3606-6856-4df1-ab2a-e0ad66f89ee8', 'Logitech B100', 'Logitech', '/images/products/mouse/31iFF1KbkpL.jpg', 'mouse', 174.75, 14, NULL, '2022-11-20 19:15:09', NULL),
('539d2c66-6af2-4481-8133-a75487c70f86', 'Seagate IronWolf Pro', 'Seagate', '/images/products/storagedrive/78896574dfc1d9ca0e1ecf95b8a0ef2a.256p.jpg', 'storage drive', 9999.75, 31, NULL, '2022-11-21 12:00:58', NULL),
('53c22bba-c229-4c5e-a083-e269aa421b42', 'Leven JS600', 'Leven', '/images/products/storagedrive/41uw1WhRe1L.jpg', 'storage drive', 274.75, 30, NULL, '2022-11-21 12:00:58', NULL),
('53d23dea-6f37-4629-998f-e362726c681f', 'Asus ROG MAXIMUS Z690 HERO', 'Asus', '/images/products/mainboard/1a155076718d51342d45b49f293ee0db.256p.jpg', 'mainboard', 14863.8, 24, NULL, '2022-11-20 19:15:09', NULL),
('53e07c73-eee5-42cf-b025-11f236e2b588', 'AMD Ryzen 7 7700X', 'AMD', '/images/products/cpu/amd-ryzen-7-7700x.jpg', 'cpu', 9974.5, 184, NULL, '2022-11-21 01:57:07', NULL),
('54357928-390f-4398-b6d0-3f39bfd39594', 'Razer Naga Chroma', 'Razer', '/images/products/mouse/41DlAggBnWL.jpg', 'mouse', 7717.25, 106, NULL, '2022-11-20 19:15:09', NULL),
('54fde688-8782-4ff6-ad1d-e0acbae508bd', 'Western Digital Black SN850X', 'Western Digital', '/images/products/storagedrive/8e6dbae8a0f3c6572216c8758ce5a0b5.256p.jpg', 'storage drive', 3374.75, 110, NULL, '2022-11-21 12:00:58', NULL),
('556f5a39-dd86-4229-a759-35a905a330b7', 'Corsair Vengeance 16 GB', 'Corsair', '/images/products/ram/I/51epHDwf7lL.jpg', 'ram', 2124.75, 110, NULL, '2022-11-20 19:15:09', NULL);
INSERT IGNORE INTO `products` (`productId`, `productName`, `productBrand`, `productPhoto`, `productType`, `price`, `inStock`, `updatedAt`, `createdAt`, `deletedAt`) VALUES
('55c01d86-c782-43a4-9597-aec446980dce', 'Razer Viper Ultimate', 'Razer', '/images/products/mouse/31PRRfutWL.jpg', 'mouse', 1662.25, 199, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('56027e5b-5d39-4baf-9848-749948f48d15', 'Logitech G502 Proteus Spectrum', 'Logitech', '/images/products/mouse/196cfc73981cd14257b11cc3b0a3b8f9.256p.jpg', 'mouse', 2117.75, 78, NULL, '2022-11-20 19:15:09', NULL),
('56078325-8804-45d6-baff-4d7b4590c8d9', 'G.Skill Ripjaws V 32 GB', 'G.Skill', '/images/products/ram/6bd09f5257f27371c8ebf94b3a331452.256p.jpg', 'ram', 2349.75, 45, NULL, '2022-11-20 19:15:09', NULL),
('563f9f0d-cb92-4517-bb30-95d773fede86', 'Samsung 980 Pro', 'Samsung', '/images/products/storagedrive/4e02c24a00f7b79a56489db2acbe3a9b.256p.jpg', 'storage drive', 2999.75, 52, NULL, '2022-11-21 12:00:58', NULL),
('565783e7-b283-4a10-8b8a-29a92efb6698', 'Razer DeathAdder Elite', 'Razer', '/images/products/mouse/21lybIj1gS.jpg', 'mouse', 1174.75, 70, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('56932230-e50c-4eaa-969e-7d609327c709', 'Samsung 870 QVO', 'Samsung', '/images/products/storagedrive/29b838814626cac9b060a2d2c0a293cd.256p.jpg', 'storage drive', 17225, 172, NULL, '2022-11-21 12:00:58', NULL),
('56e7d467-a9ee-4f72-9af8-42f19786965f', 'Crucial P3', 'Crucial', '/images/products/storagedrive/8c5042086b6c6ab10aca89e29fa85f08.256p.jpg', 'storage drive', 1849.5, 111, NULL, '2022-11-21 12:00:58', NULL),
('572e5a50-91d8-4d67-b8c3-d690a9ecd441', 'Redragon M602', 'Redragon', '/images/products/mouse/31XikWYoSL.jpg', 'mouse', 424.5, 44, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('578b53d5-809a-4843-a2ea-f45584cd2b89', 'LG 27GL850-B', 'LG', '/images/products/monitor/f98e80f9443319f14b548ee54f378b29.256p.jpg', 'monitor', 7599.75, 184, NULL, '2022-11-20 19:15:09', NULL),
('579cab9c-9f27-444b-9048-d629ac650c0e', 'Asus TUF-RX6800XT-O16G-GAMING', 'Asus', '/images/products/videocard/41woaeVamiL.jpg', 'video card', 18044, 164, NULL, '2022-11-20 19:15:09', NULL),
('58103d90-aec3-4342-81e8-f9064a87ce16', 'MSI GAMING X TRIO', 'MSI', '/images/products/videocard/41nHFEB9RS.jpg', 'video card', 16499.8, 108, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('581b323d-21a2-48d5-9e8c-9779d352356b', 'PowerColor Red Devil', 'PowerColor', '/images/products/videocard/974e6463233d79f449bc6a8d1723859b.256p.jpg', 'video card', 3999.5, 29, NULL, '2022-11-20 19:15:09', NULL),
('582e6852-67f4-4582-80bf-5425b6b3dc9f', 'Corsair M65 RGB ELITE', 'Corsair', '/images/products/mouse/5b398a22dedb28c16624f46920fd0c4f.256p.jpg', 'mouse', 1499.75, 122, NULL, '2022-11-20 19:15:09', NULL),
('592d10e8-0a24-4836-9740-3e4fbc319a57', 'Glorious MODEL D', 'Glorious', '/images/products/mouse/e53580d579186aabe0bad312bfeae3ee.256p.jpg', 'mouse', 1118.75, 163, NULL, '2022-11-20 19:15:09', NULL),
('5aa389bf-99b5-4e8d-a2ec-2d8208de4e73', 'MSI GAMING Z TRIO', 'MSI', '/images/products/videocard/4f67f00317c3a99472873954441e9811.256p.jpg', 'video card', 12999.8, 100, NULL, '2022-11-20 19:15:09', NULL),
('5b27c88e-d11b-48d7-ac00-53aeb1312bde', 'Corsair Vengeance RGB 32 GB', 'Corsair', '/images/products/ram/b2d107d629e656f9f435ce9bd604f7e0.256p.jpg', 'ram', 3949.75, 124, NULL, '2022-11-20 19:15:09', NULL),
('5be4cbac-d756-40df-8b79-f9f6af03cb0b', 'Corsair Vengeance 32 GB', 'Corsair', '/images/products/ram/I/41jJSPS8W7L.jpg', 'ram', 4074.75, 193, NULL, '2022-11-20 19:15:09', NULL),
('5c801214-40d0-419e-b2bf-eae430bdf8c8', 'Razer Viper Ultimate w/Dock', 'Razer', '/images/products/mouse/ae9b1b9c8d6363d03e17b77e51343e45.256p.jpg', 'mouse', 1999.5, 67, NULL, '2022-11-20 19:15:09', NULL),
('5cac8f8f-6e6d-4fe1-8488-06891c2cb615', 'MSI MAG B550 TOMAHAWK', 'MSI', '/images/products/mainboard/52ee465cbd64b16145232d863524c066.256p.jpg', 'mainboard', 4249.75, 5, NULL, '2022-11-20 19:15:09', NULL),
('5d5eb544-2ebb-4025-a6e5-3d344da41a57', 'Logitech G403 HERO', 'Logitech', '/images/products/mouse/1e8c3800a012015b0400211b5d370aa0.256p.jpg', 'mouse', 1115.5, 62, NULL, '2022-11-20 19:15:09', NULL),
('5dbf27a3-4e1a-4cc9-a53e-e6ff19c0f636', 'AMD Ryzen 7 5700X', 'AMD', '/images/products/cpu/amd-ryzen-7-5700x.jpg', 'cpu', 5676.25, 94, NULL, '2022-11-21 01:57:07', NULL),
('5dc87a0f-4da6-4295-8b4e-736662a63766', 'Gigabyte GAMING OC Rev 2.0', 'Gigabyte', '/images/products/videocard/41F4TEZ9vVL.jpg', 'video card', 10999.8, 73, NULL, '2022-11-20 19:15:09', NULL),
('5ef196b0-4492-4d94-ac4b-9a673f9b071c', 'Zotac GAMING Trinity OC', 'Zotac', '/images/products/videocard/3f6bd83e7cd8646ff0b5bcda5373b4d0.256p.jpg', 'video card', 53749.5, 161, NULL, '2022-11-20 19:15:09', NULL),
('5f4dc91d-55e9-41f7-82b5-3cff03a4f007', 'Samsung 990 Pro', 'Samsung', '/images/products/storagedrive/31LCbsmH4DL.jpg', 'storage drive', 7249.75, 152, NULL, '2022-11-21 12:00:58', NULL),
('602399c6-7e4a-4753-8838-a553a2e60039', 'Logitech G903', 'Logitech', '/images/products/mouse/41hj-bvIpbL.jpg', 'mouse', 2499.75, 81, NULL, '2022-11-20 19:15:09', NULL),
('6051ee7a-1514-44e9-a949-cc4f94187878', 'Corsair Vengeance LPX 16 GB', 'Corsair', '/images/products/ram/835ab3efad1be13bbe53beef3e3c6f96.256p.jpg', 'ram', 1499.75, 175, NULL, '2022-11-20 19:15:09', NULL),
('60736668-7931-4417-9bb2-ca2fb1582d9b', 'SteelSeries Rival 600', 'SteelSeries', '/images/products/mouse/41-F2flhq6L.jpg', 'mouse', 1497.25, 51, NULL, '2022-11-20 19:15:09', NULL),
('616511ce-0d95-423c-8aea-2585d289892c', 'Intel Core i5-12600', 'Intel', '/images/products/cpu/intel-core-i5-12600.jpg', 'cpu', 6249.75, 69, NULL, '2022-11-21 01:57:07', NULL),
('61a9dc62-95cb-4b68-acd3-04d8cfba204d', 'productName22', 'AMD', 'http://localhost:3005http://localhost:3005http://localhost:3005http://localhost:3005http://localhost:3005productPhoto', 'cpu', 15608, 0, '2022-12-11 11:14:47', '2022-12-11 10:28:22', '2022-12-11 11:14:47'),
('61e04c0d-19e5-49f9-8379-0875910bae26', 'Asus ROG Swift PG259QNR', 'Asus', '/images/products/monitor/fa4f4f04d36f073eb374fb6755bb806d.256p.jpg', 'monitor', 9975, 78, NULL, '2022-11-20 19:15:09', NULL),
('6206c84c-9794-4a4e-b5f9-8e85994ee398', 'Kingston FURY Renegade 32 GB', 'Kingston', '/images/products/ram/f1f362cf33c42ffd37b1458c2b86a4e5.256p.jpg', 'ram', 3091.25, 131, NULL, '2022-11-20 19:15:09', NULL),
('620c9737-a633-4d31-99b9-bc6c6b0b6dff', 'Samsung LC27G55TQWNXZA', 'Samsung', '/images/products/monitor/70d2b0098d35d1f6d27f98b67ab5cfdb.256p.jpg', 'monitor', 4799.75, 147, NULL, '2022-11-20 19:15:09', NULL),
('620dd431-da21-44d4-b6ad-952be33adfc2', 'Zotac GAMING OC', 'Zotac', '/images/products/videocard/fca8f9fe51d6006b0ae3fe886cf91bfb.256p.jpg', 'video card', 3999.75, 163, NULL, '2022-11-20 19:15:09', NULL),
('621570b1-789c-42a0-962a-e609c276c3f2', 'Seagate FireCuda 530', 'Seagate', '/images/products/storagedrive/a82a914921d63165f8a7b096089ff91f.256p.jpg', 'storage drive', 5999.75, 125, NULL, '2022-11-21 12:00:58', NULL),
('621b499f-55a9-4da8-940d-49853f04298d', 'Gigabyte B550 GAMING X V2', 'Gigabyte', '/images/products/mainboard/09d3314474cf5fefa2bd5c5941bb33b5.256p.jpg', 'mainboard', 3249.75, 121, NULL, '2022-11-20 19:15:09', NULL),
('62275c40-a4b0-4295-8883-08dc2516b715', 'Logitech G203 Lightsync', 'Logitech', '/images/products/mouse/dbe9bbba752e18178e12f24bbe6ed196.256p.jpg', 'mouse', 674.75, 4, NULL, '2022-11-20 19:15:09', NULL),
('6281033f-d3ac-44ae-8700-a599b246535d', 'Samsung 980 Pro w/Heatsink', 'Samsung', '/images/products/storagedrive/31ohGkrwpEL.jpg', 'storage drive', 5499.75, 167, NULL, '2022-11-21 12:00:58', NULL),
('62a6413a-0841-4e0e-9aba-0022f9f8c67f', 'Gigabyte M32U', 'Gigabyte', '/images/products/monitor/e9fea66d4297ba3fa06f45cfeea632c6.256p.jpg', 'monitor', 18249.8, 1, NULL, '2022-11-20 19:15:09', NULL),
('64b16e95-a641-4613-b7d9-efd9e4b0657f', 'TEAMGROUP QX', 'TEAMGROUP', '/images/products/storagedrive/6b09323ae812fa126c4d87c6899be7ed.256p.jpg', 'storage drive', 71999.8, 123, NULL, '2022-11-21 12:00:58', NULL),
('64ed2dfb-809a-4eaa-b6e3-a9d5e0df0661', 'LG 32GP850-B', 'LG', '/images/products/monitor/a66c01cfe374a7fca12279f81882004a.256p.jpg', 'monitor', 10499.8, 188, NULL, '2022-11-20 19:15:09', NULL),
('656159ea-aaef-458f-ac36-22bc00f86c76', 'Razer Basilisk V3', 'Razer', '/images/products/mouse/d662cc7b90e3fd45502f7c77d9b54269.256p.jpg', 'mouse', 1599.75, 18, NULL, '2022-11-20 19:15:09', NULL),
('6577f2fd-9aff-432e-9373-a9ed92d7dd5b', 'Razer Basilisk Ultimate', 'Razer', '/images/products/mouse/61eb5935b25d0e35424629b707f22c03.256p.jpg', 'mouse', 2499.75, 112, NULL, '2022-11-20 19:15:09', NULL),
('65bb082e-9793-4162-a9d9-8c0dc720f4fc', 'Intel Core i9-10900K', 'Intel', '/images/products/cpu/intel-core-i9-10900k.jpg', 'cpu', 8674.75, 175, NULL, '2022-11-21 01:57:07', NULL),
('65e141bd-e72c-4bf1-8ea2-91608f59687b', 'LG 27GN750-B', 'LG', '/images/products/monitor/51HJWYChCfL.jpg', 'monitor', 5913.75, 24, NULL, '2022-11-20 19:15:09', NULL),
('65f82329-c7ff-4dac-bcb6-2d95b67ce209', 'SteelSeries Rival 5', 'SteelSeries', '/images/products/mouse/6d35eedc32891db22347dce86786474e.256p.jpg', 'mouse', 971.25, 60, NULL, '2022-11-20 19:15:09', NULL),
('66e1a0e1-33c6-4777-aeb0-997a0ee6c05c', 'Intel Core i7-11700K', 'Intel', '/images/products/cpu/intel-core-i7-11700k.jpg', 'cpu', 7250, 184, NULL, '2022-11-21 01:57:07', NULL),
('67433207-7711-4117-aad1-8cd0f8729e90', 'Logitech G Pro Wireless', 'Logitech', '/images/products/mouse/800bb5629053de7c02501a11b4e0f87d.256p.jpg', 'mouse', 2299.75, 24, NULL, '2022-11-20 19:15:09', NULL),
('67904025-9fec-4f9d-a234-dd2b769ad373', 'G.Skill Trident Z RGB 32 GB', 'G.Skill', '/images/products/ram/00963d6b0a92c53e1e3c5c6de47d238f.256p.jpg', 'ram', 2749.75, 110, NULL, '2022-11-20 19:15:09', NULL),
('68e89988-f8e4-4ca5-ac76-b62dca649240', 'Logitech G402', 'Logitech', '/images/products/mouse/41sMQGodbiL.jpg', 'mouse', 874.75, 173, NULL, '2022-11-20 19:15:09', NULL),
('6906a012-d203-4fc2-9080-fd03397b1952', 'Gigabyte GAMING OC Rev 2.0', 'Gigabyte', '/images/products/videocard/41TxodjkO1S.jpg', 'video card', 13499.8, 48, NULL, '2022-11-20 19:15:09', NULL),
('6965b6af-cabc-44c6-8642-6f00d72d10e0', 'AOC CU34G2X/BK', 'AOC', '/images/products/monitor/5be6fdd27129bbfd49b2ea66187482ba.256p.jpg', 'monitor', 8749.75, 21, NULL, '2022-11-20 19:15:09', NULL),
('6a3e9798-c26c-459f-81cb-fd354d7f5e17', 'Cooler Master MM711 Matte White', 'Cooler Master', '/images/products/mouse/29e700d66dec0bef323bcb2ea6ddf7b9.256p.jpg', 'mouse', 475, 97, NULL, '2022-11-20 19:15:09', NULL),
('6ae2378a-9a02-451d-8855-124a14a9bb65', 'AMD Ryzen 5 2600X', 'AMD', '/images/products/cpu/amd-ryzen-5-2600x.jpg', 'cpu', 5475, 125, NULL, '2022-11-21 01:57:07', NULL),
('6b2c8ae8-886e-418b-9d9b-87822d114e1a', 'Samsung 980 Pro', 'Samsung', '/images/products/storagedrive/0031b30a7f5958ebe231983fb79d17ec.256p.jpg', 'storage drive', 1999.75, 126, NULL, '2022-11-21 12:00:58', NULL),
('6bb7d3e6-6e69-4c21-a8e5-7e65b703fa5f', 'Corsair Dominator Platinum RGB 32 GB', 'Corsair', '/images/products/ram/023366f70010c6db4a5c31a487441ef1.256p.jpg', 'ram', 5699.75, 77, NULL, '2022-11-20 19:15:09', NULL),
('6bfbb964-404e-4dee-9664-ec9f55109392', 'Silicon Power XPOWER Turbine 16 GB', 'Silicon', '/images/products/ram/3480c4aef651ddb7b25bd3ac1cab1d31.256p.jpg', 'ram', 1024.25, 133, NULL, '2022-11-20 19:15:09', NULL),
('6cb6e916-de2a-4bad-be81-189f9248adc7', 'Asus PRIME A320M-K', 'Asus', '/images/products/mainboard/615QF0Z2wNL.jpg', 'mainboard', 1624.5, 144, NULL, '2022-11-20 19:15:09', NULL),
('6ccf8e8b-0974-490f-b128-6bafb422c849', 'LG 24GL600F-B', 'LG', '/images/products/monitor/685498d2707cb81573df37f3e403692b.256p.jpg', 'monitor', 3249.75, 114, NULL, '2022-11-20 19:15:09', NULL),
('6d0858e3-2017-4370-990d-01bcbbe13286', 'MSI Optix G24C4', 'MSI', '/images/products/monitor/90fe1ab915692448773babbed2c62d73.256p.jpg', 'monitor', 3999.75, 117, NULL, '2022-11-20 19:15:09', NULL),
('6d259005-8921-4d1e-a61c-b587f17838a5', 'Asus DUAL EVO OC', 'Asus', '/images/products/videocard/51FcVHzQHZL.jpg', 'video card', 6999.75, 127, NULL, '2022-11-20 19:15:09', NULL),
('6d448914-3b0d-4d1e-8158-0a8d50225d70', 'MSI RX 6600 XT MECH 2X 8G OC', 'MSI', '/images/products/videocard/de7225d83465d909752ae5f50e9d3d36.256p.jpg', 'video card', 6999.75, 20, NULL, '2022-11-20 19:15:09', NULL),
('6d73d084-870d-4ae7-9751-2ac85f7040db', 'AMD Ryzen 7 5700G', 'AMD', '/images/products/cpu/amd-ryzen-7-5700g.jpg', 'cpu', 4657.5, 168, NULL, '2022-11-21 01:57:07', NULL),
('6dd5a329-937c-4e26-9c7d-d6f983658e15', 'Logitech M90', 'Logitech', '/images/products/mouse/3942bf430d7f5b33bd01e2b0d0b7abdb.256p.jpg', 'mouse', 222.75, 91, NULL, '2022-11-20 19:15:09', NULL),
('6f63334b-70bc-4639-8d07-0f25ef393a28', 'Logitech G502 HERO', 'Logitech', '/images/products/mouse/125c1da538a8704be799ef12a506e177.256p.jpg', 'mouse', 980.75, 140, NULL, '2022-11-20 19:15:09', NULL),
('6f8aeb3d-7e01-4b77-a15a-798509b6a8d8', 'G.Skill Trident Z5 RGB 32 GB', 'G.Skill', '/images/products/ram/f937c5d274c9fdfd4e5881a1a976e96f.256p.jpg', 'ram', 4749.75, 143, NULL, '2022-11-20 19:15:09', NULL),
('6fb28465-067a-42c3-9541-87690a266ef6', 'AMD Ryzen 9 5950X', 'AMD', '/images/products/cpu/amd-ryzen-9-5950x.jpg', 'cpu', 13725, 55, NULL, '2022-11-21 01:57:07', NULL),
('6fe6e02b-c3e3-4659-86eb-c85de994b3a0', 'ASRock B660M-ITX/ac', 'ASRock', '/images/products/mainboard/f799abb73653b256f1bebb87d30f9468.256p.jpg', 'mainboard', 2999.75, 85, NULL, '2022-11-20 19:15:09', NULL),
('6fe80798-59ea-468e-b4b8-eeb83195f916', 'Western Digital Black SN850X', 'Western Digital', '/images/products/storagedrive/8e6dbae8a0f3c6572216c8758ce5a0b5.256p.jpg', 'storage drive', 5749.75, 1, NULL, '2022-11-21 12:00:58', NULL),
('6fee5ea6-e451-4bc0-aec5-34c8d17c93b9', 'Asus ROG STRIX X670E-E GAMING WIFI', 'Asus', '/images/products/mainboard/41sPRYUbwL.jpg', 'mainboard', 12499.8, 50, NULL, '2022-11-20 19:15:09', NULL),
('701535f1-db1a-4be9-aac1-a5c93a8372ae', 'Gigabyte EAGLE', 'Gigabyte', '/images/products/videocard/860fe8b0ef5553c115f06b70ee9d037f.256p.jpg', 'video card', 10499.8, 185, NULL, '2022-11-20 19:15:09', NULL),
('70583094-79e6-4dca-a5fc-e09cac87f394', 'SteelSeries Rival 3', 'SteelSeries', '/images/products/mouse/178a8d67052dc8ac01b07c8b84924a0b.256p.jpg', 'mouse', 1059.75, 32, NULL, '2022-11-20 19:15:09', NULL),
('70e58565-a189-43f6-b012-a33c1a84d085', 'MSI Optix G272', 'MSI', '/images/products/monitor/0300348bdc25585dc0eef1a146db9361.256p.jpg', 'monitor', 5454.5, 44, NULL, '2022-11-20 19:15:09', NULL),
('716b6b84-91d3-4d24-9b38-8a3c47b202c8', 'Crucial MX500', 'Crucial', '/images/products/storagedrive/2983fbcd487b315b31855399829b532c.256p.jpg', 'storage drive', 2124.75, 104, NULL, '2022-11-21 12:00:58', NULL),
('71b7d646-6954-4095-a10f-8530a19613f9', 'Intel Core i5-12600K', 'Intel', '/images/products/cpu/intel-core-i5-12600k.jpg', 'cpu', 6999.5, 112, NULL, '2022-11-21 01:57:07', NULL),
('71d03b06-760e-4f96-82a7-42d738615434', 'AMD Threadripper 3970X', 'AMD', '/images/products/cpu/amd-threadripper-3970x.jpg', 'cpu', 86250, 78, NULL, '2022-11-21 01:57:07', NULL),
('72345b34-e311-4e2e-84b0-6f9ef978aa18', 'Asus ROG STRIX Z590-E GAMING WIFI', 'Asus', '/images/products/mainboard/c75b75e88a785bd88aed00e0e6b9822a.256p.jpg', 'mainboard', 5749.75, 157, NULL, '2022-11-20 19:15:09', NULL),
('723e114d-ebc4-412f-a5f7-2e79116b840b', 'Asus PRIME Z690-P WIFI D4', 'Asus', '/images/products/mainboard/c8d3a6bdd5dca14503c17ec89c305da8.256p.jpg', 'mainboard', 5499.75, 67, NULL, '2022-11-20 19:15:09', NULL),
('7388a062-ec8c-4165-9e73-f73f64c09a7e', 'Corsair Vengeance RGB Pro 32 GB', 'Corsair', '/images/products/ram/I/410IZHt25eL.jpg', 'ram', 2874.75, 7, NULL, '2022-11-20 19:15:09', NULL),
('73d4a0d8-f837-43e3-86d7-d3a6952d0706', 'Corsair DARK CORE RGB PRO SE', 'Corsair', '/images/products/mouse/fbeb5a62840993fa50c1836186087dfc.256p.jpg', 'mouse', 2374.75, 96, NULL, '2022-11-20 19:15:09', NULL),
('755142cd-9adf-4b3a-8893-e0c66d47a93f', 'Asus ROG STRIX B660-I GAMING WIFI', 'Asus', '/images/products/mainboard/058251891239458bb3791fd3d3d36876.256p.jpg', 'mainboard', 4999.75, 167, NULL, '2022-11-20 19:15:09', NULL),
('7561c4be-0afb-474d-a76d-19cec0f42cd3', 'Intel Core i7-7700', 'Intel', '/images/products/cpu/intel-core-i7-7700.jpg', 'cpu', 7125, 81, NULL, '2022-11-21 01:57:07', NULL),
('756b03cf-9199-42bc-80e6-0b369c05ba0d', 'Western Digital Blue', 'Western Digital', '/images/products/storagedrive/a3b09866e3716566572bf9a13792cc85.256p.jpg', 'storage drive', 2205.75, 3, NULL, '2022-11-21 12:00:58', NULL),
('7681e794-f3de-49fb-a826-5fb48420e25d', 'MSI VENTUS 2X OC', 'MSI', '/images/products/videocard/51vR8AmgpbL.jpg', 'video card', 6999.75, 31, NULL, '2022-11-20 19:15:09', NULL),
('76f627ff-9888-4900-80e2-9bf3a0592bc5', 'Corsair Vengeance LPX 32 GB', 'Corsair', '/images/products/ram/3e57f6f6fea599e8e36488d325102044.256p.jpg', 'ram', 2874.75, 179, NULL, '2022-11-20 19:15:09', NULL),
('7731a596-ae45-4b78-bae2-cb82e729613f', 'Kingston NV2', 'Kingston', '/images/products/storagedrive/b95d0c7234714c4d7bb0f246c23cd3b9.256p.jpg', 'storage drive', 1049.5, 191, NULL, '2022-11-21 12:00:58', NULL),
('782b6c3f-2169-40b9-b2a4-2f2437cc798c', 'AMD Ryzen 7 2700', 'AMD', '/images/products/cpu/amd-ryzen-7-2700.jpg', 'cpu', 6500, 188, NULL, '2022-11-21 01:57:07', NULL),
('78ded9da-bc42-4925-aa08-c851e84337d9', 'Kingston KC3000', 'Kingston', '/images/products/storagedrive/31p3IUZVZL.jpg', 'storage drive', 2324.75, 50, '2022-11-21 12:07:59', '2022-11-21 12:00:58', NULL),
('78f64054-21e9-4867-8a57-c573a5d86a30', 'AOC 24G2', 'AOC', '/images/products/monitor/417KWxwTikL.jpg', 'monitor', 6212.25, 156, NULL, '2022-11-20 19:15:09', NULL),
('79b67945-c45d-4438-8c31-49ac58482697', 'Crucial P5 Plus', 'Crucial', '/images/products/storagedrive/43c2b68eaed9cd66fa6d7d71ee8e2756.256p.jpg', 'storage drive', 4999.75, 88, NULL, '2022-11-21 12:00:58', NULL),
('79d6439b-f737-4bfe-8b3d-b4a1d74c4bc7', 'Corsair M65 RGB ELITE', 'Corsair', '/images/products/mouse/3ece5106e64716cae7c9023a8bdf8d59.256p.jpg', 'mouse', 999.75, 114, NULL, '2022-11-20 19:15:09', NULL),
('7a400f43-4082-45f4-8fb2-a5a6b1379333', 'productName2', 'AMD', 'http://localhost:3005productPhoto', 'cpu', 625000000, 0, '2022-12-11 11:14:49', '2022-12-11 10:24:51', '2022-12-11 11:14:49'),
('7a944983-3410-4fdf-978e-073e95184e79', 'Sceptre C305B-200UN', 'Sceptre', '/images/products/monitor/41yIB1YHtSL.jpg', 'monitor', 5499.5, 112, NULL, '2022-11-20 19:15:09', NULL),
('7adfc74a-afc9-4cb6-94c8-da33a6f04755', 'Gigabyte B550M AORUS PRO-P', 'Gigabyte', '/images/products/mainboard/b22b15a301bbfba8670a17c926e8669f.256p.jpg', 'mainboard', 4749.75, 22, NULL, '2022-11-20 19:15:09', NULL),
('7afd723b-ccdc-4fce-9ccc-594d7e709809', 'SteelSeries Aerox 9', 'SteelSeries', '/images/products/mouse/b19f57b195a5e41b53e03b3717f4cd08.256p.jpg', 'mouse', 2736.75, 102, NULL, '2022-11-20 19:15:09', NULL),
('7b2d997b-7b36-4606-839f-2972a741285d', 'MSI GeForce RTX 3060 Ti GAMING X', 'MSI', '/images/products/videocard/fdebde50e80ae3a2912f7e5dd6ff7622.256p.jpg', 'video card', 24.75, 6, NULL, '2022-11-20 19:15:09', NULL),
('7b8c4e44-3604-4d8a-bd06-819a1eae8edc', 'Corsair Vengeance LPX 32 GB', 'Corsair', '/images/products/ram/65301be7e92d010b934e9e256356d986.256p.jpg', 'ram', 3124.75, 168, NULL, '2022-11-20 19:15:09', NULL),
('7b9e5cc0-d1d1-4d33-ace7-3add9555dfda', 'Glorious MODEL D', 'Glorious', '/images/products/mouse/67068c12e8020ae7c28be8e9202ad900.256p.jpg', 'mouse', 1118.75, 93, NULL, '2022-11-20 19:15:09', NULL),
('7bad8bce-6a26-4423-853b-7704d07da7e2', 'HP D2W67AA#ABA', 'HP', '/images/products/monitor/31LnRiHuEyL.jpg', 'monitor', 6225, 12, NULL, '2022-11-20 19:15:09', NULL),
('7bfc130d-befc-4a8c-a3ec-770465a1dc44', 'MSI PRO Z690-A', 'MSI', '/images/products/mainboard/b5a26e85c9dd9054f055da70b8ae00cc.256p.jpg', 'mainboard', 4749.75, 169, NULL, '2022-11-20 19:15:09', NULL),
('7c4ab81b-7860-4e79-80f0-7a66eb586128', 'Razer Basilisk V2', 'Razer', '/images/products/mouse/1841b82340846f04a4fac12d496ca7a7.256p.jpg', 'mouse', 874.75, 72, NULL, '2022-11-20 19:15:09', NULL),
('7c92c9f3-72ae-4bd8-9942-a9e5236c6633', 'Intel Core i7-11700F', 'Intel', '/images/products/cpu/intel-core-i7-11700f.jpg', 'cpu', 6899.75, 24, NULL, '2022-11-21 01:57:07', NULL),
('7cb033ac-0abe-4731-918f-6aa044c4d4eb', 'Asus TUF GAMING OC', 'Asus', '/images/products/videocard/7e2aecad10e5dcbe518f82a9e8dc64c3.256p.jpg', 'video card', 63723.5, 134, NULL, '2022-11-20 19:15:09', NULL),
('7cb21bbf-42b5-4f7a-a675-0bebd4d9b41c', 'TEAMGROUP T-Force Delta RGB 32 GB', 'TEAMGROUP', '/images/products/ram/d2e3f9b94f541ad51a19011026245df2.256p.jpg', 'ram', 9749.75, 24, NULL, '2022-11-20 19:15:09', NULL),
('7d66f14d-6e49-4a14-aba7-877b564c0b7e', 'Asus ROG Swift PG259QN', 'Asus', '/images/products/monitor/ae364dfe79d4c077bc72a661b48293c3.256p.jpg', 'monitor', 10679.2, 149, NULL, '2022-11-20 19:15:09', NULL),
('7d7fea7f-c654-4ba6-8260-25935c019b2a', 'G.Skill Flare X5 32 GB', 'G.Skill', '/images/products/ram/5bfb04d855b1e501d71ef7516d5c39f7.256p.jpg', 'ram', 3874.75, 38, NULL, '2022-11-20 19:15:09', NULL),
('7e475236-13fb-42cd-8b5c-28ddc062a469', 'Corsair Vengeance RGB 32 GB', 'Corsair', '/images/products/ram/ebca1cc55cb7829ce3ed0b8a13efce7e.256p.jpg', 'ram', 4199.75, 154, NULL, '2022-11-20 19:15:09', NULL),
('7e818558-1e87-4d15-a403-a478a606ec90', 'AMD Ryzen 9 5900X', 'AMD', '/images/products/cpu/amd-ryzen-9-5900x.jpg', 'cpu', 8597.5, 162, NULL, '2022-11-21 01:57:07', NULL),
('7f23b4bb-4e00-46a3-9f52-daa77d2d832f', 'MSI MAG Z690 TOMAHAWK WIFI DDR4', 'MSI', '/images/products/mainboard/d215dc7bf5e833dc31c320292afca224.256p.jpg', 'mainboard', 6499.75, 192, NULL, '2022-11-20 19:15:09', NULL),
('7f278505-c8e3-4291-ad86-cc30282a03fa', 'EVGA SC ULTRA GAMING', 'EVGA', '/images/products/videocard/51qLoCBkwrL.jpg', 'video card', 5748.75, 101, NULL, '2022-11-20 19:15:09', NULL),
('7fc17372-ae8a-4c83-97ff-74c7954742bc', 'Samsung Odyssey G9', 'Samsung', '/images/products/monitor/1c3449001f4d13277a4b39a59ddf68f7.256p.jpg', 'monitor', 27499.8, 109, NULL, '2022-11-20 19:15:09', NULL),
('80759eaa-92c5-4847-85d8-b02008fb885b', 'ViewSonic VX2768-2KP-MHD OMNI', 'ViewSonic', '/images/products/monitor/3caf0aedfab490469dfe6131d6a27f81.256p.jpg', 'monitor', 5335.75, 43, NULL, '2022-11-20 19:15:09', NULL),
('8237511b-393a-4903-9f81-72f0ceecc6f6', 'Seagate Barracuda Compute', 'Seagate', '/images/products/storagedrive/41V7Idv87eL.jpg', 'storage drive', 0, 104, NULL, '2022-11-21 12:00:58', NULL),
('825754ae-9c00-4aac-ba07-f8ff558c6962', 'Trust GXT 155', 'Trust', '/images/products/mouse/8406b72cd9f0cb137d336161e32d97a3.256p.jpg', 'mouse', 0, 14, NULL, '2022-11-20 19:15:09', NULL),
('82b48d86-2785-44d8-ab37-df1b175f93b7', 'FinalMouse Air58 Ninja', 'FinalMouse', '/images/products/mouse/41DpZd6MjrL.jpg', 'mouse', 16999.8, 170, NULL, '2022-11-20 19:15:09', NULL),
('82f495be-7a2b-41fc-b173-61527e62abab', 'Gigabyte GAMING OC', 'Gigabyte', '/images/products/videocard/a2b379f45c9a469f67e9d1118193a4ca.256p.jpg', 'video card', 59975, 23, NULL, '2022-11-20 19:15:09', NULL),
('8306c31b-184c-449d-942f-70c0c5820118', 'Logitech MX Master', 'Logitech', '/images/products/mouse/31wDFiIu6iL.jpg', 'mouse', 0, 164, NULL, '2022-11-20 19:15:09', NULL),
('839da75e-e8ea-4829-bc86-9e7a5121df78', 'Asus ROG STRIX X570-E GAMING WIFI II', 'Asus', '/images/products/mainboard/76fc8bab81e216b0d4a2bcf9a157a0ab.256p.jpg', 'mainboard', 8249.75, 163, NULL, '2022-11-20 19:15:09', NULL),
('8422ee70-57f1-4968-baf7-53f4d64de2c5', 'Corsair Vengeance LPX 16 GB', 'Corsair', '/images/products/ram/a462328473351f9140c87f8c1d115ffe.256p.jpg', 'ram', 1424.75, 3, NULL, '2022-11-20 19:15:09', NULL),
('844a9976-b690-4811-8ea6-7c240829abd5', 'AOC G2490VX', 'AOC', '/images/products/monitor/31Q8GoryP8L.jpg', 'monitor', 3999.75, 190, NULL, '2022-11-20 19:15:09', NULL),
('84520ddb-ab90-4f37-bc6d-6b6f40c61dab', 'AMD Ryzen 3 2200G', 'AMD', '/images/products/cpu/amd-ryzen-3-2200g.jpg', 'cpu', 4500, 187, NULL, '2022-11-21 01:57:07', NULL),
('8497f42b-434a-4b28-b7bc-34c8d0cb6349', 'Asus PRIME Z790-P WIFI', 'Asus', '/images/products/mainboard/24ed1df0ae0ec819d9bd2f693f76c496.256p.jpg', 'mainboard', 6249.75, 132, NULL, '2022-11-20 19:15:09', NULL),
('851e187d-0128-4e04-81e1-205b696251ea', 'MSI H510M-A PRO', 'MSI', '/images/products/mainboard/f9e3e541c282e5d932fce04c93183883.256p.jpg', 'mainboard', 2249.75, 32, NULL, '2022-11-20 19:15:09', NULL),
('852da72f-40b1-460d-a6d8-c8c2419a1892', 'Western Digital Green SN350', 'Western Digital', '/images/products/storagedrive/57b87f0a167a06e77da78f9812f28367.256p.jpg', 'storage drive', 1624.5, 164, NULL, '2022-11-21 12:00:58', NULL),
('86219cd6-2f6a-4558-b110-ac1d25f190e6', 'G.Skill Ripjaws V 32 GB', 'G.Skill', '/images/products/ram/f97fce0b44ff2447a790b0bffc74f9f3.256p.jpg', 'ram', 2124.75, 97, NULL, '2022-11-20 19:15:09', NULL),
('863784bc-bcf0-4064-8b0c-d030439f239c', 'Kingston A400', 'Kingston', '/images/products/storagedrive/97e2bd828644767c8a80b71f8cb14743.256p.jpg', 'storage drive', 749.75, 87, NULL, '2022-11-21 12:00:58', NULL),
('877ca18e-fd24-48c6-861f-2a460e01d77d', 'Corsair Vengeance RGB RT 32 GB', 'Corsair', '/images/products/ram/18d515b5e9b6de9484ac9eb7901c119c.256p.jpg', 'ram', 3199.75, 23, NULL, '2022-11-20 19:15:09', NULL),
('87d46d9d-f2ed-45d6-ae92-dfd3e6c30946', 'Western Digital Black SN770', 'Western Digital', '/images/products/storagedrive/310UZVOtlfL.jpg', 'storage drive', 4477.5, 24, NULL, '2022-11-21 12:00:58', NULL),
('889f9ed6-e511-43e3-8911-1addd9756680', 'Intel Core i3-10100', 'Intel', '/images/products/cpu/intel-core-i3-10100.jpg', 'cpu', 2499.75, 20, NULL, '2022-11-21 01:57:07', NULL),
('89060f4b-fa6f-4cb2-996b-d31cafa8268f', 'Logitech G300S', 'Logitech', '/images/products/mouse/200275a153ebdfa42c1bcdd248e3f6d8.256p.jpg', 'mouse', 624.75, 172, NULL, '2022-11-20 19:15:09', NULL),
('8aa2b43b-48c9-417c-9cf9-112728c171ef', 'Asus TUF GAMING B550-PLUS WIFI II', 'Asus', '/images/products/mainboard/51GlOc7dEL.jpg', 'mainboard', 4249.75, 155, NULL, '2022-11-20 19:15:09', NULL),
('8aa5d20e-26d5-4138-82d8-da435e011c63', 'LG 48GQ900-B', 'LG', '/images/products/monitor/18a6fae70c0d6025248113919115a11f.256p.jpg', 'monitor', 35445.2, 132, NULL, '2022-11-20 19:15:09', NULL),
('8ac5f34d-b60b-4afd-b00d-abfa54706f2c', 'Asus TUF Gaming VG27AQ', 'Asus', '/images/products/monitor/41ZM7pNwiJL.jpg', 'monitor', 6975, 127, NULL, '2022-11-20 19:15:09', NULL),
('8afa851f-7d8b-4836-9dac-b0c08509c462', 'Asus ROG STRIX GAMING OC V2', 'Asus', '/images/products/videocard/beb071dccca1ff1b043d87d01bfcb652.256p.jpg', 'video card', 28149.8, 94, NULL, '2022-11-20 19:15:09', NULL),
('8b4f4211-a2bd-4316-90d0-aa7ebb0d9659', 'Samsung 860 Evo', 'Samsung', '/images/products/storagedrive/31OUniJjNL.jpg', 'storage drive', 1874.5, 115, '2022-11-21 12:07:59', '2022-11-21 12:00:58', NULL),
('8bc8ce49-0434-4957-a01e-54c2f8614f64', 'Gigabyte Vision OC', 'Gigabyte', '/images/products/videocard/cbee7f02649e2958e4bd5426208b4a2b.256p.jpg', 'video card', 15199.8, 60, NULL, '2022-11-20 19:15:09', NULL),
('8c696046-aaeb-457f-9037-93bd3b0f4c11', 'Western Digital Black SN850', 'Western Digital', '/images/products/storagedrive/67ae19fe7847cb5bf67f4448e717e831.256p.jpg', 'storage drive', 3694.75, 130, NULL, '2022-11-21 12:00:58', NULL),
('8c802453-21e0-4d6f-a71a-0dce79c7db12', 'Gigabyte EAGLE', 'Gigabyte', '/images/products/videocard/f783170a21b4109f4602916f9846763f.256p.jpg', 'video card', 6499.75, 161, NULL, '2022-11-20 19:15:09', NULL),
('8c8fe1e8-4939-4035-9d47-d25baef2bb9f', 'Gigabyte B550M DS3H', 'Gigabyte', '/images/products/mainboard/cdf933968ed120030fb424c75188d6b7.256p.jpg', 'mainboard', 2499.75, 158, NULL, '2022-11-20 19:15:09', NULL),
('8ce8d6d3-ab39-496d-80ec-02169ab84f4c', 'G.Skill Trident Z Neo 32 GB', 'G.Skill', '/images/products/ram/20348ef9eb7ca86600eefb50c6a56597.256p.jpg', 'ram', 3799.75, 71, NULL, '2022-11-20 19:15:09', NULL),
('8d0b226b-9814-4a86-802d-ebb9a96ef51b', 'AMD Ryzen 5 2600', 'AMD', '/images/products/cpu/amd-ryzen-5-2600.jpg', 'cpu', 5250, 19, NULL, '2022-11-21 01:57:07', NULL),
('8d14f3a9-ed1b-4aea-a632-e9d4d7353c0e', 'EVGA FTW3 ULTRA GAMING LE iCX3', 'EVGA', '/images/products/videocard/41CPjBchLUS.jpg', 'video card', 36249.8, 188, NULL, '2022-11-20 19:15:09', NULL),
('8dd049e2-5e0a-4897-beb9-11e3231c9c35', 'Samsung 980 Pro w/Heatsink', 'Samsung', '/images/products/storagedrive/117a93ff22c8f38b2bfb8ff00b0b4d78.256p.jpg', 'storage drive', 3749.75, 180, NULL, '2022-11-21 12:00:58', NULL),
('8df98631-420f-4af0-b799-a9ea26d4e20a', 'Asus TUF GAMING Z690-PLUS WIFI D4', 'Asus', '/images/products/mainboard/41ldl2LwegL.jpg', 'mainboard', 5847, 104, NULL, '2022-11-20 19:15:09', NULL),
('8e0cd140-2054-4820-814d-309d707f2e60', 'MSI MPG Z690 EDGE WIFI DDR4', 'MSI', '/images/products/mainboard/6e4656d43e54f252067aa25aff85f5e2.256p.jpg', 'mainboard', 6999.75, 30, NULL, '2022-11-20 19:15:09', NULL),
('8e755289-d351-4bb0-a497-33674ab0cc16', 'Corsair M65 RGB ULTRA WIRELESS', 'Corsair', '/images/products/mouse/8c2320c4b1f286232ed2e0765180589c.256p.jpg', 'mouse', 3043.75, 189, NULL, '2022-11-20 19:15:09', NULL),
('8f99558b-7f4b-41a1-81b9-1fb77050a783', 'Crucial P3', 'Crucial', '/images/products/storagedrive/5b0cd518feacc76794f17f75745b2907.256p.jpg', 'storage drive', 974.75, 41, NULL, '2022-11-21 12:00:58', NULL),
('90dd199a-25ef-404b-bef7-a272f579a303', 'Asus PRIME Z690-P', 'Asus', '/images/products/mainboard/0f24e5ab95cefd570be21ea3c84d6aa2.256p.jpg', 'mainboard', 4774.75, 132, NULL, '2022-11-20 19:15:09', NULL),
('90e50872-0460-49de-8f11-94383c232ca2', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/videocard/7b87f1151133cd104c83a41914b02457.256p.jpg', 'video card', 24.75, 21, NULL, '2022-11-20 19:15:09', NULL),
('91059566-c321-4adb-bc3d-2a6344fb012a', 'AOC 24G2U/BK', 'AOC', '/images/products/monitor/80932dccff9f90891b1ae681ee03884c.256p.jpg', 'monitor', 0, 59, NULL, '2022-11-20 19:15:09', NULL),
('911c28f7-ca11-4f7d-9188-d1c6f1d4f63b', 'Intel Core i5-6600K', 'Intel', '/images/products/cpu/intel-core-i5-6600k.jpg', 'cpu', 4000, 167, NULL, '2022-11-21 01:57:07', NULL),
('9182eef0-35b9-4660-8185-257495a0cad1', 'Asus ROG STRIX Z690-F GAMING WIFI', 'Asus', '/images/products/mainboard/83512363851c2b140f4d6a517ffb24f3.256p.jpg', 'mainboard', 8999.75, 143, NULL, '2022-11-20 19:15:09', NULL),
('91cf3504-ddda-4311-a738-0abc9f763a82', 'Verbatim 98616 Go Mini Travel Commuter', 'Verbatim', '/images/products/mouse/c748e9772c96c374259e4badb8a2a34a.256p.jpg', 'mouse', 223.5, 74, NULL, '2022-11-20 19:15:09', NULL),
('924b4899-fe81-4f50-ab2d-b3b21fd87b78', 'TEAMGROUP T-Force Vulcan Z 32 GB', 'TEAMGROUP', '/images/products/ram/5adb8089a7ff5f322bc5dea023e93d31.256p.jpg', 'ram', 1924.5, 178, NULL, '2022-11-20 19:15:09', NULL),
('924d5fc5-4766-4786-b7a8-a78afa1c1e79', 'Western Digital Blue', 'Western Digital', '/images/products/storagedrive/0b9bfd76b0d511a6eff3730d12d5f95c.256p.jpg', 'storage drive', 1249.75, 101, NULL, '2022-11-21 12:00:58', NULL),
('928ea5ce-ac0e-459f-a45a-6b41057c9b5c', 'Asus P704 ROG CHAKRAM', 'Asus', '/images/products/mouse/001f947a6bca968b8791442b6884fb70.256p.jpg', 'mouse', 3310, 136, NULL, '2022-11-20 19:15:09', NULL),
('92a51c7b-d3a2-4c9b-8bd8-5627cb612c1a', 'ASRock Phantom Gaming D OC', 'ASRock', '/images/products/videocard/78809a37cadf50ddd2e9fe9a172aa795.256p.jpg', 'video card', 18749.8, 4, NULL, '2022-11-20 19:15:09', NULL),
('933cd7c9-ae1f-4a70-8f54-262727a5f792', 'Kingston NV1', 'Kingston', '/images/products/storagedrive/4b38e34b765a81eddcd84d5450a7f353.256p.jpg', 'storage drive', 1898.75, 93, NULL, '2022-11-21 12:00:58', NULL),
('935bebf5-234c-415b-a2bb-341c412133e2', 'Western Digital Red Pro', 'Western Digital', '/images/products/storagedrive/1ac710bded46038988de0ebfa909355a.256p.jpg', 'storage drive', 14999.8, 50, NULL, '2022-11-21 12:00:58', NULL),
('93ad0270-2481-44c8-b6b4-05950d352ac7', 'Gigabyte B650 AORUS ELITE AX', 'Gigabyte', '/images/products/mainboard/322a6059c413dd736536e5ad5c3a2285.256p.jpg', 'mainboard', 5499.75, 145, NULL, '2022-11-20 19:15:09', NULL),
('93fbdfb6-cd96-4255-a9f6-175fb7b8e7ba', 'Kingston FURY Beast 32 GB', 'Kingston', '/images/products/ram/304c08dd6c7dfb964c42c72f761b8a4f.256p.jpg', 'ram', 2749.75, 9, NULL, '2022-11-20 19:15:09', NULL),
('94236b35-cf79-4013-89ce-b76efeab6573', 'Intel Core i5-10600K', 'Intel', '/images/products/cpu/intel-core-i5-10600k.jpg', 'cpu', 4998, 102, NULL, '2022-11-21 01:57:07', NULL),
('942ffc11-b698-40d1-8651-86693534da2e', 'Seagate FireCuda 530', 'Seagate', '/images/products/storagedrive/45bb5064d2cbc808e4be407cab78f026.256p.jpg', 'storage drive', 13749.8, 142, NULL, '2022-11-21 12:00:58', NULL),
('94d9c303-27a6-42a9-b87d-aa018ed032af', 'Kingston FURY Beast RGB 16 GB', 'Kingston', '/images/products/ram/656b218c4f751e9d239c3627befb3b7d.256p.jpg', 'ram', 2742.5, 23, NULL, '2022-11-20 19:15:09', NULL),
('94f96c42-b709-45b2-805b-255daf15c8b8', 'Corsair Dominator Platinum RGB 64 GB', 'Corsair', '/images/products/ram/80d3d3bd860b72c7ebcce698e93664cd.256p.jpg', 'ram', 10499.8, 150, NULL, '2022-11-20 19:15:09', NULL),
('952d02b3-6fb6-44c1-8a6a-e9437e7fd81f', 'Alienware AW2521HF', 'Alienware', '/images/products/monitor/416CqsC88-L.jpg', 'monitor', 6249.75, 24, NULL, '2022-11-20 19:15:09', NULL),
('9647ef89-f8a2-452c-88d5-2c46d0d2f839', 'Corsair Vengeance RGB Pro 16 GB', 'Corsair', '/images/products/ram/e2d6ff067a5e1c2e9e019e811704e195.256p.jpg', 'ram', 1949.5, 93, NULL, '2022-11-20 19:15:09', NULL),
('97b1f615-a740-4b45-b2a5-3e251ab7cfaa', 'LG 27GL83A-B', 'LG', '/images/products/monitor/31CxyAIwuHL.jpg', 'monitor', 6749.75, 23, NULL, '2022-11-20 19:15:09', NULL),
('981fe987-4eec-4f46-bcfc-71d6f2dab90b', 'Gigabyte ‎M28U', 'Gigabyte', '/images/products/monitor/51Sr6OGBT8S.jpg', 'monitor', 15749.8, 180, NULL, '2022-11-20 19:15:09', NULL),
('98b2df6f-c138-42b3-92cf-e72bcd258ade', 'Logitech G703 LIGHTSPEED', 'Logitech', '/images/products/mouse/a3ff804c87be83ea9e268dd26afe13da.256p.jpg', 'mouse', 1904.5, 95, NULL, '2022-11-20 19:15:09', NULL),
('98b3bfb9-023b-4508-b564-42a6d3d9d718', 'Zotac GAMING Twin Edge OC', 'Zotac', '/images/products/videocard/31Qfpn4jBbL.jpg', 'video card', 9999.75, 114, NULL, '2022-11-20 19:15:09', NULL),
('98f1ea74-ac33-4909-99bc-8c80fe03aca6', 'LG 27GP950-B', 'LG', '/images/products/monitor/93d67e875ca85ac6b92e23dcdd4c19b5.256p.jpg', 'monitor', 18999.8, 79, NULL, '2022-11-20 19:15:09', NULL),
('98fc4c8d-cf4e-406f-ab14-a44843612031', 'Intel Core i5-8400', 'Intel', '/images/products/cpu/intel-core-i5-8400.jpg', 'cpu', 4875, 107, NULL, '2022-11-21 01:57:07', NULL),
('992a3d47-1c93-481b-89a2-604ce8c3f430', 'Zotac GAMING Twin Edge OC', 'Zotac', '/images/products/videocard/31i7e8-EdQL.jpg', 'video card', 9987.5, 73, NULL, '2022-11-20 19:15:09', NULL),
('992c048f-6fc9-455d-b539-5ac6559f2938', 'Asus VP228HE', 'Asus', '/images/products/monitor/8867fe547a8f02883838f2ca65220fa6.256p.jpg', 'monitor', 2975, 83, NULL, '2022-11-20 19:15:09', NULL),
('9974aecf-9276-41c7-9262-0e2ba1dea8de', 'Corsair Vengeance LPX 32 GB', 'Corsair', '/images/products/ram/11742fd6eec55fde4e3ee3a79529a111.256p.jpg', 'ram', 2499.75, 150, NULL, '2022-11-20 19:15:09', NULL),
('9a8051e3-f169-4ecc-829e-4d59913cd21f', 'Gigabyte X570 AORUS ELITE', 'Gigabyte', '/images/products/mainboard/a4e109f27fa379eb0d7d408866e73932.256p.jpg', 'mainboard', 6074.75, 72, NULL, '2022-11-20 19:15:09', NULL),
('9af84e85-f875-43e4-8ad4-869bd4ed4431', 'LG 27GN950-B', 'LG', '/images/products/monitor/0f06943449a7f045280437ce6c0c1a0a.256p.jpg', 'monitor', 16802.2, 77, NULL, '2022-11-20 19:15:09', NULL),
('9b553c66-3999-42e4-b401-c764e758a783', 'MSI MAG B650 TOMAHAWK WIFI', 'MSI', '/images/products/mainboard/dc9235e0d8052745493eb900bb9df6f6.256p.jpg', 'mainboard', 6249.75, 183, NULL, '2022-11-20 19:15:09', NULL),
('9bae4e46-6fee-4069-b942-d888b7767ef1', 'TEAMGROUP T-Force Delta RGB 32 GB', 'TEAMGROUP', '/images/products/ram/324fe2c061140ad3c29d5027fb8d22a6.256p.jpg', 'ram', 2449.75, 10, NULL, '2022-11-20 19:15:09', NULL),
('9bec3331-1e63-4340-a4ff-b88278609937', 'Logitech MX MASTER 2S (Black)', 'Logitech', '/images/products/mouse/41qc6XU1MWL.jpg', 'mouse', 1810, 103, NULL, '2022-11-20 19:15:09', NULL),
('9cad6736-fa06-4ada-80ac-ccf6c0720f33', 'G.Skill Trident Z RGB 128 GB', 'G.Skill', '/images/products/ram/ee2f17c440aba9ff83d0daa259958e25.256p.jpg', 'ram', 12999.8, 114, NULL, '2022-11-20 19:15:09', NULL),
('9cf3c719-f44a-4836-8f5f-673ddd4b4d1b', 'LG 27GN800-B', 'LG', '/images/products/monitor/cee9ad73f441215aca17a2d8fced1aa1.256p.jpg', 'monitor', 7053.5, 131, NULL, '2022-11-20 19:15:09', NULL),
('9db196ab-d9dc-492e-ada3-18e28e59c4e5', 'MSI VENTUS XS OC', 'MSI', '/images/products/videocard/9c57e7f04b05270bcf7edb9fcf4c715c.256p.jpg', 'video card', 4999.75, 58, NULL, '2022-11-20 19:15:09', NULL),
('9e1f1491-3277-4da1-b9be-c521625cd3a3', 'G.Skill Ripjaws V 16 GB', 'G.Skill', '/images/products/ram/a00199d12cb22ee1dc33639a754cca79.256p.jpg', 'ram', 1624.75, 61, NULL, '2022-11-20 19:15:09', NULL),
('9e2568bf-585a-4a39-80b4-8d4f42765abd', 'MSI MAG B660M MORTAR WIFI DDR4', 'MSI', '/images/products/mainboard/b06ca9093d1f20b4e906679885734eba.256p.jpg', 'mainboard', 4249.75, 199, NULL, '2022-11-20 19:15:09', NULL),
('9e2b97fd-4772-472b-81a9-2e5fa77b3f22', 'Patriot Viper Steel 8 GB', 'Patriot', '/images/products/ram/9fc15d8f5fcee3f8b1d4ef215aae826f.256p.jpg', 'ram', 1768.25, 116, NULL, '2022-11-20 19:15:09', NULL),
('9eccd79b-6bd0-481b-b4f5-0d8fd41e06ba', 'Intel Core i9-10850K', 'Intel', '/images/products/cpu/intel-core-i9-10850k.jpg', 'cpu', 8749.75, 11, NULL, '2022-11-21 01:57:07', NULL),
('9faef5bd-3f08-4a46-a68c-5afff6dfa1b2', 'Intel Core i5-13600KF', 'Intel', '/images/products/cpu/intel-core-i5-13600kf.jpg', 'cpu', 7749.5, 183, NULL, '2022-11-21 01:57:07', NULL),
('9fd58f6f-d7c6-41de-a0cb-162ae361298a', 'XFX Speedster SWFT 309', 'XFX', '/images/products/videocard/41Gcn794SS.jpg', 'video card', 10362, 19, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('a0117efb-31c7-40d2-a475-9e74ca6eeba4', 'Western Digital Blue', 'Western Digital', '/images/products/storagedrive/84d21e519b342daa8e8d2326b7c89e19.256p.jpg', 'storage drive', 1624.5, 30, NULL, '2022-11-21 12:00:58', NULL),
('a04a3e6a-d341-4e63-9cb8-25b914689f09', 'Gigabyte Z690 AORUS ELITE AX', 'Gigabyte', '/images/products/mainboard/cd6ae3e0e91dd460286893183daac81f.256p.jpg', 'mainboard', 6249.75, 111, NULL, '2022-11-20 19:15:09', NULL),
('a05327b9-3ef2-49ed-8942-40d1884b0b3b', 'Intel Core i5-11400', 'Intel', '/images/products/cpu/intel-core-i5-11400.jpg', 'cpu', 4599.75, 49, NULL, '2022-11-21 01:57:07', NULL),
('a0c731bf-b82d-490d-bfbb-ecf5a5cf8c52', 'Asus ROG STRIX WHITE OC', 'Asus', '/images/products/videocard/bb0159271ccac8d7db9357c0a6c34f76.256p.jpg', 'video card', 43187.2, 43, NULL, '2022-11-20 19:15:09', NULL),
('a173a611-0b02-4be8-a0a5-0b4540aef83d', 'Kingston A400', 'Kingston', '/images/products/storagedrive/97e2bd828644767c8a80b71f8cb14743.256p.jpg', 'storage drive', 499.5, 133, NULL, '2022-11-21 12:00:58', NULL),
('a26ec1bf-ae4e-4f62-97a6-8c55d45a4624', 'Razer DeathAdder V3 Pro', 'Razer', '/images/products/mouse/21YrdnICAjL.jpg', 'mouse', 3749.75, 27, NULL, '2022-11-20 19:15:09', NULL),
('a3960337-18c7-40a8-a37d-fd5b6b83fae1', 'Asus ROG STRIX GAMING OC', 'Asus', '/images/products/videocard/1a9731c510c0f0c63c5c6b3482418ff3.256p.jpg', 'video card', 31874.8, 67, NULL, '2022-11-20 19:15:09', NULL),
('a42cf1b7-3dd2-4f7b-b300-743ea693e5a7', 'AMD Ryzen 9 7900X', 'AMD', '/images/products/cpu/amd-ryzen-9-7900x.jpg', 'cpu', 13725, 80, NULL, '2022-11-21 01:57:07', NULL),
('a52d1f2e-0664-4094-9276-bf2aecc18c66', 'Crucial P5 Plus', 'Crucial', '/images/products/storagedrive/43c2b68eaed9cd66fa6d7d71ee8e2756.256p.jpg', 'storage drive', 1822.25, 96, NULL, '2022-11-21 12:00:58', NULL),
('a56fe2d2-4e6b-49be-a1cb-c5bf06d65d86', 'Gigabyte B660M DS3H AX DDR4', 'Gigabyte', '/images/products/mainboard/dec3061935ec099e0df452bced424dac.256p.jpg', 'mainboard', 3249.75, 99, NULL, '2022-11-20 19:15:09', NULL),
('a5781adf-781e-45a5-9663-0a9f94e25f7e', 'Corsair Vengeance 32 GB', 'Corsair', '/images/products/ram/I/41jJSPS8W7L.jpg', 'ram', 3874.75, 52, NULL, '2022-11-20 19:15:09', NULL),
('a5b53507-b50c-47f8-84b0-204aa1bfda44', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/videocard/0fda15afd0540cb65cb27b509d2427a5.256p.jpg', 'video card', 24.75, 98, NULL, '2022-11-20 19:15:09', NULL),
('a61091a1-494f-4f0a-835f-42d307c61aee', 'MSI MPG B550 GAMING EDGE WIFI', 'MSI', '/images/products/mainboard/e1677ccd8b20b24c91fd17885a1b8b8a.256p.jpg', 'mainboard', 5847.75, 76, NULL, '2022-11-20 19:15:09', NULL),
('a61b5697-1013-41f4-aaf3-fc0258428ed3', 'Intel Core i7-6700K', 'Intel', '/images/products/cpu/intel-core-i7-6700k.jpg', 'cpu', 6250, 133, NULL, '2022-11-21 01:57:07', NULL),
('a64cee3b-212b-4b95-92eb-6f3589e85a9d', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/videocard/48eea8a717330fc5dd5856b1fae65042.256p.jpg', 'video card', 24.75, 8, NULL, '2022-11-20 19:15:09', NULL),
('a6d3d605-0bb8-4580-96c7-ffae6260c436', 'Glorious Model O-', 'Glorious', '/images/products/mouse/c0dfd77aad137727f2bfa6e03304a001.256p.jpg', 'mouse', 1118.75, 77, NULL, '2022-11-20 19:15:09', NULL),
('a700c20f-5aa7-4720-b400-1c5b15eb7cd5', 'Asus ROG STRIX B660-A GAMING WIFI D4', 'Asus', '/images/products/mainboard/2effb4f06a5ebded337afc05a0a164bf.256p.jpg', 'mainboard', 4999.75, 2, NULL, '2022-11-20 19:15:09', NULL),
('a75dcf7c-e938-4664-a025-4c2c234297a6', 'Intel Core i7-10700F', 'Intel', '/images/products/cpu/intel-core-i7-10700f.jpg', 'cpu', 6249.75, 182, NULL, '2022-11-21 01:57:07', NULL),
('a77302db-7f03-42d3-b439-0a82774bb57a', 'MSI Optix G27CQ4', 'MSI', '/images/products/monitor/a6771210080ca28512dfac5803f184a2.256p.jpg', 'monitor', 6923.75, 127, NULL, '2022-11-20 19:15:09', NULL),
('a873316d-4df3-45dc-ab7a-cee419799918', 'MSI PRO Z690-A WIFI DDR4', 'MSI', '/images/products/mainboard/9a893a5445108a083b1727bcd344b9c1.256p.jpg', 'mainboard', 5374.75, 176, NULL, '2022-11-20 19:15:09', NULL),
('a8f44d11-8167-494f-acd3-113d38b92952', 'Razer Viper V2 Pro', 'Razer', '/images/products/mouse/31glu1YEFwL.jpg', 'mouse', 3028, 102, NULL, '2022-11-20 19:15:09', NULL),
('a93891c2-fab9-4de6-b27d-642ec5cc637f', 'MSI MPG Z490 GAMING EDGE WIFI', 'MSI', '/images/products/mainboard/194e14cf897c9728b8a9e85d0bd85a1b.256p.jpg', 'mainboard', 3150, 29, NULL, '2022-11-20 19:15:09', NULL),
('a979ca3a-5982-464d-933a-e0d43e70fd20', 'G.Skill Trident Z5 RGB 32 GB', 'G.Skill', '/images/products/ram/e8d573bd2eac864d427645f0d2f7cad8.256p.jpg', 'ram', 4749.75, 102, NULL, '2022-11-20 19:15:09', NULL),
('aa614d51-a3b4-4c51-9926-b65bee29e6e5', 'Asus TUF Gaming VG27AQ1A', 'Asus', '/images/products/monitor/5e024a5f7102e939f8d24280f6e58af1.256p.jpg', 'monitor', 6975, 162, NULL, '2022-11-20 19:15:09', NULL),
('ab0562c2-6c08-4f87-9a4b-3869b9c74015', 'Asus PRIME B550-PLUS', 'Asus', '/images/products/mainboard/b78a4d2aa4d50e061211af815e31e3b2.256p.jpg', 'mainboard', 3399.75, 13, NULL, '2022-11-20 19:15:09', NULL),
('ab0f91f4-864d-4067-b281-557102d49156', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/videocard/312T-6TRpsL.jpg', 'video card', 37499.8, 85, NULL, '2022-11-20 19:15:09', NULL),
('ab2e9c5f-79c6-4bab-a512-d35a738e674c', 'Gigabyte M27Q', 'Gigabyte', '/images/products/monitor/41iARbuf6wL.jpg', 'monitor', 8999.75, 152, NULL, '2022-11-20 19:15:09', NULL),
('ab6b47a6-d703-4469-b3a1-a83f431a5ed0', 'MSI GAMING Z TRIO', 'MSI', '/images/products/videocard/f6887de4a4ca1fc2481f44e68961e0c4.256p.jpg', 'video card', 19499.8, 41, NULL, '2022-11-20 19:15:09', NULL),
('abbbee1a-5a87-4a5c-9467-822651a97a68', 'G.Skill Ripjaws V 16 GB', 'G.Skill', '/images/products/ram/c75eee87606a7ee1b5f90816fc5a16ea.256p.jpg', 'ram', 1249.75, 165, NULL, '2022-11-20 19:15:09', NULL),
('ac2125bb-b61d-4319-a43a-41e42b582395', 'Kingston NV2', 'Kingston', '/images/products/storagedrive/7aa3028d0fc04e0ee3323f474bd349bd.256p.jpg', 'storage drive', 1749.5, 102, NULL, '2022-11-21 12:00:58', NULL),
('ac6ced28-8e7e-4b47-b27d-318e5e940796', 'TEAMGROUP Vulcan Z 16 GB', 'TEAMGROUP', '/images/products/ram/91c32e3300ee43e4f4c657d27e0d2a9b.256p.jpg', 'ram', 1274.75, 176, NULL, '2022-11-20 19:15:09', NULL),
('aca0eb69-933b-4fca-bd75-86cfdf592fc5', 'ASRock B550M Pro4', 'ASRock', '/images/products/mainboard/472d12f3f649d3c11155e02f9fd70e22.256p.jpg', 'mainboard', 2499.75, 14, NULL, '2022-11-20 19:15:09', NULL),
('aca4e220-5edd-4ccc-b6fd-095d8326b141', 'AMD Threadripper 3990X', 'AMD', '/images/products/cpu/amd-threadripper-3990x.jpg', 'cpu', 210000, 10, NULL, '2022-11-21 01:57:07', NULL),
('ad05569c-ce61-40a3-92f2-3c3461ff72d7', 'Logitech G502 LIGHTSPEED', 'Logitech', '/images/products/mouse/688ab5cb5e71622cfe889c082d784cdb.256p.jpg', 'mouse', 3199.75, 45, NULL, '2022-11-20 19:15:09', NULL),
('ad27514c-fabb-46c5-a8d9-8d09dbe9cef6', 'MSI VENTUS 2X OCV1', 'MSI', '/images/products/videocard/f883f51b57a8c1e7dec87086908f612d.256p.jpg', 'video card', 11249.8, 67, NULL, '2022-11-20 19:15:09', NULL),
('ad4c1efe-50f5-4ce5-a2e6-4265b5e1ca02', 'Intel Core i5-6500', 'Intel', '/images/products/cpu/intel-core-i5-6500.jpg', 'cpu', 3250, 25, NULL, '2022-11-21 01:57:07', NULL),
('addf3609-991d-4582-b813-58e5357756ff', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/videocard/71def5c09fd2c9eae67e254c191d84cb.256p.jpg', 'video card', 24.75, 150, NULL, '2022-11-20 19:15:09', NULL),
('ae309803-849e-4f09-88e5-e825a811cb87', 'ASRock Radeon RX6700XT CLD 12G', 'ASRock', '/images/products/videocard/2270978db545fc416882d48b1c08a55a.256p.jpg', 'video card', 8749.75, 5, NULL, '2022-11-20 19:15:09', NULL),
('ae6d21b1-a636-4529-9384-c2944a32efc6', 'Corsair Vengeance RGB Pro 32 GB', 'Corsair', '/images/products/ram/5f09867b54e9ad932b4dd1bc767f6238.256p.jpg', 'ram', 2949.75, 104, NULL, '2022-11-20 19:15:09', NULL),
('ae97e46f-b574-44ff-b98f-7096e0fb84df', 'Silicon Power P34A60', 'Silicon', '/images/products/storagedrive/229130faab065e7908c58fd694f78e1a.256p.jpg', 'storage drive', 837.25, 83, NULL, '2022-11-21 12:00:58', NULL),
('aedbdee7-50a2-4383-90d0-b3763974e8dc', 'MSI GAMING Z TRIO', 'MSI', '/images/products/videocard/56b51ca9509deaa5507ac8e7aed64abb.256p.jpg', 'video card', 14124.8, 167, NULL, '2022-11-20 19:15:09', NULL),
('aef723b8-eb3c-4f9f-b53d-bfff943a1f0d', 'NZXT N7 B550', 'NZXT', '/images/products/mainboard/5908ccb20bcf4d4f03ba62b82cbadc27.256p.jpg', 'mainboard', 6249.75, 150, NULL, '2022-11-20 19:15:09', NULL),
('af122586-efde-4113-94dd-3e8c485741dc', 'MSI Optix G274QRFW', 'MSI', '/images/products/monitor/e4a084f8334b0a1bf59fec892ae559a8.256p.jpg', 'monitor', 7499.75, 10, NULL, '2022-11-20 19:15:09', NULL),
('af187e18-a791-4a28-a9d1-76aa6feb7a6c', 'Logitech G305 LIGHTSPEED', 'Logitech', '/images/products/mouse/9c7bb4a616fae14e76530d835a82f12d.256p.jpg', 'mouse', 873.75, 112, NULL, '2022-11-20 19:15:09', NULL),
('af1f781f-2058-4c3f-bc56-9e568221966c', 'Asus TUF Gaming VG28UQL1A', 'Asus', '/images/products/monitor/7eaff54dcffe847768a0086730e30777.256p.jpg', 'monitor', 16725, 99, NULL, '2022-11-20 19:15:09', NULL),
('af578e41-0b51-4df5-aa13-1e53c26255d5', 'Seagate Barracuda Compute', 'Seagate', '/images/products/storagedrive/41aEb8InacL.jpg', 'storage drive', 2999.75, 146, NULL, '2022-11-21 12:00:58', NULL),
('afddf184-d274-4f0c-b81a-18af41d66d93', 'ASRock A520M-ITX/ac', 'ASRock', '/images/products/mainboard/333c07026b775245b30842da88699979.256p.jpg', 'mainboard', 2624.75, 198, NULL, '2022-11-20 19:15:09', NULL),
('b059a843-581d-4b69-916b-ebd0d63e66a4', 'Samsung 870 Evo', 'Samsung', '/images/products/storagedrive/2c576ecaedba7428ac231ac4f1e12a4d.256p.jpg', 'storage drive', 4488.5, 139, NULL, '2022-11-21 12:00:58', NULL),
('b1110170-ecca-442e-8f95-cc3a4720e29f', 'AMD Ryzen 5 1600', 'AMD', '/images/products/cpu/amd-ryzen-5-1600.jpg', 'cpu', 4402.5, 128, NULL, '2022-11-21 01:57:07', NULL),
('b1cee37e-44b8-4a42-b750-3834e3f449fb', 'Corsair Dominator Platinum 128 GB', 'Corsair', '/images/products/ram/6c5f6ca4d00a7bd353ba6feee665f888.256p.jpg', 'ram', 99950, 15, NULL, '2022-11-20 19:15:09', NULL),
('b1dfb775-e19c-4519-8106-69eee64b6f18', 'Western Digital Purple Pro', 'Western Digital', '/images/products/storagedrive/8e32fbeaf3794a1547303d9d5e6b158a.256p.jpg', 'storage drive', 14886.8, 102, NULL, '2022-11-21 12:00:58', NULL),
('b22d4c15-7a88-49ea-9a17-7946f3ea0720', 'Intel 670p', 'Intel', '/images/products/storagedrive/dcf368b5092373d4759de1ee874b9e79.256p.jpg', 'storage drive', 1749.5, 149, NULL, '2022-11-21 12:00:58', NULL),
('b2c2639b-06fb-482a-8dc4-c64dfcf016a8', 'TEAMGROUP T-Force Delta RGB 16 GB', 'TEAMGROUP', '/images/products/ram/a57460b491bfa8f2ffbee96d83b0941b.256p.jpg', 'ram', 1499.75, 144, NULL, '2022-11-20 19:15:09', NULL),
('b2ce92c7-ed2f-4ec8-be2c-b4f47dc4c61e', 'Intel Core i5-10600KF', 'Intel', '/images/products/cpu/intel-core-i5-10600kf.jpg', 'cpu', 4249.75, 62, NULL, '2022-11-21 01:57:07', NULL),
('b322befc-bb62-4cea-8a75-0e3ba3b61750', 'MSI GTX 1050 Ti 4GT OC', 'MSI', '/images/products/videocard/1085f0f0294e6eb6340c70bf6324a9f8.256p.jpg', 'video card', 3897.75, 119, NULL, '2022-11-20 19:15:09', NULL),
('b32f7970-a2d5-48cb-9f7d-b36f90c3000f', 'AMD Ryzen 7 3700X', 'AMD', '/images/products/cpu/amd-ryzen-7-3700x.jpg', 'cpu', 0, 153, NULL, '2022-11-21 01:57:07', NULL),
('b3438a96-4875-4685-a772-f19a5561712c', 'Crucial BX500', 'Crucial', '/images/products/storagedrive/41Fi4L5w9yL.jpg', 'storage drive', 1549.75, 47, NULL, '2022-11-21 12:00:58', NULL),
('b3d9f993-896a-4909-9a19-946ad2a2803d', 'Intel DC P3608', 'Intel', '/images/products/storagedrive/416H4YJElJL.jpg', 'storage drive', 0, 79, NULL, '2022-11-21 12:00:58', NULL),
('b4a7a5f2-6d6d-4883-9d97-ec12069e2fa0', 'EVGA FTW3 ULTRA GAMING', 'EVGA', '/images/products/videocard/2f11da299c23e66859a6955b07835ff6.256p.jpg', 'video card', 24.75, 80, NULL, '2022-11-20 19:15:09', NULL),
('b57f36d6-70af-4c09-b85f-21f5926f1616', 'HP OMEN X Emperium 65', 'HP', '/images/products/monitor/79694b128aac4fe9ebb90dd7f0ce184b.256p.jpg', 'monitor', 99999.8, 142, NULL, '2022-11-20 19:15:09', NULL),
('b585c6de-cc05-4b3b-b56f-84dbf13a04fc', 'Logitech G Pro X Superlight', 'Logitech', '/images/products/mouse/31Hn3R2Vv5L.jpg', 'mouse', 3324.75, 23, NULL, '2022-11-20 19:15:09', NULL),
('b5eb8019-9f18-4499-9e6d-0b87b9e60c72', 'ViewSonic VX2468-PC-MHD', 'ViewSonic', '/images/products/monitor/100a50ce7d74712cbde93e1eeceb10e7.256p.jpg', 'monitor', 4749.75, 53, NULL, '2022-11-20 19:15:09', NULL),
('b5f4df3d-c805-481b-8d3f-9b660c6452b8', 'Silicon Power SP016GBLFU320B22 16 GB', 'Silicon', '/images/products/ram/I/41tZyzkQWTS.jpg', 'ram', 1049.75, 176, NULL, '2022-11-20 19:15:09', NULL);
INSERT IGNORE INTO `products` (`productId`, `productName`, `productBrand`, `productPhoto`, `productType`, `price`, `inStock`, `updatedAt`, `createdAt`, `deletedAt`) VALUES
('b64571d9-7500-4fe7-b319-7ed1b645926e', 'EVGA FTW3 ULTRA GAMING', 'EVGA', '/images/products/videocard/41Oi3oMgbL.jpg', 'video card', 44975, 84, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('b64f69e4-352a-4cba-adab-fba29de99ec9', 'Kingston NV2', 'Kingston', '/images/products/storagedrive/f1af66b97ac908b094775b859ce9d33e.256p.jpg', 'storage drive', 3249.75, 58, NULL, '2022-11-21 12:00:58', NULL),
('b6ab7eb0-7e18-452a-bc68-64f5bdb772b4', 'Western Digital Blue SN570', 'Western Digital', '/images/products/storagedrive/373f32edfb3cefa279ed83823706f39e.256p.jpg', 'storage drive', 3938.25, 134, NULL, '2022-11-21 12:00:58', NULL),
('b6c46286-a735-4d5d-9d76-f74d192ae43f', 'Western Digital Blue SN570', 'Western Digital', '/images/products/storagedrive/da6c2cb6e4d17032dbb3da790499b57f.256p.jpg', 'storage drive', 1999.5, 187, NULL, '2022-11-21 12:00:58', NULL),
('b764d413-3f3e-4e71-865a-7fbc22620845', 'MSI B550-A PRO', 'MSI', '/images/products/mainboard/662aee2a85bbe3b7e12224e381e57d24.256p.jpg', 'mainboard', 3499.75, 17, NULL, '2022-11-20 19:15:09', NULL),
('b76c3dce-82fa-46b9-af8f-8a6535d1788b', 'Asus VG278QR', 'Asus', '/images/products/monitor/1698baacec56a901c0eb416807c20595.256p.jpg', 'monitor', 5237, 182, NULL, '2022-11-20 19:15:09', NULL),
('b7d6f2b6-2e8f-4c5f-b06f-7debccd3b292', 'Asus ROG Strix X570-I Gaming', 'Asus', '/images/products/mainboard/8e75b0858ab998bd0664f5fb1912c9a0.256p.jpg', 'mainboard', 6475, 119, NULL, '2022-11-20 19:15:09', NULL),
('b89721fd-0a09-4bcc-b444-78e20c2fddaa', 'ASRock B660M Pro RS', 'ASRock', '/images/products/mainboard/aefcd090c843c13ade52d1cbbde793b5.256p.jpg', 'mainboard', 2249.75, 108, NULL, '2022-11-20 19:15:09', NULL),
('b8c5652b-9bd0-4a90-b58b-bf02fb21828c', 'Western Digital Blue SN570', 'Western Digital', '/images/products/storagedrive/820f4e4ac27af85645afeaabc7b82f04.256p.jpg', 'storage drive', 1074.75, 25, NULL, '2022-11-21 12:00:58', NULL),
('b97d978c-60ac-49d1-8bb4-c8413a01e4e6', 'Gigabyte B450 AORUS PRO WIFI (rev. 1.0)', 'Gigabyte', '/images/products/mainboard/91e3b7d48688c9370598eeec8d1b4711.256p.jpg', 'mainboard', 2999.75, 70, NULL, '2022-11-20 19:15:09', NULL),
('ba281bc7-c3e4-4b8b-b9ce-366f22e4008c', 'Asus ProArt Display PA32UCG-K', 'Asus', '/images/products/monitor/7a7f018b6d4e6e54702dec2707bf1014.256p.jpg', 'monitor', 87475, 15, NULL, '2022-11-20 19:15:09', NULL),
('badaf449-9c76-46bb-b991-ccfe499ad107', 'Sabrent Rocket 4.0', 'Sabrent', '/images/products/storagedrive/413arpEb7NL.jpg', 'storage drive', 2499.75, 186, NULL, '2022-11-21 12:00:58', NULL),
('bc9d5d63-3708-4d12-b086-e56b0a11063d', 'MSI MECH 2X', 'MSI', '/images/products/videocard/e19465e0f369b5cec4beadcd62302eac.256p.jpg', 'video card', 8749.75, 165, NULL, '2022-11-20 19:15:09', NULL),
('bccc7fff-25f6-4747-949c-8e93c519218a', 'AMD Ryzen 7 3700X', 'AMD', '/images/products/cpu/amd-ryzen-7-3700x.jpg', 'cpu', 0, 77, '2022-12-09 03:07:21', '2022-11-21 01:57:07', '2022-12-09 03:07:21'),
('bce4bbd7-daa5-46d4-aeb8-b719f731425e', 'Seagate FireCuda 530', 'Seagate', '/images/products/storagedrive/a82a914921d63165f8a7b096089ff91f.256p.jpg', 'storage drive', 2999.75, 103, NULL, '2022-11-21 12:00:58', NULL),
('bd212c60-44e5-460a-bb8f-9a11390e9004', 'MSI GeForce RTX 3060 Gaming X12G', 'MSI', '/images/products/videocard/82c275a9517eededa768170a16ad07c7.256p.jpg', 'video card', 9749.75, 79, NULL, '2022-11-20 19:15:09', NULL),
('bd4aa9d3-317e-4323-a14b-f76fd2d15b9e', 'Corsair NIGHTSWORD RGB', 'Corsair', '/images/products/mouse/41puSbyNS7L.jpg', 'mouse', 1716, 80, NULL, '2022-11-20 19:15:09', NULL),
('bda0ad84-a01a-49f8-9bbc-4789132fd8a4', 'Logitech G303 Daedalus Apex', 'Logitech', '/images/products/mouse/41EaCtcC7oL.jpg', 'mouse', 7248.75, 65, NULL, '2022-11-20 19:15:09', NULL),
('be2b9652-b237-4b54-a7e2-5979bb60fb2e', 'Gigabyte Z690 GAMING X DDR4', 'Gigabyte', '/images/products/mainboard/760693fb090dd6499ee94a2edbcaf36f.256p.jpg', 'mainboard', 5249.75, 131, NULL, '2022-11-20 19:15:09', NULL),
('bedbbd4a-7673-4bbd-8a45-9330c6a1ec86', 'Intel Core i7-12700K', 'Intel', '/images/products/cpu/intel-core-i7-12700k.jpg', 'cpu', 8692.25, 157, NULL, '2022-11-21 01:57:07', NULL),
('bf405407-b7e8-4dd2-a9f5-a235580eb81d', 'Gigabyte M27Q-P', 'Gigabyte', '/images/products/monitor/21Jn3lCMOXL.jpg', 'monitor', 7499.75, 184, NULL, '2022-11-20 19:15:09', NULL),
('bf5ddc3c-3f1f-47b5-9516-fa7634ab5cbe', 'Razer DeathAdder V2 Pro', 'Razer', '/images/products/mouse/e081ddfb8c66371eb0d090672f19af59.256p.jpg', 'mouse', 1625, 61, NULL, '2022-11-20 19:15:09', NULL),
('bf63e64b-f555-45b5-b42e-e342ed02e852', 'Gigabyte GA-A320M-S2H', 'Gigabyte', '/images/products/mainboard/0d8d83b73c9f82f04e889ff31ca1471c.256p.jpg', 'mainboard', 1374.75, 40, NULL, '2022-11-20 19:15:09', NULL),
('c097b424-2d34-4fc9-93f9-89b95b19f4c1', 'MSI GAMING X TRIO', 'MSI', '/images/products/videocard/41j7FWrOpYS.jpg', 'video card', 35249.8, 191, NULL, '2022-11-20 19:15:09', NULL),
('c244c569-d27d-490e-83d7-b7cd4022f547', 'AMD Threadripper 2990WX', 'AMD', '/images/products/cpu/amd-threadripper-2990wx.jpg', 'cpu', 74750, 135, NULL, '2022-11-21 01:57:07', NULL),
('c29598b6-aa5a-4d58-bbfe-69a1cf391b31', 'Samsung 870 Evo', 'Samsung', '/images/products/storagedrive/2c576ecaedba7428ac231ac4f1e12a4d.256p.jpg', 'storage drive', 1249.75, 89, NULL, '2022-11-21 12:00:58', NULL),
('c2d0b756-14da-4731-bf2c-1b88b8b393a8', 'AMD Ryzen 5 4600G', 'AMD', '/images/products/cpu/amd-ryzen-5-4600g.jpg', 'cpu', 2838.75, 87, NULL, '2022-11-21 01:57:07', NULL),
('c302f481-0ff7-4fe6-95b5-65f020a05335', 'Razer Basilisk V3 Pro + Mouse Dock Pro', 'Razer', '/images/products/mouse/f3ac232d47683dd615b3d89f99e1bba2.256p.jpg', 'mouse', 4999.75, 90, NULL, '2022-11-20 19:15:09', NULL),
('c38a2159-cad6-4603-8f0a-e64f21e2b290', 'Redragon COBRA M711', 'Redragon', '/images/products/mouse/41hA8MkIIHL.jpg', 'mouse', 499.5, 116, NULL, '2022-11-20 19:15:09', NULL),
('c425c814-5ddb-4542-9dd2-b3c4407b8883', 'Intel Core i5-12400F', 'Intel', '/images/products/cpu/intel-core-i5-12400f.jpg', 'cpu', 3999.25, 121, NULL, '2022-11-21 01:57:07', NULL),
('c43b6df6-f202-4eaf-a7ab-ee210aaba949', 'Intel Core i7-8700K', 'Intel', '/images/products/cpu/intel-core-i7-8700k.jpg', 'cpu', 8064.5, 105, NULL, '2022-11-21 01:57:07', NULL),
('c458e508-ff20-4cff-b25c-524666c6275c', 'Asus TUF Gaming VG27BQ', 'Asus', '/images/products/monitor/ce6a08c0d78c3f627c28b9c7321f43f1.256p.jpg', 'monitor', 6874.75, 73, NULL, '2022-11-20 19:15:09', NULL),
('c47e50ed-beaf-4db3-b36d-ee1685087db7', 'Silicon Power GAMING 32 GB', 'Silicon', '/images/products/ram/I/51w2AbYQhcS.jpg', 'ram', 1724.25, 179, NULL, '2022-11-20 19:15:09', NULL),
('c6d33618-5fe7-474e-b9f1-1ff297777031', 'Samsung 980 Pro', 'Samsung', '/images/products/storagedrive/3b2a91588d1a28bfa1b0184fb7f1c0a1.256p.jpg', 'storage drive', 5475, 120, NULL, '2022-11-21 12:00:58', NULL),
('c6d5ef02-36e5-479c-8f02-b9717ef4306f', 'MSI MAG B660 TOMAHAWK WIFI DDR4', 'MSI', '/images/products/mainboard/62befea3ebf04f78b865687fab11c7b1.256p.jpg', 'mainboard', 4749.75, 108, NULL, '2022-11-20 19:15:09', NULL),
('c701e16f-09e0-47e3-a9e8-a91e978d0ca7', 'LG 27GP850-B', 'LG', '/images/products/monitor/41OQgjJLf-L.jpg', 'monitor', 11874.8, 132, NULL, '2022-11-20 19:15:09', NULL),
('c712eac4-b11e-4c67-a678-9003da39dc78', 'Dell S2522HG', 'Dell', '/images/products/monitor/0e0a67d72fdd4d79c18d9edd25bf8a5d.256p.jpg', 'monitor', 5025, 115, NULL, '2022-11-20 19:15:09', NULL),
('c800cdec-2bbc-483f-846d-511f8520534a', 'Intel Core i7-10700KF', 'Intel', '/images/products/cpu/intel-core-i7-10700kf.jpg', 'cpu', 7249.75, 199, NULL, '2022-11-21 01:57:07', NULL),
('c85e198a-36fd-48df-8cfc-e0100e5927ac', 'Corsair Vengeance RGB Pro 32 GB', 'Corsair', '/images/products/ram/e508c7c5a301831579045f9fda179aac.256p.jpg', 'ram', 2624.75, 88, NULL, '2022-11-20 19:15:09', NULL),
('c85fcebf-d84b-4165-ad44-fac8a2d1523b', 'Intel Core i7-4790K', 'Intel', '/images/products/cpu/intel-core-i7-4790k.jpg', 'cpu', 0, 163, NULL, '2022-11-21 01:57:07', NULL),
('c8b1c341-82b6-4251-93cd-aca61378dfb4', 'Corsair Vengeance RGB Pro 16 GB', 'Corsair', '/images/products/ram/87cd8e9d02ffb0997769f4a4d5969669.256p.jpg', 'ram', 1749.5, 149, NULL, '2022-11-20 19:15:09', NULL),
('c900efd7-6ef7-45d8-be58-efbb5c08c538', 'Asus ProArt Display PA32UCG-K', 'Asus', '/images/products/monitor/a355ece2638358c4a8a2ded782e8cce2.256p.jpg', 'monitor', 87475, 103, NULL, '2022-11-20 19:15:09', NULL),
('c9eae240-42b2-4689-8e4e-ae11ccaa150d', 'Intel 750', 'Intel', '/images/products/storagedrive/881bf7624b22b2724a28c53ef21bfaa0.256p.jpg', 'storage drive', 62221.8, 77, NULL, '2022-11-21 12:00:58', NULL),
('caa73790-b85c-4042-9fea-3467c3064ed6', 'Razer Naga Pro', 'Razer', '/images/products/mouse/0615b1c07cbb01bb91060e0517d95dcd.256p.jpg', 'mouse', 2499.75, 13, NULL, '2022-11-20 19:15:09', NULL),
('cafa8417-769a-4195-b90a-c92d88065d6f', 'Asus ROG STRIX B550-I GAMING', 'Asus', '/images/products/mainboard/08c85837e3736c855a86c6bbbe7fd31c.256p.jpg', 'mainboard', 5224.75, 78, NULL, '2022-11-20 19:15:09', NULL),
('cbe7be99-b871-4180-ac27-8f448666dc0e', 'Logitech MX MASTER 3S', 'Logitech', '/images/products/mouse/80f5ae114fd88013fa45e170e1098214.256p.jpg', 'mouse', 2374.75, 173, NULL, '2022-11-20 19:15:09', NULL),
('cc8db200-cdf2-408a-ade0-273d03b77b60', 'EVGA XC GAMING', 'EVGA', '/images/products/videocard/51ufTnVhMeL.jpg', 'video card', 11199.8, 61, NULL, '2022-11-20 19:15:09', NULL),
('cd116c24-be70-4476-9251-40bd9b7f6ff5', 'Corsair Vengeance RGB 32 GB', 'Corsair', '/images/products/ram/b2d107d629e656f9f435ce9bd604f7e0.256p.jpg', 'ram', 9382, 156, NULL, '2022-11-20 19:15:09', NULL),
('ce0deb6f-192e-4801-a794-b76fd6f39749', 'Crucial P2', 'Crucial', '/images/products/storagedrive/50d7356e9199580f1c35e7b8f01232ab.256p.jpg', 'storage drive', 999.75, 63, NULL, '2022-11-21 12:00:58', NULL),
('ce6f7e9d-19c5-4a14-8191-7826bab890b9', 'AMD Ryzen 5 3600X', 'AMD', '/images/products/cpu/amd-ryzen-5-3600x.jpg', 'cpu', 6125, 83, NULL, '2022-11-21 01:57:07', NULL),
('cea12fcf-61fc-4a1f-8526-ff5350df17bf', 'MSI Optix MPG321UR-QD', 'MSI', '/images/products/monitor/69099795636afd8f52c8ec86a86d65e5.256p.jpg', 'monitor', 19999.8, 92, NULL, '2022-11-20 19:15:09', NULL),
('cf1a4d80-d167-46cd-a4fd-4d0730728509', 'TEAMGROUP MP34', 'TEAMGROUP', '/images/products/storagedrive/249d7ecea46737d175b4638a78b16f9f.256p.jpg', 'storage drive', 1624.75, 188, NULL, '2022-11-21 12:00:58', NULL),
('d1239da1-edf1-41fc-92e9-c6f19de790a5', 'Intel Core i5-10400', 'Intel', '/images/products/cpu/intel-core-i5-10400.jpg', 'cpu', 3799.75, 199, NULL, '2022-11-21 01:57:07', NULL),
('d12a8218-73b3-4441-8093-a3f607e5f831', 'AMD Ryzen 3 3100', 'AMD', '/images/products/cpu/amd-ryzen-3-3100.jpg', 'cpu', 3749.75, 100, NULL, '2022-11-21 01:57:07', NULL),
('d131baf1-94c9-44ae-b3b3-bebf5abebdd6', 'Kingston FURY Beast RGB 16 GB', 'Kingston', '/images/products/ram/I/41ulXuXw-nL.jpg', 'ram', 1674.75, 83, NULL, '2022-11-20 19:15:09', NULL),
('d137cc7b-e35a-4e99-8d28-25bf55483f1a', 'PowerColor Fighter', 'PowerColor', '/images/products/videocard/41ZtPcosjL.jpg', 'video card', 5749.75, 12, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('d17d20ee-5e10-416f-9b1a-2d0f6463f17c', 'AMD Ryzen 9 7950X', 'AMD', '/images/products/cpu/amd-ryzen-9-7950x.jpg', 'cpu', 17474.8, 23, NULL, '2022-11-21 01:57:07', NULL),
('d1a550b0-834a-4e6f-a52a-774c33ab335a', 'Samsung Odyssey G7 LS28AG700NNXZA', 'Samsung', '/images/products/monitor/7096bbcebaf6dce8f9768fb749ee6309.256p.jpg', 'monitor', 18999.8, 128, NULL, '2022-11-20 19:15:09', NULL),
('d1e2ccce-2a8c-4d4d-9775-c6bb1442ca2e', 'Kingston Fury Renegade', 'Kingston', '/images/products/storagedrive/4a39091cc852e56b16b02febdadeb3a7.256p.jpg', 'storage drive', 2874.75, 164, NULL, '2022-11-21 12:00:58', NULL),
('d27adf3f-53c6-4346-9e3a-97b00d40167a', 'MSI B450 Gaming Plus MAX', 'MSI', '/images/products/mainboard/4bc251397f224e863c8939100c1f80fb.256p.jpg', 'mainboard', 2499.75, 138, NULL, '2022-11-20 19:15:09', NULL),
('d28229e2-7cef-4f3f-bad0-75486daf422a', 'Logitech G502 SE HERO', 'Logitech', '/images/products/mouse/1352f08a307d6d717b48bdaf666e6fb4.256p.jpg', 'mouse', 999.75, 12, NULL, '2022-11-20 19:15:09', NULL),
('d292ef65-3f9b-4823-b290-547dea5a8fa3', 'Asus ROG Swift PG279QM', 'Asus', '/images/products/monitor/79d4676a209d1710b5221258f9c50b12.256p.jpg', 'monitor', 23606.5, 128, NULL, '2022-11-20 19:15:09', NULL),
('d2930363-7a5e-46b9-aa24-dbfcd85b02af', 'Intel Core i7-10700K', 'Intel', '/images/products/cpu/intel-core-i7-10700k.jpg', 'cpu', 6649.75, 37, NULL, '2022-11-21 01:57:07', NULL),
('d29d4d96-e928-45de-af8a-3101bf35537a', 'Kingston FURY Beast 16 GB', 'Kingston', '/images/products/ram/e5b36206d27e6d780584db76eadc621f.256p.jpg', 'ram', 2296, 6, NULL, '2022-11-20 19:15:09', NULL),
('d30af531-7a62-4d27-a565-76f32c9771d3', 'Razer Viper Mini', 'Razer', '/images/products/mouse/31MH38XvIqL.jpg', 'mouse', 499.5, 62, NULL, '2022-11-20 19:15:09', NULL),
('d33787ab-80d2-4525-b068-445af2841932', 'HP X32', 'HP', '/images/products/monitor/7d58d674357073e13e71cc7cdd0555fa.256p.jpg', 'monitor', 5749.75, 12, NULL, '2022-11-20 19:15:09', NULL),
('d369d654-9d00-463a-9619-bc0921783fd5', 'MSI MAG X570S TOMAHAWK MAX WIFI', 'MSI', '/images/products/mainboard/514enNtofrL.jpg', 'mainboard', 5749.75, 110, NULL, '2022-11-20 19:15:09', NULL),
('d38af7a4-fed4-437c-8d43-e80773209b4e', 'Gigabyte B660 GAMING X AX DDR4', 'Gigabyte', '/images/products/mainboard/5f39595e6f270ae24f1c00748cdde442.256p.jpg', 'mainboard', 4499.75, 129, NULL, '2022-11-20 19:15:09', NULL),
('d3d22ade-cb27-4524-8a70-abf8fa80a7c7', 'Zotac GAMING AMP', 'Zotac', '/images/products/videocard/d2cfb89d9edbb3e8427e81df4159c2d4.256p.jpg', 'video card', 10499.8, 68, NULL, '2022-11-20 19:15:09', NULL),
('d3f8e70e-f726-47af-9093-8f44189242e2', 'Corsair HARPOON RGB', 'Corsair', '/images/products/mouse/3769ffe225dff8702ca903ffce27846f.256p.jpg', 'mouse', 949.75, 24, NULL, '2022-11-20 19:15:09', NULL),
('d48acaed-211b-4591-8b23-7695ab51aeb6', 'Samsung 870 QVO', 'Samsung', '/images/products/storagedrive/29b838814626cac9b060a2d2c0a293cd.256p.jpg', 'storage drive', 4249.75, 192, NULL, '2022-11-21 12:00:58', NULL),
('d4afa558-284c-4ebe-a8c2-89cfc5e00228', 'Zotac GAMING Twin Edge OC White Edition', 'Zotac', '/images/products/videocard/0abc7c75589767934cf471a391bf3b35.256p.jpg', 'video card', 13249.8, 182, NULL, '2022-11-20 19:15:09', NULL),
('d5327a99-0efb-4ef6-99a8-1694c5d2ae9c', 'Sabrent Rocket 4 Plus', 'Sabrent', '/images/products/storagedrive/41uuRjml3QL.jpg', 'storage drive', 17499.8, 122, NULL, '2022-11-21 12:00:58', NULL),
('d57429fd-559a-449c-b044-1640ae8534c9', 'Samsung 970 Evo Plus', 'Samsung', '/images/products/storagedrive/13eff9fb98909107806f62c493d3775f.256p.jpg', 'storage drive', 4999.75, 118, NULL, '2022-11-21 12:00:58', NULL),
('d63c8583-196f-40bd-bb3d-39ff1f533291', 'Gigabyte GAMING OC', 'Gigabyte', '/images/products/videocard/413KJTCkkiS.jpg', 'video card', 15749.8, 20, NULL, '2022-11-20 19:15:09', NULL),
('d67248d1-9600-4c11-b776-3e59e9674689', 'Crucial P2', 'Crucial', '/images/products/storagedrive/b6d18344cd27c22109c45e54a9c7d86d.256p.jpg', 'storage drive', 3998.25, 88, NULL, '2022-11-21 12:00:58', NULL),
('d67e3218-ee12-493a-b1b3-00ca1bd8a21b', 'Gigabyte B550I AORUS PRO AX', 'Gigabyte', '/images/products/mainboard/6792f9e45d7b69159731f4cd4313496a.256p.jpg', 'mainboard', 4875, 106, NULL, '2022-11-20 19:15:09', NULL),
('d6aca123-fae4-46be-a804-fc1db6704cad', 'AMD Ryzen 5 5600', 'AMD', '/images/products/cpu/amd-ryzen-5-5600.jpg', 'cpu', 2974.75, 79, NULL, '2022-11-21 01:57:07', NULL),
('d7066c62-8b5d-49a7-80c3-e0b3316a02c4', 'Razer Viper V2 Pro', 'Razer', '/images/products/mouse/bc83693b4c2c338e8bcb261cf33466bb.256p.jpg', 'mouse', 3187.5, 25, NULL, '2022-11-20 19:15:09', NULL),
('d70df958-6e04-4236-a11f-ee6c72040f34', 'Acer Nitro VG272 Xbmiipx', 'Acer', '/images/products/monitor/41ylTnJuSL.jpg', 'monitor', 7499.75, 41, '2022-11-21 12:07:59', '2022-11-20 19:15:09', NULL),
('d71ba2b3-89de-4f18-845d-f8444a64a6ef', 'Gigabyte M32Q', 'Gigabyte', '/images/products/monitor/b005fb54e50cceefae3011586a2c08a0.256p.jpg', 'monitor', 10749.8, 187, NULL, '2022-11-20 19:15:09', NULL),
('d77b2833-a731-4952-8df9-4726b2fd110a', 'ViewSonic ELITE XG270', 'ViewSonic', '/images/products/monitor/fad6c7e476fab9af384b18dfab45a9e2.256p.jpg', 'monitor', 7499.75, 151, NULL, '2022-11-20 19:15:09', NULL),
('d7bf4e84-f486-4520-9bd7-addad2a5f5de', 'Logitech MX MASTER 3S', 'Logitech', '/images/products/mouse/80f5ae114fd88013fa45e170e1098214.256p.jpg', 'mouse', 2499.75, 153, NULL, '2022-11-20 19:15:09', NULL),
('d8048443-6109-40e7-8374-76a3a39aae29', 'Samsung 980', 'Samsung', '/images/products/storagedrive/ca0b46376f072d2483c385bad50c6310.256p.jpg', 'storage drive', 1249.75, 160, NULL, '2022-11-21 12:00:58', NULL),
('d80eaa42-c81d-4161-96df-06510ba8e2f1', 'Asus TUF GAMING Z690-PLUS WIFI', 'Asus', '/images/products/mainboard/cad733cb884b68587c5bba18953445e6.256p.jpg', 'mainboard', 6424.75, 150, NULL, '2022-11-20 19:15:09', NULL),
('d81071ca-5e01-40ab-ae55-34c3e5973f3a', 'Samsung 970 Evo Plus', 'Samsung', '/images/products/storagedrive/25a1bf52562913032cce0b7a71b9e323.256p.jpg', 'storage drive', 1374.75, 176, NULL, '2022-11-21 12:00:58', NULL),
('d8711ff7-442a-43e4-9702-969554ffbfe2', 'Asus TUF GAMING OC', 'Asus', '/images/products/videocard/aa48845fa6594b8fc8322ca00900fe99.256p.jpg', 'video card', 23749.8, 157, NULL, '2022-11-20 19:15:09', NULL),
('d8a2fa5d-0a0b-47d2-996d-90ee092508e8', 'MSI B450-A PRO MAX', 'MSI', '/images/products/mainboard/491312c7eb6c3a47c8a7c53e063b397e.256p.jpg', 'mainboard', 3099.75, 59, NULL, '2022-11-20 19:15:09', NULL),
('d924b28d-8e80-48c2-9790-1d3225e851fe', 'LG 27GL650F-B', 'LG', '/images/products/monitor/51ZqNxY-PqL.jpg', 'monitor', 4872.5, 74, NULL, '2022-11-20 19:15:09', NULL),
('d973a7e3-3c91-439f-a15f-46dd2a7401e8', 'TEAMGROUP T-Force Delta RGB 32 GB', 'TEAMGROUP', '/images/products/ram/9237fcfa0365e5eb8ff469015b035b2b.256p.jpg', 'ram', 2449.75, 11, NULL, '2022-11-20 19:15:09', NULL),
('d9c67704-a774-4ed7-8961-9e3b7944253b', 'Acer V196HQLAb', 'Acer', '/images/products/monitor/c4e08facbd5aa9d4cead806f651ccb4e.med.256p.jpg', 'monitor', 1907.75, 89, NULL, '2022-11-20 19:15:09', NULL),
('da0dff6c-7d07-4fb1-8eb5-f92caba1fa1c', 'Corsair M65 PRO RGB FPS', 'Corsair', '/images/products/mouse/210af8afefd556ec530cecb5f7eb5cbd.256p.jpg', 'mouse', 727.5, 163, NULL, '2022-11-20 19:15:09', NULL),
('dadfe318-1e2a-44b7-9a04-d952a9fa7e4d', 'Dell S2721DGF', 'Dell', '/images/products/monitor/41FTz2RCpPL.jpg', 'monitor', 6749.75, 168, NULL, '2022-11-20 19:15:09', NULL),
('dae6fea9-e591-4aa0-b732-a60e3379bc58', 'Razer Viper Ultimate w/Dock', 'Razer', '/images/products/mouse/0164b1a008c25224ac32d76cd1223380.256p.jpg', 'mouse', 1874.75, 134, NULL, '2022-11-20 19:15:09', NULL),
('daff3363-f2cd-4dd9-a4a4-93caf0adf03f', 'Logitech MX Master 3', 'Logitech', '/images/products/mouse/d3a9b615f187bce607d610088fbbfdfd.256p.jpg', 'mouse', 2125, 68, NULL, '2022-11-20 19:15:09', NULL),
('db4539c0-941b-4587-8d7b-de838a65a995', 'G.Skill Trident Z5 RGB 32 GB', 'G.Skill', '/images/products/ram/6b1843041f6b75e1ecb1139e428bbfa1.256p.jpg', 'ram', 9499.75, 0, NULL, '2022-11-20 19:15:09', NULL),
('db9772a1-a378-49a3-aaf8-0aee921b3368', 'Logitech G305 (Black)', 'Logitech', '/images/products/mouse/0041ec7f09c5b96850347e2254991f73.256p.jpg', 'mouse', 904.5, 187, NULL, '2022-11-20 19:15:09', NULL),
('dc1289ab-0067-4309-b4a8-d85c6987713c', 'SteelSeries Aerox 3', 'SteelSeries', '/images/products/mouse/aa5f7764bd01a4136c66c6980fccd89e.256p.jpg', 'mouse', 2499.75, 106, NULL, '2022-11-20 19:15:09', NULL),
('dc3a0c32-568e-4d8c-b729-071640060e2c', 'MSI B450 TOMAHAWK MAX', 'MSI', '/images/products/mainboard/0a8a0ca77620c63b68fec6323537d50a.256p.jpg', 'mainboard', 3749.75, 89, NULL, '2022-11-20 19:15:09', NULL),
('dc430759-c837-4240-a4e2-627d415cf329', 'Corsair HARPOON RGB PRO', 'Corsair', '/images/products/mouse/4ca5b63fecc2a7fc4094c9da2c127ac8.256p.jpg', 'mouse', 668, 139, NULL, '2022-11-20 19:15:09', NULL),
('dc59ab92-6093-49b1-a65f-9584e4228e33', 'G.Skill Trident Z5 RGB 32 GB', 'G.Skill', '/images/products/ram/5468241c2bc267e0ebc4ed037b0d02b6.256p.jpg', 'ram', 5499.75, 173, NULL, '2022-11-20 19:15:09', NULL),
('dc748501-521a-44a6-a7a2-8f99a72d31cb', 'Corsair Vengeance 64 GB', 'Corsair', '/images/products/ram/b8aea6f3b11d161de3002b7e978ad889.256p.jpg', 'ram', 8249.75, 155, NULL, '2022-11-20 19:15:09', NULL),
('dc98a70a-84ab-4e12-bcbf-68c60675f914', 'Logitech G203 Lightsync', 'Logitech', '/images/products/mouse/b8e80e45051e0b167cbda318107448f9.256p.jpg', 'mouse', 499.5, 37, NULL, '2022-11-20 19:15:09', NULL),
('dccc257b-f98e-4b10-81c7-6aeb56efcb39', 'Asus VP228QG', 'Asus', '/images/products/monitor/7211175ddb6250cd402e6ea1f7639f71.256p.jpg', 'monitor', 2574.75, 83, NULL, '2022-11-20 19:15:09', NULL),
('dce55a66-96c0-43f7-afd6-1e3bba1688a1', 'Samsung 860 Evo', 'Samsung', '/images/products/storagedrive/41qR7C253KL.jpg', 'storage drive', 3475, 73, NULL, '2022-11-21 12:00:58', NULL),
('dce7a339-e93d-435a-80e6-f864c255f1e6', 'Razer DeathAdder V2', 'Razer', '/images/products/mouse/314e9xMJUhL.jpg', 'mouse', 1074.75, 70, NULL, '2022-11-20 19:15:09', NULL),
('dd674f07-35c3-45b7-8229-9485695a7599', 'Intel Limited Edition', 'Intel', '/images/products/videocard/f14957b7bfc2999caa2382f3e0f3d1af.256p.jpg', 'video card', 24.75, 118, NULL, '2022-11-20 19:15:09', NULL),
('de60b785-4015-4d09-9934-5ff263b9db54', 'Asus Prime B450M-A II', 'Asus', '/images/products/mainboard/dbeb8cc8ade3dfcbfed111e7b3b4d00f.256p.jpg', 'mainboard', 1999.75, 167, NULL, '2022-11-20 19:15:09', NULL),
('de6f2db6-0ffb-4e52-bf73-308e87c86fe5', 'ASRock B550M-ITX/ac', 'ASRock', '/images/products/mainboard/515LtxB77aL.jpg', 'mainboard', 3224.75, 152, NULL, '2022-11-20 19:15:09', NULL),
('df47c9bf-454e-4b1a-946d-577f4743fe01', 'AMD Ryzen 3 4100', 'AMD', '/images/products/cpu/amd-ryzen-3-4100.jpg', 'cpu', 2850, 144, NULL, '2022-11-21 01:57:07', NULL),
('e03e2000-f301-4db7-84f2-18186c18c228', 'Intel Core i3-12100', 'Intel', '/images/products/cpu/intel-core-i3-12100.jpg', 'cpu', 3449.75, 189, NULL, '2022-11-21 01:57:07', NULL),
('e0e5fc07-635e-4c47-8da2-28ab429f9dc6', 'Asus TUF GAMING VG259QM', 'Asus', '/images/products/monitor/4a15d08226d960b85040c9a8e9d00406.256p.jpg', 'monitor', 6975, 117, NULL, '2022-11-20 19:15:09', NULL),
('e16fe356-a5fb-41c1-a5c6-e9f045dc43ca', 'Samsung 970 Evo Plus', 'Samsung', '/images/products/storagedrive/25a1bf52562913032cce0b7a71b9e323.256p.jpg', 'storage drive', 1875, 165, NULL, '2022-11-21 12:00:58', NULL),
('e2be46d7-071b-40f3-b0a9-7f239f59097d', 'Asus TUF GAMING X570-PLUS (WI-FI)', 'Asus', '/images/products/mainboard/8d7d0435e8a2af93b5d91a1a5dccd476.256p.jpg', 'mainboard', 4786.5, 27, NULL, '2022-11-20 19:15:09', NULL),
('e424075e-5f09-4e0a-806b-4855c0c119da', 'Crucial MX500', 'Crucial', '/images/products/storagedrive/24739d2c05e810fd8c8d6883e6ed10fe.256p.jpg', 'storage drive', 4289.75, 138, NULL, '2022-11-21 12:00:58', NULL),
('e425e30b-2f2f-4f5a-a922-e139e80613be', 'TEAMGROUP T-Create Expert 16 GB', 'TEAMGROUP', '/images/products/ram/ab82ba7617245224a22e77deb7a1639a.256p.jpg', 'ram', 1024.75, 82, NULL, '2022-11-20 19:15:09', NULL),
('e446a374-b0b0-4139-8663-70143e281e92', 'G.Skill Trident Z RGB 32 GB', 'G.Skill', '/images/products/ram/651e52933a7f98c203f3f1a88ff442cb.256p.jpg', 'ram', 3849.75, 45, NULL, '2022-11-20 19:15:09', NULL),
('e491e81a-e1cf-4461-a565-c6d763b8fe74', 'Asus ROG STRIX GAMING OC', 'Asus', '/images/products/videocard/9f7b45a2816c45ea9449e8ca2bf6f616.256p.jpg', 'video card', 92499.8, 132, NULL, '2022-11-20 19:15:09', NULL),
('e49f386d-95d3-42b4-8c50-84efee8bc010', 'AMD Ryzen 5 5500', 'AMD', '/images/products/cpu/amd-ryzen-5-5500.jpg', 'cpu', 2475, 165, NULL, '2022-11-21 01:57:07', NULL),
('e66c9a86-1a9c-4609-a5e0-2cec4c00c0ab', 'ASRock Phantom Gaming D OC', 'ASRock', '/images/products/videocard/21611b3156fcc3c64b6bc7f9ecb183ef.256p.jpg', 'video card', 16249.2, 95, NULL, '2022-11-20 19:15:09', NULL),
('e6cc7e14-cd47-41c6-9a21-ac02505a45b7', 'Alienware AW3423DW', 'Alienware', '/images/products/monitor/41v-UZbUi5L.jpg', 'monitor', 29999.8, 40, NULL, '2022-11-20 19:15:09', NULL),
('e6ff8ccc-a0b0-49de-aac8-6bb6a1a9e587', 'G.Skill Trident Z RGB 16 GB', 'G.Skill', '/images/products/ram/d19422479fca6e5117bb55db3d25eac2.256p.jpg', 'ram', 1899.75, 148, NULL, '2022-11-20 19:15:09', NULL),
('e761c54d-c32f-4aed-a0d2-9bc2c16ef6bd', 'Silicon Power A55', 'Silicon', '/images/products/storagedrive/abd3fcbc74da1452f2d459e37ff9a107.256p.jpg', 'storage drive', 674.75, 192, NULL, '2022-11-21 12:00:58', NULL),
('e764fb8f-816d-497a-a33f-168f77300fa1', 'Corsair Vengeance LPX 16 GB', 'Corsair', '/images/products/ram/ae9c14173c768f2fa9ad4d3c957e94a0.256p.jpg', 'ram', 1324.75, 147, NULL, '2022-11-20 19:15:09', NULL),
('e76bed0b-c965-4dc0-b5c0-047726d1cdd3', 'Intel Core i5-12400', 'Intel', '/images/products/cpu/intel-core-i5-12400.jpg', 'cpu', 4749.75, 41, NULL, '2022-11-21 01:57:07', NULL),
('e7806e22-f29e-46a0-8342-266cf555fcc6', 'Samsung C24F390', 'Samsung', '/images/products/monitor/3dd2cdfad48aba22d4f62e6022ef0c2c.256p.jpg', 'monitor', 2999.75, 183, NULL, '2022-11-20 19:15:09', NULL),
('e7d4daa8-b69c-438c-8355-e08e8c1ba089', 'Crucial P2', 'Crucial', '/images/products/storagedrive/ce4fd57ee655bf400a82aa84f6ec7ac5.256p.jpg', 'storage drive', 874.75, 182, NULL, '2022-11-21 12:00:58', NULL),
('e80ef470-61f1-4670-9e0d-c2ea0f3bd2a9', 'Corsair Vengeance RGB Pro 32 GB', 'Corsair', '/images/products/ram/4a3188102447720082ab1fc63606662f.256p.jpg', 'ram', 3749.75, 163, NULL, '2022-11-20 19:15:09', NULL),
('e882c5ac-ce04-4fcb-bf0e-cc23057f3318', 'SteelSeries Rival 650 Wireless', 'SteelSeries', '/images/products/mouse/e44e0fffdc546ccc18ec9db334d7c71f.256p.jpg', 'mouse', 1998.75, 52, NULL, '2022-11-20 19:15:09', NULL),
('e8907455-e762-40aa-95d3-bb8d9e46b037', 'Gigabyte M27Q-X', 'Gigabyte', '/images/products/monitor/612fd94f94b440e7aed0cf57479d645b.256p.jpg', 'monitor', 15999.8, 160, NULL, '2022-11-20 19:15:09', NULL),
('e894c0f9-1eab-4b74-a944-7ba92e522e99', 'G.Skill Trident Z Neo 16 GB', 'G.Skill', '/images/products/ram/d62078e82b57dca6362b1485f39e1064.256p.jpg', 'ram', 2349.75, 160, NULL, '2022-11-20 19:15:09', NULL),
('e8965959-6f83-45f5-b204-c5de79190dd2', 'Sceptre E205W-16003R', 'Sceptre', '/images/products/monitor/41DrRAcW9qL.jpg', 'monitor', 1999.25, 94, NULL, '2022-11-20 19:15:09', NULL),
('e8975871-91e4-40d1-90b7-7261a95b5206', 'Gigabyte WINDFORCE', 'Gigabyte', '/images/products/videocard/9a284de0d4b02e129305b617ec408a4f.256p.jpg', 'video card', 54124.5, 105, NULL, '2022-11-20 19:15:09', NULL),
('e8aad653-9ad2-4af7-baba-dc0d58ad9de7', 'Samsung 970 Evo Plus', 'Samsung', '/images/products/storagedrive/326881d073c1b667bd348893696c690e.256p.jpg', 'storage drive', 2736.75, 5, NULL, '2022-11-21 12:00:58', NULL),
('e8dc0b01-a022-44ad-b19c-ca77077c5531', 'Corsair Vengeance RGB 32 GB', 'Corsair', '/images/products/ram/b2d107d629e656f9f435ce9bd604f7e0.256p.jpg', 'ram', 9624.75, 192, NULL, '2022-11-20 19:15:09', NULL),
('e92318d5-1166-4a31-bcd2-90536ca70cc6', 'productName', 'AMD', 'productPhoto', 'cpu', 25000000, 0, '2022-12-11 11:14:50', '2022-12-10 00:41:53', '2022-12-11 11:14:50'),
('e9675442-4988-479e-ae2b-34ccffdb088e', 'Intel Core i5-10400F', 'Intel', '/images/products/cpu/intel-core-i5-10400f.jpg', 'cpu', 3224.75, 98, NULL, '2022-11-21 01:57:07', NULL),
('ea180440-b5b1-40c4-b9d2-c742106b9f94', 'EVGA FTW3 ULTRA GAMING', 'EVGA', '/images/products/videocard/41wNSzchLVS.jpg', 'video card', 21249.8, 142, NULL, '2022-11-20 19:15:09', NULL),
('ea1bed3c-4c9e-4309-b44a-7ddcb1a8200a', 'TEAMGROUP T-Force Dark Za 32 GB', 'TEAMGROUP', '/images/products/ram/130610fae2d17d8fba6193d3fdb704c0.256p.jpg', 'ram', 2249.75, 151, NULL, '2022-11-20 19:15:09', NULL),
('ea9bc75c-1aa9-4b46-8954-65aca5c8217f', 'G.Skill Trident Z5 RGB 32 GB', 'G.Skill', '/images/products/ram/I/31JXcCFBoFL.jpg', 'ram', 6249.75, 65, NULL, '2022-11-20 19:15:09', NULL),
('eb0b4ac4-f26e-4a1f-be68-06a1a0d584f8', 'Asus TUF GAMING X670E-PLUS WIFI', 'Asus', '/images/products/mainboard/51VrAy4J9BL.jpg', 'mainboard', 8249.75, 163, NULL, '2022-11-20 19:15:09', NULL),
('eb76d805-2c5a-4dd8-945f-3c41a3d4ae55', 'Zotac GAMING Trinity OC', 'Zotac', '/images/products/videocard/61f1eb7fc69a355bc44f789eb3644037.256p.jpg', 'video card', 31249.8, 150, NULL, '2022-11-20 19:15:09', NULL),
('eba11033-dbb1-4c30-bd3e-c3185a5f63bb', 'Gigabyte GAMING OC', 'Gigabyte', '/images/products/videocard/de25fa21241e697179b2c8fc7ed05a5c.256p.jpg', 'video card', 7124.75, 124, NULL, '2022-11-20 19:15:09', NULL),
('ebd0a778-caee-446d-b281-60288bf34a66', 'MSI MPG Z690 CARBON WIFI', 'MSI', '/images/products/mainboard/585ed44aad3928449cdc1dfdd2b1f4ac.256p.jpg', 'mainboard', 9249.75, 135, NULL, '2022-11-20 19:15:09', NULL),
('ebfe9e31-6960-4a36-9fff-f95db4e98a29', 'Glorious Model O', 'Glorious', '/images/products/mouse/4224f428c644018d89a196bc67631462.256p.jpg', 'mouse', 1789.75, 110, NULL, '2022-11-20 19:15:09', NULL),
('ec127b92-3645-4fec-a7e1-c551b8038034', 'Asus TUF GAMING OC', 'Asus', '/images/products/videocard/aad13fe8bd65290566bc0b7be30a1212.256p.jpg', 'video card', 24.75, 167, NULL, '2022-11-20 19:15:09', NULL),
('eca336be-9025-4dc9-981d-ace756c22164', 'Asus VG278Q', 'Asus', '/images/products/monitor/5c00380802ac4cbcfe415b476f106153.256p.jpg', 'monitor', 5992.5, 98, NULL, '2022-11-20 19:15:09', NULL),
('ecb9138c-50c5-48bf-a091-898a974388df', 'XFX Speedster SWFT 210', 'XFX', '/images/products/videocard/9dfd9338635c909cdc810e266474b18d.256p.jpg', 'video card', 5749.75, 33, NULL, '2022-11-20 19:15:09', NULL),
('ecfe3748-0fad-4565-9ab1-2e09e72bfda1', 'Western Digital Black SN750', 'Western Digital', '/images/products/storagedrive/0e711f3edb98f9680cc528271201d8d2.256p.jpg', 'storage drive', 3475, 82, NULL, '2022-11-21 12:00:58', NULL),
('ed364aee-8333-40f5-8b63-b99c2ecf5dfe', 'Corsair SCIMITAR RGB ELITE', 'Corsair', '/images/products/mouse/dfb52b07215736a9d55388366a53d86a.256p.jpg', 'mouse', 1624.5, 26, NULL, '2022-11-20 19:15:09', NULL),
('edd2f6f7-2d7a-4336-a126-0be645915570', 'MSI PRO B660M-A WIFI DDR4', 'MSI', '/images/products/mainboard/3cbf74a6886df1b73c6db3935b1b24e1.256p.jpg', 'mainboard', 3749.75, 88, NULL, '2022-11-20 19:15:09', NULL),
('ee110ca0-46d4-4531-b818-998184e7e817', 'AMD Ryzen 7 5800X', 'AMD', '/images/products/cpu/amd-ryzen-7-5800x.jpg', 'cpu', 6085.75, 144, NULL, '2022-11-21 01:57:07', NULL),
('ee2b9dc7-1e81-4d11-8626-e1d643177ef2', 'Samsung 980', 'Samsung', '/images/products/storagedrive/2aff821ed66963cb32fb0c71b093eccc.256p.jpg', 'storage drive', 2482.5, 54, NULL, '2022-11-21 12:00:58', NULL),
('ee972913-3f48-48da-893b-5528c1079695', 'Kingston FURY Beast 16 GB', 'Kingston', '/images/products/ram/547d30a3ba49dc763a8c23b28f7ac74b.256p.jpg', 'ram', 2249.75, 184, NULL, '2022-11-20 19:15:09', NULL),
('ef131839-941b-419f-8980-c4db95103efb', 'G.Skill Ripjaws V 32 GB', 'G.Skill', '/images/products/ram/dcd11301eb1903a0859237240193174b.256p.jpg', 'ram', 2524.75, 119, NULL, '2022-11-20 19:15:09', NULL),
('ef19377d-5105-4ede-9361-1b44343c5eb7', 'Corsair SABRE RGB PRO CHAMPION SERIES', 'Corsair', '/images/products/mouse/4702f2380d91265aab43664f32e7cb8f.256p.jpg', 'mouse', 1449.75, 100, NULL, '2022-11-20 19:15:09', NULL),
('ef1c7678-6a75-4af7-b4d2-93660a7df2ce', 'Asus TUF Gaming VG24VQ', 'Asus', '/images/products/monitor/9fbc7a9308c57726935637c8f053e1f6.256p.jpg', 'monitor', 3975, 46, NULL, '2022-11-20 19:15:09', NULL),
('ef715643-0401-4507-88bd-058a6361901a', 'Intel Core i7-10700', 'Intel', '/images/products/cpu/intel-core-i7-10700.jpg', 'cpu', 6724.75, 93, NULL, '2022-11-21 01:57:07', NULL),
('efbaec2a-85a8-4597-97ca-303fcd9a7853', 'Asus PRIME B660-PLUS D4', 'Asus', '/images/products/mainboard/5dd842664e7633f330f43db654431014.256p.jpg', 'mainboard', 3499.75, 91, NULL, '2022-11-20 19:15:09', NULL),
('efd619c9-2226-4642-9379-485e2470864f', 'Seagate Barracuda Compute', 'Seagate', '/images/products/storagedrive/c7b5b7dacbecdcdd0e073b761193eef6.256p.jpg', 'storage drive', 1249.75, 167, NULL, '2022-11-21 12:00:58', NULL),
('f03b30f2-0776-4bb1-aae3-083ae96111d5', 'MSI GAMING Z TRIO', 'MSI', '/images/products/videocard/8171265bd9416899266c05bbf5b55d19.256p.jpg', 'video card', 21149.8, 180, NULL, '2022-11-20 19:15:09', NULL),
('f0a00048-86f4-4bd8-9167-cb761936edfd', 'MSI Optix G241', 'MSI', '/images/products/monitor/8bfd1e864048a5c5234dd2d4cb13dc61.256p.jpg', 'monitor', 4499.75, 190, NULL, '2022-11-20 19:15:09', NULL),
('f18f1268-bd68-4714-b834-ef6da534ee28', 'NZXT Lift', 'NZXT', '/images/products/mouse/f413ef023ef6470d1fc4e581ee15314a.256p.jpg', 'mouse', 1049.75, 29, NULL, '2022-11-20 19:15:09', NULL),
('f1fef595-33a4-4d85-a48a-43db3574c4f6', 'G.Skill Trident Z Royal 32 GB', 'G.Skill', '/images/products/ram/5f0811018cd80527d23610ce976a39ce.256p.jpg', 'ram', 3749.75, 48, NULL, '2022-11-20 19:15:09', NULL),
('f26e5c40-8e04-44dc-b3e9-28c0c85126df', 'Sapphire PULSE', 'Sapphire', '/images/products/videocard/31sjIyeTJJL.jpg', 'video card', 5499.75, 40, NULL, '2022-11-20 19:15:09', NULL),
('f26f107f-86ba-4568-a32e-a4487e0484a5', 'Razer Orochi V2', 'Razer', '/images/products/mouse/5b65da659333a26f6624d15733414fff.256p.jpg', 'mouse', 999.75, 68, NULL, '2022-11-20 19:15:09', NULL),
('f2974b00-e55e-4b87-94e1-6d5d64af5d82', 'NVIDIA Founders Edition', 'NVIDIA', '/images/products/videocard/07ff8dc03a65e34edc811c97d838af9a.256p.jpg', 'video card', 61575, 128, NULL, '2022-11-20 19:15:09', NULL),
('f2c1dac1-8741-48bd-903e-ab03bf01690f', 'Corsair Dominator Platinum RGB 32 GB', 'Corsair', '/images/products/ram/80d3d3bd860b72c7ebcce698e93664cd.256p.jpg', 'ram', 5124.75, 61, NULL, '2022-11-20 19:15:09', NULL),
('f2e2f4a4-651e-4bec-b502-dfd251a4a80c', 'Intel Core i3-10105F', 'Intel', '/images/products/cpu/intel-core-i3-10105f.jpg', 'cpu', 1999.25, 56, NULL, '2022-11-21 01:57:07', NULL),
('f31e375d-5d26-420b-9a13-d74f2633727c', 'Corsair Vengeance RGB Pro 16 GB', 'Corsair', '/images/products/ram/2acf8a36c3350a47689e36ee924c80f7.256p.jpg', 'ram', 1949.5, 103, NULL, '2022-11-20 19:15:09', NULL),
('f41efddd-f7e6-4387-ba40-29ba2972a0e5', 'Intel Core i7-7700K', 'Intel', '/images/products/cpu/intel-core-i7-7700k.jpg', 'cpu', 8875, 83, NULL, '2022-11-21 01:57:07', NULL),
('f484c3c1-c4aa-4b0b-b28d-4001ba9bf416', 'Dell UP3218K', 'Dell', '/images/products/monitor/5f64987eba5fabbd2376dc5cce2726ab.256p.jpg', 'monitor', 99249.8, 63, NULL, '2022-11-20 19:15:09', NULL),
('f4a2bc72-564d-4527-9b48-587c9182db05', 'Razer Naga Trinity', 'Razer', '/images/products/mouse/6b73ce755ef3fdebd30ac433ab829664.256p.jpg', 'mouse', 1999.5, 178, NULL, '2022-11-20 19:15:09', NULL),
('f4c8337e-37ad-4e67-8329-c888d0b15b87', 'Gigabyte Z790 AORUS ELITE AX', 'Gigabyte', '/images/products/mainboard/ba20600286bf8f74ce71df37ed8aef65.256p.jpg', 'mainboard', 8377.5, 175, NULL, '2022-11-20 19:15:09', NULL),
('f5501849-ef82-4a68-9d12-685304eaef9e', 'Crucial P2', 'Crucial', '/images/products/storagedrive/1533ee97447785234f3c72a4ef452986.256p.jpg', 'storage drive', 1649.5, 112, NULL, '2022-11-21 12:00:58', NULL),
('f5cdbf1c-81af-4161-b915-0fefc79e69be', 'Logitech G600 MMO Gaming Mouse', 'Logitech', '/images/products/mouse/d86fec800f132dbefa676d13d0d9a7a4.256p.jpg', 'mouse', 974.75, 106, NULL, '2022-11-20 19:15:09', NULL),
('f607dc03-587d-4cbb-b61f-3d2a8b414533', 'AMD Ryzen 7 2700X', 'AMD', '/images/products/cpu/amd-ryzen-7-2700x.jpg', 'cpu', 5750, 89, NULL, '2022-11-21 01:57:07', NULL),
('f6a6fd6c-405d-4c34-a9da-5001e16fbe6e', 'Kingston A400', 'Kingston', '/images/products/storagedrive/97e2bd828644767c8a80b71f8cb14743.256p.jpg', 'storage drive', 474.5, 51, NULL, '2022-11-21 12:00:58', NULL),
('f7b479a3-303b-4c77-9e20-4a697f8cf746', 'productName', 'AMD', 'productPhoto', 'cpu', 0, 0, '2022-12-11 11:14:53', '2022-12-10 00:35:04', '2022-12-11 11:14:53'),
('f849c7a1-71c3-45c4-b795-d623d9e66fd8', 'Logitech G Pro X Superlight', 'Logitech', '/images/products/mouse/31Ub3hpjHWL.jpg', 'mouse', 3286.25, 149, NULL, '2022-11-20 19:15:09', NULL),
('f89c8ae7-44ea-413c-ad26-3e14a0eb6b15', 'Corsair Dominator Platinum RGB 64 GB', 'Corsair', '/images/products/ram/4c201639021aacf174e4a7cae917dab8.256p.jpg', 'ram', 7499.75, 92, NULL, '2022-11-20 19:15:09', NULL),
('f8e219b3-4890-4d8a-9bd5-062ec8d9aadf', 'Razer DeathAdder V3 Pro', 'Razer', '/images/products/mouse/21RzGl38CsL.jpg', 'mouse', 3562.25, 141, NULL, '2022-11-20 19:15:09', NULL),
('f9265435-5a9c-43dc-bab3-f3f8e73c114b', 'Intel Core i5-12600KF', 'Intel', '/images/products/cpu/intel-core-i5-12600kf.jpg', 'cpu', 6624.75, 126, NULL, '2022-11-21 01:57:07', NULL),
('f99ec9ba-9f79-4d37-baa7-d20e8fe1992d', 'Asus PRIME X570-PRO', 'Asus', '/images/products/mainboard/b06a90d7ec5a485121a21751cdc3d9b9.256p.jpg', 'mainboard', 5224.75, 137, NULL, '2022-11-20 19:15:09', NULL),
('fa2cb150-8472-496c-ae09-600f20ce2dee', 'Intel Core i7-12700KF', 'Intel', '/images/products/cpu/intel-core-i7-12700kf.jpg', 'cpu', 8974.25, 105, NULL, '2022-11-21 01:57:07', NULL),
('fa77aab9-6115-4d50-b8a4-3f606bae07af', 'Gigabyte GAMING OC', 'Gigabyte', '/images/products/videocard/617a916f25cb36e68d2d7289f150970b.256p.jpg', 'video card', 34497.5, 79, NULL, '2022-11-20 19:15:09', NULL),
('faec18d0-3f92-46d9-99a7-23cf7783ae94', 'Gigabyte B550 AORUS ELITE V2', 'Gigabyte', '/images/products/mainboard/41196fe18ce134d254b96a4e5cac7fa2.256p.jpg', 'mainboard', 3999.75, 17, NULL, '2022-11-20 19:15:09', NULL),
('fbcac052-52d6-4833-ae60-d2f3c10f1ec0', 'Intel Core i5-11600K', 'Intel', '/images/products/cpu/intel-core-i5-11600k.jpg', 'cpu', 6399.75, 58, NULL, '2022-11-21 01:57:07', NULL),
('fbdf246c-9cc7-4763-8614-4c956f345d5e', 'Corsair Vengeance LPX 16 GB', 'Corsair', '/images/products/ram/a6bc524a20044391ce45243b01ea1694.256p.jpg', 'ram', 1724.75, 73, NULL, '2022-11-20 19:15:09', NULL),
('fcbca153-aa45-4f52-a6bc-e9ca76c6e17b', 'MSI GeForce RTX 2060 VENTUS GP OC', 'MSI', '/images/products/videocard/4160TRnJpqL.jpg', 'video card', 6749.75, 59, NULL, '2022-11-20 19:15:09', NULL),
('fcec7a21-c72a-4b6b-bf4a-9e547d8416aa', 'G.Skill Trident Z5 RGB 64 GB', 'G.Skill', '/images/products/ram/44cd07d2aed82a27d4d6119d4f7d93f6.256p.jpg', 'ram', 11999.8, 96, NULL, '2022-11-20 19:15:09', NULL),
('fd1d21ce-785b-45ba-a0a3-c78b2265a8f6', 'EVGA KO ULTRA GAMING', 'EVGA', '/images/products/videocard/932e869ee03855291c9d97907dd1832d.256p.jpg', 'video card', 6749.75, 23, NULL, '2022-11-20 19:15:09', NULL),
('fd5c2731-fd18-4694-828e-9ef036378118', 'G.Skill Trident Z RGB 16 GB', 'G.Skill', '/images/products/ram/I/41W2Vvt5MoL.jpg', 'ram', 1699.75, 147, NULL, '2022-11-20 19:15:09', NULL),
('fec9af08-1631-47e6-a815-c63a3885200a', 'Gigabyte GV-R68XTGAMING OC-16GD', 'Gigabyte', '/images/products/videocard/ed3424efa1d2cb68214ab9b888754a2f.256p.jpg', 'video card', 18873.2, 160, NULL, '2022-11-20 19:15:09', NULL),
('feee173d-cfc9-4dd7-9e0d-b71a1cca1c16', 'Gigabyte M27F A', 'Gigabyte', '/images/products/monitor/c63b7e000d014e4786af12189da17df7.256p.jpg', 'monitor', 6499.75, 31, NULL, '2022-11-20 19:15:09', NULL),
('ff648c16-1571-4922-8ac1-bc8d532b28a8', 'Logitech G502 X Plus', 'Logitech', '/images/products/mouse/313vjNMPw3L.jpg', 'mouse', 3799.75, 171, NULL, '2022-11-20 19:15:09', NULL),
('fff7417b-2ea4-4378-92ba-118c5ea8e197', 'Corsair Vengeance 32 GB', 'Corsair', '/images/products/ram/I/31szLQRvwqL.jpg', 'ram', 3249.75, 58, NULL, '2022-11-20 19:15:09', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_types`
--

DROP TABLE IF EXISTS `product_types`;
CREATE TABLE IF NOT EXISTS `product_types` (
  `productType` char(36) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `photo` char(255) DEFAULT NULL,
  PRIMARY KEY (`productType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT IGNORE INTO `product_types` (`productType`, `description`, `photo`) VALUES
('cpu', NULL, NULL),
('mainboard', NULL, NULL),
('monitor', NULL, NULL),
('mouse', NULL, NULL),
('ram', NULL, NULL),
('storage drive', NULL, NULL),
('video card', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rams`
--

DROP TABLE IF EXISTS `rams`;
CREATE TABLE IF NOT EXISTS `rams` (
  `ramId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `latency` int(11) DEFAULT NULL,
  `cas` int(11) DEFAULT NULL,
  `pricePerGb` int(11) DEFAULT NULL,
  PRIMARY KEY (`ramId`),
  UNIQUE KEY `id_UNIQUE` (`ramId`),
  KEY `standard` (`standard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rams`
--

INSERT IGNORE INTO `rams` (`ramId`, `capacity`, `speed`, `standard`, `module`, `color`, `latency`, `cas`, `pricePerGb`) VALUES
('0235630a-5c93-48fc-a4a4-b52682399016', 16, 3600, 'DDR4', '2 x 8GB', 'Black / Silver', 10, 18, 3),
('035e9336-eba2-4c41-bb51-fd28adfa873d', 32, 6200, 'DDR5', '2 x 16GB', 'Black', 12, 36, 11),
('04dfb704-8e15-4b2f-b2f7-b6b389609e0b', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 10, 18, 3),
('0631b438-c1b7-44fc-8f40-cd7fd46abfa6', 32, 5200, 'DDR5', '2 x 16GB', 'Black / Silver', 15, 40, 5),
('07b65a08-2f81-4f39-a3c1-472b997d55cf', 2, 667, 'DDR2', '1 x 2GB', 'Green', 15, 5, 6),
('081d93b0-30a3-4f23-a407-10eb02182108', 32, 6000, 'DDR5', '2 x 16GB', 'Black', 10, 30, 7),
('09caf6f8-3e6d-4bae-aeed-3aaa6f09d93a', 32, 3200, 'DDR4', '2 x 16GB', 'Black / Yellow', 10, 16, 3),
('0d3f6a81-e194-4b7a-8def-525b2840a051', 64, 3600, 'DDR4', '4 x 16GB', 'Black', 10, 18, 4),
('0df38cc7-e0ac-4e1f-b666-92e50e6e4840', 32, 4800, 'DDR5', '2 x 16GB', 'Black / Silver', 16, 38, 5),
('0f737e8c-4329-4d38-bb95-dd325057c40b', 16, 3200, 'DDR4', '2 x 8GB', 'Red / Black', 10, 16, 3),
('12731fe4-444c-4eff-be7e-44441094d148', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 6),
('131c4488-7f0d-48f7-8706-3122439a7c1f', 16, 3200, 'DDR4', '2 x 8GB', 'Black / Gray', 10, 16, 3),
('135c6b25-31d5-41ea-b1ed-168152a0b99a', 64, 5200, 'DDR5', '2 x 32GB', 'Black', 15, 40, 4),
('1430b398-682c-48b3-a767-5085d203fe67', 32, 5600, 'DDR5', '2 x 16GB', 'White', 13, 36, 12),
('16f5a1a0-abbe-42aa-82e4-a272195c818d', 64, 3200, 'DDR4', '2 x 32GB', 'Black / Yellow', 10, 16, 3),
('1f0da663-0f26-428c-91e9-5f75f61fb561', 16, 3600, 'DDR4', '2 x 8GB', 'White', 10, 18, 4),
('25a0c20a-0a93-4d17-8bea-4cc0f33d7a22', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 10, 18, 3),
('26f5d2d8-4ed1-407e-9fca-2f14ed49026f', 32, 6000, 'DDR5', '2 x 16GB', 'Black', 12, 36, 6),
('28aff048-dc8a-407e-9f0b-59f5d8d544b1', 16, 3200, 'DDR4', '2 x 8GB', 'Black / Silver', 10, 16, 7),
('2bf87014-e089-47b6-bcea-17606358a325', 64, 3600, 'DDR4', '2 x 32GB', 'Black', 10, 18, 3),
('2c226346-ee6a-4f53-92df-9642206109df', 16, 3200, 'DDR4', '2 x 8GB', 'White', 10, 16, 5),
('2c90b498-f85a-4fdf-9874-fadc0f145bcb', 32, 3600, 'DDR4', '2 x 16GB', 'White / Black', 10, 18, 4),
('34e9bbe6-8e33-4c85-87d0-6e1a63f442a3', 32, 6600, 'DDR5', '2 x 16GB', 'Black', 10, 34, 8),
('3d7ab8ef-050e-4d0a-9c54-7de7a045213e', 32, 2666, 'DDR4', '2 x 16GB', 'Black / Yellow', 12, 16, 4),
('40e70506-3bd1-4e3f-8b47-8e065d01dc85', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 4),
('4473cc87-4753-4211-b9db-0820e042f223', 16, 3200, 'DDR4', '2 x 8GB', 'Silver', 14, 22, 3),
('46c09484-ead9-4cc0-b863-aeaf2efd0989', 32, 3200, 'DDR4', '4 x 8GB', 'Black', 10, 16, 5),
('4a95015a-e698-498b-8cd1-ad9bf1ea8548', 64, 3600, 'DDR4', '2 x 32GB', 'Black', 10, 18, 3),
('4af4bf6b-96c0-423e-881a-fe96ad3f73a7', 32, 5600, 'DDR5', '2 x 16GB', 'White / Black', 13, 36, 31),
('4af90933-dce6-42d3-9e4e-13f0ce586110', 8, 2400, 'DDR4', '1 x 8GB', 'Black / Yellow', 13, 16, 4),
('4e88a97c-38cb-4d85-9264-d512732178cb', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 3),
('51260211-81e4-4fa5-accb-45ae5d726909', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 9, 16, 4),
('52610dc8-bdef-4499-be89-8e2c1682e4d1', 64, 6000, 'DDR5', '2 x 32GB', 'Black', 10, 30, 8),
('556f5a39-dd86-4229-a759-35a905a330b7', 16, 1600, 'DDR3', '2 x 8GB', 'Black / Yellow', 11, 9, 5),
('56078325-8804-45d6-baff-4d7b4590c8d9', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 10, 18, 3),
('5b27c88e-d11b-48d7-ac00-53aeb1312bde', 32, 5200, 'DDR5', '2 x 16GB', 'Black', 15, 40, 5),
('5be4cbac-d756-40df-8b79-f9f6af03cb0b', 32, 5600, 'DDR5', '2 x 16GB', 'Black', 13, 36, 5),
('6051ee7a-1514-44e9-a949-cc4f94187878', 16, 3200, 'DDR4', '2 x 8GB', 'Black / Yellow', 10, 16, 4),
('6206c84c-9794-4a4e-b5f9-8e85994ee398', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 9, 16, 4),
('67904025-9fec-4f9d-a234-dd2b769ad373', 32, 3200, 'DDR4', '2 x 16GB', 'Black', 10, 16, 3),
('6bb7d3e6-6e69-4c21-a8e5-7e65b703fa5f', 32, 5600, 'DDR5', '2 x 16GB', 'White', 13, 36, 7),
('6bfbb964-404e-4dee-9664-ec9f55109392', 16, 3200, 'DDR4', '2 x 8GB', 'Blue', 10, 16, 3),
('6f8aeb3d-7e01-4b77-a15a-798509b6a8d8', 32, 6000, 'DDR5', '2 x 16GB', 'Silver / Black', 13, 40, 6),
('7388a062-ec8c-4165-9e73-f73f64c09a7e', 32, 3200, 'DDR4', '2 x 16GB', 'White', 10, 16, 4),
('76f627ff-9888-4900-80e2-9bf3a0592bc5', 32, 3600, 'DDR4', '2 x 16GB', 'Black / Yellow', 9, 16, 4),
('7b8c4e44-3604-4d8a-bd06-819a1eae8edc', 32, 3600, 'DDR4', '4 x 8GB', 'Black / Yellow', 10, 18, 4),
('7cb21bbf-42b5-4f7a-a675-0bebd4d9b41c', 32, 7200, 'DDR5', '2 x 16GB', 'Black / White', 9, 34, 12),
('7d7fea7f-c654-4ba6-8260-25935c019b2a', 32, 5600, 'DDR5', '2 x 16GB', 'Black', 13, 36, 5),
('7e475236-13fb-42cd-8b5c-28ddc062a469', 32, 5200, 'DDR5', '2 x 16GB', 'White', 15, 40, 5),
('8422ee70-57f1-4968-baf7-53f4d64de2c5', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 10, 18, 4),
('86219cd6-2f6a-4558-b110-ac1d25f190e6', 32, 3200, 'DDR4', '2 x 16GB', 'Black', 10, 16, 3),
('877ca18e-fd24-48c6-861f-2a460e01d77d', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 9, 16, 4),
('8ce8d6d3-ab39-496d-80ec-02169ab84f4c', 32, 3600, 'DDR4', '2 x 16GB', 'Black / Silver', 9, 16, 5),
('924b4899-fe81-4f50-ab2d-b3b21fd87b78', 32, 3200, 'DDR4', '2 x 16GB', 'Gray', 10, 16, 2),
('93fbdfb6-cd96-4255-a9f6-175fb7b8e7ba', 32, 3200, 'DDR4', '2 x 16GB', 'Black', 10, 16, 3),
('94d9c303-27a6-42a9-b87d-aa018ed032af', 16, 5200, 'DDR5', '2 x 8GB', 'Black', 15, 40, 7),
('94f96c42-b709-45b2-805b-255daf15c8b8', 64, 5600, 'DDR5', '2 x 32GB', 'Black', 14, 40, 7),
('9647ef89-f8a2-452c-88d5-2c46d0d2f839', 16, 3600, 'DDR4', '2 x 8GB', 'White', 10, 18, 5),
('9974aecf-9276-41c7-9262-0e2ba1dea8de', 32, 3600, 'DDR4', '2 x 16GB', 'Black / Yellow', 10, 18, 3),
('9bae4e46-6fee-4069-b942-d888b7767ef1', 32, 3600, 'DDR4', '2 x 16GB', 'White', 10, 18, 3),
('9cad6736-fa06-4ada-80ac-ccf6c0720f33', 128, 4000, 'DDR4', '4 x 32GB', 'Black', 9, 18, 4),
('9e1f1491-3277-4da1-b9be-c521625cd3a3', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 9, 16, 4),
('9e2b97fd-4772-472b-81a9-2e5fa77b3f22', 8, 3200, 'DDR4', '2 x 4GB', 'Silver / Black', 10, 16, 9),
('a5781adf-781e-45a5-9663-0a9f94e25f7e', 32, 5200, 'DDR5', '2 x 16GB', 'Black', 15, 40, 5),
('a979ca3a-5982-464d-933a-e0d43e70fd20', 32, 6000, 'DDR5', '2 x 16GB', 'Black', 12, 36, 6),
('abbbee1a-5a87-4a5c-9467-822651a97a68', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 3),
('ac6ced28-8e7e-4b47-b27d-318e5e940796', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 10, 18, 3),
('ae6d21b1-a636-4529-9384-c2944a32efc6', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 10, 18, 4),
('b1cee37e-44b8-4a42-b750-3834e3f449fb', 128, 3200, 'DDR4', '8 x 16GB', 'Black / Silver', 10, 16, 31),
('b2c2639b-06fb-482a-8dc4-c64dfcf016a8', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 10, 18, 4),
('b5f4df3d-c805-481b-8d3f-9b660c6452b8', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 14, 22, 3),
('c47e50ed-beaf-4db3-b36d-ee1685087db7', 32, 3200, 'DDR4', '2 x 16GB', 'Black', 10, 16, 2),
('c85e198a-36fd-48df-8cfc-e0100e5927ac', 32, 3200, 'DDR4', '2 x 16GB', 'Black', 10, 16, 3),
('c8b1c341-82b6-4251-93cd-aca61378dfb4', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 4),
('cd116c24-be70-4476-9251-40bd9b7f6ff5', 32, 5600, 'DDR5', '2 x 16GB', 'Black', 13, 36, 12),
('d131baf1-94c9-44ae-b3b3-bebf5abebdd6', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 4),
('d29d4d96-e928-45de-af8a-3101bf35537a', 16, 4800, 'DDR5', '2 x 8GB', 'Black', 16, 38, 6),
('d973a7e3-3c91-439f-a15f-46dd2a7401e8', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 10, 18, 3),
('db4539c0-941b-4587-8d7b-de838a65a995', 32, 7200, 'DDR5', '2 x 16GB', 'Black', 9, 34, 12),
('dc59ab92-6093-49b1-a65f-9584e4228e33', 32, 6400, 'DDR5', '2 x 16GB', 'Black', 10, 32, 7),
('dc748501-521a-44a6-a7a2-8f99a72d31cb', 64, 5600, 'DDR5', '2 x 32GB', 'Black', 14, 40, 5),
('e425e30b-2f2f-4f5a-a922-e139e80613be', 16, 3200, 'DDR4', '2 x 8GB', 'Gray', 10, 16, 3),
('e446a374-b0b0-4139-8663-70143e281e92', 32, 3600, 'DDR4', '2 x 16GB', 'Black', 9, 16, 5),
('e6ff8ccc-a0b0-49de-aac8-6bb6a1a9e587', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 10, 18, 5),
('e764fb8f-816d-497a-a33f-168f77300fa1', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 3),
('e80ef470-61f1-4670-9e0d-c2ea0f3bd2a9', 32, 3200, 'DDR4', '4 x 8GB', 'White', 10, 16, 5),
('e894c0f9-1eab-4b74-a944-7ba92e522e99', 16, 3600, 'DDR4', '2 x 8GB', 'Black / Silver', 9, 16, 6),
('e8dc0b01-a022-44ad-b19c-ca77077c5531', 32, 6600, 'DDR5', '2 x 16GB', 'Black', 10, 32, 12),
('ea1bed3c-4c9e-4309-b44a-7ddcb1a8200a', 32, 3600, 'DDR4', '2 x 16GB', 'Black / Silver', 10, 18, 3),
('ea9bc75c-1aa9-4b46-8954-65aca5c8217f', 32, 6400, 'DDR5', '2 x 16GB', 'Black', 10, 32, 8),
('ee972913-3f48-48da-893b-5528c1079695', 16, 5200, 'DDR5', '2 x 8GB', 'Black', 15, 40, 6),
('ef131839-941b-419f-8980-c4db95103efb', 32, 4000, 'DDR4', '2 x 16GB', 'Black', 9, 18, 3),
('f1fef595-33a4-4d85-a48a-43db3574c4f6', 32, 3600, 'DDR4', '2 x 16GB', 'Silver', 11, 19, 5),
('f2c1dac1-8741-48bd-903e-ab03bf01690f', 32, 5600, 'DDR5', '2 x 16GB', 'Black', 13, 36, 6),
('f31e375d-5d26-420b-9a13-d74f2633727c', 16, 3600, 'DDR4', '2 x 8GB', 'Black', 10, 18, 5),
('f89c8ae7-44ea-413c-ad26-3e14a0eb6b15', 64, 5200, 'DDR5', '2 x 32GB', 'Black', 15, 40, 5),
('fbdf246c-9cc7-4763-8614-4c956f345d5e', 16, 3600, 'DDR4', '2 x 8GB', 'Black / Yellow', 9, 16, 4),
('fcec7a21-c72a-4b6b-bf4a-9e547d8416aa', 64, 6000, 'DDR5', '2 x 32GB', 'White / Black', 10, 30, 8),
('fd5c2731-fd18-4694-828e-9ef036378118', 16, 3200, 'DDR4', '2 x 8GB', 'Black', 10, 16, 4),
('fff7417b-2ea4-4378-92ba-118c5ea8e197', 32, 4800, 'DDR5', '2 x 16GB', 'Black', 17, 40, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ram_standards`
--

DROP TABLE IF EXISTS `ram_standards`;
CREATE TABLE IF NOT EXISTS `ram_standards` (
  `ramStandard` varchar(255) NOT NULL,
  PRIMARY KEY (`ramStandard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ram_standards`
--

INSERT IGNORE INTO `ram_standards` (`ramStandard`) VALUES
('DDR2'),
('DDR3'),
('DDR4'),
('DDR5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `refreshtokens`
--

DROP TABLE IF EXISTS `refreshtokens`;
CREATE TABLE IF NOT EXISTS `refreshtokens` (
  `refreshToken` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`refreshToken`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `refreshtokens`
--

INSERT IGNORE INTO `refreshtokens` (`refreshToken`, `username`, `role`, `expiryDate`, `createdAt`, `updatedAt`) VALUES
('0486efaf-2baa-47f4-ba5f-618558618f23', 'vinhvinh', 'admin', '2022-12-09 17:07:54', '2022-12-08 17:07:54', NULL),
('04e0ca6c-7462-4e6b-9e3d-15f0f593b32e', 'vinhvinh', 'admin', '2022-12-07 15:47:06', '2022-12-06 15:47:06', NULL),
('06f68087-1918-4c76-82da-d754d043007b', 'vinhvinh', 'admin', '2022-12-09 17:06:32', '2022-12-08 17:06:32', NULL),
('13bafdeb-41c9-4e0e-a202-4ca26a6cabf5', 'vinhvinh', 'user', '2022-12-07 01:31:07', '2022-12-06 01:31:07', NULL),
('16c395cf-92bd-4d47-a444-480cbdec6860', 'nguyenvinh', 'user', '2022-12-11 16:34:49', '2022-12-10 16:34:49', NULL),
('1bb04782-d87d-4ee9-900e-94992f24aaaa', 'vinhvinh', 'user', '2022-12-10 16:02:10', '2022-12-09 16:02:10', NULL),
('1d5129c5-9205-406c-aeb0-8d99236b02ae', 'admin', 'admin', '2022-12-09 17:26:54', '2022-12-08 17:26:54', NULL),
('21c5b2aa-6d1f-48e2-9e4f-30437de2cc9f', 'vinhvinh', 'admin', '2022-12-07 15:44:48', '2022-12-06 15:44:48', NULL),
('236475b4-5d11-4168-9eba-b7ea9bbe167e', 'vinhvinh', 'admin', '2022-12-07 14:58:28', '2022-12-06 14:58:28', NULL),
('2b5eaa9c-ad3d-46ec-84d7-970ef78de034', 'staff', 'staff', '2022-12-10 07:19:06', '2022-12-09 07:19:06', NULL),
('2c67ae6a-e4b4-4feb-9a1e-77bcbeec1256', 'admin', 'admin', '2022-12-12 11:14:40', '2022-12-11 11:14:40', NULL),
('31fa4358-ce7a-43c5-bc9a-48ccb134c40d', 'admin', 'admin', '2022-12-09 17:36:23', '2022-12-08 17:36:23', NULL),
('36788492-32c8-4ac9-8a79-f9d3346b5083', 'nv1', 'staff', '2022-12-11 18:29:00', '2022-12-10 18:29:00', NULL),
('3d04dc18-4a14-4a72-9a79-d4231d303fdc', 'vinhvinh', 'user', '2022-12-07 15:43:35', '2022-12-06 15:43:35', NULL),
('3edd911f-302b-4446-ae6f-c697257b2d66', 'vinhvinh', 'staff', '2022-12-09 17:11:49', '2022-12-08 17:11:49', NULL),
('4099a307-3dff-4e25-82bd-c5d8b1b004e0', 'vinhvinh', 'admin', '2022-12-09 17:05:31', '2022-12-08 17:05:31', NULL),
('48c69f2e-603c-4e75-a879-ea0006fe6374', 'vinhvinh', 'admin', '2022-12-09 17:07:35', '2022-12-08 17:07:35', NULL),
('4e90c9c2-8f0b-4b5c-ac10-ca2ba89e1fdb', 'vinhvinh', 'admin', '2022-12-07 15:44:03', '2022-12-06 15:44:03', NULL),
('575e10f2-da45-4bda-b5bb-3970aef18b11', 'vinhvinh', 'admin', '2022-12-07 14:59:24', '2022-12-06 14:59:24', NULL),
('5c222666-71a4-4867-9432-9905308cf094', 'vinhvinh', 'admin', '2022-12-09 17:14:59', '2022-12-08 17:14:59', NULL),
('5e446a45-a3e9-4c82-8ebb-be2ecb5b46db', 'vinhvinh', 'admin', '2022-12-09 17:07:10', '2022-12-08 17:07:10', NULL),
('60cbdbd4-768e-4b81-a6ee-9524d1af5dbd', 'nv1', 'staff', '2022-12-11 21:51:22', '2022-12-10 21:51:22', NULL),
('6178daa2-f051-4ce4-857c-bfdb584ceb4b', 'vinhvinh', 'admin', '2022-12-09 03:04:35', '2022-12-08 03:04:35', NULL),
('64b9390d-b12b-44c0-aa41-0560e73bd22e', 'vinhvinh', 'staff', '2022-12-09 17:16:46', '2022-12-08 17:16:46', NULL),
('6a9731e6-e233-4bcf-92d9-c084e3dd862f', 'vinhvinh', 'user', '2022-12-07 01:21:46', '2022-12-06 01:21:46', NULL),
('6e759f10-dae4-4a56-b71b-68bcb97e1b19', 'vinhvinh', 'admin', '2022-12-07 15:01:32', '2022-12-06 15:01:32', NULL),
('72ef97d9-838a-4576-88dc-568f39cc9757', 'admin', 'admin', '2022-12-10 23:32:39', '2022-12-09 23:32:39', NULL),
('75f7d0b3-553f-4164-9dea-42c618b02c63', 'vinhvinh', 'admin', '2022-12-09 17:03:40', '2022-12-08 17:03:40', NULL),
('83b86070-3f1a-40f0-9c89-24e481d36a8a', 'admin', 'admin', '2022-12-11 18:31:54', '2022-12-10 18:31:54', NULL),
('85303e02-3d5a-47c5-836a-5d5041cb7778', 'vinhvinh', 'user', '2022-12-07 14:54:45', '2022-12-06 14:54:45', NULL),
('9456c9a7-daa2-4a8c-b951-59f0a5a38c1d', 'staff', 'staff', '2022-12-09 17:32:05', '2022-12-08 17:32:05', NULL),
('9cfd1cb5-c4a4-41ce-8e25-a4a95e83e363', 'staff', 'staff', '2022-12-09 17:26:46', '2022-12-08 17:26:46', NULL),
('9db090c7-0786-4707-bc46-7c6335c04949', 'admin', 'admin', '2022-12-11 18:22:03', '2022-12-10 18:22:03', NULL),
('a27f74e0-b567-4a46-9cb5-9ba98c5676d8', 'vinhvinh', 'admin', '2022-12-09 03:03:36', '2022-12-08 03:03:36', NULL),
('ab228412-9364-4b13-8113-d8c1fb3ac946', 'admin', 'admin', '2022-12-11 18:30:29', '2022-12-10 18:30:29', NULL),
('b85046c5-96e3-4227-a2ba-45ab7543b7d5', 'admin', 'admin', '2022-12-10 17:34:34', '2022-12-09 17:34:34', NULL),
('bdddb08a-6d34-446e-ab44-eb9288e8e651', 'vinhvinh', 'admin', '2022-12-08 18:29:46', '2022-12-07 18:29:46', NULL),
('c0bebec5-cb63-4f4e-b807-1a95d1114851', 'vinhvinh', 'admin', '2022-12-09 03:06:34', '2022-12-08 03:06:34', NULL),
('c1126648-7306-407b-8540-70a295c2320e', 'vinhvinh', 'user', '2022-12-07 13:31:31', '2022-12-06 13:31:31', NULL),
('c310d92c-6672-4db8-b374-0eb36fd17ab5', 'vinh466', 'user', '2022-12-07 15:44:25', '2022-12-06 15:44:25', NULL),
('c6599580-fedd-4979-904b-651f52151fc6', 'vinhvinh', 'admin', '2022-12-08 17:07:55', '2022-12-07 17:07:55', NULL),
('c73b43f0-7aa1-4c18-af7f-f0b46c2b7656', 'nv1', 'staff', '2022-12-11 18:31:44', '2022-12-10 18:31:44', NULL),
('cad9dabc-78bc-4182-86e6-100f867c89bb', 'admin', 'admin', '2022-12-11 18:31:38', '2022-12-10 18:31:38', NULL),
('cd58c957-ee83-475f-813a-c40df95ae9e5', 'staff', 'staff', '2022-12-09 17:34:45', '2022-12-08 17:34:45', NULL),
('ce48e348-40e5-455d-8f07-6eb176b0b8db', 'vinhvinh', 'admin', '2022-12-09 17:07:49', '2022-12-08 17:07:49', NULL),
('d38598bb-f06f-4cb1-a008-31ba4f2609e9', 'vinhvinh', 'admin', '2022-12-07 15:08:10', '2022-12-06 15:08:10', NULL),
('d3bafee1-dc2d-4358-8772-7d5f73ffa1c2', 'vinhvinh', 'admin', '2022-12-07 15:41:46', '2022-12-06 15:41:46', NULL),
('d5270c67-5d34-475e-aae0-ce5f0d8116cb', 'vinhvinh', 'staff', '2022-12-10 06:09:55', '2022-12-09 06:09:55', NULL),
('d9a55dc6-b3cd-4497-be0e-cabba05226dc', 'admin', 'admin', '2022-12-10 06:10:56', '2022-12-09 06:10:56', NULL),
('db7edfde-a4e2-419d-bdf5-aec7bef965c0', 'vinhvinh', 'admin', '2022-12-09 17:06:52', '2022-12-08 17:06:52', NULL),
('dc58495b-92f4-43b6-bb70-2b75aa62285a', 'nguyenvinh', 'user', '2022-12-11 16:39:12', '2022-12-10 16:39:12', NULL),
('e66ddd87-312c-4866-a9ea-ba4174a66b8a', 'vinhvinh', 'admin', '2022-12-09 16:20:20', '2022-12-08 16:20:20', NULL),
('f4ed9b49-2fe6-4d19-8bf1-eade10d8a1c3', 'vinhvinh', 'user', '2022-12-07 01:30:06', '2022-12-06 01:30:06', NULL),
('f8f77da4-1fca-4319-8371-6ed30c7e4423', 'vinhvinh', 'admin', '2022-12-08 18:31:11', '2022-12-07 18:31:11', NULL),
('fb3d476e-1cc6-4159-9ee8-b18e82c6ae2e', 'admin', 'admin', '2022-12-10 06:10:20', '2022-12-09 06:10:20', NULL),
('fcfaa8ab-fdf3-4856-a08c-7f184923b50c', 'vinhvinh', 'admin', '2022-12-09 16:21:46', '2022-12-08 16:21:46', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `roleName` varchar(255) NOT NULL,
  PRIMARY KEY (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT IGNORE INTO `roles` (`roleName`) VALUES
('admin'),
('moderator'),
('staff'),
('user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socket_types`
--

DROP TABLE IF EXISTS `socket_types`;
CREATE TABLE IF NOT EXISTS `socket_types` (
  `socketName` varchar(255) NOT NULL,
  PRIMARY KEY (`socketName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `socket_types`
--

INSERT IGNORE INTO `socket_types` (`socketName`) VALUES
('AM1'),
('AM2+'),
('AM3'),
('AM3+'),
('AM4'),
('AM5'),
('FCLGA1150'),
('FM1'),
('FM2'),
('FM2+'),
('G34'),
('LGA 1150'),
('LGA 1151'),
('LGA 1155'),
('LGA 1156'),
('LGA 1200'),
('LGA 1356'),
('LGA 1366'),
('LGA 1700'),
('LGA 2011'),
('LGA 2011-3'),
('LGA 2066'),
('LGA 771'),
('LGA 775'),
('sTR4'),
('sTRX4'),
('sWRX8'),
('TR4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `storage_drives`
--

DROP TABLE IF EXISTS `storage_drives`;
CREATE TABLE IF NOT EXISTS `storage_drives` (
  `storageDriveId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` char(10) DEFAULT NULL,
  `capacity` char(10) DEFAULT NULL,
  `maxRead` char(10) DEFAULT NULL,
  `maxWrite` char(10) DEFAULT NULL,
  `cache` char(10) DEFAULT NULL,
  `form` char(10) DEFAULT NULL,
  `interface` char(20) DEFAULT NULL,
  `pricePerGb` float DEFAULT NULL,
  PRIMARY KEY (`storageDriveId`),
  UNIQUE KEY `id_UNIQUE` (`storageDriveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `storage_drives`
--

INSERT IGNORE INTO `storage_drives` (`storageDriveId`, `type`, `capacity`, `maxRead`, `maxWrite`, `cache`, `form`, `interface`, `pricePerGb`) VALUES
('00efe89b-210e-4e10-9bc9-b28f3b09e67a', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2750),
('02346ff1-69ae-4cc4-a7f3-4c97211e77eb', 'SSD', '1 TB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 1275),
('0342a1ce-e392-44ba-a2cd-7fe3902c1730', '7200 RPM', '1 TB', '', '', '64 MB', '3.5\"', 'SATA 6.0 Gb/s', 625),
('04f4c82d-b359-4992-87b6-1128d9670237', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1500),
('07ab664c-5266-4fca-9c76-9d07cc73b1d9', 'SSD', '1 TB', '', '', '2048 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 0),
('092609d8-cd0f-4b39-af2e-f6449f799200', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2125),
('09b33991-e143-4ac8-8344-39f68b189e79', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2000),
('0fa7bde4-0133-456a-931c-2c2c1ff1b2e4', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3500),
('10365332-fcb0-407a-b2cc-705cb7d63f8c', 'SSD', '4 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3100),
('10e3523f-b9f3-4b45-a790-29251b739129', 'SSD', '8 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 4675),
('151d0101-1162-4bee-b4e9-b739b92885a4', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2425),
('17010ec3-f88f-48dc-8db1-92716c0b6620', 'SSD', '500 GB', '', '', '512 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 4000),
('17a6f187-1eec-431b-a69e-441f534219e9', 'SSD', '4 TB', '', '', '4096 MB', '2.5\"', 'SATA 6.0 Gb/s', 2375),
('18b0a17d-4344-489f-9203-e873bba6a982', '7200 RPM', '1 TB', '', '', '64 MB', '3.5\"', 'SATA 6.0 Gb/s', 1000),
('1b8804ca-7d74-4cfa-979b-8524fd1bd998', '7200 RPM', '4 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 800),
('1ed8adb1-0ad9-4a3d-a934-90a3194c0025', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2750),
('21130e81-e8e3-4f5d-ada6-be668940fdd0', 'SSD', '1.02 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1950),
('23b058b2-176a-49b3-a856-f63e6b3a0e99', 'SSD', '256 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2000),
('2e0b15d9-0806-48b0-b972-a01b2bea0f1b', '7200 RPM', '4 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 775),
('31047cb6-9d8f-49e7-8390-ea28a16c3ec3', 'SSD', '2.048 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2500),
('326039f1-d4ce-455c-b4aa-8629219c0aaf', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2250),
('33dc5aa2-a7b0-47a2-b738-4ba19403ea55', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3250),
('3715b862-93ea-44ba-b116-dee93752dd4c', 'SSD', '500 GB', '', '', '512 MB', '2.5\"', 'SATA 6.0 Gb/s', 2150),
('41b818e2-6470-42d0-a858-4ee9e8a26ca5', '5400 RPM', '4 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 400),
('449035e6-b5e2-4702-a095-73c6da6509b5', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1575),
('45014e97-3ac7-47f9-9a2e-5231f9d228b4', 'SSD', '512 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1550),
('46766d27-a320-4bd6-bbf0-942d7293a0b9', 'SSD', '1 TB', '', '', '1024 MB', '2.5\"', 'SATA 6.0 Gb/s', 2625),
('4a5df5ca-f3f8-42d2-8b4b-6cc482de522d', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 0),
('4bdbd03d-a8fe-4448-8c3d-b23a612eb0ab', '7200 RPM', '1 TB', '', '', '64 MB', '3.5\"', 'SATA 6.0 Gb/s', 1125),
('4bfe5518-a3ac-45dc-93e6-c619ca785312', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 0),
('4f0c7492-90ec-48be-b88a-fedf0188d7b8', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2500),
('539d2c66-6af2-4481-8133-a75487c70f86', '7200 RPM', '20 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 500),
('53c22bba-c229-4c5e-a083-e269aa421b42', 'SSD', '64 GB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 4300),
('54fde688-8782-4ff6-ad1d-e0acbae508bd', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3375),
('563f9f0d-cb92-4517-bb30-95d773fede86', 'SSD', '1 TB', '', '', '1024 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3000),
('56932230-e50c-4eaa-969e-7d609327c709', 'SSD', '8 TB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 2150),
('56e7d467-a9ee-4f72-9af8-42f19786965f', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1850),
('5f4dc91d-55e9-41f7-82b5-3cff03a4f007', 'SSD', '2 TB', '', '', '2048 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3625),
('621570b1-789c-42a0-962a-e609c276c3f2', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3000),
('6281033f-d3ac-44ae-8700-a599b246535d', 'SSD', '2 TB', '', '', '2048 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2750),
('64b16e95-a641-4613-b7d9-efd9e4b0657f', 'SSD', '15.3 TB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 4700),
('6b2c8ae8-886e-418b-9d9b-87822d114e1a', 'SSD', '250 GB', '', '', '512 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 8000),
('6fe80798-59ea-468e-b4b8-eeb83195f916', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2875),
('716b6b84-91d3-4d24-9b38-8a3c47b202c8', 'SSD', '1 TB', '', '', '1024 MB', '2.5\"', 'SATA 6.0 Gb/s', 2125),
('756b03cf-9199-42bc-80e6-0b369c05ba0d', 'SSD', '1 TB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 2200),
('7731a596-ae45-4b78-bae2-cb82e729613f', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2100),
('78ded9da-bc42-4925-aa08-c851e84337d9', 'SSD', '1.024 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2275),
('79b67945-c45d-4438-8c31-49ac58482697', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2500),
('8237511b-393a-4903-9f81-72f0ceecc6f6', '5400 RPM', '4 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 0),
('852da72f-40b1-460d-a6d8-c8c2419a1892', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1625),
('863784bc-bcf0-4064-8b0c-d030439f239c', 'SSD', '480 GB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 1550),
('87d46d9d-f2ed-45d6-ae92-dfd3e6c30946', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2250),
('8b4f4211-a2bd-4316-90d0-aa7ebb0d9659', 'SSD', '500 GB', '', '', '512 MB', '2.5\"', 'SATA 6.0 Gb/s', 3750),
('8c696046-aaeb-457f-9037-93bd3b0f4c11', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3700),
('8dd049e2-5e0a-4897-beb9-11e3231c9c35', 'SSD', '1 TB', '', '', '1024 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3750),
('8f99558b-7f4b-41a1-81b9-1fb77050a783', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1950),
('924d5fc5-4766-4786-b7a8-a78afa1c1e79', '7200 RPM', '2 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 625),
('933cd7c9-ae1f-4a70-8f54-262727a5f792', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1900),
('935bebf5-234c-415b-a2bb-341c412133e2', '7200 RPM', '22 TB', '', '', '512 MB', '3.5\"', 'SATA 6.0 Gb/s', 675),
('942ffc11-b698-40d1-8651-86693534da2e', 'SSD', '4 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3425),
('a0117efb-31c7-40d2-a475-9e74ca6eeba4', '5400 RPM', '4 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 400),
('a173a611-0b02-4be8-a0a5-0b4540aef83d', 'SSD', '240 GB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 2075),
('a52d1f2e-0664-4094-9276-bf2aecc18c66', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3650),
('ac2125bb-b61d-4319-a43a-41e42b582395', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 1750),
('ae97e46f-b574-44ff-b98f-7096e0fb84df', 'SSD', '512 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1625),
('af578e41-0b51-4df5-aa13-1e53c26255d5', '5400 RPM', '8 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 375),
('b059a843-581d-4b69-916b-ebd0d63e66a4', 'SSD', '2 TB', '', '', '2048 MB', '2.5\"', 'SATA 6.0 Gb/s', 2250),
('b1dfb775-e19c-4519-8106-69eee64b6f18', '7200 RPM', '22 TB', '', '', '512 MB', '3.5\"', 'SATA 6.0 Gb/s', 675),
('b22d4c15-7a88-49ea-9a17-7946f3ea0720', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1750),
('b3438a96-4875-4685-a772-f19a5561712c', 'SSD', '1 TB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 1550),
('b3d9f993-896a-4909-9a19-946ad2a2803d', 'SSD', '4 TB', '', '', '', 'PCIe', 'PCIe x8', 0),
('b64f69e4-352a-4cba-adab-fba29de99ec9', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 1625),
('b6ab7eb0-7e18-452a-bc68-64f5bdb772b4', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1975),
('b6c46286-a735-4d5d-9d76-f74d192ae43f', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2000),
('b8c5652b-9bd0-4a90-b58b-bf02fb21828c', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2150),
('badaf449-9c76-46bb-b991-ccfe499ad107', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2500),
('bce4bbd7-daa5-46d4-aeb8-b719f731425e', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 3000),
('c29598b6-aa5a-4d58-bbfe-69a1cf391b31', 'SSD', '500 GB', '', '', '512 MB', '2.5\"', 'SATA 6.0 Gb/s', 2500),
('c6d33618-5fe7-474e-b9f1-1ff297777031', 'SSD', '2 TB', '', '', '2048 MB', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2725),
('c9eae240-42b2-4689-8e4e-ae11ccaa150d', 'SSD', '1.2 TB', '', '', '', 'PCIe', 'PCIe x4', 51850),
('ce0deb6f-192e-4801-a794-b76fd6f39749', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2000),
('cf1a4d80-d167-46cd-a4fd-4d0730728509', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1625),
('d1e2ccce-2a8c-4d4d-9775-c6bb1442ca2e', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 2875),
('d48acaed-211b-4591-8b23-7695ab51aeb6', 'SSD', '2 TB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 2125),
('d5327a99-0efb-4ef6-99a8-1694c5d2ae9c', 'SSD', '4 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 4.0 X4', 4375),
('d57429fd-559a-449c-b044-1640ae8534c9', 'SSD', '2 TB', '', '', '1024 MB', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2500),
('d67248d1-9600-4c11-b776-3e59e9674689', 'SSD', '2 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2000),
('d8048443-6109-40e7-8374-76a3a39aae29', 'SSD', '500 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2500),
('d81071ca-5e01-40ab-ae55-34c3e5973f3a', 'SSD', '250 GB', '', '', '512 MB', 'M.2-2280', 'M.2 PCIe 3.0 X4', 5500),
('dce55a66-96c0-43f7-afd6-1e3bba1688a1', 'SSD', '1 TB', '', '', '1024 MB', '2.5\"', 'SATA 6.0 Gb/s', 3475),
('e16fe356-a5fb-41c1-a5c6-e9f045dc43ca', 'SSD', '500 GB', '', '', '512 MB', 'M.2-2280', 'M.2 PCIe 3.0 X4', 3750),
('e424075e-5f09-4e0a-806b-4855c0c119da', 'SSD', '2 TB', '', '', '2048 MB', '2.5\"', 'SATA 6.0 Gb/s', 2150),
('e761c54d-c32f-4aed-a0d2-9bc2c16ef6bd', 'SSD', '512 GB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 1325),
('e7d4daa8-b69c-438c-8355-e08e8c1ba089', 'SSD', '250 GB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 3500),
('e8aad653-9ad2-4af7-baba-dc0d58ad9de7', 'SSD', '1 TB', '', '', '1024 MB', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2725),
('ecfe3748-0fad-4565-9ab1-2e09e72bfda1', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 3475),
('ee2b9dc7-1e81-4d11-8626-e1d643177ef2', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 2475),
('efd619c9-2226-4642-9379-485e2470864f', '7200 RPM', '2 TB', '', '', '256 MB', '3.5\"', 'SATA 6.0 Gb/s', 625),
('f5501849-ef82-4a68-9d12-685304eaef9e', 'SSD', '1 TB', '', '', '', 'M.2-2280', 'M.2 PCIe 3.0 X4', 1650),
('f6a6fd6c-405d-4c34-a9da-5001e16fbe6e', 'SSD', '120 GB', '', '', '', '2.5\"', 'SATA 6.0 Gb/s', 3950);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `lastname` char(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT IGNORE INTO `users` (`username`, `email`, `name`, `lastname`, `password`, `address`, `city`, `phone`, `updatedAt`, `createdAt`, `deletedAt`) VALUES
('admin', 'admin@gmail.com', 'admin', 'admin', '$2a$10$wGdrXslK07j2udV8K71YPez8F.cENFv5lpQYFegI.NcLcUV8s8A/q', 'admin', 'admin', 'NULL', '2022-12-08 17:25:33', '2022-12-08 17:25:18', NULL),
('nguyenvinh', 'vinh@gmail.com', 'vinh', 'nguyen', '$2a$10$QRTSB2sG0kbIJygLi1aBCO5XzHTwyQ4z8hwg/8SreC3.3AHv4uPHa', 'Xuan Khanh Ninh Kieu Cần Thơ', 'cantho', '0334680701', '2022-12-10 18:20:08', '2022-12-10 16:34:48', NULL),
('nv1', 'nv1@g.com', 'tennv1', 'honv1', '$2a$10$yLpCum/RXp1apVy2vg8o8u0f4YFgTVzg8MIAqQ5Qak2tzsHlVwlO6', '', '', '0333333333', NULL, '2022-12-10 18:28:50', NULL),
('nv2', 'nv2@g.com', 'tennv2', 'honv2', '$2a$10$jJPVXLK.9yhk2XhAtF9yeOkGqBDjpA8a5CB1AIJnSEfx6uJ1/AT.2', '', '', '0333333333', NULL, '2022-12-11 11:15:25', NULL),
('staff', 'staff@gmail.com', 'staff', 'staff', '$2a$10$wGdrXslK07j2udV8K71YPez8F.cENFv5lpQYFegI.NcLcUV8s8A/q', 'Xuan Khanh Ninh Kieu', 'staff', '0334680701', '2022-12-09 07:11:11', '2022-12-08 17:26:18', NULL),
('vinh123', 'abc@gmail.com', 'ab', 'zưt', '$2a$10$N6VTuyCswmUCxcSkGry66.8cdShvX0JVA3R.MudyBdxGmU/jG1pCq', 'Xuan Khanh Ninh Kieu', 'CanTho', '0912312333', NULL, '2022-12-09 06:19:07', NULL),
('vinh466', 'vinh466@gmail.com', '', '', '$2a$10$qel.6ZubAPg7UTDnXqGnYexOI5MgJ5JyzffzceKNPjkEnlod7xopi', NULL, '', '', '2022-12-09 06:17:01', '2022-11-19 17:40:25', '2022-12-09 06:17:01'),
('vinh466111', 'abc@gmail.com', 'ab', 'zưt', '$2a$10$Qb7Ovgl.ez8WuhKwJRLJROehnxlG/wHTkutK6deDM.DEK9fodsP9G', '', 'CanTho', '0912312333', '2022-12-11 11:51:40', '2022-12-11 11:22:00', '2022-12-11 11:51:40'),
('vinh5528', 'vinh466@gmail.com', '', '', '$2a$10$9ATCoWFCoRlgxTgKHRxXU.XL72PQwtG9SF2PjD09kksUzAoUWPdt2', NULL, '', '', '2022-12-09 04:05:18', '2022-11-20 09:08:15', '2022-12-09 04:05:18'),
('vinhcorp', 'vinh466@gmail.com', '', '', '$2a$10$E21.0hMmMaSOsfdgGYezD.CUlOjZjSpsv6W5.V/D2zJ7uwOaK7D3m', NULL, '', '', '2022-12-09 04:05:37', '2022-11-27 22:07:07', '2022-12-09 04:05:37'),
('vinhcorp2', 'vinh123123@gmail.com', 'Vinh', 'Nguyen', '$2a$10$ftIyVEYAxiw4VP1sUH5m/eIgGboSIYJiY5wMIPToEDlIkO7KUdQBS', '', '', '', NULL, '2022-11-27 23:02:10', NULL),
('vinhn', 'vinh466@gmail.com', 'Vinh', 'Nguyen', '$2a$10$KgZqxeBItg6p9RBnwxvPeuaddzlESsy0t8yQnsKeiPA3V08ZheA7q', 'hihi', 'CanTho', '+84334680701', NULL, '2022-12-09 07:12:01', NULL),
('vinhnguyen', 'vinh466@gmail.com', 'Vinh', 'Nguyen', '$2a$10$WQMfkZL96jiK3nB8EkIWGOHE4ogzG4K3bkU5yzW3YMs0yBV0puSCq', '', 'CanTho', '+84334680701', NULL, '2022-12-09 06:12:27', NULL),
('vinhnguyen2', 'vinh466@gmail.com', 'Vinh', 'Nguyen', '$2a$10$O3XeXk/oYMrIa4VWzOcaU.f4IYmCirSmCBGeDNnOQ2U71Z.mnLFIi', '', 'CanTho', '+84334680701', NULL, '2022-12-09 06:19:59', NULL),
('vinhnguyen4', 'vinh466@gmail.com', 'Vinh22', 'Nguyen22', '$2a$10$CkM09I9cdGmGwRkBMU5VR.QhrIM/VkEXCABtN7lvtqPqOfWkBTxra', '', 'CanTho', '+84334680701', '2022-12-09 06:53:36', '2022-12-09 06:21:20', NULL),
('vinhvinh', '123123@gmail.com', 'ZinZin', 'no', '$2a$10$wGdrXslK07j2udV8K71YPez8F.cENFv5lpQYFegI.NcLcUV8s8A/q', 'cantho', 'Cần Thơ', '0334680701', '2022-12-05 20:03:44', '2022-12-04 16:02:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `username` varchar(255) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`username`,`roleName`),
  UNIQUE KEY `user_roles_roleName_username_unique` (`username`,`roleName`),
  KEY `roleName` (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT IGNORE INTO `user_roles` (`username`, `roleName`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
('admin', 'admin', '2022-12-08 17:25:43', NULL, NULL),
('nguyenvinh', 'user', '2022-12-10 16:34:48', NULL, NULL),
('nv1', 'staff', '2022-12-10 18:28:50', NULL, NULL),
('nv2', 'staff', '2022-12-11 11:15:25', NULL, NULL),
('staff', 'staff', '2022-12-08 17:26:37', NULL, NULL),
('vinh123', 'user', '2022-12-09 06:19:07', NULL, NULL),
('vinh466', 'user', '2022-11-19 17:40:25', NULL, NULL),
('vinh466111', 'staff', '2022-12-11 11:22:00', NULL, NULL),
('vinh5528', 'staff', '2022-11-20 09:08:15', '2022-12-08 17:01:35', NULL),
('vinhcorp', 'user', '2022-11-27 22:07:07', NULL, NULL),
('vinhcorp2', 'admin', '2022-11-27 23:02:10', '2022-12-08 16:32:19', NULL),
('vinhn', 'staff', '2022-12-09 07:12:01', NULL, NULL),
('vinhnguyen', 'user', '2022-12-09 06:12:27', NULL, NULL),
('vinhnguyen2', 'user', '2022-12-09 06:19:59', NULL, NULL),
('vinhnguyen4', 'user', '2022-12-09 06:21:20', NULL, NULL),
('vinhvinh', 'staff', '2022-12-04 16:02:04', '2022-12-08 17:08:08', NULL),
('vinhvinh', 'user', '2022-12-04 16:02:04', '2022-12-08 17:08:13', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video_cards`
--

DROP TABLE IF EXISTS `video_cards`;
CREATE TABLE IF NOT EXISTS `video_cards` (
  `videoCardId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `chipsetName` varchar(255) DEFAULT NULL,
  `coreClock` char(10) DEFAULT NULL,
  `boostClock` char(10) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  PRIMARY KEY (`videoCardId`),
  UNIQUE KEY `id_UNIQUE` (`videoCardId`),
  KEY `chipsetName` (`chipsetName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `video_cards`
--

INSERT IGNORE INTO `video_cards` (`videoCardId`, `chipsetName`, `coreClock`, `boostClock`, `color`, `length`, `memory`) VALUES
('0359291e-5772-412f-8aa8-575fea2c2da3', 'GeForce RTX 4090', '2235', '0', 'Black', 337, 24),
('0682bc08-759b-4015-8f82-49f83907cbb6', 'GeForce RTX 3070', '1500', '1770', 'Black / Silver', 285, 8),
('069aaa3e-1157-452f-9636-54ced3eb831b', 'Radeon RX 6700 XT', '2321', '2622', 'Black', 320, 12),
('08b866d8-eb34-40a5-9a45-2d2a9552f8ba', 'GeForce RTX 3090 Ti', '1560', '1950', 'Black', 326, 24),
('09fe660c-9e3f-41a1-b31d-92e0fbff28e9', 'Radeon RX 6950 XT', '1890', '2454', 'Silver / Black', 325, 16),
('0a47fca7-bff5-49df-b98c-445758564cc7', 'Radeon RX 6950 XT', '1890', '2435', 'Black', 320, 16),
('143f53e5-9439-45c6-bb39-ff5e0bd650ff', 'GeForce RTX 3070 Ti', '1575', '1830', 'White / Silver', 320, 8),
('16aff1ba-2864-471f-b52a-470bc2cc4cbb', 'Radeon RX 6600', '1626', '2491', 'Black / Silver', 235, 8),
('17f4b732-21a3-46c8-a644-78f6afd96510', 'GeForce RTX 3080 Ti', '1370', '1670', 'Silver / Blackz', 285, 12),
('18078029-a2b8-4093-b4e0-a8a33a04ab5e', 'GeForce RTX 3090 Ti', '1560', '1920', 'Black', 325, 24),
('1a61c24d-e274-47cb-8e4f-e6678eb3dec3', 'Radeon RX 6600', '1626', '2491', 'Black / Silver', 282, 8),
('1b05da25-b696-40dc-b767-183ab7d92d03', 'GeForce RTX 3070', '1500', '1755', 'Black', 232, 8),
('1cabfdee-34e0-4356-ba50-110eaf304d1d', 'GeForce RTX 3070 Ti', '1575', '1815', 'Black', 285, 8),
('1cce692e-4d49-4c68-aea0-a281f6fa161c', 'GeForce RTX 3070 Ti', '1575', '1815', 'Black / Silver', 300, 8),
('20f04585-3807-4ed9-bb3b-5d6edfd4a89a', 'GeForce RTX 3080', '1260', '1740', 'Black / Gray', 305, 12),
('24270300-8078-478e-b179-117534391580', 'Quadro GV100', '1200', '1447', 'Black / Gold', 267, 32),
('26305cb5-1f6e-4596-a8c7-5c2f0df8d7df', 'GeForce RTX 4090', '2235', '0', 'Black / Silver', 336, 24),
('2a0c58af-4d46-469a-816d-1cf10916de47', 'GeForce RTX 3070', '1500', '1815', 'Black / Silver', 286, 8),
('2c8da57f-2ce3-4ebc-a8d8-38646c20f629', 'GeForce RTX 3080', '1440', '1800', 'Black', 300, 10),
('2e03d7a6-a054-4ead-a0f4-e4af9e99709b', 'GeForce RTX 3060', '1320', '1777', 'Black', 235, 12),
('31cdc51c-3dfb-43ee-a20b-4d0a8732fcb9', 'Radeon RX 6600', '1626', '2491', 'Black / Silver', 243, 8),
('37783c1d-2011-4658-9316-a753a73d6b1a', 'Radeon RX 6900 XT', '1825', '2340', 'Black', 320, 16),
('385684d7-26c4-403e-9402-3ff3e0025ac1', 'GeForce RTX 4090', '2235', '0', 'Black / Silver', 280, 24),
('3967210d-574d-4283-840a-15d68ca4e8c0', 'GeForce RTX 4090', '2235', '0', 'Black', 337, 24),
('3979dc33-9489-46bc-89e5-755888b9d841', 'Radeon RX 6500 XT', '2310', '2825', 'Black / Silver', 172, 4),
('3b0ff30f-927e-4b63-bcb9-58378411cf81', 'GeForce RTX 3080', '1440', '1815', 'Blackz', 300, 10),
('3cef228e-a13a-41fc-89ee-a3d99ef668b2', 'GeForce RTX 3070', '1500', '1815', 'Silver / Whitez', 286, 8),
('41c1ee34-da6e-4db7-8289-38ac19d4d3c1', 'GeForce RTX 3060', '1320', '1807', 'Black', 316, 12),
('44836a1a-2692-476c-a792-9cf447602357', 'Radeon RX 580', '1366', '1386', 'Black / Red', 270, 8),
('4690c38d-c0e8-4fb7-b480-7a25f0195dfd', 'Radeon RX 6900 XT', '1825', '2250', 'Black', 340, 16),
('482729be-93c5-40a8-b8a5-057d02bcf3b3', 'GeForce RTX 3070 Ti', '1575', '1800', 'Black / Silver', 316, 8),
('486bcb32-f5be-415c-90e4-9ef9bdf6358f', 'Radeon RX 6600 XT', '1968', '0', 'Black', 269, 8),
('4886e104-2b6e-4c0f-9992-dd42f5b2fea4', 'GeForce GTX 1660 SUPER', '1530', '1830', 'Black', 202, 6),
('4a786335-0376-4d39-8f0d-996f09ed1940', 'GeForce RTX 3070 Ti', '1575', '0', 'Black / Silver', 318, 8),
('4d5b7a78-bc96-46d9-9df9-de7665fd884f', 'GeForce RTX 3080', '1440', '1740', 'Black', 305, 10),
('50769bf4-fadd-4f90-8893-a37a08a019d8', 'GeForce RTX 3080 Ti', '1365', '1695', 'Black / Silver', 318, 12),
('579cab9c-9f27-444b-9048-d629ac650c0e', 'Radeon RX 6800 XT', '1825', '2340', 'Black', 320, 16),
('58103d90-aec3-4342-81e8-f9064a87ce16', 'GeForce RTX 3070 Ti', '1575', '1830', 'Black / Silver', 323, 8),
('581b323d-21a2-48d5-9e8c-9779d352356b', 'Radeon RX 580', '1257', '1380', 'Black / Red', 255, 8),
('5aa389bf-99b5-4e8d-a2ec-2d8208de4e73', 'Radeon RX 6800 XT', '1825', '2310', 'Black / Silver', 324, 16),
('5dc87a0f-4da6-4295-8b4e-736662a63766', 'GeForce RTX 3060 Ti', '1410', '1740', 'Black', 282, 8),
('5ef196b0-4492-4d94-ac4b-9a673f9b071c', 'GeForce RTX 4090', '2235', '2535', 'Black / Silver', 356, 24),
('620dd431-da21-44d4-b6ad-952be33adfc2', 'GeForce GTX 1650 G6', '1410', '1620', 'Black / Gray', 151, 4),
('6906a012-d203-4fc2-9080-fd03397b1952', 'GeForce RTX 3070', '1500', '1815', 'Black', 286, 8),
('6d259005-8921-4d1e-a61c-b587f17838a5', 'GeForce RTX 2060', '1365', '1785', 'Black', 242, 6),
('6d448914-3b0d-4d1e-8158-0a8d50225d70', 'Radeon RX 6600 XT', '1968', '2602', 'Black / Silver', 235, 8),
('701535f1-db1a-4be9-aac1-a5c93a8372ae', 'Radeon RX 6700 XT', '2321', '0', 'Black', 282, 12),
('7681e794-f3de-49fb-a826-5fb48420e25d', 'GeForce RTX 3050 8GB', '1550', '0', 'Black', 235, 8),
('7b2d997b-7b36-4606-839f-2972a741285d', 'GeForce RTX 3060 Ti', '1410', '1770', 'Black / Silverz', 278, 8),
('7cb033ac-0abe-4731-918f-6aa044c4d4eb', 'GeForce RTX 4090', '2235', '2595', 'Black', 348, 24),
('7f278505-c8e3-4291-ad86-cc30282a03fa', 'GeForce GTX 1660', '1530', '1830', 'Silver / Black', 202, 6),
('82f495be-7a2b-41fc-b173-61527e62abab', 'GeForce RTX 4090', '2235', '0', 'Black', 340, 24),
('8afa851f-7d8b-4836-9dac-b0c08509c462', 'GeForce RTX 3080', '1440', '1935', 'Black', 318, 10),
('8bc8ce49-0434-4957-a01e-54c2f8614f64', 'GeForce RTX 3060 Ti', '1665', '1755', 'Silver / White', 281, 8),
('8c802453-21e0-4d6f-a71a-0dce79c7db12', 'Radeon RX 6650 XT', '2055', '2635', 'Black / Silver', 282, 8),
('8d14f3a9-ed1b-4aea-a632-e9d4d7353c0e', 'GeForce RTX 3080 Ti', '1365', '1800', 'Black', 300, 12),
('90e50872-0460-49de-8f11-94383c232ca2', 'GeForce RTX 3070', '1500', '1730', 'Blackz', 242, 8),
('92a51c7b-d3a2-4c9b-8bd8-5627cb612c1a', 'Radeon RX 6900 XT', '1925', '2340', 'Black / Silver', 330, 16),
('98b3bfb9-023b-4508-b564-42a6d3d9d718', 'GeForce RTX 3060 Ti', '1410', '1695', 'Black', 222, 8),
('992a3d47-1c93-481b-89a2-604ce8c3f430', 'GeForce RTX 3060', '1320', '1807', 'Black', 224, 12),
('9db196ab-d9dc-492e-ada3-18e28e59c4e5', 'GeForce GTX 1660 SUPER', '1530', '1815', 'Black / Silver', 204, 6),
('9fd58f6f-d7c6-41de-a0cb-162ae361298a', 'Radeon RX 6700 XT', '2321', '2581', 'Black', 304, 12),
('a0c731bf-b82d-490d-bfbb-ecf5a5cf8c52', 'GeForce RTX 3090', '1395', '1890', 'White / Black', 318, 24),
('a3960337-18c7-40a8-a37d-fd5b6b83fae1', 'GeForce RTX 3080', '1260', '1890', 'Black / Silver', 318, 12),
('a5b53507-b50c-47f8-84b0-204aa1bfda44', 'GeForce RTX 3070 Ti', '1575', '1770', 'Blackz', 267, 8),
('a64cee3b-212b-4b95-92eb-6f3589e85a9d', 'GeForce RTX 3060 Ti', '1410', '1670', 'Black / Silverz', 242, 8),
('ab0f91f4-864d-4067-b281-557102d49156', 'GeForce RTX 3090 Ti', '1560', '1860', 'Silver / Black', 313, 24),
('ab6b47a6-d703-4469-b3a1-a83f431a5ed0', 'GeForce RTX 3080', '1440', '1830', 'Black', 323, 10),
('ad27514c-fabb-46c5-a8d9-8d09dbe9cef6', 'GeForce RTX 3060 Ti', '1410', '1695', 'Black / Gray', 235, 8),
('addf3609-991d-4582-b813-58e5357756ff', 'GeForce RTX 3080', '1440', '1710', 'Blackz', 285, 10),
('ae309803-849e-4f09-88e5-e825a811cb87', 'Radeon RX 6700 XT', '2321', '2581', 'Black', 269, 12),
('aedbdee7-50a2-4383-90d0-b3763974e8dc', 'GeForce RTX 3070', '1500', '1845', 'Black / Silver', 323, 8),
('b322befc-bb62-4cea-8a75-0e3ba3b61750', 'GeForce GTX 1050 Ti', '1341', '1455', 'Black / White', 215, 4),
('b4a7a5f2-6d6d-4883-9d97-ec12069e2fa0', 'GeForce RTX 3090', '1395', '1800', 'Blackz', 300, 24),
('b64571d9-7500-4fe7-b319-7ed1b645926e', 'GeForce RTX 3090 Ti', '1560', '1920', 'Black', 300, 24),
('bc9d5d63-3708-4d12-b086-e56b0a11063d', 'Radeon RX 6700 XT', '2321', '0', 'Black / Silver', 247, 12),
('bd212c60-44e5-460a-bb8f-9a11390e9004', 'GeForce RTX 3060', '1320', '1837', 'Black / Silver', 276, 12),
('c097b424-2d34-4fc9-93f9-89b95b19f4c1', 'GeForce RTX 3080 Ti', '1365', '1770', 'Black / Silver', 324, 12),
('cc8db200-cdf2-408a-ade0-273d03b77b60', 'GeForce RTX 3060', '1320', '1882', 'Black', 202, 12),
('d137cc7b-e35a-4e99-8d28-25bf55483f1a', 'Radeon RX 6600', '1626', '2491', 'Black', 200, 8),
('d3d22ade-cb27-4524-8a70-abf8fa80a7c7', 'GeForce RTX 3060', '1320', '1867', 'White', 232, 12),
('d4afa558-284c-4ebe-a8c2-89cfc5e00228', 'GeForce RTX 3070', '1500', '1755', 'White', 232, 8),
('d63c8583-196f-40bd-bb3d-39ff1f533291', 'GeForce RTX 3070 Ti', '1575', '1830', 'Black / Silver', 320, 8),
('d8711ff7-442a-43e4-9702-969554ffbfe2', 'GeForce RTX 3080 Ti', '1365', '1695', 'Black', 300, 12),
('dd674f07-35c3-45b7-8229-9485695a7599', 'Arc A770', '2100', '0', 'Black', 250, 16),
('e491e81a-e1cf-4461-a565-c6d763b8fe74', 'GeForce RTX 4090', '2235', '2640', 'Black', 358, 24),
('e66c9a86-1a9c-4609-a5e0-2cec4c00c0ab', 'Radeon RX 6800 XT', '1825', '0', 'Black / Silver', 330, 16),
('e8975871-91e4-40d1-90b7-7261a95b5206', 'GeForce RTX 4090', '2235', '2520', 'Black', 331, 24),
('ea180440-b5b1-40c4-b9d2-c742106b9f94', 'GeForce RTX 3070 Ti', '1575', '1860', 'Black', 300, 8),
('eb76d805-2c5a-4dd8-945f-3c41a3d4ae55', 'GeForce RTX 3090', '1395', '1710', 'Black', 318, 24),
('eba11033-dbb1-4c30-bd3e-c3185a5f63bb', 'Radeon RX 6650 XT', '2055', '2694', 'Black / Gray', 282, 8),
('ec127b92-3645-4fec-a7e1-c551b8038034', 'GeForce RTX 3090', '1395', '0', 'Black', 300, 24),
('ecb9138c-50c5-48bf-a091-898a974388df', 'Radeon RX 6600', '1626', '2491', 'Black', 241, 8),
('f03b30f2-0776-4bb1-aae3-083ae96111d5', 'GeForce RTX 3080', '1260', '1815', 'Black / Gray', 323, 12),
('f26e5c40-8e04-44dc-b3e9-28c0c85126df', 'Radeon RX 6600', '1626', '2491', 'Black / Red', 193, 8),
('f2974b00-e55e-4b87-94e1-6d5d64af5d82', 'GeForce RTX 4090', '2230', '2520', 'Black / Silver', 304, 24),
('fa77aab9-6115-4d50-b8a4-3f606bae07af', 'GeForce RTX 3080 Ti', '1365', '1770', 'Black / Silver', 320, 12),
('fcbca153-aa45-4f52-a6bc-e9ca76c6e17b', 'GeForce RTX 2060', '1365', '1710', 'Gray / Black', 231, 6),
('fd1d21ce-785b-45ba-a0a3-c78b2265a8f6', 'GeForce RTX 2060', '1365', '1755', 'Black', 202, 6),
('fec9af08-1631-47e6-a815-c63a3885200a', 'Radeon RX 6800 XT', '1825', '2285', 'Black / Silver', 286, 16);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cpus`
--
ALTER TABLE `cpus`
  ADD CONSTRAINT `cpus_ibfk_1` FOREIGN KEY (`cpuTypeId`) REFERENCES `cpu_types` (`cpuTypeId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cpus_ibfk_id_1` FOREIGN KEY (`cpuId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cpu_familys`
--
ALTER TABLE `cpu_familys`
  ADD CONSTRAINT `cpu_familys_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `producers` (`brand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cpu_generations`
--
ALTER TABLE `cpu_generations`
  ADD CONSTRAINT `cpu_generations_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `producers` (`brand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cpu_types`
--
ALTER TABLE `cpu_types`
  ADD CONSTRAINT `cpu_types_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `producers` (`brand`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cpu_types_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `cpu_familys` (`processor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cpu_types_ibfk_3` FOREIGN KEY (`gen`) REFERENCES `cpu_generations` (`gen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cpu_types_ibfk_4` FOREIGN KEY (`socket`) REFERENCES `socket_types` (`socketName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `gpu_chipsets`
--
ALTER TABLE `gpu_chipsets`
  ADD CONSTRAINT `gpu_chipsets_ibfk_1` FOREIGN KEY (`chipsetBrand`) REFERENCES `producers` (`brand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `mainboards`
--
ALTER TABLE `mainboards`
  ADD CONSTRAINT `mainboards_ibfk_2` FOREIGN KEY (`chipset`) REFERENCES `mainboard_chipsets` (`chipsetName`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mainboards_ibfk_id_1` FOREIGN KEY (`mainboardId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `mainboard_chipsets`
--
ALTER TABLE `mainboard_chipsets`
  ADD CONSTRAINT `mainboard_chipsets_ibfk_1` FOREIGN KEY (`socket`) REFERENCES `socket_types` (`socketName`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mainboard_chipsets_ibfk_2` FOREIGN KEY (`ramStandard`) REFERENCES `ram_standards` (`ramStandard`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `monitors`
--
ALTER TABLE `monitors`
  ADD CONSTRAINT `monitors_ibfk_id_1` FOREIGN KEY (`monitorId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `mouses`
--
ALTER TABLE `mouses`
  ADD CONSTRAINT `mouses_ibfk_id_1` FOREIGN KEY (`mouseId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`status`) REFERENCES `order_status` (`status`) ON UPDATE CASCADE,
  ADD CONSTRAINT `username_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `orderId_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productId_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`productBrand`) REFERENCES `producers` (`brand`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_type_ibfk_1` FOREIGN KEY (`productType`) REFERENCES `product_types` (`productType`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `rams`
--
ALTER TABLE `rams`
  ADD CONSTRAINT `rams_ibfk_1` FOREIGN KEY (`ramId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rams_ibfk_2` FOREIGN KEY (`standard`) REFERENCES `ram_standards` (`ramStandard`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD CONSTRAINT `refreshtokens_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `storage_drives`
--
ALTER TABLE `storage_drives`
  ADD CONSTRAINT `storage_drives_ibfk_id_1` FOREIGN KEY (`storageDriveId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`roleName`) REFERENCES `roles` (`roleName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `video_cards`
--
ALTER TABLE `video_cards`
  ADD CONSTRAINT `video_cards_ibfk_2` FOREIGN KEY (`chipsetName`) REFERENCES `gpu_chipsets` (`chipsetName`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `video_cards_ibfk_id_1` FOREIGN KEY (`videoCardId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
