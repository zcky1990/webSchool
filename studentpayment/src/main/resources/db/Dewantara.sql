-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2018 at 10:18 AM
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
-- Database: `Dewantara`
--

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `nisn` int(11) NOT NULL,
  `gedung_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gedung_list`
--

CREATE TABLE `gedung_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kartu_pelajar`
--

CREATE TABLE `kartu_pelajar` (
  `nisn` int(11) NOT NULL,
  `kartu_pelajar_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kartu_pelajar_list`
--

CREATE TABLE `kartu_pelajar_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `nisn` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_list`
--

CREATE TABLE `kegiatan_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `nisn` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `is_active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`nisn`, `kelas_id`, `is_active`) VALUES
(100000, 1, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_list`
--

CREATE TABLE `kelas_list` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_list`
--

INSERT INTO `kelas_list` (`id`, `description`) VALUES
(1, 'KELAS 1');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_mapping`
--

CREATE TABLE `kelas_mapping` (
  `nisn` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_mapping`
--

INSERT INTO `kelas_mapping` (`nisn`, `kelas_id`, `description`) VALUES
(100000, 1, 'AK');

-- --------------------------------------------------------

--
-- Table structure for table `ldks`
--

CREATE TABLE `ldks` (
  `nisn` int(11) NOT NULL,
  `ldks_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ldks_list`
--

CREATE TABLE `ldks_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lks`
--

CREATE TABLE `lks` (
  `nisn` int(11) NOT NULL,
  `lks_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lks_list`
--

CREATE TABLE `lks_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mpls`
--

CREATE TABLE `mpls` (
  `nisn` int(11) NOT NULL,
  `mpls_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mpls_list`
--

CREATE TABLE `mpls_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesantren_kilat`
--

CREATE TABLE `pesantren_kilat` (
  `nisn` int(11) NOT NULL,
  `pesantren_kilat_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesantren_kilat_list`
--

CREATE TABLE `pesantren_kilat_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pkl`
--

CREATE TABLE `pkl` (
  `nisn` int(11) NOT NULL,
  `pkl_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pkl_list`
--

CREATE TABLE `pkl_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `praktek`
--

CREATE TABLE `praktek` (
  `nisn` int(11) NOT NULL,
  `praktek_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `praktek_list`
--

CREATE TABLE `praktek_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `praktek_list`
--

INSERT INTO `praktek_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(0, 1, 'paktek semester ganjil', 1, 2018, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `qurban`
--

CREATE TABLE `qurban` (
  `nisn` int(11) NOT NULL,
  `qurban_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qurban_list`
--

CREATE TABLE `qurban_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seragam`
--

CREATE TABLE `seragam` (
  `nisn` int(11) NOT NULL,
  `seragam_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seragam_list`
--

CREATE TABLE `seragam_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` int(11) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `tempat_lahir` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `firstname`, `lastname`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `jenis_kelamin`, `is_active`) VALUES
(100000, 'AFRILLIA', 'test', 'bekasi', '2015-06-13', 'asd', 'L', 1);

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `nisn` int(11) NOT NULL,
  `spp_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`nisn`, `spp_id`, `bulan`, `tahun`, `bayar`) VALUES
(100000, 1, 10, 2017, b'1'),
(100000, 2, 11, 2017, b'1'),
(100000, 3, 12, 2017, b'1'),
(100000, 4, 1, 2018, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `spp_list`
--

CREATE TABLE `spp_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp_list`
--

INSERT INTO `spp_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'spp oktober', 10, 2017, 110000),
(2, 1, 'spp November', 11, 2017, 110000),
(3, 1, 'spp desember', 12, 2017, 110000),
(4, 1, 'spp januari', 1, 2018, 110000),
(5, 1, 'spp ferbruary', 2, 2018, 110000),
(6, 1, 'spp maret', 3, 2018, 110000),
(7, 1, 'spp april', 4, 2018, 110000),
(8, 1, 'spp mei', 5, 2018, 110000),
(9, 1, 'spp juni', 6, 2018, 110000);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `start_month` int(11) NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_month` int(11) NOT NULL,
  `end_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id`, `description`, `start_month`, `start_year`, `end_month`, `end_year`) VALUES
(1, 'Semester 1 2017/2018', 10, 2017, 6, 2018);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `nisn` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ujian_list`
--

CREATE TABLE `ujian_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `create_date` date NOT NULL,
  `create_by` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `create_date`, `create_by`, `level`) VALUES
(2, 'asd', 'asd', '2018-06-08', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gedung_list`
--
ALTER TABLE `gedung_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu_pelajar_list`
--
ALTER TABLE `kartu_pelajar_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan_list`
--
ALTER TABLE `kegiatan_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD UNIQUE KEY `kelas_id` (`kelas_id`,`nisn`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `kelas_list`
--
ALTER TABLE `kelas_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `kelas_mapping`
--
ALTER TABLE `kelas_mapping`
  ADD KEY `nisn` (`nisn`,`kelas_id`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `ldks_list`
--
ALTER TABLE `ldks_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lks_list`
--
ALTER TABLE `lks_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpls_list`
--
ALTER TABLE `mpls_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesantren_kilat_list`
--
ALTER TABLE `pesantren_kilat_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkl_list`
--
ALTER TABLE `pkl_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qurban_list`
--
ALTER TABLE `qurban_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seragam_list`
--
ALTER TABLE `seragam_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD KEY `nisn` (`nisn`),
  ADD KEY `spp_id` (`spp_id`);

--
-- Indexes for table `spp_list`
--
ALTER TABLE `spp_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujian_list`
--
ALTER TABLE `ujian_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gedung_list`
--
ALTER TABLE `gedung_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kartu_pelajar_list`
--
ALTER TABLE `kartu_pelajar_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan_list`
--
ALTER TABLE `kegiatan_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas_list`
--
ALTER TABLE `kelas_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ldks_list`
--
ALTER TABLE `ldks_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lks_list`
--
ALTER TABLE `lks_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mpls_list`
--
ALTER TABLE `mpls_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesantren_kilat_list`
--
ALTER TABLE `pesantren_kilat_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pkl_list`
--
ALTER TABLE `pkl_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qurban_list`
--
ALTER TABLE `qurban_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seragam_list`
--
ALTER TABLE `seragam_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spp_list`
--
ALTER TABLE `spp_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ujian_list`
--
ALTER TABLE `ujian_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas_list` (`id`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `kelas_mapping`
--
ALTER TABLE `kelas_mapping`
  ADD CONSTRAINT `kelas_mapping_ibfk_1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas_list` (`id`),
  ADD CONSTRAINT `kelas_mapping_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `spp`
--
ALTER TABLE `spp`
  ADD CONSTRAINT `spp_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `spp_ibfk_2` FOREIGN KEY (`spp_id`) REFERENCES `spp_list` (`id`);

--
-- Constraints for table `spp_list`
--
ALTER TABLE `spp_list`
  ADD CONSTRAINT `spp_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
