-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: moviestar
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `image` varchar(200) DEFAULT NULL,
  `trailer` varchar(150) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `users_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (3,'Teste','asdasdsfadsaas adasdasd asdasds asd asd ','ca35b80aacb42020eec612b45f3c50cb1b8541e7378286b97407313cb6e892973e01db9f4f2f2b0f14540ea54ffaf166c153a19ef2f2a81ec16e7b06.jpg','https://www.fyoutube.com/watch?v=dMVNvH1TwvE','Ação','2H123',10),(5,'O Coringa','Em 1981, Arthur Fleck trabalha como palhaço contratado e aspira tornar-se comediante stand-up, vivendo com sua mãe em uma Gotham City marcada pela criminalidade e pela recessão. Ele sofre de um distúrbio neurológico que provoca risadas incontroláveis, depende de serviços sociais para medicamentos, e após uma série de eventos violentos acaba se transformando no lendário vilão “Coringa”.','f8de3776310a64b7981cd5a413d8fb05368e0c12932cde694a3f11a6e56d0f773bccd0b4116f9776b0e0ead2e437c628d41ba2906f49208367efa6a6.jpg','https://www.youtube.com/watch?v=zAGVQLHvwOY&utm_source=chatgpt.com','Terror','1h20min',10),(6,'Esquema de Risco','O agente secreto Orson Fortune e sua equipe são recrutados para impedir a venda de uma nova tecnologia de armamento mortal que ameaça a ordem mundial. Para tanto, eles contam com a ajuda de uma grande estrela de Hollywood disfarçada na missão.','556ef599a17958a8376d33902c44778cf2131cc711f12c7b64472e1905d52d3a90b8a04aa890c4fb5b2b782ea012f51ad43c70f04b308e08a18e137e.jpg','https://www.youtube.com/watch?v=bfz4jClqDRw','Acao','1h30min',10),(7,'Morte do Demônio','Cinco estudantes universitários vão para uma cabana isolada na floresta. Lá, encontram um livro antigo que liberta demônios quando lido em voz alta, levando à possessão dos jovens e a uma luta desesperada pela sobrevivência.','acf07073825a897955a4820212d66f2ee9b46f2ec34354a70515f88ae76cf9151b56589982b6184938375fec7084865815e9edafd1265be618b97ff6.jpg','https://www.youtube.com/watch?v=gwkylgpIfz0','Terror','1h15min',10),(8,'O ritual','x','09d72cef6efc68b39595843f17511324c85e74dc4df1bb7c10db137a97df8d4f28286f8144ad1eeaec944dbc96448d0a7fd492fd17a2c359979273cc.jpg','x','Terror','1h05min',10),(9,'A Luz do Demônio','x','50e691144135833262cb7db13ca2298858a39395c5f8cbf6a4d916f79a8494b247238aa92143a15fcfd7b0f6159163e02c3e39abd6d6fa97b268745c.jpg','x','Terror','1h50min',10);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `review` text,
  `users_id` int unsigned DEFAULT NULL,
  `movies_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `movies_id` (`movies_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,9,'asd',9,3);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'asdsa','asd','melomikael1940@gmail.com','$2y$10$jAlZrvyUvRjS.S0ZtNKwaODbpddtDsNe9iFC63z2/VSv6M9ZpCDw.',NULL,'e3f2d8c2d59464230a55275c0122355034dddedd09a898e1ebf44fdbb25ac1974e7e53439944ec63413b670723fdfd95edc3',NULL),(2,'sd','asd','askdj@gmail.com','$2y$10$Mds55NBlqS5PrYU0xdGFQ.JI905tenKelwRINFgSKpzZ2HV1133M6',NULL,'b4e37d5beb66ff83a40604322eb3f93e2873946de1aa27001c5a8f2ec7b4f980eb8fa25a6e362b951bba9932f1940bd876c6',NULL),(3,'asd','asd','asd@gmail.com','$2y$10$Aqv08vfBmffWjXKyXmMt9eesTYi2bROPmUwf58sHVR0SGm6qnF9ri',NULL,'3378817fd545266556987d0398dcb676a2e960081dec7fd1ae127f7c1aa901c5d8aabefdd8c0a58fa24e3fbd1ad56aa2549c',NULL),(4,'wqe','qwe','asdlk@gmail.com','$2y$10$BKr6D9jIdyXdwquVrUzLN.W8I57KwXTqxc/TjFjiyzrmzpQB4tX3y',NULL,'301915b0f400e9972d04cc73818fe8cce4a7459536bd8e25ddce7bef0c2bb143c6121ad3cb41d2d73be5d3c4d788f235a66d',NULL),(5,'qd','qs','wwww@gmail.com','$2y$10$OZQTioIAvJzj2lsSEINLTe7MoogmZVptfkxfKzKRTgKkIIIcuUOSC',NULL,'1bfcf8ec29ed6bd4b7a6370aca3d91e1fc0e8aa8116d8b1b82b8d8a46508a51dc02abbf81bb845fa5dd4b5a795579d71f25f',NULL),(6,'aSD','ASD','qoq@gmail.com','$2y$10$SXOCtp/zj8wFIzfsuhzsYOnaOaOmmCyjTPEpF/3gL7DMXVHK.8L5e',NULL,'a5da00500155450865217cb07207f58d6363fc5bc1cb79f811b7914a47e8ac4d2b7cc67d81a9be9749b8345503c2fcdcf2d7',NULL),(7,'Teste','asd','weqwe@gmail.com','$2y$10$i7wFitX0eDsAuZF82Nn9SuaamMkrJPpLSW4M3lqHLaEaRwzToNlNG','user_68fe33c9a1ee54.18044021.jpg','b720551697809a8c587a2c8240616c2763178798851278e31deb277bf4ee232bcb7baa2d74cd1f61eff128d57283fec11cb8','teste'),(8,'Mikael','Melo','qqq@gmail.com','$2y$10$CYTmpc2x2Obu0nJO1ISX5uDwWDm6nOPKS6EB3o7AjEgUNUqgwdITO','user_69020a346b6064.10880448.png','8d1e43d6fc5abbc8cac8184f1a07b6902f84330953eddb218a412a6d8429b0750a76da14c1c487eff059a7fabc07f6f9dfab',''),(9,'qwe','qwe','qweqw@gmail.com','$2y$10$rGEQ4zOr3QcaOnWUgJd22.IS65fbJeufTS2mUAAf3.WMwaSJAXzC.',NULL,'587abecf7c68afc20f93f9d7c8ab90b173195f352ce444e1a24fda52e7dcfdd328d24bccbcabc49b287148442ebf1427a6d5',NULL),(10,'Mikael','Melo','teste@gmail.com','$2y$10$31VHedVlaDCXaplQvh09jeAkS92NrPmYHxczrBRfyv3N09mH4btxW','user_69122b055d5c04.74739811.jpg','956c5868800453d61fecd342385f8fb2199c445001ed9f05941f308fdefd1da0bec59370200525a53b9013e45429712adfbc','');
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

-- Dump completed on 2025-11-10 15:31:31
