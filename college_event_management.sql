-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: event_management
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_login`
--

DROP TABLE IF EXISTS `admin_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_login` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_login`
--

LOCK TABLES `admin_login` WRITE;
/*!40000 ALTER TABLE `admin_login` DISABLE KEYS */;
INSERT INTO `admin_login` VALUES (0,'admin','admin123'),(1,'sakshi','1515');
/*!40000 ALTER TABLE `admin_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `collegename` varchar(150) DEFAULT NULL,
  `collegeemail` varchar(150) DEFAULT NULL,
  `collegecode` varchar(150) DEFAULT NULL,
  `collegeaddress` varchar(150) DEFAULT NULL,
  `batch` varchar(150) DEFAULT NULL,
  `course` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, San','B','BBA'),(3,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, San','B','BCA'),(4,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, San','A','MCA'),(15,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, Sangli - 416416, Maharashtra','A','BBA'),(16,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, Sangli - 416416, Maharashtra','A','BCA'),(17,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, Sangli - 416416, Maharashtra','A','MBA'),(23,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, Sangli - 416416, Maharashtra','B','MCA'),(24,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Bharati Vidyapeeth Bhavan, Rajwada Chowk, Sangli - 416416, Maharashtra','B','MBA');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_organizer_login`
--

DROP TABLE IF EXISTS `event_organizer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_organizer_login` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_organizer_login`
--

LOCK TABLES `event_organizer_login` WRITE;
/*!40000 ALTER TABLE `event_organizer_login` DISABLE KEYS */;
INSERT INTO `event_organizer_login` VALUES (0,'eventorg','event123'),(1,'sakshi','1515');
/*!40000 ALTER TABLE `event_organizer_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventregisterstud`
--

DROP TABLE IF EXISTS `eventregisterstud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventregisterstud` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `student_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `prn` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `register_date` timestamp NULL DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `event_title` varchar(45) DEFAULT NULL,
  `attendance_status` varchar(20) DEFAULT 'NotMarked',
  `qr_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `foregin_key_idx` (`event_id`),
  KEY `foregin_key-_student_name_idx` (`student_name`),
  KEY `foregin_key_event_title_idx` (`event_title`),
  KEY `foregin_key_prn_idx` (`prn`),
  CONSTRAINT `foregin_key_event_id` FOREIGN KEY (`event_id`) REFERENCES `newevent` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foregin_key_event_title` FOREIGN KEY (`event_title`) REFERENCES `newevent` (`event_title`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventregisterstud`
--

LOCK TABLES `eventregisterstud` WRITE;
/*!40000 ALTER TABLE `eventregisterstud` DISABLE KEYS */;
INSERT INTO `eventregisterstud` VALUES (5,1,'Mahi Mahesh Jadhav','mahi28@gmail.com','102','Paid',NULL,'Approved','placement  drive ','Marked','b0d47db1-4431-44ab-adef-8a1dbf7e85d0'),(24,1,'Rugvedi Vidyasagar Chavan','rc@gmail.com','101','Paid',NULL,'Approved','placement  drive ','Marked','777320b1-d363-4634-ad8f-9851db7599a6'),(25,2,'Rugvedi Vidyasagar Chavan','rc@gmail.com','101','Unpaid',NULL,'Pending','Tech Fest','NotMarked',NULL),(27,3,'Mahi Mahesh Jadhav','mahi28@gmail.com','102','Paid',NULL,'Approved','Cultural Day','Marked','18c92ca6-aeb5-4b2a-91a9-856541c4dbca'),(30,1,'Sakshi Bhausaheb Patil','sakshi15@gmail.com','103','Paid',NULL,'Approved','placement  drive ','Marked','ee887f12-525c-4fe0-a64c-19c1209f39c7'),(32,2,'Sakshi Bhausaheb Patil','sakshi15@gmail.com','103','Paid',NULL,'Approved','Tech Fest','Marked','0923869e-cd4d-49be-8b5a-53e74dab448d'),(33,4,'','null','',NULL,NULL,'Approved','Gathering ','NotMarked',NULL);
/*!40000 ALTER TABLE `eventregisterstud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newevent`
--

DROP TABLE IF EXISTS `newevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newevent` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(45) NOT NULL,
  `event_category` enum('Technical','Cultural','Sports','Seminar') NOT NULL,
  `event_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `last_registration_date` date DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `organizer_name` varchar(45) DEFAULT NULL,
  `organizer_contact` varchar(45) DEFAULT NULL,
  `organizer_email` varchar(45) DEFAULT NULL,
  `allowed_course` enum('BCA','BBA','MCA','MBA','ALL') DEFAULT NULL,
  `eligibility` enum('FY','SY','TY','ALL') DEFAULT NULL,
  `seat_type` enum('Limited','Unlimited') DEFAULT NULL,
  `total_seats` int(11) DEFAULT NULL,
  `registration_fee` decimal(10,2) DEFAULT NULL,
  `payment_mode` enum('Online','Offline','online offline-both') DEFAULT NULL,
  `qr_code_path` varchar(250) DEFAULT NULL,
  `event_poster_path` varchar(250) DEFAULT NULL,
  `event_status` enum('Upcoming','Ongoing','Completed','Cancelled') DEFAULT NULL,
  PRIMARY KEY (`event_id`,`event_title`),
  UNIQUE KEY `event_title_UNIQUE` (`event_title`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newevent`
--

LOCK TABLES `newevent` WRITE;
/*!40000 ALTER TABLE `newevent` DISABLE KEYS */;
INSERT INTO `newevent` VALUES (1,'placement  drive ','Seminar','2026-02-28','10:00:00','14:00:00','2026-02-21','Auditorium','sangli','Comany Hr.R.V.Jadhav madam','0123456789','rv00@gmail.com','BCA','TY','Limited',200,500.00,'Online',NULL,NULL,'Upcoming'),(2,'Tech Fest','Technical','2026-02-23','09:00:00','13:00:00','2026-02-21','Auditorium Hall','sangli','Suvara Patil','7458963584','suvara88@gmail.com','MCA','ALL','Unlimited',200,500.00,'Online',NULL,NULL,'Upcoming'),(3,'Cultural Day','Cultural','2026-03-02','10:00:00','02:00:00','2026-02-28','Auditorium','sangli','Ayesha Mujawar','1598742657','mujawar00@gmail.com','ALL','ALL','Unlimited',200,500.00,'Online',NULL,NULL,'Upcoming'),(4,'Gathering ','Cultural','2026-02-25','18:00:00','20:30:00','2026-02-21','Khilare Karyalay','sangli','Suvara Patil','1598742657','suvara55@gmail.com','MCA','ALL','Unlimited',200,500.00,'Online',NULL,NULL,'Upcoming');
/*!40000 ALTER TABLE `newevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_registration`
--

DROP TABLE IF EXISTS `student_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collegename` varchar(200) NOT NULL,
  `collegeemail` varchar(150) NOT NULL,
  `collegecode` varchar(20) NOT NULL,
  `studentname` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `course` varchar(50) NOT NULL,
  `batch` varchar(20) NOT NULL,
  `prn` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `idcard` varchar(255) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`studentname`,`prn`),
  UNIQUE KEY `prn` (`prn`),
  UNIQUE KEY `studentname_UNIQUE` (`studentname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_registration`
--

LOCK TABLES `student_registration` WRITE;
/*!40000 ALTER TABLE `student_registration` DISABLE KEYS */;
INSERT INTO `student_registration` VALUES (1,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Rugvedi Vidyasagar Chavan','rc@gmail.com','female','BCA','A','101','p1.jpg','a2.png','2026-03-17 14:18:17'),(2,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Mahi Mahesh Jadhav','mahi28@gmail.com','female','MCA','B','102','p2.jpg','a2.png','2026-03-18 17:27:22'),(3,'Institute of Management & Rural Development Administration(IMRDA)','imrda@bharatividyapeeth.edu','24','Sakshi Bhausaheb Patil','sakshi15@gmail.com','female','MBCA','A','103','p3.jpg','a3.png','2026-03-18 17:27:22');
/*!40000 ALTER TABLE `student_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `course` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Sakshi Bhausaheb Patil','sakshi15@gmail.com','0123456789','female','BCA','1515'),(2,'Prerana Raju Gavali','preru9999@gmail.com','9998888666','Female ','BBA','00'),(3,'Shital Patil','shital11@gmail.com','1234829264','Female','BBA','sp01'),(4,'atharav b patil','abp11@gmail.com','7589632485','male','MBA','abp11'),(5,'Mahi Jadhav','mahi28@gmail.com','5874123695','male','MCA','2828'),(6,'Rugvedi Chavan','rc@gmail.com','4561425101',NULL,NULL,'123'),(7,'Riya Jadhav ','riya@gmail.com','1236541254',NULL,NULL,'123');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-04 22:11:16
