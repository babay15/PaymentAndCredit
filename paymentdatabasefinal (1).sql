-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2018 at 08:37 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paymentdatabasefinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `userid` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin_createdby` varchar(50) DEFAULT NULL,
  `admin_updatedby` varchar(50) DEFAULT NULL,
  `admin_createdtime` varchar(50) DEFAULT NULL,
  `admin_updatedtime` varchar(50) DEFAULT NULL,
  `admin_flag` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userid`, `username`, `password`, `admin_createdby`, `admin_updatedby`, `admin_createdtime`, `admin_updatedtime`, `admin_flag`) VALUES
(1, 'admin', 'admin', NULL, NULL, NULL, NULL, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `cash`
--

CREATE TABLE `cash` (
  `cash_id` int(10) NOT NULL,
  `payment_id` int(10) NOT NULL,
  `cash_price` double NOT NULL,
  `cash_date` varchar(50) NOT NULL,
  `cash_status` varchar(50) NOT NULL,
  `cash_createdby` varchar(50) DEFAULT NULL,
  `cash_updatedby` varchar(50) DEFAULT NULL,
  `cash_createdtime` varchar(50) DEFAULT NULL,
  `cash_updatedtime` varchar(50) DEFAULT NULL,
  `cash_flag` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cash`
--

INSERT INTO `cash` (`cash_id`, `payment_id`, `cash_price`, `cash_date`, `cash_status`, `cash_createdby`, `cash_updatedby`, `cash_createdtime`, `cash_updatedtime`, `cash_flag`) VALUES
(1, 1, 9000000, 'asdasd', 'UNPAID', 'admin', 'admin', NULL, NULL, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE `credit` (
  `credit_id` int(10) NOT NULL,
  `payment_id` int(10) NOT NULL,
  `credit_start_date` varchar(50) NOT NULL,
  `credit_duration` int(11) NOT NULL,
  `credit_base_price` double NOT NULL,
  `credit_interest_rate` double NOT NULL,
  `credit_down_payment` double NOT NULL,
  `credit_total` double NOT NULL,
  `credit_monthly_installment` double NOT NULL,
  `credit_status` varchar(50) NOT NULL,
  `credit_createdby` varchar(50) DEFAULT NULL,
  `credit_updatedby` varchar(50) DEFAULT NULL,
  `credit_createdtime` varchar(50) DEFAULT NULL,
  `credit_updatedtime` varchar(50) DEFAULT NULL,
  `credit_flag` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit`
--

INSERT INTO `credit` (`credit_id`, `payment_id`, `credit_start_date`, `credit_duration`, `credit_base_price`, `credit_interest_rate`, `credit_down_payment`, `credit_total`, `credit_monthly_installment`, `credit_status`, `credit_createdby`, `credit_updatedby`, `credit_createdtime`, `credit_updatedtime`, `credit_flag`) VALUES
(1, 6, '18/19/2017', 6, 9000000, 0.01, 60000, 9044700, 1497450, 'unapproved', 'admin', 'admin', NULL, '08/01/2018 02:23:01', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_address` text,
  `customer_telepon` varchar(50) DEFAULT NULL,
  `customer_dob` date DEFAULT NULL,
  `customer_tanggungan` int(10) DEFAULT NULL,
  `customer_gaji` double DEFAULT NULL,
  `customer_penghasilan_tambahan` double DEFAULT NULL,
  `customer_updatedby` varchar(50) DEFAULT NULL,
  `customer_createdby` varchar(50) DEFAULT NULL,
  `customer_createdtime` varchar(50) DEFAULT NULL,
  `customer_updatedtime` varchar(50) DEFAULT NULL,
  `customer_flag` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_address`, `customer_telepon`, `customer_dob`, `customer_tanggungan`, `customer_gaji`, `customer_penghasilan_tambahan`, `customer_updatedby`, `customer_createdby`, `customer_createdtime`, `customer_updatedtime`, `customer_flag`) VALUES
(1, 'Febian', 'febbbbi@gmail.com', 'Jalan Kebenaran', '08180000000', '2018-01-02', 2, 8000000, 0, 'admin', NULL, NULL, '08/01/2018 02:28:46', 'y'),
(2, 'Roronoa', 'R@gmail.com', 'Jalan Kesalahan', '009090909090', '2018-01-02', 1, 9000000, 0, 'admin', NULL, NULL, '08/01/2018 02:29:04', 'y'),
(3, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'n'),
(11, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `payment_price` double NOT NULL,
  `payment_createdby` varchar(50) DEFAULT NULL,
  `payment_updatedby` varchar(50) DEFAULT NULL,
  `payment_createdtime` varchar(50) DEFAULT NULL,
  `payment_updatedtime` varchar(50) DEFAULT NULL,
  `payment_flag` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `customer_id`, `payment_price`, `payment_createdby`, `payment_updatedby`, `payment_createdtime`, `payment_updatedtime`, `payment_flag`) VALUES
(1, 1, 500000, 'admin', 'admin', '', NULL, 'y'),
(6, 2, 8989899, 'admin', 'admin', NULL, NULL, 'y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`cash_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`) USING BTREE,
  ADD UNIQUE KEY `UK_h2d8oeb3ovcrob8r6gxe815dd` (`payment_id`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`credit_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`) USING BTREE,
  ADD UNIQUE KEY `UK_a7qanpihrvgu3nmoaoh7vuaa1` (`payment_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`) USING BTREE,
  ADD UNIQUE KEY `UK_nv6gdqo95afgikjngghh6um8p` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash`
--
ALTER TABLE `cash`
  MODIFY `cash_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
  MODIFY `credit_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cash`
--
ALTER TABLE `cash`
  ADD CONSTRAINT `cash_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `credit`
--
ALTER TABLE `credit`
  ADD CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
