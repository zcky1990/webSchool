-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2018 at 11:11 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `angsuran`
--

CREATE TABLE `angsuran` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `tipe_pembayaran_id` int(11) NOT NULL,
  `bayar` bigint(20) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modfied_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angsuran`
--

INSERT INTO `angsuran` (`id`, `siswa_id`, `tipe_pembayaran_id`, `bayar`, `create_by`, `created_date`, `modfied_by`, `modified_date`) VALUES
(1, 1, 1, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(2, 1, 2, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(3, 1, 3, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(4, 1, 4, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(5, 1, 5, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(6, 1, 6, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(7, 1, 7, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(8, 1, 8, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(9, 1, 14, 50000, 1, '2018-06-29 00:00:00', NULL, NULL),
(10, 1, 12, 110000, 1, '2018-06-29 00:00:00', NULL, NULL),
(11, 1, 16, 50000, 1, '2018-06-29 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `list_pembayaran`
--

CREATE TABLE `list_pembayaran` (
  `id` int(11) NOT NULL,
  `tipe_id` int(11) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `kelas` int(11) NOT NULL,
  `besaran` bigint(20) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_pembayaran`
--

INSERT INTO `list_pembayaran` (`id`, `tipe_id`, `deskripsi`, `kelas`, `besaran`, `month`, `year`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 'SPP OKTOBER', 1, 110000, 10, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(2, 1, 'SPP NOVEMBER', 1, 110000, 11, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(3, 1, 'SPP DESEMBER', 1, 110000, 12, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(4, 1, 'SPP JANUARI', 1, 110000, 1, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(5, 1, 'SPP FEBRUARY', 1, 110000, 2, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(6, 1, 'SPP MARET', 1, 110000, 3, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(7, 1, 'SPP APRIL', 1, 110000, 4, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(8, 1, 'SPP MEI', 1, 110000, 5, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(9, 1, 'SPP JUNI', 1, 110000, 5, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(10, 6, 'PRAKTEK KELAS 1 - 1', 1, 150000, 12, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(11, 6, 'PRAKTEK KELAS 1 - 2', 1, 150000, 3, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(12, 4, 'LKS 1/17-18', 1, 110000, 12, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(13, 4, 'LKS 2/17-18', 1, 150000, 3, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(14, 8, 'Kegiatan Angsuran 1', 1, 50000, 12, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(15, 8, 'Kegiatan Angsuran 2', 1, 50000, 5, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(16, 9, 'Pesantren Kikat 2017/2018', 1, 50000, 3, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(17, 10, 'Praktek PKL 1', 1, 150000, 3, 2018, 1, '2018-06-29 00:00:00', NULL, NULL),
(18, 14, 'LDKS 2017/2018', 1, 150000, 12, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(19, 11, 'MPLS 2017/2018', 1, 200000, 12, 2017, 1, '2018-06-29 00:00:00', NULL, NULL),
(20, 3, 'SERAGAM 2017/2018', 1, 600000, 11, 2017, 1, '2018-06-29 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modfied_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nisn`, `nama`, `kelas`, `create_by`, `created_date`, `modfied_by`, `modified_date`, `is_active`) VALUES
(1, '100000', 'AHMAD DAELAMI', 1, 1, '2018-06-29 00:00:00', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id` int(11) NOT NULL,
  `deskripsi` varchar(45) NOT NULL,
  `start_semester` date NOT NULL,
  `end_semester` date NOT NULL,
  `create_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id`, `deskripsi`, `start_semester`, `end_semester`, `create_by`, `create_date`, `modified_by`, `modified_date`) VALUES
(1, 'Tahun Ajaran Semester Genap 2017/2018', '2017-10-01', '2018-06-30', 1, '2018-06-29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipe_pembayaran`
--

CREATE TABLE `tipe_pembayaran` (
  `id` int(11) NOT NULL,
  `deskripsi` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipe_pembayaran`
--

INSERT INTO `tipe_pembayaran` (`id`, `deskripsi`) VALUES
(1, 'spp'),
(2, 'qurban'),
(3, 'seragam'),
(4, 'lks'),
(5, 'gedung'),
(6, 'praktek'),
(7, 'ujian'),
(8, 'kegiatan'),
(9, 'pesantren_kilat'),
(10, 'pkl'),
(11, 'mpls'),
(12, 'lks_produktif'),
(13, 'kartu_pelajar'),
(14, 'ldks');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `access_level` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `access_level`) VALUES
(1, 1, 'admin', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_induk_pegawai` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `nama`, `alamat`, `no_induk_pegawai`) VALUES
(1, 'Ahmad Daelami', 'Kp.Pilar Barat III', '1000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `angsuran_ibfk_2` (`tipe_pembayaran_id`);

--
-- Indexes for table `list_pembayaran`
--
ALTER TABLE `list_pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipe_id` (`tipe_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_pembayaran`
--
ALTER TABLE `tipe_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `angsuran`
--
ALTER TABLE `angsuran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `list_pembayaran`
--
ALTER TABLE `list_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipe_pembayaran`
--
ALTER TABLE `tipe_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD CONSTRAINT `angsuran_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `angsuran_ibfk_2` FOREIGN KEY (`tipe_pembayaran_id`) REFERENCES `list_pembayaran` (`id`);

--
-- Constraints for table `list_pembayaran`
--
ALTER TABLE `list_pembayaran`
  ADD CONSTRAINT `list_pembayaran_ibfk_1` FOREIGN KEY (`tipe_id`) REFERENCES `tipe_pembayaran` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_detail` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
