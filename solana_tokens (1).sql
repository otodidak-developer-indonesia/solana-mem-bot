-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Bulan Mei 2025 pada 08.30
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solana_tokens`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `mintAddress` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `price` decimal(30,18) NOT NULL DEFAULT 0.000000000000000000,
  `volume` bigint(20) NOT NULL DEFAULT 0,
  `liquidity` decimal(30,18) NOT NULL DEFAULT 0.000000000000000000,
  `marketCap` decimal(30,18) NOT NULL DEFAULT 0.000000000000000000,
  `buyRatio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ageMinutes` int(11) NOT NULL DEFAULT 0,
  `devNotSelling` tinyint(1) NOT NULL DEFAULT 1,
  `renounced` tinyint(1) NOT NULL DEFAULT 1,
  `volumeOk` tinyint(1) NOT NULL DEFAULT 1,
  `socialOk` tinyint(1) NOT NULL DEFAULT 1,
  `volMarketCapOk` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `token_id` int(11) NOT NULL,
  `mint_address` varchar(100) NOT NULL,
  `purchase_price` decimal(30,18) NOT NULL,
  `highest_price` decimal(30,18) DEFAULT NULL,
  `sell_price` decimal(30,18) DEFAULT NULL,
  `quantity` decimal(30,8) NOT NULL,
  `quantity_sold` decimal(30,8) DEFAULT 0.00000000,
  `partial_sold` tinyint(1) NOT NULL DEFAULT 0,
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_time` datetime NOT NULL,
  `sell_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `balance` decimal(30,8) NOT NULL DEFAULT 0.00000000,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wallet`
--

INSERT INTO `wallet` (`id`, `balance`, `updated_at`) VALUES
(1, 0.43440027, '2025-05-27 06:28:58');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mintAddress` (`mintAddress`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mint_purchase_time` (`mint_address`,`purchase_time`),
  ADD KEY `token_id` (`token_id`);

--
-- Indeks untuk tabel `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`token_id`) REFERENCES `tokens` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
