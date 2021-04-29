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

/*Table structure for table `answer_sheets` */

DROP TABLE IF EXISTS `answer_sheets`;

CREATE TABLE `answer_sheets` (
  `answer_sheet_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_taken` tinyint(1) NOT NULL DEFAULT 0,
  `date_taken` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`answer_sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answer_sheets` */

/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `answer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `answer_sheet_id` bigint(20) unsigned NOT NULL,
  `option_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `answers_answer_sheet_id_foreign` (`answer_sheet_id`),
  KEY `answers_option_id_foreign` (`option_id`),
  CONSTRAINT `answers_answer_sheet_id_foreign` FOREIGN KEY (`answer_sheet_id`) REFERENCES `answer_sheets` (`answer_sheet_id`),
  CONSTRAINT `answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answers` */

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(25,'2014_10_12_000000_create_users_table',1),
(26,'2014_10_12_100000_create_password_resets_table',1),
(27,'2019_08_19_000000_create_failed_jobs_table',1),
(28,'2021_04_13_053930_create_sections_table',1),
(29,'2021_04_13_054940_create_questions_table',1),
(30,'2021_04_13_061201_create_options_table',1),
(31,'2021_04_29_033333_create_answer_sheets_table',2),
(33,'2021_04_29_071057_create_answers_table',2),
(34,'2021_04_29_035026_create_test_schedules',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(86,24,'D','Trump Wall',0,'',0,NULL,NULL),
(87,25,'A','ARTHE',0,'',0,NULL,NULL),
(88,25,'B','HEART',0,'',0,NULL,NULL),
(89,25,'C','RTHEA',0,'',0,NULL,NULL),
(90,25,'D','TRHEA',0,'',0,NULL,NULL),
(91,26,'A','False',0,'',0,NULL,NULL),
(92,26,'B','True',0,'',0,NULL,NULL),
(93,26,'C','Uncertain',0,'',0,NULL,NULL),
(94,26,'D','All of the above',0,'',0,NULL,NULL),
(95,27,'A','Sheep',0,'',0,NULL,NULL),
(96,27,'B','Lions',0,'',0,NULL,NULL),
(97,27,'C','None',0,'',0,NULL,NULL),
(98,27,'D','Horses',0,'',0,NULL,NULL),
(99,28,'A','False',0,'',0,NULL,NULL),
(100,28,'B','True',0,'',0,NULL,NULL),
(101,28,'C','Uncertain',0,'',0,NULL,NULL),
(102,28,'D','All of the above',0,'',0,NULL,NULL),
(103,29,'A','O H M E',0,'',0,NULL,NULL),
(104,29,'B','O E M H',0,'',0,NULL,NULL),
(105,29,'C','H E M O',0,'',0,NULL,NULL),
(106,29,'D','E O H M',0,'',0,NULL,NULL),
(107,30,'A','False',0,'',0,NULL,NULL),
(108,30,'B','True',0,'',0,NULL,NULL),
(109,30,'C','Uncertain',0,'',0,NULL,NULL),
(110,30,'D','All of the above',0,'',0,NULL,NULL),
(111,31,'A','False',0,'',0,NULL,NULL),
(112,31,'B','True',0,'',0,NULL,NULL),
(113,31,'C','Uncertain',0,'',0,NULL,NULL),
(114,31,'D','All of the above',0,'',0,NULL,NULL),
(115,32,'A','False',0,'',0,NULL,NULL),
(116,32,'B','True',0,'',0,NULL,NULL),
(117,32,'C','Uncertain',0,'',0,NULL,NULL),
(118,32,'D','All of the above',0,'',0,NULL,NULL),
(119,33,'A','Some of the college instructors have more than six children.',0,'',0,NULL,NULL),
(120,33,'B','Everybody in the college has children.',0,'',0,NULL,NULL),
(121,33,'C','All instructors in the college have six children each.',0,'',0,NULL,NULL),
(122,33,'D','Only one instructor in the college has exactly six children.',0,'',0,NULL,NULL),
(123,34,'A','False',0,'',0,NULL,NULL),
(124,34,'B','True',0,'',0,NULL,NULL),
(125,34,'C','Uncertain',0,'',0,NULL,NULL),
(126,34,'D','All of the above',0,'',0,NULL,NULL),
(127,35,'A','False',0,'',0,NULL,NULL),
(128,35,'B','True',0,'',0,NULL,NULL),
(129,35,'C','Uncertain',0,'',0,NULL,NULL),
(130,35,'D','All of the above',0,'',0,NULL,NULL),
(131,36,'A','False',0,'',0,NULL,NULL),
(132,36,'B','True',0,'',0,NULL,NULL),
(133,36,'C','Uncertain',0,'',0,NULL,NULL),
(134,36,'D','All of the above',0,'',0,NULL,NULL),
(135,37,'A','False',0,'',0,NULL,NULL),
(136,37,'B','True',0,'',0,NULL,NULL),
(137,37,'C','Uncertain',0,'',0,NULL,NULL),
(138,37,'D','All of the above',0,'',0,NULL,NULL),
(139,38,'A','False',0,'',0,NULL,NULL),
(140,38,'B','True',0,'',0,NULL,NULL),
(141,38,'C','Uncertain',0,'',0,NULL,NULL),
(142,38,'D','All of the above',0,'',0,NULL,NULL),
(143,39,'A','Having a Huawei tablet is not a needless expenditure.',0,'',0,NULL,NULL),
(144,39,'B','Subscribing to a YouTube channel is a needless expenditure.',0,'',0,NULL,NULL),
(145,39,'C','Subscribing to a YouTube channel is not a needless expenditure.',0,'',0,NULL,NULL),
(146,39,'D','Dining in a world class hotel is not a luxury.',0,'',0,NULL,NULL),
(147,40,'A','Only sons were at home',0,'',0,NULL,NULL),
(148,40,'B','All ladies were at home',0,'',0,NULL,NULL),
(149,40,'C','Nobody was at home',0,'',0,NULL,NULL),
(150,40,'D','Only wife was at home',0,'',0,NULL,NULL),
(151,41,'A','K and P',0,'',0,NULL,NULL),
(152,41,'B','R and P',0,'',0,NULL,NULL),
(153,41,'C','Only P',0,'',0,NULL,NULL),
(154,41,'D','P and T',0,'',0,NULL,NULL),
(155,42,'A','I only',0,'',0,NULL,NULL),
(156,42,'B','II only',0,'',0,NULL,NULL),
(157,42,'C','II and III only',0,'',0,NULL,NULL),
(158,42,'D','None of the statements is a known fact.',0,'',0,NULL,NULL);

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
  `is_question_img` tinyint(1) DEFAULT 0,
  `question_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `questions_section_id_foreign` (`section_id`),
  CONSTRAINT `questions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `questions` */

insert  into `questions`(`question_id`,`order_no`,`section_id`,`question`,`is_question_img`,`question_img_path`,`score`,`created_at`,`updated_at`) values 
(6,0,5,'What is the current constitution of the Philippines?',0,NULL,1,'2021-04-27 06:17:40','2021-04-27 06:17:40'),
(9,0,5,'During the 1970s the Philippines shifted from Presidential to Parliamentary system. Who among the following is the living former Prime Minister of the Philippines?',0,NULL,1,'2021-04-27 06:25:38','2021-04-27 06:25:38'),
(10,0,5,'On 2016, the International Arbitration Court  during the South China Sea arbitration ruled in favor of the Philippines over the historical rights of China over the west Philippine sea. What was the historical basis of China in claiming sovereign rights over Philippine Exclusive Economic Zone including Julian Felipe reef?',0,NULL,1,'2021-04-27 06:29:12','2021-04-27 06:29:12'),
(11,0,5,'Article III sec. 1 of the 1987 constitution provides that, “No person shall be deprived of _______, liberty, or ________ without due process of law, nor shall any person be denied the __________ of the laws.” Supply the missing words.',0,NULL,1,'2021-04-27 06:30:49','2021-04-27 06:31:51'),
(12,0,5,'Nobel prize is an award given to individuals each year who has given exemplary contribution in the field of science, literature, economics or Peace. Who was the first woman to win the Nobel Prize? (B)',0,NULL,1,'2021-04-27 06:31:39','2021-04-27 06:31:39'),
(13,0,5,'6.	The cell is known to be the smallest functional unit of an organism. What is the name of the powerhouse of the cell?',0,NULL,1,'2021-04-27 06:32:35','2021-04-27 06:32:35'),
(14,0,5,'After the second world war what organization was created to maintain international peace and security?',0,NULL,1,'2021-04-27 06:39:20','2021-04-27 06:39:20'),
(15,0,5,'Our solar system is composed of nine planets. What is the biggest planet in our solar system?',0,NULL,1,'2021-04-27 06:40:58','2021-04-27 06:40:58'),
(16,0,5,'Which among the following is the nearest descendant of the Tyrannosaurus Rex (T-rex)?',0,NULL,1,'2021-04-27 06:41:56','2021-04-27 06:41:56'),
(17,0,5,'Don Diego, Don Juan  and  Don Pedro were looking for an enchanted bird to cure Haring Fernando What was the name of the bird?',0,NULL,1,'2021-04-27 06:42:47','2021-04-27 06:42:47'),
(18,0,5,'Every two years ASEAN celebrates the SEA games, which among the following countries is the host of the 2019 SEA Games?',0,NULL,1,'2021-04-27 06:43:37','2021-04-27 06:43:37'),
(19,0,5,'Philippines has been active in the sports arena particularly the Olympics. Who was the first Filipino figure skater and the first Southeast Asian in the figure skating sport in the winter Olympics?',0,NULL,1,'2021-04-27 06:44:38','2021-04-27 06:44:38'),
(20,0,5,'The world is currently battling a pandemic known as Covid 19. Because of such, people practiced social distancing, wearing of mask and proper hand sanitation. Which among the following pandemics invented the quarantine method?',0,NULL,1,'2021-04-27 06:45:26','2021-04-27 06:45:26'),
(21,0,5,'Who is the father of Modern Economics?',0,NULL,1,'2021-04-27 06:46:58','2021-04-27 06:46:58'),
(22,0,5,'The different genders struggled to be recognized by the society at large, in order to have the recognition and equal rights, the LGBTQ+ community filed the SOGIE bill praying that it will soon become a law since it is more inclusive to all. What does SOGIE mean?',0,NULL,1,'2021-04-27 06:47:38','2021-04-27 06:47:38'),
(23,0,5,'During the year 2020, the first ever recorded case of Covid 19 is recoded in January. When was the first Philippine local lockdown implemented?',0,NULL,1,'2021-04-27 06:48:15','2021-04-27 06:48:15'),
(24,0,5,'It has been recorded since ancient times that human civilization-built walls in order to protect themselves and their community. According to the Guinness World Records, what is the longest wall in the world?',0,NULL,1,'2021-04-27 06:49:05','2021-04-27 06:49:05'),
(25,0,1,'What is the odd string of letters out?',0,NULL,1,'2021-04-28 01:37:35','2021-04-28 01:37:35'),
(26,0,1,'There is truth in the statement: There is no truth.',0,NULL,1,'2021-04-28 01:38:14','2021-04-28 01:38:14'),
(27,0,1,'Choose at least one name of animals found in the Arch of Moses.',0,NULL,1,'2021-04-28 01:38:58','2021-04-28 01:38:58'),
(28,0,1,'All bachelors are unmarried men. Juan is an unmarried man. Ergo, Juan is a bachelor.',0,NULL,1,'2021-04-28 01:41:14','2021-04-28 01:41:14'),
(29,0,1,'Point O, H, M, E are arranged in a line in such a way that H is between M and E, and O is between H and E. If H proceeds M, in what order are they arranged?',0,NULL,1,'2021-04-28 01:41:51','2021-04-28 01:41:51'),
(30,0,1,'All men are mortal. Givheart is a woman. Therefore, Givheart is not mortal. If the first two statements are true, the third statement is',0,NULL,1,'2021-04-28 01:43:24','2021-04-28 01:43:24'),
(31,0,1,'A cellphone is useful. Useful things are valuable. A cellphone is valuable.',0,NULL,1,'2021-04-28 01:48:19','2021-04-28 01:48:19'),
(32,0,1,'If it rains today, then the road is wet. The road is wet, yet it did not rain today. It follows that if the road is wet then it is caused by the rain.',0,NULL,1,'2021-04-28 01:50:03','2021-04-28 01:50:03'),
(33,0,1,'A college instructor in Governor Alfonso D. Tan College has six children. No one in the college has six children.',0,NULL,1,'2021-04-28 01:50:45','2021-04-28 01:50:45'),
(34,0,1,'Givheart puts on his socks before he puts on his shoes. He puts on his shirt before he puts on his jacket. Givheart puts on his shoes before he puts on his shirt. If the first two statements are true, the third statement is',0,NULL,1,'2021-04-28 01:54:21','2021-04-28 01:54:21'),
(35,0,1,'Three ball pens cost the same as two notebooks. Four notebooks cost the same as one pencil. Pencils are more expensive than books. If the first two statements are true, the third statement is',0,NULL,1,'2021-04-28 01:57:06','2021-04-28 01:57:06'),
(36,0,1,'A bucket of fried chicken contains more wings than breast. There are more thighs than wings. The bucket contains fewer thigh than breast ones. If the first two statements are true, the third statement is',0,NULL,1,'2021-04-28 01:59:19','2021-04-28 01:59:19'),
(37,0,1,'All the Sampaguita in Givheart’s garden are red. All the Carnations in Givheart’s garden are yellow. All the flowers in Givheart’s garden are either red or yellow. If the first two statements are true, the third statement is',0,NULL,1,'2021-04-28 02:13:30','2021-04-28 02:13:30'),
(38,0,1,'The history book has more pages from the poetry book, but fewer pages than the math book. The math book has more pages than the science book but fewer pages than the English book. The poetry book has the fewest pages. If the first two statements are true, the third is',0,NULL,1,'2021-04-28 02:14:05','2021-04-28 02:14:05'),
(39,0,1,'Subscribing to a YouTube channel is a luxury. All luxuries are needles expenditures. Having a Huawei tablet is not a luxury. Dining in a world class hotel is a needless expenditure. CONCLUSION:',0,NULL,1,'2021-04-28 02:17:37','2021-04-28 02:17:37'),
(40,0,1,'In a family, there are husband and wife, two daughters and two sons. All the boys were invited to a party. Both daughters went out to beach. The wife did not return from office. Who is at home?',0,NULL,1,'2021-04-28 02:18:30','2021-04-28 02:18:30'),
(41,0,1,'Five beautiful ladies are sitting in a row. S is sitting next to P but not T. K is sitting next to R who is sitting on the extreme left and T is not sitting next to K. Who are sitting adjacent to S?',0,NULL,1,'2021-04-28 02:19:23','2021-04-28 02:19:23'),
(42,0,1,'All chickens are birds.\nSome chickens are hens.\nFemale birds lay eggs.\nIf the first statement are facts, which of the following statements must also be a fact?\nI.	All birds lay eggs.\nII.	Hens are birds.\nIII.	Some chicken are not hens',0,NULL,1,'2021-04-28 02:20:25','2021-04-28 02:20:25');

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
(1,'ABSTRACT REASONING',NULL,NULL),
(2,'LOGICAL REASONING',NULL,NULL),
(3,'ENGLISH PROFICIENCY',NULL,NULL),
(4,'NUMERICAL REASONING',NULL,NULL),
(5,'GENERAL KNOWLEDGE',NULL,NULL);

/*Table structure for table `test_schedules` */

DROP TABLE IF EXISTS `test_schedules`;

CREATE TABLE `test_schedules` (
  `test_schedule_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `test_from` datetime NOT NULL,
  `test_to` datetime NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`test_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `test_schedules` */

insert  into `test_schedules`(`test_schedule_id`,`test_from`,`test_to`,`remark`,`active`,`created_at`,`updated_at`) values 
(1,'2021-04-29 15:50:10','2021-04-29 16:00:00','testing only',1,NULL,NULL);

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
