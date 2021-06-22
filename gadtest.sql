/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.7.33-0ubuntu0.16.04.1 : Database - gadtest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gadtest` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gadtest`;

/*Table structure for table `acad_years` */

DROP TABLE IF EXISTS `acad_years`;

CREATE TABLE `acad_years` (
  `acad_year_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acad_year_id`),
  UNIQUE KEY `acad_years_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `acad_years` */

insert  into `acad_years`(`acad_year_id`,`code`,`description`,`active`,`created_at`,`updated_at`) values 
(1,'202','ACADEMIC YEAR 2020-2021 2nd SEMESTER',0,NULL,NULL),
(2,'203','ACADEMIC YEAR 2020-2021 SUMMER',0,NULL,NULL),
(3,'211','ACADEMIC YEAR 2021-2022 1st SEMESTER',1,NULL,NULL);

/*Table structure for table `answer_sheets` */

DROP TABLE IF EXISTS `answer_sheets`;

CREATE TABLE `answer_sheets` (
  `answer_sheet_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `is_taken` tinyint(1) NOT NULL DEFAULT '0',
  `date_taken` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`answer_sheet_id`),
  KEY `answer_sheets_user_id_foreign` (`user_id`),
  CONSTRAINT `answer_sheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answer_sheets` */

insert  into `answer_sheets`(`answer_sheet_id`,`code`,`user_id`,`is_taken`,`date_taken`,`created_at`,`updated_at`) values 
(2,'211',8,1,'2021-06-21 00:00:00','2021-06-21 12:15:59','2021-06-21 12:15:59');

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
  CONSTRAINT `answers_answer_sheet_id_foreign` FOREIGN KEY (`answer_sheet_id`) REFERENCES `answer_sheets` (`answer_sheet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answers` */

insert  into `answers`(`answer_id`,`answer_sheet_id`,`option_id`,`created_at`,`updated_at`) values 
(4,2,83,NULL,NULL),
(5,2,86,NULL,NULL),
(6,2,135,NULL,NULL),
(7,2,161,NULL,NULL),
(8,2,173,NULL,NULL),
(9,2,74,NULL,NULL),
(10,2,408,NULL,NULL),
(11,2,298,NULL,NULL),
(12,2,356,NULL,NULL),
(13,2,291,NULL,NULL),
(14,2,319,NULL,NULL),
(15,2,1899,NULL,NULL),
(16,2,1979,NULL,NULL),
(17,2,1879,NULL,NULL),
(18,2,1895,NULL,NULL),
(19,2,1963,NULL,NULL),
(20,2,1938,NULL,NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `level_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `levels_level_unique` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `levels` */

insert  into `levels`(`level_id`,`level`,`created_at`,`updated_at`) values 
(1,'EASY',NULL,NULL),
(2,'AVERAGE',NULL,NULL),
(3,'DIFFICULT',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2021_04_12_074335_create_levels_table',1),
(5,'2021_04_13_045659_create_acad_years_table',1),
(6,'2021_04_13_053930_create_sections_table',1),
(7,'2021_04_13_054940_create_questions_table',1),
(8,'2021_04_13_061201_create_options_table',1),
(9,'2021_04_29_033333_create_answer_sheets_table',1),
(10,'2021_04_29_035026_create_test_schedules',1),
(11,'2021_04_29_071057_create_answers_table',1),
(12,'2021_06_04_114533_create_sessions_table',1);

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) unsigned NOT NULL,
  `letter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_img` tinyint(1) NOT NULL DEFAULT '0',
  `img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `options_question_id_foreign` (`question_id`),
  CONSTRAINT `options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3750 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `options` */

insert  into `options`(`option_id`,`question_id`,`letter`,`content`,`is_img`,`img_path`,`is_answer`,`created_at`,`updated_at`) values 
(25,49,'A','',1,'f7ee465313881b7f7b8fa0891f8695d8.png',0,NULL,'2021-06-09 20:21:48'),
(26,49,'B','',1,'545d7b0c9e14e979f09e723cd3c2ecac.png',1,NULL,'2021-06-09 20:21:48'),
(27,49,'C','',1,'a53f4b443b6849aa0822c71014a507dd.png',0,NULL,'2021-06-09 20:21:48'),
(28,49,'D','',1,'6687b2ab3de44dfc3d3f0210dc484ee6.png',0,NULL,'2021-06-09 20:21:48'),
(29,50,'A','',1,'9f48fabb2ec4d8c34c19229b35e513d7.png',1,NULL,'2021-06-09 20:24:42'),
(30,50,'B','',1,'d39a987b1387f337b27e58d4f1dbfdf6.png',0,NULL,'2021-06-09 20:24:42'),
(31,50,'C','',1,'bd43e8b7a7a1d3fc46542f1c43b53a34.png',0,NULL,'2021-06-09 20:24:42'),
(32,50,'D','',1,'0d1f655fe36d089af23cb59bcb7343c2.png',0,NULL,'2021-06-09 20:24:42'),
(45,54,'A','',1,'e3ca10e05dab4a3af76a6c26a81d6100.png',0,NULL,NULL),
(46,54,'B','',1,'2052f43ba86d2d811858afd9bb092ebf.png',0,NULL,NULL),
(47,54,'C','',1,'2d32d553624e7ff88080286aefef36b9.png',1,NULL,NULL),
(48,54,'D','',1,'051e97d05c2c5d8f83346055c6511228.png',0,NULL,NULL),
(49,55,'A','',1,'7b0689ae7b9aefb931f3a65b9b1c2a07.png',0,NULL,NULL),
(50,55,'B','',1,'14444794093ccd2fccd30951872dadc1.png',0,NULL,NULL),
(51,55,'C','',1,'35f362ecd2713ee8428414a52f47149d.png',0,NULL,NULL),
(52,55,'D','',1,'32e17ddf9aeae38fcb8057abc90e1f68.png',1,NULL,NULL),
(53,56,'A','',1,'3efe1f3b827664a8662607598d1ebc70.png',0,NULL,NULL),
(54,56,'B','',1,'fc1ac7e8373a945b9dc87575cc96ee03.png',0,NULL,NULL),
(55,56,'C','',1,'38d81589a208322ebff4f471368f73ed.png',0,NULL,NULL),
(56,56,'D','',1,'56aa141adf3d485d230f95ddd1cccf7c.png',1,NULL,NULL),
(57,57,'A','',1,'3e41cc4f58d1ba3b69cd4c39ab0a218b.png',0,NULL,NULL),
(58,57,'B','',1,'eac2eb8e5c36bb6bedcee40b97d24b47.png',1,NULL,NULL),
(59,57,'C','',1,'ddb3f34fb36c6adaf12f38c28bb48c27.png',0,NULL,NULL),
(60,57,'D','',1,'48d231b225980554fdb906c7a0dc6468.png',0,NULL,NULL),
(61,58,'A','',1,'ad3205b391385d784d543070037a0b94.png',1,NULL,NULL),
(62,58,'B','',1,'dd74e19add60f70f9eef5433a817549a.png',0,NULL,NULL),
(63,58,'C','',1,'2bb6775ea4fc55e05978d225045b1412.png',0,NULL,NULL),
(64,58,'D','',1,'d580eda89ce430d5d7b0c2e0bab1cd71.png',0,NULL,NULL),
(65,59,'A','',1,'86db830f427ec2b33e5f8325c9a29ae3.png',1,NULL,NULL),
(66,59,'B','',1,'e2fa7321765bbb45e35536f05e8de564.png',0,NULL,NULL),
(67,59,'C','',1,'05bde67ed6f08ea879ed2a52274fdd01.png',0,NULL,NULL),
(68,59,'D','',1,'906de456633f80f46f2de9373baa2053.png',0,NULL,NULL),
(69,60,'A','',1,'e65aadeda0db18642826060afbd8381c.png',0,NULL,NULL),
(70,60,'B','',1,'2db615f828c0dd896353fc6a383faa02.png',0,NULL,NULL),
(71,60,'C','',1,'500ef21a58686ae77b14c964e3c704f2.png',0,NULL,NULL),
(72,60,'D','',1,'e285c17d37de48091dd4d996a2bac93e.png',1,NULL,NULL),
(73,61,'A','',1,'372016b2618e43d5acfa9708f2c43616.png',0,NULL,NULL),
(74,61,'B','',1,'df75dedfab42de91b4ecb8c0fac6acb5.png',1,NULL,NULL),
(75,61,'C','',1,'6b5b755ead111ea1b30bb65458e09be6.png',0,NULL,NULL),
(76,61,'D','',1,'b8464478ad056791e7c6e76126bc3fa1.png',0,NULL,NULL),
(77,62,'A','',1,'59ab95d06c2193a3c2af480b3369b5c6.png',1,NULL,NULL),
(78,62,'B','',1,'f92ca9fa7250227adb9573c659e59d44.png',0,NULL,NULL),
(79,62,'C','',1,'ac99b3c0eaf3312a8087dd528392928f.png',0,NULL,NULL),
(80,62,'D','',1,'8732d103be176b3c4ff6f8b39d3733ff.png',0,NULL,NULL),
(81,63,'A','',1,'59ab95d06c2193a3c2af480b3369b5c6.png',1,NULL,NULL),
(82,63,'B','',1,'f92ca9fa7250227adb9573c659e59d44.png',0,NULL,NULL),
(83,63,'C','',1,'ac99b3c0eaf3312a8087dd528392928f.png',0,NULL,NULL),
(84,63,'D','',1,'8732d103be176b3c4ff6f8b39d3733ff.png',0,NULL,NULL),
(85,64,'A','',1,'3a48862d8fcc97ad17f9f109f0431b6d.png',0,NULL,'2021-06-09 22:26:26'),
(86,64,'B','',1,'7e0cd802a6d624635c2ff048ba1cc9ba.png',1,NULL,'2021-06-09 22:26:26'),
(87,64,'C','',1,'c63bb53777883cfde41c923f49efb7f2.png',0,NULL,'2021-06-09 22:26:26'),
(88,64,'D','',1,'76f2857a3aa89cb0699138d06dcc65c5.png',0,NULL,'2021-06-09 22:26:26'),
(89,65,'A','',1,'a6c301f31dcc7953840afc2d1284f2f8.png',1,NULL,NULL),
(90,65,'B','',1,'965b9b0c192c4ae29d3ddc690f23fa95.png',0,NULL,NULL),
(91,65,'C','',1,'609fe2904bbe543d4342a268126e560d.png',0,NULL,NULL),
(92,65,'D','',1,'13f93dc66576a536121c9c0466c86029.png',0,NULL,NULL),
(93,66,'A','',1,'cffae5e98438bd750c42b38a8479b1f5.png',1,NULL,NULL),
(94,66,'B','',1,'afe207fc880aabd6bfe8fbe472199ccf.png',0,NULL,NULL),
(95,66,'C','',1,'c2bd2a81eee14061891ec799dade3b9d.png',0,NULL,NULL),
(96,66,'D','',1,'f2bb2aa002646eb025f5ac39c4a69c1a.png',0,NULL,NULL),
(97,67,'A','',1,'7ceff18719c7ce75cebb8f4e6a8830e2.png',0,NULL,'2021-06-09 22:44:39'),
(98,67,'B','',1,'a2cf952e4504b9b1ca19d3c932f973a5.png',1,NULL,'2021-06-09 22:44:39'),
(99,67,'C','',1,'7c8c21e5d90e2784005fe1b2e1461f32.png',0,NULL,'2021-06-09 22:44:39'),
(100,67,'D','',1,'b2585c27da9828a066661c610c4a8832.png',0,NULL,'2021-06-09 22:44:39'),
(101,68,'A','',1,'c2e8016775b398ead4c75404b21d04a5.png',0,NULL,NULL),
(102,68,'B','',1,'c130a0cdd3f531ae9e00f5ace9e4f439.png',0,NULL,NULL),
(103,68,'C','',1,'0f8979ae95863da745797a1ac75b8537.png',1,NULL,NULL),
(104,68,'D','',1,'49526f47f8f5a09e61e2fcbd7147ca44.png',0,NULL,NULL),
(105,69,'A','',1,'8bb00139c8811435592876ddf306c046.png',0,NULL,NULL),
(106,69,'B','',1,'80536e98507c90a566e2f333cc90cd2c.png',0,NULL,NULL),
(107,69,'C','',1,'3d0dafcd2bc0eb13b04fafbbb5aba405.png',1,NULL,NULL),
(108,69,'D','',1,'3975f182b71acd5f13ef1379f7028a98.png',0,NULL,NULL),
(109,70,'A','',1,'8bb00139c8811435592876ddf306c046.png',0,NULL,NULL),
(110,70,'B','',1,'80536e98507c90a566e2f333cc90cd2c.png',0,NULL,NULL),
(111,70,'C','',1,'3d0dafcd2bc0eb13b04fafbbb5aba405.png',1,NULL,NULL),
(112,70,'D','',1,'3975f182b71acd5f13ef1379f7028a98.png',0,NULL,NULL),
(113,71,'A','',1,'9739837eb5b1a688c88509eb1673696a.png',0,NULL,NULL),
(114,71,'B','',1,'1807376284a791938013c548db0ed703.png',1,NULL,NULL),
(115,71,'C','',1,'9ae4988c1fd4c8f9b616a96423a10d15.png',0,NULL,NULL),
(116,71,'D','',1,'b7e7e58dee703dacf60602920c15f1e1.png',0,NULL,NULL),
(117,72,'A','',1,'5415cd1678e82560860958949d459d46.png',1,NULL,NULL),
(118,72,'B','',1,'dd82ab0bc5159a6918e7bb91abfd7b5a.png',0,NULL,NULL),
(119,72,'C','',1,'2030993baa579750789373045a2bc83d.png',0,NULL,NULL),
(120,72,'D','',1,'219085819967182ae00d7e8d92f9d06b.png',0,NULL,NULL),
(121,73,'A','',1,'5f08d4e6b0bfd6d2536967fab06fc149.png',0,NULL,NULL),
(122,73,'B','',1,'a744b61598bdb6c46c4452ed7a7eb8e2.png',1,NULL,NULL),
(123,73,'C','',1,'17d0166d8df7f46b61c06cc15960ed90.png',0,NULL,NULL),
(124,73,'D','',1,'1efb9263ee3261c9fc6052f5c8e29285.png',0,NULL,NULL),
(129,77,'A','',1,'e36c1769c139f6d18040fb116dd3ab4f.png',1,NULL,NULL),
(130,77,'B','',1,'cce6c7501bfe20c8a584eba15f40e7be.png',0,NULL,NULL),
(131,77,'C','',1,'8b39c5892baaaf72694a35233921ed7a.png',0,NULL,NULL),
(132,77,'D','',1,'7f642a7a21fd3e19b0954e069a04a70e.png',0,NULL,NULL),
(133,78,'A','',1,'95681aca30b1b623fd93e15a2fe6ed24.png',0,NULL,NULL),
(134,78,'B','',1,'82a3ddca5638ac59e6b632936b3b1c17.png',0,NULL,NULL),
(135,78,'C','',1,'3a30ae2d019196880d8d5227f44b10e6.png',1,NULL,NULL),
(136,78,'D','',1,'c96b87282f18d4de701b33452be87829.png',0,NULL,NULL),
(137,79,'A','',1,'95681aca30b1b623fd93e15a2fe6ed24.png',0,NULL,NULL),
(138,79,'B','',1,'82a3ddca5638ac59e6b632936b3b1c17.png',0,NULL,NULL),
(139,79,'C','',1,'3a30ae2d019196880d8d5227f44b10e6.png',1,NULL,NULL),
(140,79,'D','',1,'c96b87282f18d4de701b33452be87829.png',0,NULL,NULL),
(141,80,'A','',1,'21a6e0c959f10c36b82e4596ad233908.png',1,NULL,NULL),
(142,80,'B','',1,'cbce1388bf555d871642ff10cca7238a.png',0,NULL,NULL),
(143,80,'C','',1,'34dcdfc58073499dd43b5950104ccf1c.png',0,NULL,NULL),
(144,80,'D','',1,'0bfeef3241a663c8d5e00aadfadf1b91.png',0,NULL,NULL),
(145,81,'A','',1,'06cb747ea731266cd719eef90875aecc.png',1,NULL,NULL),
(146,81,'B','',1,'ae0e4c2f6eb409cdd9417adeba225770.png',0,NULL,NULL),
(147,81,'C','',1,'ff0adcb97315157df2b3d53af84f1bd4.png',0,NULL,NULL),
(148,81,'D','',1,'c8702057f22c92968f44cf72032d6274.png',0,NULL,NULL),
(149,82,'A','',1,'fd5aff97753d83420bcc19a30a12edc4.png',1,NULL,NULL),
(150,82,'B','',1,'c2a6571cc2af16522d2d19a4e5691a3d.png',0,NULL,NULL),
(151,82,'C','',1,'014cbf5b3cce96a5bfcefe234a24eb16.png',0,NULL,NULL),
(152,82,'D','',1,'1eb76d88f4c26e6d6ad89b1c49c4ce01.png',0,NULL,NULL),
(153,83,'A','',1,'e004b488fad69b108879f39dd7ed3dd5.png',0,NULL,NULL),
(154,83,'B','',1,'341ad4b4206cb192d76cbfe31155419a.png',0,NULL,NULL),
(155,83,'C','',1,'42b9484ea945f8da9b757e2115063f48.png',0,NULL,NULL),
(156,83,'D','',1,'d1987b0e0bf071b44ba8cc193d2a4af0.png',1,NULL,NULL),
(157,84,'A','',1,'ed9455ac40fb3c1f1849d4364028429f.png',0,NULL,NULL),
(158,84,'B','',1,'4ef12da908e793a3bd897e48105387b0.png',1,NULL,NULL),
(159,84,'C','',1,'6b241c1d2212bb1bc87419ac71f0816f.png',0,NULL,NULL),
(160,84,'D','',1,'cba9601f1b5ff3d3e31c35e14e424e73.png',0,NULL,NULL),
(161,85,'A','',1,'1c22fd688e885dbcb1fc74f9ca7d4764.jpg',1,NULL,NULL),
(162,85,'B','',1,'0e7da68f14900be5e55095ba151a7a45.jpg',0,NULL,NULL),
(163,85,'C','',1,'e33ec0911e433bc64db57f2ff1741506.jpg',0,NULL,NULL),
(164,85,'D','',1,'ce312a95bbe09bb2bbd8e3ef37663c53.jpg',0,NULL,NULL),
(165,86,'A','',1,'a44db3de5bf77a1471cad8f33e3991cb.jpg',1,NULL,NULL),
(166,86,'B','',1,'61c41849995083e1db078d3f8c3570c5.jpg',0,NULL,NULL),
(167,86,'C','',1,'d8dfbc38b83e744355e788fcd9eb8dde.jpg',0,NULL,NULL),
(168,86,'D','',1,'3eff10c4ba1180ae24b2e50544d78971.jpg',0,NULL,NULL),
(169,87,'A','',1,'056a9825afb0057ed9f7d7ca07b1c1a5.jpg',1,NULL,NULL),
(170,87,'B','',1,'e0d45ad80aa6ba60acbc82c0d763bf35.jpg',0,NULL,NULL),
(171,87,'C','',1,'167e9f5f6da79ce26c5ddfb87ac4b419.jpg',0,NULL,NULL),
(172,87,'D','',1,'7ad64682a249eb80a5998ab309acac78.jpg',0,NULL,NULL),
(173,88,'A','',1,'25db0787bf91399d71616fbceb30cdc0.jpg',0,NULL,NULL),
(174,88,'B','',1,'695ab05774cfed4753d3213ac2817203.jpg',0,NULL,NULL),
(175,88,'C','',1,'43e60ed3129f113bce68b3ebd9db1708.jpg',1,NULL,NULL),
(176,88,'D','',1,'ccae66e3304a2ca53c882c9c6e7191e2.jpg',0,NULL,NULL),
(177,89,'A','',1,'fa03da88c7a6721766b17d918edd2159.jpg',1,NULL,NULL),
(178,89,'B','',1,'e38095342391072e3b60d0f520170d45.jpg',0,NULL,NULL),
(179,89,'C','',1,'e07d1fdca34c6e9821256f8104eb108d.jpg',0,NULL,NULL),
(180,89,'D','',1,'551c0ad6509bd20d1bcc5e6cce7995ed.jpg',0,NULL,NULL),
(181,90,'A','',1,'fa03da88c7a6721766b17d918edd2159.jpg',1,NULL,NULL),
(182,90,'B','',1,'e38095342391072e3b60d0f520170d45.jpg',0,NULL,NULL),
(183,90,'C','',1,'e07d1fdca34c6e9821256f8104eb108d.jpg',0,NULL,NULL),
(184,90,'D','',1,'551c0ad6509bd20d1bcc5e6cce7995ed.jpg',0,NULL,NULL),
(185,91,'A','',1,'1c6465cb858d47a3c0e2d0d90bf8e3f4.jpg',0,NULL,NULL),
(186,91,'B','',1,'c7a36b04e50093e68dd8acc682529b00.jpg',0,NULL,NULL),
(187,91,'C','',1,'8e361af9e8ab05c7cde1619fa715c1c3.jpg',0,NULL,NULL),
(188,91,'D','',1,'619452be98aa7e4cc079faa840897cac.jpg',1,NULL,NULL),
(189,92,'A','The Freedom Constitution',0,'',0,NULL,NULL),
(190,92,'B','The 1971 Philippine constitution',0,'',0,NULL,NULL),
(191,92,'C','The 1987 Philippine Constitution',0,'',1,NULL,NULL),
(192,92,'D','The Revolutionary Freedom Constitution',0,'',0,NULL,NULL),
(193,93,'A','Cesar Virata',0,'',1,NULL,NULL),
(194,93,'B','Pedro Paterno',0,'',0,NULL,NULL),
(195,93,'C','Ferdinand Marcos',0,'',0,NULL,NULL),
(196,93,'D','Salvador Laurel',0,'',0,NULL,NULL),
(197,94,'A','Cesar Virata',0,'',1,NULL,NULL),
(198,94,'B','Pedro Paterno',0,'',0,NULL,NULL),
(199,94,'C','Ferdinand Marcos',0,'',0,NULL,NULL),
(200,94,'D','Salvador Laurel',0,'',0,NULL,NULL),
(201,95,'A','Twenty-two-dash line map',0,NULL,0,NULL,'2021-06-10 00:07:38'),
(202,95,'B','200 nautical miles from China’s shoreline',0,NULL,0,NULL,'2021-06-10 00:07:38'),
(203,95,'C','Nine-dash-line map',0,NULL,1,NULL,'2021-06-10 00:07:38'),
(204,95,'D','100 nautical miles from the shoreline',0,NULL,0,NULL,'2021-06-10 00:07:38'),
(213,98,'A','Life, property, equal protection',0,'',1,NULL,NULL),
(214,98,'B','Equal protection, liberty, Property',0,'',0,NULL,NULL),
(215,98,'C','Internet, food, security',0,'',0,NULL,NULL),
(216,98,'D','Life, ability, equality',0,'',0,NULL,NULL),
(217,99,'A','Jane Adams',0,NULL,0,NULL,'2021-06-17 13:25:03'),
(218,99,'B','Marie Curie',0,NULL,1,NULL,'2021-06-17 13:25:04'),
(219,99,'C','Aung San Suu Kyi',0,NULL,0,NULL,'2021-06-17 13:25:04'),
(220,99,'D','Mother Theresa',0,NULL,0,NULL,'2021-06-17 13:25:04'),
(221,100,'A','The nucleus',0,'',0,NULL,NULL),
(222,100,'B','Golgi Aparatus',0,'',0,NULL,NULL),
(223,100,'C','Mitochondria',0,'',1,NULL,NULL),
(224,100,'D','Celluloid',0,'',0,NULL,NULL),
(225,101,'A','The United Nations',0,'',1,NULL,NULL),
(226,101,'B','World Government',0,'',0,NULL,NULL),
(227,101,'C','The Union Jack',0,'',0,NULL,NULL),
(228,101,'D','League of Nations',0,'',0,NULL,NULL),
(229,102,'A','H2o2',0,'',0,NULL,NULL),
(230,102,'B','NaCl',0,'',1,NULL,NULL),
(231,102,'C','NaHCO3',0,'',0,NULL,NULL),
(232,102,'D','NaOH',0,'',0,NULL,NULL),
(233,103,'A','Earth',0,'',0,NULL,NULL),
(234,103,'B','Uranus',0,'',0,NULL,NULL),
(235,103,'C','Jupiter',0,'',0,NULL,NULL),
(236,103,'D','Pluto',0,'',1,NULL,NULL),
(237,104,'A','Crocodile',0,'',0,NULL,NULL),
(238,104,'B','Chicken',0,'',1,NULL,NULL),
(239,104,'C','Komodo Dragon',0,'',0,NULL,NULL),
(240,104,'D','Gila Monster',0,'',0,NULL,NULL),
(241,105,'A','Ibong Adarna',0,'',1,NULL,NULL),
(242,105,'B','Sarimanok',0,'',0,NULL,NULL),
(243,105,'C','Phoenix',0,'',0,NULL,NULL),
(244,105,'D','Wakwak',0,'',0,NULL,NULL),
(245,106,'A','Indonesia',0,'',0,NULL,NULL),
(246,106,'B','Japan',0,'',0,NULL,NULL),
(247,106,'C','Philippines',0,'',1,NULL,NULL),
(248,106,'D','Amestris',0,'',0,NULL,NULL),
(249,107,'A','Michael Martinez',0,'',1,NULL,NULL),
(250,107,'B','Julian Makaraeg',0,'',0,NULL,NULL),
(251,107,'C','Paeng Nepomuceno',0,'',0,NULL,NULL),
(252,107,'D','Hidilyn Dian',0,'',0,NULL,NULL),
(253,108,'A','Spanish Flu',0,'',0,NULL,NULL),
(254,108,'B','The Great Plague of London',0,'',0,NULL,NULL),
(255,108,'C','The Black Death',0,'',1,NULL,NULL),
(256,108,'D','Apocalypse Virus',0,'',0,NULL,NULL),
(257,109,'A','Carl Marx',0,'',0,NULL,NULL),
(258,109,'B','Adam Smith',0,'',1,NULL,NULL),
(259,109,'C','Edward Elric',0,'',0,NULL,NULL),
(260,109,'D','Aristotle',0,'',0,NULL,NULL),
(261,110,'A','Sexual Orientation, Gender Identity and Expression',0,'',1,NULL,NULL),
(262,110,'B','Sexual Organization, Gender Inclusivity and Equality',0,'',0,NULL,NULL),
(263,110,'C','Sense Of Gratitude In Expression',0,'',0,NULL,NULL),
(264,110,'D','Severe Grunt against Injustice in Earth',0,'',0,NULL,NULL),
(265,111,'A','March 13, 2020',0,'',0,NULL,NULL),
(266,111,'B','March 15, 2020',0,'',1,NULL,NULL),
(267,111,'C','March 30, 2020',0,'',0,NULL,NULL),
(268,111,'D','March 20, 2020',0,'',0,NULL,NULL),
(269,112,'A','Wall Maria',0,'',0,NULL,NULL),
(270,112,'B','The iron curtain of USSR',0,'',0,NULL,NULL),
(271,112,'C','Great Wall of China',0,'',1,NULL,NULL),
(272,112,'D','Trump Wall',0,'',0,NULL,NULL),
(273,113,'A','Rules',0,'',0,NULL,NULL),
(274,113,'B','Administration',0,'',0,NULL,NULL),
(275,113,'C','Law',0,'',1,NULL,NULL),
(276,113,'D','Criminal Law',0,'',0,NULL,NULL),
(277,114,'A','National Rights',0,'',0,NULL,NULL),
(278,114,'B','Human Rights',0,'',1,NULL,NULL),
(279,114,'C','Women’s Rights',0,'',0,NULL,NULL),
(280,114,'D','Men’s Rights',0,'',0,NULL,NULL),
(281,115,'A','fire',0,'',1,NULL,NULL),
(282,115,'B','conflagration',0,'',0,NULL,NULL),
(283,115,'C','arson',0,'',0,NULL,NULL),
(284,115,'D','destruction',0,'',0,NULL,NULL),
(285,116,'A','',1,'2e495426a400766c40a4440879026ec3.png',0,NULL,NULL),
(286,116,'B','',1,'99e13ac9ac75e2ae275952f22d54a9a9.png',0,NULL,NULL),
(287,116,'C','',1,'aed35e1cf1bf89ac691d4dff295b6cc8.png',0,NULL,NULL),
(288,116,'D','',1,'94370de167fe0c2a2213687204611bd0.png',1,NULL,NULL),
(289,117,'A','',1,'e7f1bcce722cb7e502942cc1b082f711.png',0,NULL,NULL),
(290,117,'B','',1,'805defa2b7fd8682f0dd971e8656d7e3.png',1,NULL,NULL),
(291,117,'C','',1,'a5ea94e4e240cbc66b0aec3c2756ffea.png',0,NULL,NULL),
(292,117,'D','',1,'ffee74dc50c5ff0606cfb8061884d513.png',0,NULL,NULL),
(293,118,'A','',1,'c1102d6a5337e12a963203f327bbd903.png',0,NULL,NULL),
(294,118,'B','',1,'870d78fd46107696a0d62e04e90b33c4.png',0,NULL,NULL),
(295,118,'C','',1,'5e62b6e8eb9d8f9eb19c9dd84a2ece77.png',0,NULL,NULL),
(296,118,'D','',1,'22384e573ec420c9233dca27cd4a8d6c.png',1,NULL,NULL),
(297,119,'A','',1,'45512385f5ef3fc16e985f9d62ffd951.png',0,NULL,NULL),
(298,119,'B','',1,'988755d05abe344b491ab8a58d5f4e74.png',0,NULL,NULL),
(299,119,'C','',1,'b3d41a07289157da7ab3174ef2f8c2fb.png',0,NULL,NULL),
(300,119,'D','',1,'a2b6c4981a623a9dabb18b1b7aa38207.png',1,NULL,NULL),
(301,120,'A','',1,'2f07ef4cab69b903320bce10a0065390.png',1,NULL,NULL),
(302,120,'B','',1,'cffea0b5a07410da9bfa11cb6e5d687e.png',0,NULL,NULL),
(303,120,'C','',1,'f4d0e682f5e3bb8451a7990ffa54fcb7.png',0,NULL,NULL),
(304,120,'D','',1,'577b940600a347947ba389138d84f028.png',0,NULL,NULL),
(305,121,'A','',1,'456c6bfd9f6f0d0ab6b8b0fb07275b19.png',0,NULL,NULL),
(306,121,'B','',1,'3b78c6bcb9887b75358e5118dfbb2a06.png',0,NULL,NULL),
(307,121,'C','',1,'7e1f58ebde301e100b9e66cf1cd0f3a7.png',1,NULL,NULL),
(308,121,'D','',1,'61c05cad8a1e15546d595966a3b01487.png',0,NULL,NULL),
(309,122,'A','',1,'fe0af894a0794a0a70860e5ea5d9bdf2.png',0,NULL,NULL),
(310,122,'B','',1,'0aa051b86adc39c47c239f4993a468ff.png',0,NULL,NULL),
(311,122,'C','',1,'e9ece78aa075f92134d3cb016e473f7b.png',0,NULL,NULL),
(312,122,'D','',1,'9f8a4d0a17be72f85c5feff88aa9fd80.png',1,NULL,NULL),
(313,123,'A','',1,'04f19c49b1d8f9e99a9e8922306df65b.png',0,NULL,NULL),
(314,123,'B','',1,'f5f1fc14ed7d7b5086cf5845757b8229.png',0,NULL,NULL),
(315,123,'C','',1,'69e3d58acd65f83f2e618ddb1a6bd549.png',1,NULL,NULL),
(316,123,'D','',1,'5299845124129bbac9fddd7d215c0086.png',0,NULL,NULL),
(317,124,'A','',1,'b18f836d30834c8437fbe64e8de2c936.png',0,NULL,NULL),
(318,124,'B','',1,'af8c6fcb133698caf50df3b89fc9d385.png',0,NULL,NULL),
(319,124,'C','',1,'67bf6282f2733c625e1eee61e7b8c7c5.png',1,NULL,NULL),
(320,124,'D','',1,'77b18797497942c191358fd8c73acba3.png',0,NULL,NULL),
(321,125,'A','',1,'747e119e6ac397af9ef9a6d741e448ce.png',1,NULL,NULL),
(322,125,'B','',1,'9384d4e047b1445ae43c09c3fc5005a3.png',0,NULL,NULL),
(323,125,'C','',1,'7070a89c26e122a05fea199def9438ba.png',0,NULL,NULL),
(324,125,'D','',1,'912c05d86337cb43f4e3f8091d02875e.png',0,NULL,NULL),
(325,125,'E','',1,'498451d24e86eab22cf2e7bd9424d189.png',0,NULL,NULL),
(326,126,'A','',1,'41518c5088d9ec382c8a54a6bbe13dc4.png',1,NULL,NULL),
(327,126,'B','',1,'b912ce71b3f03c059c93113abb853770.png',0,NULL,NULL),
(328,126,'C','',1,'98753c726d2f2dc7459ef5f1e8229d80.png',0,NULL,NULL),
(329,126,'D','',1,'31f8848179f55186e95c9441c31389de.png',0,NULL,NULL),
(330,126,'E','',1,'ce4aa90b34f648a1b5b9e182e95a2440.png',0,NULL,NULL),
(331,127,'A','',1,'48aa12bb1fd64140a3297cffce847462.png',0,NULL,NULL),
(332,127,'B','',1,'3135929d0d8e9be3358f736455ccf7e5.png',0,NULL,NULL),
(333,127,'C','',1,'ee033f1d07a110bcfd0b96591429ebc5.png',0,NULL,NULL),
(334,127,'D','',1,'756b105a66caad55c227c3277f66a706.png',1,NULL,NULL),
(335,129,'A','',1,'064daaa178a517dc9f0b498b33626b38.png',0,NULL,NULL),
(336,129,'B','',1,'c0477b1f7152c25bdc3ef0c6d4e1d1e2.png',0,NULL,NULL),
(337,129,'C','',1,'d2cfd90ddfbcc8f16209d9548e398906.png',1,NULL,NULL),
(338,129,'D','',1,'e3cd29bb24e20cba6778cbe2c1023228.png',0,NULL,NULL),
(343,131,'A','',1,'61c3c33addbfe42f05e600ce8e476876.png',0,NULL,NULL),
(344,131,'B','',1,'9d29b5222c36a00acb24caa0438b5b41.png',0,NULL,NULL),
(345,131,'C','',1,'cefc68d7c1119a96ff19972d046c7014.png',0,NULL,NULL),
(346,131,'D','',1,'8f80e8fda69b45b7eec89c645561b4a5.png',1,NULL,NULL),
(347,132,'A','',1,'a73db4642e1539ad989ff3b3835c4f3e.png',0,NULL,NULL),
(348,132,'B','',1,'0890cb2edfde5c73ae05f8e342c99af4.png',1,NULL,NULL),
(349,132,'C','',1,'cebd31644aa24898c8d8c75256060bd8.png',0,NULL,NULL),
(350,132,'D','',1,'ad92f4f42ab347c79701336b0a8845c5.png',0,NULL,NULL),
(351,133,'A','',1,'f2c56d70c68062f8453e10f32699d7e8.png',0,NULL,NULL),
(352,133,'B','',1,'8aed23e7a7ce5547afcd21119d4f5778.png',0,NULL,NULL),
(353,133,'C','',1,'229294d08d30aa76ad3d5f448c989974.png',1,NULL,NULL),
(354,133,'D','',1,'9479eafe80d014b1381f1adce7ad88ea.png',0,NULL,NULL),
(355,134,'A','',1,'e760476092873190119e5984aaa295e3.png',1,NULL,NULL),
(356,134,'B','',1,'4c54eb057596d5d3229b5953bc8d719d.png',0,NULL,NULL),
(357,134,'C','',1,'f40bb1463ec95ce63564bf7033f6a5a5.png',0,NULL,NULL),
(358,134,'D','',1,'e8e5f8c184a4ecee940882f2f24f78d9.png',0,NULL,NULL),
(367,137,'A','',1,'ca33a0e25f62b71039f908660ce43cd0.png',0,NULL,NULL),
(368,137,'B','',1,'2d8f14b7b6d4728478ce6e2bc1377f88.png',1,NULL,NULL),
(369,137,'C','',1,'9b3985c775d82dd6ad9c650c0ae45213.png',0,NULL,NULL),
(370,137,'D','',1,'c552e889eea9ef7d463beee877ceef28.png',0,NULL,NULL),
(371,137,'E','',1,'b6049d1b9cc48c85d8f8f6707298524e.png',0,NULL,NULL),
(372,138,'A','',1,'eef32a85e8709552c99c764a19c62652.png',0,NULL,NULL),
(373,138,'B','',1,'971905b0d2a50d17d919161ae2466e34.png',0,NULL,NULL),
(374,138,'C','',1,'02163d775cba269d3e231b1108f57bed.png',0,NULL,NULL),
(375,138,'D','',1,'36e92775af45a8f7fb09873bb87173a6.png',1,NULL,NULL),
(376,139,'A','',1,'1d5be938a588c854a8c08c76c1212095.png',1,NULL,NULL),
(377,139,'B','',1,'4bfd5623948d42f01b896a560139af5b.png',0,NULL,NULL),
(378,139,'C','',1,'da619de63aa15b5c36f4f1a28122305e.png',0,NULL,NULL),
(379,139,'D','',1,'5de5adc27d60effa3b69711aec002538.png',0,NULL,NULL),
(380,140,'A','',1,'7f41ed137ec1d8eff6009cb061ae2163.png',1,NULL,NULL),
(381,140,'B','',1,'335b649b91861234510d307dd98233ed.png',0,NULL,NULL),
(382,140,'C','',1,'c1f61c9279506efe370fecaa52a700b0.png',0,NULL,NULL),
(383,140,'D','',1,'ac72a2750e8184c8a7926dd84e5dfb74.png',0,NULL,NULL),
(384,141,'A','',1,'4085a1a8b4f3f9c1eb46c75e487e09c5.png',0,NULL,NULL),
(385,141,'B','',1,'0de18a41f30cb0a2c268ecf23edeeab3.png',1,NULL,NULL),
(386,141,'C','',1,'eceaddc8c1658642dea50c5ff8c0555c.png',0,NULL,NULL),
(387,141,'D','',1,'5b449d545e0ac4339e5e9eb91d72db7d.png',0,NULL,NULL),
(388,142,'A','',1,'9de0bc0a4268bca3f467b1b26ff43d5a.png',0,NULL,NULL),
(389,142,'B','',1,'0d943e9f295766414a4533c34cbcb275.png',0,NULL,NULL),
(390,142,'C','',1,'d6977ef69fcfc2ea986c758a0b15985f.png',0,NULL,NULL),
(391,142,'D','',1,'1153765745fce26ba7cee8fe59d89396.png',0,NULL,NULL),
(392,142,'E','',1,'6d4ffd2cd09bf01c2781eecacfb37d58.png',1,NULL,NULL),
(393,143,'A','',1,'28d872b826273eacba99822c82a7a596.png',0,NULL,NULL),
(394,143,'B','',1,'13fe8d540a1a46f0393d7f5d52bcb2f9.png',1,NULL,NULL),
(395,143,'C','',1,'c3cb0d235caec11630e150ac24d74a85.png',0,NULL,NULL),
(396,143,'D','',1,'76ef83c5995195093f224e4bd59e06df.png',0,NULL,NULL),
(397,144,'A','',1,'fec20fa63988331c5329f05fc051a678.png',0,NULL,'2021-06-10 03:50:21'),
(398,144,'B','',1,'73362009e45211ccfc3b2f538c545041.png',0,NULL,'2021-06-10 03:50:21'),
(399,144,'C','',1,'dd30af6fb76791b39744125d07cc4dcc.png',1,NULL,'2021-06-10 03:50:21'),
(400,144,'D','',1,'9847d94c534523e80b460392c58d6f7b.png',0,NULL,'2021-06-10 03:50:21'),
(401,145,'A','',1,'cc82b37e5b3f0a57a4226aa62c318b66.png',0,NULL,NULL),
(402,145,'B','',1,'75c47a1bf8f68c517d0123ec5ed4d4ae.png',0,NULL,NULL),
(403,145,'C','',1,'b0681a1b28acdd6807b7c1e9963d732f.png',1,NULL,NULL),
(404,145,'D','',1,'bb394df080fc0fbe145c25517063c76e.png',0,NULL,NULL),
(405,145,'E','',1,'a180e35d9569f23c607cf8e6c251edab.png',0,NULL,NULL),
(406,146,'A','',1,'7aebe6e3267f16599b30084e76d2c35f.png',0,NULL,NULL),
(407,146,'B','',1,'9544693d16d2832df2be5c9f5f900f2f.png',0,NULL,NULL),
(408,146,'C','',1,'c5d8c4d6849c28c58836bcbc77cf805b.png',1,NULL,NULL),
(409,146,'D','',1,'c2b0281e940be34117e0d97943d93c20.png',0,NULL,NULL),
(410,146,'E','',1,'be298954199e24a70d469c54aa3f6882.png',0,NULL,NULL),
(411,147,'A','',1,'36ff4ede2fadb4de906d830bd18b9f48.png',0,NULL,NULL),
(412,147,'B','',1,'0733e00d39fe296d51746bc63150c389.png',0,NULL,NULL),
(413,147,'C','',1,'f8ed28f3f7f33e8dacb6e3416626b78c.png',0,NULL,NULL),
(414,147,'D','',1,'8e65a33c4b563b92cf0d90f4f5998c9d.png',0,NULL,NULL),
(415,147,'E','',1,'2ce265c1423f6ce7bf9b6c7553ceb3f0.png',1,NULL,NULL),
(416,148,'A','',1,'82125eaf4ad3609e1953f2c2047346e4.png',0,NULL,NULL),
(417,148,'B','',1,'208299181b586a4e92a3c5a00fbed9dd.png',0,NULL,NULL),
(418,148,'C','',1,'eff241b97a4de0fac4f7b2d4b2efcf06.png',0,NULL,NULL),
(419,148,'D','',1,'08c2ead474cb37a70a15cc762830843f.png',1,NULL,NULL),
(420,149,'A','',1,'dcf50079fbc7868393aad71fbc55826a.png',0,NULL,NULL),
(421,149,'B','',1,'c245def9b00a81a7953214ce3904a58c.png',0,NULL,NULL),
(422,149,'C','',1,'8f5278c7020a389e1aaf1e8f5562e70c.png',0,NULL,NULL),
(423,149,'D','',1,'f8c731ce968fa7f0973dba3222acdb0d.png',1,NULL,NULL),
(424,150,'A','',1,'2545cc8117f97a9b10581c4304a78ce0.png',0,NULL,NULL),
(425,150,'B','',1,'ff7782d0c8b00295e50b6fa20dd1a844.png',0,NULL,NULL),
(426,150,'C','',1,'8f57397d237348fb6a81fba57bdea190.png',1,NULL,NULL),
(427,150,'D','',1,'49c4548af05b193d346618888702fa90.png',0,NULL,NULL),
(428,151,'A','',1,'809bc38baa93c30e00bd60a44297c12d.png',0,NULL,NULL),
(429,151,'B','',1,'fea63cd0eb669ff28e2e535f3e150c17.png',1,NULL,NULL),
(430,151,'C','',1,'7bcacd1a1e983292d2ffc4c6220391cf.png',0,NULL,NULL),
(431,151,'D','',1,'9cff65ef2f6586a45afca4f62a383ab7.png',0,NULL,NULL),
(432,152,'A','',1,'c57e49ccd949c021a9505c5680a575d1.png',1,NULL,NULL),
(433,152,'B','',1,'75f8abaa232a24b7312a6bc3ea4ed7c2.png',0,NULL,NULL),
(434,152,'C','',1,'97d1b39f79726969a10c37c7de6e134e.png',0,NULL,NULL),
(435,152,'D','',1,'18c89ccd8ce0b5891e3f2fd1681984a3.png',0,NULL,NULL),
(436,153,'A','',1,'04625afcd9af5560e7f009c4e7c324bc.png',0,NULL,NULL),
(437,153,'B','',1,'b91ebbf8917476cb055eb45e2bdc1d26.png',0,NULL,NULL),
(438,153,'C','',1,'9fb1ebe2ee7c330ac615588fb3c1752b.png',0,NULL,NULL),
(439,153,'D','',1,'f20e1f14aab3e7e3d7f9eaa3607be05a.png',1,NULL,NULL),
(440,154,'A','',1,'fe7b7b14627c87a69a74b688e7ebbe19.png',0,NULL,NULL),
(441,154,'B','',1,'6ecf0817ea92742b69ab3cff9d811ada.png',1,NULL,NULL),
(442,154,'C','',1,'94f199f5c1e47c24f880b18f5a6e9cbb.png',0,NULL,NULL),
(443,154,'D','',1,'0363ca0a6b1e6b81a6df15e0585d2e0c.png',0,NULL,NULL),
(444,155,'A','Brakes',0,'',0,NULL,NULL),
(445,155,'B','Plate',0,'',0,NULL,NULL),
(446,155,'C','Drivers license',0,'',1,NULL,NULL),
(447,155,'D','No traffic seminar',0,'',0,NULL,NULL),
(448,156,'A','coke',0,'',0,NULL,NULL),
(449,156,'B','shabu',0,'',1,NULL,NULL),
(450,156,'C','marijuana',0,'',0,NULL,NULL),
(451,156,'D','All of the above',0,'',0,NULL,NULL),
(452,157,'A','Belt',0,'',0,NULL,NULL),
(453,157,'B','Seat Belt',0,'',1,NULL,NULL),
(454,157,'C','Accident Belt',0,'',0,NULL,NULL),
(455,157,'D','All of the above',0,'',0,NULL,NULL),
(456,158,'A','Conclusion',0,'',0,NULL,NULL),
(457,158,'B','Fact',0,'',1,NULL,NULL),
(458,158,'C','Hearsay',0,'',0,NULL,NULL),
(459,158,'D','All of the above',0,'',0,NULL,NULL),
(460,159,'A','Globalization',0,'',1,NULL,NULL),
(461,159,'B','Nationalization',0,'',0,NULL,NULL),
(462,159,'C','Asia is for Asians',0,'',0,NULL,NULL),
(463,159,'D','Black lives Matter',0,'',0,NULL,NULL),
(464,160,'A','Value',0,'',0,NULL,NULL),
(465,160,'B','Hue',0,'',0,NULL,NULL),
(466,160,'C','Texture',0,'',1,NULL,NULL),
(467,160,'D','Intensity',0,'',0,NULL,NULL),
(468,161,'A','Juan Luna',0,'',0,NULL,NULL),
(469,161,'B','Fernando Amorsolo',0,'',0,NULL,NULL),
(470,161,'C','Guillermo Tolentino',0,'',1,NULL,NULL),
(471,161,'D','Damian Domingo y Gabor',0,'',0,NULL,NULL),
(472,162,'A','Sculpture',0,'',0,NULL,NULL),
(473,162,'B','Painting',0,'',0,NULL,NULL),
(474,162,'C','Cinema',0,'',0,NULL,NULL),
(475,162,'D','All of the above',0,'',1,NULL,NULL),
(476,163,'A','Political Governance',0,NULL,0,NULL,'2021-06-14 20:59:39'),
(477,163,'B','Administrative governance',0,NULL,0,NULL,'2021-06-14 20:59:39'),
(478,163,'C','Both A and D',0,NULL,0,NULL,'2021-06-14 20:59:39'),
(479,163,'D','Ecological Governance',0,NULL,1,NULL,'2021-06-14 20:59:39'),
(480,164,'A','People',0,NULL,0,NULL,'2021-06-14 21:00:10'),
(481,164,'B','Territory',0,NULL,0,NULL,'2021-06-14 21:00:10'),
(482,164,'C','Sovereignty',0,NULL,1,NULL,'2021-06-14 21:00:10'),
(483,164,'D','All of the above',0,NULL,0,NULL,'2021-06-14 21:00:10'),
(484,165,'A','Niccolo Machiavelli',0,'',1,NULL,NULL),
(485,165,'B','Aristotle',0,'',0,NULL,NULL),
(486,165,'C','Plato',0,'',0,NULL,NULL),
(487,165,'D','Thomas Hobbes',0,'',0,NULL,NULL),
(488,166,'A','Rodrigo Duterte',0,'',0,NULL,NULL),
(489,166,'B','Rene Descartes',0,'',1,NULL,NULL),
(490,166,'C','Adolf Hitler',0,'',0,NULL,NULL),
(491,166,'D','None of the Above',0,'',0,NULL,NULL),
(492,167,'A','Sirena Deep',0,'',0,NULL,NULL),
(493,167,'B','Mariana Trench',0,'',0,NULL,NULL),
(494,167,'C','Challenger Deep',0,'',1,NULL,NULL),
(495,167,'D','Aconcagua',0,'',0,NULL,NULL),
(496,168,'A','Hydroponics',0,'',0,NULL,NULL),
(497,168,'B','Hydrologic Cycle',0,'',1,NULL,NULL),
(498,168,'C','Aquaponics',0,'',0,NULL,NULL),
(499,168,'D','Water bending',0,'',0,NULL,NULL),
(500,169,'A','Achilles Arms',0,'',0,NULL,NULL),
(501,169,'B','Achilles Heel',0,'',1,NULL,NULL),
(502,169,'C','Achilles Abs',0,'',0,NULL,NULL),
(503,169,'D','Achilles Muscles',0,'',0,NULL,NULL),
(504,170,'A','Mapulon',0,'',0,NULL,NULL),
(505,170,'B','Magwayen',0,'',1,NULL,NULL),
(506,170,'C','Megeyen',0,'',0,NULL,NULL),
(507,170,'D','Bantayan',0,'',0,NULL,NULL),
(508,171,'A','Naga',0,NULL,0,NULL,'2021-06-14 21:00:59'),
(509,171,'B','Bakunawa',0,NULL,1,NULL,'2021-06-14 21:00:59'),
(510,171,'C','Apolaki',0,NULL,0,NULL,'2021-06-14 21:00:59'),
(511,171,'D','Anitun Tabu',0,NULL,0,NULL,'2021-06-14 21:00:59'),
(512,172,'A','Juru Pakal',0,NULL,1,NULL,'2021-06-14 21:00:51'),
(513,172,'B','Sina Sak',0,NULL,0,NULL,'2021-06-14 21:00:51'),
(514,172,'C','Tagud',0,NULL,0,NULL,'2021-06-14 21:00:51'),
(515,172,'D','Bita',0,NULL,0,NULL,'2021-06-14 21:00:51'),
(516,173,'A','Tarabusaw, killed by Sulayman because of exhaustion.',0,NULL,0,NULL,'2021-06-14 21:00:29'),
(517,173,'B','Kurita, who was cut into pieces.',0,NULL,0,NULL,'2021-06-14 21:00:29'),
(518,173,'C','Dreadful bird, killed by Indarapatra',0,NULL,0,NULL,'2021-06-14 21:00:29'),
(519,173,'D','Pah, whose wings was cut off',0,NULL,1,NULL,'2021-06-14 21:00:29'),
(520,174,'A','Pablo',0,NULL,0,NULL,'2021-06-14 21:00:41'),
(521,174,'B','Yolanda',0,NULL,0,NULL,'2021-06-14 21:00:41'),
(522,174,'C','Haiyan',0,NULL,0,NULL,'2021-06-14 21:00:41'),
(523,174,'D','Both b and c',0,NULL,1,NULL,'2021-06-14 21:00:41'),
(524,175,'A','Thinking at the Margin Principle',0,NULL,0,NULL,'2021-06-14 21:00:17'),
(525,175,'B','Cost vs. Benefits Principle',0,NULL,1,NULL,'2021-06-14 21:00:17'),
(526,175,'C','Scarcity Forces Trade-off Principle',0,NULL,0,NULL,'2021-06-14 21:00:17'),
(527,175,'D','Future Consequences Count Principle',0,NULL,0,NULL,'2021-06-14 21:00:17'),
(528,176,'A','Household needs',0,'',0,NULL,NULL),
(529,176,'B','Scarcity',0,'',1,NULL,NULL),
(530,176,'C','Human greed',0,'',0,NULL,NULL),
(531,176,'D','Governmental Regulations',0,'',0,NULL,NULL),
(532,177,'A','Google Search',0,'',1,NULL,NULL),
(533,177,'B','Bing',0,'',0,NULL,NULL),
(534,177,'C','Yahoo',0,'',0,NULL,NULL),
(535,177,'D','Music Charts',0,'',0,NULL,NULL),
(536,178,'A','Avoidant Personality Disorder',0,'',0,NULL,NULL),
(537,178,'B','Borderline Personality Disorder',0,'',0,NULL,NULL),
(538,178,'C','Narcissistic Personality Disorder',0,'',1,NULL,NULL),
(539,178,'D','Paranoid Personality Disorder',0,'',0,NULL,NULL),
(540,179,'A','Cell regeneration',0,'',0,NULL,NULL),
(541,179,'B','Photosynthesis',0,'',1,NULL,NULL),
(542,179,'C','Oxidation',0,'',0,NULL,NULL),
(543,179,'D','Oxygenation',0,'',0,NULL,NULL),
(544,180,'A','Quark',0,'',0,NULL,NULL),
(545,180,'B','Polaris',0,'',1,NULL,NULL),
(546,180,'C','Rigil',0,'',0,NULL,NULL),
(547,180,'D','Articuno',0,'',0,NULL,NULL),
(548,181,'A','Susanoo',0,'',0,NULL,NULL),
(549,181,'B','Tsukuyomi',0,'',0,NULL,NULL),
(550,181,'C','Amaterasu',0,'',1,NULL,NULL),
(551,181,'D','Bahamut',0,'',0,NULL,NULL),
(552,182,'A','Mary Shelley',0,'',1,NULL,NULL),
(553,182,'B','Sherlock Holmes',0,'',0,NULL,NULL),
(554,182,'C','J.K. Rowling',0,'',0,NULL,NULL),
(555,182,'D','Robert Frost',0,'',0,NULL,NULL),
(556,183,'A','4 only',0,'',0,NULL,NULL),
(557,183,'B','',1,'13fcea42537bb33aaa10beb1d426928f.png',1,NULL,NULL),
(558,183,'C','-4 & 4 only',0,'',0,NULL,NULL),
(559,183,'D','any real number',0,'',0,NULL,NULL),
(560,184,'A','Frankenstein',0,'',0,NULL,NULL),
(561,184,'B','Igor',0,'',0,NULL,NULL),
(562,184,'C','Alphonse Frankenstein',0,'',0,NULL,NULL),
(563,184,'D','None of the above',0,'',1,NULL,NULL),
(564,185,'A','Quezon City',0,'',1,NULL,NULL),
(565,185,'B','Duterte City',0,'',0,NULL,NULL),
(566,185,'C','Aquino District',0,'',0,NULL,NULL),
(567,185,'D','Araneta',0,'',0,NULL,NULL),
(568,186,'A','',1,'b6ad38b80b296a3b9697b710172d96f2.png',0,NULL,NULL),
(569,186,'B','',1,'f01a172b982882fdcb50a8edc7fb9a4a.png',0,NULL,NULL),
(570,186,'C','',1,'8e15e62c74ad034c82a25e4cc3ff9853.png',1,NULL,NULL),
(571,186,'D','',1,'d7e62967bac2cb785d297586ab01eeba.png',0,NULL,NULL),
(572,187,'A','1',0,'',0,NULL,NULL),
(573,187,'B','0,4',0,'',1,NULL,NULL),
(574,187,'C','1 or 2',0,'',0,NULL,NULL),
(575,187,'D','',1,'64141786485181a9f4c0d72852732e87.png',0,NULL,NULL),
(576,188,'A','Hiraya - 1',0,'',0,NULL,NULL),
(577,188,'B','Hiwaga - 1',0,'',0,NULL,NULL),
(578,188,'C','Malaya-1',0,'',0,NULL,NULL),
(579,188,'D','Diwata-1',0,'',1,NULL,NULL),
(580,189,'A','11',0,'',0,NULL,NULL),
(581,189,'B','26',0,'',0,NULL,NULL),
(582,189,'C','34',0,'',1,NULL,NULL),
(583,189,'D','37',0,'',0,NULL,NULL),
(584,190,'A','5',0,'',0,NULL,NULL),
(585,190,'B','6',0,'',1,NULL,NULL),
(586,190,'C','10',0,'',0,NULL,NULL),
(587,190,'D','14',0,'',0,NULL,NULL),
(588,191,'A','Bagani',0,'',0,NULL,NULL),
(589,191,'B','Spirits',0,'',0,NULL,NULL),
(590,191,'C','Amaya',0,'',1,NULL,NULL),
(591,191,'D','Mulawin',0,'',0,NULL,NULL),
(592,192,'A','SB19',0,'',1,NULL,NULL),
(593,192,'B','Parokya ni Edgar',0,'',0,NULL,NULL),
(594,192,'C','Shanti Dope',0,'',0,NULL,NULL),
(595,192,'D','Izmil',0,'',0,NULL,NULL),
(596,193,'A','',1,'56dcfd521040bc4d8a5b58f6e6ef6e4a.png',0,NULL,NULL),
(597,193,'B','',1,'fa3d00a346971b7d44c84249203181bf.png',1,NULL,NULL),
(598,193,'C','',1,'e5f3de237a081398366311d3ad1b5ac7.png',0,NULL,NULL),
(599,193,'D','',1,'d48474299fe01293862605c00f8704ca.png',0,NULL,NULL),
(600,194,'A','7',0,'',0,NULL,NULL),
(601,194,'B','10',0,'',1,NULL,NULL),
(602,194,'C','35',0,'',0,NULL,NULL),
(603,194,'D','560',0,'',0,NULL,NULL),
(604,195,'A','Lea Salonga',0,'',1,NULL,NULL),
(605,195,'B','Sarah Geronimo',0,'',0,NULL,NULL),
(606,195,'C','Regine Velasquez',0,'',0,NULL,NULL),
(607,195,'D','Moira dela Torre',0,'',0,NULL,NULL),
(608,196,'A','16',0,'',0,NULL,NULL),
(609,196,'B','64',0,'',0,NULL,NULL),
(610,196,'C','256',0,'',1,NULL,NULL),
(611,196,'D','512',0,'',0,NULL,NULL),
(612,197,'A','Ang babaeng nahulog sa septik tank',0,'',0,NULL,NULL),
(613,197,'B','Hello, Love, Goodbye',0,'',1,NULL,NULL),
(614,197,'C','Milan',0,'',0,NULL,NULL),
(615,197,'D','The How’s of Us',0,'',0,NULL,NULL),
(616,198,'A','7',0,'',0,NULL,NULL),
(617,198,'B','8',0,'',0,NULL,NULL),
(618,198,'C','9',0,'',1,NULL,NULL),
(619,198,'D','10',0,'',0,NULL,NULL),
(620,199,'A','Captain America',0,'',0,NULL,NULL),
(621,199,'B','Dr. Strange',0,'',0,NULL,NULL),
(622,199,'C','Hawkeye',0,'',0,NULL,NULL),
(623,199,'D','Iron Man',0,'',1,NULL,NULL),
(624,200,'A','Tesseract',0,'',0,NULL,NULL),
(625,200,'B','Mjolnir',0,'',1,NULL,NULL),
(626,200,'C','Eye of Agamoto',0,'',0,NULL,NULL),
(627,200,'D','Eye of Agamoto',0,'',0,NULL,NULL),
(628,201,'A','',1,'883ce638b7dc62b9f8f9f7dacd7defcb.png',1,NULL,NULL),
(629,201,'B','',1,'4d46dbcaabde9478b3ee854ceb6e7865.png',0,NULL,NULL),
(630,201,'C','',1,'f31e547b05e4a20dafb416da7a25a09f.png',0,NULL,NULL),
(631,201,'D','',1,'c162d6da0040c11c49a3c5a95c532547.png',0,NULL,NULL),
(632,202,'A','Super Mario',0,'',0,NULL,NULL),
(633,202,'B','Mobile Legends',0,'',0,NULL,NULL),
(634,202,'C','Pong',0,'',1,NULL,NULL),
(635,202,'D','Tetris',0,'',0,NULL,NULL),
(636,203,'A','',1,'0864bf4b698991611d6cf924050cddd5.png',1,NULL,NULL),
(637,203,'B','',1,'4d6f7ebac73af595a140aa311b794b3f.png',0,NULL,NULL),
(638,203,'C','',1,'93e61d793f580725a5055f40197eade9.png',0,NULL,NULL),
(639,203,'D','',1,'58c0cee98f491b515262d5ef4d6e7b80.png',0,NULL,NULL),
(640,204,'A','Paquito',0,'',0,NULL,NULL),
(641,204,'B','Lapu-Lapu',0,'',1,NULL,NULL),
(642,204,'C','Aldous',0,'',0,NULL,NULL),
(643,204,'D','Miya',0,'',0,NULL,NULL),
(644,205,'A','0 only',0,'',0,NULL,NULL),
(645,205,'B','1 only',0,'',0,NULL,NULL),
(646,205,'C','3 only',0,'',0,NULL,NULL),
(647,205,'D','-1 and -3 only',0,'',1,NULL,NULL),
(648,206,'A','Adolf Hitler',0,'',1,NULL,NULL),
(649,206,'B','Benito Mussolini',0,'',0,NULL,NULL),
(650,206,'C','Anne Frank',0,'',0,NULL,NULL),
(651,206,'D','Germano',0,'',0,NULL,NULL),
(652,207,'A','0 and 1',0,'',0,NULL,NULL),
(653,207,'B','1 and 2',0,'',0,NULL,NULL),
(654,207,'C','2 and 3',0,'',1,NULL,NULL),
(655,207,'D','64 and 256',0,'',0,NULL,NULL),
(656,208,'A','16',0,'',1,NULL,NULL),
(657,208,'B','16ab',0,'',0,NULL,NULL),
(658,208,'C','18',0,'',0,NULL,NULL),
(659,208,'D','4',0,'',0,NULL,NULL),
(660,209,'A','Catriona Gray',0,'',0,NULL,NULL),
(661,209,'B','Jam Magno',0,'',0,NULL,NULL),
(662,209,'C','Rabiya Mateo',0,'',1,NULL,NULL),
(663,209,'D','Pia Wurtzbach',0,'',0,NULL,NULL),
(664,210,'A','144',0,'',0,NULL,NULL),
(665,210,'B','160',0,'',1,NULL,NULL),
(666,210,'C','168',0,'',0,NULL,NULL),
(667,210,'D','176',0,'',0,NULL,NULL),
(668,211,'A','5',0,'',0,NULL,NULL),
(669,211,'B','6',0,'',1,NULL,NULL),
(670,211,'C','7',0,'',0,NULL,NULL),
(671,211,'D','8',0,'',0,NULL,NULL),
(672,212,'A','Injection',0,'',0,NULL,NULL),
(673,212,'B','Catheter',0,'',0,NULL,NULL),
(674,212,'C','Isolation',0,'',0,NULL,NULL),
(675,212,'D','Vaccine',0,'',1,NULL,NULL),
(676,213,'A','16',0,'',0,NULL,NULL),
(677,213,'B','4π',0,'',1,NULL,NULL),
(678,213,'C','8π',0,'',0,NULL,NULL),
(679,213,'D','16π',0,'',0,NULL,NULL),
(680,214,'A','Plato',0,'',0,NULL,NULL),
(681,214,'B','Polybius',0,'',0,NULL,NULL),
(682,214,'C','Aristotle',0,'',1,NULL,NULL),
(683,214,'D','Plutarch',0,'',0,NULL,NULL),
(684,215,'A','I only',0,'',0,NULL,NULL),
(685,215,'B','II only',0,'',1,NULL,NULL),
(686,215,'C','III only',0,'',0,NULL,NULL),
(687,215,'D','I and III only',0,'',0,NULL,NULL),
(688,216,'A','Flexible learning',0,'',1,NULL,NULL),
(689,216,'B','Online learning',0,'',0,NULL,NULL),
(690,216,'C','Modular learning',0,'',0,NULL,NULL),
(691,216,'D','Face to face learning',0,'',0,NULL,NULL),
(692,217,'A','8π',0,'',0,NULL,NULL),
(693,217,'B','16π',0,'',1,NULL,NULL),
(694,217,'C','18π',0,'',0,NULL,NULL),
(695,217,'D','24π',0,'',0,NULL,NULL),
(696,218,'A','Mobile Legends',0,'',0,NULL,NULL),
(697,218,'B','Spacewar',0,'',1,NULL,NULL),
(698,218,'C','DOTA',0,'',0,NULL,NULL),
(699,218,'D','Tetris',0,'',0,NULL,NULL),
(700,219,'A','Immunity form suit',0,'',0,NULL,NULL),
(701,219,'B','Immunity form suit',0,'',0,NULL,NULL),
(702,219,'C','Immunity form suit',0,'',0,NULL,NULL),
(703,219,'D','Intergenerational Responsibility',0,'',1,NULL,NULL),
(704,220,'A','Trese',0,'',1,NULL,NULL),
(705,220,'B','Rizal',0,'',0,NULL,NULL),
(706,220,'C','Darna',0,'',0,NULL,NULL),
(707,220,'D','Ang Panday',0,'',0,NULL,NULL),
(708,221,'A','Black',0,'',0,NULL,NULL),
(709,221,'B','International orange',0,'',1,NULL,NULL),
(710,221,'C','Midnight Black',0,'',0,NULL,NULL),
(711,221,'D','Bright Pink',0,'',0,NULL,NULL),
(712,222,'A','Philippines',0,'',0,NULL,NULL),
(713,222,'B','India',0,'',0,NULL,NULL),
(714,222,'C','Bhutan',0,'',1,NULL,NULL),
(715,222,'D','Kosovo',0,'',0,NULL,NULL),
(716,223,'A','Capsaicin',0,'',1,NULL,NULL),
(717,223,'B','Acetic Acid',0,'',0,NULL,NULL),
(718,223,'C','Calcium Oxide',0,'',0,NULL,NULL),
(719,223,'D','Ammonia',0,'',0,NULL,NULL),
(720,224,'A','Rodrigo Roa Duterte',0,'',1,NULL,NULL),
(721,224,'B','Digong Real Duterte',0,'',0,NULL,NULL),
(722,224,'C','Benigno Simeon Coangco Aquino',0,'',0,NULL,NULL),
(723,224,'D','Noynoy Aquino',0,'',0,NULL,NULL),
(724,225,'A','Cisgender',0,'',0,NULL,NULL),
(725,225,'B','Bisexual',0,'',0,NULL,NULL),
(726,225,'C','Demisexual',0,'',1,NULL,NULL),
(727,225,'D','Pansexual',0,'',0,NULL,NULL),
(728,226,'A','Left of the observer as one enters the room',0,'',1,NULL,NULL),
(729,226,'B','Left of the observer as one enters the room',0,'',0,NULL,NULL),
(730,226,'C','Center line as the observer enters the room',0,'',0,NULL,NULL),
(731,226,'D','Right from the last flag or logo displayed',0,'',0,NULL,NULL),
(732,227,'A','Kahil',0,'',0,NULL,NULL),
(733,227,'B','Lunhaw',0,'',1,NULL,NULL),
(734,227,'C','Bughaw',0,'',0,NULL,NULL),
(735,227,'D','Limba',0,'',0,NULL,NULL),
(736,228,'A','Kahimtang',0,'',1,NULL,NULL),
(737,228,'B','Kahimoot',0,'',0,NULL,NULL),
(738,228,'C','Kalikopan',0,'',0,NULL,NULL),
(739,228,'D','Kalihukan',0,'',0,NULL,NULL),
(740,229,'A','8',0,'',1,NULL,NULL),
(741,229,'B','9',0,'',0,NULL,NULL),
(742,229,'C','28',0,'',0,NULL,NULL),
(743,229,'D','64',0,'',0,NULL,NULL),
(744,230,'A','Presidential Spokesperson',0,'',0,NULL,NULL),
(745,230,'B','Presidential Aide',0,'',0,NULL,NULL),
(746,230,'C','President of the Senate',0,'',1,NULL,NULL),
(747,230,'D','Supreme Court Justice',0,'',0,NULL,NULL),
(748,231,'A','844',0,'',0,NULL,NULL),
(749,231,'B','448',0,'',1,NULL,NULL),
(750,231,'C','484',0,'',0,NULL,NULL),
(751,231,'D','682',0,'',0,NULL,NULL),
(752,232,'A','Equal protection of Laws',0,NULL,0,NULL,'2021-06-14 21:01:34'),
(753,232,'B','Freedom to Associate',0,NULL,0,NULL,'2021-06-14 21:01:34'),
(754,232,'C','Due process',0,NULL,1,NULL,'2021-06-14 21:01:34'),
(755,232,'D','Right to Remain silent',0,NULL,0,NULL,'2021-06-14 21:01:34'),
(756,233,'A','Commission on Audit',0,'',0,NULL,NULL),
(757,233,'B','Legislative Branch',0,'',1,NULL,NULL),
(758,233,'C','Executive Branch',0,'',0,NULL,NULL),
(759,233,'D','The Supreme Court',0,'',0,NULL,NULL),
(764,235,'A','Yes, it is one of the tactics used by the government in order to deter crime.',0,'',0,NULL,NULL),
(765,235,'B','No, only the President can order extra judicial killings.',0,'',0,NULL,NULL),
(766,235,'C','No, the constitution prohibits extra judicial killings since it violates due process.',0,'',1,NULL,NULL),
(767,235,'D','Yes, when criminality has become so rampant the government may resort to extra judicial killings.',0,'',0,NULL,NULL),
(768,236,'A','Super Junior',0,'',1,NULL,NULL),
(769,236,'B','BTS',0,'',0,NULL,NULL),
(770,236,'C','Big Bang',0,'',0,NULL,NULL),
(771,236,'D','Girls Generation',0,'',0,NULL,NULL),
(772,237,'A','Kahil',0,'',0,NULL,NULL),
(773,237,'B','Lunhaw',0,'',0,NULL,NULL),
(774,237,'C','Bughaw',0,'',0,NULL,NULL),
(775,237,'D','Limba',0,'',1,NULL,NULL),
(776,238,'A','Kahil',0,'',1,NULL,NULL),
(777,238,'B','Lunhaw',0,'',0,NULL,NULL),
(778,238,'C','Dalandan',0,'',0,NULL,NULL),
(779,238,'D','Limba',0,'',0,NULL,NULL),
(780,239,'A','Kulay',0,'',0,NULL,NULL),
(781,239,'B','Kolor',0,'',0,NULL,NULL),
(782,239,'C','Bulok',0,'',1,NULL,NULL),
(783,239,'D','Dekolor',0,'',0,NULL,NULL),
(784,240,'A','Abo',0,'',1,NULL,NULL),
(785,240,'B','Puti-on',0,'',0,NULL,NULL),
(786,240,'C','Habo',0,'',0,NULL,NULL),
(787,240,'D','All of the above',0,'',0,NULL,NULL),
(788,241,'A','Emilio',0,'',0,NULL,NULL),
(789,241,'B','Basilio',0,'',0,NULL,NULL),
(790,241,'C','Aurelio',0,'',1,NULL,NULL),
(791,241,'D','Gemino',0,'',0,NULL,NULL),
(792,242,'A','Larry Ramos, Jr.',0,'',1,NULL,NULL),
(793,242,'B','BTS',0,'',0,NULL,NULL),
(794,242,'C','Jhett Tolentino',0,'',0,NULL,NULL),
(795,242,'D','H.E.R.',0,'',0,NULL,NULL),
(796,243,'A','Men',0,'',0,NULL,NULL),
(797,243,'B','Women',0,'',0,NULL,NULL),
(798,243,'C','None of the following',0,'',1,NULL,NULL),
(799,243,'D','All of the above',0,'',0,NULL,NULL),
(800,244,'A','4',0,'',0,NULL,NULL),
(801,244,'B','5',0,'',1,NULL,NULL),
(802,244,'C','6',0,'',0,NULL,NULL),
(803,244,'D','10',0,'',0,NULL,NULL),
(804,245,'A','Sharing and asking of pornographic scandals',0,NULL,0,NULL,'2021-06-14 21:02:30'),
(805,245,'B','Posting of fake news of your neighbors',0,NULL,0,NULL,'2021-06-14 21:02:30'),
(806,245,'C','Bullying people or mentioning people in your posts that would result to shame in the community.',0,NULL,0,NULL,'2021-06-14 21:02:30'),
(807,245,'D','Mentioning criminals on your post and calling out their deeds.',0,NULL,1,NULL,'2021-06-14 21:02:30'),
(808,246,'A','I only',0,'',0,NULL,NULL),
(809,246,'B','II only',0,'',0,NULL,NULL),
(810,246,'C','III only',0,'',0,NULL,NULL),
(811,246,'D','I and III only',0,'',1,NULL,NULL),
(812,247,'A','Separatist Feminism',0,'',0,NULL,NULL),
(813,247,'B','Feminism',0,'',1,NULL,NULL),
(814,247,'C','Anarcho-Feminism',0,'',0,NULL,NULL),
(815,247,'D','Womanism',0,'',0,NULL,NULL),
(816,248,'A','3 years',0,'',0,NULL,NULL),
(817,248,'B','5 years',0,'',0,NULL,NULL),
(818,248,'C','6 years',0,'',1,NULL,NULL),
(819,248,'D','12 years',0,'',0,NULL,NULL),
(820,249,'A','I only',0,'',0,NULL,NULL),
(821,249,'B','II only',0,'',0,NULL,NULL),
(822,249,'C','III only',0,'',0,NULL,NULL),
(823,249,'D','none of these',0,'',1,NULL,NULL),
(824,250,'A','3 years',0,'',1,NULL,NULL),
(825,250,'B','5 years',0,'',0,NULL,NULL),
(826,250,'C','6 years',0,'',0,NULL,NULL),
(827,250,'D','12 years',0,'',0,NULL,NULL),
(828,251,'A','I only',0,'',0,NULL,NULL),
(829,251,'B','II only',0,'',0,NULL,NULL),
(830,251,'C','III only',0,'',0,NULL,NULL),
(831,251,'D','II & III only',0,'',1,NULL,NULL),
(832,252,'A','Lands and buildings in general',0,'',1,NULL,NULL),
(833,252,'B','Churches and convents',0,'',0,NULL,NULL),
(834,252,'C','Charitable institutions',0,'',0,NULL,NULL),
(835,252,'D','Non-profit cemeteries',0,'',0,NULL,NULL),
(836,253,'A','a function',0,'',0,NULL,NULL),
(837,253,'B','a function, but not a relation',0,'',0,NULL,NULL),
(838,253,'C','a relation, but not a function',0,'',1,NULL,NULL),
(839,253,'D','neither a function nor a relation',0,'',0,NULL,NULL),
(840,254,'A','Those fathers or mothers are citizens of the Philippines',0,'',0,NULL,NULL),
(841,254,'B','hose who are born before January 17, 1973, of Filipino mothers, who elect Philippine citizenship upon reaching the age of majority',0,'',0,NULL,NULL),
(842,254,'C','Those who are naturalized citizens of the Philippines in accordance with law.',0,'',0,NULL,NULL),
(843,254,'D','All of the above are true.',0,'',1,NULL,NULL),
(844,255,'A','House of Blue Ribbon Committee',0,'',0,NULL,NULL),
(845,255,'B','House of Representatives',0,'',1,NULL,NULL),
(846,255,'C','House of the Senate',0,'',0,NULL,NULL),
(847,255,'D','House of Red Ribbon Cabinet',0,'',0,NULL,NULL),
(848,256,'A','',1,'021d3dd7139c15a8b0d08c178888eb90.png',1,NULL,NULL),
(849,256,'B','',1,'51ed4865ea0cd2d21dc926b4ab779eec.png',0,NULL,NULL),
(850,256,'C','',1,'2bbf5dba465389a1479ba7213e9aa017.png',0,NULL,NULL),
(851,256,'D','2',0,'',0,NULL,NULL),
(852,257,'A','Department of Health',0,NULL,0,NULL,'2021-06-14 21:02:45'),
(853,257,'B','World Health Organization',0,NULL,1,NULL,'2021-06-14 21:02:45'),
(854,257,'C','International Health Organization',0,NULL,0,NULL,'2021-06-14 21:02:45'),
(855,257,'D','UN MHARS',0,NULL,0,NULL,'2021-06-14 21:02:45'),
(856,258,'A','{5}',0,'',0,NULL,NULL),
(857,258,'B','{12}',0,'',0,NULL,NULL),
(858,258,'C','{5, 12}',0,'',1,NULL,NULL),
(859,258,'D','{-5, 12}',0,'',0,NULL,NULL),
(860,259,'A','Cybercrime',0,'',0,NULL,NULL),
(861,259,'B','Cybersquatting',0,'',0,NULL,NULL),
(862,259,'C','Cybercrime Prevention Act',0,'',1,NULL,NULL),
(863,259,'D','Cyber Identity Theft Act',0,'',0,NULL,NULL),
(864,260,'A','Universal Serial Bus',0,'',1,NULL,NULL),
(865,260,'B','United Saudi Bus',0,'',0,NULL,NULL),
(866,260,'C','Universal Studious Bar',0,'',0,NULL,NULL),
(867,260,'D','United Security Breach',0,'',0,NULL,NULL),
(868,261,'A','',1,'97dabb25998fbc7608de041cf923555c.png',1,NULL,NULL),
(869,261,'B','',1,'108bcd849b69f19aaee43e4e5ee328a5.png',0,NULL,NULL),
(870,261,'C','',1,'a675a12068c945fa40857ad2ae2f8a90.png',0,NULL,NULL),
(871,261,'D','',1,'7f1554b24f5a689c5f1a51236761d3c3.png',0,NULL,NULL),
(872,262,'A','10',0,'',0,NULL,NULL),
(873,262,'B','21',0,'',1,NULL,NULL),
(874,262,'C','63',0,'',0,NULL,NULL),
(875,262,'D','105',0,'',0,NULL,NULL),
(876,263,'A','Warrantless search after the arrest of a person who stabbed another using a knife',0,'',0,NULL,NULL),
(877,263,'B','An ordinary checkpoint wherein the trunk of a car or utility box of a motor vehicle is requested to be opened without a search warrant.',0,'',1,NULL,NULL),
(878,263,'C','Stopping and frisking a suspicious individual after a bombing incident, without search warrant.',0,'',0,NULL,NULL),
(879,263,'D','Opening and checking Balik Bayan boxes at the Bureau of Customs.',0,'',0,NULL,NULL),
(880,264,'A','Panguil Bay Bridge',0,'',0,NULL,NULL),
(881,264,'B','Marcelo B. Fernan Bridge',0,'',0,NULL,NULL),
(882,264,'C','San Juanico Bridge',0,'',1,NULL,NULL),
(883,264,'D','Cebu-Cordova Link Expressway (CCLEX)',0,'',0,NULL,NULL),
(884,265,'A','Valor',0,'',1,NULL,NULL),
(885,265,'B','War',0,'',0,NULL,NULL),
(886,265,'C','Peace',0,'',0,NULL,NULL),
(887,265,'D','Self-determination',0,'',0,NULL,NULL),
(888,266,'A','Mount Apo',0,'',0,NULL,NULL),
(889,266,'B','Mount Pinatubo',0,'',0,NULL,NULL),
(890,266,'C','Mount Mayon',0,'',1,NULL,NULL),
(891,266,'D','Mount Taal',0,'',0,NULL,NULL),
(896,268,'A','Samar',0,'',0,NULL,NULL),
(897,268,'B','Negros',0,'',0,NULL,NULL),
(898,268,'C','Luzon',0,'',1,NULL,NULL),
(899,268,'D','Mindanao',0,'',0,NULL,NULL),
(900,269,'A','Vigan',0,'',0,NULL,NULL),
(901,269,'B','Cebu',0,'',1,NULL,NULL),
(902,269,'C','Butuan',0,'',0,NULL,NULL),
(903,269,'D','Manila',0,'',0,NULL,NULL),
(904,270,'A','ARMM',0,'',0,NULL,NULL),
(905,270,'B','CAR',0,'',0,NULL,NULL),
(906,270,'C','NCR',0,'',1,NULL,NULL),
(907,270,'D','Negros Island Region',0,'',0,NULL,NULL),
(908,271,'A','Emilio Jacinto',0,'',0,NULL,NULL),
(909,271,'B','Jose Rizal',0,'',0,NULL,NULL),
(910,271,'C','Apolinario Mabini',0,'',0,NULL,NULL),
(911,271,'D','Andres Bonifacio',0,'',1,NULL,NULL),
(912,272,'A','Luis Taruk',0,'',0,NULL,NULL),
(913,272,'B','Benigno Ramos',0,'',1,NULL,NULL),
(914,272,'C','Artemio Ricarte',0,'',0,NULL,NULL),
(915,272,'D','Agapito Illustrisimo',0,'',0,NULL,NULL),
(916,273,'A','Ferdinand Magellan',0,'',0,NULL,NULL),
(917,273,'B','Miguel Lopez de Lagaspi',0,'',0,NULL,NULL),
(918,273,'C','Ruy Lopez de Villalubuz',0,'',0,NULL,NULL),
(919,273,'D','King Philip II',0,'',1,NULL,NULL),
(920,274,'A','Emilio Aguinaldo',0,'',1,NULL,NULL),
(921,274,'B','Andres Bonifacio',0,'',0,NULL,NULL),
(922,274,'C','Apolinario Mabini',0,'',0,NULL,NULL),
(923,274,'D','Manuel L. Quezon',0,'',0,NULL,NULL),
(924,275,'A','Andres Bonifacio',0,'',0,NULL,NULL),
(925,275,'B','Francisco Dagohoy',0,'',1,NULL,NULL),
(926,275,'C','Antonio Luna',0,'',0,NULL,NULL),
(927,275,'D','Gregorio del Pilar',0,'',0,NULL,NULL),
(928,276,'A','Jose Rizal',0,'',1,NULL,NULL),
(929,276,'B','Andres Bonifacio',0,'',0,NULL,NULL),
(930,276,'C','Apolinario Mabini',0,'',0,NULL,NULL),
(931,276,'D','Gregorio del Pilar',0,'',0,NULL,NULL),
(932,277,'A','June 1981',0,'',0,NULL,NULL),
(933,277,'B','June 1991',0,'',1,NULL,NULL),
(934,277,'C','June 1971',0,'',0,NULL,NULL),
(935,277,'D','June 1961',0,'',0,NULL,NULL),
(936,278,'A','300',0,'',0,NULL,NULL),
(937,278,'B','320',0,'',0,NULL,NULL),
(938,278,'C','333',0,'',1,NULL,NULL),
(939,278,'D','500',0,'',0,NULL,NULL),
(940,279,'A','June 12',0,'',0,NULL,NULL),
(941,279,'B','February 26',0,'',0,NULL,NULL),
(942,279,'C','April 9',0,'',1,NULL,NULL),
(943,279,'D','November 30',0,'',0,NULL,NULL),
(944,280,'A','The Katipuneros are not prepared for armed revolution',0,'',0,NULL,NULL),
(945,280,'B','There is no support from the wealthy Filipinos',0,'',0,NULL,NULL),
(946,280,'C','There is no foreign power behind them',0,'',0,NULL,NULL),
(947,280,'D','The Katipuneros are young and no experience in combat',0,'',1,NULL,NULL),
(948,281,'A','Laguna',0,'',0,NULL,NULL),
(949,281,'B','Bataan',0,'',1,NULL,NULL),
(950,281,'C','Pampanga',0,'',0,NULL,NULL),
(951,281,'D','Manila',0,'',0,NULL,NULL),
(952,282,'A','Bataan',0,'',0,NULL,NULL),
(953,282,'B','Cebu',0,'',0,NULL,NULL),
(954,282,'C','Manila',0,'',0,NULL,NULL),
(955,282,'D','Corregidor',0,'',1,NULL,NULL),
(956,283,'A','1940',0,'',0,NULL,NULL),
(957,283,'B','1941',0,'',1,NULL,NULL),
(958,283,'C','1942',0,'',0,NULL,NULL),
(959,283,'D','1943',0,'',0,NULL,NULL),
(960,284,'A','Civil',0,'',0,NULL,NULL),
(961,284,'B','Military',0,'',0,NULL,NULL),
(962,284,'C','Commonwealth',0,'',1,NULL,NULL),
(963,284,'D','Democratic',0,'',0,NULL,NULL),
(964,285,'A','Andres Bonifacio',0,'',0,NULL,NULL),
(965,285,'B','Antonio Luna',0,'',0,NULL,NULL),
(966,285,'C','Emilio Jacinto',0,'',1,NULL,NULL),
(967,285,'D','Apolinario Mabini',0,'',0,NULL,NULL),
(968,286,'A','Samurai',0,'',0,NULL,NULL),
(969,286,'B','Kamikaze',0,'',0,NULL,NULL),
(970,286,'C','Bushido',0,'',0,NULL,NULL),
(971,286,'D','Kempeitai',0,'',1,NULL,NULL),
(972,287,'A','So that the Filipinos will not get any news outside of the Philippines',0,'',1,NULL,NULL),
(973,287,'B','So that the Japanese will be the only ones who can enjoy these media',0,'',0,NULL,NULL),
(974,287,'C','Because the Filipinos cannot understand them',0,'',0,NULL,NULL),
(975,287,'D','Because this will give money to the Japanese',0,'',0,NULL,NULL),
(976,288,'A','Jose P Laurel',0,'',0,NULL,NULL),
(977,288,'B','Sergio Osmena',0,'',0,NULL,NULL),
(978,288,'C','Manuel L. Quez',0,'',1,NULL,NULL),
(979,288,'D','Elpidio Quirino',0,'',0,NULL,NULL),
(980,289,'A','Personal',0,'',0,NULL,NULL),
(981,289,'B','Communal',0,'',1,NULL,NULL),
(982,289,'C','Private',0,'',0,NULL,NULL),
(983,289,'D','Communal',0,'',0,NULL,NULL),
(984,290,'A','Barangay',0,'',1,NULL,NULL),
(985,290,'B','Purok',0,'',0,NULL,NULL),
(986,290,'C','Corregimiento',0,'',0,NULL,NULL),
(987,290,'D','Pueblo',0,'',0,NULL,NULL),
(988,291,'A','Tilling',0,'',0,NULL,NULL),
(989,291,'B','Plowing',0,'',0,NULL,NULL),
(990,291,'C','Kaingin',0,'',1,NULL,NULL),
(991,291,'D','Harrowing',0,'',0,NULL,NULL),
(992,292,'A','Encomienda',0,'',1,NULL,NULL),
(993,292,'B','Hacienda',0,'',0,NULL,NULL),
(994,292,'C','Corregimiento',0,'',0,NULL,NULL),
(995,292,'D','Pueblo',0,'',0,NULL,NULL),
(996,293,'A','8 hectares',0,'',0,NULL,NULL),
(997,293,'B','16 hectares',0,'',1,NULL,NULL),
(998,293,'C','24 hectares',0,'',0,NULL,NULL),
(999,293,'D','32 hectares',0,'',0,NULL,NULL),
(1000,294,'A','Titling system',0,'',0,NULL,NULL),
(1001,294,'B','Torrens system',0,'',1,NULL,NULL),
(1002,294,'C','Homestead program',0,'',0,NULL,NULL),
(1003,294,'D','Maura Decree',0,'',0,NULL,NULL),
(1004,295,'A','This Act abolished share tenancy in the Philippines.',0,'',0,NULL,NULL),
(1005,295,'B','This act prescribed a program converting the tenant farmers to lessees and eventually into owner-cultivators.',0,'',0,NULL,NULL),
(1006,295,'C','This act aimed to free tenants from the bondage of tenancy and gave hope to poor Filipino farmers to own the land they are tilling.',0,'',0,NULL,NULL),
(1007,295,'D','All of the above.',0,'',1,NULL,NULL),
(1008,296,'A','The Spanish King established a palace in Manila and visited the colony from time to time.',0,'',0,NULL,NULL),
(1009,296,'B','The Philippines was divided into different levels of administration from national, provincial, municipal and barrio levels.',0,'',1,NULL,NULL),
(1010,296,'C','The colony was directly ruled by the King through direct orders.',0,'',0,NULL,NULL),
(1011,296,'D','The Spanish appointed Filipinos to manage their own provinces and barrios.',0,'',0,NULL,NULL),
(1012,297,'A','Detain me not',0,'',0,NULL,NULL),
(1013,297,'B','Touch me not',0,'',1,NULL,NULL),
(1014,297,'C','Reign of Greed',0,'',0,NULL,NULL),
(1015,297,'D','Secret Rebel',0,'',0,NULL,NULL),
(1016,298,'A','Do not touch me',0,'',0,NULL,NULL),
(1017,298,'B','Secret Rebel',0,'',0,NULL,NULL),
(1018,298,'C','Subversive',0,'',1,NULL,NULL),
(1019,298,'D','Enemy of the state',0,'',0,NULL,NULL),
(1020,299,'A','June 18, 1961',0,'',0,NULL,NULL),
(1021,299,'B','July 19, 1871',0,'',0,NULL,NULL),
(1022,299,'C','June 19, 1861',0,'',1,NULL,NULL),
(1023,299,'D','May 19, 1761',0,'',0,NULL,NULL),
(1024,300,'A','Leonor Rivera',0,'',0,NULL,NULL),
(1025,300,'B','Segunda Katigbak',0,'',1,NULL,NULL),
(1026,300,'C','Getrude Beckett',0,'',0,NULL,NULL),
(1027,300,'D','Leonor Gonzales',0,'',0,NULL,NULL),
(1028,301,'A','Dr. Jose Protacio Alonso Realondo Martinez Rizal',0,'',0,NULL,NULL),
(1029,301,'B','Dr. Jose Pedro Alonso Realonda Mercado Rizal',0,'',0,NULL,NULL),
(1030,301,'C','Dr. Josito Alonso Realonda Mercado Rizal',0,'',0,NULL,NULL),
(1031,301,'D','José Protacio Rizal Mercado y Alonso Realonda',0,'',1,NULL,NULL),
(1032,302,'A','Maria Clara',0,'',0,NULL,NULL),
(1033,302,'B','Gomburza',0,'',1,NULL,NULL),
(1034,302,'C','Gomburza',0,'',0,NULL,NULL),
(1035,302,'D','All of the above',0,'',0,NULL,NULL),
(1036,303,'A','True',0,'',0,NULL,NULL),
(1037,303,'B','False',0,'',0,NULL,NULL),
(1038,303,'C','Uncertain',0,'',1,NULL,NULL),
(1039,304,'A','True',0,'',0,NULL,NULL),
(1040,304,'B','False',0,'',1,NULL,NULL),
(1041,304,'C','Uncertain',0,'',0,NULL,NULL),
(1042,305,'A','Southeast Asia',0,'',1,NULL,NULL),
(1043,305,'B','Northeast Asia',0,'',0,NULL,NULL),
(1044,305,'C','Southwest Asia',0,'',0,NULL,NULL),
(1045,305,'D','Northwest Asia',0,'',0,NULL,NULL),
(1046,306,'A','True',0,'',1,NULL,NULL),
(1047,306,'B','False',0,'',0,NULL,NULL),
(1048,306,'C','Uncertain',0,'',0,NULL,NULL),
(1049,307,'A','Savanna',0,'',0,NULL,NULL),
(1050,307,'B','Desert',0,'',0,NULL,NULL),
(1051,307,'C','Mountainous',0,'',1,NULL,NULL),
(1052,307,'D','Rainforest',0,'',0,NULL,NULL),
(1053,308,'A','True',0,'',0,NULL,NULL),
(1054,308,'B','False',0,'',0,NULL,NULL),
(1055,308,'C','Uncertain',0,'',1,NULL,NULL),
(1056,309,'A','7,007',0,'',0,NULL,NULL),
(1057,309,'B','6,707',0,'',0,NULL,NULL),
(1058,309,'C','7,607',0,'',0,NULL,NULL),
(1059,309,'D','7,107',0,'',1,NULL,NULL),
(1060,310,'A','True',0,'',1,NULL,NULL),
(1061,310,'B','False',0,'',0,NULL,NULL),
(1062,310,'C','Uncertain',0,'',0,NULL,NULL),
(1063,311,'A','Earthquakes',0,'',1,NULL,NULL),
(1064,311,'B','Flooding',0,'',0,NULL,NULL),
(1065,311,'C','Tidal Wave',0,'',0,NULL,NULL),
(1066,311,'D','Tidal Wave',0,'',0,NULL,NULL),
(1067,312,'A','True',0,'',0,NULL,NULL),
(1068,312,'B','False',0,'',0,NULL,NULL),
(1069,312,'C','Uncertain',0,'',1,NULL,NULL),
(1070,313,'A','True',0,NULL,1,NULL,'2021-06-17 13:27:10'),
(1071,313,'B','False',0,NULL,0,NULL,'2021-06-17 13:27:10'),
(1072,313,'C','Uncertain',0,NULL,0,NULL,'2021-06-17 13:27:10'),
(1073,314,'A','True',0,'',0,NULL,NULL),
(1074,314,'B','False',0,'',0,NULL,NULL),
(1075,314,'C','Uncertain',0,'',1,NULL,NULL),
(1076,315,'A','True',0,'',0,NULL,NULL),
(1077,315,'B','False',0,'',0,NULL,NULL),
(1078,315,'C','Uncertain',0,'',1,NULL,NULL),
(1079,316,'A','Sulu Sea',0,'',1,NULL,NULL),
(1080,316,'B','Bohol Sea',0,'',0,NULL,NULL),
(1081,316,'C','Celebes Sea',0,'',0,NULL,NULL),
(1082,316,'D','Visayan Sea',0,'',0,NULL,NULL),
(1083,317,'A','True',0,'',0,NULL,NULL),
(1084,317,'B','False',0,'',0,NULL,NULL),
(1085,317,'C','Uncertain',0,'',1,NULL,NULL),
(1086,318,'A','Camotes Sea',0,'',0,NULL,NULL),
(1087,318,'B','Camotes Sea',0,'',0,NULL,NULL),
(1088,318,'C','Visayan Sea',0,'',0,NULL,NULL),
(1089,318,'D','Bohol Sea',0,'',1,NULL,NULL),
(1090,319,'A','True',0,'',1,NULL,NULL),
(1091,319,'B','False',0,'',0,NULL,NULL),
(1092,319,'C','Uncertain',0,'',0,NULL,NULL),
(1093,320,'A','Potato',0,'',0,NULL,NULL),
(1094,320,'B','Rice',0,'',0,NULL,NULL),
(1095,320,'C','Taro',0,'',1,NULL,NULL),
(1096,320,'D','Wheat',0,'',0,NULL,NULL),
(1097,321,'A','River erosion',0,'',0,NULL,NULL),
(1098,321,'B','Open-cast mining operations',0,'',0,NULL,NULL),
(1099,321,'C','By building a dam',0,'',0,NULL,NULL),
(1100,321,'D','Volcanic eruption',0,'',1,NULL,NULL),
(1101,322,'A','True',0,'',1,NULL,NULL),
(1102,322,'B','False',0,'',0,NULL,NULL),
(1103,322,'C','Uncertain',0,'',0,NULL,NULL),
(1104,323,'A','Wind',0,'',0,NULL,NULL),
(1105,323,'B','Geothermal',0,'',0,NULL,NULL),
(1106,323,'C','Hydro',0,'',1,NULL,NULL),
(1107,323,'D','Solar',0,'',0,NULL,NULL),
(1108,324,'A','Deciduous trees turn the hills brown in winter',0,'',0,NULL,NULL),
(1109,324,'B','The mounds turn brown during the dry season',0,'',1,NULL,NULL),
(1110,324,'C','Cocoa beans are grown on the hills',0,'',0,NULL,NULL),
(1111,324,'D','After the Negrito ethnic groups inhabiting the area',0,'',0,NULL,NULL),
(1112,325,'A','True',0,'',0,NULL,NULL),
(1113,325,'B','False',0,'',1,NULL,NULL),
(1114,325,'C','Uncertain',0,'',0,NULL,NULL),
(1115,326,'A','Antipolo City',0,'',1,NULL,NULL),
(1116,326,'B','Davao City',0,'',0,NULL,NULL),
(1117,326,'C','Lipa City',0,'',0,NULL,NULL),
(1118,326,'D','Baguio City',0,'',0,NULL,NULL),
(1119,327,'A','True',0,'',1,NULL,NULL),
(1120,327,'B','False',0,'',0,NULL,NULL),
(1121,327,'C','Uncertain',0,'',0,NULL,NULL),
(1122,328,'A','True',0,NULL,0,NULL,'2021-06-17 13:28:00'),
(1123,328,'B','False',0,NULL,0,NULL,'2021-06-17 13:28:00'),
(1124,328,'C','Uncertain',0,NULL,1,NULL,'2021-06-17 13:28:00'),
(1125,329,'A','True',0,'',0,NULL,NULL),
(1126,329,'B','False',0,'',0,NULL,NULL),
(1127,329,'C','Uncertain',0,'',1,NULL,NULL),
(1128,330,'A','Francisco Dagohoy',0,'',1,NULL,NULL),
(1129,330,'B','Tamblot',0,'',0,NULL,NULL),
(1130,330,'C','Rajah Sulayman',0,'',0,NULL,NULL),
(1131,330,'D','Palaris',0,'',0,NULL,NULL),
(1132,331,'A','Francisco Dagohoy',0,'',1,NULL,NULL),
(1133,331,'B','Tamblot',0,'',0,NULL,NULL),
(1134,331,'C','Rajah Sulayman',0,'',0,NULL,NULL),
(1135,331,'D','Palaris',0,'',0,NULL,NULL),
(1136,332,'A','True',0,'',0,NULL,NULL),
(1137,332,'B','False',0,'',1,NULL,NULL),
(1138,332,'C','Uncertain',0,'',0,NULL,NULL),
(1143,334,'A','Rajah Baguinda',0,'',0,NULL,NULL),
(1144,334,'B','Abu Bakr',0,'',0,NULL,NULL),
(1145,334,'C','Makhdum',0,'',1,NULL,NULL),
(1146,334,'D','Idi Amin',0,'',0,NULL,NULL),
(1147,335,'A','True',0,NULL,0,NULL,'2021-06-17 13:28:52'),
(1148,335,'B','False',0,NULL,1,NULL,'2021-06-17 13:28:52'),
(1149,335,'C','Uncertain',0,NULL,0,NULL,'2021-06-17 13:28:52'),
(1150,336,'A','True',0,'',0,NULL,NULL),
(1151,336,'B','False',0,'',0,NULL,NULL),
(1152,336,'C','Uncertain',0,'',1,NULL,NULL),
(1153,337,'A','Manuel A. Roxas',0,'',0,NULL,NULL),
(1154,337,'B','Elpidio Quirino',0,'',0,NULL,NULL),
(1155,337,'C','Manuel L. Quezon',0,'',0,NULL,NULL),
(1156,337,'D','Carlos P. Garcia',0,'',1,NULL,NULL),
(1157,338,'A','True',0,'',0,NULL,NULL),
(1158,338,'B','False',0,'',0,NULL,NULL),
(1159,338,'C','Uncertain',0,'',0,NULL,NULL),
(1160,339,'A','Ferdinand Marcos',0,'',0,NULL,NULL),
(1161,339,'B','Rodrigo Duterte',0,'',0,NULL,NULL),
(1162,339,'C','Ramon Magsaysay',0,'',1,NULL,NULL),
(1163,339,'D','Joseph Ejercito Estrada',0,'',0,NULL,NULL),
(1164,340,'A','True',0,'',0,NULL,NULL),
(1165,340,'B','False',0,'',1,NULL,NULL),
(1166,340,'C','Uncertain',0,'',0,NULL,NULL),
(1167,341,'A','Macario Sakay',0,'',0,NULL,NULL),
(1168,341,'B','Jose Palma',0,'',0,NULL,NULL),
(1169,341,'C','Ador de Leon',0,'',0,NULL,NULL),
(1170,341,'D','Julian Felipe',0,'',1,NULL,NULL),
(1171,342,'A','True',0,'',1,NULL,NULL),
(1172,342,'B','False',0,'',0,NULL,NULL),
(1173,342,'C','Uncertain',0,'',0,NULL,NULL),
(1174,343,'A','True',0,'',0,NULL,NULL),
(1175,343,'B','False',0,'',0,NULL,NULL),
(1176,343,'C','Uncertain',0,'',1,NULL,NULL),
(1177,344,'A','Diego Barbosa',0,'',0,NULL,NULL),
(1178,344,'B','Miguel Lopez de Legazpi',0,'',0,NULL,NULL),
(1179,344,'C','Alvaro Saavedra',0,'',0,NULL,NULL),
(1180,344,'D','Ferdinand Magellan',0,'',1,NULL,NULL),
(1181,345,'A','Emilio Jacinto',0,'',0,NULL,NULL),
(1182,345,'B','Apolinario Mabini',0,'',1,NULL,NULL),
(1183,345,'C','Gregorio del Pilar',0,'',0,NULL,NULL),
(1184,345,'D','Andres Bonifacio',0,'',0,NULL,NULL),
(1185,346,'A','Ferdinand Marcos',0,'',0,NULL,NULL),
(1186,346,'B','Corazon C. Aquino',0,'',1,NULL,NULL),
(1187,346,'C','Elpidio R. Quirino',0,'',0,NULL,NULL),
(1188,346,'D','Fidel V. Ramos',0,'',0,NULL,NULL),
(1189,347,'A','Claro M Recto',0,'',0,NULL,NULL),
(1190,347,'B','Sergio Osmena',0,'',1,NULL,NULL),
(1191,347,'C','Rafael Palma',0,'',0,NULL,NULL),
(1192,347,'D','Jose Laurel',0,'',0,NULL,NULL),
(1193,348,'A','Congress',0,'',1,NULL,NULL),
(1194,348,'B','President',0,'',0,NULL,NULL),
(1195,348,'C','Commanding General',0,'',0,NULL,NULL),
(1196,348,'D','Defense Secretary',0,'',0,NULL,NULL),
(1197,349,'A','True',0,'',1,NULL,NULL),
(1198,349,'B','False',0,'',0,NULL,NULL),
(1199,349,'C','Uncertain',0,'',0,NULL,NULL),
(1200,350,'A','Elpidio Quirino',0,'',0,NULL,NULL),
(1201,350,'B','Manuel Quezon',0,'',0,NULL,NULL),
(1202,350,'C','Ramon Magsaysay',0,'',1,NULL,NULL),
(1203,350,'D','Ferdinand Marcos',0,'',0,NULL,NULL),
(1204,351,'A','True',0,'',0,NULL,NULL),
(1205,351,'B','False',0,'',0,NULL,NULL),
(1206,351,'C','Uncertain',0,'',1,NULL,NULL),
(1207,352,'A','Right to assembly',0,'',0,NULL,NULL),
(1208,352,'B','Right to vote',0,'',1,NULL,NULL),
(1209,352,'C','Right to express own’s opinion',0,'',0,NULL,NULL),
(1210,352,'D','Right to suffer',0,'',0,NULL,NULL),
(1211,353,'A','Every first Monday of July.',0,'',0,NULL,NULL),
(1212,353,'B','Every second Monday of July',0,'',0,NULL,NULL),
(1213,353,'C','Every third Monday of July',0,'',0,NULL,NULL),
(1214,353,'D','Every fourth Monday of July',0,'',1,NULL,NULL),
(1215,354,'A','path',0,'',0,NULL,NULL),
(1216,354,'B','wheat',0,'',0,NULL,NULL),
(1217,354,'C','holy',0,'',0,NULL,NULL),
(1218,354,'D','train',0,'',1,NULL,NULL),
(1219,355,'A','Philippine Revolution',0,'',1,NULL,NULL),
(1220,355,'B','Treaty of Paris 1898',0,'',0,NULL,NULL),
(1221,355,'C','Execution of Rizal',0,'',0,NULL,NULL),
(1222,355,'D','Capture of Aguinaldo',0,'',0,NULL,NULL),
(1223,357,'A','Kundiman',0,'',0,NULL,NULL),
(1224,357,'B','Oyayi',0,'',0,NULL,NULL),
(1225,357,'C','Kumintang',0,'',1,NULL,NULL),
(1226,357,'D','Kanogan',0,'',0,NULL,NULL),
(1227,358,'A','Respectful',0,'',0,NULL,NULL),
(1228,358,'B','Hospitable',0,'',1,NULL,NULL),
(1229,358,'C','Kind',0,'',0,NULL,NULL),
(1230,358,'D','Thoughtful',0,'',0,NULL,NULL),
(1231,359,'A','8',0,'',0,NULL,NULL),
(1232,359,'B','4',0,'',0,NULL,NULL),
(1233,359,'C','2',0,'',1,NULL,NULL),
(1234,359,'D','14',0,'',0,NULL,NULL),
(1235,360,'A','Agueda Esteban',0,'',1,NULL,NULL),
(1236,360,'B','Teresa Magbanua',0,'',0,NULL,NULL),
(1237,360,'C','Teodora Alonzo',0,'',0,NULL,NULL),
(1238,360,'D','Gregoria de Hesus',0,'',0,NULL,NULL),
(1239,361,'A','shoe',0,'',0,NULL,NULL),
(1240,361,'B','ride',0,'',0,NULL,NULL),
(1241,361,'C','mount',0,'',1,NULL,NULL),
(1242,361,'D','stable',0,'',0,NULL,NULL),
(1243,362,'A','Manuel Roxas',0,'',0,NULL,NULL),
(1244,362,'B','Carlos Garcia',0,'',0,NULL,NULL),
(1245,362,'C','Diosdado Macapagal',0,'',1,NULL,NULL),
(1246,362,'D','Ferdinand Marcos',0,'',0,NULL,NULL),
(1247,363,'A','Sa Aking Mga Kabata',0,'',0,NULL,NULL),
(1248,363,'B','A La Juventud Filipina',0,'',1,NULL,NULL),
(1249,363,'C','A La Juventud Filipina',0,'',0,NULL,NULL),
(1250,363,'D','Noli Me Tangere',0,'',0,NULL,NULL),
(1251,364,'A','Macario Sakay',0,'',0,NULL,NULL),
(1252,364,'B','Simeon Ola',0,'',1,NULL,NULL),
(1253,364,'C','Miguel Malvar',0,'',0,NULL,NULL),
(1254,364,'D','Franciso Dagohoy',0,'',0,NULL,NULL),
(1259,366,'A','Bathala',0,'',1,NULL,NULL),
(1260,366,'B','Allah',0,'',0,NULL,NULL),
(1261,366,'C','Diwata',0,'',0,NULL,NULL),
(1262,366,'D','Anito',0,'',0,NULL,NULL),
(1263,367,'A','4P',0,'',1,NULL,NULL),
(1264,367,'B','5P',0,'',0,NULL,NULL),
(1265,367,'C','8P',0,'',0,NULL,NULL),
(1266,367,'D','6P',0,'',0,NULL,NULL),
(1267,368,'A','Ruy Lopez de Villalubuz',0,'',0,NULL,NULL),
(1268,368,'B','Miguel Lopez de Legaspi',0,'',1,NULL,NULL),
(1269,368,'C','Ferdinand Magellan',0,'',0,NULL,NULL),
(1270,368,'D','Antonio Pigafetta',0,'',0,NULL,NULL),
(1271,369,'A','Seas',0,'',0,NULL,NULL),
(1272,369,'B','Ocean',0,'',0,NULL,NULL),
(1273,369,'C','Forest',0,'',0,NULL,NULL),
(1274,369,'D','River',0,'',1,NULL,NULL),
(1275,370,'A','mother',0,'',0,NULL,NULL),
(1276,370,'B','father',0,'',0,NULL,NULL),
(1277,370,'C','daughters',0,'',0,NULL,NULL),
(1278,370,'D','cousin',0,'',1,NULL,NULL),
(1279,371,'A','3',0,'',0,NULL,NULL),
(1280,371,'B','5',0,'',1,NULL,NULL),
(1281,371,'C','7',0,'',0,NULL,NULL),
(1282,371,'D','9',0,'',0,NULL,NULL),
(1283,372,'A','',1,'ae7a799fafb0804c1ccb6da85dcf13e7.png',0,NULL,NULL),
(1284,372,'B','',1,'aeea92dba0b20ce7e63432e21640a411.png',0,NULL,NULL),
(1285,372,'C','',1,'e8bf9fec35e38df488c3ad3848e896a6.png',0,NULL,NULL),
(1286,372,'D','',1,'909dde7559e1f2e1cefdd57666eda083.png',1,NULL,NULL),
(1287,373,'A','Miguel Malvar',0,'',0,NULL,NULL),
(1288,373,'B','Gregorio del Pilar',0,'',0,NULL,NULL),
(1289,373,'C','Gregorio del Pilar',0,'',1,NULL,NULL),
(1290,373,'D','Manuel Tinio',0,'',0,NULL,NULL),
(1291,374,'A','f (n) = 2016 + 4(n + 1)',0,NULL,0,NULL,'2021-06-10 22:38:35'),
(1292,374,'B','f (n) = 2016 + 4(n - 1)',0,NULL,1,NULL,'2021-06-10 22:38:35'),
(1293,374,'C','f (n) = 4n + 2016',0,NULL,0,NULL,'2021-06-10 22:38:35'),
(1294,374,'D','f (n) = 2016 + (n + 4)',0,NULL,0,NULL,'2021-06-10 22:38:35'),
(1295,375,'A','6',0,'',0,NULL,NULL),
(1296,375,'B','4',0,'',0,NULL,NULL),
(1297,375,'C','7',0,'',0,NULL,NULL),
(1298,375,'D','5',0,'',1,NULL,NULL),
(1299,376,'A','8',0,'',1,NULL,NULL),
(1300,376,'B','10',0,'',0,NULL,NULL),
(1301,376,'C','12',0,'',0,NULL,NULL),
(1302,376,'D','14',0,'',0,NULL,NULL),
(1303,377,'A','grass',0,'',0,NULL,NULL),
(1304,377,'B','squash',0,'',1,NULL,NULL),
(1305,377,'C','jury',0,'',0,NULL,NULL),
(1306,377,'D','poker',0,'',0,NULL,NULL),
(1307,378,'A','Teodora Alonso',0,'',0,NULL,NULL),
(1308,378,'B','Leonor Rivera',0,'',0,NULL,NULL),
(1309,378,'C','Gabriela Silang',0,'',1,NULL,NULL),
(1310,378,'D','Gregoria de Jesus',0,'',0,NULL,NULL),
(1311,379,'A','Banco Filipino',0,'',0,NULL,NULL),
(1312,379,'B','Banco Filipino',0,'',1,NULL,NULL),
(1313,379,'C','Central Bank of The Philippines',0,'',0,NULL,NULL),
(1314,379,'D','Philippine National Bank',0,'',0,NULL,NULL),
(1315,380,'A','100 liters',0,'',0,NULL,NULL),
(1316,380,'B','80 liters',0,'',1,NULL,NULL),
(1317,380,'C','70 liters',0,'',0,NULL,NULL),
(1318,380,'D','90 liters',0,'',0,NULL,NULL),
(1319,381,'A','50 ml & 50 ml',0,'',0,NULL,NULL),
(1320,381,'B','70 ml & 30 ml',0,'',0,NULL,NULL),
(1321,381,'C','40 ml & 60 ml',0,'',1,NULL,NULL),
(1322,381,'D','60 ml & 40 ml',0,'',0,NULL,NULL),
(1323,382,'A','190 kg',0,'',0,NULL,NULL),
(1324,382,'B','200 kg',0,'',1,NULL,NULL),
(1325,382,'C','195 kg',0,'',0,NULL,NULL),
(1326,382,'D','205 kg',0,'',0,NULL,NULL),
(1327,383,'A','November 30, 1863',0,'',0,NULL,NULL),
(1328,383,'B','December 30, 1896',0,'',0,NULL,NULL),
(1329,383,'C','June 19, 1861',0,'',0,NULL,NULL),
(1330,383,'D','May 10, 1897',0,'',1,NULL,NULL),
(1331,384,'A','18.75%',0,'',1,NULL,NULL),
(1332,384,'B','17.95%',0,'',0,NULL,NULL),
(1333,384,'C','18.65%',0,'',0,NULL,NULL),
(1334,384,'D','17.75%',0,'',0,NULL,NULL),
(1335,385,'A','November 30, 1863',0,'',1,NULL,NULL),
(1336,385,'B','June 19, 1861',0,'',0,NULL,NULL),
(1337,385,'C','December 30, 1896',0,'',0,NULL,NULL),
(1338,385,'D','May 10, 1897',0,'',0,NULL,NULL),
(1339,386,'A','A.	3 9/17 hrs',0,'',1,NULL,NULL),
(1340,386,'B','3 8/17 hrs',0,'',0,NULL,NULL),
(1341,386,'C','3 10/17 hrs',0,'',0,NULL,NULL),
(1342,386,'D','3 8/17 hrs',0,'',0,NULL,NULL),
(1343,387,'A','May 10, 1897',0,'',0,NULL,NULL),
(1344,387,'B','November 30, 1863',0,'',0,NULL,NULL),
(1345,387,'C','December 30, 1896',0,'',0,NULL,NULL),
(1346,387,'D','June 19, 1861',0,'',1,NULL,NULL),
(1347,388,'A','306.3834 ft',0,'',0,NULL,NULL),
(1348,388,'B','307.4348 ft',0,'',0,NULL,NULL),
(1349,388,'C','307.3834 ft',0,'',1,NULL,NULL),
(1350,388,'D','306. 3834 ft',0,'',0,NULL,NULL),
(1351,389,'A','November 30, 1863',0,'',0,NULL,NULL),
(1352,389,'B','December 30, 1896',0,'',1,NULL,NULL),
(1353,389,'C','June 19, 1861',0,'',0,NULL,NULL),
(1354,389,'D','May 10, 1897',0,'',0,NULL,NULL),
(1355,390,'A','4155.1433 ft',0,'',0,NULL,NULL),
(1356,390,'B','4591. 1433 ft',0,'',0,NULL,NULL),
(1357,390,'C','4515. 1433 ft',0,'',0,NULL,NULL),
(1358,390,'D','4551.1433 ft',0,'',1,NULL,NULL),
(1359,391,'A','Peace',0,'',0,NULL,NULL),
(1360,391,'B','Truth',0,'',0,NULL,NULL),
(1361,391,'C','Patriotism',0,'',1,NULL,NULL),
(1362,391,'D','Justice',0,'',0,NULL,NULL),
(1363,392,'A','36. 3378 ft',0,'',0,NULL,NULL),
(1364,392,'B','35.3378 ft',0,'',1,NULL,NULL),
(1365,392,'C','35. 7378 ft',0,'',0,NULL,NULL),
(1366,392,'D','36. 3378 ft',0,'',0,NULL,NULL),
(1367,393,'A','doctrine',0,'',0,NULL,NULL),
(1368,393,'B','student',0,'',1,NULL,NULL),
(1369,393,'C','teacher',0,'',0,NULL,NULL),
(1370,393,'D','president',0,'',0,NULL,NULL),
(1371,394,'A','Valor',0,'',1,NULL,NULL),
(1372,394,'B','Liberty',0,'',0,NULL,NULL),
(1373,394,'C','Fraternity',0,'',0,NULL,NULL),
(1374,394,'D','Equality',0,'',0,NULL,NULL),
(1375,395,'A','26ft',0,'',0,NULL,NULL),
(1376,395,'B','29ft',0,'',0,NULL,NULL),
(1377,395,'C','28ft',0,'',1,NULL,NULL),
(1378,395,'D','27ft',0,'',0,NULL,NULL),
(1379,396,'A','28ft',0,'',0,NULL,NULL),
(1380,396,'B','30ft',0,'',0,NULL,NULL),
(1381,396,'C','24ft',0,'',0,NULL,NULL),
(1382,396,'D','25ft',0,'',1,NULL,NULL),
(1383,397,'A','Malacañang Palace',0,'',0,NULL,NULL),
(1384,397,'B','National Museum of the Philippines',0,'',1,NULL,NULL),
(1385,397,'C','Libingan ng mga Bayani',0,'',0,NULL,NULL),
(1386,397,'D','Supreme Court Building',0,'',0,NULL,NULL),
(1387,398,'A','Peace',0,'',0,NULL,NULL),
(1388,398,'B','Celebration',0,'',0,NULL,NULL),
(1389,398,'C','War',0,'',1,NULL,NULL),
(1390,398,'D','Holiday',0,'',0,NULL,NULL),
(1391,399,'A','Theory',0,NULL,1,NULL,'2021-06-11 17:34:19'),
(1392,399,'B','Music',0,NULL,0,NULL,'2021-06-11 17:34:19'),
(1393,399,'C','Bi-law',0,NULL,0,NULL,'2021-06-11 17:34:19'),
(1394,399,'D','Imagery',0,NULL,0,NULL,'2021-06-11 17:34:19'),
(1395,400,'A','Ozamiz',0,'',0,NULL,NULL),
(1396,400,'B','Tangub',0,'',0,NULL,NULL),
(1397,400,'C','Oroquieta',0,'',1,NULL,NULL),
(1398,400,'D','No Capital',0,'',0,NULL,NULL),
(1399,401,'A','Push',0,NULL,0,NULL,'2021-06-11 17:34:46'),
(1400,401,'B','Approach',0,NULL,0,NULL,'2021-06-11 17:34:46'),
(1401,401,'C','Outwit',0,NULL,0,NULL,'2021-06-11 17:34:46'),
(1402,401,'D','Damage',0,NULL,1,NULL,'2021-06-11 17:34:46'),
(1403,402,'A','1965',0,'',0,NULL,NULL),
(1404,402,'B','1966',0,'',0,NULL,NULL),
(1405,402,'C','1967',0,'',1,NULL,NULL),
(1406,402,'D','1968',0,'',0,NULL,NULL),
(1407,403,'A','6m/h',0,NULL,0,NULL,'2021-06-13 09:41:34'),
(1408,403,'B','7m/h',0,NULL,0,NULL,'2021-06-13 09:41:34'),
(1409,403,'C','8.5m/h',0,NULL,1,NULL,'2021-06-13 09:41:34'),
(1410,403,'D','9m/h',0,NULL,0,NULL,'2021-06-13 09:41:34'),
(1415,405,'A','Sweet coconut',0,'',1,NULL,NULL),
(1416,405,'B','Sweet corn',0,'',0,NULL,NULL),
(1417,405,'C','Sweet potato',0,'',0,NULL,NULL),
(1418,405,'D','Sweet mango',0,'',0,NULL,NULL),
(1423,407,'A','4',0,NULL,0,NULL,'2021-06-11 17:35:44'),
(1424,407,'B','8',0,NULL,0,NULL,'2021-06-11 17:35:44'),
(1425,407,'C','20',0,NULL,0,NULL,'2021-06-11 17:35:44'),
(1426,407,'D','1',0,NULL,1,NULL,'2021-06-11 17:35:44'),
(1427,408,'A','Ibong Adarna',0,'',0,NULL,NULL),
(1428,408,'B','Eagle',0,'',0,NULL,NULL),
(1429,408,'C','Sarimanok',0,'',1,NULL,NULL),
(1430,408,'D','None',0,'',0,NULL,NULL),
(1439,411,'A','Tilapia',0,'',0,NULL,NULL),
(1440,411,'B','Bangus',0,'',1,NULL,NULL),
(1441,411,'C','Tuna',0,'',0,NULL,NULL),
(1442,411,'D','Lapu-lapu',0,'',0,NULL,NULL),
(1443,412,'A','dead',0,NULL,0,NULL,'2021-06-11 17:36:41'),
(1444,412,'B','will',0,NULL,0,NULL,'2021-06-11 17:36:41'),
(1445,412,'C','livelihood',0,NULL,1,NULL,'2021-06-11 17:36:41'),
(1446,412,'D','likelihood',0,NULL,0,NULL,'2021-06-11 17:36:41'),
(1459,416,'A','Maya',0,'',0,NULL,NULL),
(1460,416,'B','Kingfisher',0,'',0,NULL,NULL),
(1461,416,'C','Hummingbird',0,'',0,NULL,NULL),
(1462,416,'D','Eagle',0,'',1,NULL,NULL),
(1467,418,'A','part',0,NULL,0,NULL,'2021-06-11 17:36:07'),
(1468,418,'B','list',0,NULL,1,NULL,'2021-06-11 17:36:07'),
(1469,418,'C','order',0,NULL,0,NULL,'2021-06-11 17:36:07'),
(1470,418,'D','sort',0,NULL,0,NULL,'2021-06-11 17:36:07'),
(1471,419,'A','Tarawe',0,'',0,NULL,NULL),
(1472,419,'B','Tarasul',0,'',1,NULL,NULL),
(1473,419,'C','Subanon',0,'',0,NULL,NULL),
(1474,419,'D','Salathul',0,'',0,NULL,NULL),
(1475,420,'A','One',0,'',1,NULL,NULL),
(1476,420,'B','Two',0,'',0,NULL,NULL),
(1477,420,'C','Three',0,'',0,NULL,NULL),
(1478,420,'D','Until then, no woman had ever served as president',0,'',0,NULL,NULL),
(1483,422,'A','Elpidio Quirino',0,'',0,NULL,NULL),
(1484,422,'B','Jose P. Laurel',0,'',0,NULL,NULL),
(1485,422,'C','Manuel Roxas',0,'',0,NULL,NULL),
(1486,422,'D','Manuel L. Quezon',0,'',1,NULL,NULL),
(1487,423,'A','10',0,'',0,NULL,NULL),
(1488,423,'B','20',0,'',0,NULL,NULL),
(1489,423,'C','55',0,'',1,NULL,NULL),
(1490,423,'D','65',0,'',0,NULL,NULL),
(1491,424,'A','13',0,'',0,NULL,NULL),
(1492,424,'B','26',0,'',0,NULL,NULL),
(1493,424,'C','31',0,'',1,NULL,NULL),
(1494,424,'D','40',0,'',0,NULL,NULL),
(1495,425,'A','Ferdinand Marcos',0,'',1,NULL,NULL),
(1496,425,'B','Rodrigo Duterte',0,'',0,NULL,NULL),
(1497,425,'C','Benigno Aquino Jr',0,'',0,NULL,NULL),
(1498,425,'D','Fidel Ramos',0,'',0,NULL,NULL),
(1499,426,'A','250ft',0,'',1,NULL,NULL),
(1500,426,'B','150ft',0,'',0,NULL,NULL),
(1501,426,'C','50ft',0,'',0,NULL,NULL),
(1502,426,'D','100ft',0,'',0,NULL,NULL),
(1503,427,'A','Manuel L. Quezon',0,'',0,NULL,NULL),
(1504,427,'B','Ferdinand Marcos',0,'',0,NULL,NULL),
(1505,427,'C','Elpidio Quirino',0,'',0,NULL,NULL),
(1506,427,'D','Emilio Aguinaldo',0,'',1,NULL,NULL),
(1507,428,'A','Jose P. Laurel',0,'',0,NULL,NULL),
(1508,428,'B','Corazon Aquino',0,'',0,NULL,NULL),
(1509,428,'C','Ferdinand Marcos',0,'',0,NULL,NULL),
(1510,428,'D','Ramon Magsaysay',0,'',1,NULL,NULL),
(1511,429,'A','16 ft',0,'',0,NULL,NULL),
(1512,429,'B','32 ft',0,'',1,NULL,NULL),
(1513,429,'C','36 ft',0,'',0,NULL,NULL),
(1514,429,'D','24 ft',0,'',0,NULL,NULL),
(1515,430,'A','$ 38',0,'',0,NULL,NULL),
(1516,430,'B','$ 19',0,'',0,NULL,NULL),
(1517,430,'C','$ 76',0,'',1,NULL,NULL),
(1518,430,'D','$28',0,'',0,NULL,NULL),
(1519,431,'A','3',0,'',0,NULL,NULL),
(1520,431,'B','6',0,'',0,NULL,NULL),
(1521,431,'C','4',0,'',0,NULL,NULL),
(1522,431,'D','5',0,'',1,NULL,NULL),
(1523,432,'A','Carlos P. Garcia',0,'',1,NULL,NULL),
(1524,432,'B','Manuel Roxas',0,'',0,NULL,NULL),
(1525,432,'C','Ramon Magsaysay',0,'',0,NULL,NULL),
(1526,432,'D','Diosdado Macapagal',0,'',0,NULL,NULL),
(1527,433,'A','General Macario Sakay',0,'',0,NULL,NULL),
(1528,433,'B','General Mariano Alvarez',0,'',0,NULL,NULL),
(1529,433,'C','General Emilio Aguinaldo',0,'',0,NULL,NULL),
(1530,433,'D','General Antonio Luna',0,'',1,NULL,NULL),
(1531,434,'A','Mu Ultimo Adios',0,'',0,NULL,NULL),
(1532,434,'B','El Filibusterismo',0,'',0,NULL,NULL),
(1533,434,'C','El Filibusterismo',0,'',0,NULL,NULL),
(1534,434,'D','None',0,'',0,NULL,NULL),
(1535,435,'A','',1,'55b5539b67ea1db05e57d8e39b824f5b.png',1,NULL,NULL),
(1536,435,'B','',1,'3496f74c8a846a3579244cd761e359d6.png',0,NULL,NULL),
(1537,435,'C','',1,'9e56aeb501262e0c71a6507b52cb6726.png',0,NULL,NULL),
(1538,435,'D','',1,'851b88d9e73a833861c6df24d863d641.png',0,NULL,NULL),
(1539,436,'A','The first box',0,'',0,NULL,NULL),
(1540,436,'B','The second box',0,'',1,NULL,NULL),
(1541,436,'C','Both boxes',0,'',0,NULL,NULL),
(1542,436,'D','Neither of them',0,'',0,NULL,NULL),
(1543,437,'A','Principalia',0,'',0,NULL,NULL),
(1544,437,'B','Indios',0,'',1,NULL,NULL),
(1545,437,'C','Insulares',0,'',0,NULL,NULL),
(1546,437,'D','Peninsulares',0,'',0,NULL,NULL),
(1547,438,'A','145',0,'',0,NULL,NULL),
(1548,438,'B','130',0,'',0,NULL,NULL),
(1549,438,'C','125',0,'',1,NULL,NULL),
(1550,438,'D','120',0,'',0,NULL,NULL),
(1551,439,'A','Tax Reform For Acceleration and Inclusion',0,'',1,NULL,NULL),
(1552,439,'B','Tax Reform For Acceleration and Income',0,'',0,NULL,NULL),
(1553,439,'C','Tax Reform for Accelerated Inclusion',0,'',0,NULL,NULL),
(1554,439,'D','Tax Reform for Added Income',0,'',0,NULL,NULL),
(1631,459,'A','render',0,NULL,1,NULL,'2021-06-11 17:38:13'),
(1632,459,'B','propose',0,NULL,0,NULL,'2021-06-11 17:38:13'),
(1633,459,'C','teach',0,NULL,0,NULL,'2021-06-11 17:38:13'),
(1634,459,'D','divide',0,NULL,0,NULL,'2021-06-11 17:38:13'),
(1635,460,'A','A',0,'',0,NULL,NULL),
(1636,460,'B','B',0,'',0,NULL,NULL),
(1637,460,'C','C',0,'',1,NULL,NULL),
(1638,460,'D','D',0,'',0,NULL,NULL),
(1639,461,'A','5',0,'',0,NULL,NULL),
(1640,461,'B','4',0,'',1,NULL,NULL),
(1641,461,'C','3',0,'',0,NULL,NULL),
(1642,461,'D','2',0,'',0,NULL,NULL),
(1643,462,'A','813',0,'',0,NULL,NULL),
(1644,462,'B','546',0,'',0,NULL,NULL),
(1645,462,'C','479',0,'',1,NULL,NULL),
(1646,462,'D','none of these',0,'',0,NULL,NULL),
(1647,463,'A','ZU',0,'',0,NULL,NULL),
(1648,463,'B','ZR',0,'',1,NULL,NULL),
(1649,463,'C','RR',0,'',0,NULL,NULL),
(1650,463,'D','none of these',0,'',0,NULL,NULL),
(1651,464,'A','F',0,'',1,NULL,NULL),
(1652,464,'B','G',0,'',0,NULL,NULL),
(1653,464,'C','H',0,'',0,NULL,NULL),
(1654,464,'D','none of the above',0,'',0,NULL,NULL),
(1655,465,'A','now',0,'',0,NULL,NULL),
(1656,465,'B','again',0,'',1,NULL,NULL),
(1657,465,'C','after',0,'',0,NULL,NULL),
(1658,465,'D','before',0,'',0,NULL,NULL),
(1659,466,'A','train',0,'',0,NULL,NULL),
(1660,466,'B','tractor',0,'',0,NULL,NULL),
(1661,466,'C','bus',0,'',0,NULL,NULL),
(1662,466,'D','car',0,'',1,NULL,NULL),
(1663,467,'A','L',0,'',1,NULL,NULL),
(1664,467,'B','I',0,'',0,NULL,NULL),
(1665,467,'C','A',0,'',0,NULL,NULL),
(1666,467,'D','none of these',0,'',0,NULL,NULL),
(1667,468,'A','spinning',0,'',1,NULL,NULL),
(1668,468,'B','expanding',0,'',0,NULL,NULL),
(1669,468,'C','planet',0,'',0,NULL,NULL),
(1670,468,'D','sun',0,'',0,NULL,NULL),
(1671,469,'A','INVERTIBARTE',0,'',0,NULL,NULL),
(1672,469,'B','INVERTIBRATE',0,'',1,NULL,NULL),
(1673,469,'C','INVRETIBRATE',0,'',0,NULL,NULL),
(1674,469,'D','none of these',0,'',0,NULL,NULL),
(1675,470,'A','moon',0,'',1,NULL,NULL),
(1676,470,'B','mars',0,'',0,NULL,NULL),
(1677,470,'C','earth',0,'',0,NULL,NULL),
(1678,470,'D','none of these',0,'',0,NULL,NULL),
(1679,471,'A','water',0,'',0,NULL,NULL),
(1680,471,'B','sand',0,'',0,NULL,NULL),
(1681,471,'C','lava',0,'',0,NULL,NULL),
(1682,471,'D','mica',0,'',1,NULL,NULL),
(1683,472,'A','computer',0,'',1,NULL,NULL),
(1684,472,'B','rat',0,'',0,NULL,NULL),
(1685,472,'C','dessert',0,'',0,NULL,NULL),
(1686,472,'D','cord',0,'',0,NULL,NULL),
(1687,473,'A','55',0,'',0,NULL,NULL),
(1688,473,'B','52',0,'',0,NULL,NULL),
(1689,473,'C','53',0,'',0,NULL,NULL),
(1690,473,'D','51',0,'',1,NULL,NULL),
(1691,474,'A','bookcase',0,'',1,NULL,NULL),
(1692,474,'B','storage',0,'',0,NULL,NULL),
(1693,474,'C','frame',0,'',0,NULL,NULL),
(1694,474,'D','ledge',0,'',0,NULL,NULL),
(1695,475,'A','J, G',0,'',0,NULL,NULL),
(1696,475,'B','K, H',0,'',0,NULL,NULL),
(1697,475,'C','J, H',0,'',1,NULL,NULL),
(1698,475,'D','none of these',0,'',0,NULL,NULL),
(1699,476,'A','field',0,'',0,NULL,NULL),
(1700,476,'B','theater',0,'',1,NULL,NULL),
(1701,476,'C','act',0,'',0,NULL,NULL),
(1702,476,'D','scene',0,'',0,NULL,NULL),
(1703,477,'A','T',0,'',1,NULL,NULL),
(1704,477,'B','K',0,'',0,NULL,NULL),
(1705,477,'C','D',0,'',0,NULL,NULL),
(1706,477,'D','none of these',0,'',0,NULL,NULL),
(1707,478,'A','soak',0,'',1,NULL,NULL),
(1708,478,'B','water',0,'',0,NULL,NULL),
(1709,478,'C','grow',0,'',0,NULL,NULL),
(1710,478,'D','oven',0,'',0,NULL,NULL),
(1711,479,'A','reader',0,'',1,NULL,NULL),
(1712,479,'B','writer',0,'',0,NULL,NULL),
(1713,479,'C','publisher',0,'',0,NULL,NULL),
(1714,479,'D','none of these',0,'',0,NULL,NULL),
(1715,480,'A','horse',0,'',0,NULL,NULL),
(1716,480,'B','battle',0,'',1,NULL,NULL),
(1717,480,'C','rainy',0,'',0,NULL,NULL),
(1718,480,'D','none of the above',0,'',0,NULL,NULL),
(1719,481,'A','one',0,'',0,NULL,NULL),
(1720,481,'B','two',0,'',1,NULL,NULL),
(1721,481,'C','three',0,'',0,NULL,NULL),
(1722,481,'D','none of these',0,'',0,NULL,NULL),
(1723,482,'A','swing',0,'',0,NULL,NULL),
(1724,482,'B','grass',0,'',0,NULL,NULL),
(1725,482,'C','tennis',0,'',0,NULL,NULL),
(1726,482,'D','shuttle cock',0,'',1,NULL,NULL),
(1727,483,'A','FG',0,'',0,NULL,NULL),
(1728,483,'B','GH',0,'',0,NULL,NULL),
(1729,483,'C','FI',0,'',0,NULL,NULL),
(1730,483,'D','FH',0,'',1,NULL,NULL),
(1731,484,'A','RT',0,'',0,NULL,NULL),
(1732,484,'B','TR',0,'',1,NULL,NULL),
(1733,484,'C','WR',0,'',0,NULL,NULL),
(1734,484,'D','TS',0,'',0,NULL,NULL),
(1735,485,'A','donkey',0,'',0,NULL,NULL),
(1736,485,'B','greece',0,'',0,NULL,NULL),
(1737,485,'C','epic',0,'',1,NULL,NULL),
(1738,485,'D','temple',0,'',0,NULL,NULL),
(1739,486,'A','NM',0,'',0,NULL,NULL),
(1740,486,'B','OL',0,'',0,NULL,NULL),
(1741,486,'C','NK',0,'',1,NULL,NULL),
(1742,486,'D','NJ',0,'',0,NULL,NULL),
(1743,487,'A','print',0,'',0,NULL,NULL),
(1744,487,'B','measure',0,'',0,NULL,NULL),
(1745,487,'C','kitchen',0,'',0,NULL,NULL),
(1746,487,'D','encyclopedia',0,'',1,NULL,NULL),
(1747,488,'A','OP',0,'',0,NULL,NULL),
(1748,488,'B','OQ',0,'',1,NULL,NULL),
(1749,488,'C','OR',0,'',0,NULL,NULL),
(1750,488,'D','PQ',0,'',0,NULL,NULL),
(1755,490,'A','election',0,'',0,NULL,NULL),
(1756,490,'B','president',0,'',1,NULL,NULL),
(1757,490,'C','government',0,'',0,NULL,NULL),
(1758,490,'D','Philippines',0,'',0,NULL,NULL),
(1759,491,'A','K and P',0,'',0,NULL,NULL),
(1760,491,'B','R and P',0,'',0,NULL,NULL),
(1761,491,'C','Only P',0,'',0,NULL,NULL),
(1762,491,'D','P and T',0,'',1,NULL,NULL),
(1763,492,'A','punishment',0,'',0,NULL,NULL),
(1764,492,'B','freedom',0,'',1,NULL,NULL),
(1765,492,'C','jail',0,'',0,NULL,NULL),
(1766,492,'D','trouble',0,'',0,NULL,NULL),
(1767,493,'A','cut',0,'',0,NULL,NULL),
(1768,493,'B','bow',0,'',0,NULL,NULL),
(1769,493,'C','typewriter',0,'',0,NULL,NULL),
(1770,493,'D','present',0,'',1,NULL,NULL),
(1771,494,'A','True',0,'',0,NULL,NULL),
(1772,494,'B','False',0,'',0,NULL,NULL),
(1773,494,'C','Cannot say',0,'',1,NULL,NULL),
(1774,495,'A','only II follows',0,'',0,NULL,NULL),
(1775,495,'B','only I follows',0,'',0,NULL,NULL),
(1776,495,'C','neither I or II follows',0,'',1,NULL,NULL),
(1777,495,'D','either I or II follows',0,'',0,NULL,NULL),
(1778,496,'A','True',0,'',0,NULL,NULL),
(1779,496,'B','False',0,'',1,NULL,NULL),
(1780,496,'C','Cannot say',0,'',0,NULL,NULL),
(1781,497,'A','True',0,'',0,NULL,NULL),
(1782,497,'B','False',0,'',0,NULL,NULL),
(1783,497,'C','cannot say',0,'',1,NULL,NULL),
(1784,498,'A','I only',0,'',0,NULL,NULL),
(1785,498,'B','II only',0,'',0,NULL,NULL),
(1786,498,'C','I and II only',0,'',1,NULL,NULL),
(1787,498,'D','None of the statements is a known fact',0,'',0,NULL,NULL),
(1788,499,'A','True',0,'',1,NULL,NULL),
(1789,499,'B','False',0,'',0,NULL,NULL),
(1790,499,'C','Cannot say',0,'',0,NULL,NULL),
(1791,500,'A','If the data given in both I and II together are not sufficient.',0,'',0,NULL,NULL),
(1792,500,'B','If the data in statement I alone are sufficient.',0,'',0,NULL,NULL),
(1793,500,'C','If the data in statement II alone are sufficient.',0,'',1,NULL,NULL),
(1794,500,'D','If the data in both the statements I and II together are necessary to answer.',0,'',0,NULL,NULL),
(1795,501,'A','True',0,'',1,NULL,NULL),
(1796,501,'B','False',0,'',0,NULL,NULL),
(1797,501,'C','Cannot say',0,'',0,NULL,NULL),
(1798,502,'A','True',0,'',0,NULL,NULL),
(1799,502,'B','False',0,'',1,NULL,NULL),
(1800,502,'C','Cannot say',0,'',0,NULL,NULL),
(1801,503,'A','both I or II follows',0,NULL,0,NULL,'2021-06-11 18:07:12'),
(1802,503,'B','neither I or II follows',0,NULL,0,NULL,'2021-06-11 18:07:12'),
(1803,503,'C','only I follow',0,NULL,0,NULL,'2021-06-11 18:07:12'),
(1804,503,'D','only II follows',0,NULL,1,NULL,'2021-06-11 18:07:12'),
(1805,504,'A','True',0,'',0,NULL,NULL),
(1806,504,'B','False',0,'',0,NULL,NULL),
(1807,504,'C','Cannot say',0,'',1,NULL,NULL),
(1808,505,'A','only either II or III follows',0,'',0,NULL,NULL),
(1809,505,'B','only either I or II and III or IV follows',0,'',1,NULL,NULL),
(1810,505,'C','only either I or II follows',0,'',0,NULL,NULL),
(1811,505,'D','non of these',0,'',0,NULL,NULL),
(1812,506,'A','True',0,'',1,NULL,NULL),
(1813,506,'B','False',0,'',0,NULL,NULL),
(1814,506,'C','Cannot say',0,'',0,NULL,NULL),
(1815,507,'A','True',0,'',0,NULL,NULL),
(1816,507,'B','False',0,'',1,NULL,NULL),
(1817,507,'C','Cannot say',0,'',0,NULL,NULL),
(1818,508,'A','only I',0,'',0,NULL,NULL),
(1819,508,'B','only II',0,'',0,NULL,NULL),
(1820,508,'C','only I and III',0,'',1,NULL,NULL),
(1821,508,'D','None of these',0,'',0,NULL,NULL),
(1822,509,'A','True',0,'',0,NULL,NULL),
(1823,509,'B','False',0,'',1,NULL,NULL),
(1824,509,'C','Cannot say',0,'',0,NULL,NULL),
(1825,510,'A','if only conclusion I follows.',0,'',0,NULL,NULL),
(1826,510,'B','if neither conclusion I nor conclusion II follows',0,'',1,NULL,NULL),
(1827,510,'C','if either conclusion I or conclusion II follows',0,'',0,NULL,NULL),
(1828,510,'D','if only conclusion II follows',0,'',0,NULL,NULL),
(1829,511,'A','only conclusion II follows',0,'',0,NULL,NULL),
(1830,511,'B','neither I nor II follows',0,'',0,NULL,NULL),
(1831,511,'C','both I and II follow',0,'',1,NULL,NULL),
(1832,511,'D','either I or II follows',0,'',0,NULL,NULL),
(1833,512,'A','neither I nor II is implicit',0,NULL,0,NULL,'2021-06-11 18:39:24'),
(1834,512,'B','only assumption II is implicit',0,NULL,1,NULL,'2021-06-11 18:39:24'),
(1835,512,'C','only assumption I is implicit',0,NULL,0,NULL,'2021-06-11 18:39:24'),
(1836,512,'D','either I or II is implicit',0,NULL,0,NULL,'2021-06-11 18:39:24'),
(1837,513,'A','only assumption II is implicit',0,'',1,NULL,NULL),
(1838,513,'B','either I or II is implicit',0,'',0,NULL,NULL),
(1839,513,'C','both I and II are implicit',0,'',0,NULL,NULL),
(1840,513,'D','only assumption I is implicit',0,'',0,NULL,NULL),
(1841,514,'A','both I and II follow',0,'',0,NULL,NULL),
(1842,514,'B','either I or II follows',0,'',0,NULL,NULL),
(1843,514,'C','neither I nor II follows',0,'',1,NULL,NULL),
(1844,514,'D','none of these',0,'',0,NULL,NULL),
(1845,515,'A','if the data in statement I alone are sufficient.',0,'',0,NULL,NULL),
(1846,515,'B','if the data in statement II alone are sufficient.',0,'',0,NULL,NULL),
(1847,515,'C','if the data either in statement I alone or statement II alone are sufficient to answer.',0,'',0,NULL,NULL),
(1848,515,'D','if the data in both the statements I and II together are necessary to answer',0,'',1,NULL,NULL),
(1849,516,'A','only assumption I is implicit',0,'',1,NULL,NULL),
(1850,516,'B','only assumption II is implicit',0,'',0,NULL,NULL),
(1851,516,'C','either I or II is implicit',0,'',0,NULL,NULL),
(1852,516,'D','both I and II are implicit',0,'',0,NULL,NULL),
(1853,517,'A','only conclusion I follows',0,'',0,NULL,NULL),
(1854,517,'B','only conclusion II follows',0,'',0,NULL,NULL),
(1855,517,'C','both I and II follow',0,'',1,NULL,NULL),
(1856,517,'D','either I nor II follows',0,'',0,NULL,NULL),
(1857,518,'A','only I conclusion follows',0,'',0,NULL,NULL),
(1858,518,'B','only II conclusion follows',0,'',0,NULL,NULL),
(1859,518,'C','either I or II follows',0,'',0,NULL,NULL),
(1860,518,'D','both I and II follow',0,'',0,NULL,NULL),
(1861,519,'A','if only conclusion I follows',0,'',0,NULL,NULL),
(1862,519,'B','if only conclusion II follows',0,'',1,NULL,NULL),
(1863,519,'C','if either conclusion I or conclusion II follows',0,'',0,NULL,NULL),
(1864,519,'D','if neither conclusion I nor conclusion II follows',0,'',0,NULL,NULL),
(1865,520,'A','only conclusion I follows',0,'',0,NULL,NULL),
(1866,520,'B','only II follows',0,'',0,NULL,NULL),
(1867,520,'C','either I or II follows',0,'',0,NULL,NULL),
(1868,520,'D','both I and II follow',0,'',1,NULL,NULL),
(1869,521,'A','only conclusion I follow',0,'',0,NULL,NULL),
(1870,521,'B','only conclusion II follow',0,'',1,NULL,NULL),
(1871,521,'C','either I or II follows',0,'',0,NULL,NULL),
(1872,521,'D','both I and II follow',0,'',0,NULL,NULL),
(1877,523,'A','',1,'ffbc85f128d15bb31d2aed31472d0b0d.jpg',0,NULL,NULL),
(1878,523,'B','',1,'227eab999ec9af5692ddd3e412a96872.jpg',0,NULL,NULL),
(1879,523,'C','',1,'07eed62cd22a01f78fb100ccf9cd7826.jpg',1,NULL,NULL),
(1880,523,'D','',1,'baad3ca472da1222451cf8a04c1a403f.jpg',0,NULL,NULL),
(1881,524,'A','',1,'94a21f873fc8c283c6dbe5ca36cb3c59.jpg',1,NULL,NULL),
(1882,524,'B','',1,'5e90e795f7daf12f798964c6ef46f737.jpg',0,NULL,NULL),
(1883,524,'C','',1,'55a77b6a23d8ed52233527cdc15558b4.jpg',0,NULL,NULL),
(1884,524,'D','',1,'74dd0a2ccab44961e09c8ff0001d5734.jpg',0,NULL,NULL),
(1885,525,'A','',1,'496498a027df509830be713deeefffda.jpg',1,NULL,NULL),
(1886,525,'B','',1,'8c36b6c9c589c124710f63f2c08a7349.jpg',0,NULL,NULL),
(1887,525,'C','',1,'05934604b8b0455502e103f935218c63.jpg',0,NULL,NULL),
(1888,525,'D','',1,'05b0f35868dd8de923e3de2503dd0043.jpg',0,NULL,NULL),
(1889,526,'A','',1,'bbd300879bb168064df81dbcaca7274a.jpg',1,NULL,NULL),
(1890,526,'B','',1,'29511984059704663640964d69a6c406.jpg',0,NULL,NULL),
(1891,526,'C','',1,'63a92fc0a335ad1b68bf0fe8bb14dfdd.jpg',0,NULL,NULL),
(1892,526,'D','',1,'cb72f3ca08c45be3d6e45c599fe4d77f.jpg',0,NULL,NULL),
(1893,527,'A','',1,'5bf4f28c3cd6868a2da8f49ce15a445e.jpg',1,NULL,NULL),
(1894,527,'B','',1,'b96f5bc69a4d2adbd4c016a240c0311b.jpg',0,NULL,NULL),
(1895,527,'C','',1,'8412a6c11fa5a88bf0942495b089196f.jpg',0,NULL,NULL),
(1896,527,'D','',1,'915123eb6e22957eef7570223112324f.jpg',0,NULL,NULL),
(1897,528,'A','',1,'72cf1b07fcb9b9e1eaf8a001b25380ec.jpg',0,NULL,NULL),
(1898,528,'B','',1,'204e16ff77ec63e2b7c226df62cb6fdb.jpg',0,NULL,NULL),
(1899,528,'C','',1,'bcd1b5ea4280abefe7983103967da616.jpg',0,NULL,NULL),
(1900,528,'D','',1,'e436cd4310e44e6c55b49d568788547c.jpg',1,NULL,NULL),
(1909,531,'A','',1,'f0c80515d45a4e8af64e70c44ffe1d76.png',0,NULL,NULL),
(1910,531,'B','',1,'b5309887fc581f7d6dd1add365ec1073.png',0,NULL,NULL),
(1911,531,'C','',1,'dfd3f482a50e43816f844c69e9249a1d.png',0,NULL,NULL),
(1912,531,'D','',1,'8616135e911e460c0d62b80e0a059268.png',1,NULL,NULL),
(1913,532,'A','',1,'3d4eeaa90e322beddb2632740db12198.png',0,NULL,NULL),
(1914,532,'B','',1,'28a03ee640d9b4e377daba9eb504c61c.png',0,NULL,NULL),
(1915,532,'C','',1,'504625225d0d7f1cce3d2002ac42d615.png',0,NULL,NULL),
(1916,532,'D','',1,'3c13e9b8b14d05216469887475d47e68.png',1,NULL,NULL),
(1917,533,'A','',1,'fc6d165c6b16de9ea6b8b497288918df.png',0,NULL,NULL),
(1918,533,'B','',1,'10fcdb8efc97513f3761e2cc4f00fee8.png',0,NULL,NULL),
(1919,533,'C','',1,'fbfad944cb417507e84de3eb782323e6.png',1,NULL,NULL),
(1920,533,'D','',1,'716709d4aacea5126ee532bd42492ab2.png',0,NULL,NULL),
(1921,534,'A','',1,'880d963fe794a9e5381b74d342d1f215.png',0,NULL,'2021-06-11 22:28:20'),
(1922,534,'B','',1,'4d166a8651062069bcc871393a7fe67a.png',0,NULL,'2021-06-11 22:28:20'),
(1923,534,'C','',1,'5fcbbe6c1fe9d0e2acd7b9fccdbcf6f9.png',1,NULL,'2021-06-11 22:28:20'),
(1924,534,'D','',1,'c5637c86ef0c42675a1330898eb7aff1.png',0,NULL,'2021-06-11 22:28:20'),
(1929,536,'A','',1,'83a60b12432d3f05f51271eaef2f877d.png',0,NULL,NULL),
(1930,536,'B','',1,'1b2b36de063cab5cc91fe36b6ba7920c.png',1,NULL,NULL),
(1931,536,'C','',1,'7e1428580ad16439194be67310e9c4ea.png',0,NULL,NULL),
(1932,536,'D','',1,'1f891b6065b324826616315f45c437c9.png',0,NULL,NULL),
(1933,537,'A','',1,'56528042e8b2df10782c6496e30f2504.png',0,NULL,NULL),
(1934,537,'B','',1,'6febd4d4c8195f9bcc04781fed8b103f.png',0,NULL,NULL),
(1935,537,'C','',1,'c249ff8a272f22bea07ff72663cfd568.png',0,NULL,NULL),
(1936,537,'D','',1,'05011d9dea3ade14ba055dae92c030f3.png',1,NULL,NULL),
(1937,538,'A','',1,'ca60595fd69647f369a0402e62a4e1ef.png',0,NULL,NULL),
(1938,538,'B','',1,'1c28b92eb110801ad475cfcb8fb34dd6.png',0,NULL,NULL),
(1939,538,'C','',1,'9032f8415a96a93cb2927ba57cc7f84e.png',0,NULL,NULL),
(1940,538,'D','',1,'8ba29c0a685555ce663e297af75751fe.png',1,NULL,NULL),
(1941,539,'A','',1,'18b8879be3872f346252100e4d87fa15.png',0,NULL,NULL),
(1942,539,'B','',1,'cf6cadac0bff64ddd34bccd958192754.png',0,NULL,NULL),
(1943,539,'C','',1,'2a00f231bffc1c375189ac3be276bcc4.png',1,NULL,NULL),
(1944,539,'D','',1,'df3380d3a96f194e72037160354eebfa.png',0,NULL,NULL),
(1945,540,'A','',1,'a46dd677fe20bcfb2c7380efe240462b.png',1,NULL,NULL),
(1946,540,'B','',1,'45b2624d6e137074ce4e112ed975144d.png',0,NULL,NULL),
(1947,540,'C','',1,'c66df22046e89beef56f352bd3b6be60.png',0,NULL,NULL),
(1948,540,'D','',1,'5a7a8a1ba857828ec512aaca229b7f27.png',0,NULL,NULL),
(1949,541,'A','',1,'3aa6edacbd1f1e587e015be1ca43089c.jpg',0,NULL,NULL),
(1950,541,'B','',1,'077ac056f75750f04ab3acade66d5027.jpg',0,NULL,NULL),
(1951,541,'C','',1,'e1ecc8e924a04b72f73d654c48c1e6ff.jpg',1,NULL,NULL),
(1952,541,'D','',1,'b9d8ddf915bcc34fed3e59e829804daa.jpg',0,NULL,NULL),
(1953,542,'A','',1,'4f24cb8d191eb8604416daea66fcedac.jpg',1,NULL,NULL),
(1954,542,'B','',1,'b521fd7a684cf6a017f1493e54d679fb.jpg',0,NULL,NULL),
(1955,542,'C','',1,'e1e2926fade7ada40945478ef75861f7.jpg',0,NULL,NULL),
(1956,542,'D','',1,'eed9ea4bab944bb279e65590f6018664.jpg',0,NULL,NULL),
(1957,543,'A','',1,'72c9c02c785da44e3bb15d23923dc313.jpg',0,NULL,NULL),
(1958,543,'B','',1,'046e57cdaafe852bd1f4e18c3e9756a7.jpg',0,NULL,NULL),
(1959,543,'C','',1,'c2dc7c84ae3a321c7d557ed779870302.jpg',1,NULL,NULL),
(1960,543,'D','',1,'0bc84e6df0533d723796f5105f1880d2.jpg',0,NULL,NULL),
(1961,544,'A','',1,'1cc084285a7c6f8f2e2f57e2454e48c5.jpg',0,NULL,NULL),
(1962,544,'B','',1,'625bee6b774c58137ad11066898789fd.jpg',1,NULL,NULL),
(1963,544,'C','',1,'f0a3b27e42dcced2405d69b02b557d94.jpg',0,NULL,NULL),
(1964,544,'D','',1,'5a71a4b0643ca1e2a87f2b402a462628.jpg',0,NULL,NULL),
(1965,545,'A','',1,'473b54a8bc94f73774eb3a96fcf2f837.jpg',0,NULL,NULL),
(1966,545,'B','',1,'e8cb33bcaaf56a3bd2df656538cc8601.jpg',1,NULL,NULL),
(1967,545,'C','',1,'b288150ba49d2d22d4d1be99eff1509e.jpg',0,NULL,NULL),
(1968,545,'D','',1,'1c16a6d014812690524761d7c0d07fa9.jpg',0,NULL,NULL),
(1969,546,'A','',1,'870f13e1586544b42e7674777c74e77e.jpg',0,NULL,NULL),
(1970,546,'B','',1,'4c662c357dcad796f345616b5ec3dc79.jpg',0,NULL,NULL),
(1971,546,'C','',1,'63142d62e05480e788ef9b8355b09174.jpg',1,NULL,NULL),
(1972,546,'D','',1,'16df91d31193bf417ff8033b7588e2e8.jpg',0,NULL,NULL),
(1973,547,'A','',1,'fd69917f998a56ca4f9d836d30eba7d4.jpg',0,NULL,NULL),
(1974,547,'B','',1,'30c6e1f670687d9669f0604ccce49326.jpg',1,NULL,NULL),
(1975,547,'C','',1,'7ed6414963755f0db6a647337dc01710.jpg',0,NULL,NULL),
(1976,547,'D','',1,'be68fb8a0b49825283f20d2801b0be6e.jpg',0,NULL,NULL),
(1977,548,'A','',1,'262a521c65568224e18cd9b42a0547de.jpg',0,NULL,NULL),
(1978,548,'B','',1,'d006d71d2ae2bea7ea70befc4b11543c.jpg',1,NULL,NULL),
(1979,548,'C','',1,'662f00dd2ff64ae4ef89603809d444b2.jpg',0,NULL,NULL),
(1980,548,'D','',1,'6106d7060b7e2ba1e593fc2c6eb204ac.jpg',0,NULL,NULL),
(1981,549,'A','',1,'509272c08e4002ea76a6cfb8141cc0ed.jpg',0,NULL,NULL),
(1982,549,'B','',1,'7b8d58ffbcc42551f23569291607214e.jpg',0,NULL,NULL),
(1983,549,'C','',1,'f31052ad283c415579a9a7613c4feb56.jpg',1,NULL,NULL),
(1984,549,'D','',1,'f83a328e4c7bd3dfd452c433d824dfdf.jpg',0,NULL,NULL),
(1985,550,'A','',1,'d0710cd75ab8e108c593542b780b112b.jpg',0,NULL,NULL),
(1986,550,'B','',1,'f8fe20e6984d29e9826fb1b974cd3917.jpg',1,NULL,NULL),
(1987,550,'C','',1,'654ab5bffbb172ee53b60462483f1d96.jpg',0,NULL,NULL),
(1988,550,'D','',1,'af910b274319779cc249c6aeb8a4fa6c.jpg',0,NULL,NULL),
(1989,551,'A','',1,'972f2975df35d08a88c2338ab3ea7144.jpg',0,NULL,NULL),
(1990,551,'B','',1,'4d4078f8ad503f290c1bb1f46f26a987.jpg',0,NULL,NULL),
(1991,551,'C','',1,'d5b20fda4cf7d40b1dca73538c4264d0.jpg',0,NULL,NULL),
(1992,551,'D','',1,'ca53ef92e0ad5425595c3c7f778eccd0.jpg',1,NULL,NULL),
(1993,552,'A','T',0,'',0,NULL,NULL),
(1994,552,'B','A',0,'',0,NULL,NULL),
(1995,552,'C','S',0,'',1,NULL,NULL),
(1996,552,'D','R',0,'',0,NULL,NULL),
(2001,554,'A','3.21cm',0,'',0,NULL,NULL),
(2002,554,'B','2.56 cm',0,'',0,NULL,NULL),
(2003,554,'C','3.01 cm',0,'',0,NULL,NULL),
(2004,554,'D','2.26 cm',0,'',1,NULL,NULL),
(2005,555,'A','$4, 712, 378.98',0,'',0,NULL,NULL),
(2006,555,'B','$4, 712, 388.98',0,'',1,NULL,NULL),
(2007,555,'C','$4, 712, 838.98',0,'',0,NULL,NULL),
(2008,555,'D','$4, 721, 388.98',0,'',0,NULL,NULL),
(2009,556,'A','4, 100',0,'',0,NULL,NULL),
(2010,556,'B','3, 900',0,'',1,NULL,NULL),
(2011,556,'C','4000',0,'',0,NULL,NULL),
(2012,556,'D','3, 800',0,'',0,NULL,NULL),
(2013,557,'A','10519.56',0,'',0,NULL,NULL),
(2014,557,'B','10519.56',0,'',1,NULL,NULL),
(2015,557,'C','10951.56',0,'',0,NULL,NULL),
(2016,557,'D','10195. 56',0,'',0,NULL,NULL),
(2017,558,'A','mode',0,'',1,NULL,NULL),
(2018,558,'B','mean',0,'',0,NULL,NULL),
(2019,558,'C','median',0,'',0,NULL,NULL),
(2020,558,'D','range',0,'',0,NULL,NULL),
(2021,559,'A','',1,'87f8f70bb86ffce2f7a5d0e384529051.png',1,NULL,NULL),
(2022,559,'B','',1,'249e4ac9d5ef902b70e8cd7b59cc7fbe.png',0,NULL,NULL),
(2023,559,'C','',1,'a8bcc9304bac659f51ec50e2cf8a02b2.png',0,NULL,NULL),
(2024,559,'D','',1,'63b4fd51f2bb9512d10cf9e6f53c142a.png',0,NULL,NULL),
(2025,560,'A','Rational Function',0,'',0,NULL,NULL),
(2026,560,'B','Constant Function',0,'',0,NULL,NULL),
(2027,560,'C','Greatest Integer Function',0,'',0,NULL,NULL),
(2028,560,'D','Absolute Value Function',0,'',1,NULL,NULL),
(2029,561,'A','',1,'33d5ff73ee58b3062fab87c09d91d767.png',0,NULL,NULL),
(2030,561,'B','',1,'6dab4e754a05626ff0606653505b3098.png',0,NULL,NULL),
(2031,561,'C','',1,'7e98884ea2a5525eaedc14846f5532a7.png',1,NULL,NULL),
(2032,561,'D','',1,'ac49bdcce1daf6c7c59ab3c4ead4434c.png',0,NULL,NULL),
(2033,562,'A','',1,'d9195a632dbb03271bdf1b6ac42124af.png',0,NULL,NULL),
(2034,562,'B','',1,'a9b506cf5e7dd28e621928a08135c3d1.png',1,NULL,NULL),
(2035,562,'C','',1,'bba682f0d6fa58d80509c5a930ce7cf0.png',0,NULL,NULL),
(2036,562,'D','',1,'4908933f6dc44b12a526dcb793fce1a7.png',0,NULL,NULL),
(2037,563,'A','',1,'0c1b1e73f781073bbd000ac2e1bef6db.png',1,NULL,NULL),
(2038,563,'B','',1,'e69bc9477b1eb5026501792104e681ef.png',0,NULL,NULL),
(2039,563,'C','',1,'0a3401d72d710d86633184291243d423.png',0,NULL,NULL),
(2040,563,'D','',1,'4235d41f3f17ca4204d1b01a9431d715.png',0,NULL,NULL),
(2041,564,'A','25',0,'',0,NULL,NULL),
(2042,564,'B','16',0,'',1,NULL,NULL),
(2043,564,'C','19',0,'',0,NULL,NULL),
(2044,564,'D','10',0,'',0,NULL,NULL),
(2045,565,'A','34',0,'',0,NULL,NULL),
(2046,565,'B','-34',0,'',0,NULL,NULL),
(2047,565,'C','-33',0,'',0,NULL,NULL),
(2048,565,'D','33',0,'',1,NULL,NULL),
(2049,566,'A','117',0,'',1,NULL,NULL),
(2050,566,'B','27',0,'',0,NULL,NULL),
(2051,566,'C','153',0,'',0,NULL,NULL),
(2052,566,'D','63',0,'',0,NULL,NULL),
(2053,567,'A','22',0,'',0,NULL,NULL),
(2054,567,'B','145',0,'',0,NULL,NULL),
(2055,567,'C','97',0,'',0,NULL,NULL),
(2056,567,'D','-3',0,'',1,NULL,NULL),
(2057,568,'A','',1,'244b27f9da72da88abcd198b2ae05174.png',0,NULL,NULL),
(2058,568,'B','',1,'bd8e13f245f3cc5ac7653c9bea59c621.png',1,NULL,NULL),
(2059,568,'C','',1,'a43c78d99494ab1f697594b7184e5622.png',0,NULL,NULL),
(2060,568,'D','',1,'946cde27da9b4c68ea1cf0354d6ce1a0.png',0,NULL,NULL),
(2061,569,'A','',1,'04eab6cd2d27d40f2ad7a1ebe5f12b1d.png',1,NULL,NULL),
(2062,569,'B','',1,'edc361980bf5131c55ad242ee6a609c8.png',0,NULL,NULL),
(2063,569,'C','',1,'c1ca0e4d369cedb8140c0f443102727e.png',0,NULL,NULL),
(2064,569,'D','',1,'dac98fad9f80859460c125c4f8b364ec.png',0,NULL,NULL),
(2069,571,'A','',1,'baae9a7a2d0c78b7f4612bb9936d0435.png',0,NULL,NULL),
(2070,571,'B','',1,'e07f0d4b47ad70b2a65558ace2df9def.png',0,NULL,NULL),
(2071,571,'C','',1,'95d229df959fc97218c704497626f468.png',0,NULL,NULL),
(2072,571,'D','',1,'33a2ba4b1af888c942e67d65b67a3b93.png',1,NULL,NULL),
(2073,572,'A','',1,'74281cdd88598bef3106819e7bfe1fcb.png',0,NULL,NULL),
(2074,572,'B','',1,'0c1d93e3d1e4c0cfb8e57f2e3c723976.png',0,NULL,NULL),
(2075,572,'C','',1,'a263a9f89a635c8e33a7f5318898dcae.png',1,NULL,NULL),
(2076,572,'D','',1,'fe8e5ca7ee025005d947c2546d72d99c.png',0,NULL,NULL),
(2077,573,'A','',1,'f604991da2301a9adc4684dc0bf3c189.png',1,NULL,NULL),
(2078,573,'B','',1,'07c0c1226206e8f8cd68b71ab31ce9a0.png',0,NULL,NULL),
(2079,573,'C','',1,'22e870990908fe3e6041b31e27db1831.png',0,NULL,NULL),
(2080,573,'D','',1,'e5ffa2cacab41e39c0f5fabde1c1f2ef.png',0,NULL,NULL),
(2081,574,'A','',1,'33de85bb565f20a7a96856a4a011aca5.png',0,NULL,NULL),
(2082,574,'B','',1,'f32470c35a376349f62db8625ed33ace.png',0,NULL,NULL),
(2083,574,'C','',1,'c7faba3bef5a27947a9b073a679b3ee8.png',1,NULL,NULL),
(2084,574,'D','',1,'8d428029770feca2c8aa6d5bd1a73a89.png',0,NULL,NULL),
(2105,580,'A','',1,'793dc7543e45816d9c03d801da62bdfe.png',0,NULL,NULL),
(2106,580,'B','',1,'833c48e236113172218bbd774aad371f.png',0,NULL,NULL),
(2107,580,'C','',1,'577fe6cb4432bc870d9d3f11788afe78.png',0,NULL,NULL),
(2108,580,'D','',1,'dfaed64d17789d7d2c096ebee6b6bbbd.png',1,NULL,NULL),
(2109,581,'A','Rational Function',0,'',1,NULL,NULL),
(2110,581,'B','Constant Function',0,'',0,NULL,NULL),
(2111,581,'C','Greatest Integer Function',0,'',0,NULL,NULL),
(2112,581,'D','Absolute Value Function',0,'',0,NULL,NULL),
(2113,582,'A','',1,'66dcb5df7a943faa945c1dfaa7fac104.png',1,NULL,NULL),
(2114,582,'B','',1,'104e5f5dc538a4f04b1af8f7bd174cda.png',0,NULL,NULL),
(2115,582,'C','',1,'4b9e014a9d08fc9d00bac014aa042729.png',0,NULL,NULL),
(2116,582,'D','',1,'d279e313924ad700cf85a70d4d28feab.png',0,NULL,NULL),
(2117,583,'A','',1,'4f55b90dac8ac861e54c1042b7f7ec2f.png',0,NULL,NULL),
(2118,583,'B','',1,'77f4c30cc94540c8c36aafef57b94103.png',0,NULL,NULL),
(2119,583,'C','',1,'38ee37ab72a33431e375a670efb50fe7.png',1,NULL,NULL),
(2120,583,'D','',1,'10665dd8a6a8e2c4279173d5d0d05c1e.png',0,NULL,NULL),
(2121,584,'A','',1,'98b33af50ce4d90b09f8e1078ce79ea5.png',0,NULL,NULL),
(2122,584,'B','',1,'03c10e07a6dd5ab85ae350e87db03738.png',1,NULL,NULL),
(2123,584,'C','',1,'776e16d4706390c78beb50696e54e9d1.png',0,NULL,NULL),
(2124,584,'D','',1,'cb5d738c7ed2bc131a4ab14f3ba6e46e.png',0,NULL,NULL),
(2125,585,'A','8',0,'',0,NULL,NULL),
(2126,585,'B','9',0,'',0,NULL,NULL),
(2127,585,'C','10',0,'',1,NULL,NULL),
(2128,585,'D','11',0,'',0,NULL,NULL),
(2129,586,'A','-8',0,'',1,NULL,NULL),
(2130,586,'B','8',0,'',0,NULL,NULL),
(2131,586,'C','-9',0,'',0,NULL,NULL),
(2132,586,'D','9',0,'',0,NULL,NULL),
(2133,587,'A','-21',0,'',0,NULL,NULL),
(2134,587,'B','14',0,'',0,NULL,NULL),
(2135,587,'C','111',0,'',0,NULL,NULL),
(2136,587,'D','39',0,'',1,NULL,NULL),
(2137,588,'A','45',0,'',0,NULL,NULL),
(2138,588,'B','63',0,'',0,NULL,NULL),
(2139,588,'C','135',0,'',1,NULL,NULL),
(2140,588,'D','153',0,'',0,NULL,NULL),
(2141,589,'A','',1,'e9d725ff02e71326ae6885b1fea45b42.png',0,NULL,NULL),
(2142,589,'B','',1,'c6fbd634b0aeba1fc25fc9b483916332.png',1,NULL,NULL),
(2143,589,'C','',1,'e4e0b15d334b6e6d070a959383015768.png',0,NULL,NULL),
(2144,589,'D','',1,'3c4cc786355b6f145f974dd36702faea.png',0,NULL,NULL),
(2145,590,'A','',1,'07e198662237214325e8e1bd056c303b.png',1,NULL,NULL),
(2146,590,'B','',1,'043e38e544b363ca3e265854c0d7a12c.png',0,NULL,NULL),
(2147,590,'C','',1,'91886547379d698c08a07571991fbe3f.png',0,NULL,NULL),
(2148,590,'D','',1,'3526fc210563b2ec65aa8f563c03da42.png',0,NULL,NULL),
(2149,591,'A','11',0,'',1,NULL,NULL),
(2150,591,'B','',1,'bde0f40d5e0cef8d248c9f7953293761.png',0,NULL,NULL),
(2151,591,'C','-11',0,'',0,NULL,NULL),
(2152,591,'D','',1,'43935d1c579489ab3a73f206f04046d5.png',0,NULL,NULL),
(2153,592,'A','',1,'11adb172892bc10464f51c1b9aa05c08.png',0,NULL,NULL),
(2154,592,'B','',1,'022c58555210fa01218bc4d849bf203b.png',0,NULL,NULL),
(2155,592,'C','',1,'85ee6f2901328c28c0ca5235e735f11f.png',0,NULL,NULL),
(2156,592,'D','',1,'27c24597dcd54370c3b0326e6a097e53.png',1,NULL,NULL),
(2157,593,'A','',1,'9a0121e80e8adfb418d1658c3293668f.png',0,NULL,NULL),
(2158,593,'B','',1,'0cdb64c18992df46d633ac3725cea6ab.png',0,NULL,NULL),
(2159,593,'C','',1,'001d42640b77f17675440f01ddad5565.png',1,NULL,NULL),
(2160,593,'D','',1,'ab59f1b57f64920b0d1d676308a1c837.png',0,NULL,NULL),
(2161,594,'A','',1,'23ac59deb6b09e7b41b9fee3018f5a90.png',0,NULL,NULL),
(2162,594,'B','',1,'a15df797612920a274fd520936f89145.png',1,NULL,NULL),
(2163,594,'C','',1,'0c1929109cbded999533cfaa6ddbbdf6.png',0,NULL,NULL),
(2164,594,'D','',1,'16f9560542f7aebe7db0dddacb475606.png',0,NULL,NULL),
(2165,595,'A','6',0,'',0,NULL,NULL),
(2166,595,'B','3',0,'',1,NULL,NULL),
(2167,595,'C','4',0,'',0,NULL,NULL),
(2168,595,'D','2',0,'',0,NULL,NULL),
(2169,596,'A','72',0,NULL,0,NULL,'2021-06-14 09:33:15'),
(2170,596,'B','75',0,NULL,0,NULL,'2021-06-14 09:33:15'),
(2171,596,'C','81',0,NULL,1,NULL,'2021-06-14 09:33:15'),
(2172,596,'D','90',0,NULL,0,NULL,'2021-06-14 09:33:15'),
(2173,597,'A','9',0,'',0,NULL,NULL),
(2174,597,'B','-9',0,'',1,NULL,NULL),
(2175,597,'C','-41',0,'',0,NULL,NULL),
(2176,597,'D','41',0,'',0,NULL,NULL),
(2177,598,'A','-90',0,'',0,NULL,NULL),
(2178,598,'B','90',0,'',0,NULL,NULL),
(2179,598,'C','124',0,'',1,NULL,NULL),
(2180,598,'D','-124',0,'',0,NULL,NULL),
(2181,599,'A','198',0,'',1,NULL,NULL),
(2182,599,'B','-198',0,'',0,NULL,NULL),
(2183,599,'C','31',0,'',0,NULL,NULL),
(2184,599,'D','-31',0,'',0,NULL,NULL),
(2185,600,'A','-100',0,'',1,NULL,NULL),
(2186,600,'B','100',0,'',0,NULL,NULL),
(2187,600,'C','-23',0,'',0,NULL,NULL),
(2188,600,'D','23',0,'',0,NULL,NULL),
(2189,601,'A','-80',0,'',1,NULL,NULL),
(2190,601,'B','80',0,'',0,NULL,NULL),
(2191,601,'C','-553',0,'',0,NULL,NULL),
(2192,601,'D','553',0,'',0,NULL,NULL),
(2193,602,'A','4',0,'',0,NULL,NULL),
(2194,602,'B','8',0,'',0,NULL,NULL),
(2195,602,'C','16',0,'',1,NULL,NULL),
(2196,602,'D','2',0,'',0,NULL,NULL),
(2197,603,'A','-95',0,'',0,NULL,NULL),
(2198,603,'B','104',0,'',0,NULL,NULL),
(2199,603,'C','-123',0,'',0,NULL,NULL),
(2200,603,'D','-144',0,'',1,NULL,NULL),
(2201,604,'A','IR KP',0,'',0,NULL,NULL),
(2202,604,'B','IR KQ',0,'',0,NULL,NULL),
(2203,604,'C','IS KQ',0,'',1,NULL,NULL),
(2204,604,'D','IS KP',0,'',0,NULL,NULL),
(2205,605,'A','P15525',0,'',0,NULL,NULL),
(2206,605,'B','P15625',0,'',1,NULL,NULL),
(2207,605,'C','O15525',0,'',0,NULL,NULL),
(2208,605,'D','O15625',0,'',0,NULL,NULL),
(2209,606,'A','½ + 2.5 + ¼',0,'',0,NULL,NULL),
(2210,606,'B','½ + 5/2 + 1/6',0,'',0,NULL,NULL),
(2211,606,'C','¾ + 2.5 + 1/6',0,'',0,NULL,NULL),
(2212,606,'D','¾ + 5/2 + 1/3',0,'',1,NULL,NULL),
(2213,607,'A','212.000',0,NULL,0,NULL,'2021-06-14 10:03:48'),
(2214,607,'B','2,120,000',0,NULL,1,NULL,'2021-06-14 10:03:48'),
(2215,607,'C','212,000',0,NULL,0,NULL,'2021-06-14 10:03:48'),
(2216,607,'D','21,200',0,NULL,0,NULL,'2021-06-14 10:03:48'),
(2217,608,'A','9',0,'',1,NULL,NULL),
(2218,608,'B','8',0,'',0,NULL,NULL),
(2219,608,'C','10',0,'',0,NULL,NULL),
(2220,608,'D','4',0,'',0,NULL,NULL),
(2221,609,'A','26, 88, & 58',0,NULL,0,NULL,'2021-06-14 10:05:20'),
(2222,609,'B','30, 84, & 58',0,NULL,1,NULL,'2021-06-14 10:05:20'),
(2223,609,'C','32, 82, & 58',0,NULL,0,NULL,'2021-06-14 10:05:20'),
(2224,609,'D','34, 80, & 58',0,NULL,0,NULL,'2021-06-14 10:05:20'),
(2225,610,'A','5, 7, & 9',0,NULL,0,NULL,'2021-06-14 10:04:27'),
(2226,610,'B','7, 9, & 11',0,NULL,1,NULL,'2021-06-14 10:04:27'),
(2227,610,'C','9, 11, & 13',0,NULL,0,NULL,'2021-06-14 10:04:28'),
(2228,610,'D','6, 9, & 13',0,NULL,0,NULL,'2021-06-14 10:04:28'),
(2229,611,'A','25 & 30',0,NULL,0,NULL,'2021-06-14 10:04:22'),
(2230,611,'B','27 & 32',0,NULL,0,NULL,'2021-06-14 10:04:22'),
(2231,611,'C','26 & 31',0,NULL,0,NULL,'2021-06-14 10:04:22'),
(2232,611,'D','28 & 33',0,NULL,1,NULL,'2021-06-14 10:04:22'),
(2233,612,'A','38, 40, 42, & 44',0,NULL,0,NULL,'2021-06-14 10:04:16'),
(2234,612,'B','36, 38, 40, & 42',0,NULL,1,NULL,'2021-06-14 10:04:16'),
(2235,612,'C','34, 36, 38, & 40',0,NULL,0,NULL,'2021-06-14 10:04:16'),
(2236,612,'D','32, 34, 36, & 42',0,NULL,0,NULL,'2021-06-14 10:04:16'),
(2237,613,'A','555 cm',0,'',0,NULL,NULL),
(2238,613,'B','5.5 m',0,'',0,NULL,NULL),
(2239,613,'C','.005 km',0,'',0,NULL,NULL),
(2240,613,'D','5555 mm',0,'',1,NULL,NULL),
(2241,614,'A','1/2',0,'',0,NULL,NULL),
(2242,614,'B','1/6',0,'',0,NULL,NULL),
(2243,614,'C','17/12',0,'',1,NULL,NULL),
(2244,614,'D','5/12',0,'',0,NULL,NULL),
(2245,615,'A','The supplement of an angle is acute',0,'',0,NULL,NULL),
(2246,615,'B','The complement of an angle is obtuse',0,'',0,NULL,NULL),
(2247,615,'C','The complement of any acute angle is acute',0,'',1,NULL,NULL),
(2248,615,'D','Two supplementary angles are congruent',0,'',0,NULL,NULL),
(2249,616,'A','3x3x7x7',0,'',0,NULL,NULL),
(2250,616,'B','2x3x13',0,'',0,NULL,NULL),
(2251,616,'C','3x7x13',0,'',1,NULL,NULL),
(2252,616,'D','3x3x6x9',0,'',0,NULL,NULL),
(2253,617,'A','1/4',0,'',1,NULL,NULL),
(2254,617,'B','1/3',0,'',0,NULL,NULL),
(2255,617,'C','1/2',0,'',0,NULL,NULL),
(2256,617,'D','¾',0,'',0,NULL,NULL),
(2257,618,'A','3000.2',0,'',0,NULL,NULL),
(2258,618,'B','3 150',0,'',0,NULL,NULL),
(2259,618,'C','3 200',0,'',1,NULL,NULL),
(2260,618,'D','3 215',0,'',0,NULL,NULL),
(2261,619,'A','A fraction is part of the whole.',0,'',0,NULL,NULL),
(2262,619,'B','A fraction is a part of a region.',0,'',0,NULL,NULL),
(2263,619,'C','A fraction is a part of a set.',0,'',0,NULL,NULL),
(2264,619,'D','All of the choices.',0,'',1,NULL,NULL),
(2265,620,'A','Stefan',0,'',1,NULL,NULL),
(2266,620,'B','Nickolai',0,'',0,NULL,NULL),
(2267,620,'C','Vincent',0,'',0,NULL,NULL),
(2268,620,'D','Lanlee',0,'',0,NULL,NULL),
(2269,621,'A','10',0,'',0,NULL,NULL),
(2270,621,'B','11',0,'',0,NULL,NULL),
(2271,621,'C','18',0,'',0,NULL,NULL),
(2272,621,'D','22',0,'',1,NULL,NULL),
(2273,622,'A','60',0,'',0,NULL,NULL),
(2274,622,'B','23',0,'',1,NULL,NULL),
(2275,622,'C','-40',0,'',0,NULL,NULL),
(2276,622,'D','-2',0,'',0,NULL,NULL),
(2277,623,'A','2%',0,'',0,NULL,NULL),
(2278,623,'B','5%',0,'',1,NULL,NULL),
(2279,623,'C','6.5%',0,'',0,NULL,NULL),
(2280,623,'D','10%',0,'',0,NULL,NULL),
(2281,624,'A','2',0,'',0,NULL,NULL),
(2282,624,'B','4',0,'',0,NULL,NULL),
(2283,624,'C','16',0,'',0,NULL,NULL),
(2284,624,'D','21',0,'',1,NULL,NULL),
(2285,625,'A','3%',0,'',1,NULL,NULL),
(2286,625,'B','2.08',0,'',0,NULL,NULL),
(2287,625,'C','1',0,'',0,NULL,NULL),
(2288,625,'D','– 1/6',0,'',0,NULL,NULL),
(2289,626,'A','8',0,'',1,NULL,NULL),
(2290,626,'B','11',0,'',0,NULL,NULL),
(2291,626,'C','14',0,'',0,NULL,NULL),
(2292,626,'D','30',0,'',0,NULL,NULL),
(2293,627,'A','2',0,'',0,NULL,NULL),
(2294,627,'B','4',0,'',1,NULL,NULL),
(2295,627,'C','infinite',0,'',0,NULL,NULL),
(2296,627,'D','cannot be determined',0,'',0,NULL,NULL),
(2297,628,'A','It is any pattern made of repeating shapes that covers a surface completely without overlap or any gap.',0,'',1,NULL,NULL),
(2298,628,'B','It is a pattern made up of repeating shapes that covers a surface completely without a gap that has an overlap.',0,'',0,NULL,NULL),
(2299,628,'C','It is a pattern made of repeating shapes that covers a surface completely without an overlap but leaves a gap.',0,'',0,NULL,NULL),
(2300,628,'D','It is a pattern made of repeating shapes that doesn’t necessarily cover a surface completely; it has gap and overlap.',0,'',0,NULL,NULL),
(2301,629,'A','356',0,'',0,NULL,NULL),
(2302,629,'B','456',0,'',0,NULL,NULL),
(2303,629,'C','529',0,'',0,NULL,NULL),
(2304,629,'D','551',0,'',1,NULL,NULL),
(2305,630,'A','24',0,'',0,NULL,NULL),
(2306,630,'B','33',0,'',1,NULL,NULL),
(2307,630,'C','39',0,'',0,NULL,NULL),
(2308,630,'D','48',0,'',0,NULL,NULL),
(2309,631,'A','1/2',0,'',0,NULL,NULL),
(2310,631,'B','3/4',0,'',1,NULL,NULL),
(2311,631,'C','3/8',0,'',0,NULL,NULL),
(2312,631,'D','5/16',0,'',0,NULL,NULL),
(2313,632,'A','m= 125; n=150',0,'',0,NULL,NULL),
(2314,632,'B','m= 150; n=125',0,'',1,NULL,NULL),
(2315,632,'C','m= 175; n=150',0,'',0,NULL,NULL),
(2316,632,'D','m= 150; n=175',0,'',0,NULL,NULL),
(2317,633,'A','8/10',0,'',0,NULL,NULL),
(2318,633,'B','4/5',0,'',1,NULL,NULL),
(2319,633,'C','2/10',0,'',0,NULL,NULL),
(2320,633,'D','1/5',0,'',0,NULL,NULL),
(2321,634,'A','6 + 3 x 4',0,'',0,NULL,NULL),
(2322,634,'B','6 x 4 + 3',0,'',1,NULL,NULL),
(2323,634,'C','6 + 4 x 3',0,'',0,NULL,NULL),
(2324,634,'D','2 + 6 x 4',0,'',0,NULL,NULL),
(2325,635,'A','30 years',0,'',1,NULL,NULL),
(2326,635,'B','32 years',0,'',0,NULL,NULL),
(2327,635,'C','34 years',0,'',0,NULL,NULL),
(2328,635,'D','46 years',0,'',0,NULL,NULL),
(2329,636,'A','10',0,'',0,NULL,NULL),
(2330,636,'B','1',0,'',0,NULL,NULL),
(2331,636,'C','0.1',0,'',1,NULL,NULL),
(2332,636,'D','0.01',0,'',0,NULL,NULL),
(2333,637,'A','a + b + c',0,'',0,NULL,NULL),
(2334,637,'B','',1,'4b968a0898bf8296e37c0816ebdda4d0.png',0,NULL,NULL),
(2335,637,'C','abc',0,'',1,NULL,NULL),
(2336,637,'D','(a + b) + c',0,'',0,NULL,NULL),
(2337,638,'A','140',0,'',0,NULL,NULL),
(2338,638,'B','139',0,'',0,NULL,NULL),
(2339,638,'C','163',0,'',1,NULL,NULL),
(2340,638,'D','175',0,'',0,NULL,NULL),
(2341,638,'E','181',0,'',0,NULL,NULL),
(2342,639,'A','225',0,'',0,NULL,NULL),
(2343,639,'B','91',0,'',0,NULL,NULL),
(2344,639,'C','128',0,'',0,NULL,NULL),
(2345,639,'D','125',0,'',1,NULL,NULL),
(2346,639,'E','100',0,'',0,NULL,NULL),
(2347,640,'A','60',0,'',0,NULL,NULL),
(2348,640,'B','70',0,'',0,NULL,NULL),
(2349,640,'C','80',0,'',1,NULL,NULL),
(2350,640,'D','50',0,'',0,NULL,NULL),
(2351,640,'E','40',0,'',0,NULL,NULL),
(2352,641,'A','21',0,'',1,NULL,NULL),
(2353,641,'B','20',0,'',0,NULL,NULL),
(2354,641,'C','18',0,'',0,NULL,NULL),
(2355,641,'D','19',0,'',0,NULL,NULL),
(2356,641,'E','22',0,'',0,NULL,NULL),
(2357,642,'A','60%',0,'',0,NULL,NULL),
(2358,642,'B','50%',0,'',0,NULL,NULL),
(2359,642,'C','42%',0,'',0,NULL,NULL),
(2360,642,'D','52.5%',0,'',0,NULL,NULL),
(2361,642,'E','51.2%',0,'',1,NULL,NULL),
(2362,643,'A','480',0,'',1,NULL,NULL),
(2363,643,'B','120',0,'',0,NULL,NULL),
(2364,643,'C','240',0,'',0,NULL,NULL),
(2365,643,'D','420',0,'',0,NULL,NULL),
(2366,643,'E','none of these Analogies',0,'',0,NULL,NULL),
(2367,644,'A','11.50',0,'',0,NULL,NULL),
(2368,644,'B','12.75',0,'',1,NULL,NULL),
(2369,644,'C','13.25',0,'',0,NULL,NULL),
(2370,644,'D','14.85',0,'',0,NULL,NULL),
(2371,644,'E','15.35',0,'',0,NULL,NULL),
(2372,645,'A','2/3',0,'',0,NULL,NULL),
(2373,645,'B','4/5',0,'',1,NULL,NULL),
(2374,645,'C','5/6',0,'',0,NULL,NULL),
(2375,645,'D','6/7',0,'',0,NULL,NULL),
(2376,645,'E','3/5',0,'',0,NULL,NULL),
(2377,646,'A','0.625',0,'',1,NULL,NULL),
(2378,646,'B','1.125',0,'',0,NULL,NULL),
(2379,646,'C','1.625',0,'',0,NULL,NULL),
(2380,646,'D','2.125',0,'',0,NULL,NULL),
(2381,646,'E','6.250',0,'',0,NULL,NULL),
(2382,647,'A','7',0,'',0,NULL,NULL),
(2383,647,'B','8',0,'',0,NULL,NULL),
(2384,647,'C','9',0,'',0,NULL,NULL),
(2385,647,'D','10',0,'',1,NULL,NULL),
(2386,647,'E','15',0,'',0,NULL,NULL),
(2387,648,'A','5r+c',0,'',0,NULL,NULL),
(2388,648,'B','3c-3r',0,'',0,NULL,NULL),
(2389,648,'C','',1,'584cec3a843ec7f163ffc8d03d7e0c3e.png',0,NULL,NULL),
(2390,648,'D','10+rc',0,'',1,NULL,NULL),
(2391,648,'E','',1,'525f12d4a8dd5d588c8c66226929c3dd.png',0,NULL,NULL),
(2392,649,'A','The sum of two odd numbers is odd.',0,'',0,NULL,NULL),
(2393,649,'B','The sum of one odd number and one even number is even.',0,'',0,NULL,NULL),
(2394,649,'C','The sum of two odd numbers is even.',0,'',1,NULL,NULL),
(2395,649,'D','The product of two odd numbers is even.',0,'',0,NULL,NULL),
(2396,649,'E','The product of an odd number and an even number is odd.',0,'',0,NULL,NULL),
(2397,650,'A','I and II only',0,'',0,NULL,NULL),
(2398,650,'B','II and III only',0,'',0,NULL,NULL),
(2399,650,'C','I, II, V, and VI only',0,'',0,NULL,NULL),
(2400,650,'D',', II, III, V, and VI only',0,'',1,NULL,NULL),
(2401,650,'E','I, II, III, VI and V only',0,'',0,NULL,NULL),
(2402,651,'A','856,247',0,'',0,NULL,NULL),
(2403,651,'B','625,874',0,'',0,NULL,NULL),
(2404,651,'C','147,414',0,'',1,NULL,NULL),
(2405,651,'D','235,465',0,'',0,NULL,NULL),
(2406,651,'E','142,546',0,'',0,NULL,NULL),
(2407,652,'A','Il Verico',0,'',0,NULL,NULL),
(2408,652,'B','Concepcion',0,'',0,NULL,NULL),
(2409,652,'C','Arica',0,'',0,NULL,NULL),
(2410,652,'D','Santiago',0,'',1,NULL,NULL),
(2411,653,'A','Ben Nevis',0,'',1,NULL,NULL),
(2412,653,'B','Scafell Pike',0,'',0,NULL,NULL),
(2413,653,'C','Scottish Highlands',0,'',0,NULL,NULL),
(2414,653,'D','Skiddaw',0,'',0,NULL,NULL),
(2415,654,'A','35, 424',0,'',1,NULL,NULL),
(2416,654,'B','35, 000',0,'',0,NULL,NULL),
(2417,654,'C','18, 396',0,'',0,NULL,NULL),
(2418,654,'D','36, 232',0,'',0,NULL,NULL),
(2419,654,'E','98, 120',0,'',0,NULL,NULL),
(2420,655,'A','Monaco',0,'',0,NULL,NULL),
(2421,655,'B','Vatican City',0,'',1,NULL,NULL),
(2422,655,'C','Tuvalu',0,'',0,NULL,NULL),
(2423,655,'D','Nauru',0,'',0,NULL,NULL),
(2424,656,'A','Italy',0,'',0,NULL,NULL),
(2425,656,'B','Spain',0,'',0,NULL,NULL),
(2426,656,'C','Canada',0,'',1,NULL,NULL),
(2427,656,'D','Great Britain',0,'',0,NULL,NULL),
(2428,657,'A','33, 024',0,'',0,NULL,NULL),
(2429,657,'B','51, 234',0,'',0,NULL,NULL),
(2430,657,'C','33, 222',0,'',0,NULL,NULL),
(2431,657,'D','87, 136',0,'',1,NULL,NULL),
(2432,657,'E','68, 334',0,'',0,NULL,NULL),
(2433,658,'A','2',0,'',0,NULL,NULL),
(2434,658,'B','6',0,'',0,NULL,NULL),
(2435,658,'C','4',0,'',1,NULL,NULL),
(2436,658,'D','8',0,'',0,NULL,NULL),
(2437,659,'A','1/9',0,'',1,NULL,NULL),
(2438,659,'B','1/6',0,'',0,NULL,NULL),
(2439,659,'C','-1/6',0,'',0,NULL,NULL),
(2440,659,'D','-9',0,'',0,NULL,NULL),
(2441,659,'E','-1/9',0,'',0,NULL,NULL),
(2442,660,'A','16',0,'',0,NULL,NULL),
(2443,660,'B','17',0,'',0,NULL,NULL),
(2444,660,'C','9',0,'',1,NULL,NULL),
(2445,660,'D','8',0,'',0,NULL,NULL),
(2446,660,'E','25',0,'',0,NULL,NULL),
(2447,661,'A','-750',0,'',0,NULL,NULL),
(2448,661,'B','500',0,'',1,NULL,NULL),
(2449,661,'C','35',0,'',0,NULL,NULL),
(2450,661,'D','5',0,'',0,NULL,NULL),
(2451,661,'E','-500',0,'',0,NULL,NULL),
(2452,662,'A','1',0,'',0,NULL,NULL),
(2453,662,'B','4',0,'',0,NULL,NULL),
(2454,662,'C','1/2',0,'',0,NULL,NULL),
(2455,662,'D','1/4',0,'',1,NULL,NULL),
(2456,662,'E','1/5',0,'',0,NULL,NULL),
(2457,663,'A','7/8',0,'',0,NULL,NULL),
(2458,663,'B','3/8',0,'',0,NULL,NULL),
(2459,663,'C','5/8',0,'',1,NULL,NULL),
(2460,663,'D','1 and 3/5',0,'',0,NULL,NULL),
(2461,663,'E','3/4',0,'',0,NULL,NULL),
(2462,664,'A','5/8',0,'',0,NULL,NULL),
(2463,664,'B','1  1/24',0,'',1,NULL,NULL),
(2464,664,'C','1/16',0,'',0,NULL,NULL),
(2465,664,'D','3/8',0,'',0,NULL,NULL),
(2466,664,'E','24/25',0,'',0,NULL,NULL),
(2467,665,'A','-3/7',0,'',0,NULL,NULL),
(2468,665,'B','9/56',0,'',1,NULL,NULL),
(2469,665,'C','-9/56',0,'',0,NULL,NULL),
(2470,665,'D','3/7',0,'',0,NULL,NULL),
(2471,665,'E','e2/7',0,'',0,NULL,NULL),
(2472,666,'A','21/5',0,'',1,NULL,NULL),
(2473,666,'B','21/10',0,'',0,NULL,NULL),
(2474,666,'C','20',0,'',0,NULL,NULL),
(2475,666,'D','10',0,'',0,NULL,NULL),
(2476,666,'E','5',0,'',0,NULL,NULL),
(2477,667,'A','28,400',0,'',0,NULL,NULL),
(2478,667,'B','28,500',0,'',1,NULL,NULL),
(2479,667,'C','28,000',0,'',0,NULL,NULL),
(2480,667,'D','29,000',0,'',0,NULL,NULL),
(2481,667,'E','28,490',0,'',0,NULL,NULL),
(2482,668,'A','Malacanang Palace',0,'',0,NULL,NULL),
(2483,668,'B','Grand Opera House',0,'',1,NULL,NULL),
(2484,668,'C','Session Hall of the Philippine Comission',0,'',0,NULL,NULL),
(2485,668,'D','Metropolitan Theater of the Philippines',0,'',0,NULL,NULL),
(2486,669,'A','The Acta de Tejeros',0,'',1,NULL,NULL),
(2487,669,'B','The Tejeros',0,'',0,NULL,NULL),
(2488,669,'C','The Acta de Imus',0,'',0,NULL,NULL),
(2489,669,'D','The Acta del Sol',0,'',0,NULL,NULL),
(2490,670,'A','8',0,'',0,NULL,NULL),
(2491,670,'B','3',0,'',0,NULL,NULL),
(2492,670,'C','5',0,'',1,NULL,NULL),
(2493,670,'D','10',0,'',0,NULL,NULL),
(2494,671,'A','Arab',0,'',0,NULL,NULL),
(2495,671,'B','Indonesian',0,'',1,NULL,NULL),
(2496,671,'C','Malay',0,'',0,NULL,NULL),
(2497,671,'D','Indian',0,'',0,NULL,NULL),
(2498,672,'A','Malayo-Polynesian',0,'',0,NULL,NULL),
(2499,672,'B','Sanskrit',0,'',0,NULL,NULL),
(2500,672,'C','Arabic',0,'',1,NULL,NULL),
(2501,672,'D','Mandarin',0,'',0,NULL,NULL),
(2502,673,'A','Lucio Tan',0,'',0,NULL,NULL),
(2503,673,'B','Chau-ju-kua',0,'',0,NULL,NULL),
(2504,673,'C','Cheng Ho',0,'',1,NULL,NULL),
(2505,673,'D','Ko ch\'a-lao',0,'',0,NULL,NULL),
(2506,674,'A','Lee Min Ho',0,'',0,NULL,NULL),
(2507,674,'B','So Ji Sub',0,'',0,NULL,NULL),
(2508,674,'C','Kim Soo Hyun',0,'',1,NULL,NULL),
(2509,674,'D','Hyun Bin',0,'',0,NULL,NULL),
(2510,675,'A','Subclavian artery',0,'',0,NULL,NULL),
(2511,675,'B','Common carotid artery',0,'',0,NULL,NULL),
(2512,675,'C','Arch of aorta',0,'',0,NULL,NULL),
(2513,675,'D','Branchiocephalic trunk',0,'',1,NULL,NULL),
(2514,676,'A','Ulnar artery',0,'',0,NULL,NULL),
(2515,676,'B','Radial artery',0,'',0,NULL,NULL),
(2516,676,'C','Brachial artery',0,'',1,NULL,NULL),
(2517,676,'D','Profunda branchii',0,'',0,NULL,NULL),
(2518,677,'A','Radial artery',0,'',1,NULL,NULL),
(2519,677,'B','Ulnar artery',0,'',0,NULL,NULL),
(2520,677,'C','Deep palmar arch',0,'',0,NULL,NULL),
(2521,677,'D','Brachial artery',0,'',0,NULL,NULL),
(2522,678,'A','Volkmann’s Contracture',0,'',1,NULL,NULL),
(2523,678,'B','Ulnar claw',0,'',0,NULL,NULL),
(2524,678,'C','Hand of benediction',0,'',0,NULL,NULL),
(2525,678,'D','Carpel tunnel syndrome',0,'',0,NULL,NULL),
(2526,679,'A','Abduction',0,'',0,NULL,NULL),
(2527,679,'B','Eversion',0,'',0,NULL,NULL),
(2528,679,'C','Flexion',0,'',1,NULL,NULL),
(2529,679,'D','Pronation',0,'',0,NULL,NULL),
(2530,680,'A','Adrenal glands',0,'',0,NULL,NULL),
(2531,680,'B','Hypothalamus',0,'',1,NULL,NULL),
(2532,680,'C','Pancreas',0,'',0,NULL,NULL),
(2533,680,'D','Thalamus',0,'',0,NULL,NULL),
(2534,681,'A','Calcaneus',0,'',0,NULL,NULL),
(2535,681,'B','Femur',0,'',1,NULL,NULL),
(2536,681,'C','Symphysis pubis',0,'',0,NULL,NULL),
(2537,681,'D','Tibia',0,'',0,NULL,NULL),
(2538,682,'A','Crohn\'s disease',0,'',0,NULL,NULL),
(2539,682,'B','Diabetes mellitus',0,'',0,NULL,NULL),
(2540,682,'C','Graves\' disease',0,'',0,NULL,NULL),
(2541,682,'D','Pernicious anemia',0,'',1,NULL,NULL),
(2542,683,'A','Collagen',0,'',1,NULL,NULL),
(2543,683,'B','Heparin',0,'',0,NULL,NULL),
(2544,683,'C','Melanin',0,'',0,NULL,NULL),
(2545,683,'D','Sebum',0,'',0,NULL,NULL),
(2546,684,'A','Dyslexia',0,'',0,NULL,NULL),
(2547,684,'B','Epilepsy',0,'',0,NULL,NULL),
(2548,684,'C','Hydrocephalus',0,'',0,NULL,NULL),
(2549,684,'D','Narcolepsy',0,'',1,NULL,NULL),
(2550,685,'A','Gallbladder',0,'',0,NULL,NULL),
(2551,685,'B','Kidney',0,'',0,NULL,NULL),
(2552,685,'C','Liver',0,'',1,NULL,NULL),
(2553,685,'D','Stomach',0,'',0,NULL,NULL),
(2554,686,'A','open spaces, spiders',0,'',0,NULL,NULL),
(2555,686,'B','spiders, open spaces',0,'',0,NULL,NULL),
(2556,686,'C','heights, spiders',0,'',1,NULL,NULL),
(2557,686,'D','spiders, heights',0,'',0,NULL,NULL),
(2558,687,'A','it seems to occur only in North America',0,'',0,NULL,NULL),
(2559,687,'B','only people who have undergone psychoanalysis are ever diagnosed with it',0,'',0,NULL,NULL),
(2560,687,'C','people who “suffer” from it do not regard their feelings or behaviours as a disorder',0,'',1,NULL,NULL),
(2561,687,'D','it has a prevalence rate of zero',0,'',0,NULL,NULL),
(2562,688,'A','schizophrenia',0,'',0,NULL,NULL),
(2563,688,'B','dissociative fugue',0,'',0,NULL,NULL),
(2564,688,'C','multiple personality disorder',0,'',1,NULL,NULL),
(2565,688,'D','generalized anxiety disorder',0,'',0,NULL,NULL),
(2566,689,'A','infancy',0,'',0,NULL,NULL),
(2567,689,'B','childhood',0,'',0,NULL,NULL),
(2568,689,'C','early adulthood',0,'',1,NULL,NULL),
(2569,689,'D','old age',0,'',0,NULL,NULL),
(2570,690,'A','positive',0,'',1,NULL,NULL),
(2571,690,'B','cognitive',0,'',0,NULL,NULL),
(2572,690,'C','negative',0,'',0,NULL,NULL),
(2573,690,'D','transitive',0,'',0,NULL,NULL),
(2574,691,'A','14.3/100',0,'',0,NULL,NULL),
(2575,691,'B','14  3/10',0,'',0,NULL,NULL),
(2576,691,'C','143/100',0,'',0,NULL,NULL),
(2577,691,'D','143/1000',0,'',1,NULL,NULL),
(2578,691,'E','143/100',0,'',0,NULL,NULL),
(2579,692,'A','43',0,'',0,NULL,NULL),
(2580,692,'B','42',0,'',0,NULL,NULL),
(2581,692,'C','44',0,'',0,NULL,NULL),
(2582,692,'D','54',0,'',0,NULL,NULL),
(2583,692,'E','46',0,'',1,NULL,NULL),
(2584,693,'A','3,520',0,'',1,NULL,NULL),
(2585,693,'B','35,200',0,'',0,NULL,NULL),
(2586,693,'C','2.2',0,'',0,NULL,NULL),
(2587,693,'D','352',0,'',0,NULL,NULL),
(2588,693,'E','220',0,'',0,NULL,NULL),
(2589,694,'A','P80',0,'',1,NULL,NULL),
(2590,694,'B','54',0,'',0,NULL,NULL),
(2591,694,'C','90',0,'',0,NULL,NULL),
(2592,694,'D','104',0,'',0,NULL,NULL),
(2593,694,'E','20',0,'',0,NULL,NULL),
(2594,695,'A','84',0,'',1,NULL,NULL),
(2595,695,'B','54',0,'',0,NULL,NULL),
(2596,695,'C','90',0,'',0,NULL,NULL),
(2597,695,'D','104',0,'',0,NULL,NULL),
(2598,695,'E','20',0,'',0,NULL,NULL),
(2599,696,'A','125,000',0,'',1,NULL,NULL),
(2600,696,'B','312,500',0,'',0,NULL,NULL),
(2601,696,'C','500,000',0,'',0,NULL,NULL),
(2602,696,'D','1,250,000',0,'',0,NULL,NULL),
(2603,696,'E','375,000',0,'',0,NULL,NULL),
(2604,697,'A','P 1,400.00',0,NULL,0,NULL,'2021-06-18 15:31:21'),
(2605,697,'B','P 200.00',0,NULL,1,NULL,'2021-06-18 15:31:21'),
(2606,697,'C','P 250.00',0,NULL,0,NULL,'2021-06-18 15:31:21'),
(2607,697,'D','P 160.00',0,NULL,0,NULL,'2021-06-18 15:31:21'),
(2608,698,'A','Anterograde Amnesia',0,'',1,NULL,NULL),
(2609,698,'B','Retrograde Amnesia',0,'',0,NULL,NULL),
(2610,698,'C','Collective Amnesia',0,'',0,NULL,NULL),
(2611,698,'D','Social Amnesia',0,'',0,NULL,NULL),
(2612,699,'A','1:3',0,'',0,NULL,NULL),
(2613,699,'B','3:20',0,'',0,NULL,NULL),
(2614,699,'C','5:12',0,'',1,NULL,NULL),
(2615,699,'D','3:4',0,'',0,NULL,NULL),
(2616,699,'E','5:4',0,'',0,NULL,NULL),
(2617,700,'A','1',0,'',1,NULL,NULL),
(2618,700,'B','2',0,'',0,NULL,NULL),
(2619,700,'C','3',0,'',0,NULL,NULL),
(2620,700,'D','4',0,'',0,NULL,NULL),
(2621,700,'E','5',0,'',0,NULL,NULL),
(2622,701,'A','8',0,'',0,NULL,NULL),
(2623,701,'B','16',0,'',1,NULL,NULL),
(2624,701,'C','18',0,'',0,NULL,NULL),
(2625,701,'D','24',0,'',0,NULL,NULL),
(2626,701,'E','60',0,'',0,NULL,NULL),
(2627,702,'A','14cm, 13cm',0,'',0,NULL,NULL),
(2628,702,'B','18cm, 15cm',0,'',0,NULL,NULL),
(2629,702,'C','30cm, 26cm',0,'',0,NULL,NULL),
(2630,702,'D','16cm, 12cm',0,'',1,NULL,NULL),
(2631,702,'E','none of these',0,'',0,NULL,NULL),
(2632,703,'A','2/25',0,'',0,NULL,NULL),
(2633,703,'B','2/23',0,'',1,NULL,NULL),
(2634,703,'C','25/2',0,'',0,NULL,NULL),
(2635,703,'D','23/2',0,'',0,NULL,NULL),
(2636,703,'E','none of these',0,'',0,NULL,NULL),
(2637,704,'A','4 hrs',0,'',0,NULL,NULL),
(2638,704,'B','8 hrs',0,'',0,NULL,NULL),
(2639,704,'C','10 hrs',0,'',0,NULL,NULL),
(2640,704,'D','12 hrs',0,'',0,NULL,NULL),
(2641,704,'E','18 hrs',0,'',1,NULL,NULL),
(2642,705,'A','2',0,'',0,NULL,NULL),
(2643,705,'B','1',0,'',0,NULL,NULL),
(2644,705,'C','160',0,'',0,NULL,NULL),
(2645,705,'D','-160',0,'',1,NULL,NULL),
(2646,705,'E','0',0,'',0,NULL,NULL),
(2647,706,'A','12',0,'',1,NULL,NULL),
(2648,706,'B','15',0,'',0,NULL,NULL),
(2649,706,'C','-1',0,'',0,NULL,NULL),
(2650,706,'D','20',0,'',0,NULL,NULL),
(2651,706,'E','25',0,'',0,NULL,NULL),
(2652,707,'A','13/8',0,'',0,NULL,NULL),
(2653,707,'B','5/6',0,'',0,NULL,NULL),
(2654,707,'C','13/16',0,'',1,NULL,NULL),
(2655,707,'D','20',0,'',0,NULL,NULL),
(2656,708,'A','0',0,'',0,NULL,NULL),
(2657,708,'B','20',0,'',0,NULL,NULL),
(2658,708,'C','44',0,'',1,NULL,NULL),
(2659,708,'D','64',0,'',0,NULL,NULL),
(2660,708,'E','88',0,'',0,NULL,NULL),
(2661,709,'A','Latin, Ethichos',0,'',0,NULL,NULL),
(2662,709,'B','Spanish, Ethiecos',0,'',0,NULL,NULL),
(2663,709,'C','Greek, Ethika',0,'',0,NULL,NULL),
(2664,709,'D','Latin, Ethicus',0,'',1,NULL,NULL),
(2665,710,'A','7',0,'',0,NULL,NULL),
(2666,710,'B','5',0,'',0,NULL,NULL),
(2667,710,'C','10',0,'',1,NULL,NULL),
(2668,710,'D','15',0,'',0,NULL,NULL),
(2669,710,'E','8',0,'',0,NULL,NULL),
(2670,711,'A','16',0,'',0,NULL,NULL),
(2671,711,'B','32',0,'',0,NULL,NULL),
(2672,711,'C','36',0,'',0,NULL,NULL),
(2673,711,'D','52',0,'',0,NULL,NULL),
(2674,711,'E','48',0,'',1,NULL,NULL),
(2675,712,'A','4',0,'',0,NULL,NULL),
(2676,712,'B','6',0,'',0,NULL,NULL),
(2677,712,'C','8',0,'',1,NULL,NULL),
(2678,712,'D','12',0,'',0,NULL,NULL),
(2679,712,'E','none of the above',0,'',0,NULL,NULL),
(2680,713,'A','Maxwell Scheler',0,'',0,NULL,NULL),
(2681,713,'B','Max Ferdinand Scheler',0,'',1,NULL,NULL),
(2682,713,'C','Maximus Scheler',0,'',0,NULL,NULL),
(2683,713,'D','Max Matthew Scheler',0,'',0,NULL,NULL),
(2684,714,'A','15',0,'',1,NULL,NULL),
(2685,714,'B','30',0,'',0,NULL,NULL),
(2686,714,'C','11',0,'',0,NULL,NULL),
(2687,714,'D','22',0,'',0,NULL,NULL),
(2688,714,'E','13',0,'',0,NULL,NULL),
(2689,715,'A','42',0,'',0,NULL,NULL),
(2690,715,'B','44',0,'',0,NULL,NULL),
(2691,715,'C','48',0,'',1,NULL,NULL),
(2692,715,'D','none of these',0,'',0,NULL,NULL),
(2693,717,'A','5040',0,'',0,NULL,NULL),
(2694,717,'B','10080',0,'',1,NULL,NULL),
(2695,717,'C','25200',0,'',0,NULL,NULL),
(2696,717,'D','1440',0,'',0,NULL,NULL),
(2697,717,'E','420',0,'',0,NULL,NULL),
(2698,718,'A','9:25 pm',0,'',0,NULL,NULL),
(2699,718,'B','6:30 pm',0,'',0,NULL,NULL),
(2700,718,'C','5:25 pm',0,'',0,NULL,NULL),
(2701,718,'D','3:25 pm',0,'',0,NULL,NULL),
(2702,718,'E','3:15 pm',0,'',1,NULL,NULL),
(2703,719,'A','smelting',0,'',1,NULL,NULL),
(2704,719,'B','roasting',0,'',0,NULL,NULL),
(2705,719,'C','calcinations',0,'',0,NULL,NULL),
(2706,719,'D','froth flotation',0,'',0,NULL,NULL),
(2707,720,'A','granite',0,'',0,NULL,NULL),
(2708,720,'B','basalt',0,'',0,NULL,NULL),
(2709,720,'C','igneous rocks',0,'',1,NULL,NULL),
(2710,720,'D','sedimentary rocks',0,'',0,NULL,NULL),
(2711,721,'A','Dalton\'s law',0,'',0,NULL,NULL),
(2712,721,'B','Gay Lussac\'s law',0,'',0,NULL,NULL),
(2713,721,'C','Henry\'s law',0,'',1,NULL,NULL),
(2714,721,'D','Raoult\'s law',0,'',0,NULL,NULL),
(2715,722,'A','helium',0,'',0,NULL,NULL),
(2716,722,'B','ozone',0,'',1,NULL,NULL),
(2717,722,'C','oxygen',0,'',0,NULL,NULL),
(2718,722,'D','methane',0,'',0,NULL,NULL),
(2719,723,'A','alcohol',0,'',0,NULL,NULL),
(2720,723,'B','carbon dioxide',0,'',0,NULL,NULL),
(2721,723,'C','chlorine',0,'',1,NULL,NULL),
(2722,723,'D','sodium chlorine',0,'',0,NULL,NULL),
(2723,724,'A','specific heat',0,'',0,NULL,NULL),
(2724,724,'B','thermal capacity',0,'',1,NULL,NULL),
(2725,724,'C','water equivalent',0,'',0,NULL,NULL),
(2726,724,'D','None of the above',0,'',0,NULL,NULL),
(2727,725,'A','Ni',0,'',1,NULL,NULL),
(2728,725,'B','Pb',0,'',0,NULL,NULL),
(2729,725,'C','Cu',0,'',0,NULL,NULL),
(2730,725,'D','Pt',0,'',0,NULL,NULL),
(2731,726,'A','protons (alpha particles)',0,'',0,NULL,NULL),
(2732,726,'B','electrons (beta particles)',0,'',0,NULL,NULL),
(2733,726,'C','gamma rays (short wave electromagnetic waves)',0,'',0,NULL,NULL),
(2734,726,'D','All of the above',0,'',1,NULL,NULL),
(2735,727,'A','vitamins',0,'',0,NULL,NULL),
(2736,727,'B','hormones',0,'',1,NULL,NULL),
(2737,727,'C','enzymes',0,'',0,NULL,NULL),
(2738,727,'D','None of the above',0,'',0,NULL,NULL),
(2739,728,'A','flowering plants',0,'',1,NULL,NULL),
(2740,728,'B','gymnosperms plants',0,'',0,NULL,NULL),
(2741,728,'C','pteridophytes',0,'',0,NULL,NULL),
(2742,728,'D','bryophytes',0,'',0,NULL,NULL),
(2743,729,'A','bulb',0,'',0,NULL,NULL),
(2744,729,'B','conn',0,'',0,NULL,NULL),
(2745,729,'C','modified root',0,'',1,NULL,NULL),
(2746,729,'D','tuber',0,'',0,NULL,NULL),
(2747,730,'A','fowl pox',0,'',0,NULL,NULL),
(2748,730,'B','tick fever',0,'',0,NULL,NULL),
(2749,730,'C','ranikhet',0,'',1,NULL,NULL),
(2750,730,'D','coryza',0,'',0,NULL,NULL),
(2751,731,'A','muscular',0,'',0,NULL,NULL),
(2752,731,'B','connective',0,'',1,NULL,NULL),
(2753,731,'C','epithelial',0,'',0,NULL,NULL),
(2754,731,'D','nervous',0,'',0,NULL,NULL),
(2755,732,'A','Biro Brothers',0,'',1,NULL,NULL),
(2756,732,'B','Waterman Brothers',0,'',0,NULL,NULL),
(2757,732,'C','Bicc Brothers',0,'',0,NULL,NULL),
(2758,732,'D','Write Brothers',0,'',0,NULL,NULL),
(2759,733,'A','Dynamite',0,'',0,NULL,NULL),
(2760,733,'B','Ladder',0,'',0,NULL,NULL),
(2761,733,'C','Race Cars',0,'',0,NULL,NULL),
(2762,733,'D','Parachute',0,'',1,NULL,NULL),
(2763,734,'A','G. Ferdinand Von Zeppelin',0,'',0,NULL,NULL),
(2764,734,'B','Sir Frank Whittle',0,'',0,NULL,NULL),
(2765,734,'C','Roger Bacon',0,'',1,NULL,NULL),
(2766,734,'D','Leo H Baekeland',0,'',0,NULL,NULL),
(2767,735,'A','Cohen & Boyer',0,'',1,NULL,NULL),
(2768,735,'B','Hunt & Davids',0,'',0,NULL,NULL),
(2769,735,'C','Sinclair & Roberts',0,'',0,NULL,NULL),
(2770,735,'D','Jaysson & Simons',0,'',0,NULL,NULL),
(2771,736,'A','Sofa Bed',0,'',0,NULL,NULL),
(2772,736,'B','Captains Chair',0,'',0,NULL,NULL),
(2773,736,'C','Waterbed',0,'',1,NULL,NULL),
(2774,736,'D','Hammock',0,'',0,NULL,NULL),
(2775,737,'A','fungus',0,'',0,NULL,NULL),
(2776,737,'B','bacterium',0,'',0,NULL,NULL),
(2777,737,'C','virus',0,'',1,NULL,NULL),
(2778,737,'D','none of these',0,'',0,NULL,NULL),
(2779,738,'A','because of desiccation and mechanical damage to the tissues',0,'',1,NULL,NULL),
(2780,738,'B','because no photosynthesis takes place at such low temperature',0,'',0,NULL,NULL),
(2781,738,'C','because respiration ceases at such low temperature',0,'',0,NULL,NULL),
(2782,738,'D','because there is no transpiration',0,'',0,NULL,NULL),
(2783,739,'A','halophytes',0,'',0,NULL,NULL),
(2784,739,'B','hydrophytes',0,'',0,NULL,NULL),
(2785,739,'C','mesophytes',0,'',1,NULL,NULL),
(2786,739,'D','xerophytes',0,'',0,NULL,NULL),
(2787,740,'A','Fermi',0,'',1,NULL,NULL),
(2788,740,'B','Angstrom',0,'',0,NULL,NULL),
(2789,740,'C','Newton',0,'',0,NULL,NULL),
(2790,740,'D','Tesla',0,'',0,NULL,NULL),
(2791,741,'A','they contain free electrons',0,'',1,NULL,NULL),
(2792,741,'B','the atoms are lightly packed',0,'',0,NULL,NULL),
(2793,741,'C','they have high melting point',0,'',0,NULL,NULL),
(2794,741,'D','All of the above',0,'',0,NULL,NULL),
(2795,742,'A','force',0,'',0,NULL,NULL),
(2796,742,'B','pressure',0,'',1,NULL,NULL),
(2797,742,'C','velocity',0,'',0,NULL,NULL),
(2798,742,'D','acceleration',0,'',0,NULL,NULL),
(2799,743,'A','locating submerged submarines',0,'',0,NULL,NULL),
(2800,743,'B','receiving a signals in a radio receiver',0,'',0,NULL,NULL),
(2801,743,'C','locating geostationary satellites',0,'',0,NULL,NULL),
(2802,743,'D','detecting and locating the position of objects such as airplanes',0,'',1,NULL,NULL),
(2803,744,'A','audio sounds',0,'',0,NULL,NULL),
(2804,744,'B','infrasonic',0,'',1,NULL,NULL),
(2805,744,'C','ultrasonic',0,'',0,NULL,NULL),
(2806,744,'D','supersonics',0,'',0,NULL,NULL),
(2807,745,'A','1850s',0,'',0,NULL,NULL),
(2808,745,'B','1860s',0,'',0,NULL,NULL),
(2809,745,'C','1870s',0,'',0,NULL,NULL),
(2810,745,'D','1900s',0,'',1,NULL,NULL),
(2811,746,'A','Image file',0,'',0,NULL,NULL),
(2812,746,'B','Animation/movie file',0,'',1,NULL,NULL),
(2813,746,'C','Mandatory Audio file',0,'',0,NULL,NULL),
(2814,746,'D','MS Office document',0,'',0,NULL,NULL),
(2815,747,'A','Shawn Fanning',0,'',0,NULL,NULL),
(2816,747,'B','Ada Byron Lovelace',0,'',0,NULL,NULL),
(2817,747,'C','Sabeer Bhatia',0,'',1,NULL,NULL),
(2818,747,'D','Ray Tomlinson',0,'',0,NULL,NULL),
(2819,748,'A','Inernet',0,'',0,NULL,NULL),
(2820,748,'B','Interanet',0,'',0,NULL,NULL),
(2821,748,'C','Local Area Network',0,'',1,NULL,NULL),
(2822,748,'D','Wide Area Network',0,'',0,NULL,NULL),
(2823,749,'A','Sound',0,'',0,NULL,NULL),
(2824,749,'B','Remote control',0,'',1,NULL,NULL),
(2825,749,'C','Color balance',0,'',0,NULL,NULL),
(2826,749,'D','High voltage',0,'',0,NULL,NULL),
(2827,750,'A','WordPerfect Document file',0,'',0,NULL,NULL),
(2828,750,'B','MS Office document',0,'',0,NULL,NULL),
(2829,750,'C','Animation/movie file',0,'',1,NULL,NULL),
(2830,750,'D','Image file',0,'',0,NULL,NULL),
(2831,751,'A','International Labour Organisation',0,'',1,NULL,NULL),
(2832,751,'B','Security Council',0,'',0,NULL,NULL),
(2833,751,'C','International Court of Justice',0,'',0,NULL,NULL),
(2834,751,'D','General Assembly',0,'',0,NULL,NULL),
(2835,752,'A','Rome',0,'',0,NULL,NULL),
(2836,752,'B','Geneva',0,'',0,NULL,NULL),
(2837,752,'C','New York',0,'',0,NULL,NULL),
(2838,752,'D','Paris',0,'',1,NULL,NULL),
(2839,753,'A','Japan, West Germany, USSR, UK and USA',0,'',0,NULL,NULL),
(2840,753,'B','Canada, China, France, USSR and USA',0,'',0,NULL,NULL),
(2841,753,'C','Germany, China, USSR, UK and USA',0,'',0,NULL,NULL),
(2842,753,'D','China, France, USSR, UK and USA',0,'',1,NULL,NULL),
(2846,755,'A','all gymnosperms, except conifers',0,'',0,NULL,NULL),
(2847,755,'B','only angiosperms',0,'',0,NULL,NULL),
(2848,755,'C','only conifers',0,'',1,NULL,NULL),
(2849,755,'D','angiosperms and all gymnosperms except conifers',0,'',0,NULL,NULL),
(2850,756,'A','Place for muscle attachment',0,'',0,NULL,NULL),
(2851,756,'B','Protection of vital organs',0,'',0,NULL,NULL),
(2852,756,'C','Secretion of hormones for calcium regulation in blood and bones',0,'',1,NULL,NULL),
(2853,756,'D','Production of blood corpuscles',0,'',0,NULL,NULL),
(2854,757,'A','1892 between England and India',0,NULL,0,NULL,'2021-06-16 09:29:12'),
(2855,757,'B','1869 between England and Australia',0,NULL,0,NULL,'2021-06-16 09:29:12'),
(2856,757,'C','1883 between Australia and Wales',0,NULL,0,NULL,'2021-06-16 09:29:12'),
(2857,757,'D','1844 between Canada and the USA',0,NULL,1,NULL,'2021-06-16 09:29:12'),
(2858,758,'A','nitrogen',0,'',1,NULL,NULL),
(2859,758,'B','hydrogen',0,'',0,NULL,NULL),
(2860,758,'C','carbon dioxide',0,'',0,NULL,NULL),
(2861,758,'D','oxygen',0,'',0,NULL,NULL),
(2862,759,'A','Sodium carbonate',0,'',1,NULL,NULL),
(2863,759,'B','Calcium bicarbonate',0,'',0,NULL,NULL),
(2864,759,'C','Sodium bicarbonate',0,'',0,NULL,NULL),
(2865,759,'D','Calcium carbonate',0,'',0,NULL,NULL),
(2866,760,'A','carbon',0,'',0,NULL,NULL),
(2867,760,'B','hydrogen',0,'',0,NULL,NULL),
(2868,760,'C','oxygen',0,'',1,NULL,NULL),
(2869,760,'D','nitrogen',0,'',0,NULL,NULL),
(2870,761,'A','See',0,'',0,NULL,NULL),
(2871,761,'B','Is seeing',0,'',0,NULL,NULL),
(2872,761,'C','Have seen',0,'',1,NULL,NULL),
(2873,761,'D','Has seen',0,'',0,NULL,NULL),
(2874,762,'A','Go',0,'',1,NULL,NULL),
(2875,762,'B','Goes',0,'',0,NULL,NULL),
(2876,762,'C','Am going',0,'',0,NULL,NULL),
(2877,762,'D','Has gone',0,'',0,NULL,NULL),
(2878,763,'A','Am knowing',0,'',0,NULL,NULL),
(2879,763,'B','Know',0,'',0,NULL,NULL),
(2880,763,'C','Have known',0,'',1,NULL,NULL),
(2881,763,'D','Have knew',0,'',0,NULL,NULL),
(2882,764,'A','Are',0,'',0,NULL,NULL),
(2883,764,'B','Are being',0,'',0,NULL,NULL),
(2884,764,'C','Have been',0,'',1,NULL,NULL),
(2885,764,'D','Are been',0,'',0,NULL,NULL),
(2886,765,'A','Write',0,'',0,NULL,NULL),
(2887,765,'B','Is writing',0,'',1,NULL,NULL),
(2888,765,'C','Writes',0,'',0,NULL,NULL),
(2889,765,'D','Has written',0,'',0,NULL,NULL),
(2890,766,'A','Had gone',0,'',0,NULL,NULL),
(2891,766,'B','Went',0,'',1,NULL,NULL),
(2892,766,'C','Was going',0,'',0,NULL,NULL),
(2893,766,'D','Had been going',0,'',0,NULL,NULL),
(2894,767,'A','Had met',0,'',0,NULL,NULL),
(2895,767,'B','Met',0,'',1,NULL,NULL),
(2896,767,'C','Was meeting',0,'',0,NULL,NULL),
(2897,767,'D','Had been meeting',0,'',0,NULL,NULL),
(2898,768,'A','Went',0,'',1,NULL,NULL),
(2899,768,'B','Had gone',0,'',0,NULL,NULL),
(2900,768,'C','Were going',0,'',0,NULL,NULL),
(2901,768,'D','Were gone',0,'',0,NULL,NULL),
(2902,769,'A','Was playing',0,'',1,NULL,NULL),
(2903,769,'B','Played',0,'',0,NULL,NULL),
(2904,769,'C','Play',0,'',0,NULL,NULL),
(2905,769,'D','Has played',0,'',0,NULL,NULL),
(2906,770,'A','had been taking',0,'',0,NULL,NULL),
(2907,770,'B','took',0,'',1,NULL,NULL),
(2908,770,'C','had taken',0,'',0,NULL,NULL),
(2909,770,'D','was taking',0,'',0,NULL,NULL),
(2910,771,'A','Take',0,'',0,NULL,NULL),
(2911,771,'B','Will take',0,'',1,NULL,NULL),
(2912,771,'C','Am taking',0,'',0,NULL,NULL),
(2913,771,'D','Am going to take',0,'',0,NULL,NULL),
(2914,772,'A','Goes',0,'',0,NULL,NULL),
(2915,772,'B','Shall go',0,'',0,NULL,NULL),
(2916,772,'C','Will go',0,'',0,NULL,NULL),
(2917,772,'D','Is going to go',0,'',1,NULL,NULL),
(2918,773,'A','Will buy',0,'',0,NULL,NULL),
(2919,773,'B','Shall buy',0,'',0,NULL,NULL),
(2920,773,'C','Are going to buy',0,'',1,NULL,NULL),
(2921,773,'D','buy',0,'',0,NULL,NULL),
(2922,774,'A','Am taking',0,'',0,NULL,NULL),
(2923,774,'B','Take',0,'',0,NULL,NULL),
(2924,774,'C','Am going to take',0,'',0,NULL,NULL),
(2925,774,'D','Will take',0,'',1,NULL,NULL),
(2926,775,'A','Is',0,'',0,NULL,NULL),
(2927,775,'B','Shall be',0,'',0,NULL,NULL),
(2928,775,'C','Is going to be',0,'',0,NULL,NULL),
(2929,775,'D','Will be',0,'',1,NULL,NULL),
(2930,776,'A','Breaks',0,'',0,NULL,NULL),
(2931,776,'B','Is broken',0,'',0,NULL,NULL),
(2932,776,'C','Was broken',0,'',1,NULL,NULL),
(2933,776,'D','broke',0,'',0,NULL,NULL),
(2934,777,'A','Will be completed',0,'',1,NULL,NULL),
(2935,777,'B','Is completed',0,'',0,NULL,NULL),
(2936,777,'C','Will completed',0,'',0,NULL,NULL),
(2937,777,'D','Completes',0,'',0,NULL,NULL),
(2938,778,'A','Were made',0,'',1,NULL,NULL),
(2939,778,'B','Made',0,'',0,NULL,NULL),
(2940,778,'C','Make',0,'',0,NULL,NULL),
(2941,778,'D','Were make',0,'',0,NULL,NULL),
(2942,779,'A','Delivers',0,'',0,NULL,NULL),
(2943,779,'B','Is delivered',0,'',1,NULL,NULL),
(2944,779,'C','Delivered',0,'',0,NULL,NULL),
(2945,779,'D','Is delivering',0,'',0,NULL,NULL),
(2946,780,'A','Was write',0,'',0,NULL,NULL),
(2947,780,'B','Wrote',0,'',0,NULL,NULL),
(2948,780,'C','Is written',0,'',0,NULL,NULL),
(2949,780,'D','Was written',0,'',1,NULL,NULL),
(2954,782,'A','May',0,'',0,NULL,NULL),
(2955,782,'B','Must',0,'',0,NULL,NULL),
(2956,782,'C','Should',0,'',0,NULL,NULL),
(2957,782,'D','Could',0,'',1,NULL,NULL),
(2958,783,'A','Can',0,'',0,NULL,NULL),
(2959,783,'B','May',0,'',0,NULL,NULL),
(2960,783,'C','Must',0,'',1,NULL,NULL),
(2961,783,'D','Might',0,'',0,NULL,NULL),
(2962,784,'A','Might',0,'',0,NULL,NULL),
(2963,784,'B','Can',0,'',1,NULL,NULL),
(2964,784,'C','Must',0,'',0,NULL,NULL),
(2965,784,'D','Have to',0,'',0,NULL,NULL),
(2966,785,'A','Have to',0,'',0,NULL,NULL),
(2967,785,'B','Should',0,'',0,NULL,NULL),
(2968,785,'C','Must',0,'',0,NULL,NULL),
(2969,785,'D','May',0,'',1,NULL,NULL),
(2970,786,'A','Might',0,'',0,NULL,NULL),
(2971,786,'B','Can',0,'',0,NULL,NULL),
(2972,786,'C','Must',0,'',1,NULL,NULL),
(2973,786,'D','May',0,'',0,NULL,NULL),
(2974,787,'A','Look out',0,'',0,NULL,NULL),
(2975,787,'B','Look after',0,'',1,NULL,NULL),
(2976,787,'C','Look forward to',0,'',0,NULL,NULL),
(2977,787,'D','Look for',0,'',0,NULL,NULL),
(2978,788,'A','Looking after',0,'',0,NULL,NULL),
(2979,788,'B','Looking for',0,'',0,NULL,NULL),
(2980,788,'C','Looking forward to',0,'',1,NULL,NULL),
(2981,788,'D','Looking at',0,'',0,NULL,NULL),
(2982,789,'A','Gave up',0,NULL,0,NULL,'2021-06-17 00:18:30'),
(2983,789,'B','Broke up',0,NULL,1,NULL,'2021-06-17 00:18:30'),
(2984,789,'C','Brought up',0,NULL,0,NULL,'2021-06-17 00:18:30'),
(2985,789,'D','Woke up',0,NULL,0,NULL,'2021-06-17 00:18:30'),
(2986,790,'A','Go on',0,'',0,NULL,NULL),
(2987,790,'B','Go back',0,'',0,NULL,NULL),
(2988,790,'C','Go ahead',0,'',0,NULL,NULL),
(2989,790,'D','Go in for',0,'',1,NULL,NULL),
(2990,791,'A','Set on',0,'',0,NULL,NULL),
(2991,791,'B','Set off',0,'',1,NULL,NULL),
(2992,791,'C','Set along with',0,'',0,NULL,NULL),
(2993,791,'D','Set up',0,'',0,NULL,NULL),
(2994,792,'A','Anything',0,'',0,NULL,NULL),
(2995,792,'B','Something',0,'',0,NULL,NULL),
(2996,792,'C','Everything',0,'',0,NULL,NULL),
(2997,792,'D','Nothing',0,'',1,NULL,NULL),
(2998,793,'A','Yourself',0,'',0,NULL,NULL),
(2999,793,'B','Itself',0,'',0,NULL,NULL),
(3000,793,'C','Herself',0,'',1,NULL,NULL),
(3001,793,'D','Himself',0,'',0,NULL,NULL),
(3002,794,'A','Nobody',0,'',0,NULL,NULL),
(3003,794,'B','Anybody',0,'',1,NULL,NULL),
(3004,794,'C','Everybody',0,'',0,NULL,NULL),
(3005,794,'D','Somebody',0,'',0,NULL,NULL),
(3006,795,'A','Him',0,'',0,NULL,NULL),
(3007,795,'B','Her',0,'',0,NULL,NULL),
(3008,795,'C','Them',0,'',1,NULL,NULL),
(3009,795,'D','They',0,'',0,NULL,NULL),
(3010,796,'A','Them',0,'',0,NULL,NULL),
(3011,796,'B','They’re',0,'',0,NULL,NULL),
(3012,796,'C','They’re',0,'',0,NULL,NULL),
(3013,796,'D','Their',0,'',1,NULL,NULL),
(3014,797,'A','Featherly',0,'',0,NULL,NULL),
(3015,797,'B','Feather',0,'',0,NULL,NULL),
(3016,797,'C','Feathery',0,'',1,NULL,NULL),
(3017,797,'D','Featheric',0,'',0,NULL,NULL),
(3018,798,'A','Grey little cute',0,'',0,NULL,NULL),
(3019,798,'B','Cute little grey',0,'',1,NULL,NULL),
(3020,798,'C','Little cute grey',0,'',0,NULL,NULL),
(3021,798,'D','Grey cute little',0,'',0,NULL,NULL),
(3022,799,'A','Ilpolite',0,NULL,0,NULL,'2021-06-17 01:28:24'),
(3023,799,'B','Unpolite',0,NULL,0,NULL,'2021-06-17 01:28:24'),
(3024,799,'C','Inpolite',0,NULL,0,NULL,'2021-06-17 01:28:24'),
(3025,799,'D','Impolite',0,NULL,1,NULL,'2021-06-17 01:28:24'),
(3026,800,'A','Imreliable',0,'',0,NULL,NULL),
(3027,800,'B','Irreliable',0,'',0,NULL,NULL),
(3028,800,'C','Unreliable',0,'',1,NULL,NULL),
(3029,800,'D','Inreliable',0,'',0,NULL,NULL),
(3030,801,'A','Ilattendtive',0,'',0,NULL,NULL),
(3031,801,'B','Unattentive',0,'',0,NULL,NULL),
(3032,801,'C','Inattentive',0,'',1,NULL,NULL),
(3033,801,'D','Imattentive',0,'',0,NULL,NULL),
(3034,802,'A','Closeful',0,'',0,NULL,NULL),
(3035,802,'B','Closefully',0,'',0,NULL,NULL),
(3036,802,'C','Close',0,'',1,NULL,NULL),
(3037,802,'D','Closely',0,'',0,NULL,NULL),
(3038,803,'A','Faster',0,'',0,NULL,NULL),
(3039,803,'B','Fast',0,'',1,NULL,NULL),
(3040,803,'C','Fastly',0,'',0,NULL,NULL),
(3041,803,'D','Fistful',0,'',0,NULL,NULL),
(3042,804,'A','Peevishly',0,'',0,NULL,NULL),
(3043,804,'B','Elegantly',0,'',1,NULL,NULL),
(3044,804,'C','Sharply',0,'',0,NULL,NULL),
(3045,804,'D','Bluntly',0,'',0,NULL,NULL),
(3046,805,'A','Definitely',0,'',0,NULL,NULL),
(3047,805,'B','Probably',0,'',1,NULL,NULL),
(3048,805,'C','Certainly',0,'',0,NULL,NULL),
(3049,805,'D','Surely',0,'',0,NULL,NULL),
(3050,806,'A','Sensorly',0,'',0,NULL,NULL),
(3051,806,'B','Sensibly',0,'',0,NULL,NULL),
(3052,806,'C','Sensitively',0,'',0,NULL,NULL),
(3053,806,'D','Sincerely',0,'',1,NULL,NULL),
(3054,807,'A','Over',0,'',1,NULL,NULL),
(3055,807,'B','Under',0,'',0,NULL,NULL),
(3056,807,'C','From',0,'',0,NULL,NULL),
(3057,807,'D','With',0,'',0,NULL,NULL),
(3058,808,'A','Out of',0,'',0,NULL,NULL),
(3059,808,'B','At',0,'',0,NULL,NULL),
(3060,808,'C','Of',0,'',0,NULL,NULL),
(3061,808,'D','From',0,'',1,NULL,NULL),
(3062,809,'A','With',0,'',0,NULL,NULL),
(3063,809,'B','During',0,'',1,NULL,NULL),
(3064,809,'C','By',0,'',0,NULL,NULL),
(3065,809,'D','For',0,'',0,NULL,NULL),
(3066,810,'A','On',0,'',0,NULL,NULL),
(3067,810,'B','At',0,'',1,NULL,NULL),
(3068,810,'C','From',0,'',0,NULL,NULL),
(3069,810,'D','For',0,'',0,NULL,NULL),
(3070,811,'A','On',0,'',0,NULL,NULL),
(3071,811,'B','At',0,'',1,NULL,NULL),
(3072,811,'C','In',0,'',0,NULL,NULL),
(3073,811,'D','For',0,'',0,NULL,NULL),
(3074,812,'A','the oldest of',0,'',0,NULL,NULL),
(3075,812,'B','older than',0,'',1,NULL,NULL),
(3076,812,'C','old than',0,'',0,NULL,NULL),
(3077,812,'D','as old as',0,'',0,NULL,NULL),
(3078,813,'A','will do; will go',0,'',0,NULL,NULL),
(3079,813,'B','will; do',0,'',0,NULL,NULL),
(3080,813,'C','will do; go',0,'',0,NULL,NULL),
(3081,813,'D','do; will go',0,'',1,NULL,NULL),
(3086,815,'A','in',0,'',0,NULL,NULL),
(3087,815,'B','into',0,'',1,NULL,NULL),
(3088,815,'C','out',0,'',0,NULL,NULL),
(3089,815,'D','with',0,'',0,NULL,NULL),
(3090,816,'A','is some',0,NULL,1,NULL,'2021-06-17 10:20:29'),
(3091,816,'B','is',0,NULL,0,NULL,'2021-06-17 10:20:29'),
(3092,816,'C','are some',0,NULL,0,NULL,'2021-06-17 10:20:29'),
(3093,816,'D','is a',0,NULL,0,NULL,'2021-06-17 10:20:29'),
(3094,817,'A','break',0,'',0,NULL,NULL),
(3095,817,'B','breaking',0,'',1,NULL,NULL),
(3096,817,'C','cheating',0,'',0,NULL,NULL),
(3097,817,'D','committing',0,'',0,NULL,NULL),
(3098,818,'A','I arrive',0,'',1,NULL,NULL),
(3099,818,'B','I arrived',0,'',0,NULL,NULL),
(3100,818,'C','arrrive',0,'',0,NULL,NULL),
(3101,818,'D','I\'ll arrive',0,'',0,NULL,NULL),
(3102,819,'A','during',0,'',0,NULL,NULL),
(3103,819,'B','on',0,'',0,NULL,NULL),
(3104,819,'C','for',0,'',1,NULL,NULL),
(3105,819,'D','since',0,'',0,NULL,NULL),
(3106,820,'A','I\'m',0,'',0,NULL,NULL),
(3107,820,'B','I',0,'',0,NULL,NULL),
(3108,820,'C','I was',0,'',0,NULL,NULL),
(3109,820,'D','I\'d be',0,'',1,NULL,NULL),
(3110,821,'A','tired',0,'',1,NULL,NULL),
(3111,821,'B','stressed',0,'',0,NULL,NULL),
(3112,821,'C','relaxed',0,'',0,NULL,NULL),
(3113,821,'D','stress-free',0,'',0,NULL,NULL),
(3114,822,'A','have worried',0,'',0,NULL,NULL),
(3115,822,'B','used to worry',0,'',1,NULL,NULL),
(3116,822,'C','worrying',0,'',0,NULL,NULL),
(3117,822,'D','was worrying',0,'',0,NULL,NULL),
(3118,823,'A','check in',0,'',0,NULL,NULL),
(3119,823,'B','set off',0,'',0,NULL,NULL),
(3120,823,'C','work out',0,'',1,NULL,NULL),
(3121,823,'D','work in',0,'',0,NULL,NULL),
(3122,824,'A','that',0,'',0,NULL,NULL),
(3123,824,'B','how',0,'',0,NULL,NULL),
(3124,824,'C','what',0,'',1,NULL,NULL),
(3125,824,'D','which',0,'',0,NULL,NULL),
(3126,825,'A','increase',0,'',1,NULL,NULL),
(3127,825,'B','rise',0,'',0,NULL,NULL),
(3128,825,'C','expand',0,'',0,NULL,NULL),
(3129,825,'D','go up',0,'',0,NULL,NULL),
(3130,826,'A','break',0,'',0,NULL,NULL),
(3131,826,'B','broke',0,'',0,NULL,NULL),
(3132,826,'C','burned',0,'',1,NULL,NULL),
(3133,826,'D','sprained',0,'',0,NULL,NULL),
(3134,827,'A','have',0,'',0,NULL,NULL),
(3135,827,'B','have to',0,'',0,NULL,NULL),
(3136,827,'C','musn\'t',0,'',0,NULL,NULL),
(3137,827,'D','don\'t have to',0,'',1,NULL,NULL),
(3138,828,'A','creative',0,'',1,NULL,NULL),
(3139,828,'B','fit',0,'',0,NULL,NULL),
(3140,828,'C','annoying',0,'',0,NULL,NULL),
(3141,828,'D','nice',0,'',0,NULL,NULL),
(3142,829,'A','had',0,'',0,NULL,NULL),
(3143,829,'B','had been',0,'',0,NULL,NULL),
(3144,829,'C','was',0,'',0,NULL,NULL),
(3145,829,'D','would have been',0,'',1,NULL,NULL),
(3146,830,'A','live',0,'',0,NULL,NULL),
(3147,830,'B','living',0,'',1,NULL,NULL),
(3148,830,'C','to live',0,'',0,NULL,NULL),
(3149,830,'D','to living',0,'',0,NULL,NULL),
(3150,831,'A','brush',0,'',0,NULL,NULL),
(3151,831,'B','cut',0,'',1,NULL,NULL),
(3152,831,'C','wash',0,'',0,NULL,NULL),
(3153,831,'D','washed',0,'',0,NULL,NULL),
(3154,832,'A','don\'t',0,'',1,NULL,NULL),
(3155,832,'B','didn\'t',0,'',0,NULL,NULL),
(3156,832,'C','won\'t',0,'',0,NULL,NULL),
(3157,832,'D','do',0,'',0,NULL,NULL),
(3158,833,'A','do you',0,'',0,NULL,NULL),
(3159,833,'B','you are',0,'',0,NULL,NULL),
(3160,833,'C','are you',0,'',1,NULL,NULL),
(3161,833,'D','how\'d',0,'',0,NULL,NULL),
(3162,834,'A','so',0,'',1,NULL,NULL),
(3163,834,'B','much',0,'',0,NULL,NULL),
(3164,834,'C','too',0,'',0,NULL,NULL),
(3165,834,'D','very',0,'',0,NULL,NULL),
(3166,835,'A','reliable',0,'',1,NULL,NULL),
(3167,835,'B','patient',0,'',0,NULL,NULL),
(3168,835,'C','strict',0,'',0,NULL,NULL),
(3169,835,'D','nice',0,'',0,NULL,NULL),
(3170,836,'A','go',0,'',1,NULL,NULL),
(3171,836,'B','do',0,'',0,NULL,NULL),
(3172,836,'C','play',0,'',0,NULL,NULL),
(3173,836,'D','went',0,'',0,NULL,NULL),
(3174,837,'A','would like',0,'',0,NULL,NULL),
(3175,837,'B','is planning',0,'',0,NULL,NULL),
(3176,837,'C','is thinking of',0,'',1,NULL,NULL),
(3177,837,'D','planned',0,'',0,NULL,NULL),
(3178,838,'A','Is she?',0,'',0,NULL,NULL),
(3179,838,'B','isn\'t she?',0,'',1,NULL,NULL),
(3180,838,'C','is she?',0,'',0,NULL,NULL),
(3181,838,'D','she is?',0,'',0,NULL,NULL),
(3182,839,'A','is it?',0,'',1,NULL,NULL),
(3183,839,'B','isn\'t it?',0,'',0,NULL,NULL),
(3184,839,'C','it is?',0,'',0,NULL,NULL),
(3185,839,'D','is not?',0,'',0,NULL,NULL),
(3186,840,'A','don\'t you',0,'',0,NULL,NULL),
(3187,840,'B','do you?',0,'',1,NULL,NULL),
(3188,840,'C','did you?',0,'',0,NULL,NULL),
(3189,840,'D','didn\'t you?',0,'',0,NULL,NULL),
(3190,841,'A','too',0,'',1,NULL,NULL),
(3191,841,'B','too much',0,'',0,NULL,NULL),
(3192,841,'C','too many',0,'',0,NULL,NULL),
(3193,841,'D','much',0,'',0,NULL,NULL),
(3194,842,'A','dolls',0,'',0,NULL,NULL),
(3195,842,'B','farm animals',0,'',0,NULL,NULL),
(3196,842,'C','wild animals',0,'',0,NULL,NULL),
(3197,842,'D','pets',0,'',1,NULL,NULL),
(3198,843,'A','at',0,'',0,NULL,NULL),
(3199,843,'B','on',0,'',0,NULL,NULL),
(3200,843,'C','to',0,'',1,NULL,NULL),
(3201,843,'D','in',0,'',0,NULL,NULL),
(3202,844,'A','at',0,'',0,NULL,NULL),
(3203,844,'B','for',0,'',1,NULL,NULL),
(3204,844,'C','after',0,'',0,NULL,NULL),
(3205,844,'D','on',0,'',0,NULL,NULL),
(3206,845,'A','he work not',0,'',0,NULL,NULL),
(3207,845,'B','doesn\'t work',0,'',1,NULL,NULL),
(3208,845,'C','not works',0,'',0,NULL,NULL),
(3209,845,'D','doesn\'t works',0,'',0,NULL,NULL),
(3210,846,'A','a lot',0,'',0,NULL,NULL),
(3211,846,'B','much',0,'',0,NULL,NULL),
(3212,846,'C','some',0,'',0,NULL,NULL),
(3213,846,'D','any',0,'',1,NULL,NULL),
(3214,847,'A','at',0,'',0,NULL,NULL),
(3215,847,'B','by',0,'',0,NULL,NULL),
(3216,847,'C','in',0,'',0,NULL,NULL),
(3217,847,'D','on',0,'',1,NULL,NULL),
(3218,848,'A','can\'t',0,'',0,NULL,NULL),
(3219,848,'B','couldn\'t',0,'',1,NULL,NULL),
(3220,848,'C','cannot',0,'',0,NULL,NULL),
(3221,848,'D','am not able to',0,'',0,NULL,NULL),
(3222,849,'A','as',0,'',1,NULL,NULL),
(3223,849,'B','so',0,'',0,NULL,NULL),
(3224,849,'C','than',0,'',0,NULL,NULL),
(3225,849,'D','then',0,'',0,NULL,NULL),
(3226,850,'A','were',0,'',1,NULL,NULL),
(3227,850,'B','was',0,'',0,NULL,NULL),
(3228,850,'C','are',0,'',0,NULL,NULL),
(3229,850,'D','where',0,'',0,NULL,NULL),
(3230,851,'A','it overlooks',0,'',0,NULL,NULL),
(3231,851,'B','overlooked',0,'',0,NULL,NULL),
(3232,851,'C','overlooking',0,'',1,NULL,NULL),
(3233,851,'D','overlook',0,'',0,NULL,NULL),
(3234,852,'A','a blog',0,'',0,NULL,NULL),
(3235,852,'B','an email',0,'',1,NULL,NULL),
(3236,852,'C','a website',0,'',0,NULL,NULL),
(3237,852,'D','a channel',0,'',0,NULL,NULL),
(3238,853,'A','on Mondays',0,'',1,NULL,NULL),
(3239,853,'B','In MOndays',0,'',0,NULL,NULL),
(3240,853,'C','At Mondays',0,'',0,NULL,NULL),
(3241,853,'D','BY Mondays',0,'',0,NULL,NULL),
(3242,854,'A','since',0,'',1,NULL,NULL),
(3243,854,'B','on',0,'',0,NULL,NULL),
(3244,854,'C','for',0,'',0,NULL,NULL),
(3245,854,'D','during',0,'',0,NULL,NULL),
(3246,855,'A','doesn\'t he?',0,'',1,NULL,NULL),
(3247,855,'B','does he?',0,'',0,NULL,NULL),
(3248,855,'C','isn\'t he?',0,'',0,NULL,NULL),
(3249,855,'D','didn\'t he?',0,'',0,NULL,NULL),
(3250,856,'A','had already got',0,'',0,NULL,NULL),
(3251,856,'B','had already had',0,'',0,NULL,NULL),
(3252,856,'C','have already had',0,'',0,NULL,NULL),
(3253,856,'D','already had',0,'',1,NULL,NULL),
(3258,858,'A','were any',0,'',0,NULL,NULL),
(3259,858,'B','weren\'t no',0,'',0,NULL,NULL),
(3260,858,'C','were no',0,'',1,NULL,NULL),
(3261,858,'D','were not',0,'',0,NULL,NULL),
(3262,859,'A','do you?',0,'',0,NULL,NULL),
(3263,859,'B','are you?',0,'',0,NULL,NULL),
(3264,859,'C','don\'t you?',0,'',1,NULL,NULL),
(3265,859,'D','didn\'t you?',0,'',0,NULL,NULL),
(3266,860,'A','did work',0,'',0,NULL,NULL),
(3267,860,'B','has worked',0,'',1,NULL,NULL),
(3268,860,'C','does work',0,'',0,NULL,NULL),
(3269,860,'D','works',0,'',0,NULL,NULL),
(3270,861,'A','already',0,'',0,NULL,NULL),
(3271,861,'B','still',0,'',0,NULL,NULL),
(3272,861,'C','now',0,'',0,NULL,NULL),
(3273,861,'D','yet',0,'',1,NULL,NULL),
(3274,862,'A','to see',0,'',0,NULL,NULL),
(3275,862,'B','saw',0,'',0,NULL,NULL),
(3276,862,'C','did see',0,'',0,NULL,NULL),
(3277,862,'D','seeing',0,'',1,NULL,NULL),
(3278,863,'A','shoudn\'t have',0,'',1,NULL,NULL),
(3279,863,'B','haven\'t',0,'',0,NULL,NULL),
(3280,863,'C','musn\'t',0,'',0,NULL,NULL),
(3281,863,'D','have had to',0,'',0,NULL,NULL),
(3282,864,'A','need',0,'',0,NULL,NULL),
(3283,864,'B','have',0,'',0,NULL,NULL),
(3284,864,'C','should have',0,'',0,NULL,NULL),
(3285,864,'D','ought to',0,'',1,NULL,NULL),
(3286,865,'A','may come',0,'',0,NULL,NULL),
(3287,865,'B','might come',0,'',0,NULL,NULL),
(3288,865,'C','should come',0,'',0,NULL,NULL),
(3289,865,'D','may have come',0,'',1,NULL,NULL),
(3290,866,'A','should have been',0,'',0,NULL,NULL),
(3291,866,'B','must have been',0,'',1,NULL,NULL),
(3292,866,'C','was to be',0,'',0,NULL,NULL),
(3293,866,'D','should be',0,'',0,NULL,NULL),
(3294,867,'A','have',0,'',0,NULL,NULL),
(3295,867,'B','would have',0,'',0,NULL,NULL),
(3296,867,'C','had',0,'',1,NULL,NULL),
(3297,867,'D','had had',0,'',0,NULL,NULL),
(3298,868,'A','as if',0,'',0,NULL,NULL),
(3299,868,'B','as if he were',0,'',1,NULL,NULL),
(3300,868,'C','like',0,'',0,NULL,NULL),
(3301,868,'D','as',0,'',0,NULL,NULL),
(3302,869,'A','many',0,'',0,NULL,NULL),
(3303,869,'B','any',0,'',1,NULL,NULL),
(3304,869,'C','a lot',0,'',0,NULL,NULL),
(3305,869,'D','some',0,'',0,NULL,NULL),
(3306,870,'A','we will go',0,'',0,NULL,NULL),
(3307,870,'B','do we go',0,'',0,NULL,NULL),
(3308,870,'C','we go',0,'',0,NULL,NULL),
(3309,870,'D','shall we go',0,'',1,NULL,NULL),
(3310,871,'A','had',0,'',0,NULL,NULL),
(3311,871,'B','did have',0,'',0,NULL,NULL),
(3312,871,'C','was having',0,'',1,NULL,NULL),
(3313,871,'D','were having',0,'',0,NULL,NULL),
(3314,872,'A','Do you like to dance',0,'',0,NULL,NULL),
(3315,872,'B','would you like to dance',0,'',1,NULL,NULL),
(3316,872,'C','do you like dance',0,'',0,NULL,NULL),
(3317,872,'D','would you like dancing',0,'',0,NULL,NULL),
(3318,873,'A','arrive',0,'',1,NULL,NULL),
(3319,873,'B','I\'m going to arrive',0,'',0,NULL,NULL),
(3320,873,'C','will arrive',0,'',0,NULL,NULL),
(3321,873,'D','arrived',0,'',0,NULL,NULL),
(3322,874,'A','to walking',0,'',0,NULL,NULL),
(3323,874,'B','for walk',0,'',0,NULL,NULL),
(3324,874,'C','for a walk',0,'',1,NULL,NULL),
(3325,874,'D','to walk',0,'',0,NULL,NULL),
(3326,875,'A','travel',0,'',0,NULL,NULL),
(3327,875,'B','trip',0,'',1,NULL,NULL),
(3328,875,'C','journey',0,'',0,NULL,NULL),
(3329,875,'D','commute',0,'',0,NULL,NULL),
(3330,876,'A','get off',0,'',0,NULL,NULL),
(3331,876,'B','get on',0,'',1,NULL,NULL),
(3332,876,'C','go on',0,'',0,NULL,NULL),
(3333,876,'D','break off',0,'',0,NULL,NULL),
(3334,877,'A','was',0,'',0,NULL,NULL),
(3335,877,'B','were',0,'',1,NULL,NULL),
(3336,877,'C','would be',0,'',0,NULL,NULL),
(3337,877,'D','am',0,'',0,NULL,NULL),
(3338,878,'A','would say',0,'',0,NULL,NULL),
(3339,878,'B','said',0,'',0,NULL,NULL),
(3340,878,'C','had said',0,'',0,NULL,NULL),
(3341,878,'D','would have said',0,'',1,NULL,NULL),
(3342,879,'A','How older people are, wiser they become',0,'',0,NULL,NULL),
(3343,879,'B','If older people are, wiser they become',0,'',0,NULL,NULL),
(3344,879,'C','The more old the people, the more wise',0,'',0,NULL,NULL),
(3345,879,'D','The older people are, the wiser they become',0,'',1,NULL,NULL),
(3346,880,'A','rude',0,'',1,NULL,NULL),
(3347,880,'B','clever',0,'',0,NULL,NULL),
(3348,880,'C','violent',0,'',0,NULL,NULL),
(3349,880,'D','massive',0,'',0,NULL,NULL),
(3350,881,'A','oppose',0,'',1,NULL,NULL),
(3351,881,'B','hurt',0,'',0,NULL,NULL),
(3352,881,'C','attack',0,'',0,NULL,NULL),
(3353,881,'D','support',0,'',0,NULL,NULL),
(3354,882,'A','poor',0,'',0,NULL,NULL),
(3355,882,'B','important',0,'',0,NULL,NULL),
(3356,882,'C','normal',0,'',1,NULL,NULL),
(3357,882,'D','happy',0,'',0,NULL,NULL),
(3358,883,'A','protection',0,'',1,NULL,NULL),
(3359,883,'B','discrimination',0,'',0,NULL,NULL),
(3360,883,'C','exposure',0,'',0,NULL,NULL),
(3361,883,'D','expansion',0,'',0,NULL,NULL),
(3362,884,'A','ground floor',0,'',0,NULL,NULL),
(3363,884,'B','top floor',0,'',0,NULL,NULL),
(3364,884,'C','passage',0,'',1,NULL,NULL),
(3365,884,'D','stall',0,'',0,NULL,NULL),
(3366,885,'A','through',0,'',1,NULL,NULL),
(3367,885,'B','beside',0,'',0,NULL,NULL),
(3368,885,'C','in',0,'',0,NULL,NULL),
(3369,885,'D','on',0,'',0,NULL,NULL),
(3370,886,'A','delicate',0,'',1,NULL,NULL),
(3371,886,'B','mild',0,'',0,NULL,NULL),
(3372,886,'C','bulky',0,'',0,NULL,NULL),
(3373,886,'D','precise',0,'',0,NULL,NULL),
(3374,887,'A','afford',0,'',0,NULL,NULL),
(3375,887,'B','select',0,'',0,NULL,NULL),
(3376,887,'C','enforce',0,'',0,NULL,NULL),
(3377,887,'D','accept',0,'',1,NULL,NULL),
(3378,888,'A','rat',0,'',0,NULL,NULL),
(3379,888,'B','computer',0,'',1,NULL,NULL),
(3380,888,'C','cord',0,'',0,NULL,NULL),
(3381,888,'D','dessert',0,'',0,NULL,NULL),
(3382,889,'A','ledge',0,'',0,NULL,NULL),
(3383,889,'B','bookcase',0,'',1,NULL,NULL),
(3384,889,'C','storage',0,'',0,NULL,NULL),
(3385,889,'D','frame',0,'',0,NULL,NULL),
(3386,890,'A','act',0,'',1,NULL,NULL),
(3387,890,'B','scene',0,'',0,NULL,NULL),
(3388,890,'C','theater',0,'',0,NULL,NULL),
(3389,890,'D','field',0,'',0,NULL,NULL),
(3390,891,'A','water',0,'',0,NULL,NULL),
(3391,891,'B','soak',0,'',1,NULL,NULL),
(3392,891,'C','oven',0,'',0,NULL,NULL),
(3393,891,'D','grow',0,'',0,NULL,NULL),
(3394,892,'A','hammer',0,'',0,NULL,NULL),
(3395,892,'B','cabinet',0,'',0,NULL,NULL),
(3396,892,'C','saw',0,'',0,NULL,NULL),
(3397,892,'D','plane',0,'',1,NULL,NULL),
(3398,893,'A','walk',0,'',1,NULL,NULL),
(3399,893,'B','flat',0,'',0,NULL,NULL),
(3400,893,'C','shelf',0,'',0,NULL,NULL),
(3401,893,'D','swim',0,'',0,NULL,NULL),
(3402,894,'A','Dole',0,'',0,NULL,NULL),
(3403,894,'B','Hawaii',0,'',1,NULL,NULL),
(3404,894,'C','Canada',0,'',0,NULL,NULL),
(3405,894,'D','Mango',0,'',0,NULL,NULL),
(3406,895,'A','present',0,'',1,NULL,NULL),
(3407,895,'B','cut',0,'',0,NULL,NULL),
(3408,895,'C','bow',0,'',0,NULL,NULL),
(3409,895,'D','typewriter',0,'',0,NULL,NULL),
(3410,896,'A','dance',0,'',0,NULL,NULL),
(3411,896,'B','wobble',0,'',0,NULL,NULL),
(3412,896,'C','sing',0,'',0,NULL,NULL),
(3413,896,'D','flap',0,'',1,NULL,NULL),
(3414,897,'A','cash',0,'',0,NULL,NULL),
(3415,897,'B','wealth',0,'',0,NULL,NULL),
(3416,897,'C','purse',0,'',1,NULL,NULL),
(3417,897,'D','inheritance',0,'',0,NULL,NULL),
(3418,898,'A','cave',0,'',0,NULL,NULL),
(3419,898,'B','doll',0,'',0,NULL,NULL),
(3420,898,'C','kangaroo',0,'',1,NULL,NULL),
(3421,898,'D','truck',0,'',0,NULL,NULL),
(3422,899,'A','speaker',0,'',0,NULL,NULL),
(3423,899,'B','paragraph',0,'',0,NULL,NULL),
(3424,899,'C','comma',0,'',0,NULL,NULL),
(3425,899,'D','wheel',0,'',1,NULL,NULL),
(3426,900,'A','epic',0,'',0,NULL,NULL),
(3427,900,'B','poet',0,'',0,NULL,NULL),
(3428,900,'C','haiku',0,'',1,NULL,NULL),
(3429,900,'D','rhyme',0,'',0,NULL,NULL),
(3430,901,'A','proud',0,'',0,NULL,NULL),
(3431,901,'B','forecast',0,'',0,NULL,NULL),
(3432,901,'C','sunny',0,'',0,NULL,NULL),
(3433,901,'D','fall',0,'',1,NULL,NULL),
(3434,902,'A','dessert',0,'',1,NULL,NULL),
(3435,902,'B','repast',0,'',0,NULL,NULL),
(3436,902,'C','lunch',0,'',0,NULL,NULL),
(3437,902,'D','appetizer',0,'',0,NULL,NULL),
(3438,903,'A','war',0,'',0,NULL,NULL),
(3439,903,'B','brave',0,'',0,NULL,NULL),
(3440,903,'C','dove',0,'',1,NULL,NULL),
(3441,903,'D','cub',0,'',0,NULL,NULL),
(3442,904,'A','Jose Rizal',0,'',0,NULL,NULL),
(3443,904,'B','Francisco Balagtas',0,'',1,NULL,NULL),
(3444,904,'C','Amado Hernandez',0,'',0,NULL,NULL),
(3445,904,'D','Nick Joaquin',0,'',0,NULL,NULL),
(3446,905,'A','anecdotes',0,'',0,NULL,NULL),
(3447,905,'B','novel',0,'',0,NULL,NULL),
(3448,905,'C','fables',0,'',1,NULL,NULL),
(3449,905,'D','news',0,'',0,NULL,NULL),
(3454,907,'A','paradox',0,'',0,NULL,NULL),
(3455,907,'B','metaphor',0,'',0,NULL,NULL),
(3456,907,'C','personification',0,'',1,NULL,NULL),
(3457,907,'D','onomatopoeia',0,'',0,NULL,NULL),
(3458,908,'A','metaphor',0,'',0,NULL,NULL),
(3459,908,'B','metonymy',0,'',0,NULL,NULL),
(3460,908,'C','hyperbole',0,'',1,NULL,NULL),
(3461,908,'D','simile',0,'',0,NULL,NULL),
(3462,909,'A','Two',0,'',0,NULL,NULL),
(3463,909,'B','Three',0,'',0,NULL,NULL),
(3464,909,'C','Four',0,'',0,NULL,NULL),
(3465,909,'D','Five',0,'',1,NULL,NULL),
(3466,910,'A','Two Gentlemen of Verona',0,'',0,NULL,NULL),
(3467,910,'B','Merchant of Venice',0,'',0,NULL,NULL),
(3468,910,'C','Cymbeline',0,'',1,NULL,NULL),
(3469,910,'D','Winter\'s Tale',0,'',0,NULL,NULL),
(3470,911,'A','Old English',0,'',0,NULL,NULL),
(3471,911,'B','Italian',0,'',0,NULL,NULL),
(3472,911,'C','Spanish',0,'',1,NULL,NULL),
(3473,911,'D','Greek',0,'',0,NULL,NULL),
(3474,912,'A','Euripides',0,'',0,NULL,NULL),
(3475,912,'B','Beowulf',0,'',0,NULL,NULL),
(3476,912,'C','Homer',0,'',1,NULL,NULL),
(3477,912,'D','Virgil',0,'',0,NULL,NULL),
(3478,913,'A','sub-assembly',0,NULL,1,NULL,'2021-06-18 11:20:38'),
(3479,913,'B','manner',0,NULL,0,NULL,'2021-06-18 11:20:38'),
(3480,913,'C','style',0,NULL,0,NULL,'2021-06-18 11:20:38'),
(3481,913,'D','container',0,NULL,0,NULL,'2021-06-18 11:20:38'),
(3486,915,'A','open',0,NULL,0,NULL,'2021-06-18 11:20:59'),
(3487,915,'B','friendly',0,NULL,1,NULL,'2021-06-18 11:20:59'),
(3488,915,'C','free',0,NULL,0,NULL,'2021-06-18 11:20:59'),
(3489,915,'D','liberated',0,NULL,0,NULL,'2021-06-18 11:20:59'),
(3490,916,'A','original',0,NULL,0,NULL,'2021-06-18 11:21:09'),
(3491,916,'B','real',0,NULL,0,NULL,'2021-06-18 11:21:09'),
(3492,916,'C','durable',0,NULL,0,NULL,'2021-06-18 11:21:10'),
(3493,916,'D','fake',0,NULL,1,NULL,'2021-06-18 11:21:10'),
(3494,917,'A','thickness',0,NULL,0,NULL,'2021-06-18 11:21:22'),
(3495,917,'B','weight',0,NULL,0,NULL,'2021-06-18 11:21:22'),
(3496,917,'C','mass',0,NULL,1,NULL,'2021-06-18 11:21:22'),
(3497,917,'D','newness',0,NULL,0,NULL,'2021-06-18 11:21:22'),
(3498,918,'A','medicine',0,NULL,0,NULL,'2021-06-18 11:21:32'),
(3499,918,'B','tidal wave',0,NULL,1,NULL,'2021-06-18 11:21:32'),
(3500,918,'C','parlor game',0,NULL,0,NULL,'2021-06-18 11:21:32'),
(3501,918,'D','food',0,NULL,0,NULL,'2021-06-18 11:21:32'),
(3502,919,'A','illegal',0,NULL,0,NULL,'2021-06-18 11:21:45'),
(3503,919,'B','legitimate',0,NULL,1,NULL,'2021-06-18 11:21:45'),
(3504,919,'C','similar',0,NULL,0,NULL,'2021-06-18 11:21:45'),
(3505,919,'D','honest',0,NULL,0,NULL,'2021-06-18 11:21:45'),
(3506,920,'A','generous',0,NULL,0,NULL,'2021-06-18 11:21:55'),
(3507,920,'B','bountiful',0,NULL,1,NULL,'2021-06-18 11:21:55'),
(3508,920,'C','brilliant',0,NULL,0,NULL,'2021-06-18 11:21:55'),
(3509,920,'D','unfortunate',0,NULL,0,NULL,'2021-06-18 11:21:55'),
(3514,922,'A','total',0,NULL,1,NULL,'2021-06-18 11:22:06'),
(3515,922,'B','sum',0,NULL,0,NULL,'2021-06-18 11:22:06'),
(3516,922,'C','product',0,NULL,0,NULL,'2021-06-18 11:22:06'),
(3517,922,'D','amount',0,NULL,0,NULL,'2021-06-18 11:22:06'),
(3518,923,'A','change',0,NULL,0,NULL,'2021-06-18 11:22:23'),
(3519,923,'B','balance',0,NULL,0,NULL,'2021-06-18 11:22:23'),
(3520,923,'C','development',0,NULL,1,NULL,'2021-06-18 11:22:23'),
(3521,923,'D','fact',0,NULL,0,NULL,'2021-06-18 11:22:23'),
(3522,924,'A','gather',0,NULL,0,NULL,'2021-06-18 11:22:36'),
(3523,924,'B','become ill',0,NULL,0,NULL,'2021-06-18 11:22:36'),
(3524,924,'C','recover',0,NULL,1,NULL,'2021-06-18 11:22:36'),
(3525,924,'D','contrary',0,NULL,0,NULL,'2021-06-18 11:22:36'),
(3526,925,'A','nail :  hammer',0,'',0,NULL,NULL),
(3527,925,'B','baker :  cake',0,'',1,NULL,NULL),
(3528,925,'C','church :  priest',0,'',0,NULL,NULL),
(3529,925,'D','friend :  friendship',0,'',0,NULL,NULL),
(3530,926,'A','cave :  bear',0,'',0,NULL,NULL),
(3531,926,'B','clothes :  child',0,'',0,NULL,NULL),
(3532,926,'C','wood :  building',0,'',0,NULL,NULL),
(3533,926,'D','feather  :  bird',0,'',1,NULL,NULL),
(3534,927,'A','class  :  teacher',0,'',0,NULL,NULL),
(3535,927,'B','school  :  fish',0,'',1,NULL,NULL),
(3536,927,'C','stop :  birth',0,'',0,NULL,NULL),
(3537,927,'D','umpire  :  baseball',0,'',0,NULL,NULL),
(3538,928,'A','ocean  : coastline',0,'',0,NULL,NULL),
(3539,928,'B','river  :  bed',0,'',1,NULL,NULL),
(3540,928,'C','horse  :  stable',0,'',0,NULL,NULL),
(3541,928,'D','bread  :  butter',0,'',0,NULL,NULL),
(3542,929,'A','invent  :  create',0,'',0,NULL,NULL),
(3543,929,'B','discover  :  find',0,'',0,NULL,NULL),
(3544,929,'C','hard :  rock',0,'',1,NULL,NULL),
(3545,929,'D','machine :  technology',0,'',0,NULL,NULL),
(3546,930,'A','pluck  :  fruit',0,'',0,NULL,NULL),
(3547,930,'B','dress  :  chicken',0,'',1,NULL,NULL),
(3548,930,'C','cabbage : vegetable',0,'',0,NULL,NULL),
(3549,930,'D','dress  :  wear',0,'',0,NULL,NULL),
(3550,931,'A','sea  :  ocean',0,'',0,NULL,NULL),
(3551,931,'B','non-living  :  pencil',0,'',1,NULL,NULL),
(3552,931,'C','draw  :  crayons',0,'',0,NULL,NULL),
(3553,931,'D','water  :  thirst',0,'',0,NULL,NULL),
(3554,932,'A','witty  :  dull',0,'',0,NULL,NULL),
(3555,932,'B','lethargy  :  activity',0,'',0,NULL,NULL),
(3556,932,'C','severe  :  split',0,'',1,NULL,NULL),
(3557,932,'D','assertion  :  denial',0,'',0,NULL,NULL),
(3558,933,'A','speech  : orator',0,'',0,NULL,NULL),
(3559,933,'B','moderator :  debate',0,'',1,NULL,NULL),
(3560,933,'C','site  : cite',0,'',0,NULL,NULL),
(3561,933,'D','gather : supply',0,'',0,NULL,NULL),
(3562,934,'A','basket ball  :  court',0,'',0,NULL,NULL),
(3563,934,'B','oil  :  gasoline',0,'',0,NULL,NULL),
(3564,934,'C','bottle  : ink',0,'',1,NULL,NULL),
(3565,934,'D','clock  :  time',0,'',0,NULL,NULL),
(3566,935,'A','One who does the vaccination is a vaccinee.',0,'',0,NULL,NULL),
(3567,935,'B','One that has been contaminated is a vaccinee.',0,'',0,NULL,NULL),
(3568,935,'C','A person who receives a vaccination is a vaccinee.',0,'',1,NULL,NULL),
(3569,935,'D','The vaccinee vaccinated the corona virus.',0,'',0,NULL,NULL),
(3570,936,'A','Synchronous learning is live online meetings.',0,'',1,NULL,NULL),
(3571,936,'B','Synchronous learning does not take place at the same time.',0,'',0,NULL,NULL),
(3572,936,'C','Synchronous learning happens at different time.',0,'',0,NULL,NULL),
(3573,936,'D','Synchronous learning could hardly exist virtually.',0,'',0,NULL,NULL),
(3574,937,'A','There are erroneous committed in a short story told by the child.',0,'',0,NULL,NULL),
(3575,937,'B','This belief is erroneous.',0,'',0,NULL,NULL),
(3576,937,'C','His reasoning is erroneous.',0,'',1,NULL,NULL),
(3577,937,'D','The mayors were amazed that not all had joined their erroneous gathering.',0,'',0,NULL,NULL),
(3578,938,'A','Residents are not restricted to stay where they are due to lockdown.',0,'',0,NULL,NULL),
(3579,938,'B','Residents must not stay at home due to lockdown.',0,'',0,NULL,NULL),
(3580,938,'C','Residents are confined in a secured place due to lockdown.',0,'',1,NULL,NULL),
(3581,938,'D','Residents are locked in the dangerous place due to lockdown.',0,'',0,NULL,NULL),
(3582,939,'A','The teacher has a good envision due to a well-lighted study room.',0,'',0,NULL,NULL),
(3583,939,'B','I couldn’t help myself but envision a greener pasture for you.',0,'',0,NULL,NULL),
(3584,939,'C','Shall we all envision our party celebration for the benefit of the poor visitors?',0,'',0,NULL,NULL),
(3585,939,'D','She could hardly envision the selection without her glasses.',0,'',1,NULL,NULL),
(3586,940,'A','The suspect is asking a copy of the reconciliation of the investigation',0,'',1,NULL,NULL),
(3587,940,'B','I  am ingenious that no one can believe about the result of my reconciliation.',0,'',0,NULL,NULL),
(3588,940,'C','The judge manifests a reconciliation attitude after the series of cases.',0,'',0,NULL,NULL),
(3589,940,'D','His reconciliation of the story is highly creditable.',0,'',0,NULL,NULL),
(3590,941,'A','The suspect is asking a copy of the reconciliation of the investigation',0,'',1,NULL,NULL),
(3591,941,'B','I  am ingenious that no one can believe about the result of my reconciliation.',0,'',0,NULL,NULL),
(3592,941,'C','The judge manifests a reconciliation attitude after the series of cases.',0,'',0,NULL,NULL),
(3593,941,'D','His reconciliation of the story is highly creditable.',0,'',0,NULL,NULL),
(3594,942,'A','It is not good to enhance when somebody is delivering a message.',0,'',0,NULL,NULL),
(3595,942,'B','The students enhance their teacher when they answered the question.',0,'',0,NULL,NULL),
(3596,942,'C','The best way to enhance is for a host to show his care and affection.',0,'',0,NULL,NULL),
(3597,942,'D','Reading good books in English will surely enhance one’s writing ability.',0,'',1,NULL,NULL),
(3598,943,'A','Father John gives a piece of advise.',0,'',0,NULL,NULL),
(3599,943,'B','Parents should advise their children not to indulge with prohibited drugs.',0,'',1,NULL,NULL),
(3600,943,'C','Advise from the superior always brings access to success.',0,'',0,NULL,NULL),
(3601,943,'D','Learn to accept properly to a certain advise.',0,'',0,NULL,NULL),
(3602,944,'A','The jolly mascot is a prestigious entertainment.',0,'',0,NULL,NULL),
(3603,944,'B','The subordinate’s oral report seems accurately pronounced that the manager              considered it as a prestigious performance.',0,'',0,NULL,NULL),
(3604,944,'C','The unexpected prestigious incident happened on their way to Hoyohoy Park.',0,'',0,NULL,NULL),
(3605,944,'D','Every committee felt bad because not everybody could join the prestigious organization.',0,'',1,NULL,NULL),
(3606,945,'A','Do you have a phenomenon that you cannot present your report today?',0,'',0,NULL,NULL),
(3607,945,'B','The viewers’ phenomenon is the character’s disappearance in the story.',0,'',0,NULL,NULL),
(3608,945,'C','The phenomenon was observed by the predictors in their concern to fast tract  the origin of its cause.',0,'',1,NULL,NULL),
(3609,945,'D','The teacher had observed a complete phenomenon when she arrived.',0,'',0,NULL,NULL),
(3610,946,'A','I appeared here to inquire if the position in which I am interested is still vacant.',0,'',0,NULL,NULL),
(3611,946,'B','I want to know if it is still open for an applicant who is qualified as an assistant college administrator.',0,'',0,NULL,NULL),
(3612,946,'C','May I know if I have still a chance of competing with the rests of the           applicants?',0,'',0,NULL,NULL),
(3613,946,'D','d.	No error',0,'',1,NULL,NULL),
(3614,947,'A','Where does John lives?',0,'',1,NULL,NULL),
(3615,947,'B','He lives at the bank',0,'',0,NULL,NULL),
(3616,947,'C','Where does he study?',0,'',0,NULL,NULL),
(3617,947,'D','No error',0,'',0,NULL,NULL),
(3618,948,'A','Did you see Peter piper who picked a peck of pickled pepper?',0,'',0,NULL,NULL),
(3619,948,'B','Yes, I see him picked a peck of pickled pepper.',0,'',1,NULL,NULL),
(3620,948,'C','Then, where’s a peck of pickled pepper Peter Piper picked?',0,'',0,NULL,NULL),
(3621,948,'D','No error',0,'',0,NULL,NULL),
(3622,949,'A','Why did Miss Beatriz cry at that time?',0,'',0,NULL,NULL),
(3623,949,'B','Do you want to talk to him personality?',0,'',1,NULL,NULL),
(3624,949,'C','How did you resolve the issue if you wouldn’t?',0,'',0,NULL,NULL),
(3625,949,'D','No error',0,'',0,NULL,NULL),
(3626,950,'A','Why do you keep on making noise?',0,'',0,NULL,NULL),
(3627,950,'B','Do you have further classification about the subject matter?',0,'',0,NULL,NULL),
(3628,950,'C','Then, you are free to aired out those queries.',0,'',1,NULL,NULL),
(3629,950,'D','No error',0,'',0,NULL,NULL),
(3630,951,'A','Strengthening learner’s ability in reading is the best way to better comprehend the English language.',0,'',0,NULL,NULL),
(3631,951,'B','To better comprehend the English language is to strengthen learner’s ability in reading',0,'',0,NULL,NULL),
(3632,951,'C','The ability in reading is to strengthen the learner to better comprehend the English Language.',0,'',1,NULL,NULL),
(3633,951,'D','No mistake.',0,'',0,NULL,NULL),
(3634,952,'A','What the student wants is passing the test with flying colors to happen.',0,'',1,NULL,NULL),
(3635,952,'B','the test with flying colors is what the student wants to happen.',0,'',0,NULL,NULL),
(3636,952,'C','What the student wants to happen is to pass the test with flying colors.',0,'',0,NULL,NULL),
(3637,952,'D','No mistake',0,'',0,NULL,NULL),
(3638,953,'A','All able-bodied workers were called on by the president to help in the cleanliness drive.',0,'',0,NULL,NULL),
(3639,953,'B','The mayor called on all able-bodied workers to help on the cleanliness drive.',0,'',0,NULL,NULL),
(3640,953,'C','To help on the cleanliness drive, the chairman was called on the able-bodied workers.',0,'',1,NULL,NULL),
(3641,953,'D','No mistake',0,'',0,NULL,NULL),
(3642,954,'A','What worried the rich man was being considered very selfish.',0,'',0,NULL,NULL),
(3643,954,'B','Being considered very selfish what worried the rich man.',0,'',1,NULL,NULL),
(3644,954,'C','The rich man was being considered very selfish and that worried him.',0,'',0,NULL,NULL),
(3645,954,'D','No mistake',0,'',0,NULL,NULL),
(3646,955,'A','Showing kindness to a needy person is a concrete example of a true Filipino.',0,'',0,NULL,NULL),
(3647,955,'B','A concrete example of a true Filipino is to show kindness to a needy person.',0,'',0,NULL,NULL),
(3648,955,'C','A true Filipino is a concrete example to a needy person in showing kindness.',0,'',1,NULL,NULL),
(3649,955,'D','No mistake',0,'',0,NULL,NULL),
(3650,956,'A','aisle',0,'',0,NULL,NULL),
(3651,956,'B','the',0,'',0,NULL,NULL),
(3652,956,'C','handsome',0,'',1,NULL,NULL),
(3653,956,'D','walked',0,'',0,NULL,NULL),
(3654,957,'A','adjective',0,'',1,NULL,NULL),
(3655,957,'B','adverb',0,'',0,NULL,NULL),
(3656,957,'C','noun',0,'',0,NULL,NULL),
(3657,957,'D','pronoun',0,'',0,NULL,NULL),
(3658,958,'A','appositive',0,'',0,NULL,NULL),
(3659,958,'B','attributive',0,'',1,NULL,NULL),
(3660,958,'C','predicate',0,'',0,NULL,NULL),
(3661,958,'D','pronominal',0,'',0,NULL,NULL),
(3662,959,'A','appears',0,'',0,NULL,NULL),
(3663,959,'B','crime',0,'',0,NULL,NULL),
(3664,959,'C','suspect',0,'',0,NULL,NULL),
(3665,959,'D','guilty',0,'',1,NULL,NULL),
(3666,960,'A','direct object',0,'',0,NULL,NULL),
(3667,960,'B','indirect object',0,'',0,NULL,NULL),
(3668,960,'C','object of the preposition',0,'',0,NULL,NULL),
(3669,960,'D','subjective complement',0,'',1,NULL,NULL),
(3670,961,'A','appositive',0,'',0,NULL,NULL),
(3671,961,'B','attributive',0,'',0,NULL,NULL),
(3672,961,'C','predicate',0,'',1,NULL,NULL),
(3673,961,'D','pronominal',0,'',0,NULL,NULL),
(3674,962,'A','boss',0,'',0,NULL,NULL),
(3675,962,'B','indifferent',0,'',0,NULL,NULL),
(3676,962,'C','made',0,'',0,NULL,NULL),
(3677,962,'D','sarcastic',0,'',1,NULL,NULL),
(3678,963,'A','appositive',0,'',0,NULL,NULL),
(3679,963,'B','attributive',0,'',1,NULL,NULL),
(3680,963,'C','predicate',0,'',0,NULL,NULL),
(3681,963,'D','pronominal',0,'',0,NULL,NULL),
(3686,965,'A','comment',0,'',0,NULL,NULL),
(3687,965,'B','her',0,'',1,NULL,NULL),
(3688,965,'C','indifferent',0,'',0,NULL,NULL),
(3689,965,'D','sarcastic',0,'',0,NULL,NULL),
(3690,966,'A','direct object',0,'',0,NULL,NULL),
(3691,966,'B','indirect object',0,'',0,NULL,NULL),
(3692,966,'C','objective    complement',0,'',1,NULL,NULL),
(3693,966,'D','subjective  complement',0,'',0,NULL,NULL),
(3694,967,'A','adjective',0,'',1,NULL,NULL),
(3695,967,'B','adverb',0,'',0,NULL,NULL),
(3696,967,'C','verb',0,'',0,NULL,NULL),
(3697,967,'D','preposition',0,'',0,NULL,NULL),
(3698,968,'A','adjective',0,'',0,NULL,NULL),
(3699,968,'B','adverb',0,'',1,NULL,NULL),
(3700,968,'C','preposition',0,'',0,NULL,NULL),
(3701,968,'D','pronoun',0,'',0,NULL,NULL),
(3702,969,'A','brother',0,'',0,NULL,NULL),
(3703,969,'B','sour',0,'',0,NULL,NULL),
(3704,969,'C','told',0,'',0,NULL,NULL),
(3705,969,'D','soup',0,'',1,NULL,NULL),
(3706,970,'A','adjective',0,'',1,NULL,NULL),
(3707,970,'B','adverb',0,'',0,NULL,NULL),
(3708,970,'C','noun',0,'',0,NULL,NULL),
(3709,970,'D','verb',0,'',0,NULL,NULL),
(3710,971,'A','speech',0,'',0,NULL,NULL),
(3711,971,'B','effectively',0,'',1,NULL,NULL),
(3712,971,'C','well-rounded',0,'',0,NULL,NULL),
(3713,971,'D','deliver',0,'',0,NULL,NULL),
(3714,973,'A','effect',0,'',0,NULL,NULL),
(3715,973,'B','affect',0,'',1,NULL,NULL),
(3716,973,'C','effected',0,'',0,NULL,NULL),
(3717,973,'D','affected',0,'',0,NULL,NULL),
(3722,975,'A','care',0,'',0,NULL,NULL),
(3723,975,'B','cared',0,'',1,NULL,NULL),
(3724,975,'C','was cared',0,'',0,NULL,NULL),
(3725,975,'D','cared off',0,'',0,NULL,NULL),
(3730,977,'A','highest',0,'',0,NULL,NULL),
(3731,977,'B','higher',0,'',0,NULL,NULL),
(3732,977,'C','raise',0,'',1,NULL,NULL),
(3733,977,'D','rise',0,'',0,NULL,NULL),
(3742,981,'A','whom',0,'',0,NULL,NULL),
(3743,981,'B','where',0,'',0,NULL,NULL),
(3744,981,'C','which',0,'',1,NULL,NULL),
(3745,981,'D','when',0,'',0,NULL,NULL),
(3746,982,'A','',1,'7ede8f5c0b2a62f85102753013573901.png',0,NULL,NULL),
(3747,982,'B','',1,'9f63e889497d92b14fe133a794877647.png',0,NULL,NULL),
(3748,982,'C','',1,'6aa8a25f2bd53dbad4122768042fe84e.png',0,NULL,NULL),
(3749,982,'D','',1,'74ab0a3311c9325c40df9eb38cecbefe.png',0,NULL,NULL);

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
  `acad_year_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `level_id` bigint(20) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_question_img` tinyint(1) NOT NULL DEFAULT '0',
  `question_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_time` int(11) NOT NULL DEFAULT '10',
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `questions_acad_year_id_foreign` (`acad_year_id`),
  KEY `questions_section_id_foreign` (`section_id`),
  KEY `questions_level_id_foreign` (`level_id`),
  CONSTRAINT `questions_acad_year_id_foreign` FOREIGN KEY (`acad_year_id`) REFERENCES `acad_years` (`acad_year_id`),
  CONSTRAINT `questions_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  CONSTRAINT `questions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `questions` */

insert  into `questions`(`question_id`,`acad_year_id`,`section_id`,`level_id`,`question`,`is_question_img`,`question_img`,`set_time`,`score`,`created_at`,`updated_at`) values 
(49,3,1,1,'',1,'UFc0e5F4v07rK1kr33OQdKTUxJJnbuoZnGSOo9KL.png',10,1,'2021-06-09 18:20:50','2021-06-09 18:20:50'),
(50,3,1,1,'',1,'FmjhOVxvpPfwrCojqPopPHW4M8AcAFdNPefH1GU3.png',10,1,'2021-06-09 18:23:55','2021-06-09 18:23:55'),
(54,3,1,1,'',1,'RsJdwXA5DfL3hJiZUVibpoVsBmN74kCjfVo4w7iL.png',10,1,'2021-06-09 20:32:56','2021-06-09 20:32:56'),
(55,3,1,1,'',1,'gRKxcag5Vx9B8GIpoFtsAL7dGFtcPP9WeKrq35AH.png',10,1,'2021-06-09 20:35:37','2021-06-09 20:35:37'),
(56,3,1,1,'',1,'VcZOKAGK1oUS8TKCahrliwRTtluEGFEDeY3kXilf.png',10,1,'2021-06-09 20:41:07','2021-06-09 20:41:07'),
(57,3,1,1,'',1,'RUBwTLTpMPICY1mh1NkBKmbu9gs3C6Mic84pKcpv.png',10,1,'2021-06-09 21:20:41','2021-06-09 21:20:41'),
(58,3,1,1,'',1,'bzVu1qmtjL3eJuCR9rIgnAO25Fq6R7Sea0SYd7Yn.png',10,1,'2021-06-09 21:34:24','2021-06-09 21:34:24'),
(59,3,1,1,'',1,'6MDkz1F3ZstL4A9ovAnY5BCz5QcuaF77Iskw4LgH.png',10,1,'2021-06-09 22:10:14','2021-06-09 22:10:14'),
(60,3,1,1,'',1,'uzRNhe2Q74HSxAYfKYhq1BWyQMdypLisDv0syQ0F.png',10,1,'2021-06-09 22:12:36','2021-06-09 22:12:36'),
(61,3,1,1,'',1,'VNTowme8zeuhrYU4StBrEPQ8zT8bQ2sRiAzJsvZ4.png',10,1,'2021-06-09 22:14:02','2021-06-09 22:14:02'),
(62,3,1,1,'',1,'7oRvtLCOc0awq4UyuLN8qQ2agxpBlNib0Dma1fee.png',10,1,'2021-06-09 22:16:22','2021-06-09 22:16:22'),
(63,3,1,1,'',1,'1VtjCwi7QdcTbtMMLE38PQQOlR02pU7lzGQLoBpE.png',10,1,'2021-06-09 22:16:22','2021-06-09 22:16:22'),
(64,3,1,1,'',1,'LytaZ19hbVM5qjQiQ5AVTTuqppcuuaHAzxeyyrhb.png',10,1,'2021-06-09 22:17:15','2021-06-09 22:17:15'),
(65,3,1,1,'',1,'ro0TZmdEHEPvyzROCkFJQ4FK4rFZX51wxGLTlYxF.png',10,1,'2021-06-09 22:24:41','2021-06-09 22:24:41'),
(66,3,1,1,'',1,'4hhj1HPxT59IBYkg4XoPQPs3fnck0UGsEooqEXlX.png',10,1,'2021-06-09 22:35:49','2021-06-09 22:35:49'),
(67,3,1,1,'',1,'qN6JX1SipbsDpxnlvZD1hFYkTvvYKezeiCAm7Kll.png',10,1,'2021-06-09 22:40:26','2021-06-09 22:40:26'),
(68,3,1,1,'',1,'23pOv2eKiwASReScbTObqnJwpZrB6kns4MUm5HKw.png',10,1,'2021-06-09 22:44:22','2021-06-09 22:44:22'),
(69,3,1,1,'',1,'L5rvl35ijRR0TFxt4X0A3JcY16wksNOFo9kDGVPa.png',10,1,'2021-06-09 22:46:14','2021-06-09 22:46:14'),
(70,3,1,1,'',1,'tE8DXqgLSNSJkYNrzAP7EG7ALwTW1Zr0Ph6z0gEk.png',10,1,'2021-06-09 22:46:14','2021-06-09 22:46:14'),
(71,3,1,1,'',1,'5K6mLX8uYluafj6KqCehln16krfwvz0KHURjfOLz.png',10,1,'2021-06-09 22:47:37','2021-06-09 22:47:37'),
(72,3,1,1,'',1,'hzSbFid6OY4wDhWkupAhSopgbP4jLkJwsEO9NWKu.png',10,1,'2021-06-09 22:49:00','2021-06-09 22:49:00'),
(73,3,1,1,'',1,'pZCg9QNpVnOAzErxP7X1QrQ3wyZ0mzIinPIq6lTv.png',10,1,'2021-06-09 22:51:17','2021-06-09 22:51:17'),
(74,3,1,1,'',1,'N4PA0E9HsyQZaIjd6pAze74pd0cxRV2wu6gO3WXB.png',10,1,'2021-06-09 22:53:33','2021-06-09 22:53:33'),
(75,3,1,1,'',1,'EpLc6qdeIAcF40027S6Ip8HVknqPSiSV98SQreJY.png',10,1,'2021-06-09 22:53:35','2021-06-09 22:53:35'),
(77,3,1,1,'',1,'dkD4jp53jzLRat0mc0IyIqXrH0HHzAs8stcY2Ki4.png',10,1,'2021-06-09 22:57:01','2021-06-09 22:57:01'),
(78,3,1,1,'',1,'ht4CoPTugEvBvepIicB1JSuZWMBF2JryRzZfWba9.png',10,1,'2021-06-09 22:58:36','2021-06-09 22:58:36'),
(79,3,1,1,'',1,'Zv4HMzWthxnYGvzFl8iWOE8BRpcojCWUvff4hDDY.png',10,1,'2021-06-09 22:58:36','2021-06-09 22:58:36'),
(80,3,1,1,'',1,'jdIeS5A7c4a6B1o94MwxnezqLCqUOlWXIvTt2oeF.png',10,1,'2021-06-09 23:02:17','2021-06-09 23:02:17'),
(81,3,1,1,'',1,'wg2I6NvZUiUZEfDMhstIHgnJlOXNFGv9glW5Wnjx.png',10,1,'2021-06-09 23:03:49','2021-06-09 23:03:49'),
(82,3,1,1,'',1,'NU7J7Nd2QcDAPHobXsSCKQn6ebJG4uuKHN1OOzVo.png',10,1,'2021-06-09 23:06:32','2021-06-09 23:06:32'),
(83,3,1,1,'',1,'pBMYpE6VPmLq3vjUyWO67GE3QSFV1WD8hUP8C8OA.png',10,1,'2021-06-09 23:08:13','2021-06-09 23:08:13'),
(84,3,1,1,'',1,'ptUztO1XJ92Lx3B6md79nX8J8nT0g6RypzxWe3Fq.png',10,1,'2021-06-09 23:09:25','2021-06-09 23:09:25'),
(85,3,1,1,'',1,'2ravz71iePLTPiyKkbAfb6rsP6fEdhYAk3GG8Qf9.jpg',10,1,'2021-06-09 23:10:28','2021-06-09 23:10:28'),
(86,3,1,1,'',1,'mmxKk029konmq3PyEktpXaYZW5avVsLTOmVvR8lb.jpg',10,1,'2021-06-09 23:13:13','2021-06-09 23:13:13'),
(87,3,1,1,'',1,'ksLTDyWhDNe6usUYlEy59debkjnhNarQ9NP95bYO.jpg',10,1,'2021-06-09 23:18:56','2021-06-09 23:18:56'),
(88,3,1,1,'',1,'j4LbRxtVqEtsEhh1toObIkyxT1LFAiOYic106Gzd.jpg',10,1,'2021-06-09 23:24:12','2021-06-09 23:24:12'),
(89,3,1,1,'',1,'IEGpZhLxpkAgN9X81OmKAOhmlQZnBzks8hj8uPLy.jpg',10,1,'2021-06-09 23:26:29','2021-06-09 23:26:29'),
(90,3,1,1,'',1,'eQvmXWIlrJJgC2k6sLrZUMOZeCDUkAqFqu1gBiGX.jpg',10,1,'2021-06-09 23:26:29','2021-06-09 23:26:29'),
(91,3,1,1,'',1,'vmD4RdvaHL1rfPdu5V7IcbrGS5wYQEuLz2jrfnYB.jpg',10,1,'2021-06-09 23:27:28','2021-06-09 23:27:28'),
(92,3,5,1,'What is the current constitution of the Philippines?',0,NULL,10,1,'2021-06-10 00:00:32','2021-06-10 00:00:32'),
(93,3,5,1,'During the 1970s the Philippines shifted from Presidential to Parliamentary system. Who among the following is the living former Prime Minister of the Philippines?',0,NULL,10,1,'2021-06-10 00:03:08','2021-06-10 00:03:08'),
(94,3,5,1,'During the 1970s the Philippines shifted from Presidential to Parliamentary system. Who among the following is the living former Prime Minister of the Philippines?',0,NULL,10,1,'2021-06-10 00:03:08','2021-06-10 00:03:08'),
(95,3,5,2,'On 2016, the International Arbitration Court  during the South China Sea arbitration ruled in favor of the Philippines over the historical rights of China over the west Philippine sea. What was the historical basis of China in claiming sovereign rights over Philippine Exclusive Economic Zone including Julian Felipe reef?',0,NULL,10,1,'2021-06-10 00:04:41','2021-06-10 00:07:38'),
(98,3,5,2,'Article III sec. 1 of the 1987 constitution provides that, “No person shall be deprived of _______, liberty, or ________ without due process of law, nor shall any person be denied the __________ of the laws.” Supply the missing words.',0,NULL,10,1,'2021-06-10 00:06:59','2021-06-10 00:06:59'),
(99,3,5,1,'Nobel prize is an award given to individuals each year who has given exemplary contribution in the field of science, literature, economics or Peace. Who was the first woman to win the Nobel Prize?',0,NULL,10,1,'2021-06-10 00:12:27','2021-06-17 13:25:03'),
(100,3,5,1,'The cell is known to be the smallest functional unit of an organism. What is the name of the powerhouse of the cell?',0,NULL,10,1,'2021-06-10 00:15:02','2021-06-10 00:15:02'),
(101,3,5,1,'After the second world war, what organization was created to maintain international peace and security?',0,NULL,10,1,'2021-06-10 00:22:58','2021-06-10 00:22:58'),
(102,3,5,1,'What is the chemical formula for table Salt?',0,NULL,10,1,'2021-06-10 00:28:32','2021-06-10 00:28:32'),
(103,3,5,1,'Our solar system is composed of nine planets. What is the biggest planet in our solar system?',0,NULL,10,1,'2021-06-10 00:31:21','2021-06-10 00:31:21'),
(104,3,5,1,'Which among the following is the nearest descendant of the Tyrannosaurus Rex (T-rex)?',0,NULL,10,1,'2021-06-10 00:32:50','2021-06-10 00:32:50'),
(105,3,5,1,'Don Diego, Don Juan  and  Don Pedro were looking for an enchanted bird to cure Haring Fernando What was the name of the bird?',0,NULL,10,1,'2021-06-10 00:34:00','2021-06-10 00:34:00'),
(106,3,5,1,'Every two years ASEAN celebrates the SEA games, which among the following countries is the host of the 2019 SEA Games?',0,NULL,10,1,'2021-06-10 00:35:24','2021-06-10 00:35:24'),
(107,3,5,1,'Philippines has been active in the sports arena particularly the Olympics. Who was the first Filipino figure skater and the first Southeast Asian in the figure skating sport in the winter Olympics?',0,NULL,10,1,'2021-06-10 00:37:44','2021-06-10 00:37:44'),
(108,3,5,1,'The world is currently battling a pandemic known as Covid 19. Because of such, people practiced social distancing, wearing of mask and proper hand sanitation. Which among the following pandemics invented the quarantine method?',0,NULL,10,1,'2021-06-10 00:39:38','2021-06-10 00:39:38'),
(109,3,5,1,'Who is the father of Modern Economics?',0,NULL,10,1,'2021-06-10 00:41:03','2021-06-10 00:41:03'),
(110,3,5,1,'The different genders struggled to be recognized by the society at large, in order to have the recognition and equal rights, the LGBTQ+ community filed the SOGIE bill praying that it will soon become a law since it is more inclusive to all. What does SOGIE mean?',0,NULL,10,1,'2021-06-10 00:43:13','2021-06-10 00:43:13'),
(111,3,5,1,'During the year 2020, the first ever recorded case of Covid 19 is recoded in January. When was the first Philippine local lockdown implemented?',0,NULL,10,1,'2021-06-10 00:44:46','2021-06-10 00:44:46'),
(112,3,5,1,'It has been recorded since ancient times that human civilization-built walls in order to protect themselves and their community. According to the Guinness World Records, what is the longest wall in the world?',0,NULL,10,1,'2021-06-10 00:46:02','2021-06-10 00:46:02'),
(113,3,5,1,'It is defined as the rule of conduct or procedure recognized by a community as binding by authority of the body or systems of rules recognized by a community that are enforceable by established process.',0,NULL,10,1,'2021-06-10 00:49:03','2021-06-10 00:49:03'),
(114,3,5,1,'Our laws and morality dictate the standards of society. Which of the following are sets of moral principles that provides certain standards of human behavior and are regularly protected as legal rights?',0,NULL,10,1,'2021-06-10 00:55:18','2021-06-10 00:55:18'),
(115,3,5,1,'It is the actual process or the active principle of burning, and it is characterized by the heat and light combustion.',0,NULL,10,1,'2021-06-10 00:57:17','2021-06-10 00:57:17'),
(116,3,1,2,'',1,'jWqWQs0ByjsVegOpyloXeoC2AKk7w6aOsHXcFGyq.png',10,1,'2021-06-10 01:05:54','2021-06-10 01:05:54'),
(117,3,1,2,'',1,'d6J3354W6kQpO06hFpEGEuUJtIoGHrkyiKcNsKCu.png',10,1,'2021-06-10 01:08:02','2021-06-10 01:08:02'),
(118,3,1,2,'',1,'qA1G5Z9saMRsbYllyC4wI6Oavqm8vtcAZSOfpgfL.png',10,1,'2021-06-10 01:11:09','2021-06-10 01:11:09'),
(119,3,1,2,'',1,'lUh1x1Ul5ziMXehYK5RzKLJmPGDAMiaiFTsfXECk.png',10,1,'2021-06-10 01:12:28','2021-06-10 01:12:28'),
(120,3,1,2,'',1,'I687TuzRkuaJ3wGC9wP4JKSK5ypN0XgBcPlMceOe.png',10,1,'2021-06-10 01:13:41','2021-06-10 01:13:41'),
(121,3,1,2,'',1,'uALttiLBsTXybpL9D8Fu6NoFLBIKm7pXuILgJi1p.png',10,1,'2021-06-10 01:14:34','2021-06-10 01:14:34'),
(122,3,1,2,'',1,'WRHIg0Bt9cxLsRhDxNmxqqzjRxkaI8Zn8zrKPIPe.png',10,1,'2021-06-10 01:15:30','2021-06-10 01:15:30'),
(123,3,1,2,'',1,'T07brE3FgYbxSupHz3t44itlT0O3L5gSncRJEcKL.png',10,1,'2021-06-10 01:16:16','2021-06-10 01:16:16'),
(124,3,1,2,'',1,'iAbh5innlDbdWTfRQfwLT72EHk5wrLAvu5EgNcOS.png',10,1,'2021-06-10 01:17:48','2021-06-10 01:17:48'),
(125,3,1,2,'',1,'TPZNXeJsrWFaB4RcSji6xMM0TJfDTbfp1PTslvBz.png',10,1,'2021-06-10 01:19:09','2021-06-10 01:19:09'),
(126,3,1,2,'',1,'66m7YwUPPQVVjuZEd4pleJHuaKHaxpBOrEBysFrq.png',10,1,'2021-06-10 01:20:23','2021-06-10 01:20:23'),
(127,3,1,2,'',1,'lF2PtECdw6hYZ4rysFzTTINHGuY0TLg8xAEWY5yV.png',10,1,'2021-06-10 01:21:19','2021-06-10 01:21:19'),
(129,3,1,2,'',1,'FWH2U3renSET6Id2AhInF8D5CvEC6wtZCoBjBgsV.png',10,1,'2021-06-10 01:24:05','2021-06-10 01:24:05'),
(131,3,1,2,'',1,'1F8787kQ1UfZgtEPMGeb1p9jmzc1pvveiJqM5ZxI.png',10,1,'2021-06-10 01:30:49','2021-06-10 01:30:49'),
(132,3,1,2,'',1,'BnPQIJfV9BMJfjRykMZXQ0Zez0GzECODxtbqoJfO.png',10,1,'2021-06-10 01:32:07','2021-06-10 01:32:07'),
(133,3,1,2,'',1,'kUSv6NrbwevvyKkeC4VFYKPcNH5V1RHg5fWFSMIe.png',10,1,'2021-06-10 01:32:59','2021-06-10 01:32:59'),
(134,3,1,2,'',1,'lEJxQPG3a1OcmY3oCCoWGPG350yJGyQYjecQACoZ.png',10,1,'2021-06-10 01:34:00','2021-06-10 01:34:00'),
(137,3,1,2,'',1,'X2PEmr6DPEy8X4H33DB9WjDeAMhJcI64fGxUCO1s.png',10,1,'2021-06-10 01:38:15','2021-06-10 01:38:15'),
(138,3,1,2,'',1,'Jlf6kLbpMIxgvY2RVFa9hbMufM8gSvDZ5jgUFued.png',10,1,'2021-06-10 01:39:57','2021-06-10 01:39:57'),
(139,3,1,2,'',1,'0ztmqVWLCLSQqoJTNYgsqjkp3leAE9cly5fOYyLB.png',10,1,'2021-06-10 01:41:51','2021-06-10 01:41:51'),
(140,3,1,2,'',1,'rKOzKkSORjzSpAOdZJEFQxeWPyEEIcWfoUzyPQN0.png',10,1,'2021-06-10 01:42:45','2021-06-10 01:42:45'),
(141,3,1,2,'',1,'Ic3EH9HiH0n1tIhwy6ObyBD8dTqD15aZvgGn6Npi.png',10,1,'2021-06-10 03:44:09','2021-06-10 03:44:09'),
(142,3,1,2,'',1,'iTXWpugrT8ukNrx4wLO6YtbciWFTNCmCcFZ6b7i0.png',10,1,'2021-06-10 03:45:18','2021-06-10 03:45:18'),
(143,3,1,2,'',1,'u9I2VoqgTT638ksOeJMqTbCQS7VLeQNQ8ofRgFIf.png',10,1,'2021-06-10 03:47:20','2021-06-10 03:47:20'),
(144,3,1,2,'',1,'zoseiLO1ILsfbqa7fazbxneDeWKajMFTvKDRDbx2.png',10,1,'2021-06-10 03:48:10','2021-06-10 03:48:10'),
(145,3,1,2,'',1,'CMekZhkvm80kqGWeKRJgrtbBIc8wKJuBiUoGxMkp.png',10,1,'2021-06-10 03:49:18','2021-06-10 03:49:18'),
(146,3,1,2,'',1,'b8vHNZIPNH8njQ6sjit0c5EJUpMwh21ri9W8som5.png',10,1,'2021-06-10 03:52:23','2021-06-10 03:52:23'),
(147,3,1,2,'',1,'bGqI0MeJBeONZbCp2wX4ZHIDkgegfDAqlXeworMC.png',10,1,'2021-06-10 03:53:21','2021-06-10 03:53:21'),
(148,3,1,2,'',1,'2qaQSlCxj7wVggoHvrRfCgzCYjhoX1HXLPvGHMJO.png',10,1,'2021-06-10 03:54:13','2021-06-10 03:54:13'),
(149,3,1,2,'',1,'fEjmNHgC74UhZAQYU5TDrFHpYsZ6ndQ4cPwrWhhk.png',10,1,'2021-06-10 03:54:57','2021-06-10 03:54:57'),
(150,3,1,2,'',1,'VCTPgXsPSX3VWJWA1C4vKynTgmW2TWRlaBNk6YWF.png',10,1,'2021-06-10 03:55:38','2021-06-10 03:55:38'),
(151,3,1,2,'',1,'nbQ8oHUuRz1GkekRFp8Cg8Xu45CHidET0FYb7BJP.png',10,1,'2021-06-10 03:56:17','2021-06-10 03:56:17'),
(152,3,1,2,'',1,'vyS4VWAvHdC8pYCHoo4XFASq77qvDJ3acQOAeTW2.png',10,1,'2021-06-10 03:57:02','2021-06-10 03:57:02'),
(153,3,1,2,'',1,'VxZVimr1eFXWqd2aKnSWC2IzGuv885clnXxGcwEW.png',10,1,'2021-06-10 03:57:47','2021-06-10 03:57:47'),
(154,3,1,2,'',1,'xp0opaNFT4chxC52uSPaVdQWnprdPaTWW28dORdp.png',10,1,'2021-06-10 03:58:28','2021-06-10 03:58:28'),
(155,3,5,1,'“No plate, no traffic”, means that you cannot get out of the road with your car if your car don’t have _________.',0,NULL,10,1,'2021-06-10 17:34:02','2021-06-10 17:34:02'),
(156,3,5,1,'Throughout the centuries, humans discovered and invented various recreational drugs, some which became illegal. Which among the following is considered as the poor man’s cocaine?',0,NULL,10,1,'2021-06-10 17:36:14','2021-06-10 17:36:14'),
(157,3,5,1,'Years after the invention of motor vehicles, traffic violations occur that killed thousands in the process, thus, engineers designed a contraption that is described as “any strap, webbing or similar device in the form of pelvic restraint or shoulder strap designed to secure a person in a motor vehicle in order to mitigate the results of any accident” What is this?',0,NULL,10,1,'2021-06-10 17:37:54','2021-06-10 17:37:54'),
(158,3,5,1,'It refers to anything which either through careful observation , has been proven to exist as to have happened.',0,NULL,10,1,'2021-06-10 17:39:19','2021-06-10 17:39:19'),
(159,3,5,1,'It is a phenomenon or process of interaction that connects people and governments worldwide.',0,NULL,10,1,'2021-06-10 17:40:29','2021-06-10 17:40:29'),
(160,3,5,1,'Which among the following is not included in the physical properties of color?',0,NULL,10,1,'2021-06-10 17:43:59','2021-06-10 17:43:59'),
(161,3,5,1,'Who among the following is considered as a National Artist for Sculpture who created the Bonifacio Monument and the Oblation of the University of the Philippines?',0,NULL,10,1,'2021-06-10 17:46:05','2021-06-10 17:46:05'),
(162,3,5,1,'Which among the following is part of the 7 major art forms in the Philippines?',0,NULL,10,1,'2021-06-10 17:48:26','2021-06-10 17:48:26'),
(163,3,5,2,'Governance is defined as the exercise of political, economic and administrative authority to manage a nation’s affairs. Which among the following uses techniques from science and technology, and mobilizes the community and different stakeholders in the management of our environment?',0,NULL,10,1,'2021-06-10 17:50:33','2021-06-14 20:59:39'),
(164,3,5,2,'A State is composed of various elements before it shall be considered by the international community as an independent thriving community free of outside control who has its very own territory, people, sovereignty and government. Which is considered as the supreme power that is inherent in a State?',0,NULL,10,1,'2021-06-10 17:52:44','2021-06-14 21:00:10'),
(165,3,5,1,'Who considered as the father of Modern Political Science.',0,NULL,10,1,'2021-06-10 17:54:41','2021-06-10 17:54:41'),
(166,3,5,1,'Who among the following, immortalized the phrase “I think, therefore I am”',0,NULL,10,1,'2021-06-10 18:08:40','2021-06-10 18:08:40'),
(167,3,5,1,'The Mariana Trench is a crescent like scar in the surface in the earth that is measured 1,500 miles long and 43 miles wide which houses the deepest parts of the Earth while Mount Everest is considered as the highest point of the Earth with elevation of 8,849m. What is the deepest part of the Earth?',0,NULL,10,1,'2021-06-10 18:11:07','2021-06-10 18:11:07'),
(168,3,5,1,'It is a process of continuous cycle of water in the Earth-Atmosphere or the cycle of water from the earth to the atmosphere and back again.',0,NULL,10,1,'2021-06-10 18:13:38','2021-06-10 18:13:38'),
(169,3,5,1,'Known as the indestructible, the bravest, most handsome and greatest warrior of Agamemnon in the Trojan war, Achilles killed 31,000 Greeks  and was envied by many. What part of the human body was commonly referred after him?',0,NULL,10,1,'2021-06-10 18:14:55','2021-06-10 18:14:55'),
(170,3,5,1,'She was a Visayan goddess of sea and water created by Kanlaon as an equal to Kaplan the Visayan sky god. Cebuanos believe that she is Kaplan’s wife while in Negos she is considered as Kaplan’s Rival.',0,NULL,10,1,'2021-06-10 18:16:23','2021-06-10 18:16:23'),
(171,3,5,2,'In Philippine Mythology this creature is considered as an enemy of Haliya, the sibling of Bulan who protects Bulan from being devoured by it. What is the name of this serpent that wants to eat Bulan?',0,NULL,10,1,'2021-06-10 18:21:10','2021-06-14 21:00:59'),
(172,3,5,2,'In the Mindanaon Epic, Indarapatra, in order to battle the four monsters who is devastating Mindanao gave his brother Sulayman a magic ring and a magic kris (Moro sword). What is the name of the said magical kris?',0,NULL,10,1,'2021-06-10 18:22:33','2021-06-14 21:00:51'),
(173,3,5,2,'In Indarapatra and Sulayman, four creatures are devastating the earth, one has many limbs that haunts in the mountain where rattan grew, second is an ugly creature in the form of a man who devoured humans and lived in Mt. Matutun, the third one was an enormous bird  that brings darkness to the world who loves to haunt at Mt. Bita and the last was an dreadful bird with seven heads that lives in Mt. Gurayn. What was the name of the third monster and how was it killed?',0,NULL,10,1,'2021-06-10 18:24:04','2021-06-14 21:00:29'),
(174,3,5,2,'Philippines experiences typhoons with an average of 17 to 20 typhoons in a year. Which among the following is considered as one of the deadliest typhoons in the world that caused 95.5-billion-peso damage and 6,300 deaths?',0,NULL,10,1,'2021-06-10 18:25:26','2021-06-14 21:00:41'),
(175,3,5,2,'What economic principle is being illustrated in this situation:\n\n“John wants to buy an iphone 12 which is worth 43,000 pesos. John has 45,000 pesos in his bank account and 500 pesos in his pocket. If John buys the phone he will have the phone that would greatly benefit him in his job but will starve for a while. Thus, John decides not to buy the phone as of the moment.”',0,NULL,10,1,'2021-06-10 18:28:49','2021-06-14 21:00:17'),
(176,3,5,1,'It is a basic economic problem wherein resources are limited yet human wants are limitless.',0,NULL,10,1,'2021-06-10 18:30:16','2021-06-10 18:30:16'),
(177,3,5,1,'With a dream a ranking system in a world wide web search engine, Larry Page and Sergey Brin launched in 1996 PageRank which is the foundational algorithm of ____________.',0,NULL,10,1,'2021-06-10 18:31:25','2021-06-10 18:31:25'),
(178,3,5,1,'He was a hunter in Greek Mythology who fell in love with his reflection in the pool. Which personality disorder was named after him wherein one displays an inflated sense of own importance, a deep need for excessive attention and admiration, troubled relationships, and a lack of empathy for others?',0,NULL,10,1,'2021-06-10 18:33:01','2021-06-10 18:33:01'),
(179,3,5,1,'It is a process wherein plants transforms light energy to chemical energy which helps the plants   make their food.',0,NULL,10,1,'2021-06-10 18:34:14','2021-06-10 18:34:14'),
(180,3,5,1,'What is the other term that refers the North Star?',0,NULL,10,1,'2021-06-10 18:35:23','2021-06-10 18:35:23'),
(181,3,5,1,'She is considered as the sun goddess of the Shinto religion, the daughter of Izanagi and Izanami.',0,NULL,10,1,'2021-06-10 18:36:51','2021-06-10 18:36:51'),
(182,3,5,1,'One of the best novelists the world has known who wrote “Frankenstein” in 1817 and considered by many as the inventor of the genre Science fiction. Who is this novelist?',0,NULL,10,1,'2021-06-10 18:38:44','2021-06-10 18:38:44'),
(183,3,4,1,'',1,'7JQfYrMXOFDTVAzaUT0GkaxlFDOkWwDsMLJVihpz.png',10,1,'2021-06-10 18:39:39','2021-06-10 18:39:39'),
(184,3,5,1,'What is the name of the creature created in the novel Frankenstein?',0,NULL,10,1,'2021-06-10 18:40:31','2021-06-10 18:40:31'),
(185,3,5,1,'Which city is founded by a Philippine President in order to replace Manila City as the National Capital of the Philippines?',0,NULL,10,1,'2021-06-10 18:41:58','2021-06-10 18:41:58'),
(186,3,4,1,'What is the measure of the acute angle determined by the hands of a clock at 4:30?',0,NULL,10,1,'2021-06-10 18:42:23','2021-06-10 18:42:23'),
(187,3,4,1,'',1,'AR69BPF8KC9V4ugHhAQEzNad5UBQz1pOlrMWS2FC.png',10,1,'2021-06-10 18:45:49','2021-06-10 18:45:49'),
(188,3,5,1,'What is the name of the first Filipino made satellite manufactured by the Department of Science and Technology?',0,NULL,10,1,'2021-06-10 18:46:05','2021-06-10 18:46:05'),
(189,3,4,1,'How many integers between 299 and 401 are divisible by 4 or 9?',0,NULL,10,1,'2021-06-10 18:46:36','2021-06-10 18:46:36'),
(190,3,4,1,'How many factors of 2000 are perfect squares?',0,NULL,10,1,'2021-06-10 18:47:13','2021-06-10 18:47:13'),
(191,3,5,1,'Filipinos are fond of Teleseryes from teenage drama to action serye like “Ang Probinsyano”. Which among the following is the first epic historical fiction TV series in the Philippines that was inspired by Philippine pre-colonial political system, languages and costumes?',0,NULL,10,1,'2021-06-10 18:47:40','2021-06-10 18:47:40'),
(192,3,5,1,'Who was the first Filipino act that was nominated for “Top Social Artist” in the Billboard Music Award?',0,NULL,10,1,'2021-06-10 18:48:41','2021-06-10 18:48:41'),
(193,3,4,1,'If b is an odd integer greater than one, which of the following must be an even integer?',0,NULL,10,1,'2021-06-10 18:48:46','2021-06-10 18:48:46'),
(194,3,4,1,'',1,'PnuY34ipkCGVsoEfaF7CoqQaTACzYC3eejSncvJU.png',10,1,'2021-06-10 18:50:00','2021-06-10 18:50:00'),
(195,3,5,1,'She was the first Asian theater actress to win the Tony Awards as Best actress in 1991 for her role as Kim in Miss Saigon.',0,NULL,10,1,'2021-06-10 18:50:03','2021-06-10 18:50:03'),
(196,3,4,1,'',1,'fDVTCUjoOpaG3U6WzVkBFnCKz9ujhgH427AHZDly.png',10,1,'2021-06-10 18:51:02','2021-06-10 18:51:02'),
(197,3,5,1,'Which among the following is the current record holder for the highest grossing Filipino Film in the Philippines?',0,NULL,10,1,'2021-06-10 18:51:25','2021-06-10 18:51:25'),
(198,3,4,1,'',1,'9jhaE5qLjGpaVnRoWbCADkGqyk9YgvZvpkpPWOv4.png',10,1,'2021-06-10 18:52:22','2021-06-10 18:52:22'),
(199,3,5,1,'Tony Start, a CEO of Stark Industries made a body suit of armor using an arc reactor to power it up. Who was this Marvel Superhero?',0,NULL,10,1,'2021-06-10 18:52:33','2021-06-10 18:52:33'),
(200,3,5,1,'Thor son of Odin, the god of thunder, was vanished to Midgard in order to test his worthiness to ascend the Throne of Asgard. What was the name of Thor’s weapon that can only be wielded by those who are worthy?',0,NULL,10,1,'2021-06-10 18:53:41','2021-06-10 18:53:41'),
(201,3,4,1,'',1,'ghTU35DMasVt6MmqeHTqOINzPNjR9dkIvEJNEs6e.png',10,1,'2021-06-10 18:54:05','2021-06-10 18:54:05'),
(202,3,5,1,'What is the name of the first video game?',0,NULL,10,1,'2021-06-10 18:55:11','2021-06-10 18:55:11'),
(203,3,4,1,'',1,'KOVUOihfRRl0qHfP2oc5Fsl84MqQqITouiIx4Da7.png',10,1,'2021-06-10 18:56:25','2021-06-10 18:56:25'),
(204,3,5,1,'What was the name of the Mobile Legends character who was based on a Filipino Hero?',0,NULL,10,1,'2021-06-10 18:57:04','2021-06-10 18:57:04'),
(205,3,4,1,'',1,'jiRMcQbHbLDzsIfdyOoGnFZIcwUdioFz88lX7iOp.png',10,1,'2021-06-10 18:57:39','2021-06-10 18:57:39'),
(206,3,5,1,'Who was the leader of the Nazi Germany during World War II?',0,NULL,10,1,'2021-06-10 18:58:33','2021-06-10 18:58:33'),
(207,3,4,1,'',1,'DBKyzdE3VGHDENP0mOpYiikmuLBg2UVfxMqJpNAM.png',10,1,'2021-06-10 18:58:42','2021-06-10 18:58:42'),
(208,3,4,1,'',1,'oIAclHe1awsYcWCnHsiJ82a5fzmyvS5eDumTNJ2e.png',10,1,'2021-06-10 18:59:40','2021-06-10 18:59:40'),
(209,3,5,1,'Who is the reigning Miss Universe Philippines 2020',0,NULL,10,1,'2021-06-10 19:00:10','2021-06-10 19:00:10'),
(210,3,4,1,'',1,'1GXVuAMn5jbQm5hzLbZN9tDAdMJ70Omclu4sbGWp.png',10,1,'2021-06-10 19:00:34','2021-06-10 19:00:34'),
(211,3,4,1,'',1,'bMnaG1jDom7AfDyJB57odGd6eIBe5e6LbLnTsUQB.png',10,1,'2021-06-10 19:01:39','2021-06-10 19:01:39'),
(212,3,5,1,'This biological preparation typically contains an agent that resembles a disease-causing microorganism and is often made from weakened or killed forms of the microbe, its toxins, or one of its surface proteins.',0,NULL,10,1,'2021-06-10 19:02:02','2021-06-10 19:02:02'),
(213,3,4,2,'If circle O has a radius of 8, and if P and Q are points on circle O, then the maximum length of arcs which could separate P and Q is',0,NULL,10,1,'2021-06-10 19:02:51','2021-06-10 19:02:51'),
(214,3,5,1,'He is considered as the Father of Political Science since he provided the first ever working definition political science, he is also the first person who compared constitutions.',0,NULL,10,1,'2021-06-10 19:03:16','2021-06-10 19:03:16'),
(215,3,4,2,'A prime number is one with two divisors and which is divisible only by itself and 1. Which of the following is(are) prime number(s)?\n\nI. 119			II. 191			III. 201',0,NULL,10,1,'2021-06-10 19:03:57','2021-06-10 19:03:57'),
(216,3,5,1,'Is a method of learning where students are given freedom in how, what, and where they learn.',0,NULL,10,1,'2021-06-10 19:04:35','2021-06-10 19:04:35'),
(217,3,4,2,'If a triangle of base 8 is equal in area to a circle of radius 8, what is the altitude of the triangle?',0,NULL,10,1,'2021-06-10 19:04:37','2021-06-10 19:04:37'),
(218,3,5,1,'The first Esports happened at Stanford University in October 1972. What was the name of the video game used for Esports?',0,NULL,10,1,'2021-06-10 19:05:54','2021-06-10 19:05:54'),
(219,3,5,1,'Philippines is one of the countries in the world that recognizes the responsibility of the present generation to protect the environment in order to achieve environmental sustainability for the benefit of future generations. What is the name of this doctrine?',0,NULL,10,1,'2021-06-10 19:07:03','2021-06-10 19:07:03'),
(220,3,5,1,'What is the name of the first anime that was adopted from Philippine mythology comics?',0,NULL,10,1,'2021-06-10 19:08:14','2021-06-10 19:08:14'),
(221,3,5,1,'“Black box” is a common term in popular use but within the industry it is generally referred to as an electronic flight data recorder. What is the standard color of a black box?',0,NULL,10,1,'2021-06-10 19:09:28','2021-06-10 19:09:28'),
(222,3,5,1,'What country uses Gross National Happiness (GNH) as an alternative to Gross Domestic Product as an indicator in understanding the quality of life of its citizens?',0,NULL,10,1,'2021-06-10 19:10:40','2021-06-10 19:10:40'),
(223,3,5,1,'It is an active component found in chili peppers that causes irritation among animals including humans. What is this chemical?',0,NULL,10,1,'2021-06-10 19:12:30','2021-06-10 19:12:30'),
(224,3,5,1,'Who won as President during the 2016 presidential elections?',0,NULL,10,1,'2021-06-10 19:13:37','2021-06-10 19:13:37'),
(225,3,5,1,'It is a  gender identity wherein a person who can only experience sexual attraction after an emotional bond has been formed towards another regardless of sex or gender.',0,NULL,10,1,'2021-06-10 19:15:00','2021-06-10 19:15:00'),
(226,3,5,1,'As directed by R.A. 8491 or the Flag and Heraldic code of the Philippines, how should the National flag of the Philippines be displayed on a flagpole indoors?',0,NULL,10,1,'2021-06-10 19:17:16','2021-06-10 19:17:16'),
(227,3,5,1,'What is “green” in Cebuano/bisaya?',0,NULL,10,1,'2021-06-10 19:18:19','2021-06-10 19:18:19'),
(228,3,5,1,'What is “situation” in Bisaya?',0,NULL,10,1,'2021-06-10 19:19:37','2021-06-10 19:19:37'),
(229,3,4,2,'A number is a perfect number if it is the sum of all its integral divisors except itself. Which of the following is a perfect number?',0,NULL,10,1,'2021-06-10 19:20:52','2021-06-10 19:20:52'),
(230,3,5,1,'If the President or the Vice President dies or is removed from office. Who will act as the Head of State?',0,NULL,10,1,'2021-06-10 19:20:55','2021-06-10 19:20:55'),
(231,3,4,2,'The sum of the digits of a three-digit number is 16. If the hundreds’ digit is half the units’ digit and equal to the tens’ digit, what is the number?',0,NULL,10,1,'2021-06-10 19:22:02','2021-06-10 19:22:02'),
(232,3,5,2,'The 1987 Philippine Constitution of the Philippines provides safeguards in order to have  a just and humane society and to remain the rule of law. What concept found in our constitution that protects people from unjust deprivation of life, liberty and property?',0,NULL,10,1,'2021-06-10 19:22:26','2021-06-14 21:01:34'),
(233,3,5,1,'This branch of the government is considered as having the “power of the purse” since they hold the power to appropriate funds for the government.',0,NULL,10,1,'2021-06-10 19:23:58','2021-06-10 19:23:58'),
(235,3,5,1,'80.	Is extra judicial killings allowed in the Philippines? Why?',0,NULL,10,1,'2021-06-10 19:27:12','2021-06-10 19:27:12'),
(236,3,5,1,'Which is the first K-pop group that held their solo concert here in the Philippines?',0,NULL,10,1,'2021-06-10 19:28:24','2021-06-10 19:28:24'),
(237,3,5,1,'What is “pink” in Cebuano/Bisaya?',0,NULL,10,1,'2021-06-10 19:29:44','2021-06-10 19:29:44'),
(238,3,5,1,'What is the Bisaya of “orange”?',0,NULL,10,1,'2021-06-10 19:31:41','2021-06-10 19:31:41'),
(239,3,5,1,'What is the Bisaya/Cebuano of “Color”?',0,NULL,10,1,'2021-06-10 19:32:49','2021-06-10 19:32:49'),
(240,3,5,1,'What is “gray” in Cebuano?',0,NULL,10,1,'2021-06-10 19:34:08','2021-06-10 19:34:08'),
(241,3,5,1,'What is the name of the first Philippine made Supercar that can compete with international cars?',0,NULL,10,1,'2021-06-10 19:35:14','2021-06-10 19:35:14'),
(242,3,5,1,'Who is the first Asian to win a Grammy Award?',0,NULL,10,1,'2021-06-10 19:36:24','2021-06-10 19:36:24'),
(243,3,5,1,'The Anti-bastos law or the Safe spaces act punishes gender based harassments even on the streets. Which among the following is this law not applied?',0,NULL,10,1,'2021-06-10 19:38:37','2021-06-10 19:38:37'),
(244,3,4,2,'',1,'YrfSD4jLFtrKpoSJlsR9etn8yQhp8CQ4NBtDwVP3.png',10,1,'2021-06-10 19:39:08','2021-06-10 19:39:08'),
(245,3,5,2,'The Cybercrime Prevention Act of 2012 or Republic Act No. 10175, is a law in the Philippines that was approved on September 12, 2012. Among the cybercrime offenses included in the bill are cybersquatting, cybersex, child pornography, identity theft, illegal access to data and libel. Which among the following is not punishable by RA 10175?',0,NULL,10,1,'2021-06-10 19:39:54','2021-06-14 21:02:30'),
(246,3,4,2,'',1,'CpJiWqSN9frm2puHVBlw9C2ANKdoCFehmPdEIvnG.png',10,1,'2021-06-10 19:41:01','2021-06-10 19:41:01'),
(247,3,5,1,'Emma Watson the UN Women Goodwill Ambassador launched her campaign of “HeforShe” which encourages men to support women on their campaign towards equality. This campaign is anchored to what political ideology in general?',0,NULL,10,1,'2021-06-10 19:41:45','2021-06-10 19:41:45'),
(248,3,5,1,'The term of office of the President of the Philippines shall be?',0,NULL,10,1,'2021-06-10 19:42:46','2021-06-10 19:42:46'),
(249,3,4,2,'',1,'n6C8B6JTW5aIcqhqGykzWTqNe3PGzdML9Lvowu88.png',10,1,'2021-06-10 19:43:04','2021-06-10 19:43:04'),
(250,3,5,1,'The term of office of the Municipal Mayor in the Philippines shall be?',0,NULL,10,1,'2021-06-10 19:43:52','2021-06-10 19:43:52'),
(251,3,4,2,'',1,'yT0sTFkIuEYyRSWEsK6XOpwWnOt24JnyM56MGTLz.png',10,1,'2021-06-10 19:44:05','2021-06-10 19:44:05'),
(252,3,5,1,'The following shall be exempted from taxation except:',0,NULL,10,1,'2021-06-10 19:45:02','2021-06-10 19:45:02'),
(253,3,4,2,'',1,'BN6ejTaGtgIrfjvsuEC2l5xVrDK1QI4kQ8GM3dpc.png',10,1,'2021-06-10 19:45:39','2021-06-10 19:45:39'),
(254,3,5,1,'The following are citizens of the Philippines except:',0,NULL,10,1,'2021-06-10 19:46:16','2021-06-10 19:46:16'),
(255,3,5,1,'Who among the  have the exclusive power to initiate impeachment cases?',0,NULL,10,1,'2021-06-10 19:47:11','2021-06-10 19:47:11'),
(256,3,4,2,'What is the slope of the line containing (0, 1) and (6, 8)?',0,NULL,10,1,'2021-06-10 19:47:23','2021-06-10 19:47:23'),
(257,3,5,1,'It is a specialized agency of the United Nations that concerns international public health.',0,NULL,10,1,'2021-06-10 19:48:22','2021-06-14 21:02:45'),
(258,3,1,2,'',1,'b66yDsmLijiBQuEbGUEMEHr67OZB6FWmcsfa7slc.png',10,1,'2021-06-10 19:48:42','2021-06-10 19:48:42'),
(259,3,5,1,'It is a law in the Philippines that aims to address legal issues concerning online interactions and harmful internet behaviors in the Philippines.',0,NULL,10,1,'2021-06-10 19:49:24','2021-06-10 19:49:24'),
(260,3,5,1,'USB is an industry standard, \'user-friendly\' method of transferring data between a host device  and a peripheral device. What does USB mean?',0,NULL,10,1,'2021-06-10 19:50:27','2021-06-10 19:50:27'),
(261,3,4,2,'Which of the following has the greatest value?',0,NULL,10,1,'2021-06-10 19:50:37','2021-06-10 19:50:37'),
(262,3,4,2,'If a positive integer m is divisible by both 3 and 7, then m must also be divisible by',0,NULL,10,1,'2021-06-10 19:52:04','2021-06-10 19:52:04'),
(263,3,5,1,'The laws of the Philippines allow warrantless arrest and warrantless search. Which among the following is an illegal warrantless search?',0,NULL,10,1,'2021-06-10 19:52:14','2021-06-10 19:52:14'),
(264,3,5,1,'What is the current longest water-spanning bridge in the Philippines?',0,NULL,10,1,'2021-06-10 19:54:54','2021-06-10 19:54:54'),
(265,3,5,2,'What does the red color of the Philippine flag represent?',0,NULL,10,1,'2021-06-10 19:56:52','2021-06-10 19:56:52'),
(266,3,5,2,'What famous volcano is known for its perfect cone?',0,NULL,10,1,'2021-06-10 19:58:18','2021-06-10 19:58:18'),
(268,3,5,2,'Which of the following is the largest island in the Philippines?',0,NULL,10,1,'2021-06-10 20:00:52','2021-06-10 20:00:52'),
(269,3,5,2,'What is the oldest city in the Philippines?',0,NULL,10,1,'2021-06-10 20:01:53','2021-06-10 20:01:53'),
(270,3,5,2,'What is the region that is composed of cities and no provinces?',0,NULL,10,1,'2021-06-10 20:02:57','2021-06-10 20:02:57'),
(271,3,5,2,'Which of the following is the founder of the KKK?',0,NULL,10,1,'2021-06-10 20:04:02','2021-06-10 20:04:02'),
(272,3,5,2,'Who was the leader of the Sakdalistas who led an uprising against the Commonwealth regime due to its inability to respond to the demands of the peasants?',0,NULL,10,1,'2021-06-10 20:05:35','2021-06-10 20:05:35'),
(273,3,5,2,'Who named the Philippines?',0,NULL,10,1,'2021-06-10 20:07:43','2021-06-10 20:07:43'),
(274,3,5,2,'Which of the following is the first president of the Philippines?',0,NULL,10,1,'2021-06-10 20:09:44','2021-06-10 20:09:44'),
(275,3,5,2,'Who was the leader of the longest revolt in the Philippines during the Spanish Period?',0,NULL,10,1,'2021-06-10 20:11:56','2021-06-10 20:11:56'),
(276,3,5,2,'Who is the Philippine national hero?',0,NULL,10,1,'2021-06-10 20:13:01','2021-06-10 20:13:01'),
(277,3,5,2,'When was the second largest volcanic eruptions in history of Philippines in the 20th century?',0,NULL,10,1,'2021-06-10 21:02:15','2021-06-10 21:02:15'),
(278,3,5,2,'How many years was the Philippines colonized by Spain?',0,NULL,10,1,'2021-06-10 21:03:30','2021-06-10 21:03:30'),
(279,3,5,2,'What date is our National Heroes Day celebrated?',0,NULL,10,1,'2021-06-10 21:05:42','2021-06-10 21:05:42'),
(280,3,5,2,'The following are the reasons why Rizal was not in favor of a national armed revolution except',0,NULL,10,1,'2021-06-10 21:08:08','2021-06-10 21:08:08'),
(281,3,5,2,'Where did the historic death march happen?',0,NULL,10,1,'2021-06-10 21:09:42','2021-06-10 21:09:42'),
(282,3,5,2,'It was considered the last defense of the Philippines during the Japanese invasion.',0,NULL,10,1,'2021-06-10 21:10:50','2021-06-10 21:10:50'),
(283,3,5,2,'When was Manila declared open city?',0,NULL,10,1,'2021-06-10 21:12:13','2021-06-10 21:12:13'),
(284,3,5,2,'What kind of government did the Japanese establish in the Philippines during World War 2?',0,NULL,10,1,'2021-06-10 21:13:34','2021-06-10 21:13:34'),
(285,3,5,2,'Who is the brain of the Katipunan?',0,NULL,10,1,'2021-06-10 21:14:32','2021-06-10 21:14:32'),
(286,3,5,2,'What was sent by the Japanese to the Philippines to hunt guerillas?',0,NULL,10,1,'2021-06-10 21:15:45','2021-06-10 21:15:45'),
(287,3,5,2,'Why did the Japanese censor and control radio and newspaper in the Philippines?',0,NULL,10,1,'2021-06-10 21:16:54','2021-06-10 21:16:54'),
(288,3,5,2,'Who was the Philippine President under the commonwealth government?',0,NULL,10,1,'2021-06-10 21:18:07','2021-06-10 21:18:07'),
(289,3,5,2,'What was the type of land ownership during the pre-Spanish period?',0,NULL,10,1,'2021-06-10 21:19:12','2021-06-10 21:19:12'),
(290,3,5,2,'It is a small or basic unit of government consisting of 30-100 families.',0,NULL,10,1,'2021-06-10 21:20:41','2021-06-10 21:20:41'),
(291,3,5,2,'What was the common type of land cultivation during pre-Spanish time?',0,NULL,10,1,'2021-06-10 21:28:20','2021-06-10 21:28:20'),
(292,3,5,2,'It is a large tract of land given to Spaniards to manage and have the right to receive tributes from the natives tilling it.',0,NULL,10,1,'2021-06-10 21:29:23','2021-06-10 21:29:23'),
(293,3,5,2,'The Philippine Bill of 1902 provided regulations on the disposal of public lands wherein a private individual can own',0,NULL,10,1,'2021-06-10 21:30:25','2021-06-10 21:30:25'),
(294,3,5,2,'It was then introduced to replace the registration system implemented by the Spaniards.',0,NULL,10,1,'2021-06-10 21:31:59','2021-06-10 21:31:59'),
(295,3,5,2,'Why was RA No. 3844 considered the most comprehensive piece of legislation ever enacted in the Philippines?',0,NULL,10,1,'2021-06-10 21:33:14','2021-06-10 21:33:14'),
(296,3,5,2,'How did the Spaniards establish bureaucracy in the colonial Philippines?',0,NULL,10,1,'2021-06-10 21:34:33','2021-06-10 21:34:33'),
(297,3,5,2,'What does the title \"Noli Me Tangere\" mean?',0,NULL,10,1,'2021-06-10 21:35:38','2021-06-10 21:35:38'),
(298,3,5,2,'What does the title El Filibusterismo mean',0,NULL,10,1,'2021-06-10 21:37:09','2021-06-10 21:37:09'),
(299,3,5,2,'What was the date of birth of Dr. Jose Rizal?',0,NULL,10,1,'2021-06-10 21:38:18','2021-06-10 21:38:18'),
(300,3,5,2,'At 16, Rizal experienced his first romance. He fell in love with which girl?',0,NULL,10,1,'2021-06-10 21:41:18','2021-06-10 21:41:18'),
(301,3,5,2,'What is the complete legal name of Dr. Jose Rizal?',0,NULL,10,1,'2021-06-10 21:42:50','2021-06-10 21:42:50'),
(302,3,5,2,'El Filibusterismo is dedicated to',0,NULL,10,1,'2021-06-10 21:43:57','2021-06-10 21:43:57'),
(303,3,2,1,'Pia is taller than Catriona. Rabiya is shorter than Pia. Rabiya is shorter than Catriona.\nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:44:18','2021-06-10 21:44:18'),
(304,3,2,1,'Juan is smarter than Pedro. Pedro is smarter than Allan. Allan is smarter than Juan.\nIf the two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:44:59','2021-06-10 21:44:59'),
(305,3,5,2,'Where is the Philippines located in the world map?',0,NULL,10,1,'2021-06-10 21:45:05','2021-06-10 21:45:05'),
(306,3,2,1,'Givheart is weirder than Pablo. Pablo is weirder than Tekla. Givheart is weirder than Tekla.\nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:45:41','2021-06-10 21:45:41'),
(307,3,5,2,'How is the terrain of the Philippines best described?',0,NULL,10,1,'2021-06-10 21:46:37','2021-06-10 21:46:37'),
(308,3,2,1,'Miya is more unknown than Wanwan. Wanwan is better known than Layla. Layla is more unknown than Miya. \nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:48:38','2021-06-10 21:48:38'),
(309,3,5,2,'How many islands made up the Philippine Archipelago?',0,NULL,10,1,'2021-06-10 21:49:15','2021-06-10 21:49:15'),
(310,3,2,1,'Bruno is more fun than Granger. Brody has less fun than Granger. Bruno has more fun than Brody.\nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:49:41','2021-06-10 21:49:41'),
(311,3,5,2,'The Philippines as part of the Pacific Ring of Fire is characterized by what?',0,NULL,10,1,'2021-06-10 21:50:20','2021-06-10 21:50:20'),
(312,3,2,1,'Math is more difficult than Science and Technology. Science and Technology is easier than Philosophy. Philosophy is easier than Math.\nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:50:36','2021-06-10 21:50:36'),
(313,3,2,1,'It is easier to drive in mud than it is in slippery roads. It is harder to drive in mud than in rough. It is easier to drive in rough than in slippery roads.\nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:51:11','2021-06-17 13:27:10'),
(314,3,2,1,'Nuclear energy is more efficient than coal energy. Coal energy is less efficient than gas energy. Gas energy is more efficient than nuclear energy. \nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:51:48','2021-06-10 21:51:48'),
(315,3,2,1,'There are more cabs than trucks on the roads in Tangub City. There are more motorcycles than there are trucks on the roads in Tangub City. There are more cabs than motorcycles on the roads in Tangub City. \nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:52:26','2021-06-10 21:52:26'),
(316,3,5,2,'This is the largest sea within the Philippines. It contains the UNESCO World Heritage Site - Tubbataha Reef. It shares the same name with an archipelagic Philippine province. What is this sea?',0,NULL,10,1,'2021-06-10 21:53:17','2021-06-10 21:53:17'),
(317,3,2,1,'Juan has a greater salary than Givheart. Berting has a lower salary than Juan. Givheart’salary is less than Berting\'s. \nIf the first two sentences are true, the third is:',0,NULL,10,1,'2021-06-10 21:53:55','2021-06-10 21:53:55'),
(318,3,5,2,'This sea is found north of Mindanao and south of the Visayan Islands. It entirely surrounds the island provinces of Camiguin and Siquijor. It is also name after an island province lying just north of it. What is the name of this sea?',0,NULL,10,1,'2021-06-10 21:54:28','2021-06-10 21:54:28'),
(319,3,2,1,'There is truth in the statement: “There is no truth.”',0,NULL,10,1,'2021-06-10 21:55:36','2021-06-10 21:55:36'),
(320,3,5,2,'The Rice Terraces of the mountainous Cordilleras are the only form of stone construction in the Philippines uninfluenced by colonial cultures. What crop was grown before rice took over around 1600 AD?',0,NULL,10,1,'2021-06-10 21:55:45','2021-06-10 21:55:45'),
(321,3,5,2,'Ninety kilometres north-west of the capital Manila can be found Lake Pinatubo, possibly the country\'s deepest lake at 600 metres depth. How was it formed?',0,NULL,10,1,'2021-06-10 21:56:51','2021-06-10 21:56:51'),
(322,3,2,1,'All bachelors are unmarried man.\nJuan is unmarried man.\nErgo, Juan is bachelor.',0,NULL,10,1,'2021-06-10 21:58:04','2021-06-10 21:58:04'),
(323,3,5,2,'Turning to energy, which renewable resource contributes the most to the Philippine power network?',0,NULL,10,1,'2021-06-10 21:58:15','2021-06-10 21:58:15'),
(324,3,5,2,'The Chocolate Hills of Bohol are a collection of more than 1,250 cone-shaped limestone hills spread over some 50 square kilometres. Why \'chocolate\'?',0,NULL,10,1,'2021-06-10 21:59:33','2021-06-10 21:59:33'),
(325,3,2,1,'All man is mortal.\nGivheart is a woman.\nTherefore, Givheart is not mortal.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:00:09','2021-06-10 22:00:09'),
(326,3,5,2,'This city is nicknamed as the \'City in the Sky\'. What is the name of this highly urbanized city?',0,NULL,10,1,'2021-06-10 22:00:31','2021-06-10 22:00:31'),
(327,3,2,1,'A cellphone is useful.\nUseful things are valuable.\nA cellphone is valuable.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:00:48','2021-06-10 22:00:48'),
(328,3,2,1,'If it rains today then the road is wet.\nThe road is wet, yet it did not rain today.\nIt follows that if the road is wet then it is cause by the rain.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:01:36','2021-06-17 13:28:00'),
(329,3,2,1,'Givheart puts on his socks before he puts on his shoes.\nHe puts on his shirt before he puts on his jacket.\nGivheart puts on his shoes before he puts on his shirt.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:02:07','2021-06-10 22:02:07'),
(330,3,5,2,'Who led the longest revolt in the Philippines during the Spanish times?',0,NULL,10,1,'2021-06-10 22:02:11','2021-06-10 22:02:11'),
(331,3,5,2,'Who led the longest revolt in the Philippines during the Spanish times?',0,NULL,10,1,'2021-06-10 22:02:11','2021-06-10 22:02:11'),
(332,3,2,1,'Three ball pens cost the same as two notebooks.\nFour notebooks cost the same as one pencil.\nPencils are more expensive than books.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:02:46','2021-06-10 22:02:46'),
(334,3,5,2,'Who first introduced the Islamic religion in the Philippines?',0,NULL,10,1,'2021-06-10 22:04:23','2021-06-10 22:04:23'),
(335,3,2,1,'A bucket of fried chicken contains more wings than breast.\nThere are more thighs than wings.\nThe bucket contains fewer thighs than breasts.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:04:55','2021-06-17 13:28:52'),
(336,3,2,1,'All the Sampaguita in Givheart’s garden are red.\nAll the Carnations in Givheart’s garden are yellow.\nAll the flowers in Givheart’s garden are either red or yellow.\nIf the first two statements are true, the third statement is:',0,NULL,10,1,'2021-06-10 22:05:43','2021-06-10 22:05:43'),
(337,3,5,2,'The Philippine President whose economic policy was called \"Filipino First Policy\".',0,NULL,10,1,'2021-06-10 22:05:48','2021-06-10 22:05:48'),
(338,3,2,1,'The history book has more pages from the poetry book, but fewer pages than the math book.\nThe math book has more pages than the science book but fewer pages than the English book.\nThe poetry book has the fewest pages.\nIf the first two statements are true, the third is:',0,NULL,10,1,'2021-06-10 22:06:18','2021-06-10 22:06:18'),
(339,3,5,2,'He was otherwise known as the President of the Masses.',0,NULL,10,1,'2021-06-10 22:07:02','2021-06-10 22:07:02'),
(340,3,2,1,'Angel is older than Ivana.\nCardo is older than Angel.\nIvana is older than Cardo.\nIf the first two statement are true, the third is:',0,NULL,10,1,'2021-06-10 22:07:34','2021-06-10 22:07:34'),
(341,3,5,2,'The composer of the Philippine National Anthem, Lupang Hinirang.',0,NULL,10,1,'2021-06-10 22:08:11','2021-06-10 22:08:11'),
(342,3,2,1,'Blueberries cost more than strawberries.\nBlueberries cost less than raspberries.\nRaspberries cost more than both strawberries and blueberries.\nIf the first two statements are true, the third is:',0,NULL,10,1,'2021-06-10 22:08:36','2021-06-10 22:08:36'),
(343,3,2,1,'During the past years, Pablo saw more movies than Pedro.\nPedro saw fewer movies than Matteo.\nMatteo saw more movies than Pablo.\nIf the first two statements are true, the third is:',0,NULL,10,1,'2021-06-10 22:10:07','2021-06-10 22:10:07'),
(344,3,5,2,'Who named the country \'Islas de San Lazaro\'?',0,NULL,10,1,'2021-06-10 22:10:12','2021-06-10 22:10:12'),
(345,3,5,2,'He is known as the \"Brains of the Revolution\".',0,NULL,10,1,'2021-06-10 22:11:18','2021-06-10 22:11:18'),
(346,3,5,2,'The president who passed RA 6657 or the Comprehensive Agrarian Reform Law.',0,NULL,10,1,'2021-06-10 22:12:25','2021-06-10 22:12:25'),
(347,3,5,2,'He was the first appointed head of the Department of Education during the Commonwealth period.',0,NULL,10,1,'2021-06-10 22:13:24','2021-06-10 22:13:24'),
(348,3,5,2,'Which of the following has the power to declare a state of war?',0,NULL,10,1,'2021-06-10 22:14:24','2021-06-10 22:14:24'),
(349,3,2,1,'Miya is younger than Layla.\nHanabi was born after Miya.\nLayla is older than Hanabi. \nIf the first two statements are true, the third is:',0,NULL,10,1,'2021-06-10 22:14:41','2021-06-10 22:14:41'),
(350,3,5,2,'Who was known as the President of the Common Tao?',0,NULL,10,1,'2021-06-10 22:16:14','2021-06-10 22:16:14'),
(351,3,2,1,'The temperature on Monday was lower than on Tuesday.\nThe temperature on Wednesday was lower than on Tuesday.\nThe temperature on Monday was higher than on Wednesday\nIf the first two statements are true, the third is:',0,NULL,10,1,'2021-06-10 22:16:49','2021-06-10 22:16:49'),
(352,3,5,2,'What is Right of Suffrage?',0,NULL,10,1,'2021-06-10 22:17:20','2021-06-10 22:17:20'),
(353,3,5,2,'When is the President’s SONA being delivered?',0,NULL,10,1,'2021-06-10 22:18:44','2021-06-10 22:18:44'),
(354,3,2,1,'Complete the analogy\n_____ : trail :: grain : grail',0,NULL,10,1,'2021-06-10 22:18:46','2021-06-10 22:18:46'),
(355,3,5,2,'What event followed when the Katipunan was discovered?',0,NULL,10,1,'2021-06-10 22:19:57','2021-06-10 22:19:57'),
(357,3,5,2,'During the Pre-Spanish period, this is the song the Filipino natives would sing in preparation for war.',0,NULL,10,1,'2021-06-10 22:22:37','2021-06-10 22:22:37'),
(358,3,5,2,'What Filipino trait is known for warm welcome to guests?',0,NULL,10,1,'2021-06-10 22:23:39','2021-06-10 22:23:39'),
(359,3,2,1,'Complete the analogy\n4 : 6 :: _____ : 16',0,NULL,10,1,'2021-06-10 22:24:40','2021-06-10 22:24:40'),
(360,3,5,2,'Which member of the Katipunan commuted from Cavite to Manila to buy materials for making ammunitions?',0,NULL,10,1,'2021-06-10 22:24:53','2021-06-10 22:24:53'),
(361,3,2,1,'Complete the analogy\n_____ : horse :: board : train',0,NULL,10,1,'2021-06-10 22:26:03','2021-06-10 22:26:03'),
(362,3,5,2,'Which of the following presidents changed the date of celebration of independence from July for to June 12?',0,NULL,10,1,'2021-06-10 22:26:31','2021-06-10 22:26:31'),
(363,3,5,2,'This is the poem of Rizal where he wrote about offering one’s life for his country.',0,NULL,10,1,'2021-06-10 22:27:45','2021-06-10 22:27:45'),
(364,3,5,2,'The last Filipino general to surrender to the Americans was',0,NULL,10,1,'2021-06-10 22:29:33','2021-06-10 22:29:33'),
(366,3,5,2,'What did the ancient Filipinos call the supreme being they believed?',0,NULL,10,1,'2021-06-10 22:30:40','2021-06-10 22:30:40'),
(367,3,4,3,'A sum of money placed at compound interest doubles itself in 3 years. If interest is being compounded annually, in how many years will it amount to four times itself? Assume that P is the amount invested initially.',0,NULL,10,1,'2021-06-10 22:31:41','2021-06-10 22:31:41'),
(368,3,5,2,'Which Spaniard arrived in Cebu in 1565 and established first Spanish settlement?',0,NULL,10,1,'2021-06-10 22:32:45','2021-06-10 22:32:45'),
(369,3,5,2,'What is the most important requirement to establish a civilization?',0,NULL,10,1,'2021-06-10 22:34:13','2021-06-10 22:34:13'),
(370,3,2,1,'Complete the analogy\nson : nuclear :: _____ : extended',0,NULL,10,1,'2021-06-10 22:35:20','2021-06-10 22:35:20'),
(371,3,5,2,'How many ships did Magellan bring in his voyage to the Philippines?',0,NULL,10,1,'2021-06-10 22:35:42','2021-06-10 22:35:42'),
(372,3,4,3,'',1,'2p0sZ8YVOgJlBdubV567nR2EadcJfLVeexTwzSPZ.png',10,1,'2021-06-10 22:35:54','2021-06-10 22:35:54'),
(373,3,5,2,'One of the last Filipino generals who fought the Americans and established the so-called \'Tagalog Republic\'',0,NULL,10,1,'2021-06-10 22:37:44','2021-06-10 22:37:44'),
(374,3,4,3,'The summer Olympics occur every four years. Which formula represents the years of the summer Olympics, starting with 2016?',0,NULL,10,1,'2021-06-10 22:38:14','2021-06-10 22:38:14'),
(375,3,4,3,'John is twice as old as his friend Peter. Peter is 5 years older than Alice. In 5 years, John will be three times as old as Alice. How old is Peter now?',0,NULL,10,1,'2021-06-10 22:39:22','2021-06-10 22:39:22'),
(376,3,4,3,'John’s father is 5 times older than John and John is twice as old as his sister Alice. In two years time, the sum of their ages will be 58. How old is John now?',0,NULL,10,1,'2021-06-10 22:39:55','2021-06-10 22:39:55'),
(377,3,2,1,'Complete the analogy\ndiamond : diamond :: court : _____',0,NULL,10,1,'2021-06-10 22:39:59','2021-06-10 22:39:59'),
(378,3,5,2,'She is a Filipino heroine. After her husband died, she continued the war against Spain, was caught and hanged.',0,NULL,10,1,'2021-06-10 22:40:05','2021-06-10 22:40:05'),
(379,3,5,2,'In 1851, the first commercial bank in the Philippines and the far East, was established. What is the present name of this bank?',0,NULL,10,1,'2021-06-10 22:41:46','2021-06-10 22:41:46'),
(380,3,4,3,'How many liters of 20% alcohol solution should be added to 40 liters of a 50% alcohol solution to make a 30% solution?',0,NULL,10,1,'2021-06-10 22:41:48','2021-06-10 22:41:48'),
(381,3,4,3,'John wants to make a 100 ml of 5% alcohol solution mixing a quantity of a 2% alcohol solution with a 7% alcohol solution. What are the quantities of each of the two solutions (2% and 7%) he has to use?',0,NULL,10,1,'2021-06-10 22:42:44','2021-06-10 22:42:44'),
(382,3,4,3,'How many Kilograms of Pure water is to be added to 100 Kilograms of a 30% saline solution to make it a 10% saline solution?',0,NULL,10,1,'2021-06-10 22:43:30','2021-06-10 22:43:30'),
(383,3,5,2,'What date was Andres Bonifacio’s death?',0,NULL,10,1,'2021-06-10 22:43:32','2021-06-10 22:43:32'),
(384,3,4,3,'A 50 ml after-shave lotion at 30% alcohol is mixed with 30 ml of pure water. What is the percentage of alcohol in the new solution?',0,NULL,10,1,'2021-06-10 22:44:16','2021-06-10 22:44:16'),
(385,3,5,2,'When was Andres Bonifacio born?',0,NULL,10,1,'2021-06-10 22:44:39','2021-06-10 22:44:39'),
(386,3,4,3,'A tank can be filled by pipe A in 3 hours and by pipe B in 5 hours. When the tank is full, it can be drained by pipe C in 4 hours. if the tank is initially empty and all three pipes are open, how many hours will it take to fill up the tank?',0,NULL,10,1,'2021-06-10 22:45:09','2021-06-10 22:45:09'),
(387,3,5,2,'When was Jose Rizal born?',0,NULL,10,1,'2021-06-10 22:46:15','2021-06-10 22:46:15'),
(388,3,4,3,'From a boat on the lake, the angle of elevation to the top of the cliff is 24°22\'. If the base of the cliff is 747 feet from the boat, how high is the cliff (to the nearest foot)?',0,NULL,10,1,'2021-06-10 22:47:26','2021-06-10 22:47:26'),
(389,3,5,2,'When was Jose Rizal’s death?',0,NULL,10,1,'2021-06-10 22:47:32','2021-06-10 22:47:32'),
(390,3,4,3,'From a boat on the river below a dam, the angle of elevation to the top of the dam is 24°8\'. If the dam is 2039 feet above the level of the river, how far is the boat from the base of the dam (to the nearest foot)?',0,NULL,10,1,'2021-06-10 22:48:17','2021-06-10 22:48:17'),
(391,3,5,2,'The following symbolizes the meaning of the blue stripe in the Philippine flag except',0,NULL,10,1,'2021-06-10 22:48:30','2021-06-10 22:48:30'),
(392,3,4,3,'A man at ground level measures the angle of elevation to the top of the building to be 67°. If at this point, he is 15 feet away from the building, what is the height of the',0,NULL,10,1,'2021-06-10 22:49:08','2021-06-10 22:49:08'),
(393,3,2,1,'Complete the analogy\nmarshal : prisoner :: principal : _____',0,NULL,10,1,'2021-06-10 22:49:19','2021-06-10 22:49:19'),
(394,3,5,2,'The following symbolizes the white color of the Philippine flag except',0,NULL,10,1,'2021-06-10 22:49:43','2021-06-10 22:49:43'),
(395,3,4,3,'A 35-foot ladder is leaning against the side of a building and is positioned such that the base of the ladder is 21 feet from the base of the building. How far above the ground is the point where the ladder touches the building?',0,NULL,10,1,'2021-06-10 22:49:46','2021-06-10 22:49:46'),
(396,3,4,3,'The main mast of a fishing boat is supported by a sturdy rope that extends from the top of the mast to the deck. If the mast is 20 feet tall and the rope attached to the deck 15 feet away from the base of the mast, how long is the rope?',0,NULL,10,1,'2021-06-10 22:50:36','2021-06-10 22:50:36'),
(397,3,5,2,'The Philippine flag shall be permanently hoisted, day and night, throughout the year, in front of the following, except',0,NULL,10,1,'2021-06-10 22:50:57','2021-06-10 22:50:57'),
(398,3,5,2,'If the flag is raised with its red stripe at the top, it means',0,NULL,10,1,'2021-06-10 22:52:40','2021-06-10 22:52:40'),
(399,3,2,1,'Complete the analogy\npoetry : rhyme :: philosophy : _____',0,NULL,10,1,'2021-06-10 22:55:25','2021-06-11 17:34:19'),
(400,3,5,2,'What is the capital city of Misamis Occidental?',0,NULL,10,1,'2021-06-10 22:56:41','2021-06-10 22:56:41'),
(401,3,2,1,'Complete the analogy\nsegregate : unify :: repair : _____',0,NULL,10,1,'2021-06-10 22:56:45','2021-06-10 22:56:45'),
(402,3,5,2,'What year was Tangub City became a chartered city?',0,NULL,10,1,'2021-06-10 22:58:17','2021-06-10 22:58:17'),
(403,3,4,3,'Two cyclists start from the same location. One cyclist travels due north and the other due east, at the same speed. Find the speed of each in miles per hour if after two hours they are 17sqrt(2) miles apart.',0,NULL,10,1,'2021-06-10 22:59:18','2021-06-10 22:59:18'),
(405,3,5,2,'The name ‘Misamis’ is believed to have been derived from the Subano word ‘Kuyamis’ which is a variety of',0,NULL,10,1,'2021-06-10 22:59:24','2021-06-10 22:59:24'),
(407,3,2,1,'Complete the analogy\n80 : 40 :: 2 : _____',0,NULL,10,1,'2021-06-10 23:00:20','2021-06-10 23:00:20'),
(408,3,5,2,'What is the legendary bird of the Maranao people?',0,NULL,10,1,'2021-06-10 23:00:49','2021-06-10 23:00:49'),
(411,3,5,2,'What is the Philippine National fish?',0,NULL,10,1,'2021-06-10 23:02:08','2021-06-10 23:02:08'),
(412,3,2,1,'Complete the analogy\nprinciple : doctrine :: living : _____',0,NULL,10,1,'2021-06-10 23:02:14','2021-06-10 23:02:14'),
(416,3,5,2,'What is the Philippine National Bird?',0,NULL,10,1,'2021-06-10 23:03:19','2021-06-10 23:03:19'),
(418,3,2,2,'Complete the analogy\nalphabetical : _____ :: sequential : files',0,NULL,10,1,'2021-06-10 23:03:36','2021-06-10 23:03:36'),
(419,3,5,2,'This is a Tausug song of advice to a wedded couple.',0,NULL,10,1,'2021-06-10 23:04:45','2021-06-10 23:04:45'),
(420,3,5,2,'When Gloria Macapagal Arroyo became president of the Philippines, how many female presidents had there been before her?',0,NULL,10,1,'2021-06-10 23:06:26','2021-06-10 23:06:26'),
(422,3,5,2,'Who is the Father of Filipino language?',0,NULL,10,1,'2021-06-10 23:07:49','2021-06-10 23:07:49'),
(423,3,4,3,'There are 75 questions in a college entrance examination. Two points are awarded for each correct answer, and one-half point is deducted for each wrong answer. A score of 100 indicates how many correct answers, assuming that all questions are answered?',0,NULL,10,1,'2021-06-10 23:07:59','2021-06-10 23:07:59'),
(424,3,4,3,'There are 70 questions on a test. The questions are either multiple-choice, true-false or fill-in. There are twice as many true-false as fill-in and five more multiple-choice than true-false. How many multi-choice questions are there?',0,NULL,10,1,'2021-06-10 23:08:37','2021-06-10 23:08:37'),
(425,3,5,2,'Who is the president who first declared Martial Law in the Philippines?',0,NULL,10,1,'2021-06-10 23:09:25','2021-06-10 23:09:25'),
(426,3,4,3,'Shari went to a level field to fly a kite. She let out all 650 feet of the string and tied it to a stake. Then, she walked out on the field until she was directly under the kite, which was 600 feet from the stake. How high was the kite from the ground?',0,NULL,10,1,'2021-06-10 23:09:36','2021-06-10 23:09:36'),
(427,3,5,2,'The youngest President, taking office at age 28 . Also the longest-lived president, passing away at 94 .',0,NULL,10,1,'2021-06-10 23:10:45','2021-06-10 23:10:45'),
(428,3,5,2,'The Philippines was ranked second in Asia’s clean and well-governed countries during his presidency.',0,NULL,10,1,'2021-06-10 23:11:48','2021-06-10 23:11:48'),
(429,3,4,3,'Isabella is making a display board for the school elections. The display board is a 10 ft by 6 ft rectangle. She needs to add a ribbon border around the entire display board. What is the length of ribbon that she needs?',0,NULL,10,1,'2021-06-10 23:13:17','2021-06-10 23:13:17'),
(430,3,4,3,'Jasmine is making a display board for the school talent show. The display board is a 10 ft by 9 ft rectangle. If ribbon costs $2 per foot, how much will it cost to add a ribbon border around the entire display board?',0,NULL,10,1,'2021-06-10 23:14:32','2021-06-10 23:14:32'),
(431,3,4,3,'Danny has a rectangular rose garden that measures 8 m by 10 m. One bag of fertilizer can cover 16 m2. How many bags will he need to cover the entire garden?',0,NULL,10,1,'2021-06-10 23:15:11','2021-06-10 23:15:11'),
(432,3,5,2,'He is the first Philippine President to be buried at the Libingan ng mga Bayani.',0,NULL,10,1,'2021-06-10 23:15:19','2021-06-10 23:15:19'),
(433,3,5,2,'He is known as the hot tempered general who fought against the United States in the Spanish-American War.',0,NULL,10,1,'2021-06-10 23:16:44','2021-06-10 23:16:44'),
(434,3,5,2,'Dr. Jose Rizal wrote this novel to expose evils of Spanish rule in the Philippines.',0,NULL,10,1,'2021-06-10 23:18:10','2021-06-10 23:18:10'),
(435,3,4,3,'Chloe wants to wrap a present in a box for Sarah. The top and bottom of the box is 8 in. by 3 in., the sides are both 3 in. by 2 in. and the front and back are 8 in. by 2 in. How much wrapping paper will Chloe need to wrap the present?',0,NULL,10,1,'2021-06-10 23:18:57','2021-06-10 23:18:57'),
(436,3,4,3,'A company is deciding which box to use for their merchandise. The first box measures 8 inches by 6.25 inches by 10.5 inches. The second box measures 9 inches by 5.5 inches by 11.75 inches. Which box required more material to make?',0,NULL,10,1,'2021-06-10 23:19:40','2021-06-10 23:19:40'),
(437,3,5,2,'During much of the Spanish occupation, how were the natives of the Philippines called?',0,NULL,10,1,'2021-06-10 23:19:56','2021-06-10 23:19:56'),
(438,3,4,3,'A moving company is trying to store boxes in a storage room with a length of 5 m, width of 3 m and height of 2 m. How many boxes can fit in this space if each is 10 cm long, 6 cm wide and 4 cm high?',0,NULL,10,1,'2021-06-10 23:20:23','2021-06-10 23:20:23'),
(439,3,5,2,'On January 1, 2018, the Republic Act No. 10963, widely known as the TRAIN Law took effect. What does TRAIN stand for?',0,NULL,10,1,'2021-06-10 23:21:11','2021-06-10 23:21:11'),
(459,3,2,2,'Complete the analogy\nimplement : rule :: _____ : verdict',0,NULL,10,1,'2021-06-11 17:27:48','2021-06-11 17:38:13'),
(460,3,2,3,'Six friends A, B, C, D, E and F are sitting around the hexagonal table each at one corner and facing the center of the table. \nA is second to the left of F.\nB is the neighbor of C and D.\nE is second to the left of D.\nFind the third person to the right of F?',0,NULL,10,1,'2021-06-11 17:30:17','2021-06-11 17:30:17'),
(461,3,2,3,'Pablo lives in the topmost floor. There is exactly one person between Juan and Thomas. There are exactly two people between John and Peter. Thomas and Allan live on successive floors. Maria lives between Pablo and John. How many people live between Peter and Pablo?',0,NULL,10,1,'2021-06-11 17:31:48','2021-06-11 17:31:48'),
(462,3,2,3,'Numbers: 813 479 564 358. If the 1st and 3rd digits are interchanged, which number will be of maximum value?',0,NULL,10,1,'2021-06-11 17:33:15','2021-06-11 17:33:15'),
(463,3,2,3,'Find the missing one: VU : YX :: WV : ?',0,NULL,10,1,'2021-06-11 17:34:29','2021-06-11 17:34:29'),
(464,3,2,3,'A, B, C, D, E, F, G and H are sitting around circle and are facing the center.\na. A is second to the right of E who is neighbor of C and G\nb. D is not neighbor of A\nc. G is neighbor of F\nd. D is between H and F\nAnswer the following questions based on this given data. Find the person who sits immediate right of D?',0,NULL,10,1,'2021-06-11 17:35:46','2021-06-11 17:35:46'),
(465,3,2,3,'Find the odd one out.',0,NULL,10,1,'2021-06-11 17:36:49','2021-06-11 17:36:49'),
(466,3,2,3,'If train is called bus, bus is called tractor, tractor is called car, car is called scooter, scooter is called bicycle, bicycle is called moped, which is used to plough a field?',0,NULL,10,1,'2021-06-11 17:37:56','2021-06-11 17:37:56'),
(467,3,2,3,'If CONTRIBUTE is written as ETBUIRNTOC, which letter will be in the sixth place when counted from the left if POPULARISE is written in that code?',0,NULL,10,1,'2021-06-11 17:38:58','2021-06-11 17:38:58'),
(468,3,2,2,'Complete the analogy\nrotation : earth :: _____ : top',0,NULL,10,1,'2021-06-11 17:39:41','2021-06-11 17:39:41'),
(469,3,2,3,'If in a certain language, ITNIETAM is the code for INTIMATE, which word has the code TREVNIETARBI?',0,NULL,10,1,'2021-06-11 17:40:28','2021-06-11 17:40:28'),
(470,3,2,3,'Three of the following are alike in a certain way and so form a group. Which of this do not belong to the group?',0,NULL,10,1,'2021-06-11 17:41:23','2021-06-11 17:41:23'),
(471,3,2,2,'Complete the analogy\n_____ : bedrock :: cement : foundation',0,NULL,10,1,'2021-06-11 17:41:51','2021-06-11 17:41:51'),
(472,3,2,2,'Complete the analogy\nmouse : _____ :: flash : camera',0,NULL,10,1,'2021-06-11 17:42:58','2021-06-11 17:42:58'),
(473,3,2,3,'In a class of some students standing in a straight line , the position of Pablo is 11th from left end and 41th from right end. How many students are there in the class?',0,NULL,10,1,'2021-06-11 17:43:17','2021-06-11 17:43:17'),
(474,3,2,2,'Complete the analogy\ncushion : sofa :: shelf : _____',0,NULL,10,1,'2021-06-11 17:44:16','2021-06-11 17:44:16'),
(475,3,2,3,'T, R, P, N, L, ?, ?',0,NULL,10,1,'2021-06-11 17:44:33','2021-06-11 17:44:33'),
(476,3,2,2,'Complete the analogy\n_____ : play :: sing : anthem',0,NULL,10,1,'2021-06-11 17:45:26','2021-06-11 17:45:26'),
(477,3,2,3,'Six players K, M, G, D, L and T are sitting in a circular table facing the center. M is to the left of K . D is between G and T. L is between G and M. And M is diagonally opposite to D. Who sits diagonally opposite to L?',0,NULL,10,1,'2021-06-11 17:45:35','2021-06-11 17:45:35'),
(478,3,2,2,'Complete the analogy\nmoisten : _____ :: cool : freeze',0,NULL,10,1,'2021-06-11 17:46:26','2021-06-11 17:46:26'),
(479,3,2,3,'Find the odd one out.',0,NULL,10,1,'2021-06-11 17:46:31','2021-06-11 17:46:31'),
(480,3,2,2,'Complete the analogy\nstars : astronomy :: _____ : history',0,NULL,10,1,'2021-06-11 17:47:43','2021-06-11 17:47:43'),
(481,3,2,3,'Nine friends L, M, N, O, P, Q, R, S and T are sitting around a circle facing the center. T sits 5th to the right of R. N is not an immediate neighbor of either R of T. M sits between S and P. N sits 4th to the left of P. O sits 2nd to the right of Q. S is not an immediate neighbor of T. If all the nine friends are made to sit alphabetically in the clockwise direction starting from L, positions of how many will remain unchanged (excluding L)?',0,NULL,10,1,'2021-06-11 17:47:51','2021-06-11 17:47:51'),
(482,3,2,2,'Complete the analogy\nrook : chess :: _____ : badminton',0,NULL,10,1,'2021-06-11 17:48:44','2021-06-11 17:48:44'),
(483,3,2,3,'Find the missing one: DF : EG :: EG : ?',0,NULL,10,1,'2021-06-11 17:49:08','2021-06-11 17:49:08'),
(484,3,2,3,'P, Q, R, S, T, V, W and Z are sitting around a circle facing at the center. R is fourth to the left of P who is second to the right of S. V is fourth to the right of S. Q is fourth to the left of W who is not an immediate neighbor of P or S. Z is not an immediate neighbor of R.',0,NULL,10,1,'2021-06-11 17:50:03','2021-06-11 17:50:03'),
(485,3,2,2,'Complete the analogy\nAesop : fable :: Homer : _____',0,NULL,10,1,'2021-06-11 17:50:41','2021-06-11 17:50:41'),
(486,3,2,3,'Find the missing one: RO : PM :: PM : ?',0,NULL,10,1,'2021-06-11 17:50:57','2021-06-11 17:50:57'),
(487,3,2,2,'Complete the analogy\nvolume : _____ :: stanza : poem',0,NULL,10,1,'2021-06-11 17:51:52','2021-06-11 17:51:52'),
(488,3,2,3,'Find the missing one: WY : XZ :: NP : ?',0,NULL,10,1,'2021-06-11 17:52:04','2021-06-11 17:52:04'),
(490,3,2,2,'Complete the analogy\npharaoh : dynasty :: _____ : democracy',0,NULL,10,1,'2021-06-11 17:53:06','2021-06-11 17:53:06'),
(491,3,2,3,'Five beautiful ladies are setting in a row. S is sitting next to P but not T. K is sitting next to R who is sitting on the extreme left and T is not sitting next to K. Who are sitting adjacent to S?',0,NULL,10,1,'2021-06-11 17:53:21','2021-06-11 17:53:21'),
(492,3,2,2,'Complete the analogy\nlawless : order :: captive : _____',0,NULL,10,1,'2021-06-11 17:55:18','2021-06-11 17:55:18'),
(493,3,2,2,'Complete the analogy\nribbon : _____ :: icing : cake',0,NULL,10,1,'2021-06-11 17:56:55','2021-06-11 17:56:55'),
(494,3,2,3,'Ever since the gun’s invention it has been changing the world in many different ways. Many of the developments in gun design have been brought about by man’s desire to protect himself, and the challenge of inventing bigger and more accurate weapons. Each time there has been a major innovation in the development of the gun, there has been a profound effect on the world. The gun helped in the exploration of the world; it has also helped in the development of society as we know it.\n\nQuestion: The gun was invented because the human race needs to protect themselves.',0,NULL,10,1,'2021-06-11 17:58:33','2021-06-11 17:58:33'),
(495,3,2,2,'Some trees are branches.\nSome branches are seeds.\nI.	 Some trees are not seeds.\nII.	 Some seeds are not branches.',0,NULL,10,1,'2021-06-11 17:58:52','2021-06-11 17:58:52'),
(496,3,2,3,'Ever since the gun’s invention it has been changing the world in many different ways. Many of the developments in gun design have been brought about by man’s desire to protect himself, and the challenge of inventing bigger and more accurate weapons. Each time there has been a major innovation in the development of the gun, there has been a profound effect on the world. The gun helped in the exploration of the world; it has also helped in the development of society as we know it.\n\nQuestion: Guns are the reason our society is the way it is today.',0,NULL,10,1,'2021-06-11 17:59:49','2021-06-11 17:59:49'),
(497,3,2,3,'Ever since the gun’s invention it has been changing the world in many different ways. Many of the developments in gun design have been brought about by man’s desire to protect himself, and the challenge of inventing bigger and more accurate weapons. Each time there has been a major innovation in the development of the gun, there has been a profound effect on the world. The gun helped in the exploration of the world; it has also helped in the development of society as we know it.\n\nQuestion: Financial incentives had no part to play in the development of the gun.',0,NULL,10,1,'2021-06-11 18:01:16','2021-06-11 18:01:16'),
(498,3,2,2,'52.	All chickens are birds.\nSome chickens are hens.\nFemale birds lay eggs.\nIf the first statement are facts, which of the following statements must also be a fact?\nI.	All birds lay eggs.\nII.	Hens are birds.\nIII.	Some chickens are not hens',0,NULL,10,1,'2021-06-11 18:02:03','2021-06-11 18:02:03'),
(499,3,2,3,'Being socially responsible is acting ethically and showing integrity. It directly affects our quality of life through such issues as human rights, working conditions, the environment, and corruption. It has traditionally been the sole responsibility of governments to police unethical behavior. However, the public have realized the influence of corporations and, over the last ten years, the level of voluntary corporate social responsibility initiatives that dictate the actions of corporations has increased.\n\nQuestion: The ethical actions of corporations have changed over the last ten years.',0,NULL,10,1,'2021-06-11 18:02:31','2021-06-11 18:02:31'),
(500,3,2,2,'Among five (5) people A, B, C, D, and E having different heights, who is the tallest ?\nI.	C is taller than only one person. Only 1 people is taller than only E. A is not the shortest.\nII.	C is shorter than 3 persons. Only one person is taller than E. A is neither the taller nor the shortest in the group. B is the shortest in the group.',0,NULL,10,1,'2021-06-11 18:03:26','2021-06-11 18:03:26'),
(501,3,2,3,'Being socially responsible is acting ethically and showing integrity. It directly affects our quality of life through such issues as human rights, working conditions, the environment, and corruption. It has traditionally been the sole responsibility of governments to police unethical behavior. However, the public have realized the influence of corporations and, over the last ten years, the level of voluntary corporate social responsibility initiatives that dictate the actions of corporations has increased.\n\nQuestion: Corporations can influence the public’s quality of life.',0,NULL,10,1,'2021-06-11 18:03:47','2021-06-11 18:03:47'),
(502,3,2,3,'Being socially responsible is acting ethically and showing integrity. It directly affects our quality of life through such issues as human rights, working conditions, the environment, and corruption. It has traditionally been the sole responsibility of governments to police unethical behavior. However, the public have realized the influence of corporations and, over the last ten years, the level of voluntary corporate social responsibility initiatives that dictate the actions of corporations has increased.\n\nQuestion: Traditionally, the government have relied upon only the large corporations to help drive corporate social responsibility, whilst they concentrated on the smaller corporations.',0,NULL,10,1,'2021-06-11 18:04:54','2021-06-11 18:04:54'),
(503,3,2,2,'It is reported that though Vitamin E present in fresh fruits and vegetables is beneficial for human body, capsule Vitamin E does not have the same effect on human body.\nI.	The sale of capsule Vitamin E should be banned.\nII.	People should be encouraged to take fresh fruits and vegetables to meet the body\'s requirement of Vitamin E.',0,NULL,10,1,'2021-06-11 18:05:01','2021-06-11 18:07:11'),
(504,3,2,3,'A well-nourished child can be more likely to be a studious one. But food has been seen as a cost to be cut in times of austerity, rather than an ingredient of good schooling. That may now be changing: as the government worries about obesity – which is fast rising among children- and urges everyone to eat less salt, fat and sugar, and more fruit and vegetables, the deficiency and unhealthiness of most school meals is striking. But cash constraints make change difficult.\n\nQuestion: Children who eat healthily will perform better in exams.',0,NULL,10,1,'2021-06-11 18:05:58','2021-06-11 18:05:58'),
(505,3,2,2,'Some birds are goats.\nSome goats are horses.\nSome horses are lions.\nSome lions are tigers.\nI.	Some tigers are goats.\nII.	No tiger is goat.\nIII.	Some lions are birds.\nIV.	No lion is bird.',0,NULL,10,1,'2021-06-11 18:06:49','2021-06-11 18:06:49'),
(506,3,2,3,'A well-nourished child can be more likely to be a studious one. But food has been seen as a cost to be cut in times of austerity, rather than an ingredient of good schooling. That may now be changing: as the government worries about obesity – which is fast rising among children- and urges everyone to eat less salt, fat and sugar, and more fruit and vegetables, the deficiency and unhealthiness of most school meals is striking. But cash constraints make change difficult.\n\nQuestion: The number of obese children used to be less than it is now.',0,NULL,10,1,'2021-06-11 18:07:00','2021-06-11 18:07:00'),
(507,3,2,3,'A well-nourished child can be more likely to be a studious one. But food has been seen as a cost to be cut in times of austerity, rather than an ingredient of good schooling. That may now be changing: as the government worries about obesity – which is fast rising among children- and urges everyone to eat less salt, fat and sugar, and more fruit and vegetables, the deficiency and unhealthiness of most school meals is striking. But cash constraints make change difficult.\n\nThe government is apathetic about obesity.',0,NULL,10,1,'2021-06-11 18:08:13','2021-06-11 18:08:13'),
(508,3,2,2,'Who is the tallest among A, B, C, D and E?\nI.	C is taller than B but not as tall as E.\nII.	A is not the shortest.\nIII.	 A is taller than only D.',0,NULL,10,1,'2021-06-11 18:08:36','2021-06-11 18:08:36'),
(509,3,2,3,'The first problem with financial statements is that they are in the past; however detailed, they provide just a snap-shot of the business at one moment in time. There is also a lack of detail in financial statements, giving little use in the running of a business. Financial statements are provided for legal reasons to meet with accounting regulations and are used mainly by City analysts who compute share prices and give guidance to shareholders. Accounts often have hidden information and may also be inconsistent; it is difficult to compare different companies’ accounts, despite there being standards, as there is much leeway in the standards.\n\nQuestion: Financial statements are useful for businesses to understand their financial activities.',0,NULL,10,1,'2021-06-11 18:09:17','2021-06-11 18:09:17'),
(510,3,2,2,'Statement: A > B > C and D > = E. \nI.	Conclusion: C = E\nII.	Conclusion: A > = E',0,NULL,10,1,'2021-06-11 18:31:43','2021-06-11 18:31:43'),
(511,3,2,2,'Wind is an inexhaustible source of energy and an aero-generator can convert it into electricity. Though not much has been done in this field, the survey shows that there is vast potential for developing wind as alternative source of energy.\nI.	Conclusion: Energy by wind is comparatively newly emerging field.\nII.	The energy crisis can be dealt by exploring more in the field of aero-generation.',0,NULL,10,1,'2021-06-11 18:34:07','2021-06-11 18:34:07'),
(512,3,2,2,'Givheart left for Jimenez on Tuesday by bus to attend a function to be held on Friday at his uncle\'s house in Jimenez.\nI.	Assumption: Givheart may reach Jimenez on Wednesday.\nII.	Assumption: Givheart may reach Jimenez before Friday.',0,NULL,10,1,'2021-06-11 18:37:54','2021-06-11 18:37:54'),
(513,3,2,2,'Beware of dogs, our dogs do not bark, but they are trained to distinguish between genuine guests and intruders.\nI.	Assumption: Barking dogs bite rarely.\nII.	Assumption: Our dogs could be dangerous for intruders.',0,NULL,10,1,'2021-06-11 18:40:49','2021-06-11 18:40:49'),
(514,3,2,2,'All the trucks are flies. Some scooters are flies.\nI.	Conclusion: All the trucks are scooters.\nII.	Conclusion: Some scooters are trucks.',0,NULL,10,1,'2021-06-11 18:42:16','2021-06-11 18:42:16'),
(515,3,2,2,'Among A, B, C, D, and E each securing different marks in an examination, whose position is last among them.\nI.	D has secured less marks than only C and E.\nII.	B has secured more marks than A.',0,NULL,10,1,'2021-06-11 18:43:45','2021-06-11 18:43:45'),
(516,3,2,2,'The civic authority has advised the residents in the area to use mosquito repellents or sleep inside nets as large number of people are suffering from malaria.\nI.	Assumption: Local residents have enough money to arrange for the repellents or nets.\nII.	Assumption: People may ignore and continue to get mosquito bites as they have other pressing needs.',0,NULL,10,1,'2021-06-11 18:47:07','2021-06-11 18:47:07'),
(517,3,2,2,'Company XYZ has marketed the product. Go ahead; purchase it if price and quality are your considerations.\nI.	Conclusion: The product must be good in quality.\nII.	Conclusion: The price of the product must be reasonable.',0,NULL,10,1,'2021-06-11 18:50:02','2021-06-11 18:50:02'),
(518,3,2,2,'A bird in hand is worth two in the bush.\nI.	Conclusion: We should be content with what we have.\nII.	We should not crave for what is not.',0,NULL,10,1,'2021-06-11 19:24:46','2021-06-11 19:24:46'),
(519,3,2,2,'Some wins are trophies.\nSome trophies are cups.\nNo cup is a prize.\nI.	Conclusion: At least some cups are wins.\nII.	Conclusion: All prizes being trophies is a possibility.',0,NULL,10,1,'2021-06-11 19:26:16','2021-06-11 19:26:16'),
(520,3,2,2,'Population increase coupled with depleting resources is going to be the scenario of many developing countries in days to come.\nI.	Conclusion: The population of developing countries will not continue to increase in future.\nII.	Conclusion: It will be very difficult for the governments of developing countries to provide its people decent quality of life.',0,NULL,10,1,'2021-06-11 19:27:35','2021-06-11 19:27:35'),
(521,3,2,2,'All rectangles are square.\nNo square is a rhombus.\nI.	Conclusion: All square is rectangle.\nII.	Conclusion: No rectangle is a rhombus.',0,NULL,10,1,'2021-06-11 19:28:50','2021-06-11 19:28:50'),
(523,3,1,3,'',1,'Hpse9fSAaB8kRDccEFcTfkpHGwo5tSgI60oeHQrB.jpg',10,1,'2021-06-11 20:58:56','2021-06-11 20:58:56'),
(524,3,1,3,'',1,'9hiwOrtB7NfMI2Ra7PuYq6zTBb6zDRFpEfge12st.jpg',10,1,'2021-06-11 20:59:44','2021-06-11 20:59:44'),
(525,3,1,3,'',1,'JH6vmRErcauJO3GAIclZY6Fd6Rq94iNmRzgk7hL1.jpg',10,1,'2021-06-11 21:00:31','2021-06-11 21:00:31'),
(526,3,1,3,'',1,'pEnUN3d7PM2zJxKb5gR410rDMHeeDJ9pYI0bJn97.jpg',10,1,'2021-06-11 21:01:34','2021-06-11 21:01:34'),
(527,3,1,3,'',1,'zJq6kwxMOSM9bXdNEFHdToTPy9stlM8cCNb9AWhD.jpg',10,1,'2021-06-11 21:03:29','2021-06-11 21:03:29'),
(528,3,1,3,'',1,'7SXHXxl9qr8n53xeVUg9Gkarxv0qUi8DHb3x4xm7.jpg',10,1,'2021-06-11 21:26:14','2021-06-11 21:26:14'),
(531,3,1,3,'',1,'npjbWuVpKSz8AbLIP19nwcSabYSrbkAhBU98lNmE.png',10,1,'2021-06-11 21:39:05','2021-06-11 21:39:05'),
(532,3,1,3,'',1,'ETfophGQD2V3GP86miVRzDD1es1qipwpXNAQkIQo.png',10,1,'2021-06-11 21:39:45','2021-06-11 21:39:45'),
(533,3,1,3,'',1,'foBu5eYHlFqw8tfMgMKKOhnMBW1hAKltV8ZAeOJ7.png',10,1,'2021-06-11 21:40:20','2021-06-11 21:40:20'),
(534,3,1,3,'',1,'ymcAbxVsMn4guEHVewzs4myUOQ5543o54mSp5Osi.png',10,1,'2021-06-11 22:21:56','2021-06-11 22:21:56'),
(536,3,1,3,'',1,'0O5ShYWq4mvfhaXjuuM4iErPKxXHXuRQ2ni3yYDr.png',10,1,'2021-06-11 22:31:24','2021-06-11 22:31:24'),
(537,3,1,3,'',1,'qsvXz2PTssfFH0C83zB3FS3nqZSHV0Ay39Hajrny.png',10,1,'2021-06-11 22:37:41','2021-06-11 22:37:41'),
(538,3,1,3,'',1,'eW2d97kkM2qRjbBBWENIwIFD3gwZpjUO6l0SKnYf.png',10,1,'2021-06-11 22:43:04','2021-06-11 22:43:04'),
(539,3,1,3,'',1,'5GFOY4Iogi9SQMreBeiUm4ICnqlhJcIOkE9d5A69.png',10,1,'2021-06-11 22:47:06','2021-06-11 22:47:06'),
(540,3,1,3,'',1,'6hQK8p5mES9lX7QIdVSreM9j50QrxMtudfX0npik.png',10,1,'2021-06-11 22:55:32','2021-06-11 22:55:32'),
(541,3,1,3,'',1,'TitETrKGoTV527XOcvOIpWceZMryuQighEvDjQ6f.jpg',10,1,'2021-06-12 02:08:01','2021-06-12 02:08:01'),
(542,3,1,3,'',1,'PFH3NNFMwVdz0y24sTVb36CTPafN49xs1OxhRMze.jpg',10,1,'2021-06-12 02:08:59','2021-06-12 02:08:59'),
(543,3,1,3,'',1,'i8Xbg0cWcbU0qGHWN5jP2sKCBuPjSuuFPmfdanh1.jpg',10,1,'2021-06-12 02:10:39','2021-06-12 02:10:39'),
(544,3,1,3,'',1,'vS99Kqk5NgEsczBuE1RGRyvW5FQCV8qtGvBUBGUD.jpg',10,1,'2021-06-12 02:11:26','2021-06-12 02:11:26'),
(545,3,1,3,'',1,'hVekrRrVGnXwuvKdz7V7QZK07psmgt4uNZCIFj2z.jpg',10,1,'2021-06-12 02:13:49','2021-06-12 02:13:49'),
(546,3,1,3,'',1,'hRNaoftwNpAVO9cPoJh3h3IgQqYszjkh10jQcF9M.jpg',10,1,'2021-06-12 02:16:24','2021-06-12 02:16:24'),
(547,3,1,3,'',1,'V2HEvdWkBeF3hEzk8BOTii224OMPktMQybncNtc6.jpg',10,1,'2021-06-12 02:19:49','2021-06-12 02:19:49'),
(548,3,1,3,'',1,'nwvYWZcs52IPB14A6KLHpxsumvlh7l1NAw9WoWrl.jpg',10,1,'2021-06-12 02:22:54','2021-06-12 02:22:54'),
(549,3,1,3,'',1,'u3DGD2iuwGKE4LXKCKtVri9p5MNla8hO0kUiVVIy.jpg',10,1,'2021-06-12 02:26:46','2021-06-12 02:26:46'),
(550,3,1,3,'',1,'ONI3VBDUoHVNQuSHNEH3jHlNB1CdO9vMs3xXTqYv.jpg',10,1,'2021-06-12 02:29:26','2021-06-12 02:29:26'),
(551,3,1,3,'',1,'29kFg622XngBNTlMvfLZWdIdg0PYY31999pOua8q.jpg',10,1,'2021-06-12 02:31:09','2021-06-12 02:31:09'),
(552,3,1,3,'',1,'d955IFcR1Fcgvlrwb0sXh5eF8tavf4dlTRhCEPAy.jpg',10,1,'2021-06-12 02:32:45','2021-06-12 02:32:45'),
(554,3,4,3,'Four cubes of ice with an edge 4 cm each are left to melt in a cylindrical glass with a radius of 6 cm. How high will the water rise when they have melted?',0,NULL,10,1,'2021-06-13 09:49:59','2021-06-13 09:49:59'),
(555,3,4,3,'The dome of a cathedral has a hemispherical form with a radius of 50 m. If the restoration costs $300 per m², what is the total cost of the restoration?',0,NULL,10,1,'2021-06-13 09:51:07','2021-06-13 09:51:07'),
(556,3,4,3,'How many square tiles (20 cm x 20 cm) are needed to coat the sides and base of a pool which is 10 m long, 6 meters wide and 3 m deep?',0,NULL,10,1,'2021-06-13 09:53:15','2021-06-13 09:53:15'),
(557,3,4,3,'A group committed to quality television has been concerned about a new talk show. For two weeks, they decided to count the number of words that must be “bleeped” as too obscene for television and the number of physical altercations. They hope that after recording this data that they will be able to argue that the show is inappropriate for television particularly during the day. The data for number of words censored is provided. 342, 267, 321, 157, 33, 349, 254, 166, 132, 289. What will be the variance of the given data?',0,NULL,10,1,'2021-06-13 09:54:24','2021-06-13 09:54:24'),
(558,3,4,3,'On an exam, two students scored 60, five students scored 90, four students scored 75, and two students scored 81. If the answer is 90, what is being asked in the question (mean, median, mode, or range)?',0,NULL,10,1,'2021-06-13 09:55:11','2021-06-13 09:55:11'),
(559,3,4,2,'Which of the following is a polynomial function?',0,NULL,10,1,'2021-06-14 06:01:41','2021-06-14 06:01:41'),
(560,3,4,2,'',1,'QzvEczzym3LURLD9WpYjE4atPZP0sOnaywAPDA2Y.png',10,1,'2021-06-14 06:08:05','2021-06-14 06:08:05'),
(561,3,4,2,'',1,'nexrN93X4O2EKA99JhxnmuGvs7CltYSPZC3Vuiwd.png',10,1,'2021-06-14 06:20:34','2021-06-14 06:20:34'),
(562,3,4,2,'which of the following shows a logarithmic function?',0,NULL,10,1,'2021-06-14 06:41:46','2021-06-14 06:41:46'),
(563,3,4,2,'',1,'FA06xfD3oROFPmc4c8h7ttzSDtcxbreWcVMpPNwp.png',10,1,'2021-06-14 06:54:31','2021-06-14 06:54:31'),
(564,3,4,2,'',1,'5bNU5EkrtaA7Cx4KiV2itxAGf8FINbyx3jm3Ro5H.png',10,1,'2021-06-14 06:56:21','2021-06-14 06:56:21'),
(565,3,4,2,'',1,'s3keUtSVjHdrjB14r6mETTZkUoNVoWUUqeXzW9tP.png',10,1,'2021-06-14 06:57:48','2021-06-14 06:57:48'),
(566,3,4,2,'',1,'Ehpv3db7rAtANiMMFNHVYfRvQagc8eEVxODsAnD0.png',10,1,'2021-06-14 06:58:40','2021-06-14 06:58:40'),
(567,3,4,2,'',1,'04LXTwPWUXlvODByfA4fJ4MwKUftyrHoTKKXm8SJ.png',10,1,'2021-06-14 07:00:52','2021-06-14 07:00:52'),
(568,3,1,2,'',1,'bf3CA3gpidy7fyRUxB49xxatsGtDDRtLWnno2TO9.png',10,1,'2021-06-14 07:14:11','2021-06-14 07:14:11'),
(569,3,4,2,'',1,'XbOuqI9TEhj1inbY5xCb5cdtYC8FH2GJlscOsWDN.png',10,1,'2021-06-14 07:15:44','2021-06-14 07:15:44'),
(571,3,4,2,'',1,'1VyecaWpVFgQjyVdOMAWyLiCfvZSddDpMudZLBQ9.png',10,1,'2021-06-14 07:17:51','2021-06-14 07:17:51'),
(572,3,4,2,'',1,'djdM1mXalWdorG6mX7d8PworqybGBvikPt0ewGRg.png',10,1,'2021-06-14 07:19:33','2021-06-14 07:19:33'),
(573,3,4,2,'',1,'Zqub2k9bQCunLTcGR02lWPLk6vusTcKdGKMd9p0Z.png',10,1,'2021-06-14 07:20:37','2021-06-14 07:20:37'),
(574,3,4,2,'',1,'4dUSjFptkbZvnlPpk3vmW7RHSEmrAG0zcpbO31rZ.png',10,1,'2021-06-14 07:21:50','2021-06-14 07:21:50'),
(580,3,4,2,'Which of the following is not a polynomial function?',0,NULL,10,1,'2021-06-14 08:52:18','2021-06-14 08:52:18'),
(581,3,4,2,'',1,'gfgNwzW8mVa81HeeWSPBorz7XfHBOnExHrNwVzwY.png',10,1,'2021-06-14 08:53:20','2021-06-14 08:53:20'),
(582,3,4,2,'',1,'A46vEGT0VFW06jCAsik50jrFca1pgi38ZsQ0rOWE.png',10,1,'2021-06-14 08:54:32','2021-06-14 08:54:32'),
(583,3,4,2,'Which of the following shows an exponential function?',0,NULL,10,1,'2021-06-14 08:55:35','2021-06-14 08:55:35'),
(584,3,4,2,'',1,'ydymUbYUlzVRSoLkQaJLsqMAyLLZXeHJPuDCSV3a.png',10,1,'2021-06-14 08:56:32','2021-06-14 08:56:32'),
(585,3,4,2,'',1,'cDWv3CwChtSfphP6ttggrRCa8n12JEGJv5bggCQq.png',10,1,'2021-06-14 08:57:57','2021-06-14 08:57:57'),
(586,3,4,2,'',1,'gm9jooW1sh4GXVkVAQeuDhtE6wppGSrfoDkYgX8E.png',10,1,'2021-06-14 08:59:04','2021-06-14 08:59:04'),
(587,3,4,2,'',1,'gTHWP6qYJK6VY6H7wMSrv8fBP6WqEAUi6ghDWhvU.png',10,1,'2021-06-14 08:59:49','2021-06-14 08:59:49'),
(588,3,4,2,'',1,'C8c2VW2iM6MAVcdYdSuVkLADwV0zCZzdXPUg5jJG.png',10,1,'2021-06-14 09:00:50','2021-06-14 09:00:50'),
(589,3,4,2,'',1,'fAbML0oAsnHowzUbRDN25wJrNsTTYjGqRmeUCR8X.png',10,1,'2021-06-14 09:02:23','2021-06-14 09:02:23'),
(590,3,4,2,'',1,'jqXqIUzNJ1b49i17pwOmtNgDNzTQzUV3seblUvZH.png',10,1,'2021-06-14 09:08:03','2021-06-14 09:08:03'),
(591,3,4,2,'',1,'yvk9lNXFsWofdzbzoF6tfsNkRSUA7SCyFUI4kHWp.png',10,1,'2021-06-14 09:11:13','2021-06-14 09:11:13'),
(592,3,4,2,'',1,'KJmwPIocAve98fSfMbsO4IJMol6MRpQcON5dgBcE.png',10,1,'2021-06-14 09:12:37','2021-06-14 09:12:37'),
(593,3,4,2,'',1,'NEf6tiF8LmQarWIuBGjh8eMrg3PrrsSMPSsPCRu4.png',10,1,'2021-06-14 09:14:06','2021-06-14 09:14:06'),
(594,3,4,2,'',1,'bqFTG8ZllpJGPwOkvups6LbyyHFNGyOi8fKEZt7Q.png',10,1,'2021-06-14 09:15:32','2021-06-14 09:15:32'),
(595,3,4,1,'2187, 729, 243, 81, 27, 9, ____?',0,NULL,10,1,'2021-06-14 09:31:02','2021-06-14 09:31:02'),
(596,3,4,1,'1, 4, 9, 16, 25, 36, 49, 64, ___ ?',0,NULL,10,1,'2021-06-14 09:31:41','2021-06-14 09:33:15'),
(597,3,4,1,'What is -25 + 16?',0,NULL,10,1,'2021-06-14 09:32:25','2021-06-14 09:32:25'),
(598,3,4,1,'What is 107 – (-17) ?',0,NULL,10,1,'2021-06-14 09:34:05','2021-06-14 09:34:05'),
(599,3,4,1,'(-9) (-22) = ____?',0,NULL,10,1,'2021-06-14 09:35:09','2021-06-14 09:35:09'),
(600,3,4,1,'(21) (-4) + (8) (-2) = ____?',0,NULL,10,1,'2021-06-14 09:36:09','2021-06-14 09:36:09'),
(601,3,4,1,'(-560) ÷ 7 = ___?',0,NULL,10,1,'2021-06-14 09:36:56','2021-06-14 09:36:56'),
(602,3,4,1,'What is the Least Common Denominator of 1/8, ¾, and 1/16?',0,NULL,10,1,'2021-06-14 09:53:41','2021-06-14 09:53:41'),
(603,3,4,2,'13 -21 34 -55 89 ___?',0,NULL,10,1,'2021-06-14 09:54:46','2021-06-14 09:54:46'),
(604,3,4,2,'AZ CX EV GT ____?',0,NULL,10,1,'2021-06-14 09:55:33','2021-06-14 09:55:33'),
(605,3,4,2,'A5 D25 G125 J625 M3125 ____?',0,NULL,10,1,'2021-06-14 09:56:49','2021-06-14 09:56:49'),
(606,3,4,2,'6/8 + 2 ½ + 4/12 is also the same as?',0,NULL,10,1,'2021-06-14 09:57:55','2021-06-14 09:57:55'),
(607,3,4,2,'2.12 is multiplied by 10 to the sixth power is?',0,NULL,10,1,'2021-06-14 09:59:08','2021-06-14 10:03:48'),
(608,3,4,2,'Find the value of x if y= 8 in the equation: 2x + 4y = 50',0,NULL,10,1,'2021-06-14 09:59:47','2021-06-14 09:59:47'),
(609,3,4,3,'Find three numbers such that the second is six less than three times the first, and the third is two more than two thirds the second. The sum of the three numbers is 172.',0,NULL,10,1,'2021-06-14 10:00:39','2021-06-14 10:05:20'),
(610,3,4,3,'Find three consecutive odd integers such that the difference of three times the third and two times the second is 20 less than five times the first.',0,NULL,10,1,'2021-06-14 10:02:05','2021-06-14 10:04:27'),
(611,3,4,3,'Nono is five years older than his twin sisters. The sum of the ages of the twins three years ago is equal to his age five years from now. How old will they be 12 years from now?',0,NULL,10,1,'2021-06-14 10:02:48','2021-06-14 10:04:22'),
(612,3,4,3,'Find the four consecutive even integers such that twice the third integer subtracted from five times the first equals 18 more than the sum of the second and the fourth odd integer.',0,NULL,10,1,'2021-06-14 10:03:31','2021-06-14 10:04:16'),
(613,3,4,1,'Which of the following length is the longest?',0,NULL,10,1,'2021-06-14 10:17:46','2021-06-14 10:17:46'),
(614,3,4,1,'Myko has 5 blue T-shirts and 7 orange T-shirts. If she picks one T-shirt at random, which is the probability that it will NOT be blue?',0,NULL,10,1,'2021-06-14 10:18:54','2021-06-14 10:18:54'),
(615,3,4,1,'Which of the following statements is ALWAYS TRUE?',0,NULL,10,1,'2021-06-14 10:21:17','2021-06-14 10:21:17'),
(616,3,4,1,'What are the prime factors of 273?',0,NULL,10,1,'2021-06-14 10:22:13','2021-06-14 10:22:13'),
(617,3,4,1,'Two coin are tossed, find the probability that the two heads are obtained.',0,NULL,10,1,'2021-06-14 10:23:16','2021-06-14 10:23:16'),
(618,3,4,1,'How many grams are in 3 1/5 kg?',0,NULL,10,1,'2021-06-14 10:24:18','2021-06-14 10:24:18'),
(619,3,4,1,'Which of the following describe/s a fraction?',0,NULL,10,1,'2021-06-14 10:25:16','2021-06-14 10:25:16'),
(620,3,4,1,'During the entrance examination, Lanlee finished the examination in ¾ of an hour. Vincent finished it in 4/5 of an hour. Nickolai finished it in 5/6 of an hour and Stefan finished in 7/10 of an hour. Who among them finished the test the fastest?',0,NULL,10,1,'2021-06-14 10:26:44','2021-06-14 10:26:44'),
(621,3,4,1,'The gardener put a fence around her rectangular garden. The length of the garden is 18 m while its width is 15 m. The posts in the fencing are placed 3 m apart. How many posts did the gardener use?',0,NULL,10,1,'2021-06-14 10:27:44','2021-06-14 10:27:44'),
(622,3,4,1,'Solve for x. 12 + [(-5)2-7 x 4/2)] = x',0,NULL,10,1,'2021-06-14 10:28:25','2021-06-14 10:28:25'),
(623,3,4,1,'Mrs. Mondragon borrowed 30,000 pesos from a bank. At the end of 6 months, she paid back 30,750 pesos. What was the yearly rate of interest?',0,NULL,10,1,'2021-06-14 10:40:26','2021-06-14 10:40:26'),
(624,3,4,1,'Find the value of N in 1, 10, 6, 8, 11, ___, ___, N.',0,NULL,10,1,'2021-06-14 10:41:05','2021-06-14 10:41:05'),
(625,3,4,1,'Which is the nearest to zero (0)?',0,NULL,10,1,'2021-06-14 10:42:31','2021-06-14 10:42:31'),
(626,3,4,1,'Solve for x in 3x + 5= 29.',0,NULL,10,1,'2021-06-14 10:45:25','2021-06-14 10:45:25'),
(627,3,4,1,'A figure is symmetric if it forms two equal parts of the other when folded. How many different cuts can be made with the square so that it will yield to symmetrical figures?',0,NULL,10,1,'2021-06-14 10:46:14','2021-06-14 10:46:14'),
(628,3,4,1,'What is best describes a tessellation?',0,NULL,10,1,'2021-06-14 10:48:19','2021-06-14 10:48:19'),
(629,3,4,1,'The sum of two numbers is 48 and their difference is 10. What is the product?',0,NULL,10,1,'2021-06-14 10:49:06','2021-06-14 10:49:06'),
(630,3,4,1,'Stvn sold t + 9 newspaper on Saturday. He sold t more newspapers on Sunday than on Saturday. If he sold a total of 57 newspapers, how many newspapers were sold on Saturday?',0,NULL,10,1,'2021-06-14 10:50:14','2021-06-14 10:50:14'),
(631,3,4,1,'Two dice are thrown simultaneously. What is the probability of getting two numbers whose product is even?',0,NULL,10,1,'2021-06-14 10:51:15','2021-06-14 10:51:15'),
(632,3,4,1,'m and n are two distinct numbers. M is 25 more than n. Their sum is 275. What are the values of m and n?',0,NULL,10,1,'2021-06-14 10:52:02','2021-06-14 10:52:02'),
(633,3,4,1,'Of the 60-item test in Mathematics, Arnon scored 48. Express the number of her correct answer as a fraction of the total number of items in the test in its simplest form.',0,NULL,10,1,'2021-06-14 10:52:46','2021-06-14 10:52:46'),
(634,3,4,1,'Which of the following has the greatest value?',0,NULL,10,1,'2021-06-14 10:53:21','2021-06-14 10:53:21'),
(635,3,4,1,'Mother is five times as old as Alonzo. Six years from now, Alonzo will be 1/3 as old as Mother. How old is Mother now?',0,NULL,10,1,'2021-06-14 10:54:10','2021-06-14 10:54:10'),
(636,3,4,1,'How many 0.01 are there in 0.001?',0,NULL,10,1,'2021-06-14 10:54:54','2021-06-14 10:54:54'),
(637,3,4,1,'What is the least common multiple of a, b, and c are prime numbers and a ≠ b ≠ c?',0,NULL,10,1,'2021-06-14 10:59:14','2021-06-14 10:59:14'),
(638,3,4,2,'9, 7, 16, 23, 39, 62, 101, ?',0,NULL,10,1,'2021-06-14 20:23:43','2021-06-14 20:23:43'),
(639,3,4,2,'1, 8, 27, 64, _____.',0,NULL,10,1,'2021-06-14 20:27:16','2021-06-14 20:27:16'),
(640,3,4,2,'5,10, 20, 40, ____.',0,NULL,10,1,'2021-06-14 20:28:03','2021-06-14 20:28:03'),
(641,3,4,2,'1, 1, 2, 3, 5, 8, 13, ____.',0,NULL,10,1,'2021-06-14 20:29:51','2021-06-14 20:29:51'),
(642,3,4,2,'125%, 100%, 80%, 64%, ______.',0,NULL,10,1,'2021-06-14 20:30:55','2021-06-14 20:30:55'),
(643,3,4,2,'Number Series: 15, 7.5, 7.5, 15, 60, _______',0,NULL,10,1,'2021-06-14 20:32:59','2021-06-14 20:32:59'),
(644,3,4,2,'11 is to 8.25 as 17 is to _____.',0,NULL,10,1,'2021-06-14 20:33:54','2021-06-14 20:33:54'),
(645,3,4,2,'0.75 is to ¾ as 0.8 is to ________',0,NULL,10,1,'2021-06-14 20:34:46','2021-06-14 20:34:46'),
(646,3,4,2,'0.25 is to 0.125 as to 1.25 is to ________',0,NULL,10,1,'2021-06-14 20:35:43','2021-06-14 20:35:43'),
(647,3,4,2,'14 is to 28 as 5 is to _______',0,NULL,10,1,'2021-06-14 20:36:27','2021-06-14 20:36:27'),
(648,3,4,2,'Given that r is an even number greater than 4, and c is an odd number greater than 5, which of the following is even?',0,NULL,10,1,'2021-06-14 20:38:54','2021-06-14 20:38:54'),
(649,3,4,2,'Which of the following statements is true?',0,NULL,10,1,'2021-06-14 20:39:43','2021-06-14 20:39:43'),
(650,3,4,2,'9,651,492 is divisible by: \n\nI. 2        II. 3        III. 4        IV. 5    V. 6      VI. 9',0,NULL,10,1,'2021-06-14 20:40:40','2021-06-14 20:40:40'),
(651,3,1,2,'Which of the following is divisible by 6?',0,NULL,10,1,'2021-06-14 20:41:42','2021-06-14 20:41:42'),
(652,3,5,3,'What is the Capital of Chile?',0,NULL,10,1,'2021-06-14 20:45:45','2021-06-14 20:45:45'),
(653,3,5,3,'What is the highest mountain in Britain?',0,NULL,10,1,'2021-06-14 20:47:08','2021-06-14 20:47:08'),
(654,3,4,2,'Which is divisible by 3 and 8?',0,NULL,10,1,'2021-06-14 20:48:40','2021-06-14 20:48:40'),
(655,3,5,3,'What is the smallest country in the world?',0,NULL,10,1,'2021-06-14 20:48:41','2021-06-14 20:48:41'),
(656,3,5,3,'Alberta is a province of which country?',0,NULL,10,1,'2021-06-14 20:50:03','2021-06-14 20:50:03'),
(657,3,4,2,'Which is not divisible by 6?',0,NULL,10,1,'2021-06-14 20:50:25','2021-06-14 20:50:25'),
(658,3,5,3,'How many countries still have the shilling as currency?',0,NULL,10,1,'2021-06-14 20:50:50','2021-06-14 20:50:50'),
(659,3,4,2,'',1,'AMTKEll1gnovebyve8seOkeyycGhlRpB33HaKT9h.png',10,1,'2021-06-14 20:59:35','2021-06-14 20:59:35'),
(660,3,4,2,'',1,'UvfWrxn4uK3d2b63beuafZDA6IViwEnPi7Of76i8.png',10,1,'2021-06-14 21:01:13','2021-06-14 21:01:13'),
(661,3,4,2,'',1,'8MOlZsQvjjtD0SbJ2IZeG6YgZi5iRqmA1NHlnZES.png',10,1,'2021-06-14 21:02:25','2021-06-14 21:02:25'),
(662,3,4,2,'The simplest expression for 25/100 is _________.',0,NULL,10,1,'2021-06-14 21:03:26','2021-06-14 21:03:26'),
(663,3,4,2,'40 is what part of 64?',0,NULL,10,1,'2021-06-14 21:04:19','2021-06-14 21:04:19'),
(664,3,4,2,'3/4  + 1/6 + 1/8 = ?',0,NULL,10,1,'2021-06-14 21:05:19','2021-06-14 21:05:19'),
(665,3,4,2,'What is the answer if 5/7 is subtracted from 7/8?',0,NULL,10,1,'2021-06-14 21:06:17','2021-06-14 21:06:17'),
(666,3,4,2,'If a=3, then 2/(1/7   +   1/a) = ?',0,NULL,10,1,'2021-06-14 21:07:02','2021-06-14 21:07:02'),
(667,3,4,2,'28,499 round to the nearest tens is?',0,NULL,10,1,'2021-06-14 21:07:49','2021-06-14 21:07:49'),
(668,3,5,3,'The formal inauguration of the Philippine Assembly was held at ____',0,NULL,10,1,'2021-06-14 21:09:30','2021-06-14 21:09:30'),
(669,3,5,3,'Bonifacio\'s formal declaration of the nullity of decisions reached at the Tejeros Convention was known as ________',0,NULL,10,1,'2021-06-14 21:11:15','2021-06-14 21:11:15'),
(670,3,5,3,'How many ships did Ferdinand Magellan use during his voyage that eventually found the Philippines?',0,NULL,10,1,'2021-06-14 21:18:28','2021-06-14 21:18:28'),
(671,3,5,3,'After the Negritos, what was the second group of people who migrated by sea to the Philippines 3,000 to 8,000 years ago',0,NULL,10,1,'2021-06-14 21:26:46','2021-06-14 21:26:46'),
(672,3,5,3,'Foreign influences were evident on most aspects of Filipino culture - the Philippine languages, for example. Now, from which Asian language do these words came from, \'alam\', \'hukom\', and \'salamat\'?',0,NULL,10,1,'2021-06-14 21:28:35','2021-06-14 21:28:35'),
(673,3,5,3,'Who commanded a large Chinese fleet, sent by Emperor Yung Lo of the Ming dynasty in 1402 to trade with the country at the same time establish colonies along the coast towns of the archipelago?',0,NULL,10,1,'2021-06-14 21:37:11','2021-06-14 21:37:11'),
(674,3,5,3,'Korean dramas have been a hit worldwide. Which Korean actor is the highest paid for every K-drama episode?',0,NULL,10,1,'2021-06-14 21:44:10','2021-06-14 21:44:10'),
(675,3,5,3,'In the Arteries of the Upper & Lower Extremity,\nThe right subclavian artery arises from ___________',0,NULL,10,1,'2021-06-14 21:50:14','2021-06-14 21:50:14'),
(676,3,5,3,'Which artery is the main source of blood for the arm?',0,NULL,10,1,'2021-06-14 21:51:41','2021-06-14 21:51:41'),
(677,3,5,3,'Which artery contributes mainly to supply of thumb and lateral side of index finger?',0,NULL,10,1,'2021-06-14 22:11:45','2021-06-14 22:11:45'),
(678,3,5,3,'Which clinical sign indicates ischaemia of forearm?',0,NULL,10,1,'2021-06-14 22:17:39','2021-06-14 22:17:39'),
(679,3,5,3,'Which of the following terms describes the motion of bending the forearm toward the body?',0,NULL,10,1,'2021-06-14 22:23:17','2021-06-14 22:23:17'),
(680,3,5,3,'Which of the following controls body temperature, sleep, and appetite?',0,NULL,10,1,'2021-06-14 22:26:36','2021-06-14 22:26:36'),
(681,3,5,3,'Which of the following is the large bone found superior to the patella and inferior to the ischium?',0,NULL,10,1,'2021-06-14 22:29:03','2021-06-14 22:29:03'),
(682,3,5,3,'Patients with which of the following diseases are treated with injections of vitamin B-12?',0,NULL,10,1,'2021-06-14 22:30:27','2021-06-14 22:30:27'),
(683,3,5,3,'Which of the following is a structural, fibrous protein found in the dermis?',0,NULL,10,1,'2021-06-14 22:31:42','2021-06-14 22:31:42'),
(684,3,5,3,'Which of the following is a disorder characterized by uncontrollable episodes of falling asleep during the day?',0,NULL,10,1,'2021-06-14 22:33:51','2021-06-14 22:33:51'),
(685,3,5,3,'Which of the following organs removes bilirubin from the blood, manufactures plasma proteins, and is involved with the production of prothrombin and fibrinogen?',0,NULL,10,1,'2021-06-14 22:37:19','2021-06-14 22:37:19'),
(686,3,5,3,'Acrophobia is to ________ as arachnophobia is to ________.',0,NULL,10,1,'2021-06-14 22:39:42','2021-06-14 22:39:42'),
(687,3,5,3,'Gender identity disorder is a controversial diagnosis because:',0,NULL,10,1,'2021-06-14 22:44:31','2021-06-14 22:44:31'),
(688,3,5,3,'Dissociative identity disorder is sometimes called:',0,NULL,10,1,'2021-06-14 22:46:07','2021-06-14 22:46:07'),
(689,3,5,3,'Schizophrenia is usually diagnosed in:',0,NULL,10,1,'2021-06-14 22:48:36','2021-06-14 22:48:36'),
(690,3,5,3,'Hallucinations are classed as a ________ symptom of schizophrenia.',0,NULL,10,1,'2021-06-14 22:50:15','2021-06-14 22:50:15'),
(691,3,4,2,'What is 14.3% as a fraction?',0,NULL,10,1,'2021-06-14 22:51:02','2021-06-14 22:51:02'),
(692,3,4,2,'What number when increased by 74 percent of itself will equal to 80?',0,NULL,10,1,'2021-06-14 22:52:27','2021-06-14 22:52:27'),
(693,3,4,2,'Two and one half percent of what number is 88?',0,NULL,10,1,'2021-06-14 22:53:18','2021-06-14 22:53:18'),
(694,3,4,2,'Margaux paid P400 for a blouse. If the blouse was sold at 20% discount, what was its original price?',0,NULL,10,1,'2021-06-14 22:54:32','2021-06-14 22:54:32'),
(695,3,4,2,'If 300 students filled form for entrance test and 280 appeared in test, out of which only 70% have passed the test, then the number of students who failed the test are',0,NULL,10,1,'2021-06-14 22:55:29','2021-06-14 22:55:29'),
(696,3,1,2,'A company makes a profit equal to 25% of its sales. The profit is shared equally among the 4 owners of the company. If the company generates sales of P2,000,000, how much money does each one of the owners get?',0,NULL,10,1,'2021-06-14 22:57:36','2021-06-14 22:57:36'),
(697,3,4,2,'A store owner makes a 25% profit by selling an item for P800.00. How much is his profit?',0,NULL,10,1,'2021-06-14 22:58:31','2021-06-18 15:31:21'),
(698,3,5,3,'This memory loss refers to a decreased ability to retain new information. This can affect your daily activities. It may also interfere with work and social activities because you might have challenges creating new memories.',0,NULL,10,1,'2021-06-14 22:59:03','2021-06-14 22:59:03'),
(699,3,4,2,'What is the ratio of ¼ to 3/5?',0,NULL,10,1,'2021-06-14 22:59:19','2021-06-14 22:59:19'),
(700,3,4,2,'Find the value of x, if 3 : 12 = x : 4.',0,NULL,10,1,'2021-06-14 22:59:55','2021-06-14 22:59:55'),
(701,3,4,2,'The ratio of the number of boys to the number of girls in a class is 2:3. If there are 40 students in the class. How many boys are there?',0,NULL,10,1,'2021-06-14 23:00:34','2021-06-14 23:00:34'),
(702,3,4,2,'The ratio of two sides of a parallelogram is 4:3. If its perimeter is 56cm, find the lengths of its sides.',0,NULL,10,1,'2021-06-14 23:02:15','2021-06-14 23:02:15'),
(703,3,4,2,'In a shipment of computers, 2/25 of the computers are defective. What is the ratio of defective to non-defective computers?',0,NULL,10,1,'2021-06-14 23:03:07','2021-06-14 23:03:07'),
(704,3,4,2,'Mark divides his day into leisure, sleep and work in the ratio 1:2:3. How many hours does he spend working?',0,NULL,10,1,'2021-06-14 23:03:55','2021-06-14 23:03:55'),
(705,3,4,2,'(25)^0 – (-2)^4 + (-3^4) – (-8)^2 = ?',0,NULL,10,1,'2021-06-14 23:04:57','2021-06-14 23:04:57'),
(706,3,4,2,'10 – 2 + 4 \\times 2 – (10 \\div 5 \\times 2) =v',0,NULL,10,1,'2021-06-14 23:05:47','2021-06-14 23:05:47'),
(707,3,4,2,'What is the average of 7/8 and 3/4 ?v',0,NULL,10,1,'2021-06-14 23:06:34','2021-06-14 23:06:34'),
(708,3,4,2,'',1,'fyOOuenpDQB1Go4dp1Qjx66g0bnty9TkbMzvnp1n.png',10,1,'2021-06-14 23:07:54','2021-06-14 23:07:54'),
(709,3,5,3,'Ethics is derived from the ________ word ________ which means',0,NULL,10,1,'2021-06-14 23:08:18','2021-06-14 23:08:18'),
(710,3,4,2,'The mean, median and mode of 5 numbers are equal. The four numbers are 7, 8, 10, 15. What is the 5th number?',0,NULL,10,1,'2021-06-14 23:08:36','2021-06-14 23:08:36'),
(711,3,4,2,'Benjie is thrice as old as his son Cedric. The sum of their ages is 64. How old is Benjie?',0,NULL,10,1,'2021-06-14 23:09:10','2021-06-14 23:09:10'),
(712,3,4,2,'Genzy’s dad is 5 times as old as Genzy and Genzy is twice as old as her sister Zymie. In two years, the sum of their ages will be 58. How old is Genzy now?',0,NULL,10,1,'2021-06-14 23:09:55','2021-06-14 23:09:55'),
(713,3,5,3,'In Ethics, he presented four strata of feelings that are constant',0,NULL,10,1,'2021-06-14 23:10:03','2021-06-14 23:10:03'),
(714,3,4,2,'Sarah is twice as old as Jimmy. Three years ago, the sum of their ages is 39. How old is Jimmy now?',0,NULL,10,1,'2021-06-14 23:10:35','2021-06-14 23:10:35'),
(715,3,4,2,'A car travels 120 miles at a speed of 40 miles per hour and makes a return trip at a speed of 60 miles per hour. What is its average speed, in miles per hour, of the police car',0,NULL,10,1,'2021-06-14 23:11:27','2021-06-14 23:11:27'),
(717,3,1,2,'How many minutes are there in one week?',0,NULL,10,1,'2021-06-14 23:12:38','2021-06-14 23:12:38'),
(718,3,4,2,'At 6:30 am, Jeany told Margarette that she found Blessy 15 and ¼ hours ago, at what time Jeany found Blessy?',0,NULL,10,1,'2021-06-14 23:13:40','2021-06-14 23:13:40'),
(719,3,5,3,'The metallurgical process in which a metal is obtained in a fused state is called __________.',0,NULL,10,1,'2021-06-14 23:14:08','2021-06-14 23:14:08'),
(720,3,5,3,'The oldest rocks in the earth\'s crust were once molten, and came from deep inside the earth. The molten rock, called magma, spewed out in volcanic eruptions during the earth;s early life and solidified into hard rock\'s called ____.',0,NULL,10,1,'2021-06-14 23:16:54','2021-06-14 23:16:54'),
(721,3,5,3,'The law which states that the amount of gas dissolved in a liquid is proportional to its partial pressure is ______',0,NULL,10,1,'2021-06-14 23:20:29','2021-06-14 23:20:29'),
(722,3,5,3,'The gas present in the stratosphere which filters out some of the sun\'s ultraviolet light and provides an effective shield against radiation damage to living things is ____.',0,NULL,10,1,'2021-06-14 23:24:31','2021-06-14 23:24:31'),
(723,3,5,3,'The most commonly used bleaching agent is ______.',0,NULL,10,1,'2021-06-14 23:27:45','2021-06-14 23:27:45'),
(724,3,5,3,'The heat required to raise the temperature of body by 1 K is called _____',0,NULL,10,1,'2021-06-14 23:29:18','2021-06-14 23:29:18'),
(725,3,5,3,'The metal that is used as a catalyst in the hydrogenation of oils is ____',0,NULL,10,1,'2021-06-14 23:30:53','2021-06-14 23:30:53'),
(726,3,5,3,'Radioactivity is a phenomenon of the spontaneous emission of _____',0,NULL,10,1,'2021-06-14 23:37:35','2021-06-14 23:37:35'),
(727,3,5,3,'Organic Substances which, in very small amounts, control growth and development called ____',0,NULL,10,1,'2021-06-14 23:38:46','2021-06-14 23:38:46'),
(728,3,5,3,'Our major food, fibres, spices, fruits and beverage crops are ______',0,NULL,10,1,'2021-06-14 23:41:59','2021-06-14 23:41:59'),
(729,3,5,3,'Radish is a ______',0,NULL,10,1,'2021-06-14 23:46:08','2021-06-14 23:46:08'),
(730,3,5,3,'Most common disease of poultry in India is ______',0,NULL,10,1,'2021-06-14 23:47:57','2021-06-14 23:47:57'),
(731,3,5,3,'Most abundant tissues of our body are',0,NULL,10,1,'2021-06-14 23:53:28','2021-06-14 23:53:28'),
(732,3,5,3,'Who invented the BALLPOINT PEN?',0,NULL,10,1,'2021-06-15 00:00:12','2021-06-15 00:00:12'),
(733,3,5,3,'What invention caused many deaths while testing it?',0,NULL,10,1,'2021-06-15 00:03:32','2021-06-15 00:03:32'),
(734,3,5,3,'Who invented Gunpowder?',0,NULL,10,1,'2021-06-15 00:05:00','2021-06-15 00:05:00'),
(735,3,5,3,'Who perfected GENETIC ENGINEERING?',0,NULL,10,1,'2021-06-15 00:06:06','2021-06-15 00:06:06'),
(736,3,5,3,'What furniture item was invented by California furniture designer Charles Prior Hall in 1968?',0,NULL,10,1,'2021-06-15 00:08:51','2021-06-15 00:08:51'),
(737,3,5,3,'Mumps is a disease caused by ______',0,NULL,10,1,'2021-06-15 00:12:16','2021-06-15 00:12:16'),
(738,3,5,3,'Plants are killed in winter by frost',0,NULL,10,1,'2021-06-15 00:13:28','2021-06-15 00:13:28'),
(739,3,5,3,'Plants that grow under average temperature and moisture are called',0,NULL,10,1,'2021-06-15 00:49:26','2021-06-15 00:49:26'),
(740,3,5,3,'Nuclear sizes are expressed in a unit named',0,NULL,10,1,'2021-06-15 17:26:39','2021-06-15 17:26:39'),
(741,3,5,3,'Metals are good conductors of electricity because?',0,NULL,10,1,'2021-06-15 17:28:18','2021-06-15 17:28:18'),
(742,3,5,3,'Pick out the scalar quantity',0,NULL,10,1,'2021-06-15 17:29:35','2021-06-15 17:29:35'),
(743,3,5,3,'RADAR is used for?',0,NULL,10,1,'2021-06-15 17:31:20','2021-06-15 17:31:20'),
(744,3,5,3,'Sound of frequency below 20 Hz is called _______',0,NULL,10,1,'2021-06-15 17:32:25','2021-06-15 17:32:25'),
(745,3,5,3,'In which decade with the first transatlantic radio broadcast occur?',0,NULL,10,1,'2021-06-15 17:35:28','2021-06-15 17:35:28'),
(746,3,5,3,'\'.MOV\' extension refers usually to what kind of file?',0,NULL,10,1,'2021-06-15 17:37:44','2021-06-15 17:37:44'),
(747,3,5,3,'Who co-founded Hotmail in 1996 and then sold the company to Microsoft?',0,NULL,10,1,'2021-06-15 17:39:54','2021-06-15 17:39:54'),
(748,3,5,3,'What do we call a collection of two or more computers that are located within a limited distance of each other and that are connected to each other directly or indirectly?',0,NULL,10,1,'2021-06-15 17:46:19','2021-06-15 17:46:19'),
(749,3,5,3,'Most modern TV\'s draw power even if turned off. The circuit the power is used in does what function?',0,NULL,10,1,'2021-06-15 17:47:57','2021-06-15 17:47:57'),
(750,3,5,3,'\'.MPG\' extension refers usually to what kind of file?',0,NULL,10,1,'2021-06-15 17:49:06','2021-06-15 17:49:06'),
(751,3,5,3,'Which of the following is not a chief organ of the United Nations Organisations?',0,NULL,10,1,'2021-06-15 17:50:35','2021-06-15 17:50:35'),
(752,3,5,3,'The headquarters of the UNESCO is at',0,NULL,10,1,'2021-06-15 17:52:59','2021-06-15 17:52:59'),
(753,3,5,3,'The five permanent members of UN security council are',0,NULL,10,1,'2021-06-15 17:58:18','2021-06-15 17:58:18'),
(755,3,5,3,'Out of 900 reported species of living gymnosperms, conifers are represented by about 500 species, About 2,50,000 species of angiosperms (flowering plants) have also been reported in the world. The vast and dominant woodlands in Europe, Asia, North America and mountains such as Himalayas are wooded with',0,NULL,10,1,'2021-06-16 09:19:39','2021-06-16 09:19:39'),
(756,3,5,3,'One of the following is not a function of bones.',0,NULL,10,1,'2021-06-16 09:21:11','2021-06-16 09:21:11'),
(757,3,5,3,'In what year was the first international cricket match held?',0,NULL,10,1,'2021-06-16 09:28:54','2021-06-16 09:29:12'),
(758,3,5,3,'The gas usually filled in the electric bulb is',0,NULL,10,1,'2021-06-16 09:31:50','2021-06-16 09:31:50'),
(759,3,5,3,'Washing soda is the common name for?',0,NULL,10,1,'2021-06-16 09:54:56','2021-06-16 09:54:56'),
(760,3,5,3,'The human body is made up of several chemical elements; the element present in the highest proportion (65%) in the body is?',0,NULL,10,1,'2021-06-16 15:52:05','2021-06-16 15:52:05'),
(761,3,3,1,'Oh, no way, I ______________ that man before!',0,NULL,10,1,'2021-06-16 23:04:30','2021-06-16 23:04:30'),
(762,3,3,1,'I’m fond of reading. I often ____ to library.',0,NULL,10,1,'2021-06-16 23:05:17','2021-06-16 23:05:17'),
(763,3,3,1,'I __________ Edemie since 2018.',0,NULL,10,1,'2021-06-16 23:06:00','2021-06-16 23:06:00'),
(764,3,3,1,'Wendy and Edemie _________ friends for many years.',0,NULL,10,1,'2021-06-16 23:06:44','2021-06-16 23:06:44'),
(765,3,3,1,'Don’t disturb Maria! She ___________ a letter at the moment.',0,NULL,10,1,'2021-06-16 23:07:30','2021-06-16 23:07:30'),
(766,3,3,1,'I woke up at 7 a.m., cleaned my room and __________ out.',0,NULL,10,1,'2021-06-16 23:08:20','2021-06-16 23:08:20'),
(767,3,3,1,'Edemie ________ Wendy two years ago.',0,NULL,10,1,'2021-06-16 23:08:58','2021-06-16 23:08:58'),
(768,3,3,1,'We ___________ (to go) to Siargao last year.',0,NULL,10,1,'2021-06-16 23:09:56','2021-06-16 23:09:56'),
(769,3,3,1,'My dog ________ with a toy when I called it.',0,NULL,10,1,'2021-06-16 23:10:37','2021-06-16 23:10:37'),
(770,3,3,1,'I put my jacket on and __________ a look in the mirror.',0,NULL,10,1,'2021-06-16 23:11:31','2021-06-16 23:11:31'),
(771,3,3,1,'Wait a minute, I ________ a notepad.',0,NULL,10,1,'2021-06-16 23:12:14','2021-06-16 23:12:14'),
(772,3,3,1,'Wendy _________ to the dentist next Tuesday. She has made this decision today.',0,NULL,10,1,'2021-06-16 23:22:26','2021-06-16 23:22:26'),
(773,3,3,1,'My parents chose a new refrigerator yesterday. Today, they __________ it.',0,NULL,10,1,'2021-06-16 23:57:05','2021-06-16 23:57:05'),
(774,3,3,1,'Well, I ___________ this pair of heels.',0,NULL,10,1,'2021-06-16 23:58:24','2021-06-16 23:58:24'),
(775,3,3,1,'She has to do so much today. She _____________ tired after work.',0,NULL,10,1,'2021-06-16 23:59:30','2021-06-16 23:59:30'),
(776,3,3,1,'The window __________2 hours ago.',0,NULL,10,1,'2021-06-17 00:01:00','2021-06-17 00:01:00'),
(777,3,3,1,'This task _____________ tomorrow.',0,NULL,10,1,'2021-06-17 00:01:57','2021-06-17 00:01:57'),
(778,3,3,1,'These bags ___________ in Philippines.',0,NULL,10,1,'2021-06-17 00:03:13','2021-06-17 00:03:13'),
(779,3,3,1,'Edemie, look! The mail ____________.',0,NULL,10,1,'2021-06-17 00:08:36','2021-06-17 00:08:36'),
(780,3,3,1,'The book “Nineteen Eighty Four” _____________ by George Orwell in 1949.',0,NULL,10,1,'2021-06-17 00:09:21','2021-06-17 00:09:21'),
(782,3,3,1,'I can’t hear you at all. ____________ you speak louder?',0,NULL,10,1,'2021-06-17 00:10:18','2021-06-17 00:10:18'),
(783,3,3,1,'Jam is very ill. She ___________ take medicines every day.',0,NULL,10,1,'2021-06-17 00:11:15','2021-06-17 00:11:15'),
(784,3,3,1,'Bernice say that she _________ read minds.',0,NULL,10,1,'2021-06-17 00:13:39','2021-06-17 00:13:39'),
(785,3,3,1,'I don’t have plans next week. I ____________  go to Siargao.',0,NULL,10,1,'2021-06-17 00:15:00','2021-06-17 00:15:00'),
(786,3,3,1,'My uniform is too dirty. I ________ clean it immediately.',0,NULL,10,1,'2021-06-17 00:15:45','2021-06-17 00:15:45'),
(787,3,3,1,'Wendy, could you ___________my dog for a couple of days?',0,NULL,10,1,'2021-06-17 00:16:56','2021-06-17 00:16:56'),
(788,3,3,1,'Jam is __________ in Christmas holiday.',0,NULL,10,1,'2021-06-17 00:17:39','2021-06-17 00:17:39'),
(789,3,3,1,'It’s a great pity that Nadine and James ____________',0,NULL,10,1,'2021-06-17 00:18:15','2021-06-17 00:18:30'),
(790,3,3,1,'Wow! You play scrabble very well, I think you should ______________ in the school competition.',0,NULL,10,1,'2021-06-17 00:19:20','2021-06-17 00:19:20'),
(791,3,3,1,'We are planning to __________ at 10 o’clock tomorrow.',0,NULL,10,1,'2021-06-17 00:21:30','2021-06-17 00:21:30'),
(792,3,3,1,'Wendy went to the market but she bought _____________.',0,NULL,10,1,'2021-06-17 01:22:22','2021-06-17 01:22:22'),
(793,3,3,1,'Juan said that he saw Edemie ________ in the supermarket.',0,NULL,10,1,'2021-06-17 01:23:18','2021-06-17 01:23:18'),
(794,3,2,1,'Is there _______ who can speak Chinese?',0,NULL,10,1,'2021-06-17 01:23:59','2021-06-17 01:23:59'),
(795,3,3,1,'\"Jam, if someone sends a message answer _________.\"',0,NULL,10,1,'2021-06-17 01:24:59','2021-06-17 01:24:59'),
(796,3,3,1,'They have done __________ work properly.',0,NULL,10,1,'2021-06-17 01:25:52','2021-06-17 01:25:52'),
(797,3,3,1,'Dan took some pictures of wonderful _________ clouds.',0,NULL,10,1,'2021-06-17 01:26:47','2021-06-17 01:26:47'),
(798,3,3,1,'Jam found a _____________ hamster.',0,NULL,10,1,'2021-06-17 01:27:41','2021-06-17 01:27:41'),
(799,3,3,1,'My little brother is being very _______ today!',0,NULL,10,1,'2021-06-17 01:28:17','2021-06-17 01:28:17'),
(800,3,3,1,'I wouldn’t trust him anymore. I think he’s ____________.',0,NULL,10,1,'2021-06-17 01:29:08','2021-06-17 01:29:08'),
(801,3,3,1,'Juan is always _________.',0,NULL,10,1,'2021-06-17 01:29:44','2021-06-17 01:29:44'),
(802,3,3,1,'James Reid was standing ________ to me.',0,NULL,10,1,'2021-06-17 01:30:35','2021-06-17 01:30:35'),
(803,3,3,1,'The car was moving very ________.',0,NULL,10,1,'2021-06-17 01:31:19','2021-06-17 01:31:19'),
(804,3,3,1,'That dress goes _______ with these heels.',0,NULL,10,1,'2021-06-17 01:32:02','2021-06-17 01:32:02'),
(805,3,3,1,'I’m not sure, but Jam is ________ in the campus.',0,NULL,10,1,'2021-06-17 01:32:40','2021-06-17 01:32:40'),
(806,3,3,1,'I ________ hope that she will be alright soon.',0,NULL,10,1,'2021-06-17 01:33:18','2021-06-17 01:33:18'),
(807,3,3,1,'Look! The plane is flying _____________ us.',0,NULL,10,1,'2021-06-17 01:34:02','2021-06-17 01:34:02'),
(808,3,3,1,'My sister Diane graduated ________ the university three years ago.',0,NULL,10,1,'2021-06-17 01:34:49','2021-06-17 01:34:49'),
(809,3,3,1,'I was sleeping __________ the lecture.',0,NULL,10,1,'2021-06-17 01:35:30','2021-06-17 01:35:30'),
(810,3,3,1,'Jam rejoiced _____ hearing the news.',0,NULL,10,1,'2021-06-17 01:36:12','2021-06-17 01:36:12'),
(811,3,3,1,'Nikko excels ______ playing lawn tennis.',0,NULL,10,1,'2021-06-17 01:37:03','2021-06-17 01:37:03'),
(812,3,3,2,'I\'m 20 and my brother is 23, so he\'s _______ me.',0,NULL,10,1,'2021-06-17 10:12:57','2021-06-17 10:12:57'),
(813,3,3,2,'If I __________ well in my exams, I ________ to university.',0,NULL,10,1,'2021-06-17 10:13:52','2021-06-17 10:13:52'),
(815,3,3,2,'She was so upset that she burst ________ tears.',0,NULL,10,1,'2021-06-17 10:16:34','2021-06-17 10:16:34'),
(816,3,3,2,'There __________ milk in the fridge.',0,NULL,10,1,'2021-06-17 10:17:25','2021-06-17 10:20:29'),
(817,3,3,2,'Criminals are people who are guilty of ________ the law.',0,NULL,10,1,'2021-06-17 10:18:22','2021-06-17 10:18:22'),
(818,3,3,2,'I promise I\'ll call you as soon as  _________',0,NULL,10,1,'2021-06-17 10:20:22','2021-06-17 10:20:22'),
(819,3,3,2,'I\'ve been working in here ______________ about the last two years.',0,NULL,10,1,'2021-06-17 10:21:07','2021-06-17 10:21:07'),
(820,3,3,2,'I\'m surprised you didn\'t get upset. If someone said that to me, ____________ really angry.',0,NULL,10,1,'2021-06-17 10:21:56','2021-06-17 10:21:56'),
(821,3,3,2,'Wendy went to be dearly because she was _____________.',0,NULL,10,1,'2021-06-17 10:22:43','2021-06-17 10:22:43'),
(822,3,3,2,'When I was a child, I never __________ about the future.',0,NULL,10,1,'2021-06-17 10:23:36','2021-06-17 10:23:36'),
(823,3,3,2,'The Math problem was really difficult and I just couldn\'t ________ the answer.',0,NULL,10,1,'2021-06-17 10:24:45','2021-06-17 10:24:45'),
(824,3,3,2,'_____________ worries me about society today is how completely we have come to depend on technology.',0,NULL,10,1,'2021-06-17 10:25:48','2021-06-17 10:25:48'),
(825,3,3,2,'The governments plans to __________ taxes on sales of luxury items.',0,NULL,10,1,'2021-06-17 10:26:36','2021-06-17 10:26:36'),
(826,3,3,2,'Jam ________ her arm on a hot iron.',0,NULL,10,1,'2021-06-17 10:27:19','2021-06-17 10:27:19'),
(827,3,3,2,'Tomorrow\'s a holiday, so we __________ go to work.',0,NULL,10,1,'2021-06-17 10:28:07','2021-06-17 10:28:07'),
(828,3,3,2,'Photographers and designers need to be very ______________.',0,NULL,10,1,'2021-06-17 10:29:20','2021-06-17 10:29:20'),
(829,3,3,2,'There ____________ a terrible accident if the pilot hadn\'t reacted so quickly.',0,NULL,10,1,'2021-06-17 10:30:15','2021-06-17 10:30:15'),
(830,3,3,2,'When I first moved to America, life in a different country was very strange, but now I\'m _________ here.',0,NULL,10,1,'2021-06-17 10:31:50','2021-06-17 10:31:50'),
(831,3,3,2,'I can\'t ____________ your hair, because I haven\'t got any scissors.',0,NULL,10,1,'2021-06-17 10:32:46','2021-06-17 10:32:46'),
(832,3,3,2,'I wish I _____________ have an exam tomorrow!',0,NULL,10,1,'2021-06-17 10:33:42','2021-06-17 10:33:42'),
(833,3,3,2,'__________ feeling fine? You don\'t look very well.',0,NULL,10,1,'2021-06-17 10:34:40','2021-06-17 10:34:40'),
(834,3,3,2,'In 1960s, computers were ___________ expensive that ordinary people couldn\'t afford them.',0,NULL,10,1,'2021-06-17 10:35:58','2021-06-17 10:35:58'),
(835,3,3,2,'Clar\'s very __________. He\'s never late, and he never forgets to do things.',0,NULL,10,1,'2021-06-17 10:36:45','2021-06-17 10:36:45'),
(836,3,3,2,'I usually ___________ swimming at least once a week.',0,NULL,10,1,'2021-06-17 10:37:38','2021-06-17 10:37:38'),
(837,3,3,2,'My brother ____________ getting a job in China.',0,NULL,10,1,'2021-06-17 10:38:30','2021-06-17 10:38:30'),
(838,3,3,2,'She is beautiful, ____________?',0,NULL,10,1,'2021-06-17 10:39:26','2021-06-17 10:39:26'),
(839,3,3,2,'Isn\'t it amazing, _________',0,NULL,10,1,'2021-06-17 10:40:09','2021-06-17 10:40:09'),
(840,3,3,2,'Don\'t you like me? ________.',0,NULL,10,1,'2021-06-17 10:41:01','2021-06-17 10:41:01'),
(841,3,3,2,'I can\'t hear you - it\'s ___________ noisy in here.',0,NULL,10,1,'2021-06-17 10:42:27','2021-06-17 10:42:27'),
(842,3,3,2,'Cats and dogs are usually kept as ______________.',0,NULL,10,1,'2021-06-17 10:43:14','2021-06-17 10:43:14'),
(843,3,3,2,'He\'s listening ________ the radio.',0,NULL,10,1,'2021-06-17 10:43:56','2021-06-17 10:43:56'),
(844,3,3,2,'I\'m looking __________ my hat: I can\'t find it anywhere.',0,NULL,10,1,'2021-06-17 10:44:47','2021-06-17 10:44:47'),
(845,3,3,2,'John _________ very hard.',0,NULL,10,1,'2021-06-17 10:45:32','2021-06-17 10:45:32'),
(846,3,3,2,'Kate hasn\'t got ________ friends.',0,NULL,10,1,'2021-06-17 10:46:08','2021-06-17 10:46:08'),
(847,3,3,2,'I have a lesson _________Tuesday.',0,NULL,10,1,'2021-06-17 10:46:54','2021-06-17 10:46:54'),
(848,3,3,2,'I\'m sorry I ________ see you yesterday.',0,NULL,10,1,'2021-06-17 10:47:51','2021-06-17 10:47:51'),
(849,3,3,2,'My dog is as fat _______ an elephant.',0,NULL,10,1,'2021-06-17 10:48:31','2021-06-17 10:48:31'),
(850,3,3,2,'____________ you at school yesterday?',0,NULL,10,1,'2021-06-17 10:49:11','2021-06-17 10:49:11'),
(851,3,3,2,'We stayed in a lovely villa _________the sea.',0,NULL,10,1,'2021-06-17 10:49:53','2021-06-17 10:49:53'),
(852,3,3,2,'Jam has just sent me ___________to arrange plans for this weekend.',0,NULL,10,1,'2021-06-17 10:51:03','2021-06-17 10:51:03'),
(853,3,3,2,'I have class ________.',0,NULL,10,1,'2021-06-17 10:51:52','2021-06-17 10:51:52'),
(854,3,3,2,'I haven\'t seen my cousin _________ over a year ago.',0,NULL,10,1,'2021-06-17 10:52:38','2021-06-17 10:52:38'),
(855,3,3,2,'She works for the Bank, _______?',0,NULL,10,1,'2021-06-17 10:53:29','2021-06-17 10:53:29'),
(856,3,3,2,'My mother asked me If I was hungry, but I said that I _________dinner.',0,NULL,10,1,'2021-06-17 10:54:40','2021-06-17 10:54:40'),
(858,3,3,2,'We were surprised that there ______ queues outside the cinema.',0,NULL,10,1,'2021-06-17 10:55:39','2021-06-17 10:55:39'),
(859,3,3,2,'You live upstairs from me, ________?',0,NULL,10,1,'2021-06-17 10:57:19','2021-06-17 10:57:19'),
(860,3,3,2,'Michelle ___________ for the Bank since last year.',0,NULL,10,1,'2021-06-17 10:58:08','2021-06-17 10:58:08'),
(861,3,3,2,'Have you made lunch______?',0,NULL,10,1,'2021-06-17 10:58:46','2021-06-17 10:58:46'),
(862,3,3,2,'What have I done with my wallet? I don\'t remember _________ it anywhere last night.',0,NULL,10,1,'2021-06-17 10:59:32','2021-06-17 10:59:32'),
(863,3,3,2,'Thanks for remembering my birthday, but you _________ bought me a present.',0,NULL,10,1,'2021-06-17 11:00:16','2021-06-17 11:00:16'),
(864,3,3,2,'You look tired. You ______ go to bed.',0,NULL,10,1,'2021-06-17 11:01:02','2021-06-17 11:01:02'),
(865,3,3,2,'They ______ last night, but I\'m not sure.',0,NULL,10,1,'2021-06-17 11:02:01','2021-06-17 11:02:01'),
(866,3,3,2,'I think the joke ________ very funny, because you\'re laughing a lot.',0,NULL,10,1,'2021-06-17 11:03:06','2021-06-17 11:03:06'),
(867,3,3,2,'I wish I ______paid more attention to my English teacher.',0,NULL,10,1,'2021-06-17 11:03:52','2021-06-17 11:03:52'),
(868,3,3,2,'He drove so fast _____ a mad man.',0,NULL,10,1,'2021-06-17 11:04:28','2021-06-17 11:04:28'),
(869,3,3,2,'I don\'t have ______ free time.',0,NULL,10,1,'2021-06-17 11:05:20','2021-06-17 11:05:20'),
(870,3,3,2,'_______ to the mall tomorrow?',0,NULL,10,1,'2021-06-17 11:06:04','2021-06-17 11:06:04'),
(871,3,3,2,'Sorry, but when you called I ______ a shower.',0,NULL,10,1,'2021-06-17 11:06:42','2021-06-17 11:06:42'),
(872,3,3,2,'__________ with me?',0,NULL,10,1,'2021-06-17 11:07:22','2021-06-17 11:07:22'),
(873,3,3,2,'I\'ll call you when I ________ home.',0,NULL,10,1,'2021-06-17 11:08:12','2021-06-17 11:08:12'),
(874,3,3,2,'I\'d like to go ______ in the park.',0,NULL,10,1,'2021-06-17 11:22:56','2021-06-17 11:22:56'),
(875,3,3,2,'She went on a business ______ to America.',0,NULL,10,1,'2021-06-17 11:23:40','2021-06-17 11:23:40'),
(876,3,3,2,'My sister and I don\'t _______ very well.',0,NULL,10,1,'2021-06-17 11:24:31','2021-06-17 11:24:31'),
(877,3,3,2,'If I _____ you, I wouldn\'t do it.',0,NULL,10,1,'2021-06-17 11:25:31','2021-06-17 11:25:31'),
(878,3,3,2,'If I had known that she was there, I _____ hello.',0,NULL,10,1,'2021-06-17 11:26:14','2021-06-17 11:26:14'),
(879,3,3,2,'Which of the following statement is grammatically correct?',0,NULL,10,1,'2021-06-17 11:28:09','2021-06-17 11:28:09'),
(880,3,3,2,'What is the best synonym for \"offensive\"?',0,NULL,10,1,'2021-06-17 11:28:54','2021-06-17 11:28:54'),
(881,3,3,2,'What is the best synonym for \"protest\"?',0,NULL,10,1,'2021-06-17 11:30:35','2021-06-17 11:30:35'),
(882,3,3,2,'What is the best synonym for \"ordinary\"?',0,NULL,10,1,'2021-06-17 11:31:31','2021-06-17 11:31:31'),
(883,3,3,2,'What is the best synonym for \"asylum\"?',0,NULL,10,1,'2021-06-17 11:33:54','2021-06-17 11:33:54'),
(884,3,3,2,'What is the best synonym for \"corridor\"?',0,NULL,10,1,'2021-06-17 11:35:15','2021-06-17 11:35:15'),
(885,3,3,2,'What is the best synonym for \"via\" (via facebook live)?',0,NULL,10,1,'2021-06-17 11:36:16','2021-06-17 11:36:16'),
(886,3,3,2,'What is the best synonym for \"fragile\"?',0,NULL,10,1,'2021-06-17 11:37:13','2021-06-17 11:37:13'),
(887,3,3,2,'What is the best synonym for \"tolerate\"?',0,NULL,10,1,'2021-06-17 11:38:13','2021-06-17 11:38:13'),
(888,3,3,2,'Mouse: _______ ; flash: camera',0,NULL,10,1,'2021-06-17 11:39:28','2021-06-17 11:39:28'),
(889,3,3,1,'Cushion: sofa ; shelf:_______',0,NULL,10,1,'2021-06-17 11:40:19','2021-06-17 11:40:19'),
(890,3,3,1,'________ : play ; sing : anthem',0,NULL,10,1,'2021-06-17 11:41:56','2021-06-17 11:41:56'),
(891,3,3,1,'Moisten: _______ ; cool: freeze',0,NULL,10,1,'2021-06-17 11:43:02','2021-06-17 11:43:02'),
(892,3,3,2,'________: wood ; file: nail',0,NULL,10,1,'2021-06-17 11:44:08','2021-06-17 11:44:08'),
(893,3,3,1,'Doze: sleep ; tiptoe: _______',0,NULL,10,1,'2021-06-17 11:45:12','2021-06-17 11:45:12'),
(894,3,3,2,'Pineapple: ______ ; orange: Florida',0,NULL,10,1,'2021-06-17 11:46:23','2021-06-17 11:46:23'),
(895,3,3,2,'Ribbon: ______ ; icing: cake',0,NULL,10,1,'2021-06-17 11:47:25','2021-06-17 11:47:25'),
(896,3,3,2,'Chatter: talk ; flutter: _________',0,NULL,10,1,'2021-06-17 11:48:46','2021-06-17 11:48:46'),
(897,3,3,1,'_________: money ; urn: ashes',0,NULL,10,1,'2021-06-17 11:50:13','2021-06-17 11:50:13'),
(898,3,3,1,'Cub: bear ; joey: ________',0,NULL,10,1,'2021-06-17 11:51:21','2021-06-17 11:51:21'),
(899,3,3,1,'Spoke: ________ ; word: sentence',0,NULL,10,1,'2021-06-17 11:52:18','2021-06-17 11:52:18'),
(900,3,3,1,'_______: poem ; fable: story',0,NULL,10,1,'2021-06-17 11:53:23','2021-06-17 11:53:23'),
(901,3,3,1,'pride: _______ ; calm: storm',0,NULL,10,1,'2021-06-17 11:54:21','2021-06-17 11:54:21'),
(902,3,3,1,'Epilogue: novel ; _________ : meal',0,NULL,10,1,'2021-06-17 11:55:40','2021-06-17 11:55:40'),
(903,3,3,2,'_______:peace ; lion : courage',0,NULL,10,1,'2021-06-17 11:57:19','2021-06-17 11:57:19'),
(904,3,3,1,'The book \"Florante at Laura\" was written by______.',0,NULL,10,1,'2021-06-17 11:59:29','2021-06-17 11:59:29'),
(905,3,3,1,'These are fictitious, they deal animals and imitate things that speak act like people.',0,NULL,10,1,'2021-06-17 12:01:11','2021-06-17 12:01:11'),
(907,3,3,1,'A figure of speech in which human attributes are given to something inanimate.',0,NULL,10,1,'2021-06-17 12:07:24','2021-06-17 12:07:24'),
(908,3,3,1,'A figure of speech in which exaggeration is used for the sake of revealing detail.',0,NULL,10,1,'2021-06-17 12:08:08','2021-06-17 12:08:08'),
(909,3,3,1,'How many acts are in Romeo and Juliet?',0,NULL,10,1,'2021-06-17 12:08:48','2021-06-17 12:08:48'),
(910,3,3,3,'Which of these plays is not considered to be one of Shakespeare\'s comedies?',0,NULL,10,1,'2021-06-17 12:09:58','2021-06-17 12:09:58'),
(911,3,3,1,'Don Quixote was written in which language?',0,NULL,10,1,'2021-06-17 12:11:01','2021-06-17 12:11:01'),
(912,3,3,1,'Who wrote the \"Iliad\"',0,NULL,10,1,'2021-06-17 12:11:40','2021-06-17 12:11:40'),
(913,3,3,3,'Select the word which nearly the same as the key word.  \"module\"',0,NULL,10,1,'2021-06-17 22:03:50','2021-06-18 11:20:38'),
(915,3,3,3,'Select the word which nearly the same as the key word.  \"convivial\"',0,NULL,10,1,'2021-06-17 22:05:36','2021-06-18 11:20:59'),
(916,3,3,3,'Select the word which nearly the same as the key word.  \"synthetic\"',0,NULL,10,1,'2021-06-17 22:06:16','2021-06-18 11:21:09'),
(917,3,3,3,'Select the word which nearly the same as the key word.  \"density\"',0,NULL,10,1,'2021-06-17 22:07:30','2021-06-18 11:21:22'),
(918,3,3,3,'Select the word which nearly the same as the key word.  \"tsunami\"',0,NULL,10,1,'2021-06-17 22:08:21','2021-06-18 11:21:32'),
(919,3,3,3,'Select the word which nearly the same as the key word.  \"bonafide\"',0,NULL,10,1,'2021-06-17 22:09:16','2021-06-18 11:21:45'),
(920,3,3,3,'Select the word which nearly the same as the key word.  \"prolific\"',0,NULL,10,1,'2021-06-17 22:10:12','2021-06-18 11:21:55'),
(922,3,3,3,'Select the word which nearly the same as the key word.  \"aggregate\"',0,NULL,10,1,'2021-06-17 22:11:22','2021-06-18 11:22:06'),
(923,3,3,3,'Select the word which nearly the same as the key word.  \"evolution\"',0,NULL,10,1,'2021-06-17 22:12:02','2021-06-18 11:22:22'),
(924,3,3,3,'Select the word which nearly the same as the key word.  \"improve\"\n\"',0,NULL,10,1,'2021-06-17 22:12:53','2021-06-18 11:22:36'),
(925,3,3,3,'poet :  poem',0,NULL,10,1,'2021-06-17 22:13:37','2021-06-17 22:13:37'),
(926,3,3,3,'fur :  rabbit',0,NULL,10,1,'2021-06-17 22:14:23','2021-06-17 22:14:23'),
(927,3,3,3,'flock  :  sheep',0,NULL,10,1,'2021-06-17 22:15:14','2021-06-17 22:15:14'),
(928,3,3,3,'sea  :  horse',0,NULL,10,1,'2021-06-17 22:16:21','2021-06-17 22:16:21'),
(929,3,3,3,'light  :  feather',0,NULL,10,1,'2021-06-17 22:17:03','2021-06-17 22:17:03'),
(930,3,3,3,'peel  :  orange',0,NULL,10,1,'2021-06-17 22:18:34','2021-06-17 22:18:34'),
(931,3,3,3,'animate  :  horse',0,NULL,10,1,'2021-06-17 22:19:20','2021-06-17 22:19:20'),
(932,3,3,3,'rebuke  :  insult',0,NULL,10,1,'2021-06-17 22:20:12','2021-06-17 22:20:12'),
(933,3,3,3,'referee  :  basketball',0,NULL,10,1,'2021-06-17 22:20:45','2021-06-17 22:20:45'),
(934,3,3,3,'tin  :  can',0,NULL,10,1,'2021-06-17 22:21:36','2021-06-17 22:21:36'),
(935,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:24:12','2021-06-17 22:24:12'),
(936,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:24:50','2021-06-17 22:24:50'),
(937,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:25:34','2021-06-17 22:25:34'),
(938,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:26:17','2021-06-17 22:26:17'),
(939,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:27:28','2021-06-17 22:27:28'),
(940,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:28:41','2021-06-17 22:28:41'),
(941,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:28:42','2021-06-17 22:28:42'),
(942,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:29:45','2021-06-17 22:29:45'),
(943,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:30:32','2021-06-17 22:30:32'),
(944,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:31:42','2021-06-17 22:31:42'),
(945,3,3,3,'Read the given sentences carefully, and choose the sentence that clarifies \nthe message of sentence.',0,NULL,10,1,'2021-06-17 22:32:37','2021-06-17 22:32:37'),
(946,3,3,3,'Read each carefully and then choose the letter of the sentence which is grammatically wrong. If the sentence doesn’t have error, shade the letter (d).',0,NULL,10,1,'2021-06-17 22:34:45','2021-06-17 22:34:45'),
(947,3,3,3,'Read each carefully and then choose the letter of the sentence which is grammatically wrong. If the sentence doesn’t have error, shade the letter (d).',0,NULL,10,1,'2021-06-17 22:35:38','2021-06-17 22:35:38'),
(948,3,3,3,'Read each carefully and then choose the letter of the sentence which is grammatically wrong. If the sentence doesn’t have error, shade the letter (d).',0,NULL,10,1,'2021-06-17 22:36:32','2021-06-17 22:36:32'),
(949,3,3,3,'Read each carefully and then choose the letter of the sentence which is grammatically wrong. If the sentence doesn’t have error, shade the letter (d).',0,NULL,10,1,'2021-06-17 22:37:46','2021-06-17 22:37:46'),
(950,3,3,3,'Read each carefully and then choose the letter of the sentence which is grammatically wrong. If the sentence doesn’t have error, shade the letter (d).',0,NULL,10,1,'2021-06-17 22:39:14','2021-06-17 22:39:14'),
(951,3,3,3,'Below are related sentences in a set.  Three of them have the same meaning except one. Identify the sentence that does not have the same meaning as the others.',0,NULL,10,1,'2021-06-17 22:40:55','2021-06-17 22:40:55'),
(952,3,3,3,'Below are related sentences in a set.  Three of them have the same meaning except one. Identify the sentence that does not have the same meaning as the others.',0,NULL,10,1,'2021-06-17 22:41:46','2021-06-17 22:41:46'),
(953,3,3,3,'Below are related sentences in a set.  Three of them have the same meaning except one. Identify the sentence that does not have the same meaning as the others.',0,NULL,10,1,'2021-06-17 22:43:09','2021-06-17 22:43:09'),
(954,3,3,3,'Below are related sentences in a set.  Three of them have the same meaning except one. Identify the sentence that does not have the same meaning as the others.',0,NULL,10,1,'2021-06-17 22:44:14','2021-06-17 22:44:14'),
(955,3,3,3,'Below are related sentences in a set.  Three of them have the same meaning except one. Identify the sentence that does not have the same meaning as the others.',0,NULL,10,1,'2021-06-17 22:45:55','2021-06-17 22:45:55'),
(956,3,3,3,'\"The handsome groom walked down the aisle.\"\nWhat word describes the word “groom” in the sentence?',0,NULL,10,1,'2021-06-17 22:47:50','2021-06-17 22:47:50'),
(957,3,3,3,'\"The handsome groom walked down the aisle.\"\nWhat part of speech is “handsome”?',0,NULL,10,1,'2021-06-17 22:48:57','2021-06-17 22:48:57'),
(958,3,3,3,'\"The handsome groom walked down the aisle.\"\nWhat is the position of “handsome” in the sentence?',0,NULL,10,1,'2021-06-17 22:50:22','2021-06-17 22:50:22'),
(959,3,3,3,'\"The suspect of the crime appears guilty.\"\nWhat is the adjective in the sentence?',0,NULL,10,1,'2021-06-17 22:51:52','2021-06-17 22:51:52'),
(960,3,3,3,'\"The suspect of the crime appears guilty.\"\n What is the function of “guilty” in the sentence?',0,NULL,10,1,'2021-06-17 22:53:03','2021-06-17 22:53:03'),
(961,3,3,3,'\"The suspect of the crime appears guilty.\"\nWhat is the position of “guilty” in the sentence?',0,NULL,10,1,'2021-06-17 22:55:32','2021-06-17 22:55:32'),
(962,3,3,3,'\"The sarcastic comment of her boss made her indifferent\"\nWhat word describes the subject “comment”?',0,NULL,10,1,'2021-06-17 23:18:48','2021-06-17 23:18:48'),
(963,3,3,3,'\"The sarcastic comment of her boss made her indifferent\"\nWhat is the position of the adjective “sarcastic”?',0,NULL,10,1,'2021-06-17 23:20:28','2021-06-17 23:20:28'),
(965,3,3,3,'\"The sarcastic comment of her boss made her indifferent\"\nWhat is the pronominal adjective in the sentence?',0,NULL,10,1,'2021-06-17 23:23:28','2021-06-17 23:23:28'),
(966,3,3,3,'\"The sarcastic comment of her boss made her indifferent.\"\nHow is the word “indifferent” used in the sentence?',0,NULL,10,1,'2021-06-17 23:25:43','2021-06-17 23:25:43'),
(967,3,3,3,'\"The sarcastic comment of her boss made her indifferent.\"\nWhat part of speech is indifferent?',0,NULL,10,1,'2021-06-17 23:26:53','2021-06-17 23:26:53'),
(968,3,3,3,'\"“The soup is extremely sour”, my brother told me.\"\nWhat is the function of the word “extremely” in the sentence?',0,NULL,10,1,'2021-06-17 23:29:55','2021-06-17 23:29:55'),
(969,3,3,3,'\"“The soup is extremely sour”, my brother told me.\"\nWhat word does extremely modify?',0,NULL,10,1,'2021-06-17 23:31:28','2021-06-17 23:31:28'),
(970,3,3,3,'\"“The soup is extremely sour”, my brother told me.\"\nWhat part of speech is the word modified by “extremely”?',0,NULL,10,1,'2021-06-17 23:33:43','2021-06-17 23:33:43'),
(971,3,3,3,'\"A well-rounded personality can deliver a speech effectively.\"\nWhat word in the sentence is an adverb of manner?',0,NULL,10,1,'2021-06-17 23:35:20','2021-06-17 23:35:20'),
(973,3,3,3,'The conduct of the election will greatly_____________ the democracy.',0,NULL,10,1,'2021-06-17 23:48:26','2021-06-17 23:48:26'),
(975,3,3,3,'The property is well taken _____________ of the by the tenant.',0,NULL,10,1,'2021-06-17 23:52:27','2021-06-17 23:52:27'),
(977,3,3,3,'The vendor should not _____________ the price of banana.',0,NULL,10,1,'2021-06-17 23:54:57','2021-06-17 23:54:57'),
(978,3,3,3,'He __________ the patient to the hospital the other day.',0,NULL,10,1,'2021-06-17 23:58:18','2021-06-17 23:58:18'),
(981,3,3,3,'The expensive umbrella ____________ I bought last night was lost.',0,NULL,10,1,'2021-06-18 00:01:18','2021-06-18 00:01:18'),
(982,3,1,1,'',1,'TUwMy2FgIJuY7IiuaFh31LUz35bwuXG4epWN5FIp.png',10,1,'2021-06-21 12:11:32','2021-06-21 12:11:32');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`is_open`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`is_open`) values 
(0);

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `section_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `set_time` int(11) NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `sections_section_unique` (`section`),
  UNIQUE KEY `sections_img_filename_unique` (`img_filename`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sections` */

insert  into `sections`(`section_id`,`section`,`img_filename`,`set_time`,`created_at`,`updated_at`) values 
(1,'ABSTRACT REASONING','abstraction.svg',10,NULL,NULL),
(2,'LOGICAL REASONING','logical.svg',10,NULL,NULL),
(3,'ENGLISH PROFICIENCY','english.svg',10,NULL,NULL),
(4,'NUMERICAL REASONING','numerical.svg',10,NULL,NULL),
(5,'GENERAL KNOWLEDGE','general.svg',10,NULL,NULL);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `student_schedules` */

DROP TABLE IF EXISTS `student_schedules`;

CREATE TABLE `student_schedules` (
  `student_schedule_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `test_schedule_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`student_schedule_id`),
  KEY `test_schedule_id` (`test_schedule_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `student_schedules_ibfk_1` FOREIGN KEY (`test_schedule_id`) REFERENCES `test_schedules` (`test_schedule_id`),
  CONSTRAINT `student_schedules_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `student_schedules` */

insert  into `student_schedules`(`student_schedule_id`,`test_schedule_id`,`user_id`,`created_at`,`updated_at`) values 
(3,2,7,'2021-06-21 11:39:46','2021-06-21 11:39:46');

/*Table structure for table `test_schedules` */

DROP TABLE IF EXISTS `test_schedules`;

CREATE TABLE `test_schedules` (
  `test_schedule_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acad_year_id` bigint(20) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `max_user` int(11) DEFAULT '30',
  `active` tinyint(4) DEFAULT '1',
  `nt_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`test_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `test_schedules` */

insert  into `test_schedules`(`test_schedule_id`,`acad_year_id`,`description`,`from`,`to`,`max_user`,`active`,`nt_user`,`created_at`,`updated_at`) values 
(2,3,'1st schedule','2021-07-01 08:00:00','2021-07-01 09:00:00',100,1,NULL,'2021-06-18 13:52:32','2021-06-21 11:36:19'),
(7,3,'June 26 BATCH 1','2021-06-26 08:00:00','2021-06-26 09:00:00',100,1,NULL,'2021-06-21 16:14:24','2021-06-21 16:24:07'),
(8,3,'June 26 BATCH 2','2021-06-26 09:00:00','2021-06-26 10:00:00',100,1,NULL,'2021-06-21 16:22:27','2021-06-21 16:23:06'),
(9,3,'June 26 Batch 3','2021-06-26 11:00:00','2021-06-26 12:00:00',100,1,NULL,'2021-06-21 16:24:39','2021-06-21 16:24:39'),
(10,3,'June 26 Batch 4','2021-06-26 13:00:00','2021-06-26 14:00:00',100,1,NULL,'2021-06-21 16:25:45','2021-06-21 16:25:45'),
(11,3,'June 26 Batch 5','2021-06-26 14:00:00','2021-06-26 15:00:00',100,1,NULL,'2021-06-21 16:27:24','2021-06-21 16:27:24'),
(12,3,'June 26 Batch 6','2021-06-26 15:00:00','2021-06-26 16:00:00',100,1,NULL,'2021-06-21 16:28:41','2021-06-21 16:28:41'),
(13,3,'June 26 Batch 6','2021-06-26 16:00:00','2021-06-26 17:00:00',100,1,NULL,'2021-06-21 16:29:29','2021-06-21 16:29:29'),
(14,3,'June 27 Batch 1','2021-06-27 08:00:00','2021-06-27 09:00:00',100,1,NULL,'2021-06-21 16:30:18','2021-06-21 16:30:18'),
(15,3,'June 27 Batch 2','2021-06-27 09:00:00','2021-06-27 10:00:00',100,1,NULL,'2021-06-21 16:31:38','2021-06-21 16:31:38'),
(16,3,'June 27 Batch 3','2021-06-27 11:00:00','2021-06-27 12:00:00',100,1,NULL,'2021-06-21 16:32:32','2021-06-21 16:32:32'),
(17,3,'June 27 Batch 4','2021-06-27 13:00:00','2021-06-27 14:00:00',100,1,NULL,'2021-06-21 16:33:30','2021-06-21 16:33:30'),
(18,3,'June 27 Batch 5','2021-06-27 15:00:00','2021-06-27 16:00:00',100,1,NULL,'2021-06-21 16:34:38','2021-06-21 16:34:38'),
(19,3,'June 27 Batch 6','2021-06-27 16:00:00','2021-06-27 17:00:00',100,1,NULL,'2021-06-21 16:35:19','2021-06-21 16:35:19'),
(20,3,'June 28 Batch 1','2021-06-28 08:00:00','2021-06-28 09:00:00',100,1,NULL,'2021-06-21 16:36:42','2021-06-21 16:36:42'),
(21,3,'June 28 Batch 2','2021-06-28 09:00:00','2021-06-28 10:00:00',100,1,NULL,'2021-06-21 16:37:32','2021-06-21 16:37:32'),
(22,3,'June 28 Batch 3','2021-06-28 10:00:00','2021-06-28 11:00:00',100,1,NULL,'2021-06-21 16:38:11','2021-06-21 16:38:11'),
(23,3,'June 28 Batch 4','2021-06-28 11:00:00','2021-06-28 12:00:00',100,1,NULL,'2021-06-21 16:38:57','2021-06-21 16:38:57'),
(24,3,'June 28 Batch 5','2021-06-28 13:00:00','2021-06-28 14:00:00',100,1,NULL,'2021-06-21 16:40:17','2021-06-21 16:40:17'),
(26,3,'July 4 Batch 1','2021-07-04 08:00:00','2021-07-04 09:00:00',100,1,NULL,'2021-06-22 13:45:35','2021-06-22 13:46:59'),
(27,3,'July 4 Batch 2','2021-07-04 09:00:00','2021-07-04 10:00:00',100,1,NULL,'2021-06-22 13:48:31','2021-06-22 13:48:31'),
(28,3,'July 4 Batch 3','2021-07-04 10:00:00','2021-07-04 11:00:00',100,1,NULL,'2021-06-22 13:50:47','2021-06-22 13:50:47'),
(29,3,'July 4 Batch 4','2021-07-04 11:00:00','2021-07-04 12:00:00',100,1,NULL,'2021-06-22 13:51:46','2021-06-22 13:51:46'),
(30,3,'July 4 Batch 5','2021-07-04 13:00:00','2021-07-04 14:00:00',100,1,NULL,'2021-06-22 13:52:57','2021-06-22 13:52:57'),
(31,3,'July 4 Batch 6','2021-07-04 14:00:00','2021-07-04 15:00:00',100,1,NULL,'2021-06-22 13:53:52','2021-06-22 13:54:32'),
(32,3,'July 4 Batch 7','2021-07-04 16:00:00','2021-07-04 17:00:00',100,1,NULL,'2021-06-22 13:55:21','2021-06-22 13:55:21'),
(33,3,'July 5 Batch 1','2021-07-05 08:00:00','2021-07-05 09:00:00',100,1,NULL,'2021-06-22 13:56:32','2021-06-22 13:56:32'),
(34,3,'July 5 Batch 2','2021-07-05 09:00:00','2021-07-05 10:00:00',100,1,NULL,'2021-06-22 13:56:32','2021-06-22 13:57:58'),
(35,3,'July 5 Batch 3','2021-07-05 10:00:00','2021-07-05 11:00:00',100,1,NULL,'2021-06-22 13:57:36','2021-06-22 13:58:56'),
(36,3,'July 5 Batch 4','2021-07-05 11:00:00','2021-07-05 12:00:00',100,1,NULL,'2021-06-22 13:57:36','2021-06-22 13:59:11'),
(37,3,'July 5 Batch 5','2021-07-05 13:00:00','2021-07-05 14:00:00',100,1,NULL,'2021-06-22 14:00:38','2021-06-22 14:00:38');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `birthplace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_program_choice` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_program_choice` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_school_attended` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barangay_id` int(11) DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`lname`,`fname`,`mname`,`sex`,`status`,`bdate`,`birthplace`,`contact_no`,`email`,`first_program_choice`,`second_program_choice`,`last_school_attended`,`province`,`city`,`barangay`,`barangay_id`,`street`,`email_verified_at`,`password`,`role`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','AMPARADO','ETIENNE','N','MALE',NULL,'0000-00-00','','','admin@pretest.org',NULL,NULL,NULL,'','','',0,NULL,NULL,'$2y$10$qUBiPW/OcneJU3SyVCd/besWbz.YA.6tJmteKxm1B7sZFgfyVL/mW','ADMINISTRATOR',NULL,NULL,NULL),
(2,'student','SUMALINOG','BERNICE','N','FEMALE',NULL,'0000-00-00','','','student@pretest.org',NULL,NULL,NULL,'','','',0,NULL,NULL,'$2y$10$TAqgguNvMS/bOq0zsM4x9eBKdY24JNgntNqJ.dFS8MLk/8K.jViZq','STUDENT',NULL,NULL,NULL),
(5,'eshen','amparado','etienne',NULL,'MALE',NULL,'2021-06-17','baroy','09167789585','etiennewayne@gmail.com','BSCS','BS CRIM',NULL,'Biliran','Culaba','Guindapunan',4717,NULL,'2021-06-18 13:43:52','$2y$10$IKBIi7jcmOJLuPUloL.98OglB4tE42sr6Qw6coQe9uA1CN6FMQ/e2','STUDENT',NULL,'2021-06-18 13:43:32','2021-06-18 13:43:52'),
(6,'user01','Amparado','Etienne',NULL,'MALE',NULL,'2021-06-21','Officiis mollitia ex','Est iste earum et ma','etiennewayneamparado@gmail.com','BSED','BSBA-HRDM',NULL,'Metropolitan Manila','Quezon City','Balong Bato',25635,'Voluptatem eligendi','2021-06-21 08:55:59','$2y$10$9jXyvdpdFvUPyV0wRcntLOEEI/xJhG5O.KJV/CmHkr5emWX0jwhEe','STUDENT',NULL,'2021-06-21 08:54:52','2021-06-21 08:55:59'),
(7,'bernalou','Sumalinog','Bernice Jovel','Sabillo','FEMALE','NEW','2021-06-14','Cebu City','09654005667','sumalinog.bernice@gmail.com','AB POLSCI','AB ENGLISH',NULL,'Misamis Occidental','Tangub City','Maloro',26262,'Roses','2021-06-21 11:39:34','$2y$10$mFXZdiUV326XjU1Z9meaNesBItlp9OMFd1Gm47KwThxnbu45OdHSm','STUDENT',NULL,'2021-06-21 11:38:52','2021-06-21 11:39:34'),
(8,'bernalouz','Sumalinog','Bernice','Sabillo','FEMALE','NEW','2020-08-24','Cebu City','09654005667','jinjahappybeej@gmail.com','AB POLSCI','AB ENGLISH',NULL,'Aurora','Maria Aurora','Bayanihan',2737,'Gangnamdong','2021-06-21 11:59:23','$2y$10$tmzhH6T5tEOltMuksNfGWeC6UIhMCp0MlnTaqSrxoeHM0m8tphz5O','STUDENT',NULL,'2021-06-21 11:58:59','2021-06-21 11:59:23'),
(9,'chriztino','Gerona','Chriztino','Murallon','MALE','NEW','1998-05-27','San Apolinario, Tangub City','09462931962','chriztino.gerona@gmail.com','AB ENGLISH','AB POLSCI',NULL,'Misamis Occidental','Tangub City','San Apolinario',26276,'1','2021-06-21 12:04:29','$2y$10$SpdNQCuOL86wsgL3yc9z/.JSksvossCDMc3yojIGmFq2ai1AbRdwK','STUDENT',NULL,'2021-06-21 12:03:53','2021-06-21 12:04:29'),
(10,'account','Alab','Marvilowe','Toraja','MALE','NEW','1997-03-02','Butuan','09104755453','eternalkanye@gmail.com','AB POLSCI','BSCS',NULL,'Misamis Occidental','Tangub City','Maloro',26262,'1',NULL,'$2y$10$SjIGOmkpoANUTmFLzRvVueer1Zq1rCUsOFQDZTgM1gPurPbKXLRB6','STUDENT',NULL,'2021-06-22 06:12:36','2021-06-22 06:12:36'),
(11,'account11','Truba','Marvilowe Jay Tiki','Toraja','MALE','NEW','1997-03-02','Butuan','09105553242','alabmarvilowe1@gmail.com','BSBA-HRDM','ACT',NULL,'Misamis Occidental','Tangub City','Barangay II - Marilou',26240,'1','2021-06-22 06:29:35','$2y$10$CzQjQkrVD2YaEngiwxdqI.lfr14d0NLqpF0U4p2fIlsBROvlr3wsC','STUDENT',NULL,'2021-06-22 06:29:03','2021-06-22 06:29:35');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
