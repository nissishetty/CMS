-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2021 at 01:15 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `claim`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('project', 'ROLE_USER'),
('Thor', 'ROLE_USER'),
('user', 'ROLE_USER'),
('user2', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE IF NOT EXISTS `claims` (
`claim_id` bigint(20) NOT NULL,
  `amount_claimed` bigint(20) DEFAULT NULL,
  `benefits_availed` varchar(255) DEFAULT NULL,
  `claim_status` varchar(255) DEFAULT NULL,
  `hospital_detail` varchar(255) DEFAULT NULL,
  `policy_details` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `settled_amt` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claimstatus`
--

CREATE TABLE IF NOT EXISTS `claimstatus` (
`claimstatus_id` bigint(20) NOT NULL,
  `claim_id` varchar(255) DEFAULT NULL,
  `claim_status` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `policy_id` varchar(255) DEFAULT NULL,
  `status_des` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
`member_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `policy_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members_login`
--

CREATE TABLE IF NOT EXISTS `members_login` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members_login`
--

INSERT INTO `members_login` (`id`, `password`, `role`, `username`) VALUES
(1, '$2y$12$1KN6PcXPesbCvxxh/.Ffu.RWl7QEAUGeeUFAlm5BsUINwfn7qZD4W', 'USER', 'nissi');

-- --------------------------------------------------------

--
-- Table structure for table `member_policy`
--

CREATE TABLE IF NOT EXISTS `member_policy` (
`member_policy_id` bigint(20) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `last_payment_info` varchar(255) DEFAULT NULL,
  `last_premium_date` datetime DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `policy_id` varchar(255) DEFAULT NULL,
  `premium_amt_due` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_policy`
--

INSERT INTO `member_policy` (`member_policy_id`, `due_date`, `last_payment_info`, `last_premium_date`, `member_id`, `policy_id`, `premium_amt_due`) VALUES
(1, '2021-04-08 00:00:00', 'Paid', '2021-04-01 00:00:00', 'CUS001', 'PID001', 5000),
(2, '2021-04-30 00:00:00', 'Not Paid', '2021-03-24 00:00:00', 'CUS001', 'PID001', 5000),
(3, '2021-04-24 00:00:00', 'Paid', '2021-02-09 00:00:00', 'CUS002', 'PID002', 3000),
(4, '2021-04-24 00:00:00', 'Not Paid', '2021-03-24 00:00:00', 'CUS003', 'PID003', 8000),
(5, '2021-05-22 00:00:00', 'Paid', '2021-04-22 00:00:00', 'CUS004', 'PID004', 6000),
(6, '2021-05-15 00:00:00', 'Paid', '2021-04-15 00:00:00', 'CUS005', 'PID005', 4000);

-- --------------------------------------------------------

--
-- Table structure for table `member_submit_claim`
--

CREATE TABLE IF NOT EXISTS `member_submit_claim` (
`claims_id` bigint(20) NOT NULL,
  `hospital_id` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `policy_id` varchar(255) DEFAULT NULL,
  `total_bill` bigint(20) DEFAULT NULL,
  `total_claimed_amt` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_submit_claim`
--

INSERT INTO `member_submit_claim` (`claims_id`, `hospital_id`, `member_id`, `policy_id`, `total_bill`, `total_claimed_amt`) VALUES
(2, 'HID002', 'CUS001', 'PID001', 20000, 15000),
(3, 'HID002', 'CUS005', 'PID003', 5000, 2000),
(4, 'HID007', 'CUS005', 'PID004', 20000, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `provider_policy`
--

CREATE TABLE IF NOT EXISTS `provider_policy` (
`provider_id` bigint(20) NOT NULL,
  `benefits` varchar(255) DEFAULT NULL,
  `claim_amt` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `policy_id` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `premium_amt` bigint(20) DEFAULT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `tenure` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_policy`
--

INSERT INTO `provider_policy` (`provider_id`, `benefits`, `claim_amt`, `location`, `policy_id`, `policy_name`, `premium_amt`, `provider_name`, `tenure`) VALUES
(1, 'Full coverage', 10000, 'bangalore', 'PID001', 'Jeevan Life', 5000, 'HDFC', 5),
(2, 'Partial Coverage', 2000, 'mysore', 'PID002', 'Be secure', 3000, 'Star Health', 4),
(3, 'full Coverage', 50000, 'Pune', 'PID003', 'Life Changer', 8000, 'Bajaj Allianz', 8),
(4, 'Full Cover', 80000, 'Chennai', 'PID004', 'Jeevan Suraksha', 6000, 'LIC', 10),
(5, 'Accident Cover', 60000, 'Delhi', 'PID005', 'No Risk', 4000, 'Exide Life', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `password`, `username`) VALUES
('1', 'nissi', 'dolly');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('project', 'cms123', 1),
('Thor', 'thor123', 1),
('user', 'pass', 1),
('user2', 'passw', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
 ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
 ADD PRIMARY KEY (`claim_id`);

--
-- Indexes for table `claimstatus`
--
ALTER TABLE `claimstatus`
 ADD PRIMARY KEY (`claimstatus_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
 ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `members_login`
--
ALTER TABLE `members_login`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_policy`
--
ALTER TABLE `member_policy`
 ADD PRIMARY KEY (`member_policy_id`);

--
-- Indexes for table `member_submit_claim`
--
ALTER TABLE `member_submit_claim`
 ADD PRIMARY KEY (`claims_id`);

--
-- Indexes for table `provider_policy`
--
ALTER TABLE `provider_policy`
 ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
MODIFY `claim_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `claimstatus`
--
ALTER TABLE `claimstatus`
MODIFY `claimstatus_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
MODIFY `member_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_policy`
--
ALTER TABLE `member_policy`
MODIFY `member_policy_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `member_submit_claim`
--
ALTER TABLE `member_submit_claim`
MODIFY `claims_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `provider_policy`
--
ALTER TABLE `provider_policy`
MODIFY `provider_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
