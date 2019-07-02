-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2019 at 09:57 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubespemweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(14) NOT NULL,
  `id_jenisInfrastruktur` int(3) NOT NULL,
  `id_statusInfrastruktur` int(3) NOT NULL,
  `id_fakultas` int(3) DEFAULT NULL,
  `id_jurusan` int(144) DEFAULT NULL,
  `lat` varchar(256) DEFAULT NULL,
  `lon` varchar(256) DEFAULT NULL,
  `foto` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_infrastruktur`
--

CREATE TABLE `jenis_infrastruktur` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_keamanan`
--

CREATE TABLE `laporan_keamanan` (
  `id` int(144) NOT NULL,
  `id_user` int(144) NOT NULL,
  `datetime_kejadian` varchar(144) NOT NULL,
  `jenis_kejahatan` varchar(144) NOT NULL,
  `date_created` varchar(144) NOT NULL,
  `lat` varchar(144) NOT NULL,
  `lon` varchar(144) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_statusKeamanan` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_kerusakan`
--

CREATE TABLE `laporan_kerusakan` (
  `id` int(14) NOT NULL,
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
  `keterangan` varchar(255) DEFAULT NULL COMMENT 'bila tipe 3 lainnya'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_pelayanan`
--

CREATE TABLE `laporan_pelayanan` (
  `id` int(144) NOT NULL,
  `id_user` int(144) NOT NULL,
  `id_staffPelayanan` int(144) NOT NULL,
  `datetime_pelayanan` varchar(144) NOT NULL,
  `nilai` int(2) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `id_statusPelayanan` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(14) NOT NULL,
  `nim` varchar(256) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `birth_date` date NOT NULL,
  `id_fakultas` int(4) NOT NULL,
  `id_jurusan` int(4) NOT NULL,
  `angkatan` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_pelayanan`
--

CREATE TABLE `staff_pelayanan` (
  `id` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `jabatan` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 nonaktif, 1 aktif, 2 suspend'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_infrastruktur`
--

CREATE TABLE `status_infrastruktur` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_keamanan`
--

CREATE TABLE `status_keamanan` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_laporan`
--

CREATE TABLE `status_laporan` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_pelayanan`
--

CREATE TABLE `status_pelayanan` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_user`
--

CREATE TABLE `tipe_user` (
  `id` int(3) NOT NULL,
  `nama` varchar(144) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(144) NOT NULL,
  `tipe` int(3) NOT NULL,
  `id_terkait` int(144) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `status` int(3) NOT NULL COMMENT '0 non aktif, 1 aktif, 2 suspend'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jenisInfrastruktur` (`id_jenisInfrastruktur`),
  ADD KEY `id_statusInfrastruktur` (`id_statusInfrastruktur`),
  ADD KEY `id_fakultas` (`id_fakultas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `jenis_infrastruktur`
--
ALTER TABLE `jenis_infrastruktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_keamanan`
--
ALTER TABLE `laporan_keamanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_statusKeamanan` (`id_statusKeamanan`);

--
-- Indexes for table `laporan_kerusakan`
--
ALTER TABLE `laporan_kerusakan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_statusInfrastruktur` (`id_statusInfrastruktur`),
  ADD KEY `id_statusLaporan` (`id_statusLaporan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `laporan_pelayanan`
--
ALTER TABLE `laporan_pelayanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_staffPelayanan` (`id_staffPelayanan`),
  ADD KEY `id_statusPelayanan` (`id_statusPelayanan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fakultas` (`id_fakultas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `staff_pelayanan`
--
ALTER TABLE `staff_pelayanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fakultas` (`id_fakultas`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `status_infrastruktur`
--
ALTER TABLE `status_infrastruktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_keamanan`
--
ALTER TABLE `status_keamanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_laporan`
--
ALTER TABLE `status_laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_pelayanan`
--
ALTER TABLE `status_pelayanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_user`
--
ALTER TABLE `tipe_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipe` (`tipe`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_infrastruktur`
--
ALTER TABLE `jenis_infrastruktur`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_keamanan`
--
ALTER TABLE `laporan_keamanan`
  MODIFY `id` int(144) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_kerusakan`
--
ALTER TABLE `laporan_kerusakan`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_pelayanan`
--
ALTER TABLE `laporan_pelayanan`
  MODIFY `id` int(144) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_infrastruktur`
--
ALTER TABLE `status_infrastruktur`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_keamanan`
--
ALTER TABLE `status_keamanan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_laporan`
--
ALTER TABLE `status_laporan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_pelayanan`
--
ALTER TABLE `status_pelayanan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipe_user`
--
ALTER TABLE `tipe_user`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(144) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
