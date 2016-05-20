-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: BBExam
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_users1_idx` (`user_id`),
  CONSTRAINT `fk_favorites_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Frank Chou','Frank','fcc4mv@gmail.com','$2b$12$40qAxaiQ2/ATStsCSCgv1ewj1v.xOQdV9YjIjEcUF8w3cl9OoYJO6',NULL,'2016-05-20 11:24:09','2016-05-20 11:24:09'),(2,'Mike Chen','Mike','mikec@gmail.com','$2b$12$/SAB.ia1piopsYtiGOvcI.58ODeyQmYTXwuq5RJBMZcqgOLSPa3vm',NULL,'2016-05-20 11:26:27','2016-05-20 11:26:27'),(3,'Joe Schmoe','Joe','joes@gmail.com','$2b$12$NqIEoxu7uxR5oL6oL3EQi.l7TWRQZvm.Do3K8vTAKKHTvky/JyFcO',NULL,'2016-05-20 11:33:06','2016-05-20 11:33:06'),(4,'Oliver Twist','Oliver','otwist@gmail.com','$2b$12$FJoXhYxeeg1dKAGR0Y1vLOJC95fwWLAyrWMXuqN1HUxzQv1i5keJO',NULL,'2016-05-20 11:35:41','2016-05-20 11:35:41'),(6,'Kill Bill','KB','kb@gmail.com','$2b$12$biDF37quQjAljABPL7fNquC3I5gqD4u751KFsMabC69E2PLq.UZAq',NULL,'2016-05-20 12:12:06','2016-05-20 12:12:06'),(7,'Stacy Racey','SR','sr@gmail.com','$2b$12$L4yO1kyyCEeYgjTvajnbbu5kj64ok4dV1r189X1rw2PXn9URHMfoS',NULL,'2016-05-20 12:14:42','2016-05-20 12:14:42'),(8,'Tony Wah','Tony','tw@gmail.com','$2b$12$x4Cj4D6BHuzZIOES1.lVjeyJUyc0Bl9Ey6gugWdSFt5cnjBfnIIG2',NULL,'2016-05-20 12:16:54','2016-05-20 12:16:54'),(9,'Mark Blue','Blue','mb@gmail.com','$2b$12$rMeU/0BUZ0NNdXY3X00IDuccuNG6cHoiwlIC36SKCgKBXOIr8W0..',NULL,'2016-05-20 12:17:44','2016-05-20 12:17:44'),(10,'Tina Sun','Tinar','ts@gmail.com','$2b$12$ogpaNSSlID9RwBHOKaOahe802QltWK5mTDKoyeMFxfD9EG4924sx2',NULL,'2016-05-20 12:19:43','2016-05-20 12:19:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-20 12:44:57
