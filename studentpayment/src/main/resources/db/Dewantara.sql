-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2018 at 11:37 AM
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`nisn`, `kegiatan_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 10, 2017, 50000, NULL, NULL, NULL, NULL),
(100000, 2, 4, 2018, 50000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_list`
--

CREATE TABLE `kegiatan_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatan_list`
--

INSERT INTO `kegiatan_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'Angsuran-1', 1, 2017, 50000),
(2, 1, 'Angsuran-2', 4, 2018, 50000);

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
(1, 'KELAS I'),
(2, 'KELAS II'),
(3, 'KELAS III');

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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ldks`
--

INSERT INTO `ldks` (`nisn`, `ldks_list_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 10, 2017, 150000, NULL, NULL, NULL, NULL);

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

--
-- Dumping data for table `ldks_list`
--

INSERT INTO `ldks_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'Angsuran-1', 10, 2017, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `lks`
--

CREATE TABLE `lks` (
  `nisn` int(11) NOT NULL,
  `lks_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lks`
--

INSERT INTO `lks` (`nisn`, `lks_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 10, 2017, 110000, NULL, NULL, NULL, NULL),
(100000, 2, 10, 2017, 150000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lks_list`
--

CREATE TABLE `lks_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lks_list`
--

INSERT INTO `lks_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'LKS 1/17-18', 10, 2017, 110000),
(2, 1, 'LKS 2/17-18', 10, 2017, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `lks_produktif`
--

CREATE TABLE `lks_produktif` (
  `nisn` int(11) NOT NULL,
  `lks_produktif_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lks_produktif_list`
--

CREATE TABLE `lks_produktif_list` (
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesantren_kilat`
--

INSERT INTO `pesantren_kilat` (`nisn`, `pesantren_kilat_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 10, 2017, 50000, NULL, NULL, NULL, NULL);

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

--
-- Dumping data for table `pesantren_kilat_list`
--

INSERT INTO `pesantren_kilat_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'Angsuran-1', 10, 2017, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `pkl`
--

CREATE TABLE `pkl` (
  `nisn` int(11) NOT NULL,
  `pkl_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` bit(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl`
--

INSERT INTO `pkl` (`nisn`, `pkl_list_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 4, 2018, b'00000000000', NULL, NULL, NULL, NULL);

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

--
-- Dumping data for table `pkl_list`
--

INSERT INTO `pkl_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'Praktek-I', 4, 2018, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `praktek`
--

CREATE TABLE `praktek` (
  `nisn` int(11) NOT NULL,
  `praktek_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `praktek`
--

INSERT INTO `praktek` (`nisn`, `praktek_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 1, 2018, 150000, 0, '0000-00-00', 0, '0000-00-00'),
(100000, 2, 1, 2018, 20000, 0, '0000-00-00', 0, '0000-00-00');

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
(1, 1, 'praktek 1', 1, 2018, 150000),
(2, 1, 'praktek 2', 1, 2018, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `qurban`
--

CREATE TABLE `qurban` (
  `nisn` int(11) NOT NULL,
  `qurban_list_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
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
  `bayar` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`nisn`, `spp_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 10, 2017, 110000, 0, NULL, NULL, NULL),
(100000, 2, 11, 2017, 110000, 0, NULL, NULL, NULL),
(100000, 3, 12, 2017, 110000, 0, NULL, NULL, NULL),
(100000, 4, 1, 2018, 110000, 0, NULL, NULL, NULL);

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
(1, 'Semester Ganjil 2017/2018', 10, 2017, 2, 2018),
(2, 'Semester Genap 2017/2018', 2, 2018, 9, 2018);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `nisn` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`nisn`, `ujian_id`, `bulan`, `tahun`, `bayar`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(100000, 1, 10, 2017, 70000, NULL, NULL, NULL, NULL),
(100000, 2, 10, 2017, 85000, NULL, NULL, NULL, NULL),
(100000, 3, 10, 2017, 50000, NULL, NULL, NULL, NULL),
(100000, 4, 10, 2017, 25000, NULL, NULL, NULL, NULL),
(100000, 5, 4, 2018, 70000, NULL, NULL, NULL, NULL),
(100000, 6, 4, 2018, 85000, NULL, NULL, NULL, NULL),
(100000, 7, 4, 2018, 25000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ujian_list`
--

CREATE TABLE `ujian_list` (
  `id` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `besaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian_list`
--

INSERT INTO `ujian_list` (`id`, `kelas`, `description`, `bulan`, `tahun`, `besaran`) VALUES
(1, 1, 'UTS GANJIL 17/18', 10, 2017, 70000),
(2, 1, 'UAS GANJIL 17/18', 10, 2017, 85000),
(3, 1, 'RAPOT K-13', 10, 2017, 50000),
(4, 1, 'PENGAMBILAN RAPOT', 10, 2017, 25000),
(5, 1, 'UTS GENAP 17/18', 4, 2018, 70000),
(6, 1, 'UAS GENAP 17/18', 4, 2018, 85000),
(7, 1, 'PENGAMBILAN RAPOT', 4, 2018, 25000);

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
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD KEY `nisn` (`nisn`,`gedung_list_id`),
  ADD KEY `gedung_list_id` (`gedung_list_id`);

--
-- Indexes for table `gedung_list`
--
ALTER TABLE `gedung_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `kartu_pelajar`
--
ALTER TABLE `kartu_pelajar`
  ADD KEY `nisn` (`nisn`,`kartu_pelajar_list_id`),
  ADD KEY `kartu_pelajar_list_id` (`kartu_pelajar_list_id`);

--
-- Indexes for table `kartu_pelajar_list`
--
ALTER TABLE `kartu_pelajar_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD KEY `nisn` (`nisn`,`kegiatan_id`),
  ADD KEY `kegiatan_id` (`kegiatan_id`);

--
-- Indexes for table `kegiatan_list`
--
ALTER TABLE `kegiatan_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

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
-- Indexes for table `ldks`
--
ALTER TABLE `ldks`
  ADD KEY `nisn` (`nisn`,`ldks_list_id`),
  ADD KEY `ldks_list_id` (`ldks_list_id`);

--
-- Indexes for table `ldks_list`
--
ALTER TABLE `ldks_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `lks`
--
ALTER TABLE `lks`
  ADD KEY `nisn` (`nisn`,`lks_id`),
  ADD KEY `lks_id` (`lks_id`);

--
-- Indexes for table `lks_list`
--
ALTER TABLE `lks_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `lks_produktif`
--
ALTER TABLE `lks_produktif`
  ADD KEY `nisn` (`nisn`,`lks_produktif_id`),
  ADD KEY `lks_produktif_id` (`lks_produktif_id`);

--
-- Indexes for table `lks_produktif_list`
--
ALTER TABLE `lks_produktif_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `mpls`
--
ALTER TABLE `mpls`
  ADD KEY `nisn` (`nisn`,`mpls_list_id`),
  ADD KEY `mpls_list_id` (`mpls_list_id`);

--
-- Indexes for table `mpls_list`
--
ALTER TABLE `mpls_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `pesantren_kilat`
--
ALTER TABLE `pesantren_kilat`
  ADD KEY `nisn` (`nisn`,`pesantren_kilat_id`),
  ADD KEY `pesantren_kilat_id` (`pesantren_kilat_id`);

--
-- Indexes for table `pesantren_kilat_list`
--
ALTER TABLE `pesantren_kilat_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `pkl`
--
ALTER TABLE `pkl`
  ADD KEY `nisn` (`nisn`,`pkl_list_id`),
  ADD KEY `pkl_list_id` (`pkl_list_id`);

--
-- Indexes for table `pkl_list`
--
ALTER TABLE `pkl_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `praktek`
--
ALTER TABLE `praktek`
  ADD KEY `nisn` (`nisn`,`praktek_id`),
  ADD KEY `praktek_id` (`praktek_id`);

--
-- Indexes for table `praktek_list`
--
ALTER TABLE `praktek_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `qurban`
--
ALTER TABLE `qurban`
  ADD KEY `nisn` (`nisn`,`qurban_list_id`),
  ADD KEY `qurban_list_id` (`qurban_list_id`);

--
-- Indexes for table `qurban_list`
--
ALTER TABLE `qurban_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `seragam`
--
ALTER TABLE `seragam`
  ADD KEY `nisn` (`nisn`,`seragam_list_id`),
  ADD KEY `seragam_list_id` (`seragam_list_id`);

--
-- Indexes for table `seragam_list`
--
ALTER TABLE `seragam_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

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
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD KEY `nisn` (`nisn`,`ujian_id`),
  ADD KEY `ujian_id` (`ujian_id`);

--
-- Indexes for table `ujian_list`
--
ALTER TABLE `ujian_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas` (`kelas`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas_list`
--
ALTER TABLE `kelas_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ldks_list`
--
ALTER TABLE `ldks_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lks_list`
--
ALTER TABLE `lks_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lks_produktif_list`
--
ALTER TABLE `lks_produktif_list`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pkl_list`
--
ALTER TABLE `pkl_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `praktek_list`
--
ALTER TABLE `praktek_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ujian_list`
--
ALTER TABLE `ujian_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gedung`
--
ALTER TABLE `gedung`
  ADD CONSTRAINT `gedung_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `gedung_ibfk_2` FOREIGN KEY (`gedung_list_id`) REFERENCES `gedung_list` (`id`);

--
-- Constraints for table `gedung_list`
--
ALTER TABLE `gedung_list`
  ADD CONSTRAINT `gedung_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `kartu_pelajar`
--
ALTER TABLE `kartu_pelajar`
  ADD CONSTRAINT `kartu_pelajar_ibfk_1` FOREIGN KEY (`kartu_pelajar_list_id`) REFERENCES `kartu_pelajar_list` (`id`),
  ADD CONSTRAINT `kartu_pelajar_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `kartu_pelajar_list`
--
ALTER TABLE `kartu_pelajar_list`
  ADD CONSTRAINT `kartu_pelajar_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `kegiatan_ibfk_2` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan_list` (`id`);

--
-- Constraints for table `kegiatan_list`
--
ALTER TABLE `kegiatan_list`
  ADD CONSTRAINT `kegiatan_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

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
-- Constraints for table `ldks`
--
ALTER TABLE `ldks`
  ADD CONSTRAINT `ldks_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `ldks_ibfk_2` FOREIGN KEY (`ldks_list_id`) REFERENCES `ldks_list` (`id`);

--
-- Constraints for table `ldks_list`
--
ALTER TABLE `ldks_list`
  ADD CONSTRAINT `ldks_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `lks`
--
ALTER TABLE `lks`
  ADD CONSTRAINT `lks_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `lks_ibfk_2` FOREIGN KEY (`lks_id`) REFERENCES `lks_list` (`id`);

--
-- Constraints for table `lks_list`
--
ALTER TABLE `lks_list`
  ADD CONSTRAINT `lks_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `lks_produktif`
--
ALTER TABLE `lks_produktif`
  ADD CONSTRAINT `lks_produktif_ibfk_1` FOREIGN KEY (`lks_produktif_id`) REFERENCES `lks_produktif_list` (`id`),
  ADD CONSTRAINT `lks_produktif_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `lks_produktif_list`
--
ALTER TABLE `lks_produktif_list`
  ADD CONSTRAINT `lks_produktif_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `mpls`
--
ALTER TABLE `mpls`
  ADD CONSTRAINT `mpls_ibfk_1` FOREIGN KEY (`mpls_list_id`) REFERENCES `mpls_list` (`id`),
  ADD CONSTRAINT `mpls_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `mpls_list`
--
ALTER TABLE `mpls_list`
  ADD CONSTRAINT `mpls_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `pesantren_kilat`
--
ALTER TABLE `pesantren_kilat`
  ADD CONSTRAINT `pesantren_kilat_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `pesantren_kilat_ibfk_2` FOREIGN KEY (`pesantren_kilat_id`) REFERENCES `pesantren_kilat_list` (`id`);

--
-- Constraints for table `pesantren_kilat_list`
--
ALTER TABLE `pesantren_kilat_list`
  ADD CONSTRAINT `pesantren_kilat_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `pkl`
--
ALTER TABLE `pkl`
  ADD CONSTRAINT `pkl_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `pkl_ibfk_2` FOREIGN KEY (`pkl_list_id`) REFERENCES `pkl_list` (`id`);

--
-- Constraints for table `pkl_list`
--
ALTER TABLE `pkl_list`
  ADD CONSTRAINT `pkl_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `praktek`
--
ALTER TABLE `praktek`
  ADD CONSTRAINT `praktek_ibfk_1` FOREIGN KEY (`praktek_id`) REFERENCES `praktek_list` (`id`),
  ADD CONSTRAINT `praktek_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `praktek_list`
--
ALTER TABLE `praktek_list`
  ADD CONSTRAINT `praktek_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `qurban`
--
ALTER TABLE `qurban`
  ADD CONSTRAINT `qurban_ibfk_1` FOREIGN KEY (`qurban_list_id`) REFERENCES `qurban_list` (`id`),
  ADD CONSTRAINT `qurban_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `qurban_list`
--
ALTER TABLE `qurban_list`
  ADD CONSTRAINT `qurban_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

--
-- Constraints for table `seragam`
--
ALTER TABLE `seragam`
  ADD CONSTRAINT `seragam_ibfk_1` FOREIGN KEY (`seragam_list_id`) REFERENCES `seragam_list` (`id`),
  ADD CONSTRAINT `seragam_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`);

--
-- Constraints for table `seragam_list`
--
ALTER TABLE `seragam_list`
  ADD CONSTRAINT `seragam_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);

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

--
-- Constraints for table `ujian`
--
ALTER TABLE `ujian`
  ADD CONSTRAINT `ujian_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`),
  ADD CONSTRAINT `ujian_ibfk_2` FOREIGN KEY (`ujian_id`) REFERENCES `ujian_list` (`id`);

--
-- Constraints for table `ujian_list`
--
ALTER TABLE `ujian_list`
  ADD CONSTRAINT `ujian_list_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
