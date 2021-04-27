/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 10.4.13-MariaDB : Database - pretest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pretest` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `pretest`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(25,'2014_10_12_000000_create_users_table',1),
(26,'2014_10_12_100000_create_password_resets_table',1),
(27,'2019_08_19_000000_create_failed_jobs_table',1),
(28,'2021_04_13_053930_create_sections_table',1),
(29,'2021_04_13_054940_create_questions_table',1),
(30,'2021_04_13_061201_create_options_table',1);

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) unsigned NOT NULL,
  `letter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_img` tinyint(1) NOT NULL DEFAULT 0,
  `img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `options_question_id_foreign` (`question_id`),
  CONSTRAINT `options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `options` */

insert  into `options`(`option_id`,`question_id`,`letter`,`content`,`is_img`,`img_path`,`is_answer`,`created_at`,`updated_at`) values 
(19,6,'A','The Freedom Constitution',0,'',0,NULL,NULL),
(20,6,'B','The 1971 Philippine constitution',0,'',0,NULL,NULL),
(21,6,'C','The 1987 Philippine Constitution',0,'',1,NULL,NULL),
(22,6,'D','The Revolutionary Freedom Constitution',0,'',0,NULL,NULL),
(23,9,'A','Cesar Virata',0,'',1,NULL,NULL),
(24,9,'B','Pedro Paterno',0,'',0,NULL,NULL),
(25,9,'C','Ferdinand Marcos',0,'',0,NULL,NULL),
(26,9,'D','Salvador Laurel',0,'',0,NULL,NULL),
(27,10,'A','Twenty-two-dash line map',0,'',0,NULL,'2021-04-27 07:38:59'),
(28,10,'B','200 nautical miles from China’s shoreline',0,'',0,NULL,'2021-04-27 07:38:59'),
(29,10,'C','Nine-dash-line map',0,'',1,NULL,'2021-04-27 07:38:59'),
(30,10,'D','100 nautical miles from the shoreline',0,'',0,NULL,'2021-04-27 07:38:59'),
(31,11,'A','Life, property, equal protection',0,'',1,NULL,'2021-04-27 07:39:15'),
(32,11,'B','Equal protection, liberty, Property',0,'',0,NULL,'2021-04-27 07:39:15'),
(33,11,'C','Internet, food, security',0,'',0,NULL,'2021-04-27 07:39:15'),
(34,11,'D','Life, ability, equality',0,'',0,NULL,'2021-04-27 07:39:15'),
(35,12,'A','Jane Adams',0,'',0,NULL,'2021-04-27 07:39:38'),
(36,12,'B','Marie Curie',0,'',1,NULL,'2021-04-27 07:39:38'),
(37,12,'C','Aung San Suu Kyi',0,'',0,NULL,'2021-04-27 07:39:38'),
(38,12,'D','Mother Theresa',0,'',0,NULL,'2021-04-27 07:39:38'),
(39,13,'A','The nucleus',0,'',1,NULL,NULL),
(40,13,'B','Golgi Aparatus',0,'',0,NULL,NULL),
(41,13,'C','Mitochondria',0,'',0,NULL,NULL),
(42,13,'D','Celluloid',0,'',0,NULL,NULL),
(43,14,'A','The United Nations',0,'',1,NULL,NULL),
(44,14,'B','World Government',0,'',0,NULL,NULL),
(45,14,'C','The Union Jack',0,'',0,NULL,NULL),
(46,14,'D','League of Nations',0,'',0,NULL,NULL),
(47,15,'A','Earth',0,'',0,NULL,NULL),
(48,15,'B','Uranus',0,'',0,NULL,NULL),
(49,15,'C','Jupiter',0,'',1,NULL,NULL),
(50,15,'D','Pluto',0,'',0,NULL,NULL),
(51,16,'A','Crocodile',0,'',0,NULL,NULL),
(52,16,'B','Chicken',0,'',0,NULL,NULL),
(53,16,'C','Komodo Dragon',0,'',1,NULL,NULL),
(54,16,'D','Gila Monster',0,'',0,NULL,NULL),
(55,17,'A','Ibong Adarna',0,'',1,NULL,'2021-04-27 07:40:05'),
(56,17,'B','Sarimanok',0,'',0,NULL,'2021-04-27 07:40:05'),
(57,17,'C','Phoenix',0,'',0,NULL,'2021-04-27 07:40:05'),
(58,17,'D','Wakwak',0,'',0,NULL,'2021-04-27 07:40:05'),
(59,18,'A','Indonesia',0,'',0,NULL,NULL),
(60,18,'B','Japan',0,'',0,NULL,NULL),
(61,18,'C','Philippines',0,'',1,NULL,NULL),
(62,18,'D','Amestris',0,'',0,NULL,NULL),
(63,19,'A','Michael Martinez',0,'',1,NULL,NULL),
(64,19,'B','Julian Makaraeg',0,'',0,NULL,NULL),
(65,19,'C','Paeng Nepomuceno',0,'',0,NULL,NULL),
(66,19,'D','Hidilyn Dian',0,'',0,NULL,NULL),
(67,20,'A','Spanish Flu',0,'',0,NULL,NULL),
(68,20,'B','The Great Plague of London',0,'',0,NULL,NULL),
(69,20,'C','The Black Death',0,'',1,NULL,NULL),
(70,20,'D','Apocalypse Virus',0,'',0,NULL,NULL),
(71,21,'A','Carl Marx',0,'',0,NULL,NULL),
(72,21,'B','Adam Smith',0,'',1,NULL,NULL),
(73,21,'C','Edward Elric',0,'',0,NULL,NULL),
(74,21,'D','Aristotle',0,'',0,NULL,NULL),
(75,22,'A','Sexual Orientation, Gender Identity and Expression',0,'',1,NULL,NULL),
(76,22,'B','Sexual Organization, Gender Inclusivity and Equality',0,'',0,NULL,NULL),
(77,22,'C','Sense Of Gratitude In Expression',0,'',0,NULL,NULL),
(78,22,'D','Severe Grunt against Injustice in Earth',0,'',0,NULL,NULL),
(79,23,'A','March 13, 2020',0,'',0,NULL,'2021-04-27 07:38:00'),
(80,23,'B','March 15, 2020',0,'',1,NULL,'2021-04-27 07:38:00'),
(81,23,'C','March 30, 2020',0,'',0,NULL,'2021-04-27 07:38:00'),
(82,23,'D','March 20, 2020',0,'',0,NULL,'2021-04-27 07:38:01'),
(83,24,'A','Wall Maria',0,'',0,NULL,NULL),
(84,24,'B','The iron curtain of USSR',0,'',0,NULL,NULL),
(85,24,'C','Great Wall of China',0,'',1,NULL,NULL),
(86,24,'D','Trump Wall',0,'',0,NULL,NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `question_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `questions_section_id_foreign` (`section_id`),
  CONSTRAINT `questions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `questions` */

insert  into `questions`(`question_id`,`order_no`,`section_id`,`question`,`question_img_path`,`score`,`created_at`,`updated_at`) values 
(6,0,5,'What is the current constitution of the Philippines?',NULL,1,'2021-04-27 06:17:40','2021-04-27 06:17:40'),
(9,0,5,'During the 1970s the Philippines shifted from Presidential to Parliamentary system. Who among the following is the living former Prime Minister of the Philippines?',NULL,1,'2021-04-27 06:25:38','2021-04-27 06:25:38'),
(10,0,5,'On 2016, the International Arbitration Court  during the South China Sea arbitration ruled in favor of the Philippines over the historical rights of China over the west Philippine sea. What was the historical basis of China in claiming sovereign rights over Philippine Exclusive Economic Zone including Julian Felipe reef?',NULL,1,'2021-04-27 06:29:12','2021-04-27 06:29:12'),
(11,0,5,'Article III sec. 1 of the 1987 constitution provides that, “No person shall be deprived of _______, liberty, or ________ without due process of law, nor shall any person be denied the __________ of the laws.” Supply the missing words.',NULL,1,'2021-04-27 06:30:49','2021-04-27 06:31:51'),
(12,0,5,'Nobel prize is an award given to individuals each year who has given exemplary contribution in the field of science, literature, economics or Peace. Who was the first woman to win the Nobel Prize? (B)',NULL,1,'2021-04-27 06:31:39','2021-04-27 06:31:39'),
(13,0,5,'6.	The cell is known to be the smallest functional unit of an organism. What is the name of the powerhouse of the cell?',NULL,1,'2021-04-27 06:32:35','2021-04-27 06:32:35'),
(14,0,5,'After the second world war what organization was created to maintain international peace and security?',NULL,1,'2021-04-27 06:39:20','2021-04-27 06:39:20'),
(15,0,5,'Our solar system is composed of nine planets. What is the biggest planet in our solar system?',NULL,1,'2021-04-27 06:40:58','2021-04-27 06:40:58'),
(16,0,5,'Which among the following is the nearest descendant of the Tyrannosaurus Rex (T-rex)?',NULL,1,'2021-04-27 06:41:56','2021-04-27 06:41:56'),
(17,0,5,'Don Diego, Don Juan  and  Don Pedro were looking for an enchanted bird to cure Haring Fernando What was the name of the bird?',NULL,1,'2021-04-27 06:42:47','2021-04-27 06:42:47'),
(18,0,5,'Every two years ASEAN celebrates the SEA games, which among the following countries is the host of the 2019 SEA Games?',NULL,1,'2021-04-27 06:43:37','2021-04-27 06:43:37'),
(19,0,5,'Philippines has been active in the sports arena particularly the Olympics. Who was the first Filipino figure skater and the first Southeast Asian in the figure skating sport in the winter Olympics?',NULL,1,'2021-04-27 06:44:38','2021-04-27 06:44:38'),
(20,0,5,'The world is currently battling a pandemic known as Covid 19. Because of such, people practiced social distancing, wearing of mask and proper hand sanitation. Which among the following pandemics invented the quarantine method?',NULL,1,'2021-04-27 06:45:26','2021-04-27 06:45:26'),
(21,0,5,'Who is the father of Modern Economics?',NULL,1,'2021-04-27 06:46:58','2021-04-27 06:46:58'),
(22,0,5,'The different genders struggled to be recognized by the society at large, in order to have the recognition and equal rights, the LGBTQ+ community filed the SOGIE bill praying that it will soon become a law since it is more inclusive to all. What does SOGIE mean?',NULL,1,'2021-04-27 06:47:38','2021-04-27 06:47:38'),
(23,0,5,'During the year 2020, the first ever recorded case of Covid 19 is recoded in January. When was the first Philippine local lockdown implemented?',NULL,1,'2021-04-27 06:48:15','2021-04-27 06:48:15'),
(24,0,5,'It has been recorded since ancient times that human civilization-built walls in order to protect themselves and their community. According to the Guinness World Records, what is the longest wall in the world?',NULL,1,'2021-04-27 06:49:05','2021-04-27 06:49:05');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `section_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `sections_section_unique` (`section`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sections` */

insert  into `sections`(`section_id`,`section`,`created_at`,`updated_at`) values 
(1,'ABSTRACT',NULL,NULL),
(2,'NUMERICAL',NULL,NULL),
(3,'LINGUISTICS',NULL,NULL),
(4,'VOCABULARY',NULL,NULL),
(5,'GENERAL KNOWLEDGE',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`lname`,`fname`,`mname`,`sex`,`email`,`email_verified_at`,`password`,`role`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','AMPARADO','ETIENNE','N','MALE','admin@pretest.org',NULL,'$2y$10$/cOT.cZtfEgOSOs9XJ/4a.oTbAn1iYvUDAlhalGJ16G59o7sDn1yy','ADMINISTRATOR',NULL,'2021-04-27 01:07:56','2021-04-27 01:07:56');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
