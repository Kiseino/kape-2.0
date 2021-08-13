-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 04:40 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `no_hp`, `alamat`, `tanggal_lahir`, `tempat_lahir`, `golongan`, `golongan_tanggal`, `jabatan`, `jabatan_tanggal`, `kerja_tahun`, `kerja_bulan`, `latihan_jabatan`, `latihan_jabatan_tanggal`, `latihan_jabatan_jam`, `pendidikan`, `pendidikan_lulus`, `pendidikan_ijazah`, `catatan_mutasi`, `keterangan`, `pajak`, `username`, `username_update`, `datetime_insert`, `datetime_update`, `status_deleted`) VALUES
(7, '780 007 360', 'YULIANI ALZAM', '', '', '0000-00-00', '', '26', '0000-00-00', 'PEMIMPIN CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 25, 'admin', NULL, '2021-08-13 01:55:17', '0000-00-00 00:00:00', '1'),
(8, '067 906 026', 'IMAS IIN LASMAWATI', '', '', '0000-00-00', '', '28', '0000-00-00', 'WAKIL PEMIMPIN CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 25, 'admin', NULL, '2021-08-13 01:56:40', '0000-00-00 00:00:00', '1'),
(9, '068 106 084', 'NI NYOMAN HENNY DESSYANTI', '', '', '0000-00-00', '', '28', '0000-00-00', 'AUDITOR MUDA KANTOR CABANG BANDUNG KANWIL JABAR', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 25, 'admin', NULL, '2021-08-13 01:58:43', '0000-00-00 00:00:00', '1'),
(10, '118 811 065', 'TEGUH RIDHO ZAMAN', '', '', '0000-00-00', '', '27', '0000-00-00', 'KASI OPERASIONAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 01:59:29', '0000-00-00 00:00:00', '1'),
(11, '168 916 217', 'ADITYA PRATAMA', '', '', '0000-00-00', '', '24', '0000-00-00', 'STAF KANTOR CABANG BANDUNG KANWIL JABAR', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:00:21', '0000-00-00 00:00:00', '1'),
(12, '118 711 025', 'FAJAR MAULLY PRATAMA', '', '', '0000-00-00', '', '27', '0000-00-00', 'KASI PENGADAAN KANCAB BANDUNG KANWIL JABAR', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:01:44', '0000-00-00 00:00:00', '1'),
(13, '179 117 004', 'ANWAR HUSEN', '', '', '0000-00-00', '', '26', '0000-00-00', 'STAF PENGADAAN CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:02:33', '0000-00-00 00:00:00', '1'),
(14, '128 712 231', 'UZI NUGRAHA', '', '', '0000-00-00', '', '27', '0000-00-00', 'KASI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:03:22', '0000-00-00 00:00:00', '1'),
(15, '199 919 219', 'BAGUS ANGGA BOEDY PRADEWA', '', '', '0000-00-00', '', '21', '0000-00-00', 'STAF SEKSI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 5, 'admin', NULL, '2021-08-13 02:07:27', '0000-00-00 00:00:00', '1'),
(16, '169 116 725', 'YUKI YULYADIN', '', '', '0000-00-00', '', '22', '0000-00-00', 'STAF SEKSI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:08:12', '0000-00-00 00:00:00', '1'),
(17, '199 419 203', 'AHMAD IHLAS NURKARIM', '', '', '0000-00-00', '', '23', '0000-00-00', 'STAF SEKSI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:09:05', '0000-00-00 00:00:00', '1'),
(18, '199 619 241', 'DOA VEGA ADJIE PANGESTU', '', '', '0000-00-00', '', '21', '0000-00-00', 'STAF SEKSI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 5, 'admin', NULL, '2021-08-13 02:10:48', '0000-00-00 00:00:00', '1'),
(19, '096 909 199', 'ERLANGGA SURYA', '', '', '0000-00-00', '', '23', '0000-00-00', 'STAF SEKSI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:12:09', '0000-00-00 00:00:00', '1'),
(20, '198 219 679', 'ENDE RARAN', '', '', '0000-00-00', '', '25', '0000-00-00', 'STAF SEKSI KOMERSIAL CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 5, 'admin', NULL, '2021-08-13 02:12:55', '0000-00-00 00:00:00', '1'),
(21, '128 812 275', 'RAGA YUDISTIRA', '', '', '0000-00-00', '', '27', '0000-00-00', 'KEPALA SEKSI PBI KANCAB BANDUNG KANWIL JABAR', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:20:03', '0000-00-00 00:00:00', '1'),
(22, '199 519 208', 'MUHAMMAD RAUUF', '', '', '0000-00-00', '', '23', '0000-00-00', 'STAF PENGEMBANGAN BISNIS DAN INDUSTRI CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:21:30', '0000-00-00 00:00:00', '1'),
(23, '168 916 473', 'KRISTINA INDRIANI AIPASSA', '', '', '0000-00-00', '', '26', '0000-00-00', 'KASI ADMINISTRASI DAN KEUANGAN CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:22:23', '0000-00-00 00:00:00', '1'),
(24, '169 316 297', 'CANTIKA GUSTIANA', '', '', '0000-00-00', '', '24', '0000-00-00', 'KASIR MINKU CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:23:09', '0000-00-00 00:00:00', '1'),
(25, '169 416 724', 'YOHANA SURYA CITRA', '', '', '0000-00-00', '', '24', '0000-00-00', 'STAF MINKU CABANG BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:25:13', '0000-00-00 00:00:00', '1'),
(26, '118 711 012', 'WILLMA ADISTY', '', '', '0000-00-00', '', '27', '0000-00-00', 'KASI AKUNTANSI KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:26:18', '0000-00-00 00:00:00', '1'),
(27, '169 216 548', 'MULIA LESTARI', '', '', '0000-00-00', '', '26', '0000-00-00', 'STAF AKUNTANSI KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:26:58', '0000-00-00 00:00:00', '1'),
(28, '168 916 583', 'OCTA SATRIA CAKRA DWI P.', '', '', '0000-00-00', '', '24', '0000-00-00', 'KA GBB GUDANG CISARANTEN KIDUL ( B ) KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:28:31', '0000-00-00 00:00:00', '1'),
(29, '158 315 141', 'EDY RUSTANDI', '', '', '0000-00-00', '', '22', '0000-00-00', 'JURTIM GBB CISARANTEN KIDUL BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:29:30', '0000-00-00 00:00:00', '1'),
(30, '199 919 234', 'ZIDAN FAJAR RAMADHAN', '', '', '0000-00-00', '', '21', '0000-00-00', 'STAF GBB CISARANTEN KIDUL BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 5, 'admin', NULL, '2021-08-13 02:30:38', '0000-00-00 00:00:00', '1'),
(31, '780 006 690', 'E.RAHMAWAN', '', '', '0000-00-00', '', '27', '0000-00-00', 'KA GBB UTAMA BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:31:41', '0000-00-00 00:00:00', '1'),
(32, '158 515 152', 'DINDIN KURNIA JAENUDIN', '', '', '0000-00-00', '', '22', '0000-00-00', 'JURTIM GBB GUDANG UTAMA KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:32:45', '0000-00-00 00:00:00', '1'),
(33, '199 819 237', 'RENAL RIZKIAWAN', '', '', '0000-00-00', '', '21', '0000-00-00', 'STAFF GBB UTAMA BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 5, 'admin', NULL, '2021-08-13 02:33:22', '0000-00-00 00:00:00', '1'),
(34, '087 608 669', 'IKHSAN ARIEF', '', '', '0000-00-00', '', '24', '0000-00-00', 'PJS1 KA GBB CITEUREUP KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:34:26', '0000-00-00 00:00:00', '1'),
(35, '087 008 095', 'DENI RAKHMAT', '', '', '0000-00-00', '', '24', '0000-00-00', 'JURTIM GUDANG CITEUREUP ( B ) KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:35:00', '0000-00-00 00:00:00', '1'),
(36, '088 308 652', 'ASEP SUDIANA', '', '', '0000-00-00', '', '24', '0000-00-00', 'KA GBB PASEH KIDUL KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:36:03', '0000-00-00 00:00:00', '1'),
(37, '158 315 143', 'HENDRI RAHMAT HIDAYAT', '', '', '0000-00-00', '', '22', '0000-00-00', 'JURTIM GBB PASEH KIDUL BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:36:55', '0000-00-00 00:00:00', '1'),
(38, '158 415 148', 'SUCIPTA', '', '', '0000-00-00', '', '22', '0000-00-00', 'PJS1 MANAJGER PUSAT PUSAT DISTRIBUSI CISARANTEN KIDUL KANCAB BANDUNG', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:38:02', '0000-00-00 00:00:00', '1'),
(39, '179 317 033', 'NURLAELA HARYATIK', '', '', '0000-00-00', '', '26', '0000-00-00', 'MANAGER ADM PUSAT DISTRIBUSI E-MARKETPLACE CISARANTEN KIDUL', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:39:04', '0000-00-00 00:00:00', '1'),
(40, '199 719 211', 'DIVA DIOVANI', '', '', '0000-00-00', '', '23', '0000-00-00', 'PETUGAS ADM PUSAT DISTRIBUSI E-MARKETPLACE CISARANTEN KIDUL', '0000-00-00', 0, 0, NULL, '0000-00-00', 0, '', '', '', NULL, NULL, 15, 'admin', NULL, '2021-08-13 02:39:40', '0000-00-00 00:00:00', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

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
(12, 'sppd', '2021-08-13 02:51:43', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE sppd  set letter_content = '''' , code = ''001/10A04/MGT/RT.13/08/2021'' , nip_pejabat = ''1103184060'' , nip_leader = ''1103184061'' , rate_travel = '''' , nip = ''1103183045,220939231,11038182828,110318405592,1103184060'' , purpose = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , transport = ''Pesawat Udara'' , place_from = ''PADANG'' , place_to = ''USA'' , length_journey = ''1'' , date_go = ''2021-08-13'' , date_back = ''2021-08-13'' , description = ''Mencari Kitab Suci Pada Negeri Api yang akan menyerang Kerajaan Avatar, dan membantu Goku dalam mencari 9 bola gaguna'' , inputjenis = ''LUAR KOTA'' , b_transport = ''1000000'' , b_tol = ''0'' , b_sewamobil = ''0'' , b_penginapan = ''0'' , username_update = ''admin''  WHERE code = ''001/10A04/MGT/RT.13/08/2021'''),
(13, 'username', '2021-08-13 08:44:21', 'edit', NULL, '127.0.0.1', 'admin', 'UPDATE username  set LastLogin = ''2021-08-13 08:44:21''  WHERE UserName = ''admin'' and Password like ''772b0c2974cfb52801d48d79a44131e2e7302538%'''),
(14, 'pegawai', '2021-08-13 08:55:17', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''780 007 360'',''YULIANI ALZAM'',''26'',''PEMIMPIN CABANG BANDUNG'',''25'',''admin'')'),
(15, 'pegawai', '2021-08-13 08:56:40', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''067 906 026'',''IMAS IIN LASMAWATI'',''28'',''WAKIL PEMIMPIN CABANG BANDUNG'',''25'',''admin'')'),
(16, 'pegawai', '2021-08-13 08:56:48', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM pegawai WHERE nip = ''1103184060'''),
(17, 'sppd', '2021-08-13 08:57:05', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM sppd WHERE code = ''001/10A04/MGT/RT.13/08/2021'''),
(18, 'pegawai', '2021-08-13 08:57:20', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM pegawai WHERE nip = ''1103183045'''),
(19, 'pegawai', '2021-08-13 08:57:28', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM pegawai WHERE nip = ''110318405592'''),
(20, 'pegawai', '2021-08-13 08:57:34', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM pegawai WHERE nip = ''11038182828'''),
(21, 'pegawai', '2021-08-13 08:57:41', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM pegawai WHERE nip = ''220939231'''),
(22, 'pegawai', '2021-08-13 08:57:45', 'delete', NULL, '127.0.0.1', 'admin', 'DELETE FROM pegawai WHERE nip = ''1103184061'''),
(23, 'pegawai', '2021-08-13 08:58:43', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''068 106 084'',''NI NYOMAN HENNY DESSYANTI'',''28'',''AUDITOR MUDA KANTOR CABANG BANDUNG KANWIL JABAR'',''25'',''admin'')'),
(24, 'pegawai', '2021-08-13 08:59:29', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''118 811 065'',''TEGUH RIDHO ZAMAN'',''27'',''KASI OPERASIONAL CABANG BANDUNG'',''15'',''admin'')'),
(25, 'pegawai', '2021-08-13 09:00:21', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''168 916 217'',''ADITYA PRATAMA'',''24'',''STAF KANTOR CABANG BANDUNG KANWIL JABAR'',''15'',''admin'')'),
(26, 'pegawai', '2021-08-13 09:01:44', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''118 711 025'',''FAJAR MAULLY PRATAMA'',''27'',''KASI PENGADAAN KANCAB BANDUNG KANWIL JABAR'',''15'',''admin'')'),
(27, 'pegawai', '2021-08-13 09:02:34', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''179 117 004'',''ANWAR HUSEN'',''26'',''STAF PENGADAAN CABANG BANDUNG'',''15'',''admin'')'),
(28, 'pegawai', '2021-08-13 09:03:22', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''128 712 231'',''UZI NUGRAHA'',''27'',''KASI KOMERSIAL CABANG BANDUNG'',''15'',''admin'')'),
(29, 'pegawai', '2021-08-13 09:07:27', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 919 219'',''BAGUS ANGGA BOEDY PRADEWA'',''21'',''STAF SEKSI KOMERSIAL CABANG BANDUNG'',''5'',''admin'')'),
(30, 'pegawai', '2021-08-13 09:08:12', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''169 116 725'',''YUKI YULYADIN'',''22'',''STAF SEKSI KOMERSIAL CABANG BANDUNG'',''15'',''admin'')'),
(31, 'pegawai', '2021-08-13 09:09:05', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 419 203'',''AHMAD IHLAS NURKARIM'',''23'',''STAF SEKSI KOMERSIAL CABANG BANDUNG'',''15'',''admin'')'),
(32, 'pegawai', '2021-08-13 09:10:48', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 619 241'',''DOA VEGA ADJIE PANGESTU'',''21'',''STAF SEKSI KOMERSIAL CABANG BANDUNG'',''5'',''admin'')'),
(33, 'pegawai', '2021-08-13 09:12:09', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''096 909 199'',''ERLANGGA SURYA'',''23'',''STAF SEKSI KOMERSIAL CABANG BANDUNG'',''15'',''admin'')'),
(34, 'pegawai', '2021-08-13 09:12:55', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''198 219 679'',''ENDE RARAN'',''25'',''STAF SEKSI KOMERSIAL CABANG BANDUNG'',''5'',''admin'')'),
(35, 'pegawai', '2021-08-13 09:20:03', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''128 812 275'',''RAGA YUDISTIRA'',''27'',''KEPALA SEKSI PBI KANCAB BANDUNG KANWIL JABAR'',''15'',''admin'')'),
(36, 'pegawai', '2021-08-13 09:21:30', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 519 208'',''MUHAMMAD RAUUF'',''23'',''STAF PENGEMBANGAN BISNIS DAN INDUSTRI CABANG BANDUNG'',''15'',''admin'')'),
(37, 'pegawai', '2021-08-13 09:22:23', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''168 916 473'',''KRISTINA INDRIANI AIPASSA'',''26'',''KASI ADMINISTRASI DAN KEUANGAN CABANG BANDUNG'',''15'',''admin'')'),
(38, 'pegawai', '2021-08-13 09:23:09', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''169 316 297'',''CANTIKA GUSTIANA'',''24'',''KASIR MINKU CABANG BANDUNG'',''15'',''admin'')'),
(39, 'pegawai', '2021-08-13 09:25:13', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''169 416 724'',''YOHANA SURYA CITRA'',''24'',''STAF MINKU CABANG BANDUNG'',''15'',''admin'')'),
(40, 'pegawai', '2021-08-13 09:26:19', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''118 711 012'',''WILLMA ADISTY'',''27'',''KASI AKUNTANSI KANCAB BANDUNG'',''15'',''admin'')'),
(41, 'pegawai', '2021-08-13 09:26:58', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''169 216 548'',''MULIA LESTARI'',''26'',''STAF AKUNTANSI KANCAB BANDUNG'',''15'',''admin'')'),
(42, 'pegawai', '2021-08-13 09:28:31', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''168 916 583'',''OCTA SATRIA CAKRA DWI P.'',''24'',''KA GBB GUDANG CISARANTEN KIDUL ( B ) KANCAB BANDUNG'',''15'',''admin'')'),
(43, 'pegawai', '2021-08-13 09:29:30', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''158 315 141'',''EDY RUSTANDI'',''22'',''JURTIM GBB CISARANTEN KIDUL BANDUNG'',''15'',''admin'')'),
(44, 'pegawai', '2021-08-13 09:30:38', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 919 234'',''ZIDAN FAJAR RAMADHAN'',''21'',''STAF GBB CISARANTEN KIDUL BANDUNG'',''5'',''admin'')'),
(45, 'pegawai', '2021-08-13 09:31:41', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''780 006 690'',''E.RAHMAWAN'',''27'',''KA GBB UTAMA BANDUNG'',''15'',''admin'')'),
(46, 'pegawai', '2021-08-13 09:32:45', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''158 515 152'',''DINDIN KURNIA JAENUDIN'',''22'',''JURTIM GBB GUDANG UTAMA KANCAB BANDUNG'',''15'',''admin'')'),
(47, 'pegawai', '2021-08-13 09:33:22', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 819 237'',''RENAL RIZKIAWAN'',''21'',''STAFF GBB UTAMA BANDUNG'',''5'',''admin'')'),
(48, 'pegawai', '2021-08-13 09:34:26', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''087 608 669'',''IKHSAN ARIEF'',''24'',''PJS1 KA GBB CITEUREUP KANCAB BANDUNG'',''15'',''admin'')'),
(49, 'pegawai', '2021-08-13 09:35:00', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''087 008 095'',''DENI RAKHMAT'',''24'',''JURTIM GUDANG CITEUREUP ( B ) KANCAB BANDUNG'',''15'',''admin'')'),
(50, 'pegawai', '2021-08-13 09:36:03', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''088 308 652'',''ASEP SUDIANA'',''24'',''KA GBB PASEH KIDUL KANCAB BANDUNG'',''15'',''admin'')'),
(51, 'pegawai', '2021-08-13 09:36:55', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''158 315 143'',''HENDRI RAHMAT HIDAYAT'',''22'',''JURTIM GBB PASEH KIDUL BANDUNG'',''15'',''admin'')'),
(52, 'pegawai', '2021-08-13 09:38:02', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''158 415 148'',''SUCIPTA'',''22'',''PJS1 MANAJGER PUSAT PUSAT DISTRIBUSI CISARANTEN KIDUL KANCAB BANDUNG'',''15'',''admin'')'),
(53, 'pegawai', '2021-08-13 09:39:04', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''179 317 033'',''NURLAELA HARYATIK'',''26'',''MANAGER ADM PUSAT DISTRIBUSI E-MARKETPLACE CISARANTEN KIDUL'',''15'',''admin'')'),
(54, 'pegawai', '2021-08-13 09:39:40', 'insert', NULL, '127.0.0.1', 'admin', 'INSERT INTO pegawai (nip,nama,golongan,jabatan,pajak,username) VALUES (''199 719 211'',''DIVA DIOVANI'',''23'',''PETUGAS ADM PUSAT DISTRIBUSI E-MARKETPLACE CISARANTEN KIDUL'',''15'',''admin'')');

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
('admin', '772b0c2974cfb52801d48d79a44131e2e73025380005', 'Admin', '', '2021-08-13 08:44:21', '', './uploaded/profile/admin.jpg', '');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `sc_config`
--
ALTER TABLE `sc_config`
MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sc_config_log`
--
ALTER TABLE `sc_config_log`
MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
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
