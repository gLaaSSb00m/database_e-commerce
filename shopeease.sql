-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 10:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopeease`
--

-- --------------------------------------------------------

--
-- Table structure for table `banglalink`
--

CREATE TABLE `banglalink` (
  `ID` int(11) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banglalink`
--

INSERT INTO `banglalink` (`ID`, `Email`, `Phone`, `City`) VALUES
(1, 'eaabid1014@gmail.com', '01957603697', 'Rangpur'),
(2, 'eaabid1016@gmail.com', '01957603697', 'Chattogram'),
(3, 'eaabid1011@gmail.com', '01957603697', 'Chattogram'),
(4, 'eaabid1012@gmail.com', '01957603697', 'Chattogram'),
(5, 'eaabid1013@gmail.com', '01957603697', 'Dhaka'),
(6, 'eaabid1018@gmail.com', '01957603697', 'Sylhet'),
(7, 'eaabid1019@gmail.com', '01957603697', 'Rajshahi');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL,
  `Customer_customerId` int(11) DEFAULT NULL,
  `GrandTotal` decimal(10,2) DEFAULT NULL,
  `ItemsTotal` int(11) DEFAULT NULL,
  `status` enum('Added To Cart','Confirmed') NOT NULL,
  `item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `Customer_customerId`, `GrandTotal`, `ItemsTotal`, `status`, `item_id`) VALUES
(88, 10, NULL, NULL, 'Confirmed', 1),
(89, 10, NULL, NULL, 'Confirmed', 1),
(90, 10, NULL, NULL, 'Confirmed', 2),
(91, 10, NULL, NULL, 'Confirmed', 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chattogram`
--

CREATE TABLE `chattogram` (
  `cartId` int(11) NOT NULL,
  `Customer_customerId` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `FirstName`, `LastName`, `Email`, `DateOfBirth`, `Phone`, `Age`, `city`, `Password`) VALUES
(5, 'AL HOSSAIN', 'ABID', 'eaabid1016@gmail.com', '2004-02-29', '01957603697', 20, 'Chattogram', '81dc9bdb52d04dc20036dbd8313ed055'),
(6, 'abid', 'hossain', 'eaabid1011@gmail.com', '2002-06-02', '01957603697', 22, 'Chattogram', '81dc9bdb52d04dc20036dbd8313ed055'),
(7, 'abid', 'hossain', 'eaabid1012@gmail.com', '2006-01-13', '01957603697', 18, 'Chattogram', '81dc9bdb52d04dc20036dbd8313ed055'),
(8, 'abid', 'hossain', 'eaabid1013@gmail.com', '2002-01-29', '01957603697', 22, 'Dhaka', '81dc9bdb52d04dc20036dbd8313ed055'),
(9, 'abid', 'hossain', 'eaabid1018@gmail.com', '2003-02-14', '01957603697', 21, 'Sylhet', '81dc9bdb52d04dc20036dbd8313ed055'),
(10, 'abid', 'hossain', 'eaabid1019@gmail.com', '2003-02-10', '01957603697', 21, 'Rajshahi', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `DateOfBirth`, `Phone`, `Age`, `City`) VALUES
(1, 'abid', 'hossain', 'eaabid1020@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2003-02-04', '01957603697', 21, 'Rajshahi'),
(2, 'abid', 'hossain', 'eaabid1021@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2001-01-04', '01957603697', 23, 'Rajshahi');

-- --------------------------------------------------------

--
-- Table structure for table `customer_chattogram`
--

CREATE TABLE `customer_chattogram` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_chattogram`
--

INSERT INTO `customer_chattogram` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `DateOfBirth`, `Phone`, `Age`, `City`) VALUES
(1, 'AL HOSSAIN', 'ABID', 'eaabid1013@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2005-02-15', '01957603697', 19, 'Chattogram'),
(2, 'AL HOSSAIN', 'ABID', 'eaabid1016@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2004-02-29', '01957603697', 20, 'Chattogram'),
(3, 'abid', 'hossain', 'eaabid1011@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2002-06-02', '01957603697', 22, 'Chattogram'),
(4, 'abid', 'hossain', 'eaabid1012@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2006-01-13', '01957603697', 18, 'Chattogram');

-- --------------------------------------------------------

--
-- Table structure for table `customer_dhaka`
--

CREATE TABLE `customer_dhaka` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_dhaka`
--

