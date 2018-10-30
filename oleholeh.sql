-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18 Okt 2018 pada 15.11
-- Versi Server: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oleholeh`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `ID_ADMIN` varchar(10) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ALAMAT` text,
  `PASSWORD` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_ADMIN` varchar(10) NOT NULL,
  `ID_KERANJANG` varchar(100) NOT NULL,
  `ID_TRANSAKSI` varchar(100) NOT NULL,
  `NAMA_BARANG` text,
  `BERAT` decimal(25,0) DEFAULT NULL,
  `DESKRIPSI` text,
  `IMG` varchar(100) DEFAULT NULL,
  `HARGA_BARANG` decimal(25,0) DEFAULT NULL,
  `STOK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detailtransaksi`
--

CREATE TABLE IF NOT EXISTS `tbl_detailtransaksi` (
  `ID_DETAILKERANJANG` varchar(100) NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TGL_TRANSAKSI` date DEFAULT NULL,
  `JUMLAH` int(11) DEFAULT NULL,
  `TOTAL` decimal(25,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_keranjang`
--

CREATE TABLE IF NOT EXISTS `tbl_keranjang` (
  `ID_KERANJANG` varchar(100) NOT NULL,
  `ID_PELANGGAN` varchar(100) NOT NULL,
  `QTY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE IF NOT EXISTS `tbl_pelanggan` (
  `ID_PELANGGAN` varchar(100) NOT NULL,
  `NAMA_PEL` varchar(100) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `JK` tinyint(1) DEFAULT NULL,
  `TGL_LAHIR` date DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE IF NOT EXISTS `tbl_transaksi` (
  `ID_TRANSAKSI` varchar(100) NOT NULL,
  `ID_PELANGGAN` varchar(100) NOT NULL,
  `ID_KERANJANG` varchar(100) NOT NULL,
  `ID_DETAILKERANJANG` varchar(100) NOT NULL,
  `HARGA_BARANG` decimal(25,0) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
 ADD PRIMARY KEY (`ID_ADMIN`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
 ADD PRIMARY KEY (`ID_BARANG`), ADD KEY `FK_DIMASUKKAN` (`ID_KERANJANG`), ADD KEY `FK_DIPILIH` (`ID_TRANSAKSI`), ADD KEY `FK_INPUT` (`ID_ADMIN`);

--
-- Indexes for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
 ADD PRIMARY KEY (`ID_DETAILKERANJANG`);

--
-- Indexes for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
 ADD PRIMARY KEY (`ID_KERANJANG`), ADD KEY `FK_MEMASUKKAN` (`ID_PELANGGAN`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
 ADD PRIMARY KEY (`ID_PELANGGAN`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
 ADD PRIMARY KEY (`ID_TRANSAKSI`), ADD KEY `FK_MASUK` (`ID_KERANJANG`), ADD KEY `FK_MELAKUKAN` (`ID_PELANGGAN`), ADD KEY `FK_MEMILIKI` (`ID_DETAILKERANJANG`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
ADD CONSTRAINT `FK_DIMASUKKAN` FOREIGN KEY (`ID_KERANJANG`) REFERENCES `tbl_keranjang` (`ID_KERANJANG`),
ADD CONSTRAINT `FK_DIPILIH` FOREIGN KEY (`ID_TRANSAKSI`) REFERENCES `tbl_transaksi` (`ID_TRANSAKSI`),
ADD CONSTRAINT `FK_INPUT` FOREIGN KEY (`ID_ADMIN`) REFERENCES `tbl_admin` (`ID_ADMIN`);

--
-- Ketidakleluasaan untuk tabel `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
ADD CONSTRAINT `FK_MELIHAT` FOREIGN KEY (`ID_DETAILKERANJANG`) REFERENCES `tbl_pelanggan` (`ID_PELANGGAN`);

--
-- Ketidakleluasaan untuk tabel `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
ADD CONSTRAINT `FK_MEMASUKKAN` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `tbl_pelanggan` (`ID_PELANGGAN`);

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
ADD CONSTRAINT `FK_MASUK` FOREIGN KEY (`ID_KERANJANG`) REFERENCES `tbl_keranjang` (`ID_KERANJANG`),
ADD CONSTRAINT `FK_MELAKUKAN` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `tbl_pelanggan` (`ID_PELANGGAN`),
ADD CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`ID_DETAILKERANJANG`) REFERENCES `tbl_detailtransaksi` (`ID_DETAILKERANJANG`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
