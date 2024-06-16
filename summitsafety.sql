-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 04 Jun 2024 pada 07.53
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `summitsafety`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` bigint NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `stok` int NOT NULL,
  `harga` double NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_boking_porter`
--

CREATE TABLE `detail_boking_porter` (
  `id` bigint NOT NULL,
  `porter_id` bigint NOT NULL,
  `gunung_id` bigint NOT NULL,
  `profil_id` bigint NOT NULL,
  `nama_bank` varchar(35) NOT NULL,
  `no_rekening` int NOT NULL,
  `tanggal_boking` datetime NOT NULL,
  `no_transaksi` varchar(255) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_reservasi_gunung`
--

CREATE TABLE `detail_reservasi_gunung` (
  `id` bigint NOT NULL,
  `gunung_id` bigint NOT NULL,
  `profil_id` bigint NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `nomor_rekening` int NOT NULL,
  `no_transaksi` varchar(255) NOT NULL,
  `tanggal_reservasi` datetime NOT NULL,
  `jumlah_orang` int NOT NULL,
  `total_harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_sewa`
--

CREATE TABLE `detail_sewa` (
  `id` bigint NOT NULL,
  `barang_id` bigint NOT NULL,
  `profil_id` bigint NOT NULL,
  `gunung_id` bigint NOT NULL,
  `no_transaksi` varchar(255) NOT NULL,
  `tanggal_sewa` datetime NOT NULL,
  `jumlah_barang` int NOT NULL,
  `total harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gunung`
--

CREATE TABLE `gunung` (
  `id` bigint NOT NULL,
  `profil_id` bigint NOT NULL,
  `nama_gunung` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `image` blob NOT NULL,
  `status` varchar(255) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `porter`
--

CREATE TABLE `porter` (
  `id` bigint NOT NULL,
  `gunung_id` bigint NOT NULL,
  `nama` varchar(35) NOT NULL,
  `nik` int NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_user`
--

CREATE TABLE `profil_user` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `nama` varchar(35) NOT NULL,
  `image` blob NOT NULL,
  `no_hp` int NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sharing`
--

CREATE TABLE `sharing` (
  `id` bigint NOT NULL,
  `profil_id` bigint NOT NULL,
  `judul` varchar(30) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `tanggal_upload` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'hilya@vom', '12345');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_boking_porter`
--
ALTER TABLE `detail_boking_porter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `porter_id` (`porter_id`),
  ADD KEY `gunung_id` (`gunung_id`),
  ADD KEY `profil_id` (`profil_id`);

--
-- Indeks untuk tabel `detail_reservasi_gunung`
--
ALTER TABLE `detail_reservasi_gunung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gunung_id` (`gunung_id`),
  ADD KEY `profil_id` (`profil_id`);

--
-- Indeks untuk tabel `detail_sewa`
--
ALTER TABLE `detail_sewa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `profil_id` (`profil_id`),
  ADD KEY `gunung_id` (`gunung_id`);

--
-- Indeks untuk tabel `gunung`
--
ALTER TABLE `gunung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profil_id` (`profil_id`);

--
-- Indeks untuk tabel `porter`
--
ALTER TABLE `porter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gunung_id` (`gunung_id`);

--
-- Indeks untuk tabel `profil_user`
--
ALTER TABLE `profil_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `sharing`
--
ALTER TABLE `sharing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profil_id` (`profil_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_boking_porter`
--
ALTER TABLE `detail_boking_porter`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_reservasi_gunung`
--
ALTER TABLE `detail_reservasi_gunung`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_sewa`
--
ALTER TABLE `detail_sewa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gunung`
--
ALTER TABLE `gunung`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `porter`
--
ALTER TABLE `porter`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `profil_user`
--
ALTER TABLE `profil_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sharing`
--
ALTER TABLE `sharing`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_boking_porter`
--
ALTER TABLE `detail_boking_porter`
  ADD CONSTRAINT `detail_boking_porter_ibfk_1` FOREIGN KEY (`porter_id`) REFERENCES `porter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_boking_porter_ibfk_2` FOREIGN KEY (`gunung_id`) REFERENCES `gunung` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_boking_porter_ibfk_3` FOREIGN KEY (`profil_id`) REFERENCES `profil_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_reservasi_gunung`
--
ALTER TABLE `detail_reservasi_gunung`
  ADD CONSTRAINT `detail_reservasi_gunung_ibfk_1` FOREIGN KEY (`gunung_id`) REFERENCES `gunung` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_reservasi_gunung_ibfk_2` FOREIGN KEY (`profil_id`) REFERENCES `profil_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_sewa`
--
ALTER TABLE `detail_sewa`
  ADD CONSTRAINT `detail_sewa_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_sewa_ibfk_2` FOREIGN KEY (`profil_id`) REFERENCES `profil_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_sewa_ibfk_3` FOREIGN KEY (`gunung_id`) REFERENCES `gunung` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gunung`
--
ALTER TABLE `gunung`
  ADD CONSTRAINT `gunung_ibfk_1` FOREIGN KEY (`profil_id`) REFERENCES `profil_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `porter`
--
ALTER TABLE `porter`
  ADD CONSTRAINT `porter_ibfk_1` FOREIGN KEY (`gunung_id`) REFERENCES `gunung` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profil_user`
--
ALTER TABLE `profil_user`
  ADD CONSTRAINT `profil_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sharing`
--
ALTER TABLE `sharing`
  ADD CONSTRAINT `sharing_ibfk_1` FOREIGN KEY (`profil_id`) REFERENCES `profil_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
