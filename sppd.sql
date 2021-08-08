-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 05:10 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sppd`
--

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `golongan` varchar(100) NOT NULL,
  `golongan_tanggal` date NOT NULL DEFAULT '0000-00-00',
  `jabatan` varchar(100) NOT NULL,
  `jabatan_tanggal` date NOT NULL DEFAULT '0000-00-00',
  `kerja_tahun` int(4) NOT NULL,
  `kerja_bulan` int(4) NOT NULL,
  `latihan_jabatan` varchar(100) DEFAULT NULL,
  `latihan_jabatan_tanggal` date DEFAULT '0000-00-00',
  `latihan_jabatan_jam` int(4) DEFAULT 0,
  `pendidikan` varchar(100) NOT NULL,
  `pendidikan_lulus` varchar(4) NOT NULL,
  `pendidikan_ijazah` varchar(100) NOT NULL,
  `catatan_mutasi` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `username_update` varchar(100) DEFAULT NULL,
  `datetime_insert` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `datetime_update` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status_deleted` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `pegawai`
--
DELIMITER $$
CREATE TRIGGER `oninsert_pegawai` BEFORE INSERT ON `pegawai` FOR EACH ROW IF NEW.datetime_insert = '0000-00-00 00:00:00' THEN
 SET NEW.datetime_insert = CURRENT_TIMESTAMP() ;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sc_config`
--

CREATE TABLE `sc_config` (
  `Id` bigint(20) NOT NULL,
  `Config_Key` varchar(255) NOT NULL,
  `Config_Table` varchar(50) DEFAULT NULL COMMENT 'jika join for meta value',
  `Config_Id` bigint(20) DEFAULT NULL COMMENT 'for id meta value',
  `Config_Value` longtext DEFAULT NULL,
  `AutoLoad` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sc_config`
--

