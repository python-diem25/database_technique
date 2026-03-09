-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: GymFlow
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BodyMeasurement`
--

DROP TABLE IF EXISTS `BodyMeasurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BodyMeasurement` (
  `measurement_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `measurement_date` date NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `chest` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `hips` decimal(5,2) DEFAULT NULL,
  `biceps` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`measurement_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `BodyMeasurement_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BodyMeasurement`
--

LOCK TABLES `BodyMeasurement` WRITE;
/*!40000 ALTER TABLE `BodyMeasurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `BodyMeasurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Barbell');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exercise`
--

DROP TABLE IF EXISTS `Exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exercise` (
  `exercise_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `equipment_id` int DEFAULT NULL,
  PRIMARY KEY (`exercise_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `Exercise_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `Equipment` (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exercise`
--

LOCK TABLES `Exercise` WRITE;
/*!40000 ALTER TABLE `Exercise` DISABLE KEYS */;
INSERT INTO `Exercise` VALUES (1,'Bench Press','Chest exercise',1);
/*!40000 ALTER TABLE `Exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExerciseLog`
--

DROP TABLE IF EXISTS `ExerciseLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExerciseLog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `set_number` int NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `reps` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `session_id` (`session_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `ExerciseLog_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `WorkoutSession` (`session_id`),
  CONSTRAINT `ExerciseLog_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `Exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExerciseLog`
--

LOCK TABLES `ExerciseLog` WRITE;
/*!40000 ALTER TABLE `ExerciseLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExerciseLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExerciseMuscleGroup`
--

DROP TABLE IF EXISTS `ExerciseMuscleGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExerciseMuscleGroup` (
  `exercise_id` int NOT NULL,
  `muscle_id` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`muscle_id`),
  KEY `muscle_id` (`muscle_id`),
  CONSTRAINT `ExerciseMuscleGroup_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `Exercise` (`exercise_id`),
  CONSTRAINT `ExerciseMuscleGroup_ibfk_2` FOREIGN KEY (`muscle_id`) REFERENCES `MuscleGroup` (`muscle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExerciseMuscleGroup`
--

LOCK TABLES `ExerciseMuscleGroup` WRITE;
/*!40000 ALTER TABLE `ExerciseMuscleGroup` DISABLE KEYS */;
INSERT INTO `ExerciseMuscleGroup` VALUES (1,1);
/*!40000 ALTER TABLE `ExerciseMuscleGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goal`
--

DROP TABLE IF EXISTS `Goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Goal` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `target_value` decimal(10,2) DEFAULT NULL,
  `current_value` decimal(10,2) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`goal_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Goal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goal`
--

LOCK TABLES `Goal` WRITE;
/*!40000 ALTER TABLE `Goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MuscleGroup`
--

DROP TABLE IF EXISTS `MuscleGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MuscleGroup` (
  `muscle_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`muscle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MuscleGroup`
--

LOCK TABLES `MuscleGroup` WRITE;
/*!40000 ALTER TABLE `MuscleGroup` DISABLE KEYS */;
INSERT INTO `MuscleGroup` VALUES (1,'Chest');
/*!40000 ALTER TABLE `MuscleGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_active_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Dino','dino@example.com','2026-03-09 00:30:40','2026-03-09 00:33:24'),(2,'Gida','Gidamola45@gmail.com','2026-03-09 00:32:29',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workout`
--

DROP TABLE IF EXISTS `Workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Workout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exercise` varchar(50) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `reps` int DEFAULT NULL,
  `sets` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workout`
--

LOCK TABLES `Workout` WRITE;
/*!40000 ALTER TABLE `Workout` DISABLE KEYS */;
/*!40000 ALTER TABLE `Workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkoutSession`
--

DROP TABLE IF EXISTS `WorkoutSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkoutSession` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_date` date NOT NULL,
  `duration_minutes` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `WorkoutSession_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkoutSession`
--

LOCK TABLES `WorkoutSession` WRITE;
/*!40000 ALTER TABLE `WorkoutSession` DISABLE KEYS */;
INSERT INTO `WorkoutSession` VALUES (1,1,'2026-02-25',13,'It was fun and hard');
/*!40000 ALTER TABLE `WorkoutSession` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `update_last_active` AFTER INSERT ON `WorkoutSession` FOR EACH ROW BEGIN
    UPDATE User
    SET last_active_date = NOW()
    WHERE user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-09  1:11:21
