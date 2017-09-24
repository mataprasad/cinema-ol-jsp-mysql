-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2017 at 06:04 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DbCinemaOL`
--
CREATE DATABASE IF NOT EXISTS `DbCinemaOL` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `DbCinemaOL`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_get_booking_history` (IN `p_user_id` INT, IN `p_min` INT, IN `p_max` INT)  BEGIN
	SELECT 0 INTO @x;
	SELECT *,@x as total_records FROM (SELECT  @x:=@x+1 as SNo,ShowInfo.Show_Id,ShowInfo.Movie_Name, 
	TicketInfo.Ticket_Id,TicketInfo.Ticket_No,TicketInfo.User_Id,TicketInfo.Show_Date, 
	TicketInfo.Show_Time,TicketInfo.Booking_Date,'' as URL FROM TicketInfo JOIN ShowInfo ON TicketInfo.Show_Id=ShowInfo.Show_Id 
	where TicketInfo.User_Id=p_user_id) AS X WHERE SNO between p_min and p_max;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `HallInfo`
--

CREATE TABLE `HallInfo` (
  `Hall_Id` int(11) NOT NULL,
  `Hall_No` varchar(50) DEFAULT NULL,
  `Hall_Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `HallInfo`
--

INSERT INTO `HallInfo` (`Hall_Id`, `Hall_No`, `Hall_Capacity`) VALUES
(1, 'HE01', 90),
(2, 'BH01', 90),
(3, 'HH01', 90),
(4, 'OH01', 90),
(5, 'OE01', 90);

-- --------------------------------------------------------

--
-- Table structure for table `MovieIndustryInfo`
--

CREATE TABLE `MovieIndustryInfo` (
  `Industry_id` int(11) NOT NULL,
  `Industry_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MovieIndustryInfo`
--

INSERT INTO `MovieIndustryInfo` (`Industry_id`, `Industry_Name`) VALUES
(1, 'HOLLYWOOD'),
(2, 'BOLLYWOOD');

-- --------------------------------------------------------

--
-- Table structure for table `MovieInfo`
--

CREATE TABLE `MovieInfo` (
  `Movie_Id` int(11) NOT NULL,
  `Movie_ImageURL` varchar(100) DEFAULT NULL,
  `Movie_Status` int(11) DEFAULT NULL,
  `Movie_Title` varchar(100) DEFAULT NULL,
  `Movie_ReleaseDate` varchar(100) DEFAULT NULL,
  `Movie_Director` varchar(100) DEFAULT NULL,
  `Movie_Casts` varchar(100) DEFAULT NULL,
  `Movie_Language` varchar(100) DEFAULT NULL,
  `Movie_Industry` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MovieInfo`
--

INSERT INTO `MovieInfo` (`Movie_Id`, `Movie_ImageURL`, `Movie_Status`, `Movie_Title`, `Movie_ReleaseDate`, `Movie_Director`, `Movie_Casts`, `Movie_Language`, `Movie_Industry`) VALUES
(1, 'f6407b40-c340-4209-b898-8d026974d0081637377988276456831.jpg', 1, 'KAHAANI', '30/09/2017', 'SUJOY GHOSH', 'A', 'HINDI', 'BOLLYWOOD'),
(2, 'ada2baa8-f606-4228-95f3-2e03af407e503459514672682050280.jpg', 3, 'PAN SINGH TOMAR', '28/10/2017', 'SUJOY GHOSH', 'A', 'HINDI', 'BOLLYWOOD');

-- --------------------------------------------------------

--
-- Table structure for table `MovieLanguageInfo`
--

CREATE TABLE `MovieLanguageInfo` (
  `Language_Id` int(11) NOT NULL,
  `Language_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MovieLanguageInfo`
--

INSERT INTO `MovieLanguageInfo` (`Language_Id`, `Language_Name`) VALUES
(1, 'HINDI'),
(2, 'ENGLISH'),
(3, 'TAMIL');

-- --------------------------------------------------------

--
-- Table structure for table `MovieStatusInfo`
--

CREATE TABLE `MovieStatusInfo` (
  `MovieStatus_Id` int(11) NOT NULL,
  `MovieStatus_Value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MovieStatusInfo`
--

INSERT INTO `MovieStatusInfo` (`MovieStatus_Id`, `MovieStatus_Value`) VALUES
(1, 'RUNNING'),
(2, 'UPCOMMING'),
(3, 'CLOSED');

-- --------------------------------------------------------

--
-- Table structure for table `SheatType`
--

CREATE TABLE `SheatType` (
  `SheatType_Id` int(11) NOT NULL,
  `SheatType_Value` varchar(50) DEFAULT NULL,
  `SheatType_Cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SheatType`
--

INSERT INTO `SheatType` (`SheatType_Id`, `SheatType_Value`, `SheatType_Cost`) VALUES
(1, 'SILVER', 100),
(2, 'GOLD', 175),
(3, 'PLETINUM', 225);

-- --------------------------------------------------------

--
-- Table structure for table `ShowInfo`
--

CREATE TABLE `ShowInfo` (
  `Show_Id` int(11) NOT NULL,
  `Show_Date` datetime DEFAULT NULL,
  `Show_StartTime` varchar(100) DEFAULT NULL,
  `Movie_Name` varchar(100) DEFAULT NULL,
  `Hall_No` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ShowInfo`
--

INSERT INTO `ShowInfo` (`Show_Id`, `Show_Date`, `Show_StartTime`, `Movie_Name`, `Hall_No`) VALUES
(1, '2017-09-30 00:00:00', '06:00 PM', 'KAHAANI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `StateInfo`
--

CREATE TABLE `StateInfo` (
  `State_Id` int(11) NOT NULL,
  `State_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StateInfo`
--

INSERT INTO `StateInfo` (`State_Id`, `State_Name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jammu and Kashmir'),
(11, 'Jharkhand'),
(12, 'Karnataka'),
(13, 'Kerala'),
(14, 'Madhya Pradesh'),
(15, 'Maharashtra'),
(16, 'Manipur'),
(17, 'Meghalaya'),
(18, 'Mizoram'),
(19, 'Nagaland'),
(20, 'Orissa'),
(21, 'Punjab'),
(22, 'Rajastha'),
(23, 'Sikkim'),
(24, 'Tamil Nadu'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `TicketDetail`
--

CREATE TABLE `TicketDetail` (
  `Td_Id` int(11) NOT NULL,
  `Ticket_id` int(11) DEFAULT NULL,
  `Sheat_No` varchar(50) DEFAULT NULL,
  `Sheat_Cost` int(11) DEFAULT NULL,
  `Show_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TicketDetail`
--

INSERT INTO `TicketDetail` (`Td_Id`, `Ticket_id`, `Sheat_No`, `Sheat_Cost`, `Show_Id`) VALUES
(1, 4, 'A6', 100, 1),
(2, 5, 'A7', 100, 1),
(3, 6, 'E7', 175, 1),
(4, 7, 'B5', 100, 1),
(5, 8, 'E4', 175, 1),
(6, 9, 'I6', 225, 1),
(7, 10, 'I4', 225, 1),
(8, 11, 'H0', 225, 1),
(9, 12, 'I9', 225, 1),
(10, 13, 'G5', 225, 1),
(11, 14, 'B4', 100, 1),
(12, 15, 'E1', 175, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TicketInfo`
--

CREATE TABLE `TicketInfo` (
  `Ticket_Id` int(11) NOT NULL,
  `Ticket_No` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Show_Date` datetime DEFAULT NULL,
  `Show_Time` varchar(100) DEFAULT NULL,
  `Show_Id` int(11) DEFAULT NULL,
  `Ticket_Amount` int(11) DEFAULT NULL,
  `IsPaid` bit(1) DEFAULT NULL,
  `Sheats_Count` int(11) DEFAULT NULL,
  `Booking_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TicketInfo`
--

INSERT INTO `TicketInfo` (`Ticket_Id`, `Ticket_No`, `User_Id`, `Show_Date`, `Show_Time`, `Show_Id`, `Ticket_Amount`, `IsPaid`, `Sheats_Count`, `Booking_Date`) VALUES
(4, 4, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 100, b'0', 1, '2017-09-24 15:23:16'),
(5, 5, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 100, b'0', 1, '2017-09-24 15:25:00'),
(6, 6, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 175, b'0', 1, '2017-09-24 15:26:14'),
(7, 7, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 100, b'0', 1, '2017-09-24 15:42:38'),
(8, 8, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 175, b'0', 1, '2017-09-24 15:43:33'),
(9, 9, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 225, b'0', 1, '2017-09-24 15:43:46'),
(10, 10, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 225, b'0', 1, '2017-09-24 15:45:04'),
(11, 11, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 225, b'0', 1, '2017-09-24 15:45:18'),
(12, 12, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 225, b'0', 1, '2017-09-24 15:48:34'),
(13, 13, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 225, b'0', 1, '2017-09-24 15:53:38'),
(14, 14, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 100, b'0', 1, '2017-09-24 15:57:32'),
(15, 15, 13, '2017-09-30 00:00:00', '06:00 PM', 1, 175, b'0', 1, '2017-09-24 15:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `TimingInfo`
--

CREATE TABLE `TimingInfo` (
  `Time_Id` int(11) NOT NULL,
  `Time_StartTime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TimingInfo`
--

INSERT INTO `TimingInfo` (`Time_Id`, `Time_StartTime`) VALUES
(1, '11:00 AM'),
(2, '02:30 PM'),
(3, '06:00 PM'),
(4, '09:30 PM');

-- --------------------------------------------------------

--
-- Table structure for table `UserInfo`
--

CREATE TABLE `UserInfo` (
  `User_Id` int(11) NOT NULL,
  `User_LoginName` varchar(50) DEFAULT NULL,
  `User_LoginPassword` varchar(50) DEFAULT NULL,
  `User_Email` varchar(50) DEFAULT NULL,
  `User_MobileNo` varchar(50) DEFAULT NULL,
  `User_FName` varchar(50) DEFAULT NULL,
  `User_LName` varchar(50) DEFAULT NULL,
  `User_Add` varchar(100) DEFAULT NULL,
  `User_City` varchar(50) DEFAULT NULL,
  `User_State` varchar(50) DEFAULT NULL,
  `User_SQ` varchar(50) DEFAULT NULL,
  `User_SA` varchar(50) DEFAULT NULL,
  `User_Type` varchar(50) DEFAULT NULL,
  `User_IsActive` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserInfo`
--

INSERT INTO `UserInfo` (`User_Id`, `User_LoginName`, `User_LoginPassword`, `User_Email`, `User_MobileNo`, `User_FName`, `User_LName`, `User_Add`, `User_City`, `User_State`, `User_SQ`, `User_SA`, `User_Type`, `User_IsActive`) VALUES
(12, 'admin', 'admin', 'cinemaol.asct@gmail.com', '8109579945', 'MP ADMI', 'CHAUHA', 'INDRAPURI BHEL,', 'BHOPAL', 'MADHYA PRADESH', 'SQ', 'SA', 'ADMIN', b'1'),
(13, 'admin', 'admin', 'cinemaol.asct@gmail.com', '8802524849', 'MATA PRASADX', 'CHAUHANX', 'INDRAPURI,BHEL', 'BHOPAL1', 'MADHYA PRADESH', 'SQ', 'SA', 'USER', b'1'),
(14, 'mata', 'mata', 'mata', '1', 'mata', 'mata', 'm m', 'delhi', 'MADHYA PRADESH', 'mata', 'mata', 'USER', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `HallInfo`
--
ALTER TABLE `HallInfo`
  ADD PRIMARY KEY (`Hall_Id`);

--
-- Indexes for table `MovieIndustryInfo`
--
ALTER TABLE `MovieIndustryInfo`
  ADD PRIMARY KEY (`Industry_id`);

--
-- Indexes for table `MovieInfo`
--
ALTER TABLE `MovieInfo`
  ADD PRIMARY KEY (`Movie_Id`);

--
-- Indexes for table `MovieLanguageInfo`
--
ALTER TABLE `MovieLanguageInfo`
  ADD PRIMARY KEY (`Language_Id`);

--
-- Indexes for table `MovieStatusInfo`
--
ALTER TABLE `MovieStatusInfo`
  ADD PRIMARY KEY (`MovieStatus_Id`);

--
-- Indexes for table `SheatType`
--
ALTER TABLE `SheatType`
  ADD PRIMARY KEY (`SheatType_Id`);

--
-- Indexes for table `ShowInfo`
--
ALTER TABLE `ShowInfo`
  ADD PRIMARY KEY (`Show_Id`);

--
-- Indexes for table `StateInfo`
--
ALTER TABLE `StateInfo`
  ADD PRIMARY KEY (`State_Id`);

--
-- Indexes for table `TicketDetail`
--
ALTER TABLE `TicketDetail`
  ADD PRIMARY KEY (`Td_Id`);

--
-- Indexes for table `TicketInfo`
--
ALTER TABLE `TicketInfo`
  ADD PRIMARY KEY (`Ticket_Id`);

--
-- Indexes for table `TimingInfo`
--
ALTER TABLE `TimingInfo`
  ADD PRIMARY KEY (`Time_Id`);

--
-- Indexes for table `UserInfo`
--
ALTER TABLE `UserInfo`
  ADD PRIMARY KEY (`User_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `HallInfo`
--
ALTER TABLE `HallInfo`
  MODIFY `Hall_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `MovieIndustryInfo`
--
ALTER TABLE `MovieIndustryInfo`
  MODIFY `Industry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `MovieInfo`
--
ALTER TABLE `MovieInfo`
  MODIFY `Movie_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `MovieLanguageInfo`
--
ALTER TABLE `MovieLanguageInfo`
  MODIFY `Language_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `MovieStatusInfo`
--
ALTER TABLE `MovieStatusInfo`
  MODIFY `MovieStatus_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `SheatType`
--
ALTER TABLE `SheatType`
  MODIFY `SheatType_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ShowInfo`
--
ALTER TABLE `ShowInfo`
  MODIFY `Show_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `StateInfo`
--
ALTER TABLE `StateInfo`
  MODIFY `State_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `TicketDetail`
--
ALTER TABLE `TicketDetail`
  MODIFY `Td_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `TicketInfo`
--
ALTER TABLE `TicketInfo`
  MODIFY `Ticket_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `TimingInfo`
--
ALTER TABLE `TimingInfo`
  MODIFY `Time_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `UserInfo`
--
ALTER TABLE `UserInfo`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
