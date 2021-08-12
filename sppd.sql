-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2021 at 09:56 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sppd`
--

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
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
  `latihan_jabatan_jam` int(4) DEFAULT '0',
  `pendidikan` varchar(100) NOT NULL,
  `pendidikan_lulus` varchar(4) NOT NULL,
  `pendidikan_ijazah` varchar(100) NOT NULL,
  `catatan_mutasi` text,
  `keterangan` text,
  `pajak` int(255) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `username_update` varchar(100) DEFAULT NULL,
  `datetime_insert` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `datetime_update` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status_deleted` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `no_hp`, `alamat`, `tanggal_lahir`, `tempat_lahir`, `golongan`, `golongan_tanggal`, `jabatan`, `jabatan_tanggal`, `kerja_tahun`, `kerja_bulan`, `latihan_jabatan`, `latihan_jabatan_tanggal`, `latihan_jabatan_jam`, `pendidikan`, `pendidikan_lulus`, `pendidikan_ijazah`, `catatan_mutasi`, `keterangan`, `pajak`, `username`, `username_update`, `datetime_insert`, `datetime_update`, `status_deleted`) VALUES
(1, '1103184060', 'AULIA RAHMAN', '', '', '0000-00-00', '', '1', '0000-00-00', 'ABC', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 10, 'admin', NULL, '2021-08-12 17:34:25', '0000-00-00 00:00:00', '1'),
(2, '1103184061', 'SIAPA HAYO', '', '', '0000-00-00', '', '28', '0000-00-00', 'ABC', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 10, 'admin', 'admin', '2021-08-12 17:35:09', '2021-08-12 18:15:02', '1'),
(3, '1103183045', 'ARDHANA SETYADI', '', '', '0000-00-00', '', '21', '0000-00-00', 'ABC', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-12 17:35:28', '0000-00-00 00:00:00', '1'),
(4, '110318405592', 'HANIF KUKUH RAHARJO', '', '', '0000-00-00', '', '21', '0000-00-00', 'ABC', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-12 17:35:45', '0000-00-00 00:00:00', '1'),
(5, '11038182828', 'MALVIANDI', '', '', '0000-00-00', '', '21', '0000-00-00', 'ABC', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-12 17:36:03', '0000-00-00 00:00:00', '1'),
(6, '220939231', 'IZZU ZANTYA FAWAZ', '', '', '0000-00-00', '', '21', '0000-00-00', 'ABC', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 20, 'admin', NULL, '2021-08-12 17:36:19', '0000-00-00 00:00:00', '1');

--
-- Triggers `pegawai`
--
DELIMITER //
CREATE TRIGGER `oninsert_pegawai` BEFORE INSERT ON `pegawai`
 FOR EACH ROW IF NEW.datetime_insert = '0000-00-00 00:00:00' THEN
 SET NEW.datetime_insert = CURRENT_TIMESTAMP() ;
END IF
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sc_config`
--

CREATE TABLE IF NOT EXISTS `sc_config` (
`Id` bigint(20) NOT NULL,
  `Config_Key` varchar(255) NOT NULL,
  `Config_Table` varchar(50) DEFAULT NULL COMMENT 'jika join for meta value',
  `Config_Id` bigint(20) DEFAULT NULL COMMENT 'for id meta value',
  `Config_Value` longtext,
  `AutoLoad` char(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `sc_config_log` (
`Id` bigint(11) NOT NULL,
  `LogTable` varchar(20) NOT NULL,
  `LogWaktu` datetime DEFAULT NULL,
  `LogCrud` varchar(10) NOT NULL,
  `LogKeterangan` longtext,
  `LogIp` varchar(30) NOT NULL,
  `LogUserName` varchar(100) NOT NULL,
  `LogSQL` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sc_config_log`
--

INSERT INTO `sc_config_log` (`Id`, `LogTable`, `LogWaktu`, `LogCrud`, `LogKeterangan`, `LogIp`, `LogUserName`, `LogSQL`) VALUES
(1, 'pegawai', '2021-08-13 00:34:25', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''1103184060'',''AULIA RAHMAN'',''1'',''ABC'',''10'',''admin'')'),
(2, 'pegawai', '2021-08-13 00:35:09', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''1103184061'',''SIAPA HAYO'',''19'',''ABC'',''10'',''admin'')'),
(3, 'pegawai', '2021-08-13 00:35:28', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''1103183045'',''ARDHANA SETYADI'',''21'',''ABC'',''15'',''admin'')'),
(4, 'pegawai', '2021-08-13 00:35:45', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''110318405592'',''HANIF KUKUH RAHARJO'',''21'',''ABC'',''15'',''admin'')'),
(5, 'pegawai', '2021-08-13 00:36:03', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''11038182828'',''MALVIANDI'',''21'',''ABC'',''15'',''admin'')'),
(6, 'pegawai', '2021-08-13 00:36:19', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''220939231'',''IZZU ZANTYA FAWAZ'',''21'',''ABC'',''20'',''admin'')'),
(7, 'sppd', '2021-08-13 00:37:14', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO sppd (letter_content,code,nip_pejabat,nip_leader,rate_travel,nip,purpose,transport,place_from,place_to,length_journey,date_go,date_back,description,inputjenis,b_transport,b_tol,b_sewamobil,b_penginapan,username,date) VALUES ('''',''001/10A04/MGT/RT.13/08/2021'',''1103184060'',''1103184061'','''',''1103183045,110318405592,11038182828,220939231'',''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'',''Pesawat Udara'',''PADANG'',''USA'',''1'',''2021-08-13'',''2021-08-13'',''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'',''Dalam Kota'',''1000000'','''','''','''',''admin'',''2021-08-13'')'),
(8, 'pegawai', '2021-08-13 01:15:02', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE pegawai  set nip = ''1103184061'' , nama = ''SIAPA HAYO'' , golongan = ''28'' , jabatan = ''ABC'' , pajak = ''10'' , username_update = ''admin''  WHERE nip = ''1103184061'''),
(9, 'sppd', '2021-08-13 01:16:29', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE sppd  set letter_content = '''' , code = ''001/10A04/MGT/RT.13/08/2021'' , nip_pejabat = ''1103184060'' , nip_leader = ''1103184061'' , rate_travel = '''' , nip = ''1103183045,110318405592,11038182828,220939231'' , purpose = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , transport = ''Pesawat Udara'' , place_from = ''PADANG'' , place_to = ''USA'' , length_journey = ''1'' , date_go = ''2021-08-13'' , date_back = ''2021-08-13'' , description = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , inputjenis = ''LUAR KOTA'' , b_transport = ''1000000'' , b_tol = ''1000000'' , b_sewamobil = ''1000000'' , b_penginapan = ''1000000'' , username_update = ''admin''  WHERE code = ''001/10A04/MGT/RT.13/08/2021'''),
(10, 'sppd', '2021-08-13 02:32:08', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE sppd  set letter_content = '''' , code = ''001/10A04/MGT/RT.13/08/2021'' , nip_pejabat = ''1103184060'' , nip_leader = ''1103184061'' , rate_travel = '''' , nip = ''1103183045,220939231'' , purpose = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , transport = ''Pesawat Udara'' , place_from = ''PADANG'' , place_to = ''USA'' , length_journey = ''1'' , date_go = ''2021-08-13'' , date_back = ''2021-08-13'' , description = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , inputjenis = ''LUAR KOTA'' , b_transport = ''1000000'' , b_tol = ''1000000'' , b_sewamobil = ''1000000'' , b_penginapan = ''1000000'' , username_update = ''admin''  WHERE code = ''001/10A04/MGT/RT.13/08/2021'''),
(11, 'sppd', '2021-08-13 02:32:36', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE sppd  set letter_content = '''' , code = ''001/10A04/MGT/RT.13/08/2021'' , nip_pejabat = ''1103184060'' , nip_leader = ''1103184061'' , rate_travel = '''' , nip = ''1103183045,220939231'' , purpose = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , transport = ''Pesawat Udara'' , place_from = ''PADANG'' , place_to = ''USA'' , length_journey = ''1'' , date_go = ''2021-08-13'' , date_back = ''2021-08-13'' , description = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , inputjenis = ''LUAR KOTA'' , b_transport = ''1000000'' , b_tol = '''' , b_sewamobil = '''' , b_penginapan = '''' , username_update = ''admin''  WHERE code = ''001/10A04/MGT/RT.13/08/2021'''),
(12, 'sppd', '2021-08-13 02:51:43', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE sppd  set letter_content = '''' , code = ''001/10A04/MGT/RT.13/08/2021'' , nip_pejabat = ''1103184060'' , nip_leader = ''1103184061'' , rate_travel = '''' , nip = ''1103183045,220939231,11038182828,110318405592,1103184060'' , purpose = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , transport = ''Pesawat Udara'' , place_from = ''PADANG'' , place_to = ''USA'' , length_journey = ''1'' , date_go = ''2021-08-13'' , date_back = ''2021-08-13'' , description = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , inputjenis = ''LUAR KOTA'' , b_transport = ''1000000'' , b_tol = ''0'' , b_sewamobil = ''0'' , b_penginapan = ''0'' , username_update = ''admin''  WHERE code = ''001/10A04/MGT/RT.13/08/2021''');

-- --------------------------------------------------------

--
-- Table structure for table `sc_kode`
--

CREATE TABLE IF NOT EXISTS `sc_kode` (
  `Kode` varchar(255) NOT NULL DEFAULT '',
  `Data` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sc_kode`
--

INSERT INTO `sc_kode` (`Kode`, `Data`) VALUES
('/10A04/MGT/RT.13/08/2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_master`
--

CREATE TABLE IF NOT EXISTS `sc_master` (
`Id` bigint(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Stat` varchar(100) DEFAULT NULL,
  `OtherString` longtext
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sc_master`
--

INSERT INTO `sc_master` (`Id`, `Title`, `Description`, `Stat`, `OtherString`) VALUES
(1, 'I', '', 'gol', NULL),
(18, 'II', '', 'gol', NULL),
(19, 'III', '', 'gol', NULL),
(20, 'IV', '', 'gol', NULL),
(21, 'V', '', 'gol', NULL),
(22, 'VI', '', 'gol', NULL),
(23, 'VII', '', 'gol', NULL),
(24, 'VIII', '', 'gol', NULL),
(25, 'IX', '', 'gol', NULL),
(26, 'X', '', 'gol', NULL),
(27, 'XI', '', 'gol', NULL),
(28, 'XII', '', 'gol', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sppd`
--

CREATE TABLE IF NOT EXISTS `sppd` (
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
  `budget` double(16,2) NOT NULL DEFAULT '0.00',
  `inputjenis` varchar(255) NOT NULL,
  `b_transport` int(255) NOT NULL,
  `b_tol` int(255) NOT NULL,
  `b_sewamobil` int(255) NOT NULL,
  `b_penginapan` int(255) NOT NULL,
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
  `datetime_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sppd`
--

INSERT INTO `sppd` (`id`, `letter_code`, `letter_subject`, `letter_about`, `letter_from`, `letter_content`, `letter_date`, `code`, `date`, `nip_pejabat`, `nip_leader`, `rate_travel`, `nip`, `purpose`, `transport`, `place_from`, `place_to`, `length_journey`, `date_go`, `date_back`, `government`, `budget`, `inputjenis`, `b_transport`, `b_tol`, `b_sewamobil`, `b_penginapan`, `budget_from`, `description`, `result_date`, `result`, `result_username`, `result_username_update`, `file`, `file_update`, `status`, `username`, `username_update`, `datetime_insert`, `datetime_update`) VALUES
(1, '', '', '', '', '', '0000-00-00', '001/10A04/MGT/RT.13/08/2021', '2021-08-13', '1103184060', '1103184061', '', '1103183045,220939231,11038182828,110318405592,1103184060', 'Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna', 'Pesawat Udara', 'PADANG', 'USA', 1, '2021-08-13', '2021-08-13', '', 0.00, 'LUAR KOTA', 1000000, 0, 0, 0, '', 'Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna', '0000-00-00', '', '', '', '', '', '1', 'admin', 'admin', '2021-08-12 17:37:14', '2021-08-12 19:51:43');

--
-- Triggers `sppd`
--
DELIMITER //
CREATE TRIGGER `oninsert_sppd` BEFORE INSERT ON `sppd`
 FOR EACH ROW IF NEW.datetime_insert = '0000-00-00 00:00:00' THEN
 SET NEW.datetime_insert = CURRENT_TIMESTAMP() ;
END IF
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE IF NOT EXISTS `username` (
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
('admin', '772b0c2974cfb52801d48d79a44131e2e73025380005', 'Admin', '', '2021-08-12 08:49:07', '', './uploaded/profile/admin.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `username_level`
--

CREATE TABLE IF NOT EXISTS `username_level` (
  `Kode` char(4) NOT NULL DEFAULT '',
  `Keterangan` varchar(30) DEFAULT NULL,
  `Isi` longtext
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
 ADD PRIMARY KEY (`id`), ADD KEY `nip` (`nip`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `code` (`code`), ADD KEY `nip_leader` (`nip_leader`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sc_config`
--
ALTER TABLE `sc_config`
MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sc_config_log`
--
ALTER TABLE `sc_config_log`
MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sc_master`
--
ALTER TABLE `sc_master`
MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `sppd`
--
ALTER TABLE `sppd`
MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
