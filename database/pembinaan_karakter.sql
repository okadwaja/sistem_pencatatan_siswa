-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 21 Jun 2023 pada 10.00
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
-- Database: `pembinaan_karakter`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alumni`
--

CREATE TABLE `alumni` (
  `nis` varchar(6) NOT NULL,
  `nama_alumni` varchar(30) NOT NULL,
  `th_lulus` year NOT NULL,
  `id_jurusan` tinyint NOT NULL,
  `sub_kelas` char(1) NOT NULL,
  `id_ortu` int NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `alumni`
--

INSERT INTO `alumni` (`nis`, `nama_alumni`, `th_lulus`, `id_jurusan`, `sub_kelas`, `id_ortu`, `alamat`) VALUES
('12347', 'Baim', '2017', 2, 'A', 2, 'Bantul, Yogyakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_poin`
--

CREATE TABLE `detail_poin` (
  `id_detail_poin` int NOT NULL,
  `tanggal` date NOT NULL,
  `tahun_ajaran` char(9) NOT NULL,
  `nis` varchar(6) NOT NULL,
  `id_pelanggaran` tinyint DEFAULT NULL,
  `id_prestasi` tinyint DEFAULT NULL,
  `ket` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_poin`
--

INSERT INTO `detail_poin` (`id_detail_poin`, `tanggal`, `tahun_ajaran`, `nis`, `id_pelanggaran`, `id_prestasi`, `ket`) VALUES
(70, '2023-06-20', '2023/2024', '12345', NULL, 1, 'Juara 1 lomba matematika tingkat nasional'),
(71, '2023-06-20', '2023/2024', '12345', NULL, 10, 'Menjadi panitia kelulusan'),
(72, '2023-06-20', '2023/2024', '12345', NULL, 12, 'Nilai tertinggi ulangan matematika'),
(73, '2023-06-20', '2023/2024', '12345', 12, NULL, 'Tidak mengikuti upacara bendera'),
(74, '2023-06-20', '2023/2024', '12345', 2, NULL, 'Tidak membawa buku paket'),
(75, '2023-06-20', '2023/2024', '13456', 5, NULL, 'Membolos'),
(76, '2023-06-20', '2023/2024', '17890', 7, NULL, 'Membuat ribut'),
(77, '2023-06-20', '2023/2024', '16789', NULL, 4, 'Juara lomba poster tingkat kecamatan'),
(78, '2023-06-20', '2023/2024', '15678', NULL, 5, 'Juara pidato tingkat sekolah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nip` char(18) NOT NULL,
  `nama_guru` varchar(30) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `jabatan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nip`, `nama_guru`, `no_hp`, `jabatan`) VALUES
