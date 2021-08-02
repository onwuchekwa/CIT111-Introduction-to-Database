CREATE DATABASE  IF NOT EXISTS `wk13university` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wk13university`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: wk13university
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `college` (
  `CollegeId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`CollegeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'College of Business and Communication'),(2,'College of Language and Letters');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `CourseId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Number` varchar(10) NOT NULL,
  `Credit` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `fk_Course_Department1_idx` (`DepartmentId`),
  CONSTRAINT `fk_Course_Department1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Intro to Databases','111',3,1),(2,'Econometrics','388',4,2),(3,'Micro Economics','150',3,2),(4,'The Classical Heritage','376',2,3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `DepartmentId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `CollegeId` int(11) NOT NULL,
  PRIMARY KEY (`DepartmentId`),
  KEY `fk_Department_College1_idx` (`CollegeId`),
  CONSTRAINT `fk_Department_College1` FOREIGN KEY (`CollegeId`) REFERENCES `college` (`collegeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Information Technology','CIT',1),(2,'Economics','ECON',1),(3,'Humanities and Philosophy','HUM',2);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professor` (
  `ProfessorId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  PRIMARY KEY (`ProfessorId`),
  KEY `fk_Professor_Department_idx` (`DepartmentId`),
  CONSTRAINT `fk_Professor_Department` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Morring',1),(2,'Barney',1),(3,'Barrus',2),(4,'Nate',2),(5,'Jensen',3),(6,'Flora',3);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `section` (
  `SectionId` int(11) NOT NULL AUTO_INCREMENT,
  `Number` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `TermId` int(11) NOT NULL,
  `ProfessorId` int(11) NOT NULL,
  PRIMARY KEY (`SectionId`),
  KEY `fk_Section_Course1_idx` (`CourseId`),
  KEY `fk_Section_Term1_idx` (`TermId`),
  KEY `fk_Section_Professor1_idx` (`ProfessorId`),
  CONSTRAINT `fk_Section_Course1` FOREIGN KEY (`CourseId`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_Section_Professor1` FOREIGN KEY (`ProfessorId`) REFERENCES `professor` (`professorid`),
  CONSTRAINT `fk_Section_Term1` FOREIGN KEY (`TermId`) REFERENCES `term` (`termid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,1,30,1,1,1),(2,1,35,2,1,3),(3,1,50,3,1,4),(4,2,50,3,1,4),(5,1,30,4,1,5),(6,2,30,1,2,1),(7,3,35,1,2,2),(8,1,50,3,2,4),(9,2,50,3,2,4),(10,1,30,4,2,5);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Gender` char(1) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` char(2) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Paul','M','Dallas','TX','1996-02-22'),(2,'Katie','F','Provo','UT','1995-07-22'),(3,'Kelly','F','Provo','UT','1998-06-22'),(4,'Devon','M','Mesa','AZ','2000-07-22'),(5,'Mandy','F','Topeka','KS','1996-11-22'),(6,'Alece','F','Rigby','ID','1997-05-22'),(7,'Bryce','M','Bozeman','MT','1997-11-22'),(8,'Preston','M','Decatur','TN','1996-09-22'),(9,'Julia','F','Rexburg','ID','1998-09-22'),(10,'Susan','F','Mesa','AZ','1998-09-08');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsection`
--

DROP TABLE IF EXISTS `studentsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentsection` (
  `StudentSectionId` int(11) NOT NULL AUTO_INCREMENT,
  `SectionId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  PRIMARY KEY (`StudentSectionId`),
  KEY `fk_StudentSection_Section1_idx` (`SectionId`),
  KEY `fk_StudentSection_Student1_idx` (`StudentId`),
  CONSTRAINT `fk_StudentSection_Section1` FOREIGN KEY (`SectionId`) REFERENCES `section` (`sectionid`),
  CONSTRAINT `fk_StudentSection_Student1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsection`
--

LOCK TABLES `studentsection` WRITE;
/*!40000 ALTER TABLE `studentsection` DISABLE KEYS */;
INSERT INTO `studentsection` VALUES (1,4,1),(2,1,1),(3,2,2),(4,2,3),(5,5,4),(6,5,5),(7,2,5),(8,7,6),(9,6,7),(10,8,7),(11,10,7),(12,9,8),(13,9,9),(14,6,10);
/*!40000 ALTER TABLE `studentsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `term` (
  `TermId` int(11) NOT NULL AUTO_INCREMENT,
  `Term` varchar(20) NOT NULL,
  `Year` char(4) NOT NULL,
  PRIMARY KEY (`TermId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,'Fall','2016'),(2,'Winter','2017'),(3,'Spring','2017');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-14 20:34:12
