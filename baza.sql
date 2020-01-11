

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(260) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `mobp` int(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `postcode` int(11) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `email`, `password`, `fname`, `lname`, `bday`, `mobp`, `address1`, `city`, `state`, `postcode`, `role`) VALUES
(28, 'employee1', 'employee1@hotmail.com', '5b2f8e27e2e5b4081c03ce70b288c87bd1263140cbd1bd9ae078123509b7caff', 'Employee1', 'Employee', '1987-09-08', 61782345, 'Hrasnicka cesta bb', 'Sarajevo', 'BIH', 71000, 2),
(29, 'employee2', 'employee2@hotmail.com', '5b2f8e27e2e5b4081c03ce70b288c87bd1263140cbd1bd9ae078123509b7caff', 'Employee', 'Employee', '1990-03-06', 61892345, 'Hrasnicka cesta 2', 'Sarajevo', 'BIH', 71000, 2),
(30, 'employee3', 'employee3@hotmail.com', '5b2f8e27e2e5b4081c03ce70b288c87bd1263140cbd1bd9ae078123509b7caff', 'Employee', 'Employee', '1976-12-18', 62345678, 'Hrasnicka cesta 3', 'Sarajevo', 'BIH', 71000, 2),
(31, 'admin', 'admin@hotmail.com', 'd82494f05d6917ba02f7aaa29689ccb444bb73f20380876cb05d1f37537b7892', 'Admin', 'Admin', '1998-01-24', 61543908, 'Hrasnicka cesta bb', 'Sarajevo', 'BIH', 71000, 1),
(32, 'ajla123', 'ajlah23@hotmail.com', '59c60a0a355c738ddfc4dab37e8cbca5b0b900be956e95a56775f073fac43703', 'Ajla', 'Hajdarevic', '1998-05-23', 61239764, 'Radnicka 18', 'Sarajevo', 'BIH', 71000, 0),
(33, 'azemina', 'azemina@hotmail.com', 'dcdf8fcf26b3ef2c280cf15ce7f8d21ccbebd09ca569bb3ccb1c2f8a5f90d7eb', 'Azemina', 'Celebic', '1998-12-22', 61783654, 'Grbavicka 8', 'Sarajevo', 'BIH', 71000, 0),
(34, 'andrew', 'andrew@hotmail.com', 'b115ffaa989d46cbe5a79a37f0ad698a66fc13445043b105a1f4156062701569', 'Andrew', 'Cooney', '1996-08-05', 62598255, 'Hrasnicka cesta bb', 'Sarajevo', 'BIH', 71000, 0),
(35, 'hana', 'hana@hotmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Hana', 'Gicevic', '1998-01-01', 61111111, 'Hrasnicka cesta', 'Sarajevo', 'BIH', 71000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_duration` time NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `employee`, `client`, `date`, `start_time`, `end_time`, `total_duration`, `total_price`) VALUES
(25, 1, 33, '2018-01-08', '16:00:00', '17:50:00', '01:50:00', 163),
(26, 3, 34, '2018-01-09', '11:00:00', '11:50:00', '00:50:00', 116),
(29, 3, 28, '2018-01-11', '13:00:00', '14:20:00', '01:20:00', 151),
(31, 3, 32, '2018-01-18', '14:00:00', '15:00:00', '01:00:00', 63),
(33, 2, 32, '2018-01-31', '12:00:00', '13:20:00', '01:20:00', 60),
(35, 3, 32, '2018-01-25', '13:00:00', '13:30:00', '00:30:00', 5),
(36, 2, 32, '2018-01-31', '12:30:00', '13:00:00', '00:30:00', 50),
(38, 2, 32, '2018-01-23', '13:00:00', '13:40:00', '00:40:00', 20),
(39, 2, 32, '2018-01-10', '12:00:00', '13:50:00', '01:50:00', 251);

--
-- Triggers `appointments`
--
DELIMITER $$
CREATE TRIGGER `appcheck` BEFORE INSERT ON `appointments` FOR EACH ROW begin
  IF(EXISTS(SELECT * FROM appointments a where a.date = NEW.date 
  	AND
  	a.employee = NEW.employee
  	AND
  	((a.start_time BETWEEN new.start_time AND new.end_time) OR (a.end_time BETWEEN NEW.start_time AND NEW.end_time)))) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start or End date field is not valid';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `ascurrentmonth`
-- (See below for the actual view)
--
CREATE TABLE `ascurrentmonth` (
`avgsales` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `aslastmonth`
-- (See below for the actual view)
--
CREATE TABLE `aslastmonth` (
`avg(a.total_price)` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `aslastyear`
-- (See below for the actual view)
--
CREATE TABLE `aslastyear` (
`avg(a.total_price)` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `choosen_services`
--

CREATE TABLE `choosen_services` (
  `id` int(11) NOT NULL,
  `appointment` int(11) NOT NULL,
  `service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `choosen_services`
--

INSERT INTO `choosen_services` (`id`, `appointment`, `service`) VALUES
(35, 25, 9),
(36, 25, 1),
(37, 25, 13),
(38, 26, 2),
(39, 26, 14),
(43, 29, 9),
(44, 29, 14),
(55, 31, 13),
(61, 33, 2),
(62, 33, 15),
(69, 36, 1),
(73, 38, 10),
(74, 39, 8),
(75, 39, 1),
(76, 39, 14),
(77, 39, 13);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `bday` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `start_date` varchar(20) DEFAULT NULL COMMENT 'Date of contract start',
  `end_date` varchar(20) DEFAULT NULL COMMENT 'Date of contract termination',
  `biography` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `fname`, `lname`, `username`, `bday`, `email`, `address`, `start_date`, `end_date`, `biography`) VALUES
