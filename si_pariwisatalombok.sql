-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2023 at 09:23 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_pariwisatalombok`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_Admin` int(7) NOT NULL,
  `id_pemesanan` int(7) NOT NULL,
  `id_pegawai` int(7) NOT NULL,
  `id_penilaian` int(7) NOT NULL,
  `id_wisata` int(7) NOT NULL,
  `id_user` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atraksi`
--

CREATE TABLE `atraksi` (
  `id_atraksi` int(7) NOT NULL,
  `id_wisata` int(7) NOT NULL,
  `Keterangan_atraksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_wisata`
--

CREATE TABLE `data_wisata` (
  `id_Wisata` int(7) NOT NULL,
  `Objek_wisata` varchar(20) NOT NULL,
  `Keterangan` varchar(50) NOT NULL,
  `Gambar` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_FasilitasKamar` int(7) NOT NULL,
  `Keterangan_fasilitas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_pariwisata`
--

CREATE TABLE `fasilitas_pariwisata` (
  `id_fasilitasPariwisata` int(7) NOT NULL,
  `id_wisata` int(7) NOT NULL,
  `Keterangan_Fasilitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(7) NOT NULL,
  `id_penilaian` int(7) NOT NULL,
  `id_jenis` int(7) NOT NULL,
  `nama_hotel` varchar(20) NOT NULL,
  `alamat_hotel` varchar(50) NOT NULL,
  `No_hp` varchar(12) NOT NULL,
  `Banyak_Kamar` int(3) NOT NULL,
  `No_Kamar` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_hotel`
--

CREATE TABLE `jenis_hotel` (
  `id_jenis` int(7) NOT NULL,
  `Jumlah_Bintang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_wisata`
--

CREATE TABLE `jenis_wisata` (
  `id_jenis` int(7) NOT NULL,
  `id_wisata` int(7) NOT NULL,
  `Keterangan_Jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `No_Kamar` int(7) NOT NULL,
  `id_type` int(7) NOT NULL,
  `id_hotel` int(7) NOT NULL,
  `Gambar` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_hotel`
--

CREATE TABLE `pegawai_hotel` (
  `id_pegawai` int(7) NOT NULL,
  `id_hotel` int(7) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `No_hp` varchar(12) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(7) NOT NULL,
  `id_hotel` int(7) NOT NULL,
  `No_kamar` int(7) NOT NULL,
  `id_type` int(7) NOT NULL,
  `id_user` int(7) NOT NULL,
  `waktu_pemesanan` time NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `dewasa` int(10) NOT NULL,
  `anak-anak` int(10) NOT NULL,
  `waktu_checkin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `Id_Penilaian` int(7) NOT NULL,
  `Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_kamar`
--

CREATE TABLE `type_kamar` (
  `id_type` int(7) NOT NULL,
  `id_fasilitasKamar` int(7) NOT NULL,
  `harga` int(10) NOT NULL,
  `Deskripsi` varchar(50) NOT NULL,
  `Nama_type` varchar(25) NOT NULL,
  `Gambar` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(7) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `NoPasport` varchar(15) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `No_hp` int(12) NOT NULL,
  `id_penilaian` int(7) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_Admin`),
  ADD KEY `id_pemesanan` (`id_pemesanan`,`id_pegawai`,`id_penilaian`,`id_wisata`,`id_user`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_penilaian` (`id_penilaian`),
  ADD KEY `id_wisata` (`id_wisata`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `atraksi`
--
ALTER TABLE `atraksi`
  ADD PRIMARY KEY (`id_atraksi`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indexes for table `data_wisata`
--
ALTER TABLE `data_wisata`
  ADD PRIMARY KEY (`id_Wisata`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_FasilitasKamar`);

--
-- Indexes for table `fasilitas_pariwisata`
--
ALTER TABLE `fasilitas_pariwisata`
  ADD PRIMARY KEY (`id_fasilitasPariwisata`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `id_penilaian` (`id_penilaian`,`id_jenis`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `No_Kamar` (`No_Kamar`);

--
-- Indexes for table `jenis_hotel`
--
ALTER TABLE `jenis_hotel`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jenis_wisata`
--
ALTER TABLE `jenis_wisata`
  ADD PRIMARY KEY (`id_jenis`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`No_Kamar`),
  ADD KEY `id_type` (`id_type`,`id_hotel`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indexes for table `pegawai_hotel`
--
ALTER TABLE `pegawai_hotel`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `No_kamar` (`No_kamar`,`id_type`,`id_user`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`Id_Penilaian`);

--
-- Indexes for table `type_kamar`
--
ALTER TABLE `type_kamar`
  ADD PRIMARY KEY (`id_type`),
  ADD KEY `id_fasilitasKamar` (`id_fasilitasKamar`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_penilaian` (`id_penilaian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_Admin` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atraksi`
--
ALTER TABLE `atraksi`
  MODIFY `id_atraksi` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas_pariwisata`
--
ALTER TABLE `fasilitas_pariwisata`
  MODIFY `id_fasilitasPariwisata` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_hotel`
--
ALTER TABLE `jenis_hotel`
  MODIFY `id_jenis` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `No_Kamar` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_hotel`
--
ALTER TABLE `pegawai_hotel`
  MODIFY `id_pegawai` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_kamar`
--
ALTER TABLE `type_kamar`
  MODIFY `id_type` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(7) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai_hotel` (`id_pegawai`),
  ADD CONSTRAINT `admin_ibfk_3` FOREIGN KEY (`id_penilaian`) REFERENCES `penilaian` (`Id_Penilaian`),
  ADD CONSTRAINT `admin_ibfk_4` FOREIGN KEY (`id_wisata`) REFERENCES `data_wisata` (`id_Wisata`),
  ADD CONSTRAINT `admin_ibfk_5` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `atraksi`
--
ALTER TABLE `atraksi`
  ADD CONSTRAINT `atraksi_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `data_wisata` (`id_Wisata`);

--
-- Constraints for table `fasilitas_pariwisata`
--
ALTER TABLE `fasilitas_pariwisata`
  ADD CONSTRAINT `fasilitas_pariwisata_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `data_wisata` (`id_Wisata`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_penilaian`) REFERENCES `penilaian` (`Id_Penilaian`),
  ADD CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_hotel` (`id_jenis`);

--
-- Constraints for table `jenis_wisata`
--
ALTER TABLE `jenis_wisata`
  ADD CONSTRAINT `jenis_wisata_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `data_wisata` (`id_Wisata`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`No_Kamar`) REFERENCES `pemesanan` (`No_kamar`);

--
-- Constraints for table `pegawai_hotel`
--
ALTER TABLE `pegawai_hotel`
  ADD CONSTRAINT `pegawai_hotel_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`No_kamar`) REFERENCES `kamar` (`No_Kamar`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `type_kamar` (`id_type`),
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  ADD CONSTRAINT `pemesanan_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `type_kamar`
--
ALTER TABLE `type_kamar`
  ADD CONSTRAINT `type_kamar_ibfk_1` FOREIGN KEY (`id_fasilitasKamar`) REFERENCES `fasilitas` (`id_FasilitasKamar`),
  ADD CONSTRAINT `type_kamar_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `kamar` (`id_type`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_penilaian`) REFERENCES `penilaian` (`Id_Penilaian`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
