-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 30, 2015 at 01:39 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nowstartjava`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Core Java'),
(2, 'Spring Framework'),
(3, 'Hadoop'),
(4, 'Javascript'),
(5, 'Hibernate'),
(6, 'Servlets and JSP'),
(7, 'Java Interview Questions'),
(8, 'Struts 2'),
(9, 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(28);

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE IF NOT EXISTS `tutorials` (
  `id` int(11) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `numberOfViewers` int(11) NOT NULL,
  `displayOrder` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr9h12yxnjfl4ycxmgngsjerem` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `dateCreated`, `description`, `image`, `title`, `categoryId`, `numberOfViewers`, `displayOrder`, `isActive`, `slug`) VALUES
(1, '2015-12-21 22:46:19', 'This course provides an introduction to Java Servlet technology. You will learn how to develop Java web applications using Servlets. you will also understand the life cycle of Servlets, how they work and how to configure them.', 'image.jpg', 'Hello wrold in Java', 1, 1, 1, b'1', 'Hello-world-in-java'),
(2, '2015-12-21 22:46:19', 'This course provides an introduction to Java Servlet technology. You will learn how to develop Java web applications using Servlets. you will also understand the life cycle of Servlets, how they work and how to configure them.', 'image.jpg', 'Hello wrold in Java1', 1, 1, 1, b'0', 'Hello-world-in-java1'),
(3, '2015-12-21 22:46:19', 'This course provides an introduction to Java Servlet technology. You will learn how to develop Java web applications using Servlets. you will also understand the life cycle of Servlets, how they work and how to configure them.', 'image.jpg', 'Hello wrold in Java', 1, 1, 1, b'0', 'Hello-world-in-java2'),
(5, '2015-12-21 23:36:35', 'This course introduces you the APIs, implement it using Jersey and run it on Tomcat.', 'image.jpg', 'Developing REST APIs with JAX-RS', 1, 1, 1, b'0', 'Developing-REST-APIs-with-JAX-RS2'),
(6, '2015-12-22 00:07:22', 'This course introduces you the APIs, implement it using Jersey and run it on Tomcat.', 'image.jpg', 'Learning Spring Core', 2, 1, 1, b'0', 'Developing-REST-APIs-with-JAX-RS'),
(7, '2015-12-22 00:08:22', 'This course introduces you the APIs, implement it using Jersey and run it on Tomcat.', 'image.jpg', 'Learning Spring Core', 2, 1, 1, b'0', 'Developing-REST-APIs-with-JAX-RS1'),
(8, '2015-12-22 12:42:01', 'This course introduces you the APIs, implement it using  --Not Its Javascript', 'image.jpg', 'JavaScript Fundamentals', 4, 1, 1, b'0', 'sudarshan'),
(9, '2015-12-22 14:02:37', 'This course introduces you the APIs, implement it using  --Not Its Javascript', 'image.jpg', 'JavaScript Fundamentals', 4, 1, 1, b'0', 'test-now'),
(10, '2015-12-22 14:03:38', 'This course provides an introduction to Java Servlet technology. You will learn how to develop Java web applications using Servlets. you will also understand the life cycle of Servlets, how they work and how to configure them.', 'image.jpg', 'JavaScript Fundamentals Angular', 4, 1, 1, b'0', 'JavaScript-Fundamentals-Angular'),
(11, '2015-12-22 14:50:22', 'This course introduces you the APIs, implement it using  -- NotThis course provides an introduction to Java Servlet technology. You will learn how to develop Java web applications using Servlets. you will also understand the life cycle of Servlets, how they work and how to configure them. Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript  This course provides an introduction to Java Servlet technology. You will learn how to develop Java web applications using Servlets. you will also understand the life cycle of Servlets, how they work and how to configure them.', 'image.jpg', 'Angular JavaScript Fundamentals Angular2 ', 5, 1, 1, b'0', 'Angular-JavaScript-Fundamentals-Angular2-'),
(13, '2015-12-23 15:02:01', 'The basic building block for user interface is a View object which is created from the View class and occupies a rectangular area on the screen and is responsible for drawing and event handling. View is the base class for widgets, which are used to create interactive UI components like buttons, text fields, etc.', 'image.jpg', 'Android User Interface ', 9, 1, 1, b'0', 'Android-User-Interface-1'),
(24, '2015-12-24 13:05:33', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 'image.jpg', 'RESTful URI types', 2, 1, 1, b'0', 'RESTful-URI-types0'),
(25, '2015-12-24 13:06:34', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 'image.jpg', 'Inversion Of Control (IOC) and Dependency Injection', 2, 1, 1, b'0', 'Inversion-Of-Control-(IOC)-and-Dependency-Injection0'),
(26, '2015-12-24 13:14:30', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 'image.jpg', 'Hello wrold in struts', 8, 1, 1, b'0', 'Hello-wrold-in-struts205');

-- --------------------------------------------------------

--
-- Table structure for table `tutorialscontent`
--

CREATE TABLE IF NOT EXISTS `tutorialscontent` (
  `id` int(11) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `description` longtext,
  `displayOrder` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `numberOfViewers` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tutorials` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKawm35f6xxem83v9wq1tljfgql` (`tutorials`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutorialscontent`
--

INSERT INTO `tutorialscontent` (`id`, `dateCreated`, `description`, `displayOrder`, `image`, `isActive`, `numberOfViewers`, `slug`, `title`, `tutorials`) VALUES
(14, '2015-12-08 00:00:00', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, '', 'What is spring framework ', 2),
(15, '2015-12-10 00:00:00', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, '', 'Spring Modules', 2),
(18, '2015-12-18 00:00:00', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, '', 'Spring Modules67', 2),
(21, '2015-12-02 00:00:00', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, '', 'Where JavaScript', 8),
(22, '2015-12-30 00:00:00', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, '', 'Document Object Model', 8),
(23, '2015-12-01 00:00:00', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, '', 'Angualr Hello world Object Model', 8),
(27, '2015-12-28 13:31:58', 'This course introduces you the APIs, implement it using  --Not Its JavascriptThis course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript This course introduces you the APIs, implement it using  --Not Its Javascript', 1, 'image.jpg', b'0', 1, 'What-is-Dom421', 'What is Dom', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `firstName`, `image`, `lastName`, `password`, `phoneNumber`, `role`) VALUES
(0, 'admin@gmail.com', 'Samul', 'samul.jpg', 'Neupane', 'admin', '6414514622', 'ROLE_ADMIN'),
(1, 'sn@gmail.com', 'Sudarshan', 'samul.jpg', 'Neupane', 'admin', '6414514622', 'ROLE_USER');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD CONSTRAINT `FKr9h12yxnjfl4ycxmgngsjerem` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Constraints for table `tutorialscontent`
--
ALTER TABLE `tutorialscontent`
  ADD CONSTRAINT `FKawm35f6xxem83v9wq1tljfgql` FOREIGN KEY (`tutorials`) REFERENCES `tutorials` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
