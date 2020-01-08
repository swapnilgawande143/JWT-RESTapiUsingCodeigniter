-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2020 at 07:59 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rfid_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `lot_header_all`
--

CREATE TABLE `lot_header_all` (
  `id` int(20) NOT NULL,
  `lot_id` varchar(15) NOT NULL,
  `transaction_type` varchar(50) NOT NULL COMMENT '1=warehouse to coach, 2=coach to warehouse, 3 washing to warehouse, 4 warehouse to washing',
  `sub_type` varchar(20) NOT NULL COMMENT 'soiled/damaged/freshed',
  `lot_coach_number` varchar(30) NOT NULL,
  `assign_to_train_number` varchar(10) NOT NULL,
  `transaction_on_date_time` datetime NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `list_of_issued_rfid_tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lot_transaction_info_all`
--

CREATE TABLE `lot_transaction_info_all` (
  `id` int(20) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `bedsheet` int(11) NOT NULL,
  `pillow_covers` int(11) NOT NULL,
  `blacket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rfid_tag_header_all`
--

CREATE TABLE `rfid_tag_header_all` (
  `id` int(20) NOT NULL,
  `rfid_tag_id` varchar(15) NOT NULL,
  `warehouse_id` varchar(10) NOT NULL,
  `washing_count` int(20) NOT NULL,
  `current_status` varchar(30) NOT NULL,
  `attached_type` varchar(25) NOT NULL COMMENT 'pillow/blanket/bed-sheet',
  `valid_from` datetime NOT NULL,
  `valid_upto` datetime NOT NULL,
  `assign_by_user` int(11) NOT NULL,
  `assign_to_warehouse_user` int(11) NOT NULL,
  `washing_cycle` int(20) NOT NULL,
  `current_use_count` int(3) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `station_warehouse_header_all`
--

CREATE TABLE `station_warehouse_header_all` (
  `id` int(11) NOT NULL,
  `zone_id` varchar(15) NOT NULL COMMENT 'station belongs to this zone',
  `division_id` varchar(15) NOT NULL,
  `station_warehouse_id` varchar(10) NOT NULL COMMENT 'This is the header id',
  `station_warehouse_name` varchar(500) NOT NULL COMMENT 'place where this system is instalaltion',
  `warehouse_address` varchar(500) NOT NULL COMMENT 'station address by lat long',
  `warehouse_status` varchar(10) NOT NULL COMMENT 'station is active/de-active',
  `ceated_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station_warehouse_header_all`
--

INSERT INTO `station_warehouse_header_all` (`id`, `zone_id`, `division_id`, `station_warehouse_id`, `station_warehouse_name`, `warehouse_address`, `warehouse_status`, `ceated_on`, `modified_on`) VALUES
(1, 'Cen456', 'Pun235', 'Pun243', 'Pune', 'Sadhu Vaswani Path, Koregaon Park, Agarkar Nagar, Pune, Maharashtra 411001, India', 'active', '2019-10-07 14:00:18', '2019-10-07 14:54:48'),
(2, 'Cen456', 'Mum546', 'Mum948', 'Mumbai', 'Bhanu Sagar Talkies, Bhanunagar Kalyan(West), Bhoiwada, Kalyan, Maharashtra 421301, India', 'active', '2019-10-07 15:26:23', '0000-00-00 00:00:00'),
(3, 'Cen456', 'Mum546', 'Tha405', 'Bhopal', 'Station Rd, Shivaji Nagar, Thane East, Thane, Maharashtra 400601, India', 'active', '2019-10-09 13:28:41', '2019-10-17 16:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_information_header_all`
--

CREATE TABLE `user_information_header_all` (
  `id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL COMMENT 'unique id for representation',
  `station_warehouse_id` varchar(10) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_status` varchar(10) NOT NULL COMMENT 'activate , deactivated',
  `user_type` varchar(20) NOT NULL COMMENT 'user_type is  MISCOS or Station admin / Group admin',
  `user_contact` varchar(15) NOT NULL,
  `user_designation` varchar(50) NOT NULL,
  `user_img` varchar(500) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_information_header_all`
--

INSERT INTO `user_information_header_all` (`id`, `user_id`, `station_warehouse_id`, `user_name`, `user_password`, `user_status`, `user_type`, `user_contact`, `user_designation`, `user_img`, `created_on`, `modified_on`) VALUES
(1, 'Nik504', 'Tha405', 'Nikita chitnis', '12345', 'Active', 'Station Admin', '8645564313', 'Worker', 'http://premisafe.com/all_user_images/Nik504/all_user_images/ImageAma172_20180225_092710.jpeg', '2019-10-09 13:32:12', '0000-00-00 00:00:00'),
(2, 'Pra678', 'Tha405', 'Pradnya Thakre', '26618', 'Active', 'Group Admin', '5651351351', 'Station Master', '', '2019-10-21 20:00:27', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_stock_details_header_all`
--

CREATE TABLE `warehouse_stock_details_header_all` (
  `id` int(20) NOT NULL,
  `warehouse_id` varchar(15) NOT NULL,
  `bedsheet_fresh` int(11) NOT NULL COMMENT 'after washed or new or return from travel but not used',
  `bedsheet_soiled` int(11) NOT NULL COMMENT 'used',
  `bedsheet_faulty` int(11) NOT NULL COMMENT 'not properly wahed or damaged return by passenger',
  `blancket_fresh` int(11) NOT NULL,
  `blancket_soiled` int(11) NOT NULL,
  `blancket_faulty` int(11) NOT NULL,
  `bedsheet_under_washing` int(11) NOT NULL,
  `blancket_under_washing` int(11) NOT NULL,
  `towel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `zone_division_header_all`
--

CREATE TABLE `zone_division_header_all` (
  `id` int(11) NOT NULL,
  `zone_id` varchar(15) NOT NULL,
  `zone_name` varchar(50) NOT NULL,
  `division_names` varchar(1000) NOT NULL COMMENT 'division_name-division_id, with comma seperater',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone_division_header_all`
--

INSERT INTO `zone_division_header_all` (`id`, `zone_id`, `zone_name`, `division_names`, `created_on`, `updated_on`) VALUES
(1, 'Cen456', 'Central Railway', 'Mumbai-Mum546,Nagpur-Nag765,Bhusawal-Bhu563,Pune-Pun235,Sholapur-Sho876', '2019-09-04 01:42:08', '0000-00-00 00:00:00'),
(2, 'Eas654', 'Eastern Railway', 'Howrah-How564,Sealdah-Sel643,Malda-Mal765,Asansol-Asa654,Chitaranjan-Chi235,Kolkata Metro-Kol296', '2019-09-04 01:46:18', '0000-00-00 00:00:00'),
(3, 'Eas910', 'East Central Railway', 'Danapur-Dan719,Mugalsarai-Mug291,Dhanbad-Dha376,Sonpur-Son511,Samastipur-Sam555', '2019-09-04 01:49:08', '0000-00-00 00:00:00'),
(4, 'Eas888', 'East Coast Railway', 'Khurda Road-Khu756,Waltair-Wal444,Sambhalpur-Sam777', '2019-09-04 01:51:00', '0000-00-00 00:00:00'),
(5, 'Nor456', 'Northern Railway', 'Delhi-Del222,Ambala-Amb343,Moradabad-Mor286,Lucknow-Luc999,Firozpur-Fir581', '2019-09-04 01:52:00', '0000-00-00 00:00:00'),
(6, 'Nor480', 'North Central  Railway', 'Allahabad-All123,Jhansi-Jha234,Agra-Agr345', '2019-09-04 01:54:00', '0000-00-00 00:00:00'),
(7, 'Nor345', 'North Eastern  Railway', 'Izzatnagar-Izz456,Lucknow-Luc567,Varanasi-Var678,DLW-Dlw789', '2019-09-04 01:56:00', '0000-00-00 00:00:00'),
(8, 'Nor122', 'North Frontier  Railway', 'Katihar-Kat890,Alipurduar-Ali098,Rangiya-Ran987,Lumding-Lum876,Tinsukhia-Tin876', '2019-09-04 01:59:13', '0000-00-00 00:00:00'),
(9, 'Nor666', 'North Western Railway', 'Jaipur-Jai777,Jodhpur-Jod343,Bikaner-Bik211,Ajmer-Ajm380', '2019-09-04 02:02:18', '0000-00-00 00:00:00'),
(10, 'Sou678', 'Southern  Railway', 'Chennai-Che673,Madurai-Mad497,Palghat-Pal711,Trichy-Tri098,TrivendrumTei334', '2019-09-04 02:08:07', '0000-00-00 00:00:00'),
(11, 'Sou999', 'South Central Railway', 'Secunderabad-Sec452,Hyderabad-Hyd811,GuntakalGun765,Vijaywada-Vij956,Nanded-Nan453', '2019-09-04 02:11:06', '0000-00-00 00:00:00'),
(12, 'Sou835', 'South Eastern Railway', 'Kharagpur-Kha635,Adra-Adr444,Chakradharpur-Cha598,Ranchi-Ran476,Shalimar-Sha467', '2019-09-04 02:11:09', '0000-00-00 00:00:00'),
(13, 'Sou666', 'South East Central  Railway', 'Bilaspur-Bis675,Nagpur-Nag643,RaipurRai786', '2019-09-04 02:07:05', '0000-00-00 00:00:00'),
(14, 'Sou333', 'South Western Railway', 'Bangalore-Ban666,Mysore-Mys437,Hubli-Hul298,RWF/YNK-Rwf598', '2019-09-04 02:09:00', '0000-00-00 00:00:00'),
(15, 'Wes627', 'Western Railway', 'BCT-Bct498,Vadodara-Vad756,Ahemdabad-Ahe593,Ratlam-Rat523,Rajkot-Raj783,Bhavnagar-Bha398', '2019-09-04 02:11:00', '0000-00-00 00:00:00'),
(16, 'Wed689', 'West Central Railway', 'Jabalpur-Jab783,Bhopal-Bho832,Kota-Kot264', '2019-09-04 02:12:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lot_header_all`
--
ALTER TABLE `lot_header_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lot_transaction_info_all`
--
ALTER TABLE `lot_transaction_info_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfid_tag_header_all`
--
ALTER TABLE `rfid_tag_header_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station_warehouse_header_all`
--
ALTER TABLE `station_warehouse_header_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_information_header_all`
--
ALTER TABLE `user_information_header_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_stock_details_header_all`
--
ALTER TABLE `warehouse_stock_details_header_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone_division_header_all`
--
ALTER TABLE `zone_division_header_all`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lot_header_all`
--
ALTER TABLE `lot_header_all`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lot_transaction_info_all`
--
ALTER TABLE `lot_transaction_info_all`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rfid_tag_header_all`
--
ALTER TABLE `rfid_tag_header_all`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station_warehouse_header_all`
--
ALTER TABLE `station_warehouse_header_all`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_information_header_all`
--
ALTER TABLE `user_information_header_all`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouse_stock_details_header_all`
--
ALTER TABLE `warehouse_stock_details_header_all`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zone_division_header_all`
--
ALTER TABLE `zone_division_header_all`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