INSERT INTO `sc_config` (`Id`, `Config_Key`, `Config_Table`, `Config_Id`, `Config_Value`, `AutoLoad`) VALUES
(1, 'sc_front_url', '', 0, 'http://localhost/sapeltu_team/github/prg_sppd/', '0'),
(2, 'sc_front_title', '', 0, 'SPPD', '0'),
(3, 'sc_logo', '', 0, './uploaded/logo_header.jpg', '0'),
(4, 'sc_header', '', 0, './uploaded/logo_header.jpg', '0'),
(5, 'sc_admin', '', 0, '0000,0005', '0'),
(6, 'sc_kepala_dinas', '', 0, '1958060519860811001', '0'),
(7, 'sc_company', '', 0, 'Kantor Resmi', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sc_config_log`
--

CREATE TABLE `sc_config_log` (
  `Id` bigint(11) NOT NULL,
  `LogTable` varchar(20) NOT NULL,
  `LogWaktu` datetime DEFAULT NULL,
  `LogCrud` varchar(10) NOT NULL,
  `LogKeterangan` longtext DEFAULT NULL,
  `LogIp` varchar(30) NOT NULL,
  `LogUserName` varchar(100) NOT NULL,
  `LogSQL` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sc_config_log`
--

INSERT INTO `sc_config_log` (`Id`, `LogTable`, `LogWaktu`, `LogCrud`, `LogKeterangan`, `LogIp`, `LogUserName`, `LogSQL`) VALUES
(1, 'username', '2021-08-08 22:09:28', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE username  set LastLogin = \'2021-08-08 10:09:28\'  WHERE UserName = \'admin\' and Password like \'772b0c2974cfb52801d48d79a44131e2e7302538%\'');

-- --------------------------------------------------------

--
-- Table structure for table `sc_kode`
--

CREATE TABLE `sc_kode` (
  `Kode` varchar(20) NOT NULL DEFAULT '',
  `Data` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sc_master`
--

CREATE TABLE `sc_master` (
  `Id` bigint(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Stat` varchar(100) DEFAULT NULL,
  `OtherString` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sc_master`
--

INSERT INTO `sc_master` (`Id`, `Title`, `Description`, `Stat`, `OtherString`) VALUES
(1, 'Ia', 'Juru Muda', 'gol', NULL),
(2, 'Ib', 'Juru Muda Tk. I', 'gol', NULL),
(3, 'Ic', 'Juru', 'gol', NULL),
(4, 'Id', 'Juru Tk. I', 'gol', NULL),
(5, 'IIa', 'Pengatur Muda', 'gol', NULL),
(6, 'IIb', 'Pengatur Muda Tk. I', 'gol', NULL),
(7, 'IIc', 'Pengatur', 'gol', NULL),
(8, 'IId', 'Pengatur  Tk. I', 'gol', NULL),
(9, 'IIIa', 'Penata Muda', 'gol', NULL),
(10, 'IIIb', 'Penata Muda Tk. I', 'gol', NULL),
(11, 'IIIc', 'Penata', 'gol', NULL),
(12, 'IIId', 'Penata Tk. I', 'gol', NULL),
(13, 'IVa', 'Pembina', 'gol', NULL),
(14, 'IVb', 'Pembina Tk. I', 'gol', NULL),
(15, 'IVc', 'Pembina Utama Muda', 'gol', NULL),
(16, 'IVd', 'Pembina Utama Madya', 'gol', NULL),
(17, 'IVe', 'Pembina Utama', 'gol', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sppd`
--

CREATE TABLE `sppd` (
  `id` bigint(11) NOT NULL,
  `letter_code` varchar(100) NOT NULL,
  `letter_subject` varchar(100) NOT NULL,
  `letter_about` varchar(100) NOT NULL,
  `letter_from` varchar(100) NOT NULL,
  `letter_content` text NOT NULL,
  `letter_date` date NOT NULL DEFAULT '0000-00-00',
  `code` varchar(30) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `nip_pejabat` varchar(100) NOT NULL,
  `nip_leader` varchar(100) NOT NULL,
  `rate_travel` varchar(100) NOT NULL,
  `nip` text NOT NULL,
  `purpose` text NOT NULL,
  `transport` varchar(255) NOT NULL,
  `place_from` varchar(100) NOT NULL,
  `place_to` varchar(100) NOT NULL,
  `length_journey` int(3) NOT NULL,
  `date_go` date NOT NULL DEFAULT '0000-00-00',
  `date_back` date NOT NULL DEFAULT '0000-00-00',
  `government` varchar(255) NOT NULL,
  `budget` double(16,2) NOT NULL DEFAULT 0.00,
  `budget_from` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `result_date` date NOT NULL,
  `result` text NOT NULL,
  `result_username` varchar(100) NOT NULL,
  `result_username_update` varchar(100) NOT NULL,
  `file` longtext NOT NULL,
  `file_update` longtext NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 : diinput  1 : dicetak 2 : selesai',
  `username` varchar(100) NOT NULL,
  `username_update` varchar(100) NOT NULL,
  `datetime_insert` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `datetime_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `sppd`
--
DELIMITER $$
CREATE TRIGGER `oninsert_sppd` BEFORE INSERT ON `sppd` FOR EACH ROW IF NEW.datetime_insert = '0000-00-00 00:00:00' THEN
 SET NEW.datetime_insert = CURRENT_TIMESTAMP() ;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Stat` varchar(20) NOT NULL COMMENT 'editor,administrator,approval',
  `LastLogin` datetime NOT NULL,
  `UserName_Target` varchar(100) NOT NULL,
  `Foto` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `username`
--

INSERT INTO `username` (`UserName`, `Password`, `FullName`, `Stat`, `LastLogin`, `UserName_Target`, `Foto`, `Email`) VALUES
('admin', '772b0c2974cfb52801d48d79a44131e2e73025380005', 'Admin', '', '2021-08-08 10:09:28', '', './uploaded/profile/admin.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `username_level`
--

CREATE TABLE `username_level` (
  `Kode` char(4) NOT NULL DEFAULT '',
  `Keterangan` varchar(30) DEFAULT NULL,
  `Isi` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `username_level`
--

INSERT INTO `username_level` (`Kode`, `Keterangan`, `Isi`) VALUES
('0001', 'User Entry SPPD', 'fa32b931ace6321ce98805ecd7b60e04'),
('0002', 'User Entry Pegawai', 'aa68e4bfdee71cf9beb81c54cd9f7259'),
('0003', 'Lihat Daftar SPPD', '7148512423c82bcdc7d008f56e9cf7cd'),
('0004', 'User Pegawai', '8435f2b7f35819153a8727da67b41606'),
('0005', 'Director', '2c2990da714a1c734afbaa058241daff,aa68e4bfdee71cf9beb81c54cd9f7259,fa32b931ace6321ce98805ecd7b60e04,7148512423c82bcdc7d008f56e9cf7cd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `sc_config`
--
ALTER TABLE `sc_config`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sc_config_log`
--
ALTER TABLE `sc_config_log`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sc_kode`
--
ALTER TABLE `sc_kode`
  ADD PRIMARY KEY (`Kode`);

--
-- Indexes for table `sc_master`
--
ALTER TABLE `sc_master`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sppd`
--
ALTER TABLE `sppd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `nip_leader` (`nip_leader`);

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `username_level`
--
ALTER TABLE `username_level`
  ADD PRIMARY KEY (`Kode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sc_config`
--
ALTER TABLE `sc_config`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sc_config_log`
--
ALTER TABLE `sc_config_log`
  MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sc_master`
--
ALTER TABLE `sc_master`
  MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sppd`
--
ALTER TABLE `sppd`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
