-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2018 at 12:14 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `uname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`uname`, `pwd`, `level`) VALUES
('1641720001', 'a378b4acef1eeb535b3acb6054346611', 2),
('1641720002', '52ae77ffb9603245cde36d198466539d', 2),
('1641720074', 'd9662c980612c2bf69e7c78b0141acfd', 2),
('1641720176', '2637b7776d3820fc77030e053fefb84f', 2),
('19212121212', '5de95e306c20b6db3385dc8517055528', 1),
('1941720001', 'b22d4efb0386ce0e3c4fb130e9b8f793', 1),
('1941720003', '8eac37b41055bfb00e6ab11de5497a8f', 1),
('admin', '21232f297a57a5a743894a0e4a801fc3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_matkul` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jurusan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `jk`, `alamat`, `foto`, `kode_matkul`, `kode_jurusan`) VALUES
('1941720001', 'Joko Anwar', 'L', 'Jember', 'accessories_pencil_ruler_notebook_education_equipment_learning_object_school_item_college_flat_icon_symbol-512.png', 'OOP', 'TI'),
('1941720002', 'Reynaldi Oktino', 'L', 'Tulungagung', 'volunteer.png', 'KD1', 'TK'),
('1941720003', 'Samidi', 'L', 'Mulyorejo, Malang', 'Dragon_37519.png', 'KL1', 'TM');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ruang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuota` int(11) NOT NULL,
  `kode_semester` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_akhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kode`, `nip`, `kode_ruang`, `kuota`, `kode_semester`, `kode_ta`, `hari`, `waktu_mulai`, `waktu_akhir`) VALUES