(1, 'Yvonne', 'Benson', 'employee1', '1984-03-01', 'YB@gmail.com', '9396 Holly Street', '2016-12-06', '2017-11-15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum orci sed interdum egestas. Suspendisse lobortis odio vitae purus tincidunt, vel tempor lacus vestibulum. Ut eu lacus dui. Quisque faucibus nisl ac dui rutrum accumsan. Fusce ultrices massa vel sem tincidunt ultricies. Nunc rutrum tristique tincidunt. Fusce ullamcorper urna vel ante elementum placerat. Cras sed tortor at neque suscipit placerat vel quis leo. Cras dapibus commodo nunc ac accumsan. Morbi eget nunc semper, feugiat tortor vitae, vehicula velit. Maecenas scelerisque sollicitudin massa at rhoncus. Vivamus eleifend lectus dolor, vitae pulvinar lorem tincidunt ut. Nullam semper lectus in libero sagittis tincidunt. Donec egestas ipsum in mauris iaculis efficitur. Donec aliquam congue mi, consequat placerat sem placerat ut. Vivamus eu lacus vel risus dignissim efficitur et quis nisi. Cras sollicitudin imperdiet accumsan. Mauris molestie iaculis purus, eu sagittis ex condimentum in. Duis eleifend congue urna, sit amet imperdiet odio hendrerit vulputate.'),
(2, 'Shelia', 'Meyer', 'employee2', '1987-07-03', 'SM@gmail.com', '903 Talbot Lane', '2017-01-17', '2018-01-10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum orci sed interdum egestas. Suspendisse lobortis odio vitae purus tincidunt, vel tempor lacus vestibulum. Ut eu lacus dui. Quisque faucibus nisl ac dui rutrum accumsan. Fusce ultrices massa vel sem tincidunt ultricies. Nunc rutrum tristique tincidunt. Fusce ullamcorper urna vel ante elementum placerat. Cras sed tortor at neque suscipit placerat vel quis leo. Cras dapibus commodo nunc ac accumsan. Morbi eget nunc semper, feugiat tortor vitae, vehicula velit. Maecenas scelerisque sollicitudin massa at rhoncus. Vivamus eleifend lectus dolor, vitae pulvinar lorem tincidunt ut. Nullam semper lectus in libero sagittis tincidunt. Donec egestas ipsum in mauris iaculis efficitur. Donec aliquam congue mi, consequat placerat sem placerat ut. Vivamus eu lacus vel risus dignissim efficitur et quis nisi. Cras sollicitudin imperdiet accumsan. Mauris molestie iaculis purus, eu sagittis ex condimentum in. Duis eleifend congue urna, sit amet imperdiet odio hendrerit vulputate.'),
(3, 'Doris', 'Hicks', 'employee3', '1988-06-21', 'DH@gmail.com', '8944 Santa Clara Drive', '2017-02-03', '2018-01-31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum orci sed interdum egestas. Suspendisse lobortis odio vitae purus tincidunt, vel tempor lacus vestibulum. Ut eu lacus dui. Quisque faucibus nisl ac dui rutrum accumsan. Fusce ultrices massa vel sem tincidunt ultricies. Nunc rutrum tristique tincidunt. Fusce ullamcorper urna vel ante elementum placerat. Cras sed tortor at neque suscipit placerat vel quis leo. Cras dapibus commodo nunc ac accumsan. Morbi eget nunc semper, feugiat tortor vitae, vehicula velit. Maecenas scelerisque sollicitudin massa at rhoncus. Vivamus eleifend lectus dolor, vitae pulvinar lorem tincidunt ut. Nullam semper lectus in libero sagittis tincidunt. Donec egestas ipsum in mauris iaculis efficitur. Donec aliquam congue mi, consequat placerat sem placerat ut. Vivamus eu lacus vel risus dignissim efficitur et quis nisi. Cras sollicitudin imperdiet accumsan. Mauris molestie iaculis purus, eu sagittis ex condimentum in. Duis eleifend congue urna, sit amet imperdiet odio hendrerit vulputate.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `mostexpensiveapp`
-- (See below for the actual view)
--
CREATE TABLE `mostexpensiveapp` (
`id` int(11)
,`fname` varchar(100)
,`lname` varchar(100)
,`date` date
,`max(a.total_price)` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `category`, `service_name`, `price`, `duration`) VALUES
(1, 0, 'Women\'s Haircut', 50, 30),
(2, 0, 'Man\'s Haircut', 20, 20),
(4, 1, 'New -growth Retouch', 85, 40),
(5, 1, 'Single Process Application', 95, 50),
(6, 1, 'Sun -Kissed Highlights', 45, 40),
(7, 1, 'Partial Highlight', 85, 40),
(8, 1, 'Full Highlight ', 105, 50),
(9, 1, 'Glazing to seal, tone and enhance color', 55, 50),
(10, 1, 'New -growtd Retouch witd Highlights', 20, 40),
(12, 1, 'Glaze added to a color service', 10, 30),
(13, 2, 'Magnolia Blowout', 55, 30),
(14, 2, 'Formal Styling', 96, 30),
(15, 2, 'Formal Blowout', 35, 30),
(16, 0, 'Child\'s Haircut', 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `service_category`
--

CREATE TABLE `service_category` (
  `id` int(11) NOT NULL,
  `category` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_category`
--

INSERT INTO `service_category` (`id`, `category`) VALUES
(0, 'Cutting'),
(1, 'Coloring'),
(2, 'Foundation');

-- --------------------------------------------------------

--
-- Stand-in structure for view `statistics_of_emplys_app`
-- (See below for the actual view)
--
CREATE TABLE `statistics_of_emplys_app` (
`fname` varchar(100)
,`lname` varchar(100)
,`count(a.employee)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `top3services`
-- (See below for the actual view)
--
CREATE TABLE `top3services` (
`service_name` varchar(50)
,`count(cs.service)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `top5customers`
-- (See below for the actual view)
--
CREATE TABLE `top5customers` (
`fname` varchar(100)
,`lname` varchar(100)
,`COUNT(a.CLIENT)` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `ascurrentmonth`
--
DROP TABLE IF EXISTS `ascurrentmonth`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ascurrentmonth`  AS  (select avg(`appointments`.`total_price`) AS `avgsales` from `appointments` where ((year(`appointments`.`date`) = year(curdate())) and (month(`appointments`.`date`) = month(curdate())))) ;

-- --------------------------------------------------------

--
-- Structure for view `aslastmonth`
--
DROP TABLE IF EXISTS `aslastmonth`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aslastmonth`  AS  (select avg(`a`.`total_price`) AS `avg(a.total_price)` from `appointments` `a` where ((date_format(sysdate(),'%Y-%m-01') - interval 1 month) = date_format(`a`.`date`,'%Y-%m-01'))) ;

-- --------------------------------------------------------

--
-- Structure for view `aslastyear`
--
DROP TABLE IF EXISTS `aslastyear`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aslastyear`  AS  (select avg(`a`.`total_price`) AS `avg(a.total_price)` from `appointments` `a` where (year(`a`.`date`) = (year(curdate()) - 1))) ;

-- --------------------------------------------------------

--
-- Structure for view `mostexpensiveapp`
--
DROP TABLE IF EXISTS `mostexpensiveapp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mostexpensiveapp`  AS  (select `ac`.`id` AS `id`,`ac`.`fname` AS `fname`,`ac`.`lname` AS `lname`,`a`.`date` AS `date`,max(`a`.`total_price`) AS `max(a.total_price)` from (`appointments` `a` join `accounts` `ac`) where (`a`.`client` = `ac`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `statistics_of_emplys_app`
--
DROP TABLE IF EXISTS `statistics_of_emplys_app`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statistics_of_emplys_app`  AS  (select `e`.`fname` AS `fname`,`e`.`lname` AS `lname`,count(`a`.`employee`) AS `count(a.employee)` from (`appointments` `a` join `employees` `e`) where ((`a`.`employee` = `e`.`id`) and ((date_format(sysdate(),'%Y-%m-01') - interval 1 month) = date_format(`a`.`date`,'%Y-%m-01'))) group by `e`.`fname`,`e`.`lname` order by count(`a`.`employee`) desc) ;

-- --------------------------------------------------------

--
-- Structure for view `top3services`
--
DROP TABLE IF EXISTS `top3services`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top3services`  AS  (select `s`.`service_name` AS `service_name`,count(`cs`.`service`) AS `count(cs.service)` from ((`choosen_services` `cs` join `services` `s`) join `appointments` `a`) where ((`cs`.`service` = `s`.`id`) and (`cs`.`appointment` = `a`.`id`) and (year(`a`.`date`) = year(curdate())) and (month(`a`.`date`) = month(curdate()))) group by `s`.`service_name` order by count(`cs`.`service`) desc limit 3) ;

-- --------------------------------------------------------

--
-- Structure for view `top5customers`
--
DROP TABLE IF EXISTS `top5customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top5customers`  AS  (select `ac`.`fname` AS `fname`,`ac`.`lname` AS `lname`,count(`a`.`client`) AS `COUNT(a.CLIENT)` from (`appointments` `a` join `accounts` `ac`) where (`a`.`client` = `ac`.`id`) group by `ac`.`fname`,`ac`.`lname` order by count(`a`.`client`) desc limit 5) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_E` (`employee`),
  ADD KEY `ID_C` (`client`);

--
-- Indexes for table `choosen_services`
--
ALTER TABLE `choosen_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Service` (`service`) USING BTREE,
  ADD KEY `Appointment` (`appointment`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `E_ID_UNIQUE` (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `choosen_services`
--
ALTER TABLE `choosen_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`client`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `choosen_services`
--
ALTER TABLE `choosen_services`
  ADD CONSTRAINT `choosen_services_ibfk_1` FOREIGN KEY (`service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choosen_services_ibfk_2` FOREIGN KEY (`appointment`) REFERENCES `appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choosen_services_ibfk_3` FOREIGN KEY (`service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choosen_services_ibfk_4` FOREIGN KEY (`appointment`) REFERENCES `appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category`) REFERENCES `service_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