INSERT INTO `customer_dhaka` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `DateOfBirth`, `Phone`, `Age`, `City`) VALUES
(1, 'abid', 'hossain', 'eaabid1013@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2002-01-29', '01957603697', 22, 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `customer_rajshahi`
--

CREATE TABLE `customer_rajshahi` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_rajshahi`
--

INSERT INTO `customer_rajshahi` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `DateOfBirth`, `Phone`, `Age`, `City`) VALUES
(1, 'abid', 'hossain', 'eaabid1019@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2003-02-10', '01957603697', 21, 'Rajshahi');

-- --------------------------------------------------------

--
-- Table structure for table `customer_rangpur`
--

CREATE TABLE `customer_rangpur` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_rangpur`
--

INSERT INTO `customer_rangpur` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `DateOfBirth`, `Phone`, `Age`, `City`) VALUES
(1, 'AL HOSSAIN', 'ABID', 'eaabid1014@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2001-01-30', '01957603697', 23, 'Rangpur');

-- --------------------------------------------------------

--
-- Table structure for table `customer_sylhet`
--

CREATE TABLE `customer_sylhet` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_sylhet`
--

INSERT INTO `customer_sylhet` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `DateOfBirth`, `Phone`, `Age`, `City`) VALUES
(1, 'abid', 'hossain', 'eaabid1018@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2003-02-14', '01957603697', 21, 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `dhaka`
--

CREATE TABLE `dhaka` (
  `cartId` int(11) NOT NULL,
  `Customer_customerId` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dhaka`
--