('J0001', '1941720001', 'LPR01', 28, 'S0001', 'TA0001', 'Rabu', '07:00:00', '12:00:00'),
('J0002', '1941720001', 'LPR01', 28, 'S0001', 'TA0001', 'Senin', '07:00:00', '12:00:00'),
('J0003', '1941720002', 'KB02', 60, 'S0002', 'TA0002', 'Senin', '07:00:00', '10:00:00'),
('J0004', '1941720002', 'KB02', 60, 'S0002', 'TA0002', 'Selasa', '07:00:00', '10:00:00'),
('J0005', '1941720002', 'KB02', 60, 'S0001', 'TA0001', 'Jum''at', '08:30:00', '09:30:00'),
('J0006', '1941720003', 'KB02', 57, 'S0001', 'TA0002', 'Senin', '07:00:00', '10:00:00'),
('J0007', '1941720002', 'LPJ01', 30, 'S0002', 'TA0002', 'Rabu', '12:30:00', '17:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode`, `nama`) VALUES
('TI', 'Teknik Informatika'),
('TK', 'Teknik Kimia'),
('TM', 'Teknik Mesin'),
('TS', 'Teknik Sipil');

-- --------------------------------------------------------

--
-- Table structure for table `khs`
--

CREATE TABLE `khs` (
  `nim` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_krs` int(11) NOT NULL,
  `kode_mk` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_semester` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_ta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `khs`
--

INSERT INTO `khs` (`nim`, `kode_krs`, `kode_mk`, `kode_semester`, `kode_ta`, `nilai`) VALUES
('1641720001', 1, 'OOP', 'S0001', 'TA0001', 85),
('1641720176', 2, 'OOP', 'S0002', 'TA0001', 80),
('1641720001', 7, 'OOP', 'S0001', 'TA0001', 85),
('1641720001', 3, 'OOP', 'S0001', 'TA0001', 85),
('1641720074', 9, 'OOP', 'S0001', 'TA0001', 0);

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `kode` int(11) NOT NULL,
  `nim` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jadwal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`kode`, `nim`, `kode_jadwal`, `status`) VALUES
(1, '1641720001', 'J0001', 1),
(2, '1641720176', 'J0002', 1),
(3, '1641720001', 'J0001', 1),
(6, '1641720002', 'J0006', 0),
(7, '1641720001', 'J0002', 1),
(8, '1641720001', 'J0001', 0),
(9, '1641720074', 'J0002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int(11) NOT NULL,
  `kode_semester` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jurusan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kode`, `nama`, `sks`, `kode_semester`, `kode_jurusan`) VALUES
('KD1', 'Kimia Dasar 1', 2, 'S0001', 'TK'),
('KL1', 'Kalkulus1', 3, 'S0001', 'TM'),
('OOP', 'Object Oriented Program', 4, 'S0002', 'TI');

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE `mhs` (
  `nim` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_jurusan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip_wali` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mhs`
--

INSERT INTO `mhs` (`nim`, `nama`, `jk`, `alamat`, `foto`, `kode_jurusan`, `nip_wali`) VALUES
('1641720001', 'Valdo Viani', 'L', 'Surabaya', 'thinking-6889e1fb5fdece9dfeb2ebd4ae7ec2ebe68477631c035eb01515f46609dc0a07.png', 'TI', '1941720001'),
('1641720002', 'Lukman', 'P', 'Turen', 'accessories_pencil_ruler_notebook_education_equipment_learning_object_school_item_college_flat_icon_symbol-512.png', 'TM', '1941720003'),
('1641720074', 'Agik Fendi Harvyandha', 'L', 'Sukun', 'dummies.png', 'TI', '1941720001'),
('1641720176', 'Reynaldi Oktino', 'L', 'Tulungagung', 'IMG_5656.jpg', 'TK', '1941720002');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuota` bigint(20) NOT NULL,
  `kode_jurusan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode`, `nama`, `kuota`, `kode_jurusan`) VALUES
('KB02', 'Kelas Besar 2', 60, 'TI'),
('LP01', 'Lab Praktikum', 30, 'TK'),
('LPJ01', 'Lab Praktikum Jaringan', 30, 'TI'),
('LPR01', 'Lab Praktikum Pemrograman 1', 100, 'TI'),
('LPR02', 'Lab Praktikum Pemrograman', 10, 'TI');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`kode`, `nama`, `status`) VALUES
('S0001', 'Ganjil', 0),
('S0002', 'Genap', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `kode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`kode`, `nama`) VALUES
('TA0001', '2016/2017'),
('TA0002', '2017/2018');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kode_jurusan` (`kode_jurusan`),
  ADD KEY `kode_matkul` (`kode_matkul`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `kode_mk` (`nip`),
  ADD KEY `kode_ruang` (`kode_ruang`),
  ADD KEY `kode_semester` (`kode_semester`),
  ADD KEY `kode_ta` (`kode_ta`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `khs`
--
ALTER TABLE `khs`
  ADD KEY `kode_mk` (`kode_mk`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_semester` (`kode_semester`),
  ADD KEY `kode_ta` (`kode_ta`),
  ADD KEY `kode_krs` (`kode_krs`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_jadwal` (`kode_jadwal`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `kode_jurusan` (`kode_jurusan`),
  ADD KEY `kode_semester` (`kode_semester`);

--
-- Indexes for table `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kode_jurusan` (`kode_jurusan`),
  ADD KEY `nip_wali` (`nip_wali`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`kode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode`),
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matkul` (`kode`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kode_semester`) REFERENCES `semester` (`kode`),
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`kode_ta`) REFERENCES `tahun_ajaran` (`kode`);

--
-- Constraints for table `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`kode_semester`) REFERENCES `semester` (`kode`),
  ADD CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`kode_ta`) REFERENCES `tahun_ajaran` (`kode`),
  ADD CONSTRAINT `khs_ibfk_4` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`),
  ADD CONSTRAINT `khs_ibfk_5` FOREIGN KEY (`kode_mk`) REFERENCES `matkul` (`kode`),
  ADD CONSTRAINT `khs_ibfk_6` FOREIGN KEY (`kode_krs`) REFERENCES `krs` (`kode`);

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`),
  ADD CONSTRAINT `krs_ibfk_3` FOREIGN KEY (`kode_jadwal`) REFERENCES `jadwal` (`kode`);

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode`),
  ADD CONSTRAINT `matkul_ibfk_2` FOREIGN KEY (`kode_semester`) REFERENCES `semester` (`kode`);

--
-- Constraints for table `mhs`
--
ALTER TABLE `mhs`
  ADD CONSTRAINT `mhs_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode`),
  ADD CONSTRAINT `mhs_ibfk_2` FOREIGN KEY (`nip_wali`) REFERENCES `dosen` (`nip`);

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `ruang_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
