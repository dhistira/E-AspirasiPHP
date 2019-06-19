-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2019 at 10:09 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubespemwebok`
--

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

DROP TABLE IF EXISTS `fakultas`;
CREATE TABLE IF NOT EXISTS `fakultas` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

DROP TABLE IF EXISTS `fasilitas`;
CREATE TABLE IF NOT EXISTS `fasilitas` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `id_jenisInfrastruktur` int(3) NOT NULL,
  `id_statusInfrastruktur` int(3) NOT NULL,
  `id_fakultas` int(3) DEFAULT NULL,
  `id_jurusan` int(144) DEFAULT NULL,
  `lat` varchar(256) DEFAULT NULL,
  `lon` varchar(256) DEFAULT NULL,
  `foto` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jenisInfrastruktur` (`id_jenisInfrastruktur`),
  KEY `id_statusInfrastruktur` (`id_statusInfrastruktur`),
  KEY `id_fakultas` (`id_fakultas`),
  KEY `id_jurusan` (`id_jurusan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_infrastruktur`
--

DROP TABLE IF EXISTS `jenis_infrastruktur`;
CREATE TABLE IF NOT EXISTS `jenis_infrastruktur` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE IF NOT EXISTS `jurusan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_keamanan`
--

DROP TABLE IF EXISTS `laporan_keamanan`;
CREATE TABLE IF NOT EXISTS `laporan_keamanan` (
  `id` int(144) NOT NULL AUTO_INCREMENT,
  `id_user` int(144) NOT NULL,
  `datetime_kejadian` varchar(144) NOT NULL,
  `jenis_kejahatan` varchar(144) NOT NULL,
  `date_created` varchar(144) NOT NULL,
  `lat` varchar(144) NOT NULL,
  `lon` varchar(144) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_statusKeamanan` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_statusKeamanan` (`id_statusKeamanan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_kerusakan`
--

DROP TABLE IF EXISTS `laporan_kerusakan`;
CREATE TABLE IF NOT EXISTS `laporan_kerusakan` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `id_user` int(255) NOT NULL,
  `tipe` int(3) NOT NULL COMMENT '1 fasilitas, 2 jalan, 3 lainnya',
  `id_fasilitas` int(4) DEFAULT NULL,
  `id_statusInfrastruktur` int(4) NOT NULL,
  `date_reported` date NOT NULL,
  `date_modified` date NOT NULL,
  `id_statusLaporan` int(4) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lon` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL COMMENT 'bila tipe 3 lainnya',
  PRIMARY KEY (`id`),
  KEY `id_statusInfrastruktur` (`id_statusInfrastruktur`),
  KEY `id_statusLaporan` (`id_statusLaporan`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_pelayanan`
--

DROP TABLE IF EXISTS `laporan_pelayanan`;
CREATE TABLE IF NOT EXISTS `laporan_pelayanan` (
  `id` int(144) NOT NULL AUTO_INCREMENT,
  `id_user` int(144) NOT NULL,
  `id_staffPelayanan` int(144) NOT NULL,
  `datetime_pelayanan` varchar(144) NOT NULL,
  `nilai` int(2) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `id_statusPelayanan` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_staffPelayanan` (`id_staffPelayanan`),
  KEY `id_statusPelayanan` (`id_statusPelayanan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `nim` varchar(256) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `birth_date` date NOT NULL,
  `id_fakultas` int(4) NOT NULL,
  `id_jurusan` int(4) NOT NULL,
  `angkatan` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fakultas` (`id_fakultas`),
  KEY `id_jurusan` (`id_jurusan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_pelayanan`
--

DROP TABLE IF EXISTS `staff_pelayanan`;
CREATE TABLE IF NOT EXISTS `staff_pelayanan` (
  `id` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `foto` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 nonaktif, 1 aktif, 2 suspend',
  KEY `id_fakultas` (`id_fakultas`),
  KEY `id_jurusan` (`id_jurusan`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_infrastruktur`
--

DROP TABLE IF EXISTS `status_infrastruktur`;
CREATE TABLE IF NOT EXISTS `status_infrastruktur` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_keamanan`
--

DROP TABLE IF EXISTS `status_keamanan`;
CREATE TABLE IF NOT EXISTS `status_keamanan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_laporan`
--

DROP TABLE IF EXISTS `status_laporan`;
CREATE TABLE IF NOT EXISTS `status_laporan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_pelayanan`
--

DROP TABLE IF EXISTS `status_pelayanan`;
CREATE TABLE IF NOT EXISTS `status_pelayanan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_user`
--

DROP TABLE IF EXISTS `tipe_user`;
CREATE TABLE IF NOT EXISTS `tipe_user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(144) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(144) NOT NULL AUTO_INCREMENT,
  `tipe` int(3) NOT NULL,
  `id_terkait` int(144) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `status` int(3) NOT NULL COMMENT '0 non aktif, 1 aktif, 2 suspend',
  PRIMARY KEY (`id`),
  KEY `tipe` (`tipe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