INSERT INTO `dhaka` (`cartId`, `Customer_customerId`, `status`, `item_id`, `user_name`, `user_phone`, `city`, `email`) VALUES
(1, 8, 'Confirmed', 1, 'abid hossain', '01957603697', 'Dhaka', 'eaabid1013@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `eaabid1012_gmail_com`
--

CREATE TABLE `eaabid1012_gmail_com` (
  `cartId` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eaabid1012_gmail_com`
--

INSERT INTO `eaabid1012_gmail_com` (`cartId`, `status`, `item_id`, `user_name`, `user_phone`, `city`, `email`) VALUES
(7, 'Added to cart', 8, 'abid hossain', '01957603697', 'Chattogram', 'eaabid1012@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `eaabid1013_gmail_com`
--

CREATE TABLE `eaabid1013_gmail_com` (
  `cartId` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eaabid1013_gmail_com`
--

INSERT INTO `eaabid1013_gmail_com` (`cartId`, `status`, `item_id`, `user_name`, `user_phone`, `city`, `email`) VALUES
(1, 'Added to cart', 1, 'abid hossain', '01957603697', 'Dhaka', 'eaabid1013@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL,
  `ShippingDate` date DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderAmount` decimal(10,2) DEFAULT NULL,
  `Cart_CartID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `Order_OrderId` int(11) NOT NULL,
  `Product_ProductId` int(11) NOT NULL,
  `MRP` decimal(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `Order_OrderId` int(11) DEFAULT NULL,
  `PaymentMode` varchar(50) DEFAULT NULL,
  `Customer_CustomerId` int(11) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `MRP` decimal(10,2) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `ProductName`, `sellerId`, `MRP`, `CategoryID`, `Stock`, `Brand`) VALUES
(1, 'Guess 1875', NULL, 3000.00, NULL, NULL, NULL),
(2, 'Guest Watch', NULL, 2500.00, NULL, NULL, NULL),
(3, 'Panerai Watch', NULL, 3500.00, NULL, NULL, NULL),
(4, 'Nonos Watch', NULL, 1800.00, NULL, NULL, NULL),
(5, 'Levis', NULL, 1800.00, NULL, NULL, NULL),
(6, 'louis philippe t-shirt', NULL, 2500.00, NULL, NULL, NULL),
(7, 'Highlander t-shirt', NULL, 500.00, NULL, NULL, NULL),
(8, 'GUCCI White t-Shirt', NULL, 2300.00, NULL, NULL, NULL),
(9, 'Nike White Sneaker', NULL, 8000.00, NULL, NULL, NULL),
(10, 'Nike White Shoes', NULL, 7500.00, NULL, NULL, NULL),
(11, 'Nike Yellow Sneaker', NULL, 7000.00, NULL, NULL, NULL),
(12, 'Nike Brown Sneaker', NULL, 6000.00, NULL, NULL, NULL),
(13, 'Beats Headphone', NULL, 22500.00, NULL, NULL, NULL),
(14, 'Zolo Headphone', NULL, 4500.00, NULL, NULL, NULL),
(15, 'Sony Speaker', NULL, 10500.00, NULL, NULL, NULL),
(16, 'Airpods', NULL, 15000.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rajshahi`
--

CREATE TABLE `rajshahi` (
  `cartId` int(11) NOT NULL,
  `Customer_customerId` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rajshahi`
--

INSERT INTO `rajshahi` (`cartId`, `Customer_customerId`, `status`, `item_id`, `user_name`, `user_phone`, `city`, `email`) VALUES
(1, 10, 'Confirmed', 1, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(2, 10, 'Confirmed', 2, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(3, 10, 'Confirmed', 3, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(4, 10, 'Confirmed', 4, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(5, 10, 'Confirmed', 1, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(6, 10, 'Confirmed', 2, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(7, 10, 'Confirmed', 3, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(8, 10, 'Confirmed', 4, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(9, 10, 'Confirmed', 1, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(10, 10, 'Confirmed', 1, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(11, 10, 'Confirmed', 2, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(12, 10, 'Confirmed', 3, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com'),
(13, 10, 'Confirmed', 4, 'abid hossain', '01957603697', 'Rajshahi', 'eaabid1019@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewId` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `Ratings` int(11) DEFAULT NULL CHECK (`Ratings` between 1 and 5),
  `Product_ProductId` int(11) DEFAULT NULL,
  `Customer_CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `sellerId` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Total_Sales` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sylhet`
--

CREATE TABLE `sylhet` (
  `cartId` int(11) NOT NULL,
  `Customer_customerId` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sylhet`
--

INSERT INTO `sylhet` (`cartId`, `Customer_customerId`, `status`, `item_id`, `user_name`, `user_phone`, `city`, `email`) VALUES
(1, 9, 'Added to cart', 1, 'abid hossain', '01957603697', 'Sylhet', 'eaabid1018@gmail.com'),
(2, 9, 'Added to cart', 1, 'abid hossain', '01957603697', 'Sylhet', 'eaabid1018@gmail.com'),
(3, 9, 'Added to cart', 2, 'abid hossain', '01957603697', 'Sylhet', 'eaabid1018@gmail.com'),
(4, 9, 'Added to cart', 3, 'abid hossain', '01957603697', 'Sylhet', 'eaabid1018@gmail.com'),
(5, 9, 'Added to cart', 4, 'abid hossain', '01957603697', 'Sylhet', 'eaabid1018@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banglalink`
--
ALTER TABLE `banglalink`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `Customer_customerId` (`Customer_customerId`),
  ADD KEY `product_id` (`item_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `chattogram`
--
ALTER TABLE `chattogram`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `customer_chattogram`
--
ALTER TABLE `customer_chattogram`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `customer_dhaka`
--
ALTER TABLE `customer_dhaka`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `customer_rajshahi`
--
ALTER TABLE `customer_rajshahi`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `customer_rangpur`
--
ALTER TABLE `customer_rangpur`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `customer_sylhet`
--
ALTER TABLE `customer_sylhet`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `dhaka`
--
ALTER TABLE `dhaka`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `eaabid1012_gmail_com`
--
ALTER TABLE `eaabid1012_gmail_com`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `eaabid1013_gmail_com`
--
ALTER TABLE `eaabid1013_gmail_com`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `Cart_CartID` (`Cart_CartID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`Order_OrderId`,`Product_ProductId`),
  ADD KEY `Product_ProductId` (`Product_ProductId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `Order_OrderId` (`Order_OrderId`),
  ADD KEY `Customer_CustomerId` (`Customer_CustomerId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `sellerId` (`sellerId`);

--
-- Indexes for table `rajshahi`
--
ALTER TABLE `rajshahi`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewId`),
  ADD KEY `Product_ProductId` (`Product_ProductId`),
  ADD KEY `Customer_CustomerID` (`Customer_CustomerID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`sellerId`);

--
-- Indexes for table `sylhet`
--
ALTER TABLE `sylhet`
  ADD PRIMARY KEY (`cartId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banglalink`
--
ALTER TABLE `banglalink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chattogram`
--
ALTER TABLE `chattogram`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_chattogram`
--
ALTER TABLE `customer_chattogram`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_dhaka`
--
ALTER TABLE `customer_dhaka`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_rajshahi`
--
ALTER TABLE `customer_rajshahi`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_rangpur`
--
ALTER TABLE `customer_rangpur`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_sylhet`
--
ALTER TABLE `customer_sylhet`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dhaka`
--
ALTER TABLE `dhaka`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eaabid1012_gmail_com`
--
ALTER TABLE `eaabid1012_gmail_com`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `eaabid1013_gmail_com`
--
ALTER TABLE `eaabid1013_gmail_com`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rajshahi`
--
ALTER TABLE `rajshahi`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `sellerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sylhet`
--
ALTER TABLE `sylhet`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Customer_customerId`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_products_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `product` (`productId`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Cart_CartID`) REFERENCES `cart` (`cartId`) ON DELETE CASCADE;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`Order_OrderId`) REFERENCES `order` (`OrderId`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`productId`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_OrderId`) REFERENCES `order` (`OrderId`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Customer_CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Product_ProductId`) REFERENCES `product` (`productId`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
