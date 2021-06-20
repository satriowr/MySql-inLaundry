
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inlaundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cuci_Kiloan`
--

CREATE TABLE `Cuci_Kiloan` (
  `kode_cuci` int NOT NULL,
  `id_customers` varchar(11) NOT NULL,
  `id_employee` varchar(11) DEFAULT NULL,
  `kaos` int DEFAULT NULL,
  `kemeja` int DEFAULT NULL,
  `dress` int DEFAULT NULL,
  `celana_pendek` int DEFAULT NULL,
  `celana_panjang` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Cuci_Kiloan`
--

INSERT INTO `Cuci_Kiloan` (`kode_cuci`, `id_customers`, `id_employee`, `kaos`, `kemeja`, `dress`, `celana_pendek`, `celana_panjang`) VALUES
(1, 'CUS001', NULL, 3, 2, 6, 5, 4),
(2, 'CUS002', NULL, 7, 0, 5, 5, 3),
(3, 'CUS003', NULL, 5, 4, 3, 1, 2),
(4, 'CUS004', NULL, 2, 1, 4, 1, 5),
(5, 'CUS005', NULL, 3, 6, 6, 1, 2),
(6, 'CUS001', NULL, 3, 2, 6, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `id_customers` varchar(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`id_customers`, `username`, `email`, `password`, `first_name`, `last_name`, `date_of_birth`, `phone`) VALUES
('CUS001', 'customer001', 'cust001@gmail.com', 'customers123', 'Gia', 'Anisa', '2004-04-05', '62614516122'),
('CUS002', 'customer002', 'cust002@gmail.com', 'customers123', 'Arvin', 'Aradhana', '2001-10-07', '62331711122'),
('CUS003', 'customer003', 'cust003@gmail.com', 'customers123', 'Tim', 'Cook', '1990-02-15', '62614577878'),
('CUS004', 'customer004', 'cust004@gmail.com', 'customers123', 'Ramona', 'Corona', '1990-11-15', '62614135848'),
('CUS005', 'customer005', 'cust005@gmail.com', 'customers123', 'Vairus Abdul', 'Covid', '2000-09-25', '62115134168');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `id_employee` varchar(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`id_employee`, `username`, `email`, `password`, `first_name`, `last_name`, `date_of_birth`, `phone`) VALUES
('EMP001', 'employee001', 'employ001@gmail.com', 'employee123', 'Darmo', 'Salim', '2000-12-12', '6285711227718'),
('EMP002', 'employee002', 'employ002@gmail.com', 'employee123', 'Mee-chan', 'Ohayoo', '2001-02-13', '62361812922'),
('EMP003', 'employee003', 'employ003@gmail.com', 'employee123', 'Origatoo', 'Hiyaaa', '1999-01-07', '62216412746');

-- --------------------------------------------------------

--
-- Table structure for table `Jenis_Layanan`
--

CREATE TABLE `Jenis_Layanan` (
  `id_layanan` varchar(11) NOT NULL,
  `nama_layanan` text NOT NULL,
  `harga` int NOT NULL,
  `id_owner` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Jenis_Layanan`
--

INSERT INTO `Jenis_Layanan` (`id_layanan`, `nama_layanan`, `harga`, `id_owner`) VALUES
('LAY001', 'Cuci Kering', 5500, 'OWN001'),
('LAY002', 'Cuci Basah', 5500, 'OWN001'),
('LAY003', 'Cuci Setrika', 6000, 'OWN001');

-- --------------------------------------------------------

--
-- Table structure for table `Owner`
--

CREATE TABLE `Owner` (
  `id_owner` varchar(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Owner`
--

INSERT INTO `Owner` (`id_owner`, `username`, `password`) VALUES
('OWN001', 'owner001', 'owner123');

-- --------------------------------------------------------

--
-- Table structure for table `Pembayaran`
--

CREATE TABLE `Pembayaran` (
  `id_pembayaran` varchar(11) NOT NULL,
  `id_order` varchar(11) NOT NULL,
  `id_customers` varchar(11) NOT NULL,
  `id_employee` varchar(11) DEFAULT NULL,
  `id_status` int NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `berat` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Pembayaran`
--

INSERT INTO `Pembayaran` (`id_pembayaran`, `id_order`, `id_customers`, `id_employee`, `id_status`, `tanggal_transaksi`, `berat`, `total`) VALUES
('PEM001', 'ORD001', 'CUS001', NULL, 2, '2021-05-09 12:12:00', 5, 30000),
('PEM002', 'ORD002', 'CUS002', NULL, 2, '2021-05-09 10:11:00', 10, 60000),
('PEM003', 'ORD003', 'CUS003', NULL, 1, '2021-05-09 09:25:00', 7, 38500),
('PEM004', 'ORD004', 'CUS004', NULL, 2, '2021-05-09 09:15:00', 19, 114000),
('PEM005', 'ORD005', 'CUS005', NULL, 1, '2021-05-09 07:30:00', 10, 55000);

-- --------------------------------------------------------

--
-- Table structure for table `Pemesanan`
--

CREATE TABLE `Pemesanan` (
  `id_order` varchar(11) NOT NULL,
  `kode_cuci` int NOT NULL,
  `id_layanan` varchar(11) NOT NULL,
  `catatan` text,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Pemesanan`
--

INSERT INTO `Pemesanan` (`id_order`, `kode_cuci`, `id_layanan`, `catatan`, `alamat`) VALUES
('ORD001', 1, 'LAY003', 'Saya tunggu di lobby Apartement', 'Telkom Apartment, Sukapura'),
('ORD002', 2, 'LAY003', 'Kabarin kalau udah di depan pak', 'Koloni Sukabirus'),
('ORD003', 3, 'LAY001', NULL, 'Cihampelas'),
('ORD004', 4, 'LAY003', NULL, 'Cibiru'),
('ORD005', 5, 'LAY002', NULL, 'BSD');

-- --------------------------------------------------------

--
-- Table structure for table `Status`
--

CREATE TABLE `Status` (
  `id_status` int NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Status`
--

INSERT INTO `Status` (`id_status`, `status`) VALUES
(1, 'Process'),
(2, 'Konfirmasi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cuci_Kiloan`
--
ALTER TABLE `Cuci_Kiloan`
  ADD PRIMARY KEY (`kode_cuci`),
  ADD KEY `fk_cucikiloan_customers` (`id_employee`),
  ADD KEY `fk_cucikiloan_employee` (`id_customers`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`id_customers`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `Jenis_Layanan`
--
ALTER TABLE `Jenis_Layanan`
  ADD PRIMARY KEY (`id_layanan`),
  ADD KEY `fk_jenislayanan_owner` (`id_owner`);

--
-- Indexes for table `Owner`
--
ALTER TABLE `Owner`
  ADD PRIMARY KEY (`id_owner`);

--
-- Indexes for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `fk_pembayaran_order` (`id_order`),
  ADD KEY `fk_pembayaran_customers` (`id_customers`),
  ADD KEY `fk_pembayaran_employee` (`id_employee`),
  ADD KEY `fk_pembayaran_status` (`id_status`);

--
-- Indexes for table `Pemesanan`
--
ALTER TABLE `Pemesanan`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_pemesanan_cucikiloan` (`kode_cuci`),
  ADD KEY `fk_pemesanan_jenislayanan` (`id_layanan`);

--
-- Indexes for table `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cuci_Kiloan`
--
ALTER TABLE `Cuci_Kiloan`
  MODIFY `kode_cuci` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cuci_Kiloan`
--
ALTER TABLE `Cuci_Kiloan`
  ADD CONSTRAINT `fk_cucikiloan_customers` FOREIGN KEY (`id_employee`) REFERENCES `Employee` (`id_employee`),
  ADD CONSTRAINT `fk_cucikiloan_employee` FOREIGN KEY (`id_customers`) REFERENCES `Customers` (`id_customers`);

--
-- Constraints for table `Jenis_Layanan`
--
ALTER TABLE `Jenis_Layanan`
  ADD CONSTRAINT `fk_jenislayanan_owner` FOREIGN KEY (`id_owner`) REFERENCES `Owner` (`id_owner`);

--
-- Constraints for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  ADD CONSTRAINT `fk_pembayaran_customers` FOREIGN KEY (`id_customers`) REFERENCES `Customers` (`id_customers`),
  ADD CONSTRAINT `fk_pembayaran_employee` FOREIGN KEY (`id_employee`) REFERENCES `Employee` (`id_employee`),
  ADD CONSTRAINT `fk_pembayaran_order` FOREIGN KEY (`id_order`) REFERENCES `Pemesanan` (`id_order`),
  ADD CONSTRAINT `fk_pembayaran_status` FOREIGN KEY (`id_status`) REFERENCES `Status` (`id_status`);

--
-- Constraints for table `Pemesanan`
--
ALTER TABLE `Pemesanan`
  ADD CONSTRAINT `fk_pemesanan_cucikiloan` FOREIGN KEY (`kode_cuci`) REFERENCES `Cuci_Kiloan` (`kode_cuci`),
  ADD CONSTRAINT `fk_pemesanan_jenislayanan` FOREIGN KEY (`id_layanan`) REFERENCES `Jenis_Layanan` (`id_layanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