('123456789012345678', 'Bapak Putu', '081234567890', 'Wali Kelas'),
('234567890123456789', 'Bapak Wayan', '081212121212', 'Wali Kelas'),
('345678901234567890', 'Bapak Kadek', '082323232323', 'Wali Kelas'),
('456789012345678901', 'Bapak Made', '083434343434', 'Wali Kelas'),
('567890123456789012', 'Bapak Komang', '084545454545', 'Wali Kelas'),
('678901234567890123', 'Bapak Ketut', '085656565656', 'Wali Kelas'),
('789012345678901234', 'Bapak Putu Hendrawan', '086767676767', 'Kepala Sekolah'),
('890123456789012345', 'Bapak Kadek Putra', '087878787878', 'Guru Kesiswaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` tinyint NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'MIPA'),
(2, 'IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kat_pelanggaran`
--

CREATE TABLE `kat_pelanggaran` (
  `id_kat_pelanggaran` tinyint NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kat_pelanggaran`
--

INSERT INTO `kat_pelanggaran` (`id_kat_pelanggaran`, `nama_kategori`) VALUES
(1, 'Komponen Kelakuan'),
(2, 'Komponen Kerapihan'),
(3, 'Komponen Kerajinan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` tinyint NOT NULL,
  `id_jurusan` tinyint NOT NULL,
  `tingkat_kelas` varchar(4) NOT NULL,
  `sub_kelas` char(1) NOT NULL,
  `nip` char(18) DEFAULT NULL,
  `jml_siswa` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_jurusan`, `tingkat_kelas`, `sub_kelas`, `nip`, `jml_siswa`) VALUES
(1, 1, 'X', 'A', '123456789012345678', 1),
(2, 1, 'XI', 'A', '234567890123456789', 1),
(3, 1, 'XII', 'A', '345678901234567890', 1),
(4, 2, 'X', 'A', '456789012345678901', 1),
(5, 2, 'XI', 'A', '567890123456789012', 1),
(6, 2, 'XII', 'A', '678901234567890123', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orang_tua`
--

CREATE TABLE `orang_tua` (
  `id_ortu` int NOT NULL,
  `nama_ortu` varchar(30) NOT NULL,
  `alamat_ortu` text NOT NULL,
  `no_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orang_tua`
--

INSERT INTO `orang_tua` (`id_ortu`, `nama_ortu`, `alamat_ortu`, `no_hp`) VALUES
(1, 'Adi Wirawan', 'Badung', '098765432123'),
(2, 'Bapak Putu Arta', 'Badung', '089999999999'),
(3, 'Bapak Kadek Mahedra', 'Klungkung', '086666666666'),
(4, 'Bapak Made Setiawan', 'Gianyar', '083866304002'),
(5, 'Bapak Komang Bimana', 'Tabanan', '081129478333'),
(6, 'Bapak Ketut Sedana', 'Karangasem', '085647021807');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id_pelanggaran` tinyint NOT NULL,
  `nama_pelanggaran` varchar(150) NOT NULL,
  `id_sub_kategori` tinyint NOT NULL,
  `poin` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggaran`
--

INSERT INTO `pelanggaran` (`id_pelanggaran`, `nama_pelanggaran`, `id_sub_kategori`, `poin`) VALUES
(1, 'Terlambat hadir di sekolah / keg.PBM lebih dari 5 menit', 1, 2),
(2, 'Tidak membawa buku paket/pelajaran', 1, 5),
(3, 'TIdak mengerjakan tugas sesuai dengan batas waktu yang ditentukan', 1, 7),
(4, 'Mencontek/ menconteki', 1, 10),
(5, 'Keluar kampus tanpa ijin guru/ karyawan (membolos)', 1, 10),
(6, 'Makan/ minum/ tidur saat PBM tanpa ijin guru/ karyawan', 1, 10),
(7, 'Membuat gaduh di kelas', 1, 10),
(8, 'Tidak mengikuti ekstrakurikuler wajib di sekolah', 1, 10),
(9, 'Menggunakan media player dan atau alat komunikasi saat PBM', 1, 20),
(10, 'Membawa/ meminjamkan alat selain yang menunjang PBM', 1, 20),
(11, 'Tidak mengikuti kegiatan keagamaan tanpa keterangan', 1, 20),
(12, 'Tidak mengikuti upacara bendera', 1, 10),
(13, 'Menggunakan Narkoba', 5, 100),
(16, 'Mencaci', 2, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `id_prestasi` tinyint NOT NULL,
  `nama_prestasi` varchar(100) NOT NULL,
  `poin` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `prestasi`
--

INSERT INTO `prestasi` (`id_prestasi`, `nama_prestasi`, `poin`) VALUES
(1, 'Juara lomba tingkat Nasional', 150),
(2, 'Juara lomba tingkat Provinsi', 100),
(3, 'Juara lomba tingkat Kabupaten/Kota', 50),
(4, 'Juara lomba tingkat Kecamatan', 25),
(5, 'Juara lomba tingkat Sekolah', 20),
(6, 'Peringkat 1-3 di kelas', 20),
(7, 'Pengurus aktif OSIS/PK/Pramuka per tahun', 10),
(8, 'Pengurus aktif kelas per tahun', 5),
(9, 'Pengurus aktif organisasi kemasyarakatan', 5),
(10, 'Menjadi panitia kegiatan sekolah', 4),
(11, 'Mengikuti lomba sebagai wakil sekolah', 3),
(12, 'Mendapat nilai tertinggi ulangan harian', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(6) NOT NULL,
  `nama_siswa` varchar(30) NOT NULL,
  `th_angkatan` year NOT NULL,
  `alamat` text NOT NULL,
  `id_kelas` tinyint NOT NULL,
  `id_ortu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama_siswa`, `th_angkatan`, `alamat`, `id_kelas`, `id_ortu`) VALUES
('12345', 'Oka Dwaja', '2023', 'Jl. Raya Anggungan, Mengwi Badung', 1, 1),
('13456', 'Denny Mustika', '2022', 'Badung', 2, 2),
('14567', 'Dharma Mahendra', '2021', 'Klungkung', 3, 3),
('15678', 'Adi Setiawan', '2023', 'Gianyar', 4, 4),
('16789', 'Putra Bimana', '2022', 'Tabanan', 5, 5),
('17890', 'Arta Sedana', '2021', 'Karangasem', 6, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_do`
--

CREATE TABLE `siswa_do` (
  `nis` varchar(6) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `th_keluar` year NOT NULL,
  `id_jurusan` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa_do`
--

INSERT INTO `siswa_do` (`nis`, `nama`, `th_keluar`, `id_jurusan`) VALUES
('12348', 'Thinkerbell', '2017', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kat_pelanggaran`
--

CREATE TABLE `sub_kat_pelanggaran` (
  `id_sub_kategori` tinyint NOT NULL,
  `nama_sub_kategori` varchar(100) NOT NULL,
  `id_kat_pelanggaran` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sub_kat_pelanggaran`
--

INSERT INTO `sub_kat_pelanggaran` (`id_sub_kategori`, `nama_sub_kategori`, `id_kat_pelanggaran`) VALUES
(1, 'Belajar Mengajar', 1),
(2, 'Penghinaan', 1),
(3, 'Sarana Prasarana', 1),
(4, 'Memakai Perhiasan', 1),
(5, 'Rokok/ Miras/ Narkoba/ Petasan/ Pornografi', 1),
(6, 'Pemalsuan/ Pencurian/ Zina/ Pemerasan/ Perjudian/ Kesopanan/ Penyelewengan/ Geng', 1),
(7, 'Rambut', 2),
(8, 'Pakaian', 2),
(9, 'Kehadiran', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp_rapat`
--

CREATE TABLE `temp_rapat` (
  `id_temp_rapat` int NOT NULL,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp_sp_1`
--

CREATE TABLE `temp_sp_1` (
  `id_temp_sp_1` int NOT NULL,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp_sp_2`
--

CREATE TABLE `temp_sp_2` (
  `id_temp_sp_2` int NOT NULL,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp_sp_3`
--

CREATE TABLE `temp_sp_3` (
  `id_temp_sp_3` int NOT NULL,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint NOT NULL,
  `lihat` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `th_ajaran`
--

CREATE TABLE `th_ajaran` (
  `id_th_ajaran` mediumint NOT NULL,
  `tahun_ajaran` char(9) NOT NULL,
  `sekarang` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `th_ajaran`
--

INSERT INTO `th_ajaran` (`id_th_ajaran`, `tahun_ajaran`, `sekarang`) VALUES
(1, '2022/2023', 'N'),
(2, '2023/2024', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakan`
--

CREATE TABLE `tindakan` (
  `id_tindakan` tinyint NOT NULL,
  `nama_tindakan` varchar(30) NOT NULL,
  `ketentuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tindakan`
--

INSERT INTO `tindakan` (`id_tindakan`, `nama_tindakan`, `ketentuan`) VALUES
(1, 'Diberikan SP 1', 'Jumlah poin pelanggaran mencapai 50 dan kurang dari 75'),
(2, 'Diberikan SP 2', 'Jumlah poin pelanggaran mencapai 75 dan kurang dari 100'),
(3, 'Drop Out', 'Jumlah poin pelanggaran mencapai 100 atau lebih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_login` int NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `nip` char(18) DEFAULT NULL,
  `nis` varchar(6) DEFAULT NULL,
  `id_ortu` int DEFAULT NULL,
  `hak_akses` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_login`, `username`, `password`, `nip`, `nis`, `id_ortu`, `hak_akses`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '12345', 0, 1),
(13, 'oka', 'dcf80b2416ca823e8d807558a9310eb3', '', '12345', 1, 5),
(14, 'kesiswaan', 'accc7841ce41b0f788a737bf9798ea4f', '890123456789012345', '', 0, 2),
(15, 'walikelas', 'dcf52f84dbf511ee4a0abcfc18093ee4', '123456789012345678', '', 0, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- Indeks untuk tabel `detail_poin`
--
ALTER TABLE `detail_poin`
  ADD PRIMARY KEY (`id_detail_poin`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_pelanggaran` (`id_pelanggaran`),
  ADD KEY `id_prestasi` (`id_prestasi`),
  ADD KEY `tahun_ajaran` (`tahun_ajaran`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `kat_pelanggaran`
--
ALTER TABLE `kat_pelanggaran`
  ADD PRIMARY KEY (`id_kat_pelanggaran`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indeks untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id_pelanggaran`),
  ADD KEY `id_kat_pelanggaran` (`id_sub_kategori`);

--
-- Indeks untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id_prestasi`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_ortu` (`id_ortu`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `siswa_do`
--
ALTER TABLE `siswa_do`
  ADD PRIMARY KEY (`nis`);

--
-- Indeks untuk tabel `sub_kat_pelanggaran`
--
ALTER TABLE `sub_kat_pelanggaran`
  ADD PRIMARY KEY (`id_sub_kategori`),
  ADD KEY `id_kat_pelanggaran` (`id_kat_pelanggaran`);

--
-- Indeks untuk tabel `temp_rapat`
--
ALTER TABLE `temp_rapat`
  ADD PRIMARY KEY (`id_temp_rapat`);

--
-- Indeks untuk tabel `temp_sp_1`
--
ALTER TABLE `temp_sp_1`
  ADD PRIMARY KEY (`id_temp_sp_1`);

--
-- Indeks untuk tabel `temp_sp_2`
--
ALTER TABLE `temp_sp_2`
  ADD PRIMARY KEY (`id_temp_sp_2`);

--
-- Indeks untuk tabel `temp_sp_3`
--
ALTER TABLE `temp_sp_3`
  ADD PRIMARY KEY (`id_temp_sp_3`);

--
-- Indeks untuk tabel `th_ajaran`
--
ALTER TABLE `th_ajaran`
  ADD PRIMARY KEY (`id_th_ajaran`),
  ADD UNIQUE KEY `tahun_ajaran` (`tahun_ajaran`);

--
-- Indeks untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`id_tindakan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `nip` (`nip`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_poin`
--
ALTER TABLE `detail_poin`
  MODIFY `id_detail_poin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kat_pelanggaran`
--
ALTER TABLE `kat_pelanggaran`
  MODIFY `id_kat_pelanggaran` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `orang_tua`
--
ALTER TABLE `orang_tua`
  MODIFY `id_ortu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id_pelanggaran` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `id_prestasi` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `sub_kat_pelanggaran`
--
ALTER TABLE `sub_kat_pelanggaran`
  MODIFY `id_sub_kategori` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `temp_rapat`
--
ALTER TABLE `temp_rapat`
  MODIFY `id_temp_rapat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `temp_sp_1`
--
ALTER TABLE `temp_sp_1`
  MODIFY `id_temp_sp_1` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `temp_sp_2`
--
ALTER TABLE `temp_sp_2`
  MODIFY `id_temp_sp_2` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `temp_sp_3`
--
ALTER TABLE `temp_sp_3`
  MODIFY `id_temp_sp_3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `th_ajaran`
--
ALTER TABLE `th_ajaran`
  MODIFY `id_th_ajaran` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tindakan`
--
ALTER TABLE `tindakan`
  MODIFY `id_tindakan` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_login` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `alumni_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `orang_tua` (`id_ortu`);

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`);

--
-- Ketidakleluasaan untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD CONSTRAINT `pelanggaran_ibfk_1` FOREIGN KEY (`id_sub_kategori`) REFERENCES `sub_kat_pelanggaran` (`id_sub_kategori`);

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_ortu`) REFERENCES `orang_tua` (`id_ortu`);

--
-- Ketidakleluasaan untuk tabel `sub_kat_pelanggaran`
--
ALTER TABLE `sub_kat_pelanggaran`
  ADD CONSTRAINT `sub_kat_pelanggaran_ibfk_1` FOREIGN KEY (`id_kat_pelanggaran`) REFERENCES `kat_pelanggaran` (`id_kat_pelanggaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
