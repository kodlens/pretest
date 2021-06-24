/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 10.4.13-MariaDB : Database - gadtest
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
  `active` tinyint(1) NOT NULL DEFAULT 0,
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
  `is_taken` tinyint(1) NOT NULL DEFAULT 0,
  `date_taken` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`answer_sheet_id`),
  KEY `answer_sheets_user_id_foreign` (`user_id`),
  CONSTRAINT `answer_sheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  CONSTRAINT `answers_answer_sheet_id_foreign` FOREIGN KEY (`answer_sheet_id`) REFERENCES `answer_sheets` (`answer_sheet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `learning_modalities` */

DROP TABLE IF EXISTS `learning_modalities`;

CREATE TABLE `learning_modalities` (
  `learning_mode_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `learning_mode` varchar(255) DEFAULT NULL,
  `learning_desc` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `upated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`learning_mode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `learning_modalities` */

insert  into `learning_modalities`(`learning_mode_id`,`learning_mode`,`learning_desc`,`created_at`,`upated_at`) values 
(1,'FULL ONLINE','Has a gadget with internet connection',NULL,NULL),
(2,'BLENDED','Modular and Online Learning',NULL,NULL);

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
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_img` tinyint(1) NOT NULL DEFAULT 0,
  `img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_answer` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `options_question_id_foreign` (`question_id`),
  CONSTRAINT `options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3754 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3749,982,'D','',1,'74ab0a3311c9325c40df9eb38cecbefe.png',0,NULL,NULL),
(3750,983,'A','',1,'590fbc8685e254b940d8491804236f5e.png',1,NULL,NULL),
(3751,983,'B','',1,'1361a01b0492570e27a4dc4ee815a2f3.png',0,NULL,NULL),
(3752,983,'C','',1,'8f6e11916477af48bd4a4d33665ed4bd.png',0,NULL,NULL),
(3753,983,'D','',1,'f4bcc2ad5757dd09befa7395f15641c7.png',0,NULL,NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('cjanerem@gmail.com','$2y$10$AeHkNJDWD5Kte8pclNi0d.i/LUfAOYn6Pis8OpzzarHKTaHkhfKCW','2021-06-23 18:13:52'),
('bagoodrosalie10@gmail.com','$2y$10$7/K4oDqC/RBo0aUTyc6EHeXXXHu0BIdk7z4sEZNiAcvA.rgwnzhMC','2021-06-23 18:22:33'),
('marissumalinog36@gmail.com','$2y$10$ZLkRIlwkRnNJWj.Q13EH8.0SgGgh11TG8l2TdMUhYng5gkK/5gUje','2021-06-23 18:32:14'),
('albertjohncarcagente@gmail.com','$2y$10$KRmz3sRZ2Okn0UtzoyLmKuBOUwJv2rWymqTgWoXOUIw42QiXdR4eG','2021-06-23 18:49:57'),
('tecsonjenelyn8@gmail.com','$2y$10$xJECjdctAkdUdqGDxXcuW.5VZL3fIcTAqqkPin50hYEothBVlOWt6','2021-06-23 19:54:56'),
('nylerobie@gmail.com','$2y$10$58sIdSfyCcLxlfPRG9gwWOl9/RxPFp8VX6STM5bZmHidmqYz.AIsy','2021-06-23 20:01:44'),
('daphnesabongan@gmail.com','$2y$10$VVbLLeODQ28Lkmtj0nQg5uTZjs5n/4ZlArmvJU./le6qn.4oEvq6q','2021-06-23 21:52:40'),
('lessamieibaya123@gmail.com','$2y$10$R0sNZ7AKxyQdqNgzODIWbObzlDbheb1m.QpruvLmuTZJ4mutcLl8C','2021-06-23 22:04:44'),
('alfredomictin55@gmail.com','$2y$10$WvHnqCjtMsGcYnepHkV/yemfeKuSywqv3ulLV//wMjSqH2.KYOVr2','2021-06-23 22:29:25'),
('reneboyquijano967@gmail.com','$2y$10$tDLQboxEPRpWhiFV.fvRbuYHN24K3XjzSv9FAm5Ge46Yjz73kPjpq','2021-06-23 22:41:43'),
('avancenajessa736@gmail.com','$2y$10$MiKHzyrqrAwe2PITmEyDB..jBsFPTOzm2m6.Eczm9/KfY65hhu7FW','2021-06-23 23:35:09'),
('caburogjungie@gmail.com','$2y$10$jqZHhAguDwaWTxejXKXTtewYeN7eMd7Y.rT9oFyk98w0wBhrxaqJC','2021-06-24 06:57:45'),
('benjieluna79@gmail.com','$2y$10$74iV9U3/S713X5sY5HVwz.jvt37HFAFmpzcLxLhm4EYN0.ubu7tfG','2021-06-24 07:51:58'),
('manzanoelay29@gmail.com','$2y$10$bpyp9/Gvu.KDh825a6ptr.Ox4loVj4NKMG6zlJGfiYgEtLMNVRxha','2021-06-24 08:40:06'),
('daphneyganiolon@gmail.com','$2y$10$lVwUKAE17lEsCy1Zh9qJq.n6d0N2JYUPVh5ULKrRdMbb52Jg7OBda','2021-06-24 09:05:01'),
('villegasmaryjoy25@gmail.com','$2y$10$v67UGR2XTo1SV9fgqo6c4OQk1w.VqCcVu.2jcosX6MY.SKil.cQlu','2021-06-24 09:26:21'),
('villegasmaryjoy56@gmail.com','$2y$10$8hwsFlkBsqdtKGFzqqsrhuovAEBYTEf6tP.cunqO3FnqMJVwFyERC','2021-06-24 09:26:37'),
('canalesaljun@gmail.com','$2y$10$qy31SLcn3RsRkNx1HW/VCO1ZX7leDc1li89/wNiGaMrB6.BIQ10nG','2021-06-24 09:33:31'),
('rioburlat143@gmail.com','$2y$10$p3bN6J3MAirkXuuh3NMI5uWtB2spIJatknbrDyANkrToqWF4060ku','2021-06-24 10:42:24'),
('itsjamby24@gmail.com','$2y$10$5fFwC45fOSbizxEDjwizJumay2pAqFnW/6uJ.dBzQ9kQVTR62sBsO','2021-06-24 11:06:59'),
('gonzalescristine72@gmail.com','$2y$10$PDIgqTwpJALXfwNVpvxv4Oe4Nd8qGLIFCub/YFCTIHt7pDseyl8Gy','2021-06-24 11:07:45'),
('markanthonyabelano03@gmail.com','$2y$10$eDvwF/h75RaZAnRi.cXz9u3jxjCYhcNA8t1cI/zd1SH4ZUxAgwi1e','2021-06-24 11:22:42'),
('santarin@gmail.com','$2y$10$JoST1WxkI2scTkfutYCWO.9a0CCklAFEvZnaQuGWeBG3t9ovFCWMO','2021-06-24 11:38:03'),
('Eljerjohnalicando@gmail.com','$2y$10$tLduKenAq4jL20ZbKJnXDu.SaLG2nantk1LpoOd/XYotgEKZOfuh.','2021-06-24 11:42:26');

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `question_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acad_year_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `level_id` bigint(20) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_question_img` tinyint(1) NOT NULL DEFAULT 0,
  `question_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_time` int(11) NOT NULL DEFAULT 10,
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
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(982,3,1,1,'',1,'TUwMy2FgIJuY7IiuaFh31LUz35bwuXG4epWN5FIp.png',10,1,'2021-06-21 12:11:32','2021-06-21 12:11:32'),
(983,3,1,2,'',1,'KABjg2VumRPW0LMIL38kbioh0nM5ot7cTqEldJjW.png',10,1,'2021-06-23 13:31:09','2021-06-23 13:31:09');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `is_open` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`is_open`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`is_open`) values 
(1);

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `section_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `set_time` int(11) NOT NULL DEFAULT 10,
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
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=864 DEFAULT CHARSET=latin1;

/*Data for the table `student_schedules` */

insert  into `student_schedules`(`student_schedule_id`,`test_schedule_id`,`user_id`,`created_at`,`updated_at`) values 
(5,7,13,'2021-06-23 11:11:33','2021-06-23 11:11:33'),
(6,7,14,'2021-06-23 16:24:17','2021-06-23 16:24:17'),
(7,7,15,'2021-06-23 16:25:01','2021-06-23 16:25:01'),
(8,7,16,'2021-06-23 16:26:43','2021-06-23 16:26:43'),
(9,7,18,'2021-06-23 16:28:29','2021-06-23 16:28:29'),
(10,7,23,'2021-06-23 16:31:04','2021-06-23 16:31:04'),
(11,7,21,'2021-06-23 16:31:18','2021-06-23 16:31:18'),
(12,7,19,'2021-06-23 16:31:23','2021-06-23 16:31:23'),
(13,7,20,'2021-06-23 16:32:38','2021-06-23 16:32:38'),
(14,7,26,'2021-06-23 16:35:35','2021-06-23 16:35:35'),
(15,7,25,'2021-06-23 16:37:25','2021-06-23 16:37:25'),
(16,7,27,'2021-06-23 16:37:57','2021-06-23 16:37:57'),
(17,7,29,'2021-06-23 16:38:51','2021-06-23 16:38:51'),
(18,7,30,'2021-06-23 16:39:24','2021-06-23 16:39:24'),
(19,7,24,'2021-06-23 16:41:53','2021-06-23 16:41:53'),
(20,7,34,'2021-06-23 16:42:43','2021-06-23 16:42:43'),
(21,7,32,'2021-06-23 16:43:28','2021-06-23 16:43:28'),
(22,7,37,'2021-06-23 16:45:16','2021-06-23 16:45:16'),
(24,7,39,'2021-06-23 16:46:19','2021-06-23 16:46:19'),
(25,7,42,'2021-06-23 16:46:47','2021-06-23 16:46:47'),
(26,7,41,'2021-06-23 16:46:58','2021-06-23 16:46:58'),
(27,7,38,'2021-06-23 16:48:12','2021-06-23 16:48:12'),
(28,7,35,'2021-06-23 16:48:31','2021-06-23 16:48:31'),
(29,7,45,'2021-06-23 16:49:26','2021-06-23 16:49:26'),
(30,7,43,'2021-06-23 16:50:29','2021-06-23 16:50:29'),
(31,7,44,'2021-06-23 16:50:56','2021-06-23 16:50:56'),
(32,7,48,'2021-06-23 16:51:20','2021-06-23 16:51:20'),
(33,7,46,'2021-06-23 16:51:25','2021-06-23 16:51:25'),
(34,7,58,'2021-06-23 16:52:51','2021-06-23 16:52:51'),
(35,7,53,'2021-06-23 16:52:55','2021-06-23 16:52:55'),
(36,7,55,'2021-06-23 16:52:55','2021-06-23 16:52:55'),
(37,7,54,'2021-06-23 16:52:57','2021-06-23 16:52:57'),
(38,7,57,'2021-06-23 16:53:11','2021-06-23 16:53:11'),
(39,7,63,'2021-06-23 16:54:20','2021-06-23 16:54:20'),
(40,7,61,'2021-06-23 16:54:42','2021-06-23 16:54:42'),
(41,7,62,'2021-06-23 16:55:00','2021-06-23 16:55:00'),
(42,7,65,'2021-06-23 16:55:10','2021-06-23 16:55:10'),
(43,7,51,'2021-06-23 16:55:18','2021-06-23 16:55:18'),
(44,7,68,'2021-06-23 16:56:41','2021-06-23 16:56:41'),
(45,7,67,'2021-06-23 16:56:50','2021-06-23 16:56:50'),
(46,7,71,'2021-06-23 16:57:28','2021-06-23 16:57:28'),
(47,7,70,'2021-06-23 16:57:35','2021-06-23 16:57:35'),
(48,7,59,'2021-06-23 16:57:44','2021-06-23 16:57:44'),
(49,7,73,'2021-06-23 16:58:04','2021-06-23 16:58:04'),
(50,7,56,'2021-06-23 16:58:25','2021-06-23 16:58:25'),
(51,7,74,'2021-06-23 16:58:36','2021-06-23 16:58:36'),
(52,7,66,'2021-06-23 16:58:50','2021-06-23 16:58:50'),
(53,7,72,'2021-06-23 16:58:59','2021-06-23 16:58:59'),
(54,7,75,'2021-06-23 16:59:07','2021-06-23 16:59:07'),
(55,7,76,'2021-06-23 17:00:27','2021-06-23 17:00:27'),
(56,7,80,'2021-06-23 17:02:50','2021-06-23 17:02:50'),
(57,7,83,'2021-06-23 17:03:25','2021-06-23 17:03:25'),
(58,7,81,'2021-06-23 17:05:07','2021-06-23 17:05:07'),
(59,7,85,'2021-06-23 17:05:58','2021-06-23 17:05:58'),
(60,7,78,'2021-06-23 17:06:48','2021-06-23 17:06:48'),
(61,7,47,'2021-06-23 17:07:22','2021-06-23 17:07:22'),
(62,7,82,'2021-06-23 17:08:13','2021-06-23 17:08:13'),
(63,7,89,'2021-06-23 17:08:22','2021-06-23 17:08:22'),
(64,7,90,'2021-06-23 17:09:13','2021-06-23 17:09:13'),
(65,7,95,'2021-06-23 17:09:54','2021-06-23 17:09:54'),
(66,7,96,'2021-06-23 17:09:56','2021-06-23 17:09:56'),
(67,7,98,'2021-06-23 17:10:01','2021-06-23 17:10:01'),
(68,7,91,'2021-06-23 17:10:25','2021-06-23 17:10:25'),
(69,7,87,'2021-06-23 17:11:02','2021-06-23 17:11:02'),
(70,7,94,'2021-06-23 17:11:05','2021-06-23 17:11:05'),
(71,7,100,'2021-06-23 17:15:00','2021-06-23 17:15:00'),
(72,7,106,'2021-06-23 17:15:20','2021-06-23 17:15:20'),
(73,7,103,'2021-06-23 17:16:00','2021-06-23 17:16:00'),
(74,7,105,'2021-06-23 17:16:10','2021-06-23 17:16:10'),
(75,7,104,'2021-06-23 17:16:18','2021-06-23 17:16:18'),
(76,7,102,'2021-06-23 17:16:28','2021-06-23 17:16:28'),
(77,7,107,'2021-06-23 17:18:32','2021-06-23 17:18:32'),
(78,7,111,'2021-06-23 17:20:30','2021-06-23 17:20:30'),
(79,7,93,'2021-06-23 17:21:16','2021-06-23 17:21:16'),
(80,7,112,'2021-06-23 17:21:19','2021-06-23 17:21:19'),
(81,7,120,'2021-06-23 17:24:35','2021-06-23 17:24:35'),
(82,7,64,'2021-06-23 17:25:06','2021-06-23 17:25:06'),
(83,7,118,'2021-06-23 17:25:10','2021-06-23 17:25:10'),
(84,7,116,'2021-06-23 17:25:26','2021-06-23 17:25:26'),
(85,7,114,'2021-06-23 17:25:57','2021-06-23 17:25:57'),
(86,7,124,'2021-06-23 17:26:45','2021-06-23 17:26:45'),
(87,7,123,'2021-06-23 17:27:00','2021-06-23 17:27:00'),
(88,7,92,'2021-06-23 17:27:03','2021-06-23 17:27:03'),
(89,7,115,'2021-06-23 17:27:11','2021-06-23 17:27:11'),
(90,7,125,'2021-06-23 17:28:11','2021-06-23 17:28:11'),
(91,7,130,'2021-06-23 17:28:44','2021-06-23 17:28:44'),
(92,7,133,'2021-06-23 17:29:40','2021-06-23 17:29:40'),
(93,7,132,'2021-06-23 17:29:59','2021-06-23 17:29:59'),
(94,7,134,'2021-06-23 17:31:30','2021-06-23 17:31:30'),
(95,7,135,'2021-06-23 17:31:55','2021-06-23 17:31:55'),
(96,7,128,'2021-06-23 17:32:01','2021-06-23 17:32:01'),
(97,7,117,'2021-06-23 17:32:05','2021-06-23 17:32:05'),
(98,7,138,'2021-06-23 17:32:07','2021-06-23 17:32:07'),
(99,7,113,'2021-06-23 17:32:21','2021-06-23 17:32:21'),
(100,7,140,'2021-06-23 17:33:54','2021-06-23 17:33:54'),
(101,7,143,'2021-06-23 17:34:05','2021-06-23 17:34:05'),
(102,7,137,'2021-06-23 17:34:12','2021-06-23 17:34:12'),
(103,7,142,'2021-06-23 17:34:28','2021-06-23 17:34:28'),
(104,7,145,'2021-06-23 17:35:18','2021-06-23 17:35:18'),
(105,7,139,'2021-06-23 17:35:28','2021-06-23 17:35:28'),
(106,8,148,'2021-06-23 17:36:18','2021-06-23 17:36:18'),
(107,8,147,'2021-06-23 17:37:04','2021-06-23 17:37:04'),
(108,8,146,'2021-06-23 17:37:11','2021-06-23 17:37:11'),
(109,8,149,'2021-06-23 17:37:51','2021-06-23 17:37:51'),
(110,8,136,'2021-06-23 17:39:29','2021-06-23 17:39:29'),
(111,8,126,'2021-06-23 17:42:08','2021-06-23 17:42:08'),
(112,8,108,'2021-06-23 17:42:15','2021-06-23 17:42:15'),
(113,8,153,'2021-06-23 17:43:15','2021-06-23 17:43:15'),
(114,8,151,'2021-06-23 17:43:23','2021-06-23 17:43:23'),
(115,8,157,'2021-06-23 17:44:11','2021-06-23 17:44:11'),
(116,8,127,'2021-06-23 17:44:18','2021-06-23 17:44:18'),
(117,8,158,'2021-06-23 17:44:33','2021-06-23 17:44:33'),
(118,8,150,'2021-06-23 17:46:45','2021-06-23 17:46:45'),
(119,8,154,'2021-06-23 17:46:46','2021-06-23 17:46:46'),
(120,8,160,'2021-06-23 17:47:31','2021-06-23 17:47:31'),
(121,8,159,'2021-06-23 17:48:04','2021-06-23 17:48:04'),
(122,8,167,'2021-06-23 17:50:02','2021-06-23 17:50:02'),
(123,8,166,'2021-06-23 17:50:53','2021-06-23 17:50:53'),
(124,8,161,'2021-06-23 17:51:06','2021-06-23 17:51:06'),
(125,8,170,'2021-06-23 17:51:09','2021-06-23 17:51:09'),
(126,8,173,'2021-06-23 17:51:45','2021-06-23 17:51:45'),
(127,8,174,'2021-06-23 17:52:35','2021-06-23 17:52:35'),
(129,8,182,'2021-06-23 17:54:40','2021-06-23 17:54:40'),
(130,8,180,'2021-06-23 17:55:15','2021-06-23 17:55:15'),
(131,8,177,'2021-06-23 17:55:43','2021-06-23 17:55:43'),
(132,8,176,'2021-06-23 17:56:18','2021-06-23 17:56:18'),
(133,8,187,'2021-06-23 17:56:42','2021-06-23 17:56:42'),
(134,8,188,'2021-06-23 17:57:03','2021-06-23 17:57:03'),
(135,8,175,'2021-06-23 17:57:57','2021-06-23 17:57:57'),
(136,8,189,'2021-06-23 17:58:48','2021-06-23 17:58:48'),
(137,8,169,'2021-06-23 17:59:04','2021-06-23 17:59:04'),
(138,8,179,'2021-06-23 18:00:16','2021-06-23 18:00:16'),
(139,8,194,'2021-06-23 18:00:35','2021-06-23 18:00:35'),
(140,8,195,'2021-06-23 18:00:50','2021-06-23 18:00:50'),
(141,8,193,'2021-06-23 18:02:34','2021-06-23 18:02:34'),
(142,8,198,'2021-06-23 18:02:46','2021-06-23 18:02:46'),
(143,8,196,'2021-06-23 18:03:00','2021-06-23 18:03:00'),
(144,8,204,'2021-06-23 18:03:38','2021-06-23 18:03:38'),
(145,8,121,'2021-06-23 18:05:20','2021-06-23 18:05:20'),
(146,8,184,'2021-06-23 18:05:27','2021-06-23 18:05:27'),
(147,8,186,'2021-06-23 18:05:57','2021-06-23 18:05:57'),
(148,8,202,'2021-06-23 18:07:26','2021-06-23 18:07:26'),
(149,8,171,'2021-06-23 18:07:51','2021-06-23 18:07:51'),
(150,8,201,'2021-06-23 18:07:53','2021-06-23 18:07:53'),
(151,8,205,'2021-06-23 18:08:19','2021-06-23 18:08:19'),
(152,8,122,'2021-06-23 18:08:51','2021-06-23 18:08:51'),
(153,8,203,'2021-06-23 18:09:02','2021-06-23 18:09:02'),
(154,8,210,'2021-06-23 18:09:14','2021-06-23 18:09:14'),
(155,8,208,'2021-06-23 18:09:28','2021-06-23 18:09:28'),
(156,8,209,'2021-06-23 18:09:50','2021-06-23 18:09:50'),
(157,8,207,'2021-06-23 18:10:24','2021-06-23 18:10:24'),
(158,8,206,'2021-06-23 18:10:48','2021-06-23 18:10:48'),
(159,8,219,'2021-06-23 18:12:46','2021-06-23 18:12:46'),
(160,8,218,'2021-06-23 18:13:18','2021-06-23 18:13:18'),
(161,8,220,'2021-06-23 18:13:48','2021-06-23 18:13:48'),
(162,8,215,'2021-06-23 18:14:30','2021-06-23 18:14:30'),
(163,8,221,'2021-06-23 18:14:33','2021-06-23 18:14:33'),
(164,8,222,'2021-06-23 18:14:42','2021-06-23 18:14:42'),
(165,8,223,'2021-06-23 18:15:45','2021-06-23 18:15:45'),
(166,8,214,'2021-06-23 18:16:00','2021-06-23 18:16:00'),
(167,8,212,'2021-06-23 18:17:13','2021-06-23 18:17:13'),
(168,8,226,'2021-06-23 18:17:42','2021-06-23 18:17:42'),
(169,8,225,'2021-06-23 18:17:59','2021-06-23 18:17:59'),
(170,8,228,'2021-06-23 18:18:05','2021-06-23 18:18:05'),
(171,8,229,'2021-06-23 18:18:11','2021-06-23 18:18:11'),
(172,8,211,'2021-06-23 18:20:17','2021-06-23 18:20:17'),
(173,8,224,'2021-06-23 18:20:27','2021-06-23 18:20:27'),
(174,8,236,'2021-06-23 18:20:29','2021-06-23 18:20:29'),
(175,8,237,'2021-06-23 18:20:50','2021-06-23 18:20:50'),
(176,8,234,'2021-06-23 18:21:49','2021-06-23 18:21:49'),
(177,8,232,'2021-06-23 18:22:05','2021-06-23 18:22:05'),
(178,8,242,'2021-06-23 18:24:42','2021-06-23 18:24:42'),
(179,8,241,'2021-06-23 18:24:57','2021-06-23 18:24:57'),
(180,8,245,'2021-06-23 18:25:51','2021-06-23 18:25:51'),
(181,8,250,'2021-06-23 18:26:06','2021-06-23 18:26:06'),
(182,8,243,'2021-06-23 18:26:10','2021-06-23 18:26:10'),
(183,8,248,'2021-06-23 18:26:36','2021-06-23 18:26:36'),
(184,8,239,'2021-06-23 18:26:57','2021-06-23 18:26:57'),
(185,8,227,'2021-06-23 18:27:46','2021-06-23 18:27:46'),
(186,8,244,'2021-06-23 18:27:46','2021-06-23 18:27:46'),
(187,8,252,'2021-06-23 18:28:04','2021-06-23 18:28:04'),
(188,8,253,'2021-06-23 18:29:24','2021-06-23 18:29:24'),
(189,8,199,'2021-06-23 18:29:29','2021-06-23 18:29:29'),
(190,8,251,'2021-06-23 18:29:49','2021-06-23 18:29:49'),
(191,8,255,'2021-06-23 18:31:17','2021-06-23 18:31:17'),
(192,8,264,'2021-06-23 18:31:23','2021-06-23 18:31:23'),
(193,8,267,'2021-06-23 18:31:37','2021-06-23 18:31:37'),
(194,8,260,'2021-06-23 18:32:10','2021-06-23 18:32:10'),
(195,8,258,'2021-06-23 18:32:22','2021-06-23 18:32:22'),
(196,8,261,'2021-06-23 18:33:23','2021-06-23 18:33:23'),
(197,8,271,'2021-06-23 18:34:41','2021-06-23 18:34:41'),
(198,8,216,'2021-06-23 18:35:29','2021-06-23 18:35:29'),
(199,8,277,'2021-06-23 18:35:48','2021-06-23 18:35:48'),
(200,8,275,'2021-06-23 18:36:58','2021-06-23 18:36:58'),
(201,8,278,'2021-06-23 18:37:22','2021-06-23 18:37:22'),
(202,8,281,'2021-06-23 18:37:45','2021-06-23 18:37:45'),
(203,8,285,'2021-06-23 18:39:19','2021-06-23 18:39:19'),
(204,8,280,'2021-06-23 18:39:22','2021-06-23 18:39:22'),
(205,8,272,'2021-06-23 18:39:27','2021-06-23 18:39:27'),
(206,8,263,'2021-06-23 18:39:47','2021-06-23 18:39:47'),
(207,9,274,'2021-06-23 18:39:52','2021-06-23 18:39:52'),
(208,9,283,'2021-06-23 18:39:58','2021-06-23 18:39:58'),
(209,9,235,'2021-06-23 18:40:34','2021-06-23 18:40:34'),
(210,9,240,'2021-06-23 18:40:36','2021-06-23 18:40:36'),
(211,9,289,'2021-06-23 18:40:40','2021-06-23 18:40:40'),
(212,9,233,'2021-06-23 18:40:51','2021-06-23 18:40:51'),
(213,9,294,'2021-06-23 18:41:46','2021-06-23 18:41:46'),
(214,9,192,'2021-06-23 18:42:45','2021-06-23 18:42:45'),
(215,9,292,'2021-06-23 18:43:32','2021-06-23 18:43:32'),
(216,9,279,'2021-06-23 18:43:58','2021-06-23 18:43:58'),
(217,9,290,'2021-06-23 18:44:15','2021-06-23 18:44:15'),
(218,9,276,'2021-06-23 18:44:25','2021-06-23 18:44:25'),
(219,9,300,'2021-06-23 18:45:21','2021-06-23 18:45:21'),
(220,9,293,'2021-06-23 18:46:13','2021-06-23 18:46:13'),
(221,9,304,'2021-06-23 18:46:13','2021-06-23 18:46:13'),
(222,9,286,'2021-06-23 18:46:17','2021-06-23 18:46:17'),
(223,9,301,'2021-06-23 18:46:18','2021-06-23 18:46:18'),
(224,9,262,'2021-06-23 18:46:22','2021-06-23 18:46:22'),
(225,9,284,'2021-06-23 18:46:52','2021-06-23 18:46:52'),
(226,9,308,'2021-06-23 18:47:10','2021-06-23 18:47:10'),
(227,9,269,'2021-06-23 18:47:56','2021-06-23 18:47:56'),
(228,9,299,'2021-06-23 18:48:09','2021-06-23 18:48:09'),
(229,9,312,'2021-06-23 18:48:37','2021-06-23 18:48:37'),
(230,9,297,'2021-06-23 18:48:45','2021-06-23 18:48:45'),
(231,9,310,'2021-06-23 18:49:38','2021-06-23 18:49:38'),
(232,9,316,'2021-06-23 18:49:39','2021-06-23 18:49:39'),
(233,9,305,'2021-06-23 18:51:08','2021-06-23 18:51:08'),
(234,9,320,'2021-06-23 18:52:23','2021-06-23 18:52:23'),
(235,9,313,'2021-06-23 18:52:57','2021-06-23 18:52:57'),
(236,9,323,'2021-06-23 18:53:01','2021-06-23 18:53:01'),
(237,9,327,'2021-06-23 18:53:26','2021-06-23 18:53:26'),
(238,9,324,'2021-06-23 18:54:07','2021-06-23 18:54:07'),
(239,9,326,'2021-06-23 18:54:16','2021-06-23 18:54:16'),
(240,9,329,'2021-06-23 18:54:26','2021-06-23 18:54:26'),
(241,9,321,'2021-06-23 18:54:36','2021-06-23 18:54:36'),
(242,9,328,'2021-06-23 18:54:44','2021-06-23 18:54:44'),
(243,9,302,'2021-06-23 18:55:23','2021-06-23 18:55:23'),
(244,9,331,'2021-06-23 18:55:42','2021-06-23 18:55:42'),
(245,9,291,'2021-06-23 18:56:29','2021-06-23 18:56:29'),
(246,9,336,'2021-06-23 18:57:16','2021-06-23 18:57:16'),
(247,9,337,'2021-06-23 18:58:33','2021-06-23 18:58:33'),
(248,9,322,'2021-06-23 18:58:54','2021-06-23 18:58:54'),
(249,9,341,'2021-06-23 18:59:02','2021-06-23 18:59:02'),
(250,9,101,'2021-06-23 19:00:08','2021-06-23 19:00:08'),
(251,9,333,'2021-06-23 19:00:20','2021-06-23 19:00:20'),
(252,9,342,'2021-06-23 19:00:23','2021-06-23 19:00:23'),
(253,9,344,'2021-06-23 19:00:59','2021-06-23 19:00:59'),
(254,9,306,'2021-06-23 19:01:09','2021-06-23 19:01:09'),
(255,9,346,'2021-06-23 19:01:17','2021-06-23 19:01:17'),
(256,9,345,'2021-06-23 19:01:50','2021-06-23 19:01:50'),
(257,9,348,'2021-06-23 19:02:05','2021-06-23 19:02:05'),
(258,9,350,'2021-06-23 19:03:37','2021-06-23 19:03:37'),
(259,9,353,'2021-06-23 19:04:36','2021-06-23 19:04:36'),
(260,9,347,'2021-06-23 19:04:52','2021-06-23 19:04:52'),
(261,9,273,'2021-06-23 19:06:08','2021-06-23 19:06:08'),
(262,9,354,'2021-06-23 19:06:58','2021-06-23 19:06:58'),
(263,9,356,'2021-06-23 19:07:36','2021-06-23 19:07:36'),
(264,9,351,'2021-06-23 19:07:42','2021-06-23 19:07:42'),
(265,9,357,'2021-06-23 19:08:54','2021-06-23 19:08:54'),
(266,9,330,'2021-06-23 19:09:39','2021-06-23 19:09:39'),
(267,9,361,'2021-06-23 19:10:45','2021-06-23 19:10:45'),
(268,9,335,'2021-06-23 19:10:54','2021-06-23 19:10:54'),
(269,9,363,'2021-06-23 19:11:51','2021-06-23 19:11:51'),
(270,9,367,'2021-06-23 19:12:34','2021-06-23 19:12:34'),
(271,9,370,'2021-06-23 19:13:30','2021-06-23 19:13:30'),
(272,9,373,'2021-06-23 19:14:22','2021-06-23 19:14:22'),
(273,9,372,'2021-06-23 19:14:57','2021-06-23 19:14:57'),
(274,9,371,'2021-06-23 19:15:16','2021-06-23 19:15:16'),
(275,9,365,'2021-06-23 19:15:24','2021-06-23 19:15:24'),
(276,9,377,'2021-06-23 19:15:47','2021-06-23 19:15:47'),
(277,9,364,'2021-06-23 19:18:33','2021-06-23 19:18:33'),
(278,9,381,'2021-06-23 19:18:56','2021-06-23 19:18:56'),
(279,9,380,'2021-06-23 19:19:07','2021-06-23 19:19:07'),
(280,9,384,'2021-06-23 19:20:40','2021-06-23 19:20:40'),
(281,9,385,'2021-06-23 19:21:09','2021-06-23 19:21:09'),
(282,9,392,'2021-06-23 19:24:03','2021-06-23 19:24:03'),
(283,9,376,'2021-06-23 19:24:04','2021-06-23 19:24:04'),
(284,9,390,'2021-06-23 19:24:42','2021-06-23 19:24:42'),
(285,9,394,'2021-06-23 19:25:07','2021-06-23 19:25:07'),
(286,9,391,'2021-06-23 19:25:50','2021-06-23 19:25:50'),
(287,9,393,'2021-06-23 19:25:54','2021-06-23 19:25:54'),
(288,9,256,'2021-06-23 19:25:58','2021-06-23 19:25:58'),
(289,9,395,'2021-06-23 19:26:37','2021-06-23 19:26:37'),
(290,9,399,'2021-06-23 19:26:56','2021-06-23 19:26:56'),
(291,9,401,'2021-06-23 19:27:52','2021-06-23 19:27:52'),
(292,9,402,'2021-06-23 19:28:03','2021-06-23 19:28:03'),
(293,9,368,'2021-06-23 19:28:40','2021-06-23 19:28:40'),
(294,9,403,'2021-06-23 19:28:42','2021-06-23 19:28:42'),
(295,9,383,'2021-06-23 19:28:56','2021-06-23 19:28:56'),
(296,9,404,'2021-06-23 19:30:06','2021-06-23 19:30:06'),
(297,9,355,'2021-06-23 19:30:07','2021-06-23 19:30:07'),
(298,9,389,'2021-06-23 19:30:40','2021-06-23 19:30:40'),
(299,9,382,'2021-06-23 19:30:51','2021-06-23 19:30:51'),
(300,9,407,'2021-06-23 19:31:07','2021-06-23 19:31:07'),
(301,9,408,'2021-06-23 19:31:43','2021-06-23 19:31:43'),
(302,9,409,'2021-06-23 19:32:15','2021-06-23 19:32:15'),
(303,9,397,'2021-06-23 19:32:23','2021-06-23 19:32:23'),
(304,9,406,'2021-06-23 19:32:40','2021-06-23 19:32:40'),
(305,9,410,'2021-06-23 19:33:41','2021-06-23 19:33:41'),
(306,9,413,'2021-06-23 19:35:21','2021-06-23 19:35:21'),
(307,10,411,'2021-06-23 19:36:05','2021-06-23 19:36:05'),
(308,10,419,'2021-06-23 19:36:24','2021-06-23 19:36:24'),
(309,10,416,'2021-06-23 19:37:40','2021-06-23 19:37:40'),
(310,10,386,'2021-06-23 19:37:42','2021-06-23 19:37:42'),
(311,10,405,'2021-06-23 19:38:50','2021-06-23 19:38:50'),
(312,10,418,'2021-06-23 19:39:11','2021-06-23 19:39:11'),
(313,10,426,'2021-06-23 19:39:46','2021-06-23 19:39:46'),
(314,10,425,'2021-06-23 19:40:31','2021-06-23 19:40:31'),
(315,10,430,'2021-06-23 19:40:32','2021-06-23 19:40:32'),
(316,10,424,'2021-06-23 19:41:42','2021-06-23 19:41:42'),
(317,10,428,'2021-06-23 19:41:57','2021-06-23 19:41:57'),
(318,10,435,'2021-06-23 19:43:11','2021-06-23 19:43:11'),
(319,10,437,'2021-06-23 19:43:15','2021-06-23 19:43:15'),
(320,10,439,'2021-06-23 19:43:16','2021-06-23 19:43:16'),
(321,10,440,'2021-06-23 19:43:31','2021-06-23 19:43:31'),
(322,10,441,'2021-06-23 19:44:54','2021-06-23 19:44:54'),
(323,10,450,'2021-06-23 19:45:44','2021-06-23 19:45:44'),
(324,10,453,'2021-06-23 19:46:36','2021-06-23 19:46:36'),
(325,10,452,'2021-06-23 19:47:19','2021-06-23 19:47:19'),
(326,10,427,'2021-06-23 19:47:19','2021-06-23 19:47:19'),
(327,10,443,'2021-06-23 19:47:26','2021-06-23 19:47:26'),
(328,10,438,'2021-06-23 19:48:00','2021-06-23 19:48:00'),
(329,10,458,'2021-06-23 19:48:22','2021-06-23 19:48:22'),
(330,10,432,'2021-06-23 19:48:31','2021-06-23 19:48:31'),
(331,10,447,'2021-06-23 19:49:14','2021-06-23 19:49:14'),
(332,10,454,'2021-06-23 19:49:29','2021-06-23 19:49:29'),
(333,10,433,'2021-06-23 19:50:56','2021-06-23 19:50:56'),
(334,10,417,'2021-06-23 19:51:14','2021-06-23 19:51:14'),
(335,10,445,'2021-06-23 19:51:16','2021-06-23 19:51:16'),
(336,10,467,'2021-06-23 19:52:30','2021-06-23 19:52:30'),
(337,10,465,'2021-06-23 19:52:57','2021-06-23 19:52:57'),
(338,10,470,'2021-06-23 19:53:03','2021-06-23 19:53:03'),
(339,10,466,'2021-06-23 19:53:04','2021-06-23 19:53:04'),
(340,10,200,'2021-06-23 19:53:08','2021-06-23 19:53:08'),
(341,10,471,'2021-06-23 19:53:20','2021-06-23 19:53:20'),
(342,10,474,'2021-06-23 19:54:15','2021-06-23 19:54:15'),
(343,10,469,'2021-06-23 19:54:20','2021-06-23 19:54:20'),
(344,10,478,'2021-06-23 19:56:56','2021-06-23 19:56:56'),
(345,10,475,'2021-06-23 19:57:43','2021-06-23 19:57:43'),
(346,10,480,'2021-06-23 19:58:55','2021-06-23 19:58:55'),
(347,10,485,'2021-06-23 19:59:02','2021-06-23 19:59:02'),
(348,10,420,'2021-06-23 19:59:19','2021-06-23 19:59:19'),
(349,10,488,'2021-06-23 19:59:36','2021-06-23 19:59:36'),
(350,10,460,'2021-06-23 19:59:45','2021-06-23 19:59:45'),
(351,10,479,'2021-06-23 20:00:05','2021-06-23 20:00:05'),
(352,10,487,'2021-06-23 20:00:23','2021-06-23 20:00:23'),
(353,10,436,'2021-06-23 20:00:45','2021-06-23 20:00:45'),
(354,10,489,'2021-06-23 20:01:19','2021-06-23 20:01:19'),
(355,10,494,'2021-06-23 20:01:27','2021-06-23 20:01:27'),
(356,10,442,'2021-06-23 20:01:41','2021-06-23 20:01:41'),
(357,10,484,'2021-06-23 20:02:15','2021-06-23 20:02:15'),
(358,10,481,'2021-06-23 20:02:46','2021-06-23 20:02:46'),
(359,10,500,'2021-06-23 20:03:52','2021-06-23 20:03:52'),
(360,10,492,'2021-06-23 20:04:48','2021-06-23 20:04:48'),
(361,10,378,'2021-06-23 20:05:02','2021-06-23 20:05:02'),
(362,10,379,'2021-06-23 20:05:32','2021-06-23 20:05:32'),
(363,10,468,'2021-06-23 20:05:47','2021-06-23 20:05:47'),
(364,10,497,'2021-06-23 20:06:06','2021-06-23 20:06:06'),
(365,10,503,'2021-06-23 20:06:31','2021-06-23 20:06:31'),
(366,10,504,'2021-06-23 20:06:54','2021-06-23 20:06:54'),
(367,10,507,'2021-06-23 20:07:39','2021-06-23 20:07:39'),
(368,10,511,'2021-06-23 20:07:55','2021-06-23 20:07:55'),
(369,10,508,'2021-06-23 20:08:29','2021-06-23 20:08:29'),
(370,10,499,'2021-06-23 20:08:56','2021-06-23 20:08:56'),
(371,10,510,'2021-06-23 20:09:21','2021-06-23 20:09:21'),
(372,10,238,'2021-06-23 20:10:30','2021-06-23 20:10:30'),
(373,10,369,'2021-06-23 20:10:36','2021-06-23 20:10:36'),
(374,10,496,'2021-06-23 20:10:41','2021-06-23 20:10:41'),
(375,10,513,'2021-06-23 20:11:43','2021-06-23 20:11:43'),
(376,10,505,'2021-06-23 20:12:19','2021-06-23 20:12:19'),
(377,10,521,'2021-06-23 20:12:24','2021-06-23 20:12:24'),
(378,10,523,'2021-06-23 20:12:42','2021-06-23 20:12:42'),
(379,10,506,'2021-06-23 20:12:57','2021-06-23 20:12:57'),
(380,10,514,'2021-06-23 20:13:07','2021-06-23 20:13:07'),
(381,10,502,'2021-06-23 20:13:45','2021-06-23 20:13:45'),
(382,10,464,'2021-06-23 20:14:34','2021-06-23 20:14:34'),
(383,10,518,'2021-06-23 20:14:53','2021-06-23 20:14:53'),
(384,10,524,'2021-06-23 20:15:31','2021-06-23 20:15:31'),
(385,10,315,'2021-06-23 20:16:26','2021-06-23 20:16:26'),
(386,10,530,'2021-06-23 20:16:44','2021-06-23 20:16:44'),
(387,10,522,'2021-06-23 20:16:47','2021-06-23 20:16:47'),
(388,10,528,'2021-06-23 20:17:30','2021-06-23 20:17:30'),
(389,10,531,'2021-06-23 20:17:42','2021-06-23 20:17:42'),
(390,10,533,'2021-06-23 20:18:34','2021-06-23 20:18:34'),
(391,10,472,'2021-06-23 20:19:54','2021-06-23 20:19:54'),
(392,10,515,'2021-06-23 20:21:36','2021-06-23 20:21:36'),
(393,10,539,'2021-06-23 20:21:51','2021-06-23 20:21:51'),
(394,10,527,'2021-06-23 20:22:12','2021-06-23 20:22:12'),
(395,10,545,'2021-06-23 20:22:35','2021-06-23 20:22:35'),
(396,10,540,'2021-06-23 20:23:18','2021-06-23 20:23:18'),
(397,10,541,'2021-06-23 20:23:28','2021-06-23 20:23:28'),
(398,10,532,'2021-06-23 20:24:09','2021-06-23 20:24:09'),
(399,10,547,'2021-06-23 20:24:47','2021-06-23 20:24:47'),
(400,10,548,'2021-06-23 20:25:27','2021-06-23 20:25:27'),
(401,10,552,'2021-06-23 20:25:45','2021-06-23 20:25:45'),
(402,10,549,'2021-06-23 20:26:07','2021-06-23 20:26:07'),
(403,10,542,'2021-06-23 20:26:38','2021-06-23 20:26:38'),
(404,10,553,'2021-06-23 20:27:25','2021-06-23 20:27:25'),
(405,10,557,'2021-06-23 20:30:05','2021-06-23 20:30:05'),
(406,10,560,'2021-06-23 20:30:40','2021-06-23 20:30:40'),
(407,11,561,'2021-06-23 20:30:49','2021-06-23 20:30:49'),
(408,11,543,'2021-06-23 20:30:58','2021-06-23 20:30:58'),
(409,11,538,'2021-06-23 20:30:59','2021-06-23 20:30:59'),
(410,11,559,'2021-06-23 20:31:01','2021-06-23 20:31:01'),
(411,11,563,'2021-06-23 20:31:56','2021-06-23 20:31:56'),
(412,11,565,'2021-06-23 20:32:48','2021-06-23 20:32:48'),
(413,11,571,'2021-06-23 20:33:35','2021-06-23 20:33:35'),
(414,11,568,'2021-06-23 20:33:46','2021-06-23 20:33:46'),
(415,11,573,'2021-06-23 20:34:07','2021-06-23 20:34:07'),
(416,11,569,'2021-06-23 20:34:15','2021-06-23 20:34:15'),
(417,11,567,'2021-06-23 20:34:32','2021-06-23 20:34:32'),
(418,11,572,'2021-06-23 20:35:23','2021-06-23 20:35:23'),
(419,11,579,'2021-06-23 20:35:24','2021-06-23 20:35:24'),
(420,11,575,'2021-06-23 20:35:59','2021-06-23 20:35:59'),
(421,11,558,'2021-06-23 20:36:14','2021-06-23 20:36:14'),
(422,11,564,'2021-06-23 20:36:15','2021-06-23 20:36:15'),
(423,11,582,'2021-06-23 20:36:42','2021-06-23 20:36:42'),
(424,11,577,'2021-06-23 20:37:53','2021-06-23 20:37:53'),
(425,11,546,'2021-06-23 20:37:55','2021-06-23 20:37:55'),
(426,11,576,'2021-06-23 20:38:47','2021-06-23 20:38:47'),
(427,11,587,'2021-06-23 20:39:18','2021-06-23 20:39:18'),
(428,11,583,'2021-06-23 20:39:44','2021-06-23 20:39:44'),
(429,11,555,'2021-06-23 20:40:04','2021-06-23 20:40:04'),
(430,11,462,'2021-06-23 20:41:51','2021-06-23 20:41:51'),
(431,11,591,'2021-06-23 20:43:39','2021-06-23 20:43:39'),
(432,11,566,'2021-06-23 20:43:50','2021-06-23 20:43:50'),
(433,11,593,'2021-06-23 20:44:14','2021-06-23 20:44:14'),
(434,11,599,'2021-06-23 20:44:50','2021-06-23 20:44:50'),
(435,11,597,'2021-06-23 20:45:33','2021-06-23 20:45:33'),
(436,11,595,'2021-06-23 20:46:27','2021-06-23 20:46:27'),
(437,11,604,'2021-06-23 20:47:37','2021-06-23 20:47:37'),
(438,11,607,'2021-06-23 20:48:12','2021-06-23 20:48:12'),
(439,11,609,'2021-06-23 20:49:09','2021-06-23 20:49:09'),
(440,11,598,'2021-06-23 20:50:25','2021-06-23 20:50:25'),
(441,11,614,'2021-06-23 20:50:38','2021-06-23 20:50:38'),
(442,11,613,'2021-06-23 20:50:47','2021-06-23 20:50:47'),
(443,11,612,'2021-06-23 20:51:38','2021-06-23 20:51:38'),
(444,11,618,'2021-06-23 20:51:38','2021-06-23 20:51:38'),
(445,11,620,'2021-06-23 20:52:26','2021-06-23 20:52:26'),
(446,11,388,'2021-06-23 20:53:09','2021-06-23 20:53:09'),
(447,11,624,'2021-06-23 20:53:30','2021-06-23 20:53:30'),
(448,11,622,'2021-06-23 20:53:54','2021-06-23 20:53:54'),
(449,11,617,'2021-06-23 20:54:05','2021-06-23 20:54:05'),
(450,11,626,'2021-06-23 20:54:35','2021-06-23 20:54:35'),
(451,11,616,'2021-06-23 20:54:37','2021-06-23 20:54:37'),
(452,11,629,'2021-06-23 20:54:45','2021-06-23 20:54:45'),
(453,11,621,'2021-06-23 20:55:31','2021-06-23 20:55:31'),
(454,11,554,'2021-06-23 20:55:42','2021-06-23 20:55:42'),
(455,11,633,'2021-06-23 20:57:39','2021-06-23 20:57:39'),
(456,11,632,'2021-06-23 20:58:39','2021-06-23 20:58:39'),
(457,11,580,'2021-06-23 20:59:15','2021-06-23 20:59:15'),
(458,11,635,'2021-06-23 20:59:22','2021-06-23 20:59:22'),
(459,11,611,'2021-06-23 21:00:43','2021-06-23 21:00:43'),
(460,11,627,'2021-06-23 21:00:47','2021-06-23 21:00:47'),
(461,11,631,'2021-06-23 21:01:27','2021-06-23 21:01:27'),
(462,11,628,'2021-06-23 21:02:05','2021-06-23 21:02:05'),
(463,11,641,'2021-06-23 21:02:11','2021-06-23 21:02:11'),
(464,11,647,'2021-06-23 21:06:42','2021-06-23 21:06:42'),
(465,11,642,'2021-06-23 21:07:15','2021-06-23 21:07:15'),
(466,11,600,'2021-06-23 21:07:23','2021-06-23 21:07:23'),
(467,11,634,'2021-06-23 21:07:23','2021-06-23 21:07:23'),
(468,11,652,'2021-06-23 21:08:06','2021-06-23 21:08:06'),
(469,11,650,'2021-06-23 21:08:19','2021-06-23 21:08:19'),
(470,11,644,'2021-06-23 21:08:29','2021-06-23 21:08:29'),
(471,11,526,'2021-06-23 21:08:41','2021-06-23 21:08:41'),
(472,11,606,'2021-06-23 21:09:11','2021-06-23 21:09:11'),
(473,11,490,'2021-06-23 21:09:32','2021-06-23 21:09:32'),
(474,11,656,'2021-06-23 21:11:08','2021-06-23 21:11:08'),
(475,11,660,'2021-06-23 21:11:21','2021-06-23 21:11:21'),
(476,11,654,'2021-06-23 21:12:05','2021-06-23 21:12:05'),
(477,11,645,'2021-06-23 21:13:28','2021-06-23 21:13:28'),
(478,11,655,'2021-06-23 21:14:35','2021-06-23 21:14:35'),
(479,11,657,'2021-06-23 21:16:09','2021-06-23 21:16:09'),
(480,11,664,'2021-06-23 21:16:44','2021-06-23 21:16:44'),
(481,11,659,'2021-06-23 21:16:47','2021-06-23 21:16:47'),
(482,11,638,'2021-06-23 21:17:11','2021-06-23 21:17:11'),
(483,11,648,'2021-06-23 21:17:18','2021-06-23 21:17:18'),
(484,11,671,'2021-06-23 21:18:19','2021-06-23 21:18:19'),
(485,11,676,'2021-06-23 21:19:30','2021-06-23 21:19:30'),
(486,11,672,'2021-06-23 21:19:41','2021-06-23 21:19:41'),
(487,11,670,'2021-06-23 21:21:09','2021-06-23 21:21:09'),
(488,11,682,'2021-06-23 21:22:37','2021-06-23 21:22:37'),
(489,11,619,'2021-06-23 21:22:44','2021-06-23 21:22:44'),
(490,11,666,'2021-06-23 21:22:56','2021-06-23 21:22:56'),
(491,11,592,'2021-06-23 21:23:01','2021-06-23 21:23:01'),
(492,11,683,'2021-06-23 21:23:22','2021-06-23 21:23:22'),
(493,11,675,'2021-06-23 21:23:26','2021-06-23 21:23:26'),
(494,11,674,'2021-06-23 21:24:16','2021-06-23 21:24:16'),
(495,11,663,'2021-06-23 21:24:28','2021-06-23 21:24:28'),
(496,11,690,'2021-06-23 21:25:16','2021-06-23 21:25:16'),
(497,11,688,'2021-06-23 21:27:06','2021-06-23 21:27:06'),
(498,11,517,'2021-06-23 21:27:59','2021-06-23 21:27:59'),
(499,11,694,'2021-06-23 21:28:46','2021-06-23 21:28:46'),
(500,11,584,'2021-06-23 21:29:19','2021-06-23 21:29:19'),
(501,11,653,'2021-06-23 21:30:58','2021-06-23 21:30:58'),
(502,11,667,'2021-06-23 21:33:02','2021-06-23 21:33:02'),
(503,11,679,'2021-06-23 21:33:14','2021-06-23 21:33:14'),
(504,11,590,'2021-06-23 21:35:19','2021-06-23 21:35:19'),
(505,11,702,'2021-06-23 21:36:18','2021-06-23 21:36:18'),
(506,11,707,'2021-06-23 21:36:27','2021-06-23 21:36:27'),
(507,12,705,'2021-06-23 21:38:08','2021-06-23 21:38:08'),
(508,12,698,'2021-06-23 21:38:14','2021-06-23 21:38:14'),
(509,12,701,'2021-06-23 21:38:40','2021-06-23 21:38:40'),
(510,12,695,'2021-06-23 21:39:07','2021-06-23 21:39:07'),
(511,12,699,'2021-06-23 21:39:24','2021-06-23 21:39:24'),
(512,12,700,'2021-06-23 21:39:49','2021-06-23 21:39:49'),
(513,12,706,'2021-06-23 21:40:05','2021-06-23 21:40:05'),
(514,12,714,'2021-06-23 21:40:14','2021-06-23 21:40:14'),
(515,12,709,'2021-06-23 21:40:23','2021-06-23 21:40:23'),
(516,12,703,'2021-06-23 21:41:25','2021-06-23 21:41:25'),
(517,12,713,'2021-06-23 21:41:27','2021-06-23 21:41:27'),
(518,12,717,'2021-06-23 21:41:58','2021-06-23 21:41:58'),
(519,12,719,'2021-06-23 21:42:47','2021-06-23 21:42:47'),
(520,12,711,'2021-06-23 21:42:49','2021-06-23 21:42:49'),
(521,12,722,'2021-06-23 21:43:44','2021-06-23 21:43:44'),
(522,12,723,'2021-06-23 21:44:17','2021-06-23 21:44:17'),
(523,12,697,'2021-06-23 21:44:32','2021-06-23 21:44:32'),
(524,12,726,'2021-06-23 21:44:38','2021-06-23 21:44:38'),
(525,12,721,'2021-06-23 21:45:00','2021-06-23 21:45:00'),
(526,12,710,'2021-06-23 21:46:20','2021-06-23 21:46:20'),
(527,12,720,'2021-06-23 21:47:20','2021-06-23 21:47:20'),
(528,12,725,'2021-06-23 21:47:34','2021-06-23 21:47:34'),
(529,12,731,'2021-06-23 21:49:59','2021-06-23 21:49:59'),
(530,12,724,'2021-06-23 21:50:07','2021-06-23 21:50:07'),
(531,12,728,'2021-06-23 21:51:16','2021-06-23 21:51:16'),
(532,12,727,'2021-06-23 21:51:49','2021-06-23 21:51:49'),
(533,12,729,'2021-06-23 21:53:03','2021-06-23 21:53:03'),
(534,12,678,'2021-06-23 21:54:00','2021-06-23 21:54:00'),
(535,12,736,'2021-06-23 21:56:11','2021-06-23 21:56:11'),
(536,12,739,'2021-06-23 21:56:36','2021-06-23 21:56:36'),
(537,12,332,'2021-06-23 21:58:04','2021-06-23 21:58:04'),
(538,12,740,'2021-06-23 21:58:20','2021-06-23 21:58:20'),
(539,12,738,'2021-06-23 21:58:20','2021-06-23 21:58:20'),
(540,12,741,'2021-06-23 21:59:08','2021-06-23 21:59:08'),
(541,12,743,'2021-06-23 21:59:15','2021-06-23 21:59:15'),
(542,12,732,'2021-06-23 22:01:33','2021-06-23 22:01:33'),
(543,12,747,'2021-06-23 22:01:35','2021-06-23 22:01:35'),
(544,12,737,'2021-06-23 22:02:26','2021-06-23 22:02:26'),
(545,12,733,'2021-06-23 22:02:49','2021-06-23 22:02:49'),
(546,12,751,'2021-06-23 22:03:49','2021-06-23 22:03:49'),
(547,12,742,'2021-06-23 22:05:04','2021-06-23 22:05:04'),
(548,12,753,'2021-06-23 22:05:39','2021-06-23 22:05:39'),
(549,12,755,'2021-06-23 22:06:50','2021-06-23 22:06:50'),
(550,12,744,'2021-06-23 22:07:16','2021-06-23 22:07:16'),
(551,12,756,'2021-06-23 22:07:31','2021-06-23 22:07:31'),
(552,12,758,'2021-06-23 22:07:34','2021-06-23 22:07:34'),
(553,12,767,'2021-06-23 22:12:47','2021-06-23 22:12:47'),
(554,12,762,'2021-06-23 22:12:58','2021-06-23 22:12:58'),
(555,12,770,'2021-06-23 22:13:22','2021-06-23 22:13:22'),
(556,12,769,'2021-06-23 22:13:58','2021-06-23 22:13:58'),
(557,12,766,'2021-06-23 22:14:36','2021-06-23 22:14:36'),
(558,12,771,'2021-06-23 22:14:53','2021-06-23 22:14:53'),
(559,12,601,'2021-06-23 22:15:49','2021-06-23 22:15:49'),
(560,12,734,'2021-06-23 22:15:59','2021-06-23 22:15:59'),
(561,12,765,'2021-06-23 22:16:00','2021-06-23 22:16:00'),
(562,12,772,'2021-06-23 22:16:16','2021-06-23 22:16:16'),
(563,12,750,'2021-06-23 22:17:25','2021-06-23 22:17:25'),
(564,12,768,'2021-06-23 22:17:36','2021-06-23 22:17:36'),
(565,12,773,'2021-06-23 22:19:36','2021-06-23 22:19:36'),
(566,12,745,'2021-06-23 22:20:33','2021-06-23 22:20:33'),
(567,12,757,'2021-06-23 22:20:54','2021-06-23 22:20:54'),
(568,12,761,'2021-06-23 22:21:59','2021-06-23 22:21:59'),
(569,12,777,'2021-06-23 22:22:42','2021-06-23 22:22:42'),
(570,12,776,'2021-06-23 22:23:38','2021-06-23 22:23:38'),
(571,12,774,'2021-06-23 22:25:10','2021-06-23 22:25:10'),
(572,12,763,'2021-06-23 22:25:40','2021-06-23 22:25:40'),
(573,12,352,'2021-06-23 22:26:44','2021-06-23 22:26:44'),
(574,12,779,'2021-06-23 22:27:03','2021-06-23 22:27:03'),
(575,12,781,'2021-06-23 22:30:33','2021-06-23 22:30:33'),
(576,12,783,'2021-06-23 22:32:39','2021-06-23 22:32:39'),
(577,12,785,'2021-06-23 22:34:55','2021-06-23 22:34:55'),
(578,12,784,'2021-06-23 22:37:20','2021-06-23 22:37:20'),
(579,12,788,'2021-06-23 22:38:20','2021-06-23 22:38:20'),
(580,12,782,'2021-06-23 22:41:46','2021-06-23 22:41:46'),
(581,12,789,'2021-06-23 22:42:05','2021-06-23 22:42:05'),
(582,12,790,'2021-06-23 22:42:35','2021-06-23 22:42:35'),
(583,12,791,'2021-06-23 22:43:26','2021-06-23 22:43:26'),
(584,12,793,'2021-06-23 22:44:19','2021-06-23 22:44:19'),
(585,12,796,'2021-06-23 22:46:36','2021-06-23 22:46:36'),
(586,12,636,'2021-06-23 22:46:44','2021-06-23 22:46:44'),
(587,12,795,'2021-06-23 22:46:47','2021-06-23 22:46:47'),
(588,12,794,'2021-06-23 22:48:41','2021-06-23 22:48:41'),
(589,12,787,'2021-06-23 22:48:57','2021-06-23 22:48:57'),
(590,12,799,'2021-06-23 22:54:17','2021-06-23 22:54:17'),
(591,12,797,'2021-06-23 22:55:14','2021-06-23 22:55:14'),
(592,12,800,'2021-06-23 23:04:08','2021-06-23 23:04:08'),
(593,12,802,'2021-06-23 23:05:41','2021-06-23 23:05:41'),
(594,12,803,'2021-06-23 23:07:11','2021-06-23 23:07:11'),
(595,12,748,'2021-06-23 23:09:27','2021-06-23 23:09:27'),
(596,12,804,'2021-06-23 23:10:53','2021-06-23 23:10:53'),
(597,12,805,'2021-06-23 23:15:29','2021-06-23 23:15:29'),
(598,12,807,'2021-06-23 23:15:34','2021-06-23 23:15:34'),
(599,12,810,'2021-06-23 23:21:26','2021-06-23 23:21:26'),
(600,12,809,'2021-06-23 23:24:15','2021-06-23 23:24:15'),
(601,12,808,'2021-06-23 23:24:25','2021-06-23 23:24:25'),
(602,12,812,'2021-06-23 23:28:51','2021-06-23 23:28:51'),
(603,12,813,'2021-06-23 23:28:52','2021-06-23 23:28:52'),
(604,12,696,'2021-06-23 23:36:20','2021-06-23 23:36:20'),
(605,12,588,'2021-06-23 23:36:39','2021-06-23 23:36:39'),
(606,12,815,'2021-06-23 23:39:00','2021-06-23 23:39:00'),
(607,13,814,'2021-06-23 23:41:46','2021-06-23 23:41:46'),
(608,13,816,'2021-06-23 23:43:25','2021-06-23 23:43:25'),
(609,13,818,'2021-06-23 23:45:02','2021-06-23 23:45:02'),
(610,13,819,'2021-06-23 23:48:31','2021-06-23 23:48:31'),
(611,13,820,'2021-06-23 23:58:25','2021-06-23 23:58:25'),
(612,13,811,'2021-06-24 00:01:25','2021-06-24 00:01:25'),
(613,13,822,'2021-06-24 00:07:35','2021-06-24 00:07:35'),
(614,13,823,'2021-06-24 00:14:51','2021-06-24 00:14:51'),
(615,13,826,'2021-06-24 01:46:21','2021-06-24 01:46:21'),
(616,13,827,'2021-06-24 02:07:53','2021-06-24 02:07:53'),
(617,13,516,'2021-06-24 02:50:50','2021-06-24 02:50:50'),
(618,13,829,'2021-06-24 02:51:55','2021-06-24 02:51:55'),
(619,13,831,'2021-06-24 04:12:52','2021-06-24 04:12:52'),
(620,13,832,'2021-06-24 04:46:40','2021-06-24 04:46:40'),
(621,13,833,'2021-06-24 05:00:49','2021-06-24 05:00:49'),
(622,13,834,'2021-06-24 05:25:49','2021-06-24 05:25:49'),
(623,13,786,'2021-06-24 05:57:25','2021-06-24 05:57:25'),
(624,13,830,'2021-06-24 06:13:37','2021-06-24 06:13:37'),
(625,13,839,'2021-06-24 06:19:53','2021-06-24 06:19:53'),
(626,13,843,'2021-06-24 06:23:45','2021-06-24 06:23:45'),
(627,13,845,'2021-06-24 06:24:20','2021-06-24 06:24:20'),
(628,13,847,'2021-06-24 06:29:21','2021-06-24 06:29:21'),
(629,13,846,'2021-06-24 06:33:12','2021-06-24 06:33:12'),
(630,13,849,'2021-06-24 06:42:27','2021-06-24 06:42:27'),
(631,13,842,'2021-06-24 06:49:12','2021-06-24 06:49:12'),
(632,13,850,'2021-06-24 06:51:11','2021-06-24 06:51:11'),
(633,13,852,'2021-06-24 06:56:47','2021-06-24 06:56:47'),
(634,13,556,'2021-06-24 07:00:04','2021-06-24 07:00:04'),
(635,13,853,'2021-06-24 07:03:23','2021-06-24 07:03:23'),
(636,13,855,'2021-06-24 07:04:09','2021-06-24 07:04:09'),
(637,13,856,'2021-06-24 07:15:05','2021-06-24 07:15:05'),
(638,13,860,'2021-06-24 07:22:34','2021-06-24 07:22:34'),
(639,13,862,'2021-06-24 07:25:30','2021-06-24 07:25:30'),
(640,13,861,'2021-06-24 07:26:16','2021-06-24 07:26:16'),
(641,13,857,'2021-06-24 07:26:33','2021-06-24 07:26:33'),
(642,13,863,'2021-06-24 07:26:35','2021-06-24 07:26:35'),
(643,13,864,'2021-06-24 07:28:53','2021-06-24 07:28:53'),
(644,13,866,'2021-06-24 07:31:32','2021-06-24 07:31:32'),
(645,13,865,'2021-06-24 07:32:41','2021-06-24 07:32:41'),
(646,13,868,'2021-06-24 07:33:55','2021-06-24 07:33:55'),
(647,13,870,'2021-06-24 07:36:20','2021-06-24 07:36:20'),
(648,13,871,'2021-06-24 07:38:19','2021-06-24 07:38:19'),
(649,13,873,'2021-06-24 07:41:03','2021-06-24 07:41:03'),
(650,13,875,'2021-06-24 07:41:47','2021-06-24 07:41:47'),
(651,13,874,'2021-06-24 07:41:58','2021-06-24 07:41:58'),
(652,13,872,'2021-06-24 07:42:37','2021-06-24 07:42:37'),
(653,13,869,'2021-06-24 07:44:55','2021-06-24 07:44:55'),
(654,13,867,'2021-06-24 07:47:01','2021-06-24 07:47:01'),
(655,13,877,'2021-06-24 07:47:46','2021-06-24 07:47:46'),
(656,13,640,'2021-06-24 07:49:25','2021-06-24 07:49:25'),
(657,13,878,'2021-06-24 07:56:04','2021-06-24 07:56:04'),
(658,13,885,'2021-06-24 07:57:16','2021-06-24 07:57:16'),
(659,13,884,'2021-06-24 07:59:00','2021-06-24 07:59:00'),
(660,13,889,'2021-06-24 07:59:09','2021-06-24 07:59:09'),
(661,13,887,'2021-06-24 07:59:37','2021-06-24 07:59:37'),
(662,13,883,'2021-06-24 08:00:05','2021-06-24 08:00:05'),
(663,13,888,'2021-06-24 08:01:19','2021-06-24 08:01:19'),
(664,13,890,'2021-06-24 08:02:16','2021-06-24 08:02:16'),
(665,13,892,'2021-06-24 08:04:12','2021-06-24 08:04:12'),
(666,13,882,'2021-06-24 08:04:26','2021-06-24 08:04:26'),
(667,13,881,'2021-06-24 08:05:17','2021-06-24 08:05:17'),
(668,13,891,'2021-06-24 08:05:55','2021-06-24 08:05:55'),
(669,13,685,'2021-06-24 08:08:30','2021-06-24 08:08:30'),
(670,13,896,'2021-06-24 08:09:31','2021-06-24 08:09:31'),
(671,13,897,'2021-06-24 08:09:47','2021-06-24 08:09:47'),
(672,13,893,'2021-06-24 08:10:14','2021-06-24 08:10:14'),
(673,13,899,'2021-06-24 08:11:48','2021-06-24 08:11:48'),
(674,13,898,'2021-06-24 08:11:51','2021-06-24 08:11:51'),
(675,13,900,'2021-06-24 08:11:58','2021-06-24 08:11:58'),
(676,13,894,'2021-06-24 08:14:32','2021-06-24 08:14:32'),
(677,13,902,'2021-06-24 08:14:51','2021-06-24 08:14:51'),
(678,13,901,'2021-06-24 08:17:18','2021-06-24 08:17:18'),
(679,13,903,'2021-06-24 08:18:36','2021-06-24 08:18:36'),
(680,13,906,'2021-06-24 08:19:39','2021-06-24 08:19:39'),
(681,13,886,'2021-06-24 08:19:49','2021-06-24 08:19:49'),
(682,13,904,'2021-06-24 08:22:59','2021-06-24 08:22:59'),
(683,13,509,'2021-06-24 08:23:45','2021-06-24 08:23:45'),
(684,13,910,'2021-06-24 08:25:28','2021-06-24 08:25:28'),
(685,13,911,'2021-06-24 08:26:11','2021-06-24 08:26:11'),
(686,13,907,'2021-06-24 08:27:56','2021-06-24 08:27:56'),
(687,13,912,'2021-06-24 08:28:36','2021-06-24 08:28:36'),
(688,13,916,'2021-06-24 08:29:38','2021-06-24 08:29:38'),
(689,13,917,'2021-06-24 08:30:35','2021-06-24 08:30:35'),
(690,13,608,'2021-06-24 08:32:24','2021-06-24 08:32:24'),
(691,13,282,'2021-06-24 08:32:53','2021-06-24 08:32:53'),
(692,13,918,'2021-06-24 08:34:07','2021-06-24 08:34:07'),
(693,13,915,'2021-06-24 08:34:11','2021-06-24 08:34:11'),
(694,13,924,'2021-06-24 08:40:03','2021-06-24 08:40:03'),
(695,13,925,'2021-06-24 08:42:29','2021-06-24 08:42:29'),
(696,13,913,'2021-06-24 08:42:30','2021-06-24 08:42:30'),
(697,13,927,'2021-06-24 08:42:51','2021-06-24 08:42:51'),
(698,13,921,'2021-06-24 08:43:28','2021-06-24 08:43:28'),
(699,13,926,'2021-06-24 08:45:31','2021-06-24 08:45:31'),
(700,13,928,'2021-06-24 08:45:37','2021-06-24 08:45:37'),
(701,13,920,'2021-06-24 08:46:36','2021-06-24 08:46:36'),
(702,13,933,'2021-06-24 08:47:00','2021-06-24 08:47:00'),
(703,13,934,'2021-06-24 08:47:27','2021-06-24 08:47:27'),
(704,13,931,'2021-06-24 08:48:20','2021-06-24 08:48:20'),
(705,13,922,'2021-06-24 08:51:36','2021-06-24 08:51:36'),
(706,13,936,'2021-06-24 08:52:04','2021-06-24 08:52:04'),
(707,14,935,'2021-06-24 08:52:22','2021-06-24 08:52:22'),
(708,14,529,'2021-06-24 08:55:48','2021-06-24 08:55:48'),
(709,14,929,'2021-06-24 08:56:59','2021-06-24 08:56:59'),
(710,14,944,'2021-06-24 08:58:57','2021-06-24 08:58:57'),
(711,14,942,'2021-06-24 08:59:07','2021-06-24 08:59:07'),
(712,14,943,'2021-06-24 08:59:36','2021-06-24 08:59:36'),
(713,14,941,'2021-06-24 09:00:41','2021-06-24 09:00:41'),
(714,14,923,'2021-06-24 09:01:47','2021-06-24 09:01:47'),
(715,14,938,'2021-06-24 09:02:15','2021-06-24 09:02:15'),
(716,14,914,'2021-06-24 09:03:05','2021-06-24 09:03:05'),
(717,14,919,'2021-06-24 09:03:33','2021-06-24 09:03:33'),
(718,14,949,'2021-06-24 09:04:24','2021-06-24 09:04:24'),
(719,14,946,'2021-06-24 09:05:05','2021-06-24 09:05:05'),
(720,14,950,'2021-06-24 09:07:58','2021-06-24 09:07:58'),
(721,14,954,'2021-06-24 09:08:36','2021-06-24 09:08:36'),
(722,14,948,'2021-06-24 09:09:15','2021-06-24 09:09:15'),
(723,14,955,'2021-06-24 09:10:12','2021-06-24 09:10:12'),
(724,14,957,'2021-06-24 09:10:39','2021-06-24 09:10:39'),
(725,14,952,'2021-06-24 09:12:35','2021-06-24 09:12:35'),
(726,14,965,'2021-06-24 09:16:41','2021-06-24 09:16:41'),
(727,14,961,'2021-06-24 09:17:20','2021-06-24 09:17:20'),
(728,14,958,'2021-06-24 09:17:29','2021-06-24 09:17:29'),
(729,14,966,'2021-06-24 09:19:19','2021-06-24 09:19:19'),
(730,14,967,'2021-06-24 09:21:04','2021-06-24 09:21:04'),
(731,14,939,'2021-06-24 09:21:10','2021-06-24 09:21:10'),
(732,14,973,'2021-06-24 09:24:43','2021-06-24 09:24:43'),
(733,14,970,'2021-06-24 09:26:17','2021-06-24 09:26:17'),
(734,14,972,'2021-06-24 09:26:21','2021-06-24 09:26:21'),
(735,14,975,'2021-06-24 09:26:38','2021-06-24 09:26:38'),
(736,14,976,'2021-06-24 09:26:57','2021-06-24 09:26:57'),
(737,14,969,'2021-06-24 09:29:01','2021-06-24 09:29:01'),
(738,14,978,'2021-06-24 09:30:20','2021-06-24 09:30:20'),
(739,14,985,'2021-06-24 09:35:18','2021-06-24 09:35:18'),
(740,14,988,'2021-06-24 09:36:21','2021-06-24 09:36:21'),
(741,14,984,'2021-06-24 09:37:22','2021-06-24 09:37:22'),
(742,14,983,'2021-06-24 09:38:10','2021-06-24 09:38:10'),
(743,14,859,'2021-06-24 09:38:37','2021-06-24 09:38:37'),
(744,14,982,'2021-06-24 09:39:39','2021-06-24 09:39:39'),
(745,14,981,'2021-06-24 09:40:27','2021-06-24 09:40:27'),
(746,14,992,'2021-06-24 09:40:48','2021-06-24 09:40:48'),
(747,14,459,'2021-06-24 09:41:15','2021-06-24 09:41:15'),
(748,14,993,'2021-06-24 09:41:26','2021-06-24 09:41:26'),
(749,14,989,'2021-06-24 09:42:34','2021-06-24 09:42:34'),
(750,14,977,'2021-06-24 09:42:41','2021-06-24 09:42:41'),
(751,14,996,'2021-06-24 09:44:23','2021-06-24 09:44:23'),
(752,14,951,'2021-06-24 09:44:35','2021-06-24 09:44:35'),
(753,14,995,'2021-06-24 09:45:48','2021-06-24 09:45:48'),
(754,14,1001,'2021-06-24 09:45:53','2021-06-24 09:45:53'),
(755,14,1002,'2021-06-24 09:46:37','2021-06-24 09:46:37'),
(756,14,1000,'2021-06-24 09:46:44','2021-06-24 09:46:44'),
(757,14,998,'2021-06-24 09:46:50','2021-06-24 09:46:50'),
(758,14,1003,'2021-06-24 09:47:49','2021-06-24 09:47:49'),
(759,14,1004,'2021-06-24 09:48:06','2021-06-24 09:48:06'),
(760,14,1011,'2021-06-24 09:53:15','2021-06-24 09:53:15'),
(761,14,1007,'2021-06-24 09:53:31','2021-06-24 09:53:31'),
(762,14,1012,'2021-06-24 09:54:40','2021-06-24 09:54:40'),
(763,14,997,'2021-06-24 09:55:11','2021-06-24 09:55:11'),
(764,14,1020,'2021-06-24 09:56:44','2021-06-24 09:56:44'),
(765,14,1013,'2021-06-24 09:56:47','2021-06-24 09:56:47'),
(766,14,1018,'2021-06-24 09:57:18','2021-06-24 09:57:18'),
(767,14,1021,'2021-06-24 09:58:57','2021-06-24 09:58:57'),
(768,14,1019,'2021-06-24 09:59:25','2021-06-24 09:59:25'),
(769,14,1025,'2021-06-24 09:59:33','2021-06-24 09:59:33'),
(770,14,1024,'2021-06-24 09:59:34','2021-06-24 09:59:34'),
(771,14,1017,'2021-06-24 10:00:55','2021-06-24 10:00:55'),
(772,14,1026,'2021-06-24 10:16:09','2021-06-24 10:16:09'),
(773,14,964,'2021-06-24 10:17:00','2021-06-24 10:17:00'),
(774,14,1029,'2021-06-24 10:19:00','2021-06-24 10:19:00'),
(775,14,1028,'2021-06-24 10:20:28','2021-06-24 10:20:28'),
(776,14,1033,'2021-06-24 10:21:54','2021-06-24 10:21:54'),
(777,14,1014,'2021-06-24 10:23:14','2021-06-24 10:23:14'),
(778,14,1027,'2021-06-24 10:23:16','2021-06-24 10:23:16'),
(779,14,1036,'2021-06-24 10:23:48','2021-06-24 10:23:48'),
(780,14,1030,'2021-06-24 10:23:57','2021-06-24 10:23:57'),
(781,14,1038,'2021-06-24 10:24:29','2021-06-24 10:24:29'),
(782,14,1031,'2021-06-24 10:24:58','2021-06-24 10:24:58'),
(783,14,1042,'2021-06-24 10:26:12','2021-06-24 10:26:12'),
(784,14,1008,'2021-06-24 10:27:25','2021-06-24 10:27:25'),
(785,14,1040,'2021-06-24 10:28:41','2021-06-24 10:28:41'),
(786,14,172,'2021-06-24 10:28:52','2021-06-24 10:28:52'),
(787,14,1039,'2021-06-24 10:29:35','2021-06-24 10:29:35'),
(788,14,1048,'2021-06-24 10:30:28','2021-06-24 10:30:28'),
(789,14,1044,'2021-06-24 10:33:01','2021-06-24 10:33:01'),
(790,14,1052,'2021-06-24 10:33:04','2021-06-24 10:33:04'),
(791,14,1050,'2021-06-24 10:33:09','2021-06-24 10:33:09'),
(792,14,1053,'2021-06-24 10:34:28','2021-06-24 10:34:28'),
(793,14,1057,'2021-06-24 10:36:53','2021-06-24 10:36:53'),
(794,14,1061,'2021-06-24 10:37:46','2021-06-24 10:37:46'),
(795,14,1062,'2021-06-24 10:38:38','2021-06-24 10:38:38'),
(796,14,1045,'2021-06-24 10:38:56','2021-06-24 10:38:56'),
(797,14,1058,'2021-06-24 10:39:37','2021-06-24 10:39:37'),
(798,14,1064,'2021-06-24 10:39:56','2021-06-24 10:39:56'),
(799,14,1060,'2021-06-24 10:40:19','2021-06-24 10:40:19'),
(800,14,1068,'2021-06-24 10:41:51','2021-06-24 10:41:51'),
(801,14,1066,'2021-06-24 10:42:01','2021-06-24 10:42:01'),
(802,14,1065,'2021-06-24 10:42:02','2021-06-24 10:42:02'),
(803,14,1072,'2021-06-24 10:44:12','2021-06-24 10:44:12'),
(804,14,1054,'2021-06-24 10:45:02','2021-06-24 10:45:02'),
(805,14,1073,'2021-06-24 10:45:13','2021-06-24 10:45:13'),
(806,14,1075,'2021-06-24 10:45:46','2021-06-24 10:45:46'),
(807,15,1076,'2021-06-24 10:46:55','2021-06-24 10:46:55'),
(808,15,1037,'2021-06-24 10:47:27','2021-06-24 10:47:27'),
(809,15,1077,'2021-06-24 10:50:50','2021-06-24 10:50:50'),
(810,15,1084,'2021-06-24 10:50:54','2021-06-24 10:50:54'),
(811,15,1067,'2021-06-24 10:51:19','2021-06-24 10:51:19'),
(812,15,1070,'2021-06-24 10:51:52','2021-06-24 10:51:52'),
(813,15,1081,'2021-06-24 10:51:57','2021-06-24 10:51:57'),
(814,15,1087,'2021-06-24 10:52:06','2021-06-24 10:52:06'),
(815,15,1079,'2021-06-24 10:53:28','2021-06-24 10:53:28'),
(816,15,1074,'2021-06-24 10:58:28','2021-06-24 10:58:28'),
(817,15,1095,'2021-06-24 10:59:11','2021-06-24 10:59:11'),
(818,15,1096,'2021-06-24 10:59:19','2021-06-24 10:59:19'),
(819,15,838,'2021-06-24 10:59:29','2021-06-24 10:59:29'),
(820,15,1093,'2021-06-24 11:00:00','2021-06-24 11:00:00'),
(821,15,1092,'2021-06-24 11:01:33','2021-06-24 11:01:33'),
(822,15,1098,'2021-06-24 11:03:00','2021-06-24 11:03:00'),
(823,15,1099,'2021-06-24 11:04:08','2021-06-24 11:04:08'),
(824,15,1080,'2021-06-24 11:04:37','2021-06-24 11:04:37'),
(825,15,1100,'2021-06-24 11:06:32','2021-06-24 11:06:32'),
(826,15,1102,'2021-06-24 11:07:13','2021-06-24 11:07:13'),
(827,15,1105,'2021-06-24 11:09:03','2021-06-24 11:09:03'),
(828,15,1104,'2021-06-24 11:09:58','2021-06-24 11:09:58'),
(829,15,1056,'2021-06-24 11:10:40','2021-06-24 11:10:40'),
(830,15,1078,'2021-06-24 11:11:17','2021-06-24 11:11:17'),
(831,15,1111,'2021-06-24 11:12:55','2021-06-24 11:12:55'),
(832,15,1110,'2021-06-24 11:13:19','2021-06-24 11:13:19'),
(833,15,1107,'2021-06-24 11:13:27','2021-06-24 11:13:27'),
(834,15,1103,'2021-06-24 11:15:47','2021-06-24 11:15:47'),
(835,15,1113,'2021-06-24 11:19:16','2021-06-24 11:19:16'),
(836,15,1106,'2021-06-24 11:20:12','2021-06-24 11:20:12'),
(837,15,1117,'2021-06-24 11:21:33','2021-06-24 11:21:33'),
(838,15,1114,'2021-06-24 11:21:53','2021-06-24 11:21:53'),
(839,15,1085,'2021-06-24 11:22:26','2021-06-24 11:22:26'),
(840,15,1101,'2021-06-24 11:24:00','2021-06-24 11:24:00'),
(841,15,1071,'2021-06-24 11:27:27','2021-06-24 11:27:27'),
(842,15,689,'2021-06-24 11:27:28','2021-06-24 11:27:28'),
(843,15,1097,'2021-06-24 11:28:37','2021-06-24 11:28:37'),
(844,15,1115,'2021-06-24 11:29:36','2021-06-24 11:29:36'),
(845,15,1128,'2021-06-24 11:31:31','2021-06-24 11:31:31'),
(846,15,1131,'2021-06-24 11:33:21','2021-06-24 11:33:21'),
(847,15,1130,'2021-06-24 11:33:22','2021-06-24 11:33:22'),
(848,15,1125,'2021-06-24 11:33:23','2021-06-24 11:33:23'),
(849,15,1123,'2021-06-24 11:34:24','2021-06-24 11:34:24'),
(850,15,1134,'2021-06-24 11:34:30','2021-06-24 11:34:30'),
(851,15,1126,'2021-06-24 11:35:03','2021-06-24 11:35:03'),
(852,15,1122,'2021-06-24 11:35:42','2021-06-24 11:35:42'),
(853,15,1133,'2021-06-24 11:36:27','2021-06-24 11:36:27'),
(854,15,1138,'2021-06-24 11:40:31','2021-06-24 11:40:31'),
(855,15,1135,'2021-06-24 11:41:38','2021-06-24 11:41:38'),
(856,15,1143,'2021-06-24 11:43:32','2021-06-24 11:43:32'),
(857,15,1145,'2021-06-24 11:45:25','2021-06-24 11:45:25'),
(858,15,1146,'2021-06-24 11:45:55','2021-06-24 11:45:55'),
(859,15,1144,'2021-06-24 11:46:25','2021-06-24 11:46:25'),
(860,15,1151,'2021-06-24 11:49:19','2021-06-24 11:49:19'),
(861,15,1116,'2021-06-24 11:49:27','2021-06-24 11:49:27'),
(862,15,1148,'2021-06-24 11:50:25','2021-06-24 11:50:25'),
(863,15,31,'2021-06-24 12:51:21','2021-06-24 12:51:21');

/*Table structure for table `taking_test` */

DROP TABLE IF EXISTS `taking_test`;

CREATE TABLE `taking_test` (
  `taking_test_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acad_year_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taking_test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `taking_test` */

insert  into `taking_test`(`taking_test_id`,`acad_year_id`,`user_id`,`section_id`,`created_at`,`updated_at`) values 
(1,3,31,1,'2021-06-24 16:51:32','2021-06-24 16:51:32'),
(2,3,31,2,'2021-06-24 16:51:50','2021-06-24 16:51:50'),
(4,3,31,2,'2021-06-24 16:55:11','2021-06-24 16:55:11');

/*Table structure for table `test_schedules` */

DROP TABLE IF EXISTS `test_schedules`;

CREATE TABLE `test_schedules` (
  `test_schedule_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acad_year_id` bigint(20) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `max_user` int(11) DEFAULT 30,
  `active` tinyint(4) DEFAULT 1,
  `nt_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`test_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(15,3,'June 27 Batch 2 TESTING','2021-06-24 09:00:00','2021-06-25 10:00:00',100,1,NULL,'2021-06-21 16:31:38','2021-06-21 16:31:38'),
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
(32,3,'July 4 Batch 7','2021-07-04 15:00:00','2021-07-04 16:00:00',100,1,NULL,'2021-06-22 13:55:21','2021-06-22 14:56:36'),
(33,3,'July 5 Batch 1','2021-07-05 08:00:00','2021-07-05 09:00:00',100,1,NULL,'2021-06-22 13:56:32','2021-06-22 13:56:32'),
(34,3,'July 5 Batch 2','2021-07-05 09:00:00','2021-07-05 10:00:00',100,1,NULL,'2021-06-22 13:56:32','2021-06-22 13:57:58'),
(35,3,'July 5 Batch 3','2021-07-05 10:00:00','2021-07-05 11:00:00',100,1,NULL,'2021-06-22 13:57:36','2021-06-22 13:58:56'),
(36,3,'July 5 Batch 4','2021-07-05 11:00:00','2021-07-05 12:00:00',100,1,NULL,'2021-06-22 13:57:36','2021-06-22 13:59:11'),
(37,3,'July 5 Batch 5','2021-07-05 13:00:00','2021-07-05 14:00:00',100,1,NULL,'2021-06-22 14:00:38','2021-06-22 14:00:38'),
(38,3,'July 5 Batch 6','2021-07-05 14:00:00','2021-07-03 15:00:00',100,1,NULL,'2021-06-22 14:01:48','2021-06-22 14:50:24'),
(39,3,'July 5 Batch 7','2021-07-05 15:00:00','2021-07-05 16:00:00',100,1,NULL,'2021-06-22 14:02:27','2021-06-22 14:51:48'),
(40,3,'June 28 Batch 8','2021-06-28 16:00:00','2021-06-28 17:00:00',100,1,NULL,'2021-06-22 14:19:17','2021-06-22 14:26:29'),
(41,3,'June 29 Batch 1','2021-06-29 08:00:00','2021-06-29 09:00:00',100,1,NULL,'2021-06-22 14:19:59','2021-06-22 14:19:59'),
(42,3,'June 29 Batch 2','2021-06-29 09:00:00','2021-06-29 10:00:00',100,1,NULL,'2021-06-22 14:20:39','2021-06-22 14:20:39'),
(43,3,'June 29 Batch 3','2021-06-29 10:00:00','2021-06-29 11:00:00',100,1,NULL,'2021-06-22 14:21:11','2021-06-22 14:21:11'),
(44,3,'June 29 Batch 4','2021-06-29 11:00:00','2021-06-29 12:00:00',100,1,NULL,'2021-06-22 14:21:44','2021-06-22 14:21:44'),
(45,3,'June 29 Batch 5','2021-06-29 13:00:00','2021-06-29 14:00:00',100,1,NULL,'2021-06-22 14:22:25','2021-06-22 14:22:25'),
(46,3,'June 29 Batch 6','2021-06-29 14:00:00','2021-06-29 15:00:00',100,1,NULL,'2021-06-22 14:23:14','2021-06-22 14:23:34'),
(47,3,'June 28 Batch 6','2021-06-28 14:00:00','2021-06-28 15:00:00',100,1,NULL,'2021-06-22 14:27:03','2021-06-22 14:27:03'),
(48,3,'June 28 Batch 7','2021-06-28 15:00:00','2021-06-28 16:00:00',100,1,NULL,'2021-06-22 14:27:38','2021-06-22 14:27:38'),
(49,3,'June 29 Batch 7','2021-06-29 15:00:00','2021-06-29 16:00:00',30,1,NULL,'2021-06-22 14:28:23','2021-06-22 14:28:23'),
(50,3,'June 29 Batch 8','2021-06-29 16:00:00','2021-06-29 17:00:00',100,1,NULL,'2021-06-22 14:29:13','2021-06-22 14:29:13'),
(51,3,'July 6 Batch 1','2021-07-06 08:00:00','2021-07-06 09:00:00',100,1,NULL,'2021-06-22 14:29:55','2021-06-22 14:29:55'),
(52,3,'July 6 Batch 2','2021-07-06 09:00:00','2021-07-06 10:00:00',100,1,NULL,'2021-06-22 14:30:25','2021-06-22 14:30:25'),
(53,3,'July 6 Batch 3','2021-07-06 10:00:00','2021-07-06 11:00:00',100,1,NULL,'2021-06-22 14:31:36','2021-06-22 14:31:36'),
(54,3,'June 30 Batch 1','2021-06-30 08:00:00','2021-06-30 09:00:00',100,1,NULL,'2021-06-22 14:31:41','2021-06-22 14:31:41'),
(55,3,'June 30 Batch 2','2021-06-30 09:00:00','2021-06-30 10:00:00',100,1,NULL,'2021-06-22 14:32:11','2021-06-22 14:32:11'),
(56,3,'July 6 Batch 4','2021-07-06 11:00:00','2021-07-06 12:00:00',100,1,NULL,'2021-06-22 14:32:13','2021-06-22 14:32:45'),
(57,3,'June 30 Batch 3','2021-06-30 10:00:00','2021-06-30 11:00:00',100,1,NULL,'2021-06-22 14:32:49','2021-06-22 14:32:49'),
(58,3,'June 30 Batch 4','2021-06-30 11:00:00','2021-06-30 12:00:00',100,1,NULL,'2021-06-22 14:33:32','2021-06-22 14:33:32'),
(59,3,'July 6 Batch 5','2021-07-06 13:00:00','2021-07-06 14:00:00',100,1,NULL,'2021-06-22 14:33:59','2021-06-22 14:33:59'),
(60,3,'June 30 Batch 5','2021-06-30 13:00:00','2021-06-30 14:00:00',100,1,NULL,'2021-06-22 14:34:08','2021-06-22 14:34:08'),
(61,3,'July 6 Batch 6','2021-07-06 14:00:00','2021-07-06 15:00:00',100,1,NULL,'2021-06-22 14:34:41','2021-06-22 14:38:14'),
(62,3,'June 30 Batch 6','2021-06-30 14:00:00','2021-06-30 15:00:00',100,1,NULL,'2021-06-22 14:34:42','2021-06-22 14:34:42'),
(63,3,'June 30 Batch 7','2021-06-30 15:00:00','2021-06-30 16:00:00',100,1,NULL,'2021-06-22 14:35:35','2021-06-22 14:35:44'),
(64,2,'June 30 Batch 7','2021-06-30 16:00:00','2021-06-30 17:00:00',100,1,NULL,'2021-06-22 14:36:15','2021-06-22 14:36:15'),
(65,3,'July 1 Batch 1','2021-07-01 08:00:00','2021-07-01 09:00:00',100,1,NULL,'2021-06-22 14:36:58','2021-06-22 14:36:58'),
(66,3,'July 1 Batch 2','2021-07-01 09:00:00','2021-07-01 10:00:00',100,1,NULL,'2021-06-22 14:37:31','2021-06-22 14:37:31'),
(67,3,'July 1 Batch 3','2021-07-01 10:00:00','2021-07-01 11:00:00',100,1,NULL,'2021-06-22 14:38:07','2021-06-22 14:38:07'),
(68,3,'July 1 Batch 4','2021-07-01 11:00:00','2021-07-01 12:00:00',100,1,NULL,'2021-06-22 14:38:44','2021-06-22 14:38:44'),
(69,3,'July 1 Batch 5','2021-07-01 13:00:00','2021-07-01 14:00:00',100,1,NULL,'2021-06-22 14:39:28','2021-06-22 14:39:28'),
(70,3,'July 1 Batch 6','2021-07-01 14:00:00','2021-07-01 15:00:00',100,1,NULL,'2021-06-22 14:40:03','2021-06-22 14:40:03'),
(71,3,'July 1 Batch 7','2021-07-01 15:00:00','2021-07-01 16:00:00',100,1,NULL,'2021-06-22 14:40:57','2021-06-22 14:40:57'),
(72,3,'July 1 Batch 8','2021-07-01 16:00:00','2021-07-01 17:00:00',100,1,NULL,'2021-06-22 14:41:31','2021-06-22 14:41:31'),
(73,3,'July 2 Batch 1','2021-07-02 08:00:00','2021-07-02 09:00:00',100,1,NULL,'2021-06-22 14:42:59','2021-06-22 14:42:59'),
(74,3,'July 2 Batch 2','2021-07-02 09:00:00','2021-07-02 10:00:00',100,1,NULL,'2021-06-22 14:43:34','2021-06-22 14:43:34'),
(75,3,'July 2 Batch 3','2021-07-02 10:00:00','2021-07-02 11:00:00',100,1,NULL,'2021-06-22 14:44:12','2021-06-22 14:44:12'),
(76,3,'July 2 Batch 4','2021-07-02 11:00:00','2021-07-02 12:00:00',100,1,NULL,'2021-06-22 14:45:03','2021-06-22 14:45:03'),
(77,3,'July 2 Batch 5','2021-07-02 13:00:00','2021-07-02 14:00:00',100,1,NULL,'2021-06-22 14:47:00','2021-06-22 14:47:00'),
(78,3,'July 2 Batch 6','2021-07-02 14:00:00','2021-07-02 15:00:00',100,1,NULL,'2021-06-22 14:48:24','2021-06-22 14:48:24'),
(79,3,'July 2 Batch 7','2021-07-02 15:00:00','2021-07-02 16:00:00',100,1,NULL,'2021-06-22 14:49:02','2021-06-22 14:49:02'),
(80,3,'July 2 Batch 8','2021-07-02 16:00:00','2021-07-02 17:00:00',100,1,NULL,'2021-06-22 14:49:56','2021-06-22 14:49:56'),
(81,3,'July 3 Batch 1','2021-07-03 08:00:00','2021-07-03 09:00:00',100,1,NULL,'2021-06-22 14:51:02','2021-06-22 14:51:02'),
(82,3,'July 3 Batch 2','2021-07-03 09:00:00','2021-07-03 10:00:00',100,1,NULL,'2021-06-22 14:51:27','2021-06-22 14:51:27'),
(83,3,'July 3 Batch 3','2021-07-03 10:00:00','2021-07-03 11:00:00',100,1,NULL,'2021-06-22 14:52:12','2021-06-22 14:52:12'),
(84,3,'July 5 Batch 8','2021-07-05 16:00:00','2021-07-05 17:00:00',100,1,NULL,'2021-06-22 14:52:42','2021-06-22 14:52:42'),
(85,3,'July 3 Batch 4','2021-07-03 11:00:00','2021-07-03 12:00:00',100,1,NULL,'2021-06-22 14:52:43','2021-06-22 14:52:43'),
(86,3,'July 3 Batch 5','2021-07-03 13:00:00','2021-07-03 14:00:00',100,1,NULL,'2021-06-22 14:53:24','2021-06-22 14:53:24'),
(87,3,'July 3 Batch 6','2021-07-03 14:00:00','2021-07-03 15:00:00',100,1,NULL,'2021-06-22 14:54:00','2021-06-22 14:54:00'),
(88,3,'July 3 Batch 7','2021-07-03 15:00:00','2021-07-03 16:00:00',100,1,NULL,'2021-06-22 14:54:41','2021-06-22 14:54:41'),
(89,3,'July 3 Batch 8','2021-07-03 16:00:00','2021-07-03 17:00:00',100,1,NULL,'2021-06-22 14:55:47','2021-06-22 14:55:47'),
(90,3,'July 4 Batch 8','2021-07-04 16:00:00','2021-07-04 17:00:00',100,1,NULL,'2021-06-22 14:58:27','2021-06-22 14:58:27'),
(91,3,'July 6 Batch 7','2021-07-06 15:00:00','2021-07-06 16:00:00',100,1,NULL,'2021-06-22 15:00:51','2021-06-22 15:00:51'),
(92,3,'July 6 Batch 8','2021-07-06 16:00:00','2021-07-06 17:00:00',100,1,NULL,'2021-06-22 15:02:03','2021-06-22 15:02:03'),
(93,3,'July 7 Batch 1','2021-07-07 08:00:00','2021-07-07 09:00:00',100,1,NULL,'2021-06-22 15:02:44','2021-06-22 15:02:44'),
(94,3,'July 7 Batch 2','2021-07-07 09:00:00','2021-07-07 10:00:00',100,1,NULL,'2021-06-22 15:03:26','2021-06-22 15:03:26'),
(99,3,'July 7 Batch 3','2021-07-07 10:00:00','2021-07-07 11:00:00',100,1,NULL,'2021-06-22 15:04:12','2021-06-22 15:04:12'),
(100,3,'July 7 Batch 4','2021-07-07 11:00:00','2021-07-07 12:00:00',100,1,NULL,'2021-06-22 15:04:46','2021-06-22 15:05:00'),
(102,3,'July 7 Batch 5','2021-07-07 13:00:00','2021-07-07 14:00:00',100,1,NULL,'2021-06-22 15:05:38','2021-06-22 15:05:38'),
(103,3,'July 7 Batch 6','2021-07-07 14:00:00','2021-07-07 15:00:00',100,1,NULL,'2021-06-22 15:06:13','2021-06-22 15:06:13'),
(104,3,'July 7 Batch 7','2021-07-07 15:00:00','2021-07-07 16:00:00',100,1,NULL,'2021-06-22 15:06:51','2021-06-22 15:06:51'),
(105,3,'July 7 Batch 8','2021-07-07 16:00:00','2021-07-07 17:00:00',100,1,NULL,'2021-06-22 15:07:29','2021-06-22 15:07:29'),
(106,3,'July 8 Batch 1','2021-07-08 08:00:00','2021-07-08 09:00:00',100,1,NULL,'2021-06-22 15:08:17','2021-06-22 15:08:17'),
(107,3,'July 8 Batch 2','2021-07-08 09:00:00','2021-07-08 10:00:00',100,1,NULL,'2021-06-22 15:08:45','2021-06-22 15:08:45'),
(108,3,'July 8 Batch 3','2021-07-08 10:00:00','2021-07-08 11:00:00',100,1,NULL,'2021-06-22 15:09:10','2021-06-22 15:09:31'),
(109,3,'July 8 Batch 4','2021-07-08 11:00:00','2021-07-08 12:00:00',100,1,NULL,'2021-06-22 15:09:59','2021-06-22 15:09:59'),
(110,3,'July 8 Batch 5','2021-07-08 13:00:00','2021-07-08 14:00:00',100,1,NULL,'2021-06-22 15:10:29','2021-06-22 15:10:29'),
(111,3,'July 8 Batch 6','2021-07-08 14:00:00','2021-07-08 15:00:00',100,1,NULL,'2021-06-22 15:10:59','2021-06-22 15:10:59'),
(112,3,'July 8 Batch 7','2021-07-08 15:00:00','2021-07-08 16:00:00',100,1,NULL,'2021-06-22 15:11:31','2021-06-22 15:11:31'),
(114,3,'July 8 Batch 8','2021-07-08 16:00:00','2021-07-08 17:00:00',100,1,NULL,'2021-06-22 15:12:22','2021-06-22 15:12:22'),
(115,3,'July 9 Batch 1','2021-07-09 08:00:00','2021-07-09 09:00:00',100,1,NULL,'2021-06-22 15:12:58','2021-06-22 15:12:58'),
(116,3,'July 9 Batch 2','2021-07-09 09:00:00','2021-07-09 10:00:00',100,1,NULL,'2021-06-22 15:13:42','2021-06-22 15:13:42'),
(117,3,'July 9 Batch 3','2021-07-09 10:00:00','2021-07-09 11:00:00',100,1,NULL,'2021-06-22 15:14:26','2021-06-22 15:14:26'),
(118,3,'July 9 Batch 4','2021-07-09 11:00:00','2021-07-09 12:00:00',100,1,NULL,'2021-06-22 15:15:09','2021-06-22 15:15:09'),
(119,3,'July 9 Batch 5','2021-07-09 13:00:00','2021-07-09 14:00:00',100,1,NULL,'2021-06-22 15:15:37','2021-06-22 15:15:37'),
(120,3,'July 9 Batch 6','2021-07-09 14:00:00','2021-07-09 15:00:00',100,1,NULL,'2021-06-22 15:16:23','2021-06-22 15:16:23'),
(121,3,'July 9 Batch 7','2021-07-09 15:00:00','2021-07-09 16:00:00',100,1,NULL,'2021-06-22 15:16:51','2021-06-22 15:16:51'),
(122,3,'July 9 Batch 8','2021-07-09 16:00:00','2021-07-09 17:00:00',100,1,NULL,'2021-06-22 15:17:18','2021-06-22 15:17:18'),
(123,3,'July 10 Batch 1','2021-07-10 08:00:00','2021-07-10 09:00:00',100,1,NULL,'2021-06-22 15:18:14','2021-06-22 15:18:14'),
(124,3,'July 10 Batch 2','2021-07-10 09:00:00','2021-07-10 10:00:00',100,1,NULL,'2021-06-22 15:18:42','2021-06-22 15:19:21'),
(125,3,'July 10 Batch 3','2021-07-10 10:00:00','2021-07-10 11:00:00',100,1,NULL,'2021-06-22 15:19:13','2021-06-22 15:19:13'),
(126,3,'July 10 Batch 4','2021-07-10 11:00:00','2021-07-10 12:00:00',100,1,NULL,'2021-06-22 15:19:49','2021-06-22 15:19:49'),
(127,3,'July 10 Batch 5','2021-07-10 13:00:00','2021-07-10 14:00:00',100,1,NULL,'2021-06-22 15:20:14','2021-06-22 15:20:14'),
(128,3,'July 10 Batch 6','2021-07-10 14:00:00','2021-07-10 15:00:00',100,1,NULL,'2021-06-22 15:20:54','2021-06-22 15:20:54'),
(129,3,'July 10 Batch 7','2021-07-10 15:00:00','2021-07-10 16:00:00',100,1,NULL,'2021-06-22 15:21:26','2021-06-22 15:21:26'),
(130,3,'July 10 Batch 8','2021-07-10 16:00:00','2021-07-10 17:00:00',100,1,NULL,'2021-06-22 15:21:52','2021-06-22 15:21:52'),
(131,3,'July 11 Batch 1','2021-07-11 08:00:00','2021-07-11 09:00:00',100,1,NULL,'2021-06-22 18:32:36','2021-06-22 18:32:36'),
(132,3,'July 11 Batch 2','2021-07-11 09:00:00','2021-07-11 10:00:00',100,1,NULL,'2021-06-22 18:33:07','2021-06-22 18:33:07'),
(133,3,'July 11 Batch 3','2021-07-11 10:00:00','2021-07-11 11:00:00',100,1,NULL,'2021-06-22 18:33:52','2021-06-22 18:33:52'),
(134,3,'July 11 Batch 4','2021-07-11 11:00:00','2021-07-11 12:00:00',100,1,NULL,'2021-06-22 18:34:25','2021-06-22 18:34:25'),
(135,3,'July 11 Batch 5','2021-07-11 13:00:00','2021-07-11 14:00:00',100,1,NULL,'2021-06-22 18:35:19','2021-06-22 18:35:19'),
(136,3,'July 11 Batch 6','2021-07-11 14:00:00','2021-07-11 15:00:00',100,1,NULL,'2021-06-22 18:36:00','2021-06-22 18:36:00'),
(137,3,'July 11 Batch 7','2021-07-11 15:00:00','2021-07-11 16:00:00',100,1,NULL,'2021-06-22 18:36:45','2021-06-22 18:37:03'),
(138,3,'July 11 Batch 8','2021-07-11 16:00:00','2021-07-11 17:00:00',100,1,NULL,'2021-06-22 18:37:45','2021-06-22 18:43:56'),
(139,3,'July 12 Batch 1','2021-07-12 08:00:00','2021-07-12 09:00:00',100,1,NULL,'2021-06-22 18:38:35','2021-06-22 18:38:35'),
(140,3,'July 12 Batch 2','2021-07-12 09:00:00','2021-07-12 10:00:00',100,1,NULL,'2021-06-22 18:39:21','2021-06-22 18:39:21'),
(141,3,'July 12 Batch 3','2021-07-12 10:00:00','2021-07-12 11:00:00',100,1,NULL,'2021-06-22 18:40:20','2021-06-22 18:40:20'),
(142,3,'July 12 Batch 4','2021-07-12 11:00:00','2021-07-12 12:00:00',100,1,NULL,'2021-06-22 18:41:15','2021-06-22 18:41:15'),
(143,3,'July 12 Batch 5','2021-07-12 13:00:00','2021-07-12 14:00:00',100,1,NULL,'2021-06-22 18:42:07','2021-06-22 18:42:07'),
(144,3,'July 12 Batch 6','2021-07-12 14:00:00','2021-07-12 15:00:00',100,1,NULL,'2021-06-22 18:43:08','2021-06-22 18:45:03'),
(145,3,'July 12 Batch 7','2021-07-12 15:00:00','2021-07-12 16:00:00',100,1,NULL,'2021-06-22 18:45:56','2021-06-22 18:45:56'),
(146,3,'July 12 Batch 8','2021-07-12 16:00:00','2021-07-12 17:00:00',100,1,NULL,'2021-06-22 18:49:01','2021-06-22 18:49:01'),
(147,3,'July 13 Batch 1','2021-07-13 08:00:00','2021-07-13 09:00:00',100,1,NULL,'2021-06-22 18:49:33','2021-06-22 18:49:33'),
(148,3,'July 13 Batch 2','2021-07-13 09:00:00','2021-07-13 10:00:00',100,1,NULL,'2021-06-22 18:53:59','2021-06-22 18:53:59'),
(149,3,'July 13 Batch 3','2021-07-13 10:00:00','2021-07-13 11:00:00',100,1,NULL,'2021-06-22 18:54:48','2021-06-22 18:54:48'),
(150,3,'July 13 Batch 4','2021-07-13 11:00:00','2021-07-13 12:00:00',100,1,NULL,'2021-06-22 18:55:43','2021-06-22 18:55:43'),
(151,3,'July 13 Batch 5','2021-07-20 13:00:00','2021-07-13 14:00:00',100,1,NULL,'2021-06-22 18:58:17','2021-06-22 18:58:17'),
(152,3,'July 13 Batch 6','2021-07-13 14:00:00','2021-07-13 15:00:00',100,1,NULL,'2021-06-22 18:59:06','2021-06-22 18:59:06'),
(153,3,'July 13 Batch 7','2021-07-13 15:00:00','2021-07-13 16:00:00',100,1,NULL,'2021-06-22 18:59:52','2021-06-22 18:59:52'),
(154,3,'July 13 Batch 8','2021-07-13 16:00:00','2021-07-13 17:00:00',100,1,NULL,'2021-06-22 19:00:44','2021-06-22 19:00:44'),
(155,3,'July 14 Batch 1','2021-07-14 08:00:00','2021-07-14 09:00:00',100,1,NULL,'2021-06-22 19:01:27','2021-06-22 19:01:27'),
(156,3,'July 14 Batch 2','2021-07-14 09:00:00','2021-07-14 10:00:00',100,1,NULL,'2021-06-22 19:02:17','2021-06-22 19:02:17'),
(157,3,'July 14 Batch 3','2021-07-14 10:00:00','2021-07-14 11:00:00',100,1,NULL,'2021-06-22 19:03:05','2021-06-22 19:03:05'),
(158,3,'July 14 Batch 4','2021-07-14 11:00:00','2021-07-14 12:00:00',100,1,NULL,'2021-06-22 19:03:56','2021-06-22 19:03:56'),
(159,3,'July 14 Batch 5','2021-07-14 13:00:00','2021-07-14 14:00:00',100,1,NULL,'2021-06-22 19:05:32','2021-06-22 19:05:32'),
(160,3,'July 14 Batch 6','2021-07-14 14:00:00','2021-07-14 15:00:00',100,1,NULL,'2021-06-22 19:06:10','2021-06-22 19:06:10'),
(161,3,'July 14  Batch 7','2021-07-14 15:00:00','2021-07-14 16:00:00',100,1,NULL,'2021-06-22 19:06:51','2021-06-22 19:06:51'),
(162,3,'July 14 Batch 8','2021-07-14 16:00:00','2021-07-14 17:00:00',100,1,NULL,'2021-06-22 19:07:32','2021-06-22 19:07:32'),
(163,3,'July 15 Batch 1','2021-07-15 08:00:00','2021-07-15 09:00:00',100,1,NULL,'2021-06-22 19:08:58','2021-06-22 19:08:58'),
(164,3,'July 15 Batch 2','2021-07-15 09:00:00','2021-07-15 10:00:00',100,1,NULL,'2021-06-22 19:10:20','2021-06-22 19:10:20'),
(165,3,'July 15 Batch 3','2021-07-15 10:00:00','2021-07-15 11:00:00',100,1,NULL,'2021-06-22 19:11:08','2021-06-22 19:11:08'),
(166,3,'July 15 Batch 4','2021-07-15 11:00:00','2021-07-15 12:00:00',100,1,NULL,'2021-06-22 19:12:04','2021-06-22 19:12:04'),
(167,3,'July 15 Batch 5','2021-07-15 13:00:00','2021-07-15 14:00:00',100,1,NULL,'2021-06-22 19:13:11','2021-06-22 19:13:11'),
(168,3,'July 15 Batch 6','2021-07-15 14:00:00','2021-07-15 15:00:00',100,1,NULL,'2021-06-22 19:13:58','2021-06-22 19:13:58'),
(169,3,'July 15 Batch 7','2021-07-15 15:00:00','2021-07-15 16:00:00',100,1,NULL,'2021-06-22 19:14:53','2021-06-22 19:14:53'),
(170,3,'July 15 Batch 8','2021-07-15 16:00:00','2021-07-15 17:00:00',100,1,NULL,'2021-06-22 19:16:35','2021-06-22 19:16:35'),
(171,3,'July 16 Batch 1','2021-07-16 08:00:00','2021-07-16 09:00:00',100,1,NULL,'2021-06-22 19:18:33','2021-06-22 19:18:33'),
(172,3,'July 16 Batch 2','2021-07-16 09:00:00','2021-07-16 10:00:00',100,1,NULL,'2021-06-22 19:19:43','2021-06-22 19:19:43'),
(173,3,'July 16 Batch 3','2021-07-16 10:00:00','2021-07-16 11:00:00',100,1,NULL,'2021-06-22 19:20:50','2021-06-22 19:20:50'),
(174,3,'July 16 Batch 4','2021-07-16 11:00:00','2021-07-16 12:00:00',100,1,NULL,'2021-06-22 19:21:21','2021-06-22 19:21:21'),
(175,3,'July 16 Batch 5','2021-07-16 13:00:00','2021-07-16 14:00:00',100,1,NULL,'2021-06-22 19:22:02','2021-06-22 19:22:02'),
(176,3,'July 16 Batch 6','2021-07-16 14:00:00','2021-07-16 15:00:00',100,1,NULL,'2021-06-22 19:22:51','2021-06-22 19:22:51'),
(177,3,'July 16 Batch 7','2021-07-16 15:00:00','2021-07-16 16:00:00',100,1,NULL,'2021-06-22 19:23:38','2021-06-22 19:23:38'),
(178,3,'July 16 Batch 8','2021-07-16 16:00:00','2021-07-16 17:00:00',100,1,NULL,'2021-06-22 19:25:22','2021-06-22 19:25:22'),
(179,3,'July 17 Batch 1','2021-07-17 08:00:00','2021-07-17 09:00:00',100,1,NULL,'2021-06-22 19:25:22','2021-06-22 19:26:14'),
(180,3,'July 17 Batch 2','2021-07-17 09:00:00','2021-07-17 10:00:00',100,1,NULL,'2021-06-22 19:25:25','2021-06-22 19:26:49'),
(181,3,'July 17 Batch 3','2021-07-17 10:00:00','2021-07-17 11:00:00',100,1,NULL,'2021-06-22 19:28:21','2021-06-22 19:28:21'),
(182,3,'July 17 Batch 4','2021-07-17 11:00:00','2021-07-17 12:00:00',100,1,NULL,'2021-06-22 19:28:55','2021-06-22 19:28:55'),
(183,3,'July 17 Batch 5','2021-07-17 13:00:00','2021-07-17 14:00:00',100,1,NULL,'2021-06-22 19:29:26','2021-06-22 19:29:26'),
(184,3,'July 17 Batch 6','2021-07-17 14:00:00','2021-07-17 15:00:00',100,1,NULL,'2021-06-22 19:30:15','2021-06-22 19:30:15'),
(185,3,'July 17 Batch 7','2021-07-17 15:00:00','2021-07-17 16:00:00',100,1,NULL,'2021-06-22 19:30:49','2021-06-22 19:30:49'),
(186,3,'July 17 Batch 8','2021-07-17 16:00:00','2021-07-17 17:00:00',100,1,NULL,'2021-06-22 19:31:26','2021-06-22 19:31:26');

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
  `learning_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`lname`,`fname`,`mname`,`sex`,`status`,`bdate`,`birthplace`,`contact_no`,`email`,`first_program_choice`,`second_program_choice`,`learning_mode`,`last_school_attended`,`province`,`city`,`barangay`,`barangay_id`,`street`,`email_verified_at`,`password`,`role`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','AMPARADO','ETIENNE','N','MALE',NULL,'0000-00-00','','','admin@pretest.org',NULL,NULL,NULL,NULL,'','','',0,NULL,NULL,'$2y$10$qUBiPW/OcneJU3SyVCd/besWbz.YA.6tJmteKxm1B7sZFgfyVL/mW','ADMINISTRATOR',NULL,NULL,NULL),
(7,'bernalou','Sumalinog','Bernice Jovel','Sabillo','FEMALE','NEW','2021-06-14','Cebu City','09654005667','sumalinog.bernice@gmail.com','AB POLSCI','AB ENGLISH',NULL,NULL,'Misamis Occidental','Tangub City','Maloro',26262,'Roses','2021-06-21 11:39:34','$2y$10$mFXZdiUV326XjU1Z9meaNesBItlp9OMFd1Gm47KwThxnbu45OdHSm','STUDENT',NULL,'2021-06-21 11:38:52','2021-06-21 11:39:34'),
(8,'bernalouz','Sumalinog','Bernice','Sabillo','FEMALE','NEW','2020-08-24','Cebu City','09654005667','jinjahappybeej@gmail.com','AB POLSCI','AB ENGLISH',NULL,NULL,'Aurora','Maria Aurora','Bayanihan',2737,'Gangnamdong','2021-06-21 11:59:23','$2y$10$tmzhH6T5tEOltMuksNfGWeC6UIhMCp0MlnTaqSrxoeHM0m8tphz5O','STUDENT',NULL,'2021-06-21 11:58:59','2021-06-21 11:59:23'),
(9,'chriztino','Gerona','Chriztino','Murallon','MALE','NEW','1998-05-27','San Apolinario, Tangub City','09462931962','chriztino.gerona@gmail.com','AB ENGLISH','AB POLSCI',NULL,NULL,'Misamis Occidental','Tangub City','San Apolinario',26276,'1','2021-06-21 12:04:29','$2y$10$SpdNQCuOL86wsgL3yc9z/.JSksvossCDMc3yojIGmFq2ai1AbRdwK','STUDENT',NULL,'2021-06-21 12:03:53','2021-06-21 12:04:29'),
(13,'Jessel Zapanta','Zapanta','Jessel','Lomongo','MALE','NEW','2002-10-09','Ozamiz City','09300192172','jesselzapanta9@gmail.com','BSCS','BSCS','BLENDED',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'4','2021-06-23 11:11:28','$2y$10$vyOWhVJ.nXKlNCuxAzcY.uZvYsZvQKtaBAOAfLkNL.LetrnKOQzFW','STUDENT',NULL,'2021-06-23 11:10:59','2021-06-23 11:11:28'),
(14,'Edlencee','Illazar','Edlen','Calunia','FEMALE','NEW','2003-04-23','Iligan City','09466634538','edlenillazar32@gmail.com','AB POLSCI','BSBA-HRM','FULL ONLINE',NULL,'Lanao del Norte','Iligan City','Maria Cristina',19855,'Purok 30-A Zone 12','2021-06-23 16:24:14','$2y$10$sG50dyS72m/aFdhcsTv6OutYmJNk.WvlBWx2o5TItc1MO8uhR1.bG','STUDENT',NULL,'2021-06-23 16:22:32','2021-06-23 16:24:14'),
(15,'Juliana Alforque','Alforque','Juliana','Baguio','FEMALE','NEW','2003-06-21','Iligan City','09755112873','itsjulianaalforque@gmail.com','BS CRIM','BSED-MATH','FULL ONLINE',NULL,'Lanao del Norte','Iligan City','Ditucalan',19843,'47B, Jasmin St. NPC Compound','2021-06-23 16:24:56','$2y$10$lUF50Sv/e99hbWnvzyuDceCHbnntFut6DzdLJt/RX6xF2S72.6Vym','STUDENT',NULL,'2021-06-23 16:23:31','2021-06-23 16:24:56'),
(16,'Debie','Maypa','Debie','Alegado','FEMALE','NEW','2003-02-07','Ozamiz City','09380012128','debiealegadomaypa@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carmen',26104,'P-6 Carmen Annex Ozamiz City','2021-06-23 16:26:36','$2y$10$.SiDM7/a9wq/UEV9AtpFReZQ2TN1voABktt8lthLGxUBOX85I4Ydu','STUDENT',NULL,'2021-06-23 16:25:57','2021-06-23 16:26:36'),
(17,'09516528571','Fandida','May-Ann','Baronday','FEMALE','NEW','2001-05-08','Dupol,Bagumbang Bonifacio Misamis Occidental','09516528571','mayannfandida@gmail.com','BSED-SOCSTUD','BSED-SOCSTUD','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Bagumbang',25887,'Purok 6',NULL,'$2y$10$k10HPkJ8I7Rm3HLy9GbjoOIDI5G1CizM3ATzD4rStECB8BNIi2Z2a','STUDENT',NULL,'2021-06-23 16:26:53','2021-06-23 16:26:53'),
(18,'retsamc','CONING','RETSAM','DODO','MALE','TRANSFEREE','1989-11-22','TUDELA, MISAMIS OCCIDENTAL','09266473862','retsamc@gmail.com','AB POLSCI','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Barra',26291,'2','2021-06-23 16:28:26','$2y$10$2wW4xkiN2fxDN9lWQEyMRO10d29JfB8XbWeumHHzrC/BzFWD0TVfq','STUDENT',NULL,'2021-06-23 16:27:57','2021-06-23 16:28:26'),
(19,'cristelanntelesforo420@gmail.com @gmail.com','Telesforo','Cristel Ann','Jerez','FEMALE','NEW','2003-06-02','Maralag, Dumingag, Zamboanga del Sur','09380259847','cristelanntelesforo420@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Dumingag','San Pablo',40957,'7028','2021-06-23 16:31:12','$2y$10$nWg35cBWkiswzwCCXXm2xubEXihiru/fBP9j5l7G7EWBJQXIEq/N2','STUDENT','dJhfFe3NrasB9QqnyhGrOVxA2aYiqxB1sFUOzT2Sgii6aDS1nprerDE2jW49','2021-06-23 16:28:15','2021-06-24 05:55:43'),
(20,'delosatesserica@gmail.com','Delosa','Tess Erica','Ochia','FEMALE','NEW','2001-10-28','Maquilao, Tangub City, Misamis Occidental','09391867759','delosatesserica@gmail.com','BSED-ENGL','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok -3','2021-06-23 16:32:33','$2y$10$qbVOTtwcTRX4jRi.PZX47eCgLlpStvSX0weSPePYXgS5/c0L/C7sm','STUDENT',NULL,'2021-06-23 16:29:05','2021-06-23 16:32:33'),
(21,'Danica pagarita','Pagarita','Danica','Amarante','FEMALE','NEW','2003-03-28','Las Piñas City','09519483819','pagaritad@gmail.com','BSED-ENGL','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Barangay VI - Lower P',26244,'P3','2021-06-23 16:31:15','$2y$10$FaX55dUMHn95JL1rF6vfTeRqUumhFZNv9.IdD04X5/fSDrsrNwqP2','STUDENT',NULL,'2021-06-23 16:29:53','2021-06-23 16:31:15'),
(22,'Ivy Claire Macadildig','Macadildig','Ivy Claire','Labuga','FEMALE','NEW','2002-10-23','Bulatok Pagadian City','09187040376','macadildigarvemie@gmail.com','BEED','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Lumban',26261,'5',NULL,'$2y$10$eePypT4RXV1KAjHbuXTPOuYA8RxxYb5V9Daul0fJiwGDK6P.dNSQS','STUDENT',NULL,'2021-06-23 16:30:35','2021-06-23 16:30:35'),
(23,'trece41','Rodriguez','Mark','Fuentes','MALE','RETURNEE','1997-03-01','Tangub City','09610548556','kramzuegirdor@gmail.com','BSED-ENGL','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','San Apolinario',26276,'Purok 4 / Magsaysay St','2021-06-23 16:31:02','$2y$10$sVfhBkCNlHZiycuoy.xWhOf0VlFWzGXDL86i3Jt7HQFw2sy4785ge','STUDENT',NULL,'2021-06-23 16:30:46','2021-06-23 16:31:02'),
(24,'itsmecrystian5@gmail.com','Bagonggong','Crystian','Narbasa','MALE','NEW','2003-06-05','San Jose, Mahayag, Zamboanga del Sur','09129047020','itsmecrystian5@gmail.com','BSED-ENGL','BSED-SOCSTUD','BLENDED',NULL,'Zamboanga del Sur','Mahayag','San Jose',41102,'PUROK 1','2021-06-23 16:41:47','$2y$10$k/KiyuV72snPn.IzHFzSkOIUHsFpV9qKvdKzgmOq3zyPBMzFnxtoG','STUDENT',NULL,'2021-06-23 16:32:55','2021-06-23 16:41:47'),
(25,'margarettegonzaga93@gmail.com','Gonzaga','Margarette','Macarayo','FEMALE','NEW','2021-06-20','Barangay 3, Tangub City','09552763780','margarettegonzaga93@gmail.com','BSED','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Mantic',26264,'2','2021-06-23 16:36:28','$2y$10$730aYEotqxCdxL5UQfXJMebEqLFuaOvQnGZWWSNB1FLWSNudIA35i','STUDENT',NULL,'2021-06-23 16:32:57','2021-06-23 16:36:28'),
(26,'myradorothy','Cordova','Myra Dorothy','Melendrez','FEMALE','NEW','2002-06-09','Ozamiz City','09515723393','myradorothycordova79@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Purok 2','2021-06-23 16:35:31','$2y$10$j1o4QOLCz4TkbyNPcQP8LOuvBYc3KxhiUBPTItEmSAbT.TQ8GNWAG','STUDENT',NULL,'2021-06-23 16:35:06','2021-06-23 16:35:31'),
(27,'Ogim4321','CATACUTAN','ROD JAMES','AMOMONPON','MALE','NEW','2002-03-24','Kolambugan Hospital','09354349321','ogim4321@gmail.com','BEED','BSCS','FULL ONLINE',NULL,'Lanao del Norte','Kolambugan','Pantar',19939,'P2','2021-06-23 16:37:49','$2y$10$LFS5pnl1GXNxZ9XTEKPKDe.oXKLz4lzOOGIrFSBiJyH8CZYoGA4l.','STUDENT',NULL,'2021-06-23 16:36:20','2021-06-23 16:37:49'),
(28,'JungieCaburog','Caburog Jr.','Jungie','Sonajo','MALE','NEW','2001-03-30','Tangub City','09126880379','caburogjungie@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'Purok 2',NULL,'$2y$10$xMJGrsN415oX/wwug3wgdOPr.WI0V/jqKFsqEzUzD9uMRMy4Wbn7a','STUDENT',NULL,'2021-06-23 16:37:25','2021-06-23 16:37:25'),
(29,'Alexyzkyle','Quitat','Alex Kyle','Lackar','MALE','NEW','2003-10-24','Cagayan De Oro, Misamis Oriental','09611890332','quitatalexkyle@gmail.com','BS CRIM','BSED-ENGL','BLENDED',NULL,'Lanao del Sur','Malabang','Matalin',20875,'5','2021-06-23 16:38:48','$2y$10$B7MLX3dg8P9s2Xh1NnArOeNLhfxOb9k5PxmYv3LfFJktFEVyJCD7.','STUDENT',NULL,'2021-06-23 16:38:24','2021-06-23 16:38:48'),
(30,'maemagdalin.rivera@edu.ph','Rivera','Mae Magdalin',NULL,'FEMALE','TRANSFEREE','2002-05-18','Osamiz City','09505790606','dalinpacsa@gmail.com','BSED','BEED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tinago',26139,'Malig-on','2021-06-23 16:39:16','$2y$10$4F/eod/ZDwzuoE1ZxAjclOF7yqxHnYA7GbuefdW/fkFx5p8VPVGve','STUDENT',NULL,'2021-06-23 16:38:29','2021-06-23 16:39:16'),
(31,'eshen','AMPARADO','ETIENNE','','MALE','NEW','2021-06-23','BAROY','0916','etiennewayne@gmail.com','BSED-SOCSTUD','BSOA','FULL ONLINE',NULL,'Bulacan','Obando','Hulo',6642,NULL,'2021-06-23 16:45:11','$2y$10$avSgouh7xgvXnII4o2BbMuDtfFEK.ab4gPK34XYJkCya3vk7c2eii','STUDENT',NULL,'2021-06-23 16:41:09','2021-06-23 16:45:11'),
(32,'judieann.panares@gmail.com','PAñARES','JUDIE ANN','CONJE','FEMALE','NEW','2000-09-27','PAGADIAN CITY','09061822518','judieann.panares@gmail.com','BSED','BSOA','BLENDED',NULL,'Zamboanga del Sur','Pagadian City','Banale',41190,'Mauswagon','2021-06-23 16:43:00','$2y$10$gnUPTbAGKNblESG5Ehy9QelREAN8BydpE9vmhDAcb/cpLOUnQB3ke','STUDENT',NULL,'2021-06-23 16:41:24','2021-06-23 16:43:00'),
(33,'lumiganmarygrace@gmail.com','LUMIGAN','MARY GRACE','LATA','FEMALE','TRANSFEREE','1997-11-03','BRGY.1 TANGUB CITY','09515713706','lumiganmarygrace@gmail.com','GEN  MID','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','San Apolinario',26276,'Purok 2',NULL,'$2y$10$vADypQqal7Lgf7zF028Dp.ghpLHQhVEv6tKrViKj7qVx29yA8mpnu','STUDENT',NULL,'2021-06-23 16:41:53','2021-06-23 16:41:53'),
(34,'Zacchaeusa','MACADILDIG','IVY CLAIRE','LABUGA','FEMALE','NEW','2002-10-23','BULATOK PAGADIAN CITY','09187040375','ivyclairemacadildig@gmail.com','BEED','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Lumban',26261,'5','2021-06-23 16:42:37','$2y$10$QHyqkAQ/kpQKfrnu6/bYFePOkcFqEQLYlOBMTwWlltPUrFM9gfPca','STUDENT',NULL,'2021-06-23 16:42:00','2021-06-23 16:42:37'),
(35,'windelaranas','ARANAS','WINDEL','MUTIA','FEMALE','NEW','2003-04-25','PALAYAN ALORAN MISAMIS OCCIDENTAL','09635591166','windelaranas24@gmail.com','AB ENGLISH','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Aloran','Palayan',25858,'Purok 4','2021-06-23 16:48:28','$2y$10$uuQQ4b3ToNCDrVieJm8by.972jV1.gvvu9UKWIGggXg2nnNDzOOyG','STUDENT',NULL,'2021-06-23 16:44:09','2021-06-23 16:48:28'),
(36,'Lagas','LAGAS','JOLLIANE ED ANGELA','','FEMALE','TRANSFEREE','2002-07-08','CAGAYAN DE ORO','09387362686','Jollianelagas@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Aguada',26091,'Purok 5, Circumferential Road','2021-06-24 11:50:29','$2y$10$hnbKugjmS0e8ancU/LX19u2ki97WYaeNfE7d3vAFzyON0g20yqtPe','STUDENT','nbZfmnQr2ttRtpYxnng5rrQJkY9BMjCnNc5dDQTUEAoyffKQwi1BkOjGs9oh','2021-06-23 16:44:33','2021-06-24 11:50:29'),
(37,'delosalhealeigh@gmail.com','DELOSA','LHEA LEIGH','PONGADOM','FEMALE','NEW','2003-01-05','MAQUILAO, TANGUB CITY','09661875290','delosalhealeigh@gmail.com','BSED-FIL','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok-3','2021-06-23 16:45:10','$2y$10$jNehjfItw8PYsblpZcMih.fy92FfdkNMyJke2LZbmAhrOyqIC6O82','STUDENT',NULL,'2021-06-23 16:44:41','2021-06-23 16:45:10'),
(38,'Alfredmontano2002@gmail.com','MONTANO','ALFRED','MAMAC','MALE','NEW','2002-07-30','PUROK-5 DIGSON BONIFACIO, MISAMIS OCCIDENTAL','09093289490','Alfredmontano2002@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Digson',25894,'Purok-5','2021-06-23 16:47:58','$2y$10$yoFbxXWAW36//bamhE8UkeNn8eIY7LGr2VyHWp6j3ff9RVvbbKkom','STUDENT',NULL,'2021-06-23 16:45:04','2021-06-23 16:47:58'),
(39,'AngelGacasan','GACASAN','ANGEL IANETTE','CARCUEVA','FEMALE','NEW','2002-05-29','TANGUB CITY','09384890486','gacasanangel8@gmail.com','BSED-ENGL','BSED-MATH','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Upper Landing',40965,'Purok 1','2021-06-23 16:46:15','$2y$10$whEzfqlQU.g1Bkcy556T0.bgJKcwY2wa6xYyIC0UfsiSALRT/G1QG','STUDENT',NULL,'2021-06-23 16:45:20','2021-06-23 16:46:15'),
(40,'Edsel Potutan','POTUTAN','EDSEL','PANGASIAN','MALE','NEW','2002-07-28','OROQUIETA CITY','+639460551600','edselpotutan@gmail.com','BS CRIM','BSOA','BLENDED',NULL,'Misamis Occidental','Aloran','Maular',25853,'Purok 1',NULL,'$2y$10$/sD4./9RB2esno0XlwuBaeHC4Y.sHj3uZXWCk.LQoEL9g7g5CpijG','STUDENT',NULL,'2021-06-23 16:45:51','2021-06-23 16:45:51'),
(41,'Crystel Jeanne Siosan','SIOSAN','CRYSTEL JEANNE','','FEMALE','NEW','2003-07-01','SUDLON, PUROK 3 MOLAVE ZAMBOANGA DEL SUR','09092912867','crysteljeannes@gmail.com','BS CRIM','BSED-ENGL','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Purok Dominggo','2021-06-23 16:46:53','$2y$10$iUawYfa.EU9OHGiwonPFNO72snb0tbOlCwJDdHUVJJpbH.tjaiZxO','STUDENT',NULL,'2021-06-23 16:46:07','2021-06-23 16:46:53'),
(42,'Lucy Marie','BASMAYOR','LUCY MARIE','PANSACALA','FEMALE','NEW','2001-11-20','OZAMIS CITY','09506223353','lucymariebasmayor55@gmail.com','BSED','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'Purok 1-A','2021-06-23 16:46:38','$2y$10$o5/ohAaCMI1pz54wl6Vgg.hk9aTle8tr7A1dUQbaSS7yfCuSJZRJK','STUDENT',NULL,'2021-06-23 16:46:13','2021-06-23 16:46:38'),
(43,'Mjsevillejo16','SEVILLEJO','MARIEJOH','SORIANO','FEMALE','NEW','2003-05-18','OZAMIS CITY','09518837670','mjsevillejo16@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 3 Bañadero Highway Ozamis City','2021-06-23 16:50:24','$2y$10$oTtMmyWBHeBiWdWECK6Xq.S2eqiujdV8a64EMWAkz/zGFSfQOlA5m','STUDENT',NULL,'2021-06-23 16:46:19','2021-06-23 16:50:24'),
(44,'christyriosmaglasang@gmail.com','RIOS','CHRISTY','BUDIONGAN','FEMALE','NEW','2002-07-19','TANGUB CITY, MISAMIS OCCIDENTAL','09059231879','christyriosmaglasang@gmail.com','GEN  MID','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Mantic',26264,'Purok-5','2021-06-23 16:50:52','$2y$10$qM3mOrJZQVN84WdhXj8Gr.dd6u4xx7Wi1sM/oI0TGMJJhpxTM8ht.','STUDENT',NULL,'2021-06-23 16:47:12','2021-06-23 16:50:52'),
(45,'Airish Pingki-an','PINGKI-AN','IRIS','SOLUSOD','FEMALE','NEW','2002-10-10','P-4 LUTAO PANAON MISAMIS OCCIDENTAL','09457664962','irispingkian123@gmail.com','BEED','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Panaon','Lutao',26145,'Purok 4','2021-06-23 16:49:18','$2y$10$TPhPoiIfuCm3HvQggd.fBu5LgkiJ3rWaSP2CDo0ZgiA9QEl9UBuRG','STUDENT',NULL,'2021-06-23 16:48:47','2021-06-23 16:49:18'),
(46,'retuyaregielyn@gmail.com','RETUYA','REGIELYN','LOMOLJO','FEMALE','NEW','2003-11-20','KAUSWAGAN LANAO DEL NORTE','09639394404','retuyaregielyn@gmail.com','GEN  MID','AB COMM','BLENDED',NULL,'Misamis Occidental','Tangub City','Guinalaban',26254,'Purok 1','2021-06-23 16:50:44','$2y$10$mFEiE9k7jOXxIhMPOgQq7elwKBBi2g0pvBDw2mawj8DGHm5Ap.wPG','STUDENT',NULL,'2021-06-23 16:50:14','2021-06-23 16:50:44'),
(47,'michelleanntabalba@gmail.com','TABALBA','MICHELLE ANN','DEL VALLE','FEMALE','NEW','2002-12-28','PUROK 2 BALUC TANGUB CITY','09776239597','michelleanntabalba@gmail.com','BSED','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Baluk',26237,'Purok 2 Baluc Tangub City','2021-06-23 17:07:12','$2y$10$XVdWSxLgO0pGQHFmad1OxeiX3Ydnm30rlxi2s/Dgs0cYdNcgFRHYm','STUDENT',NULL,'2021-06-23 16:50:24','2021-06-23 17:07:12'),
(48,'betangholmj41@gmail.com','BETANGHOL','MJ','TABIBINA','MALE','NEW','2003-01-21','MOPH','09501241907','betangholmj41@gmail.com','BSBA-MM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Langcangan Upper',26062,'PUROK-7 UPPER LANGCANGAN OROQUIETA CITY','2021-06-23 16:51:16','$2y$10$SYZYFEjvD.QlfIJ/x9h45.vWm2CqmmaK0AUZD3bUmJTSkgtxy2TLq','STUDENT',NULL,'2021-06-23 16:50:38','2021-06-23 16:51:16'),
(49,'Marve joy suico','SUICO','MARVE JOY','SUICO','FEMALE','RETURNEE','2000-08-12','LOWER SALUG DAKU MAHAYAG ZAMBOANGA DEL SUR','09566299955','marvejoy07@gmail','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lower Salug Daku',41091,'Purok 1 libra',NULL,'$2y$10$VQ9HlmtSwk2S6xkK2sROY.X09EG9iYZO.32PJzIFvlvqUgQxjRt2m','STUDENT',NULL,'2021-06-23 16:50:42','2021-06-23 16:50:42'),
(50,'Jinky Mei','LESONDRA','JINKY MEI','EGPAN','FEMALE','NEW','2003-05-19','TUKURAN ZAMBOANGA DEL SUR','09566243814','JinkymeiLesondra@gmail.com','BSED','BEED','FULL ONLINE',NULL,'Zamboanga del Sur','Tukuran','Santo Ni±o',41428,'Alibang-bang',NULL,'$2y$10$DwQkXAbauqmvp48DJNIsjemtJxw.XvMD02vW4RTfELpEiwgFCezF2','STUDENT',NULL,'2021-06-23 16:50:48','2021-06-23 16:50:48'),
(51,'Annie Rose Puagang','PUAGANG','ANNIE ROSE','REBUCAS','FEMALE','NEW','2003-01-28','SAN ISIDRO MAHAYAG ZAMBOANGA DEL SUR','09612640931','annierosepuagang@gmail.com','BSBA-MM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Mahayag','San Isidro',41101,'Piña','2021-06-23 16:55:14','$2y$10$5Qg3C3b5mOto2qpYN0sSNe1wL8BoMuMscw3OFyqjmeIOVzW/K8xpq','STUDENT',NULL,'2021-06-23 16:51:10','2021-06-23 16:55:14'),
(52,'Nikka_jumawid','JUMAWID','NIKKA','ELOPRE','FEMALE','NEW','2002-02-11','OZAMIZ CITY,MISAMIS OCCIDENTAL','09462335938','Jumawidnikka13@gmail.com','BSOA','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok 2','2021-06-23 16:59:52','$2y$10$wcofc.x5whrGRUlD4MjLhOqrtLmSPrCsfjqHm7dMuhIsDftvhoT6G','STUDENT',NULL,'2021-06-23 16:51:18','2021-06-23 16:59:52'),
(53,'Jeric Mae Merida','MERIDA','JERIC MAE','ALONZO','FEMALE','NEW','2002-05-28','SAN ISIDRO MAHAYAG ZAMBOANGA DEL SUR','09381720391','mememerida137@gmail.com','GEN  MID','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 7','2021-06-23 16:52:47','$2y$10$l44CdVkKlL5P1xYFf3o0cu7UfM70008LTjAJPQgq6N4NEJVS3fzh.','STUDENT',NULL,'2021-06-23 16:51:22','2021-06-23 16:52:47'),
(54,'lennymaepanare17@gmail.com','PAñARES','LENNY MAE','TGHAP','FEMALE','NEW','2002-06-17','KAHAYAGAN, BAYOG ZAMBOANGA DEL SUR','09303200845','lennymaepanares17@gmail.com','BSOA','GEN  MID','BLENDED',NULL,'Misamis Occidental','Ozamis City','Maningcol',26128,'MANINGCOL','2021-06-23 16:52:47','$2y$10$Je/U7Ir3Aga97IvoiuXe6uEWpSjRQXpd6pLCVYpoIcxUnF4h5Bn9S','STUDENT','aKiRSGX8rrScv3Nb6LcHqorFMBEHtgptkR6pjhECtki9a2SLu69FyHnjtMXA','2021-06-23 16:51:28','2021-06-23 17:29:24'),
(55,'KristineJayAlo@gmail.com','ALO','KRISTINE JAY','BALDICANTOS','FEMALE','NEW','2002-10-05','SAPA LUBOC,AURORA,ZAMBOANGA DEL SUR','09516418213','KristineJayAlo@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 3','2021-06-23 16:52:35','$2y$10$4i9QfhFpeO0Zdm22g/VN8udv4dXJgGyFnPZa1zGKAorEV09O2HB7K','STUDENT',NULL,'2021-06-23 16:51:29','2021-06-23 16:52:35'),
(56,'sarahdupalag0@gmail.com','DUPAL-AG','SARAH JEAN','LAURE','FEMALE','NEW','2003-02-04','PUROK 5, POBLACION, MAHAYAG, ZAMBOANGA DEL SUR','09369185368','sarahdupalag0@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 2','2021-06-23 16:55:10','$2y$10$3SxzpwI0WhmF630XlbVXeOVkGD1KLrlp7XRtjfuBWvWWgkAImKgbe','STUDENT',NULL,'2021-06-23 16:51:34','2021-06-23 16:55:10'),
(57,'shelay_edoloverio','EDOLOVERIO','ASHLEY','MAHINAY','FEMALE','NEW','2002-11-25','MHARS GENERAL HOSPITAL OZAMIZ CITY','09617566829','edoloverioashley010@gmail.com','BS CRIM','BEED','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Colupan Bajo',26221,'Purok Sampaguita','2021-06-23 16:52:30','$2y$10$5Ak2roaFr6/uv4MXvVguw.a4WZDb8F8h1hIV.ukZVWcAjgxLRA6Uu','STUDENT',NULL,'2021-06-23 16:51:51','2021-06-23 16:52:30'),
(58,'Rainzell Mariam','DIZON','RAINZELL MARIAM','MENDEZ','FEMALE','TRANSFEREE','1998-12-30','OZAMIS CITY','09380324456','officiallyrainzelled@gmail.com','AB ENGLISH','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Baybay Santa Cruz',26097,'Purok 2','2021-06-23 16:52:49','$2y$10$knxAFtT6hu.EaYfbqxYfA.3C0vA72bz.YO4OxNHtY76t01mTRUHWm','STUDENT',NULL,'2021-06-23 16:52:18','2021-06-23 16:52:49'),
(59,'Desiree Rose','OPAMEN','DESIREE ROSE','SALINAS','FEMALE','NEW','2002-12-03','TANGUB CITY','09292626214','dysiryy120302@gmail.com','BSED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Tangub City','San Apolinario',26276,'Purok 7','2021-06-23 16:56:04','$2y$10$HT/ZL5pfvIwMbKY3AZqvDOfsaYSi/1AKJ07WVAT28l1zsyZLuTopm','STUDENT',NULL,'2021-06-23 16:52:27','2021-06-23 16:56:04'),
(60,'Kim123','SULO','KIMBERLY','SALDIVAR','FEMALE','NEW','2003-04-23','MHARS HOSPITAL OZAMIS CITY','09632826214','kimberly_sulo@yahoo.com','BSBA-HRM','AB COMM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok 5',NULL,'$2y$10$dV4P5KIHitfff93o3g7Kwu.lQ.uPvunv1Gz9VhU5G8fi0JWqunU1S','STUDENT',NULL,'2021-06-23 16:52:42','2021-06-23 16:52:42'),
(61,'lovelymae18','TALICTIC','LOVELY MAE','GUIRIGAY','FEMALE','NEW','2002-12-10','MOLATUHAN BAJO LOPEZ JAENA MISAMIS OCCIDENTAL','09482030447','lovelymaetalictic5@gmail.com','BSBA-MM','BSCS','BLENDED',NULL,'Misamis Occidental','Lopez Jaena','Molatuhan Bajo',26036,'P-2','2021-06-23 16:54:34','$2y$10$.2NTt4iXmafBb3vTaQEQDehlER19kvEPVaeaWZhfX8cpA5Vb0X6cG','STUDENT',NULL,'2021-06-23 16:53:19','2021-06-23 16:54:34'),
(62,'Alcher sigara','SIGARA','ALCHER','IBO','MALE','NEW','2021-10-21','TUBARAN TUBOD LANAO DEL NORTE','09514713140','alchersigara21@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Tubod','Tubaran',20279,'Purok 2','2021-06-23 16:54:55','$2y$10$Xu.CTmeJbMwgxNJJnFWM8.jqkEQDKfoDsWri170277baGdauaJqGK','STUDENT',NULL,'2021-06-23 16:53:26','2021-06-23 16:54:55'),
(63,'11jhondula@gmail.com','DULA','JHON REYMAR','LLENES','MALE','NEW','2002-09-11','KINANGAY NORTE CLARIN MISAMIS OCCIDENTAL','09387045804','11jhondula@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Kinangay Norte',25945,'2','2021-06-23 16:54:12','$2y$10$koaBNY6o7xD324UM5CcCrOa3mNrjbXZDeXHqVhXXGjgV1YAk7uGrC','STUDENT',NULL,'2021-06-23 16:53:46','2021-06-23 16:54:12'),
(64,'Angelene Alamag','ALAMAG','ANGELENE','NAYON','FEMALE','NEW','2002-12-20','BRGY.V, TANGUB CITY','09187330407','angelene.alamag@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Garang',26252,'Purok 2','2021-06-23 17:25:02','$2y$10$alh6PjWDozlOjn6BJpxxJuj.llKVZZHdTg49Rvb6zZIhGMgAV5J32','STUDENT',NULL,'2021-06-23 16:54:21','2021-06-23 17:25:02'),
(65,'louwyji','JIMENEZ','LOUWYJI','PANES','FEMALE','TRANSFEREE','2003-02-04','MAHAYAG ZAMBOANGA DEL SUR','09518533680','louwyjijimenez@yahoo.com','BSCS','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Ramos Street','2021-06-23 16:55:04','$2y$10$3/Q/aW9torBo2I0sUHVFRu.FTvDfqwPNp33uMYfEUw.wQus1KOp36','STUDENT',NULL,'2021-06-23 16:54:29','2021-06-23 16:55:04'),
(66,'Johannievictoriano','VICTORIANO','JOHANNIE','DORONA','FEMALE','NEW','2002-06-09','UPPER TIMONAN DUMINGAG ZAMBOANGA DELSUR','09514892310','johannievictoriano@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Upper Timonan',40966,'Purok-7','2021-06-23 16:58:47','$2y$10$3vCEHuJVdKdGf/dqlsfGG./KGNR3tn06PF3LBhXrwxMfO/kdVBoxu','STUDENT',NULL,'2021-06-23 16:54:59','2021-06-23 16:58:47'),
(67,'Danzel Mae_Masicampo','MASICAMPO','DANZEL MAE','RIVERA','FEMALE','NEW','2003-06-03','OZAMIS CITY','09124578218','danzelmae.masicampo@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'Purok 1','2021-06-23 16:56:35','$2y$10$oj671aI9P0s.4kL/I1XXF.poLW95297yaemFCeThQN.92ovzdudTC','STUDENT',NULL,'2021-06-23 16:54:59','2021-06-23 16:56:35'),
(68,'Shirly Libatog','LIBATOG','SHIRLY','AGUINID','FEMALE','NEW','2001-04-05','DALAMA, BAROY, LANAO DEL NORTE','09517916709','shinpatarlas@gmail.com','BSOA','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'Purok1, Urban Poor','2021-06-23 16:56:36','$2y$10$SiD4TYs5v0aFXg.S9VMQv.vWH87DJcUvfftGNN7f3bGrtheYBnlJG','STUDENT',NULL,'2021-06-23 16:55:14','2021-06-23 16:56:36'),
(69,'Sharlene Kaye Merida','MERIDA','SHARLENE KAYE','ALONZO','FEMALE','NEW','1998-11-10','MAHAYAG ZAMBOANGA DEL SUR','09309882080','sharlenekayealonzo98@gmail.com','GEN  MID','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 7',NULL,'$2y$10$WGrhO0KhFQQWcvvBG8L.KetYDfhW7gtto/l.5NjBMgXoZFWaGUSJS','STUDENT',NULL,'2021-06-23 16:55:16','2021-06-23 16:55:16'),
(70,'Royvincent13','SABALA','ROY VINCENT','CARRIAGA','MALE','NEW','2002-07-31','PUROK-MANGGAHON TINAGO OZAMIZ CITY','09074620211','royvincentsabala@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tinago',26139,'Purok-Manggahon Tinago','2021-06-23 16:56:21','$2y$10$vjwXM16HkKjbDvJw1fT.XuooObewtsp2E6gKE8e7g6SOT6kIuRD2e','STUDENT',NULL,'2021-06-23 16:55:27','2021-06-23 16:56:21'),
(71,'frelyncatacutan','CATACUTAN','FRELYN','VILLACANTOS','FEMALE','NEW','2003-02-08','MISAMIS UNIVERSITY MEDICAL CENTER','09979936181','Frelyncatacutan2@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Lanao del Norte','Kolambugan','Titunod',19949,'Purok 1','2021-06-23 16:56:59','$2y$10$S2xxd.xvHo0EOYqo6ktvHOiyeMiuCXnyGaXdt3upBNN50yAc4jkCO','STUDENT',NULL,'2021-06-23 16:55:39','2021-06-23 16:56:59'),
(72,'DarielDavid','TEJADA','DARIEL DAVID','ARCAYAN','MALE','NEW','2000-11-16','CLARIN MISAMIS OCCIDENTAL','09950078342','Stratmavis12@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Misamis Occidental','Clarin','Tinacla-An',25961,'Purok 3','2021-06-23 16:58:56','$2y$10$FtwLY1FzKhIDWd5sCKsgpOdUpggrmzY3EgMFRKABAVJurPMs0NOs.','STUDENT',NULL,'2021-06-23 16:56:26','2021-06-23 16:58:56'),
(73,'Jmharison21@gamil.com','PASCO','JOHNMAR','LUMIGUID','MALE','NEW','1997-02-05','LAS PIñAS METRO MANILA','09954985730','jmharison21@gmail.com','BSED-ENGL','BSED-ENGL','FULL ONLINE',NULL,'Zamboanga del Sur','Midsalip','Buloron',41131,'Purok-4','2021-06-23 16:57:57','$2y$10$rRV0LRJdoFYUtSUSK.BUlOu2ZXKrBPyh22E0yxYA4tKvGq0Oh0a8G','STUDENT',NULL,'2021-06-23 16:56:49','2021-06-23 16:57:57'),
(74,'regenbesabes86@gmail.com','BESABES','REGEN','JAPUS','FEMALE','NEW','2002-04-03','CARIDAD, DUMINGAG ZAMBOANGA DEL SUR','09661731938','regenbesabes86@gmail.com','BSBA-MM','BSED-MATH','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Caridad',40929,'1','2021-06-23 16:58:32','$2y$10$1saQsYvYw7jP3meuQQ4LP.UI6tIeuMK8KV1Nc4VE2hlC/ss57aaPC','STUDENT',NULL,'2021-06-23 16:57:41','2021-06-23 16:58:32'),
(75,'Sadsas','SABDUL','SADANEL PRINCESS','YTANG','FEMALE','NEW','2002-10-19','MOLAVE, ZAMBOANGA DEL SUR','09297600844','sadanelprincess@gmail.com','AB POLSCI','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Pagadian City','Banale',41190,'Purok Nangka','2021-06-23 16:59:04','$2y$10$Ldg7Vf7RWX.i1aae7Pagbex2x0ZsO97QOXnHx6UxEcYoRbAVXihG6','STUDENT',NULL,'2021-06-23 16:58:46','2021-06-23 16:59:04'),
(76,'shainecaminero','CAMINERO','SHAINE','CUBOL','FEMALE','NEW','2003-12-09','OZAMIS CITY','09639792522','shainecaminero@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Rizal',41180,'Mercury','2021-06-23 17:00:21','$2y$10$3.kl8.Ap6eFXDUnmjo9NNuhu/j51TQ1GgvSqL.blWkqSf7DyPLTgu','STUDENT',NULL,'2021-06-23 16:59:31','2021-06-23 17:00:21'),
(77,'ainoah','PONA','SHERYL','APALONG','FEMALE','NEW','1990-01-20','CAMBUCAD, VALENCIA, NEGROS ORIENTAL','09389315152','ainoahzephaniah724@gmail.com','GEN  MID','BEED','BLENDED',NULL,'Zamboanga del Sur','San Miguel','Poblacion',41296,'PUROK MELITON',NULL,'$2y$10$53.p2IBpBe1eT4ljromRg.bRHKJE.YUFFmgudN1930y.Qeq22y1cq','STUDENT',NULL,'2021-06-23 17:00:13','2021-06-23 17:00:13'),
(78,'Kimberly2021','SULO','KIMBERLY','SALDIVAR','FEMALE','NEW','2003-04-23','OZAMIZ CITY','09385853792','theonsaldivar@gmail.com','BSBA-HRM','AB COMM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok 5','2021-06-23 17:06:28','$2y$10$fq8YAjG/ohaWdybSRO3s4.SFBUmRdunw3yhA0GT2o4li.27iS4I4u','STUDENT',NULL,'2021-06-23 17:00:40','2021-06-23 17:06:28'),
(79,'Marve joy','SUICO','MARVE JOY','SUICO','FEMALE','RETURNEE','2000-08-12','LOWER SALUG DAKU MAHAYAG ZAMBOANGA DEL SUR','09566299955','marvejoy07@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lower Salug Daku',41091,'Purok 1 libra',NULL,'$2y$10$jMPZeHEhTluhgozx4Sjy6ObXfhXu61njQkiK026SDcRPyxsHYHKwa','STUDENT',NULL,'2021-06-23 17:01:24','2021-06-23 17:01:24'),
(80,'maryrosepaler12@gmail.com','PALER','MARY ROSE','OMAS-AS','FEMALE','NEW','2002-10-12','PUROK-7 KINANGAY NORTE CLARIN MISAMIS OCCIDENTAL','09108136164','maryrosepaler12@gmail.com','BSCS','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Kinangay Norte',25945,'Purok 7','2021-06-23 17:02:38','$2y$10$s3z0a.szZXHMnD8ps1DY5ua.wAMS/L/BlPzDzWEDIa9dIUXYBFbPa','STUDENT',NULL,'2021-06-23 17:02:07','2021-06-23 17:02:38'),
(81,'anncamunay@gmail.com','CAMUNAY','JUDY ANN','ADRESE','FEMALE','NEW','2002-07-20','SAN JUAN, PANAON, MISAMIS OCCIDENTAL','09683020616','anncamunay@gmail.com','BSOA','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Panaon','San Juan',26153,'Purok 2','2021-06-23 17:05:03','$2y$10$JQeNeIN3I1wrHrx6CIYyau5IGNezgUN3GXnjpjkH5fAAfAemu0uHC','STUDENT',NULL,'2021-06-23 17:02:49','2021-06-23 17:05:03'),
(82,'Rea Orbilla','ORBILLA','REA','M.','FEMALE','NEW','2003-04-09','KOLAMBUGAN','+639635602773','reamanaba295@gmail.com','BEED','BSCS','FULL ONLINE',NULL,'Lanao del Norte','Kolambugan','Pantar',19939,'Purok 2 Pantar','2021-06-23 17:07:40','$2y$10$bvcGKD7W9Ukr8wNwcrGEN.QidtgW8Q4zTGQ5TJUwknPfjZo68iMSK','STUDENT','Azj2dMyvYwyr0ak5HKp1FDw2VLkmAEPbri5m2dNAUmqozsFksmPIcVSs1wGh','2021-06-23 17:02:54','2021-06-23 17:07:40'),
(83,'diannecasile1@gmail.com','CASILE','DIANNA ROSE','DELOSA','FEMALE','NEW','2002-06-23','MAQUILAO, TANGUB CITY','09102914797','diannecasile1@gmail.com','BSED-FIL','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok 3','2021-06-23 17:03:21','$2y$10$bfnpSLvmLZG2UYu.HdNxkeyvv8Wm6sEjbhBrGy31inzqfchnWQ7dG','STUDENT',NULL,'2021-06-23 17:02:56','2021-06-23 17:03:21'),
(84,'edmargordiones08','GORDIONES','EDMAR','MORTES','MALE','TRANSFEREE','1999-07-20','CAMP 3, SALVADOR, LANAO DEL NORTE','09683014661','edmargordiones143@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Lanao del Norte','Baroy','Libertad',19817,'Purok 2',NULL,'$2y$10$DaxHPA.k93BHHh/xhiAhWu9d9YILZdlxlsJ5MO0AM.cp29QMS9ipC','STUDENT',NULL,'2021-06-23 17:04:40','2021-06-23 17:04:40'),
(85,'kaylapacana03@gmail.com','PACANA','KAYLA MARIE','NIEZ','FEMALE','NEW','2003-03-03','OZAMIS CITY, MISAMIS OCCIDENTAL','09460905275','kaylapacana03@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Capucao P.',26102,'Purok 3','2021-06-23 17:05:46','$2y$10$wgG1JAo2NiVB3a6qK.5ylOPljBQKMf7ERAsck8/2hLF4H7gXwcS.K','STUDENT',NULL,'2021-06-23 17:05:14','2021-06-23 17:05:46'),
(86,'Leonemay','COMPAYAN','LEONEMAY','AMAD','FEMALE','NEW','2003-01-31','GABUNON, TAMBULIG ZDS','09682849315','leonemaycompayan@gmail.com','AB POLSCI','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Gabunon',NULL,'$2y$10$Qt27LBaWQzN8a4KgPGGUTeMOsEjrpAjZMliC3zxBPlYIWeuSkOz8S','STUDENT',NULL,'2021-06-23 17:05:20','2021-06-23 17:05:20'),
(87,'KristineLargo','LARGO','KRISTINE MAE','TIMBAO','FEMALE','NEW','2002-08-06','MANGA TANGUB CITY','09272771447','largok61@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'Purok 1','2021-06-23 17:10:52','$2y$10$X25cCX2AZqWq.h2ZZTKlVeldWmr/eEJ/8Khay5B9nQlTO4bKxCGgK','STUDENT',NULL,'2021-06-23 17:06:19','2021-06-23 17:10:52'),
(88,'Jezellejoy','ROSCA','JEZZELLE JOY','SALUNOY','FEMALE','NEW','2003-07-31','GABUNON, TAMBULIG ZAMBOANGA DEL SUR','09516502216','jezzellejoyrosca26@gmail.com','BSBA-HRM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok 5',NULL,'$2y$10$nEuUVOXXEfMxCfV4fd8ps.ZNB4VzLWQ/SwIWpp18aSK73x2wd7rxi','STUDENT',NULL,'2021-06-23 17:06:21','2021-06-23 17:06:21'),
(89,'Cecile Villarubia','VILLARUBIA','CECILE','CABILAO','FEMALE','NEW','2003-03-01','KAHAYAGAN EAST, AURORA, ZAMBOANGA DEL SUR','09187304155','cecilevillarubia69@gmail.com','BSBA-HRM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Aurora','Kahayagan East',40788,'Purok San Francisco','2021-06-23 17:08:00','$2y$10$hkQ7GeIF8NJkS.92sIMBgue9qScP8X96T9cDZZWyg1lgqUnWv4dC2','STUDENT',NULL,'2021-06-23 17:07:17','2021-06-23 17:08:00'),
(90,'queencyaque69@gmail.com','AQUE','QUEENCY','PORNIA','FEMALE','NEW','2002-09-02','MAHAYAG ZAMBOANGA DEL SUR','09070485756','queencyaque69@gmail.com','BSBA-HRM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Sicpao',41105,'Purok 2','2021-06-23 17:09:06','$2y$10$qO0dmlN33w/Px0I2NVnGBes./BBIyhfujscnJSzrOPkOgiCrTzGiu','STUDENT',NULL,'2021-06-23 17:07:51','2021-06-23 17:09:06'),
(91,'justineeslit@gmail.com','ESLIT','JUSTINE','SAYSON','FEMALE','NEW','2002-07-13','DICOLOC JIMENEZ MISAMIS OCCIDENTAL','09486005851','justineeslit@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Jimenez','Dicoloc',25995,'Purok Ipil-ipil','2021-06-23 17:10:07','$2y$10$/nFo/G66UZa4imBRLHNkzeG/3yOmJqAfSu.mgVGEsU3lNoProlHMK','STUDENT',NULL,'2021-06-23 17:08:02','2021-06-23 17:10:07'),
(92,'molojenivie@gmail.com','MOLO','JENIVIE','SISO','FEMALE','NEW','2003-03-08','SILONGON TUDELA MISAMIS OCCIDENTAL','09464889574','molojenivie@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tudela','Silongon',26318,'Purok 3 Silongon Tudela Misamis Occidental','2021-06-23 17:26:56','$2y$10$piPggN.gvXr1bB/iR.7z0eEJjG.lEXRpPH8VCVYMi0kIY41jyxgxm','STUDENT',NULL,'2021-06-23 17:08:20','2021-06-23 17:26:56'),
(93,'Johnsenn Keth','LANTACA','JOHNSENN KETH','HERNANDO','MALE','NEW','2002-05-03','TUBOD, LANAO DEL NORTE','09675971493','lantacajohnsennketh@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Tangueguiron',20278,'Purok-3','2021-06-23 17:20:57','$2y$10$VCvlztlY49qSW7DzlnmCc.4dyBfH4Zpk5gc3cB/JngSQrQ4aSLl.G','STUDENT',NULL,'2021-06-23 17:08:48','2021-06-23 17:20:57'),
(94,'PopordzMaisog','MAISOG','RAFAEL PAUL','ENRIQUEZ','MALE','NEW','2002-10-02','MISAMIS OCCIDENTA PROVINCIAL HOSPITAL','09303632191','rafamaisog@yahoo.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Ibabao',25843,'Purok 2','2021-06-23 17:11:00','$2y$10$a89AY1lWE/Yy2JZuQvkS4.FlHchDQnEdeirbOou34/8QP4/WU2JsG','STUDENT',NULL,'2021-06-23 17:09:03','2021-06-23 17:11:00'),
(95,'Rhacher','MAGBAGO','RHACHER','PONGASI','MALE','NEW','2002-05-10','AURORA, ZAMBOANGA DEL SUR','09124353124','rhachermagbago1@gmail.com','BSED','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Kauswagan',26257,'Purok 6','2021-06-23 17:09:51','$2y$10$H//z95BscmMDopc.sJmUtOAzMWmeEUObZJCAizOZFADJN1M5CpvYS','STUDENT',NULL,'2021-06-23 17:09:03','2021-06-23 17:09:51'),
(96,'ainoahzephaniah','PONA','SHERYL','APALONG','FEMALE','NEW','1990-01-20','CAMBUCAD, VALENCIA, NEGROS ORIENTAL','09389315152','noahzephaniah@gmail.com','GEN  MID','BEED','FULL ONLINE',NULL,'Zamboanga del Sur','San Miguel','Poblacion',41296,'PUROK MELITON','2021-06-23 17:09:45','$2y$10$VTvKFfNrUnq8hXPE4bHtQO5mVUUClDbLJqkI1GSdBOT06DXIi5C4i','STUDENT',NULL,'2021-06-23 17:09:14','2021-06-23 17:09:45'),
(97,'babalorimae155@gmail.com','BABA','LORI MAE','ORDENIZA','FEMALE','NEW','2001-10-11','TITURON, TANGUB CITY','09754915072','babalorimae155@gmail.com','BSBA-MM','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Tituron',26287,'P-3',NULL,'$2y$10$Ifo5KpCWgSxfyFFbOXJa7ecKJXt0RCtdrU9eWaFtffxc8adf.NQES','STUDENT',NULL,'2021-06-23 17:09:15','2021-06-23 17:09:15'),
(98,'MASHILOHC.','CORPUZ','MASH SHILOH','MANISAN','FEMALE','NEW','2002-12-15','LAPASAN, CLARIN, MISAMIS OCCIDENTAL','09169908789','mashshilohcorpuz@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok 7 Bliss, Lapasan, Clarin, Misamis Occidental','2021-06-23 17:09:56','$2y$10$0GrlG2DzcallFHraIaAzs.5VeayUWbyNlLSLQfgmDoU8laY1Er162','STUDENT',NULL,'2021-06-23 17:09:28','2021-06-23 17:09:56'),
(99,'Jonieboyamucay123','AMUCAY','JONIEBOY','MANDAO','MALE','NEW','2000-01-31','LAMPASAN DON VICTORIANO MISAMIS OCCIDENTAL','09187277114','Jonieboyamucay123@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Tuno',25990,'Purok 2, Tuno Don Victoriano Misamis Occidental',NULL,'$2y$10$pGhbNOsTICRHzlTiA8W1Xum99WXS2ftz.CKJOjtsmSUHro62jWSlW','STUDENT',NULL,'2021-06-23 17:09:56','2021-06-23 17:09:56'),
(100,'Angelicaabong','ABONG','ANGELICA','PONCE','FEMALE','NEW','1996-12-31','ZAMBOANGA CITY','09304800240','angelicaabong165@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Langcangan Upper',26062,'P-6 upper langcangan oroquieta city','2021-06-23 17:14:57','$2y$10$NjLCSFzxTiXoZ.ociQvrXu9CxLtFGgKuiHv8gccDdjV4Cd6VMVGwC','STUDENT',NULL,'2021-06-23 17:11:46','2021-06-23 17:14:57'),
(101,'Kaye Merida','MERIDA','SHARLENE KAYE','ALONZO','FEMALE','NEW','1998-11-10','MAHAYAG ZAMBOANGA DEL SUR','09309882080','sharlenekaye98@gmail.com','GEN  MID','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 7','2021-06-23 19:00:04','$2y$10$OJcWpLxPr2KwfzovlwC2v.v7.KdPdGvOV7HCFWYrCJS38KXY895C2','STUDENT',NULL,'2021-06-23 17:12:44','2021-06-23 19:00:04'),
(102,'Ginell Ymalay','YMALAY','GINELL','DURA','FEMALE','NEW','2002-12-14','POBLACION KIBLAWAN DAVAO DEL SUR','09101932144','ginellymalay14@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Davao del Sur','Kiblawan','Poblacion',12746,'Purok 1-B, Mabini Street','2021-06-23 17:16:24','$2y$10$n939J3/46ZXXyFiBo60V7Ow6iQYl3X46AMtBddGkw64oPfk3RRZXO','STUDENT',NULL,'2021-06-23 17:13:31','2021-06-23 17:16:24'),
(103,'dimpleecotsanoria@gmail.com','SANORIA','DIMPLE','ECOT','FEMALE','NEW','2003-03-29','MAHAYAG','09092071555','dimpleecotsanoria@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 3','2021-06-23 17:15:56','$2y$10$0mXC1hKz2EL2/R4qrkERruGEb38lrHiobfZQQJYoE.t0CvKSnnMI2','STUDENT',NULL,'2021-06-23 17:13:33','2021-06-23 17:15:56'),
(104,'primroselouvellepacot','PACOT','PRIMROSE LOUVELLE','MAGALE','FEMALE','NEW','2002-05-19','TANGUB CITY MISAMIS OCCIDENTAL','09362337681','pacotprimroselouvelle@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Lanao del Norte','Sapad','Mapurog',20189,'3','2021-06-23 17:16:13','$2y$10$sOSgkXAgnGPMah8fT/5zFOTcw2M1rVbzPy4YMf0t/PLCvb4bHmL6a','STUDENT',NULL,'2021-06-23 17:13:50','2021-06-23 17:16:13'),
(105,'09108759976','SANTA ANA','ROSELYN','TABAñERA','FEMALE','NEW','2021-06-23','POLAO,TANGUB CITY','09187589166','roselynann111@gmail.com','BSED-MAPEH','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Barangay VII - Upper',26245,'Purok 1 Polao, Tngub city','2021-06-23 17:16:05','$2y$10$9.lajSpmlzhMMLS15Gb7seRGcRWnN1OxG.U0HxDz0YF1hg17wQX4m','STUDENT',NULL,'2021-06-23 17:13:51','2021-06-23 17:16:05'),
(106,'dalechristiandawis@gmail.com','DAWIS','DALE CHRISTIAN','FUENTES','MALE','NEW','2001-06-23','MHARS REGIONAL TRAINING AND TEACHING HOSPITAL. OZAMIS CITY MISAMIS OCCIDENTAL','09635615508','dalechristiandawis@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lupagan',25948,'Purok 06, Lupagan clarin misamis occidental','2021-06-23 17:15:15','$2y$10$xJxwCcZjXQeHv9/GX4KD6.UKhh1b0QrbC4QTrSwUWYVFzFM4Cx9Ba','STUDENT',NULL,'2021-06-23 17:14:07','2021-06-23 17:15:15'),
(107,'Lyn119','UROT','ANGIELYN','WABINGGA','FEMALE','TRANSFEREE','2002-01-19','PUROK MELON, DIPOLO, MOLAVE ZAMBOANGA DEL SUR','09162426568','angielynurot27@gmail.com','BSBA-HRM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Dipolo',41169,'Purok Melon','2021-06-23 17:18:27','$2y$10$noi6HJXuOPIN2R.SL7YvtewpR2Vv2ClGk/wvwVQOhhBuuU72Am8Je','STUDENT',NULL,'2021-06-23 17:17:45','2021-06-23 17:18:27'),
(108,'trazonadariel@gmail.com','TRAZONA','DARIEL','BACUS','MALE','TRANSFEREE','2002-05-11','PANOLOON, SAPAD, LANAO DEL NORTE','09084775234','trazonadariel@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Lanao del Norte','Sapad','Panoloon',20191,'Purok-3','2021-06-23 17:42:13','$2y$10$85wI2816apgdOiVqUk9SqOS3bNpGziZkhPFX3Vc4q3ooDUnhB/LDG','STUDENT',NULL,'2021-06-23 17:17:51','2021-06-23 17:42:13'),
(109,'maryjane.cabaluna','CABALUNA','MARY JANE','GASTALLA','FEMALE','NEW','2003-03-29','TANGUB CITY','09639370143','ejeancabaluna@gmail.com','BSBA-HRM','BSCS','BLENDED',NULL,'Misamis Occidental','Tangub City','Maloro',26262,'Purok, Dancing Lady','2021-06-23 17:57:00','$2y$10$p6J0WuvL/9hGTOvJtPBoAuJEQ57FLeqxXQcU9V2OAlDMDFEo6DpGq','STUDENT',NULL,'2021-06-23 17:17:59','2021-06-23 17:57:00'),
(110,'Argelyn','OBIG','ARGELYN','MARAVILLAS','FEMALE','NEW','2003-06-27','MALINDANG OROQUIETA CITY','09460575804','argelynobig02@gmail.com','BSED-FIL','BSED','FULL ONLINE',NULL,'Misamis Occidental','Oroquieta City','Malindang',26066,'Purok-2',NULL,'$2y$10$sogEwWcC4NjvMAGRLXffRee5c/NRwSgv5W/PUNCb2kFy2JFX1xdUK','STUDENT',NULL,'2021-06-23 17:18:23','2021-06-23 17:18:23'),
(111,'flordelynsaberon@gmail.com','SABERON','ANGELO','SEJISMUNDO','MALE','NEW','2003-01-05','BOCATOR, TANGUB CITY','09094163348','flordelynsaberon@gmail.com','BS CRIM','BSED-MATH','BLENDED',NULL,'Misamis Occidental','Tangub City','Bocator',26247,'P-1','2021-06-23 17:20:26','$2y$10$bsJ7QtCb293y.hHcKIW1qOc7WvFNMvLiVnDe2Y4QFEFcUSPlsNbiO','STUDENT',NULL,'2021-06-23 17:19:16','2021-06-23 17:20:26'),
(112,'rishoberez@gmail.com','OBEREZ','MARISH','CADAYSON','FEMALE','NEW','2003-03-15','BIBILOP, MIDSALIP, ZAMBOANGA DEL SUR','09661736342','rishoberez@gmail.com','BSED-MATH','BSED','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Bibilop',41130,'Purok 1','2021-06-23 17:21:13','$2y$10$ufxtrr2cEMeDUu6kimhmLeYPGOcT9W2RIDq.ssMT3uaofhElwWYR2','STUDENT',NULL,'2021-06-23 17:20:03','2021-06-23 17:21:13'),
(113,'apolosoria117@gmail.com','SORIA','APOLO','BERGADO','MALE','NEW','2001-11-17','OZAMIZ CITY','09150143705','trishamay051@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'Purok 3','2021-06-23 17:21:21','$2y$10$VlLcWjRRe40EQNPGV44FTOHf6vVMVK6oU.XthK/QU2zAJQWvKO7wW','STUDENT',NULL,'2021-06-23 17:20:04','2021-06-23 17:21:21'),
(114,'Leyahhbaki@gmail.com','SALINAS','LEAHJEN','AGUILAR','FEMALE','NEW','2002-10-02','GUITRAN DUMINGAG ZAMBOANGA DEL SUR','09518503458','Leyahhbaki@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Guitran',40938,'Purok 2','2021-06-23 17:25:53','$2y$10$MBlE9YI9OxokdGu4HiIaW.BbLVKzAv7l/8lJXVre0413u6cOhFida','STUDENT',NULL,'2021-06-23 17:20:34','2021-06-23 17:25:53'),
(115,'jievan09gar@gmail.com','GARZON','JIEVAN MAE','PASUMALA','FEMALE','TRANSFEREE','2002-05-09','TABOK, MANDAUE CITY CEBU','09384117914','jievan09gar@gmail.com','BEED','BSED','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Tungawan',41388,'Purok Kalunsing','2021-06-23 17:27:07','$2y$10$XvyRjjEJZ7/rQ7.A92T/je1qF0jCxzAIkS5MDYTyqtszl8MlWzxui','STUDENT',NULL,'2021-06-23 17:21:25','2021-06-23 17:27:07'),
(116,'Dynel21','ENAO','DYNEL','ELTAGON','MALE','NEW','2002-05-21','PUNTA PANAON','09639385012','dynelenao@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Panaon','Poblacion',26149,'Purok-7','2021-06-23 17:25:21','$2y$10$seUz/WlatgQzLhVLKFDDq.XE0xR.hcnxt9.cOY.VZtkgnbyhdCtk.','STUDENT',NULL,'2021-06-23 17:21:46','2021-06-23 17:25:21'),
(117,'elmaapao','APAO','ELMA','OPAMEN','FEMALE','NEW','2001-05-04','POLAO, TANGUB CITY, MISAMIS OCCIDENTAL','09639634344','elmaapao251@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay VII - Upper',26245,'Purok 3 Polao, Tangub City','2021-06-23 17:31:26','$2y$10$tevyR9gemJff7c/3iJjTi.lKvs0tWU0MNuIWz..jFCoob2s0C7jsm','STUDENT',NULL,'2021-06-23 17:22:06','2021-06-23 17:31:26'),
(118,'joancaspe00@gmail.com','CASPE','JOAN','B','FEMALE','NEW','2000-07-13','CAVITE,MANILA','09267886240','joancaspe00@gmail.com','BSOA','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Cabol-Anonan',26295,'Purok 4','2021-06-23 17:25:02','$2y$10$OuhYrHErwggzu2nYmn2NVuao6oq4mVGdnJz8tsHDVMFLBevjCiVCu','STUDENT',NULL,'2021-06-23 17:22:19','2021-06-23 17:25:02'),
(119,'Mjmcgalvezlaureano','LAUREANO','MA. JOANNA MAE','GALVEZ','FEMALE','NEW','1996-04-09','PAGADIAN CITY','09053864275','galvez.mariajoannamae@gmail.com','GEN  MID','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carmen',26104,'PUROK 8A',NULL,'$2y$10$LDPY8T0e5Dlow02YzG9ZG.OW7xHzkE2JZw08o.4xgevH0OF1tzz8S','STUDENT',NULL,'2021-06-23 17:22:30','2021-06-23 17:22:30'),
(120,'Arnulfo Banugon','BANUGON','ARNULFO','FUENTES','MALE','NEW','2002-07-05','P-7,TIAMAN, BONIFACIO, MISAMIS OCCIDENTAL','09489159751','banugonarnulfo18@gmail.com','BSED-FIL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tiaman',25911,'P-7','2021-06-23 17:24:31','$2y$10$2y2bp.zVoajylLElngHK8OTRL3ajz8gDl2dtggTPkzx3wPLP3jcFS','STUDENT',NULL,'2021-06-23 17:23:16','2021-06-23 17:24:31'),
(121,'Gerald Gallogo Obuga','OBUGA','GERALD','GALLOGO','MALE','NEW','2002-01-21','P2 SAN NICOLAS, TUDELA MIS. OCC.','09569617885','geraldobuga7@gmail.com','BS CRIM','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Tudela','San Nicolas',26316,'Purok 2','2021-06-23 18:00:14','$2y$10$94mTi4iPSAtF7MgG.kk4/OFCMEohY9Tb94h2F89HkMucwvI0j7mfC','STUDENT',NULL,'2021-06-23 17:23:28','2021-06-23 18:00:14'),
(122,'glydelplarisan@gmail.com','PLARISAN','GLYDEL','CANDOLE','FEMALE','NEW','2002-09-06','LANAO NORTE PROVINCIAL HOSPITAL, BAROY, LANAO DEL NORTE','09079812992','glydelplarisan@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Candis',20261,'Purok 1','2021-06-23 18:08:46','$2y$10$T.ThIQXIKEm6OUPx9p9sm.5/2r52hDjkrl42v7hDs8hINSUrn.882','STUDENT',NULL,'2021-06-23 17:25:02','2021-06-23 18:08:46'),
(123,'ocilasheina','OCILA','SHEINA','ELAG','FEMALE','NEW','2002-09-07','CARIDAD, HAMTIC, ANTIQUE','09104283139','sheinaocila@gmail.com','BS CRIM','BSOA','BLENDED',NULL,'Misamis Occidental','Tudela','Pan-Ay Diot',26315,'Purok -1','2021-06-23 17:26:56','$2y$10$ck9iek8JflsLONadEMHb/eCG3lQ66WbHmrZnaPqxQWr4Yf1MZdMCq','STUDENT',NULL,'2021-06-23 17:25:06','2021-06-23 17:26:56'),
(124,'Venus Jean E. Tabanas','TABANAS','VENUS JEAN','ESPRA','FEMALE','NEW','2001-08-27','BAROY, LANAO DEL NORTE','09638151543','venusjtabanas@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Lanao del Norte','Baroy','Princesa',19825,'Purok 6','2021-06-23 17:26:37','$2y$10$y1H4NsE/q.w1iuprXmIX7epcKMeNxSRJpzH2OgWxnJd1OnYJGsEOe','STUDENT',NULL,'2021-06-23 17:25:48','2021-06-23 17:26:37'),
(125,'Crislyn Gongob','GONGOB','CRISLYN','ANDRIN','FEMALE','NEW','2003-03-25','P-6, MALINGAO, TUBOD, LANAO DEL NORTE','09639598025','gongobcrislyn581@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Malingao',20267,'Purok 6','2021-06-23 17:28:07','$2y$10$mZX0JCddGXmm29ze7ex2FugEg5BUDUAc88lkq3vLcfKpOEHTHAll.','STUDENT',NULL,'2021-06-23 17:25:53','2021-06-23 17:28:07'),
(126,'Jhonna','FLORES','JHONNA FE','MEJOS','FEMALE','NEW','2003-06-14','MANSANAS, JOSEFINA, ZAMBOANGA DEL SUR','09389654128','jhonnafeflores566@gmail.com','BSOA','AB ENGLISH','BLENDED',NULL,'Zamboanga del Sur','Josefina','Mansanas',40991,'Purok 1 Everlasting','2021-06-23 17:41:56','$2y$10$5FKhO9XZDuyQnV9XIgzgTOz2GCVjKnFEpXt5S4mTouxzPOGY7qqUW','STUDENT',NULL,'2021-06-23 17:27:09','2021-06-23 17:41:56'),
(127,'jocymay21@gmail.com','MANGUBAT','JOCY MAY','LEONARDO','FEMALE','NEW','2003-05-21','GUMAHAN, JOSEFINA ZAMBOANGA DEL SUR','09458025241','jocymay21@gmail.com','BSED','AB ENGLISH','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Tambis','2021-06-23 17:44:08','$2y$10$j3iSC/11O9ECFKb3oE0v..vsQqqN3720GzTSQExfFSftz/yTLizEm','STUDENT',NULL,'2021-06-23 17:27:15','2021-06-23 17:44:08'),
(128,'manilynportabes@gmail.com','PORTABES','MANELYN','SAYA-ANG','FEMALE','NEW','2002-12-15','SAN ISIDRO MAHAYAG ZAMBOANGA DEL SUR','09380321647','manilynportabes@gmail.com','BSED-ENGL','BSCS','BLENDED',NULL,'Zamboanga del Sur','Mahayag','San Isidro',41101,'Kawayanan, San Isidro','2021-06-23 17:31:57','$2y$10$5LIQ5rwBfQvvKXNgLutJ.u4Y8Qj1TWRwPJdhmbto2okcTeS1zeWqm','STUDENT',NULL,'2021-06-23 17:27:39','2021-06-23 17:31:57'),
(129,'JERAMAE GACO CALIBO','CALIBO','JERAMAE','GACO','FEMALE','NEW','2002-10-23','PUALAS TUBOD LANAO DEL NORTE','09514713620','calibojeramae@gmail.com','BEED','BS CRIM','BLENDED',NULL,'Lanao del Norte','Tubod','Pualas',20273,'Purok 2',NULL,'$2y$10$FWKqRu.YUs1T5KztXm.PneqLbNI3ARpouEh0v1tS.gDd1UxGHyQm2','STUDENT',NULL,'2021-06-23 17:28:16','2021-06-23 17:28:16'),
(130,'Roselyn123','SABELLINA','ROSELYN','CALIGUID','FEMALE','NEW','2003-01-02','OROQUITA CITY','09129881252','Roselynsabellina20@gmail.com','BSED','BSED-FIL','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Dipolo',41169,'Purok,Melon','2021-06-23 17:28:39','$2y$10$Exo8M9/cJv57O5KGYEXg8ePrUd4rtzZ.VWvXBMSuKQHnPNMmJTg/K','STUDENT',NULL,'2021-06-23 17:28:17','2021-06-23 17:28:39'),
(131,'Virgenia Unabia','UNABIA','VIRGENIA','LEE','FEMALE','NEW','1979-09-30','BUKIDNON','09071644470','virgenia.unabia@gmail.com','GEN  MID','BEED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carmen',26104,'P 8 A',NULL,'$2y$10$LeO4xbEoCxQgK.uraKfSluObKPjMNuTxBZEEyrkCIyfQu1IMklVV2','STUDENT',NULL,'2021-06-23 17:28:44','2021-06-23 17:28:44'),
(132,'Mariette','HOYOHOY','MARIETTE','ALDUHESA','FEMALE','TRANSFEREE','2000-11-19','MANINGCOL, OZAMIZ CITY','09516524043','marietta192000@gmail.com','BSED-FIL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Kinuman Sur',26120,'Purok 3','2021-06-23 17:29:53','$2y$10$/YrG6Df060.85e3XV8Eh/.OJ.dfddFVT/SvoGUF6utpt5obeVcWUi','STUDENT',NULL,'2021-06-23 17:28:48','2021-06-23 17:29:53'),
(133,'Jellyn','ACURAM','JELLYN','PALER','FEMALE','TRANSFEREE','2001-01-20','CAHAYAG, TUDELA, MISSAMIS, OCCIDENTAL','09956903704','nylljelloy@gmail.com','BEED','GEN  MID','FULL ONLINE',NULL,'Lanao del Norte','Bacolod','Liangan East',19783,'Purok-2','2021-06-23 17:29:36','$2y$10$7GAldgrhXmTvPBEJd640Bu8gysMMOT0YRmzTi3/LNBVKHnssdiUvW','STUDENT',NULL,'2021-06-23 17:29:01','2021-06-23 17:29:36'),
(134,'Chris John G Cuizon','CUIZON','CHRIS','JOHN','MALE','NEW','2002-04-08','MARSGEN HOSPITAL','09468826729','cuizonjohn530@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Labinay',26121,'Labinay, P-2 ozamiz city','2021-06-23 17:31:22','$2y$10$xIhqgYEXtOYOkOhkmDGnnuVVqRuJI2zS.jMePjAaBwZcFpEg91Mli','STUDENT',NULL,'2021-06-23 17:29:13','2021-06-23 17:31:22'),
(135,'lvjvsco@gmail.com','SUICO','LOVE JAYVINE','JAIMET','FEMALE','NEW','2002-11-04','RAMON MAGSAYSAY,ZAMBOANGA DEL SUR','09097739513','lvjvsco@gmail.com','BSBA-HRM','AB POLSCI','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'Doña  Rufina Mediatrix','2021-06-23 17:31:52','$2y$10$706t0MkiCSBi1Bn7Qms8LO4jJECcZkPAdSUTmbdxISqmxvkk7M1tu','STUDENT',NULL,'2021-06-23 17:29:31','2021-06-23 17:31:52'),
(136,'Patronjomarie.1@gmail.com','PATRON','JOMARIE','BUGAS','FEMALE','NEW','2003-02-06','DUMAGUETE CITY','09467570062','Patronjomarie.1@gmail.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Jimenez','Butuay',25992,'Purok 5','2021-06-23 17:39:01','$2y$10$RICROxM9s2rhxaJjVgGlv.rM31a3S.Z6aYsqX.9JFV8Mx8lv3nN56','STUDENT',NULL,'2021-06-23 17:31:16','2021-06-23 17:39:01'),
(137,'jomardullin3@gmail.com','DULLIN','JOMAR','MEKING','MALE','NEW','2002-09-06','MAHAYAG, ZAMBOANGA DEL SUR','09305794196','jomardullin3@gmail.com','BSED','BS CRIM','BLENDED',NULL,'Misamis Occidental','Sinacaban','Katipunan',26224,'PUROK 5','2021-06-23 17:34:08','$2y$10$ZakV6S2wCkoDHq3nWo49z.stQjDEVQgwboJYR9Da4nLRbv3tI3lmy','STUDENT',NULL,'2021-06-23 17:31:17','2021-06-23 17:34:08'),
(138,'manilynsalvan2@gmail.com','SALVAN','MANILYN II','TABAñA','FEMALE','TRANSFEREE','2001-01-02','TUDELA','09635613515','manilynsalvan2@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Centro Hulpa',26302,'P2','2021-06-23 17:32:05','$2y$10$rnDs9T2xtSDuG/XD4gtOm.2PWLUOHL4CAlGQApXQMcrb.gmxYM2sS','STUDENT',NULL,'2021-06-23 17:31:35','2021-06-23 17:32:05'),
(139,'Ericamaefriginal18@gmail.com','FRIGINAL','ERICA MAE','LAGUE','FEMALE','NEW','2002-05-23','NAPUROG,TUDELA MISAMIS OCCIDENTAL','09071577332','Ericamaefriginal18@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Tudela','Napurog',26314,'Purok 2','2021-06-23 17:33:36','$2y$10$Xc22BZzpTjn.6X04qLKIHO.Oh8u8VRWFsXbygfIWzfMnnyVOvQNkS','STUDENT',NULL,'2021-06-23 17:31:49','2021-06-23 17:33:36'),
(140,'mariachristinecaalim','CAALIM','MARIA CHRISTINE','LLANOS','FEMALE','RETURNEE','2001-12-05','SM LAO GENERAL HOSPITAL, OZAMIZ CITY','09165974211','mariachristinelcaalim@gmail.com','AB ENGLISH','AB ENGLISH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Baybay Triunfo',26098,'Purok 5 Baybay Triunfo, Ozamiz City','2021-06-23 17:33:47','$2y$10$3Sqrya.Vm6tlnp3o5EnuTO.Hvet3znhod.7cBaADfygX/eZX6Y3yG','STUDENT',NULL,'2021-06-23 17:31:52','2021-06-23 17:33:47'),
(141,'Junnilapiang2003@gmail.com','PIANG','JUNNILA','OPO','FEMALE','NEW','2003-01-14','TAGUANAO ALORAN MISAMIS OCCIDENTAL','09977291677','junnilapiang2003@email.com','BS CRIM','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Panaon','Camanucan',26143,'Purok-2',NULL,'$2y$10$3/r86frTZs8fk4dRKEOrv.US2DklWcQU3tJkLqqCEs5kXZFrS29wi','STUDENT',NULL,'2021-06-23 17:32:32','2021-06-23 17:32:32'),
(142,'salvadorqueeny21@gmail.com','SLAVADOR','QUEEN SHIRN','SALIG','FEMALE','NEW','2002-03-21','PITOGO, ZAMBOANGA DEL SUR','09061806844','salvadorqueeny21@gmail.com','BSED-FIL','BSED-SOCSTUD','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok-3','2021-06-23 17:34:25','$2y$10$ZHkjGkK.DV9eX9UqDoGzTeJ9RHxYjmTCJnz8HdAwPpz9tACgET.Vu','STUDENT',NULL,'2021-06-23 17:32:38','2021-06-23 17:34:25'),
(143,'Elishama Rebato','REBATO','ELISHAMA','EGAM','FEMALE','NEW','2001-10-16','SEGAPOD, MAIGO, LANAO DEL NORTE','09976130687','elishama.rebato@gmail.com','BSOA','BSCS','FULL ONLINE',NULL,'Lanao del Norte','Maigo','Sogapod',20021,'Purok- 2','2021-06-23 17:34:00','$2y$10$He3TI/qtGmrGcBqRlaDacOUsQbIrdzJ5MVmqD33V3JdbsFcnfpIFO','STUDENT',NULL,'2021-06-23 17:33:11','2021-06-23 17:34:00'),
(144,'pamelaamorsaga18@gmail.com','SAGA','PAMELA AMOR','TAYROS','FEMALE','NEW','2003-06-18','OZAMIS CITY','09362481609','pamelaamorsaga18@email.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Panaon','Camanucan',26143,'2',NULL,'$2y$10$LbreVEom4Z2v9b3pPhqXaOvmvLMyqJRv0tef42BbpCxgTFQ0ZV276','STUDENT',NULL,'2021-06-23 17:33:16','2021-06-23 17:33:16'),
(145,'junemarkferrer@gmail.com','JUNE MARK','FERRER','MANUSA','MALE','NEW','2003-06-03','DMDTMH','09519476856','junemarkferrer@gmail.com','BSED','BEED','BLENDED',NULL,'Misamis Occidental','Tangub City','Sumirap',26285,'Purok 6','2021-06-23 17:35:13','$2y$10$LBMRrBI0IrgoaDVDsKlz7OQWMITGOAhugk7azyoKJdyrofrNYrgm6','STUDENT',NULL,'2021-06-23 17:33:19','2021-06-23 17:35:13'),
(146,'casipong143','CASIPONG','CHRISTOPHER','','MALE','RETURNEE','2001-04-12','OZAMIZ CITY','09453495262','christopher.casipong@gmail.com','BSCS','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tinago',26139,'Madanihon','2021-06-23 17:37:08','$2y$10$pELaUxsvMWZ18ayqNkoXG.3Q5LSAzfn/S6L6jXsWks4USb1P3oRkC','STUDENT',NULL,'2021-06-23 17:33:33','2021-06-23 17:37:08'),
(147,'janinebancairen08@gmail.com','BEQUILLA','JANINE','BANCAIREN','FEMALE','NEW','2021-02-08','CAPUTOL, ALORAN, MISAMIS OCCIDENTAL','09505286550','janinebancairen08@gmail.com','BS CRIM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Aloran','Monterico',25855,'4','2021-06-23 17:36:59','$2y$10$6L/5ex4avjH0lSd3sqv56uJyLdS0BWUhhypds9o2oC1maQdePkLcK','STUDENT',NULL,'2021-06-23 17:34:03','2021-06-23 17:36:59'),
(148,'Rene P. Tanato','TANATO','RENE','PARADEL','MALE','NEW','2002-11-12','DMDTMH','09518007193','rainmariah.tanato@gmail.com','BSED-ENGL','AB ENGLISH','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'P-1','2021-06-23 17:36:11','$2y$10$WVHe/UOSxsMGvntethoDf.2PPltliXe76n4tvPLOHknC0PZcScmw6','STUDENT',NULL,'2021-06-23 17:35:38','2021-06-23 17:36:11'),
(149,'Adong20','DALAYGON','JOHN RENIEL','TANGOCOGO','MALE','TRANSFEREE','2021-07-23','BRGY 4 TANGUB CITY','09104287141','johnrenieldalaygon6@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Barangay IV - St. Mic',26242,'P-3 T.C','2021-06-23 17:37:44','$2y$10$gnST8LLLzJixIG4jEWVziOwnHIHAVoHJhNm35h/sUNy93/WA2bgW2','STUDENT',NULL,'2021-06-23 17:36:55','2021-06-23 17:37:44'),
(150,'Margie','CANCIO','MARGIE','ROMERO','FEMALE','TRANSFEREE','2000-11-19','KINUMAN SUR, OZAMIZ CITY','09274992388','margieromerocancio@gmail.com','BSED-FIL','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Kinuman Sur',26120,'Purok 3','2021-06-23 17:46:35','$2y$10$ILvsAoi5Na0KY3EysurjN.TtR/pa1paripGWKQFZ5eaC34lKav8/q','STUDENT',NULL,'2021-06-23 17:37:46','2021-06-23 17:46:35'),
(151,'Vindick','MAGLANGIT','VINDICK','S.','MALE','NEW','2002-09-04','BAYBAY MIGCANAWAY TANGUB CITY','09454663365','at2koy2123@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Purok noneluna','2021-06-23 17:43:11','$2y$10$ILzf82ANtfu/d/fGNI3rV.GiPDgz.X75E/GZEIC.q92YWYYhiXa5G','STUDENT','WnREFtRWeoc9CX6ywhIRmFnp5JSWarsaoIMOEskYJ9eomg1uF7wuQNBIJf0I','2021-06-23 17:38:37','2021-06-23 17:43:11'),
(152,'jan.mamalias@yahoo.com','MAMALIAS','JAN LEUEL','SALVA','MALE','NEW','2002-01-01','MOLAVE ZAMBOANGA DEL SUR','09639675330','jan.mamalias@yahoo.com','BSED','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok Guapa',NULL,'$2y$10$liyDi06ddNmKNnJMsLSquObv2wJ55uSAoVAjSG1UdHw66G2S7XXt6','STUDENT',NULL,'2021-06-23 17:38:48','2021-06-23 17:38:48'),
(153,'Geraldine Undap','UNDAP','GERALDINE','TABILIRAN','FEMALE','NEW','2001-10-30','TUDELA HOSPITAL MISAMIS OCCIDENTAL','09978670282','geraldineundap023@gmail.com','BSOA','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lupagan',25948,'Purok 1, Lupagan, Clarin, Misamis Occidental','2021-06-23 17:43:09','$2y$10$rBAUlfN2FYu67x1MmoxFaOrgrOaGsRtbCZZPBndeMY1rXnxwk1VU2','STUDENT',NULL,'2021-06-23 17:40:36','2021-06-23 17:43:09'),
(154,'RossJee_Parmisana','PARMISANA','ROSS JEE','PASOK','FEMALE','NEW','2000-06-29','JIMENEZ','09073381155','rossjeeparmisana29@gmail.com','AB ENGLISH','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Jimenez','Macabayao',25998,'Purok 6','2021-06-23 17:46:39','$2y$10$tgvUugsJfpR7wL6Oj80FIOTddr4R3ReLvZt3qa2Nl5b28pyqihD0K','STUDENT',NULL,'2021-06-23 17:42:36','2021-06-23 17:46:39'),
(155,'dianajeanvillastique85@gmail.com','VILLASTIQUE','DIANA JEAN','BONGCAWEL','FEMALE','NEW','2003-02-20','MATUGNAW TANGUB CITY','09357425037','dianajeanvillastique85@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Barangay VII - Upper',26245,'Purok3',NULL,'$2y$10$SSafpwm3qIY5xovTiCRSS.Wd2AqgnUY0DZOolen0mEfCgx3oyT.5i','STUDENT',NULL,'2021-06-23 17:43:11','2021-06-23 17:43:11'),
(156,'Shem Dale','OVALO','SHEM DALE','CHATA','MALE','NEW','1999-10-25','CALAMBA MISAMIS OCCIDENTAL','09484568969','shemdale_ovalo@gmail.com','BSBA-HRM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Brgy. Sta. Maria',NULL,'$2y$10$WHWCCDmFzJ90PMvuIOze5emLybIljK.rT36iBGEmPwaK9qJ//qwnq','STUDENT',NULL,'2021-06-23 17:43:27','2021-06-23 17:43:27'),
(157,'Jaynald John Cabañez','CABAñEZ','JAYNALD JOHN','LARGO','MALE','NEW','2002-10-29','TANGUB CITY, BARANGAY MANGA','09060374743','jaynaldlargo@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'Purok 1','2021-06-23 17:44:05','$2y$10$js5ksyp8MUCKACK/HmwaBORvahsfDH.qe2TXwvuVLriLkSqlDnMwS','STUDENT',NULL,'2021-06-23 17:43:41','2021-06-23 17:44:05'),
(158,'RenceCapili24','CAPILI','JOHN LAWRENCE','ARINGAY','MALE','NEW','2000-11-14','SANTA MARIA, BULACAN','09086524314','rence085@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Metropolitan Manila','Quezon City','Santo Cristo',25736,'#63 San Antonio','2021-06-23 17:44:30','$2y$10$DfffQMuf6G..3gyzxbT9WeVGFLA0l8r/dHE9wmR4jc6p4T2bBOz6O','STUDENT',NULL,'2021-06-23 17:43:53','2021-06-23 17:44:30'),
(159,'Myrah Claire','MIRAS','MYRAH CLAIRE','BASIT','FEMALE','NEW','2002-05-17','BRGY. RIZAL MOLAVE ZAMBOANGA DEL SUR','09384947272','mirasmyrah@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Molave','Rizal',41180,'Purok saturn','2021-06-23 17:47:58','$2y$10$/RsU7aZmcHBK/iRYHKyv1.tnE138PDruRaO1aPqP2w2qAXHHdHTT2','STUDENT',NULL,'2021-06-23 17:45:28','2021-06-23 17:47:58'),
(160,'Gasparlira10 @gmail.com','MAGHINAY','LIRA','GUILINGAN','FEMALE','NEW','2000-10-15','BINAYAN,LABANGAN ZAMBOANGA DEL SUR','09153378411','gasparlira10@gmail.com','BSED-MATH','BSED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'Purok-4','2021-06-23 17:47:25','$2y$10$6wsKHrJjSj.57fRs/48mdODJB3nHm2pRGpn5e/vEZWXCY632T34Pu','STUDENT',NULL,'2021-06-23 17:45:53','2021-06-23 17:47:25'),
(161,'Maikee','PONCE','APRIL GRACE','RIZADA','FEMALE','NEW','2001-04-04','PUROK RUBIA, KAHAYAGAN EAST, AURORA, ZAMBOANGA DEL SUR','09504648885','maikeeponce@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Aurora','Kahayagan East',40788,'Purok Rubia','2021-06-23 17:50:48','$2y$10$UrWgEdU0DFIhQLXod4XtlelnZlsjFGjm5kXWwSAeLi2ZghE5AoRM.','STUDENT',NULL,'2021-06-23 17:46:14','2021-06-23 17:50:48'),
(162,'Gina Mae Pitogo','PITOGO','GINA MAE','LOREJO','FEMALE','NEW','2003-05-22','MOLAVE ZAMBOANGA DEL SUR','09700480895','ginamaepitogo@gmail.com','BSBA-MM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Venus',NULL,'$2y$10$VxelX3hWuXPKlzgA/uspNeb32ta7k9oPRfoVkpOGZVBWV8zPT7IN6','STUDENT',NULL,'2021-06-23 17:46:17','2021-06-23 17:46:17'),
(163,'jarinerivera68@gmail.com','RIVERA','JARINE','DELUNA','MALE','NEW','2021-07-06','UPPER DIMOROK','09386825621','jarinerivera68@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Lakatan',NULL,'$2y$10$.o/WfMrzOZIIEApY0M8zdOFCdykx/l2MXtKumn2Qm4Fp2a310YB/O','STUDENT',NULL,'2021-06-23 17:46:48','2021-06-23 17:46:48'),
(164,'Nyle Robie','OCAB','NYLE ROBIE','PAREL','FEMALE','NEW','2002-01-30','POBLACION, CARMEN, COTABATO','09122852839','naaaayel@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Bougainvillea',NULL,'$2y$10$qWiFZjytn8TO9xVYYRYqhun53RLg1FLR5UyA0ydzvNFvVyeqLwHTu','STUDENT',NULL,'2021-06-23 17:46:49','2021-06-23 17:46:49'),
(165,'Jomgonzales12','GONZALES','JOSE MARI','CALAHAT','MALE','NEW','2002-09-23','MUNTINLUPA CITY','09972365547','jomgonzales123@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 7',NULL,'$2y$10$a76F1RXyWX91FThn6FrswuL/5K1w.T3pHd3fXjflkpTx8fEGsuApe','STUDENT',NULL,'2021-06-23 17:46:53','2021-06-23 17:46:53'),
(166,'Roovie Angelie Calabria Siasico','SIASICO','ROOVIE ANGELIE','CALABRIA','FEMALE','NEW','2003-04-01','LILOY, ZAMBOANGA DEL NORTE','09513921605','roovieangeliecalabriasiasico@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Norte','Kalawit','Batayan',40250,'Purok 3','2021-06-23 17:50:49','$2y$10$XwTlVrYxMizAQVkwEHUiWuI5mcMu2xTh.U1wjFDfZLzlYsmLjrLti','STUDENT',NULL,'2021-06-23 17:49:07','2021-06-23 17:50:49'),
(167,'Chona Lace Caveros','CAVEROS','CHONA LACE','TAMPOS','FEMALE','TRANSFEREE','2002-03-11','OPON MATERNITY HOUSE','09563379352','chonalacecaveros@gmail.com','BSBA-HRM','BSBA-MM','FULL ONLINE',NULL,'Cebu','Lapu-Lapu City','Gun-Ob',11411,'Kinalumsan','2021-06-23 17:49:55','$2y$10$iDafDe1nwSC8jEPBv170p.yarxT1FFlHRiSCGkUuZ41bWrSXcwNvy','STUDENT',NULL,'2021-06-23 17:49:14','2021-06-23 17:49:55'),
(168,'Maricel Enomar','ENOMAR','MARICEL','M.','FEMALE','NEW','2003-06-23','BAYBAY BONIFACIO','09518370124','lacidashimlord@gmail.com','BSOA','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Sumirap',26285,'1','2021-06-23 18:08:20','$2y$10$/mpWmXJ8HSWr00Vl4yyE0..3H6dOl3Lm5GcGGrgstwQ0xPBF4lvju','STUDENT',NULL,'2021-06-23 17:49:23','2021-06-23 18:08:20'),
(169,'Melanne Joy Pentojo','PENTOJO','MELANNE JOY','MEJARES','FEMALE','NEW','2002-04-06','LAY-AHAN POTOTAN,ILOILO CITY','09187304072','melannejoymejarespentojo@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Aurora','Libertad',40794,'San Vicente','2021-06-23 17:58:57','$2y$10$IIswL0VTF5ebRYZVrfD6heGY.wlwqzqzll4lgyc/GfblE4I1wj8bC','STUDENT',NULL,'2021-06-23 17:49:27','2021-06-23 17:58:57'),
(170,'Jezel cabarse','CABARSW','JEZEL','F.','FEMALE','NEW','2002-09-07','MHARS GEN.','09155192769','cabarsejezel2@gmail.com','BSBA-MM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Tudela','Napurog',26314,'Purok 1','2021-06-23 17:50:48','$2y$10$sqiJhAT4UETqvN8Gn9kNb.hvT8oDTsRmpwtWni16MomA7LTpGgCx.','STUDENT',NULL,'2021-06-23 17:49:35','2021-06-23 17:50:48'),
(171,'Marcgeonzon7@gmail.com','GEONZON','MARC ANGEL','MANLEGRO','MALE','NEW','2002-10-27','PUROK 7 GANGO OZAMIZ CITY','09510332664','marcgeonzon7@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'Purok 7','2021-06-23 18:07:39','$2y$10$j5NYeaJc6DLW5GpZrgM.tuZ1iCBQTYeHYVAsxAECB3ZpyJHB96bkW','STUDENT',NULL,'2021-06-23 17:49:44','2021-06-23 18:07:39'),
(172,'macasriezel','MACAS','RIEZEL FAITH','GIANCHAND','FEMALE','NEW','2003-06-10','BAGAKAY, OZAMIS CITY','09630955474','macasriezelfaith@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Sebac',26317,'P-1','2021-06-24 10:28:48','$2y$10$EOgMhRXQGlP.RdnNgEQbbuIV65mPmYWgii4//pQd91Pyc9vvkLvhK','STUDENT','EaXhhcixh15sH2DMhZhEkHHjVFqD06w4KSaInQWiBAfarwj9nZVdOu7ORgoo','2021-06-23 17:50:41','2021-06-24 10:28:48'),
(173,'Ira Chryssa Nova','CAGA-ANAN','IRA CHRYSSA NOVA','MACARAYA','FEMALE','NEW','2002-11-13','OZAMIZ CITY','09305356291','iracagaanan@gmail.com','BS CRIM','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Baybay San Roque',26096,'Purok 2-b','2021-06-23 17:51:38','$2y$10$9jo2AK2FNkLqjXa8B4XP.uoHVFH3G80VSQ0d4V/MVoO4SqvQfgaCK','STUDENT',NULL,'2021-06-23 17:50:59','2021-06-23 17:51:38'),
(174,'Indayvannie','GORDIONES','EDMAR','MORTES','MALE','TRANSFEREE','1999-07-20','CAMP 3, SALVADOR, LANAO DEL NORTE','09683014661','edmargordiones20@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Lanao del Norte','Baroy','Libertad',19817,'Purok 2','2021-06-23 17:52:29','$2y$10$drfL7xQ3cE4EO9Y/vn7Fs.kutGB2WlioA0LS8hz2FywJDDWtrqtsm','STUDENT',NULL,'2021-06-23 17:51:31','2021-06-23 17:52:29'),
(175,'anggotkimberly1@gmail.com','ANGGOT','KIMBERLY','MARIANITO','FEMALE','NEW','2000-09-28','BONIFACIO MISAMIS OCCIDENTAL','09568391696','anggotkimberly1@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok-1','2021-06-23 17:57:25','$2y$10$U4IPe1LG2l59nDrU1SCYGukwmeqAnoWAdMLRavGNE3EyJdaXk3jwC','STUDENT',NULL,'2021-06-23 17:51:45','2021-06-23 17:57:25'),
(176,'Jhoy','JAPOS','EVER JHOY','PITOGO','FEMALE','NEW','2003-02-28','MOLAVE ZAMBOANGA DEL SUR','09055324610','everjhoyjapos@gmail.com','BEED','BEED','BLENDED',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'Lapu-lapu St.','2021-06-23 17:56:06','$2y$10$2jnyGKoG/.souCFZ4umJdOZGfv3B0KDZmB0mDvSEgIw.3CmFF0Paq','STUDENT',NULL,'2021-06-23 17:52:08','2021-06-23 17:56:06'),
(177,'Gemerie Villanueva','VILLANUEVA','GEMERIE','CASAS','FEMALE','NEW','2002-10-10','POBLACION,SINACABAN MIS.OCC','09275442513','villanuevagemerie75@gmail.com','BS CRIM','BSOA','BLENDED',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Purok African Daisy','2021-06-23 17:55:02','$2y$10$GxuQosAXnKaaY3PRntKX/uyKcOxLYOh.6G/wKTOMhOrMQx/PH8k2.','STUDENT',NULL,'2021-06-23 17:52:51','2021-06-23 17:55:02'),
(178,'Lean Heart','HUGO','LEAN HEART','JUMAWAN','MALE','NEW','2003-03-24','BACAHAN MIDSALIP ZAMBOANGA DEL SUR','09300456582','hugoleanleart@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Bacahan',41128,'Purok 5',NULL,'$2y$10$QCPG3Ci.w9SeFQ8nQqUouOsnh9wlS/l42RxiUYdFhY8.L9ENs6HHq','STUDENT',NULL,'2021-06-23 17:53:07','2021-06-23 17:53:07'),
(179,'Jenelou_corales','CORALES','JENELOU','APLACA','FEMALE','NEW','2002-11-10','STA. CRUZ MAHAYAG ZAMBOANGA DEL SUR','09050617035','coralesjenelou@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Happy Valley',41371,'Purok 7','2021-06-23 17:59:58','$2y$10$auqlCHiEv83YJkHJYF581eUJ5gC3B/Ky5kIE9CsH1TIWefb3N/w6q','STUDENT',NULL,'2021-06-23 17:53:10','2021-06-23 17:59:58'),
(180,'Junnilapiang','PIANG','JUNNILA','OPO','FEMALE','NEW','2003-01-14','TAGUANAO ALORAN MISAMIS OCCIDENTAL','09977291677','junnilapiang2003@gmail.com','BS CRIM','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Panaon','Camanucan',26143,'Purok-2','2021-06-23 17:55:08','$2y$10$trQ/zIRgIzNKwgo3jwz96OHX84aoiGFnjTTBkTu3yrqyPGbh3LvjW','STUDENT',NULL,'2021-06-23 17:53:42','2021-06-23 17:55:08'),
(181,'noquerajade44@gmail.com','NOQUERA','WELKIN JADE','RIVERA','MALE','NEW','2002-03-08','UPPER DIMOROK MOLAVE ZAMBOANGA DEL SUR','09381146723','noquerajade44@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Purok 4 LAKATAN',NULL,'$2y$10$HZ0E7ivj//yzgVRv1JFi6OMifu4ezjriJ8DM1AVGhr6kToH67Qmme','STUDENT',NULL,'2021-06-23 17:54:06','2021-06-23 17:54:06'),
(182,'Crystal Gane Gumalas','GUMALAS','CRYSTAL GANE','MERABEDES','FEMALE','NEW','2000-11-21','UPPER TILTILAN, MANUKAN, ZAMBOANGA DEL NORTE','09488737052','talyamutialagata@gmail.com','BSED-SOCSTUD','BSOA','BLENDED',NULL,'Misamis Occidental','Clarin','Gata Diot',25943,'Purok - 1','2021-06-23 17:54:33','$2y$10$Na4.p0iri.R47iYvtOfYWOoezzytD58Oh5o/CVII1xOxaeKn/08Pe','STUDENT',NULL,'2021-06-23 17:54:13','2021-06-23 17:54:33'),
(183,'ChaBago-od','BAGO-OD','ROSALIE','SANGEL','FEMALE','NEW','2001-12-06','BUENASUERTE, TUKURAN, ZAMBOANGA DEL SUR','09074705645','bagoodrosalie10@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Switch',41279,'Purok 1-B',NULL,'$2y$10$IcbHgJPaGU7inRNhkT77zuirsjP3rd1ISXYFIj7pw3dOoJZxbZK0K','STUDENT',NULL,'2021-06-23 17:54:46','2021-06-23 17:54:46'),
(184,'JezzelleSalunoyRosca','ROSCA','JEZZELLE JOY','SALUNOY','FEMALE','NEW','2003-07-31','GABUNON TAMBULIG ZAMBOANGA DEL SUR','09516502216','jezzellesalunoyrosca@gmail.com','BSBA-HRM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok 5','2021-06-23 18:02:35','$2y$10$Bf0lFxhzlIv4/fy.WhRqnu.o5/FDczE6.d6/k8yHrRvEQx8QO2HIC','STUDENT',NULL,'2021-06-23 17:54:47','2021-06-23 18:02:35'),
(185,'Mariasumalinog','SUMALINOG','MARIA CHRISTEL MAE','SENO','FEMALE','NEW','2003-09-23','KATIPUNAN RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09550552149','marissumalinog36@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Katipunan',41266,'Purok 1A',NULL,'$2y$10$q.SJg5Z0zSIVa/ftSByHk.NOfLQed6WTt1fpTUtoRukHOyM8QB6Gy','STUDENT',NULL,'2021-06-23 17:55:10','2021-06-23 17:55:10'),
(186,'angelousignar111@gmail.com','SIGNAR','ANGELOU','ABORDO','MALE','NEW','2002-11-17','GUTOKAN DAKO, OZAMIS CITY','09061266182','angelousignar111@gmail.com','BSED','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Malibangcao',25949,'Purok-6','2021-06-23 18:04:53','$2y$10$kXZq4f.hVypSe8xiQbVOGu4X.h5iJX61HRbUN0E7vZVish0HsuYba','STUDENT',NULL,'2021-06-23 17:55:10','2021-06-23 18:04:53'),
(187,'Princes Joy','MALLARI','PRINCES JOY','ALMANOCHE','FEMALE','NEW','2003-07-15','AURORA ZAMBOANGA DEL SUR','09515758094','princesjoyalmanochemallari15@gmail.com','BSED-ENGL','BSED-SOCSTUD','FULL ONLINE',NULL,'Zamboanga del Sur','Aurora','Tagulalo',40809,'San Isidro','2021-06-23 17:56:39','$2y$10$1YKwQcQEpKEQkd9/T1G5X.fMN.wrdO3orBCEPmwQWfrbpcq6vQIS.','STUDENT',NULL,'2021-06-23 17:55:23','2021-06-23 17:56:39'),
(188,'Gina Mae L. Pitogo','PITOGO','GINA MAE','LOREJO','FEMALE','NEW','2003-05-22','MOLAVE ZAMBOANGA DEL SUR','09700480895','ginamaepitogo6@gmail.com','BSBA-MM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok Venus','2021-06-23 17:56:58','$2y$10$FyhR9s4bcBL36qIHi170l.6LElxGlWfAv8jkvJsuilIKzuHrPReO6','STUDENT',NULL,'2021-06-23 17:56:37','2021-06-23 17:56:58'),
(189,'Roselyngulbe','GULBE','ROSELYN','ALIVIO','FEMALE','NEW','2002-12-11','PALILI MIDSALIP ZAMBOANGA DEL SUR','09532676849','gulberoselyn78@gmail.com','BSCS','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Poblacion B',41156,'Purok 3','2021-06-23 17:58:46','$2y$10$cvisCB7Ak7HhUDxlUEfh3uR7L0CoLuFP3xbPWcmszZi/aEkcv/d3u','STUDENT',NULL,'2021-06-23 17:57:15','2021-06-23 17:58:46'),
(190,'pamelaamorsaga18','SAGA','PAMELA AMOR','TAYROS','FEMALE','NEW','2003-06-18','OZAMIS CITY','09362481609','pamelaamorsaga18@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Panaon','Camanucan',26143,'Purok 2',NULL,'$2y$10$lsEt5M/g3qYpOIyIjxyoOeoa3L6seovt2ehOaAzeP9I.EN9Q/UQWa','STUDENT',NULL,'2021-06-23 17:57:45','2021-06-23 17:57:45'),
(191,'MorandanteRosebeth','MORANDANTE','ROSEBETH','SEMINE','FEMALE','NEW','2003-05-24','BAñADERO OZAMIZ CITY','09505254374','bethrose094@gamil.com','BSED-MATH','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'Purok 1-A',NULL,'$2y$10$1TCGDTLPlxHEkDgsBq0W0.k3bfnZbWJhZpfOmwaqRVYZQpw9EbZDG','STUDENT',NULL,'2021-06-23 17:58:34','2021-06-23 17:58:34'),
(192,'patongfernando08@gmail.com','PATONG','FERNANDO JR.','HISOLA','MALE','NEW','2001-10-08','P2 MANGA, TANGUB CITY','09639394147','patongfernando08@gmail.com','AB COMM','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Manga',26263,'Purok 2','2021-06-23 18:42:42','$2y$10$EcH3zmkX/hstLAWFcoweLOZoKPx4O4.HvkNR8wkZqxe88FILGW4qe','STUDENT','EiJwqQwcwBElKhCt8WGwOYOOLwTbU3aZ1F9Q5MZwQ9imAqpjwvRyC5o85aaB','2021-06-23 17:58:39','2021-06-23 18:42:42'),
(193,'retchelynnepomuceno769@gmail.com','NEPOMUCENO','RETCHELYN','HICALE','FEMALE','NEW','2002-12-12','LOWER DIMOROK MOLAVE ZAMBOANGA DEL SUR','09071451105','retchelynnepomuceno769@gmail.com','BS CRIM','BSED-SOCSTUD','BLENDED',NULL,'Zamboanga del Sur','Molave','Lower Dimorok',41173,'Purok 1','2021-06-23 18:02:15','$2y$10$SLoAenNaPKlqvfJvTUa5OOd/ndow5DOzsrY4B2PSge10T0MKUMt8e','STUDENT',NULL,'2021-06-23 17:58:47','2021-06-23 18:02:15'),
(194,'Jinno Magbago','MAGBAGO','JINNO','SABALA','MALE','NEW','2002-10-10','SINONOC,SINACABAN','09516514104','Magbagojinno@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'RUMPE','2021-06-23 18:00:32','$2y$10$dhqfXFCn9uV5EP5FYzP82ewxP2V.Yr6oZcH/AgiKP0gBwXUoAQXum','STUDENT',NULL,'2021-06-23 17:59:51','2021-06-23 18:00:32'),
(195,'cycycellan','CELLAN','DJURDZ CYRIL','JUMAMIL','MALE','NEW','2002-09-25','PONDOL, JUGNO,AMLAN, NEGROS ORIENTAL','09384160947','cycycellan25@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Lower Salug Daku',41091,'Purok 1.Libra','2021-06-23 18:00:38','$2y$10$rkLPMeNOHh3QLQoeBhrv2O1dWSbtPI99G5fkapj6Ubo3Iz3UzC4Ge','STUDENT',NULL,'2021-06-23 18:00:00','2021-06-23 18:00:38'),
(196,'jespreynhel@gmail.com','CALI-AT','NHEL JESPREY','EROY','MALE','NEW','2003-02-19','OROQUIETA CITY','09054916100','jespreynhel@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Misamis Occidental','Panaon','San Andres',26152,'Purok 5','2021-06-23 18:02:30','$2y$10$dK./MiZwDYwCn7D1AL9O9.JZo4DaNr7T15D1PQV5am6pPxFqDQBye','STUDENT',NULL,'2021-06-23 18:00:14','2021-06-23 18:02:30'),
(197,'Mary Rose Go-oc','GO-OC','MARY ROSE','PANTILLO','FEMALE','NEW','2002-11-03','OZAMIS CITY','09050276606','Maryrosego64@gmail.com','BSED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Jimenez','Corrales',25994,'Purok 3',NULL,'$2y$10$uQs45SRok.66pHsbauGp5udNJ9gm6zut1xvlTDyubkiXREIV4zMKi','STUDENT','2NHuEi7pAgShBjy0vijOCqmKZ9jAbimiYBLVS0xDQWuuSorXVkIUzYf6tBPa','2021-06-23 18:00:18','2021-06-24 07:40:20'),
(198,'jevicafernandez123@gmail.com','RIVERA','JEVICA','SINOY','FEMALE','NEW','1994-08-06','POBLACION,MAHAYAG ZAMBOANGA DEL SUR','09977517086','jevicafernandez123@gmail.com','BSBA-MM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'purok3,poblacion mahayag zamboanga del sur','2021-06-23 18:02:40','$2y$10$BNTVzqPsF8wA.62pFo0dzuwIjZ5PBdf2CZCLKzQ9crYgrgzZD2n4a','STUDENT',NULL,'2021-06-23 18:00:29','2021-06-23 18:02:40'),
(199,'Princess Jarry Me','BERJEDA','PRINCESS JARRY ME','PLANGCA','FEMALE','NEW','2001-12-20','MAHAYAG ZAMBOANGA DEL SUR','09384158800','Berjeda.PrincessJarryMe@gmail.com','BSBA-HRM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lourmah',41090,'Purok 3','2021-06-23 18:29:23','$2y$10$jf1/W.SVJBfUwjtlELnoy.i02SRG5sc.dQ1Jn3FSofAp4VdqjIMI2','STUDENT',NULL,'2021-06-23 18:01:17','2021-06-23 18:29:23'),
(200,'stephenjohnsuerte@gmail.com','SUERTE','STEPHEN JHON','GOMERA','MALE','NEW','2002-09-12','SILANGA TANGUB CITY MISAMIS OCCIDENTAL','09108845053','stephenjohnsuerte@gmail.com','BSED','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'Purok 2','2021-06-23 19:52:48','$2y$10$CretMUi4VWussAREHdDYpOlj8N3mNFhhs7yfWcoaifQbUrP0PCMxC','STUDENT','qL52dVD6xQwl3ksmtL4sEYd6w6Q2SDH65IbzPO3SN2gXrHFpd91HOKT8oFG7','2021-06-23 18:01:18','2021-06-23 19:52:48'),
(201,'Joseph jay','UGMAD','JOSEPH JAY','LUCASAN','MALE','NEW','2002-09-01','BALUGO, TAMBULIG ZAMBOANGA DEL SUR','09533282014 & 09207011235','ugmadjosh@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Balugo',41365,'Purok-5','2021-06-23 18:07:48','$2y$10$ULtrcxWw3vh44PCOQe9hde6lJ7SkUy97vwQp2MnOvEpbV68b76Nfe','STUDENT',NULL,'2021-06-23 18:02:10','2021-06-23 18:07:48'),
(202,'HanzelLaraño','LARAñO','HANZEL','CALIMPONG','FEMALE','NEW','2021-08-22','GUINGONA OZAMIZ CITY','09559571551','hanzellarano@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Guingona',26118,'Purok - 1','2021-06-23 18:05:36','$2y$10$UFWo81kYKiFrUskvuQiKj.VfFX/zx6qiGo5Q.zuwYgEmaP28kmT7S','STUDENT',NULL,'2021-06-23 18:02:37','2021-06-23 18:05:36'),
(203,'reynepomuceno10@gmail.com','NEPOMUCENO','REY','DAHUNAN','MALE','NEW','2001-06-09','MOLAVE','09700462507','reynepomuceno10@gmail.com','BSBA-HRM','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Molave','Miligan',41178,'Nangka','2021-06-23 18:07:52','$2y$10$7W.fF3ox4U.Qnke23eu8..CDioN0t3OBnzNT5Z1U.KmCJMi0ol5/m','STUDENT',NULL,'2021-06-23 18:02:57','2021-06-23 18:07:52'),
(204,'Albertoruben','RUBEN','ALBERTO','PUTOT','MALE','NEW','2002-07-05','OZAMIS','09482000085','albertoruben4321@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African daisy 2, zamura','2021-06-23 18:03:31','$2y$10$GlRd8F7FkmOi3H1iPk7C4.PiuSXRvi/hD9jygkhFDEeXs/3YBziJ.','STUDENT',NULL,'2021-06-23 18:03:03','2021-06-23 18:03:31'),
(205,'Pagatpat1998','PAGATPAT','PHILIP IVAN','CASTRO','MALE','NEW','1998-07-07','MOLAVE','09307095968','pphilipivan@gmail.com','BSCS','BSED','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok, Malipayon 1','2021-06-23 18:08:11','$2y$10$FNuApnZgE4H5sBWS4v6uQeZ/iVhoV1zZ9GGSpFPBkWox38AyXmzt6','STUDENT',NULL,'2021-06-23 18:03:52','2021-06-23 18:08:11'),
(206,'jariodanica','JARIO','DANICA','GUMISAD','FEMALE','NEW','2001-03-21','PUROK 6 ABAGA LILOAN BONIFACIO MISAMIS OCCIDENTAL','09639217091','jariodanica@gmail.com','BSED-MAPEH','BSCS','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'Purok 6','2021-06-23 18:10:40','$2y$10$B395uwTF/st4qFccIsdOd.086gZQhUBeyHCpKkOjF6zdIcan0.Jqu','STUDENT',NULL,'2021-06-23 18:05:27','2021-06-23 18:10:40'),
(207,'Kaycee','ESTORQUE','KAYCEE KYAN','MEDRANO','FEMALE','NEW','2002-10-23','CAWIT ZAMBOANGA CITY','09292054117','kayceekyanestorque@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok4','2021-06-23 18:10:18','$2y$10$RNXADy/s55ZmfKX4l8RzCO1MI3WGS/znv0pd9iKc6xJ.I3E96f5NO','STUDENT',NULL,'2021-06-23 18:05:36','2021-06-23 18:10:18'),
(208,'QuijanoG','QUIJANO','GEORGE','KUINISALA','MALE','NEW','2002-11-16','LORENZO TAN TANGUB CITY','09065452788','georgequijano08@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok 3','2021-06-23 18:09:14','$2y$10$9v5Rv73HtlRf/WmKbzyOIuosDBbcWhRPQYpZb3qol7khPDv02FqEy','STUDENT',NULL,'2021-06-23 18:06:07','2021-06-23 18:09:14'),
(209,'jennyceltejano25@gmail.com','TEJANO','JENNYCEL','MORALES','FEMALE','NEW','2002-08-25','DOñ, MARIA D. TAN MEMORIAL HOSPITAL','09465467396','jennyceltejano25@gmail.com','GEN  MID','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok-3','2021-06-23 18:09:46','$2y$10$2wBo4AItAMkRsjYbuoNIuupr1IbP3.olgkSABhaQ4t8dPNZAb17gW','STUDENT',NULL,'2021-06-23 18:06:13','2021-06-23 18:09:46'),
(210,'princesscaliao01','CALIAO','PRINCESS','TACAL','FEMALE','NEW','1999-10-01','OROQUIETA CITY','09308476482','caliaoprincess4@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Conat',25839,'Purok 6, Conat, Aloran,Misamis Occidental','2021-06-23 18:08:22','$2y$10$CWOqKoqZfHpr6my6Vznl7uj5tWCsRm7pokM8lVfY0mkEnlcgN31zK','STUDENT',NULL,'2021-06-23 18:06:15','2021-06-23 18:08:22'),
(211,'astronomoclark@gmail.com','ASTRONOMO','CLARK REIZEL','MEGALLON','FEMALE','NEW','2002-05-28','LOWER TIMONAN,DUMINGAG ZAMBOANGA DEL SUR','09517927375','astronomoclark@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Dumingag','Lower Timonan',40946,'7','2021-06-23 18:20:03','$2y$10$0egW42GYSARu6OxUEMd8XOvpeVOeTmwMtJazcUFy3Jxi3lHfgi1cC','STUDENT',NULL,'2021-06-23 18:07:15','2021-06-23 18:20:03'),
(212,'Villartarosemarie26','VILLARTA','ROSEMARIE','DOMAT-OL','FEMALE','NEW','2002-10-26','DOñA MARIA D.  TAN MEMORIAL HOSPITAL TANGUB CITY','09091996151','villartarosemarie83@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Villaba',26289,'1','2021-06-23 18:16:22','$2y$10$rOHbZuBFKksc/57K159gGePZGW6kZPvEShbUE0VMIuPOeVMtQGbcO','STUDENT',NULL,'2021-06-23 18:07:16','2021-06-23 18:16:22'),
(213,'JairahLapura@yahoo.com','LAPURA','JAIRAH MAE','GAMALE','FEMALE','NEW','2002-09-20','SUMASAP PANAON MIS. OCC','09465037468','JairahLapura@yahoo.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Panaon','Sumasap',26155,'1',NULL,'$2y$10$T2tvHvetE37r8Fi.hd.AD.b8BI1ZaNaecEmGdeYAKBsnayJysFFZK','STUDENT',NULL,'2021-06-23 18:07:21','2021-06-23 18:07:21'),
(214,'maryjaymocoyybanez','YBAñEZ','MARY JAY','MOCOY','FEMALE','NEW','2003-03-15','BAG-ONG KAUSWAGAN TAMBULIG ZAMBOANGA DEL SUR','+639776607859','maryjaymocoyybanez2003@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Bag-Ong Kauswagan',41363,'Purok 7','2021-06-23 18:13:33','$2y$10$fjjRrZUxaoKO/yFK2gtfg.JLnXThhOqhe6MnghYhyzf9o/Agr9EFi','STUDENT',NULL,'2021-06-23 18:09:13','2021-06-23 18:13:33'),
(215,'Ricalyn Gutierrez','GUTIERREZ','RICALYN','TAYROS','FEMALE','NEW','2003-01-15','PASIG CITY, MANILA','09386864524','ricalyngutierrez.14@gmail.com','BSED','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Campo IV',41259,'Purok Malambuon','2021-06-23 18:14:25','$2y$10$6UrenyvbPYrv1y29hQrUzOzyLLmIL.s85Tj4sKhbsnIC3ouEPrm7O','STUDENT',NULL,'2021-06-23 18:10:22','2021-06-23 18:14:25'),
(216,'09515753425','VIñA','MELOJANE','TANGCA-AN','FEMALE','NEW','2001-10-07','CANIBUNGAN DAKU CLARIN MISAMIS OCCIDENTAL','09515753425','vinamelojane@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Clarin','Canibungan Daku',25936,'Purok 3','2021-06-23 18:35:17','$2y$10$Aww0hHQ4r0GLknqzhtNg/eDJUQQDetYrvFqYfcrh8.lcVZj5vPh9y','STUDENT',NULL,'2021-06-23 18:10:45','2021-06-23 18:35:17'),
(217,'cjanerem@gmail.com','REMOSIL','CHERRY JANE','MOLINA','FEMALE','NEW','2002-11-15','LAGATA COMPOUND SUDLON,MOLAVE,ZAMBOANGA DEL SUR','09512638588','cjanerem@gmail.com','AB POLSCI','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Lagata Compound',NULL,'$2y$10$nUUlCAmOwi1ht/EaH6VXHua1w5miPfBEfixnoHT.X/Sr7Onc3RpnC','STUDENT',NULL,'2021-06-23 18:10:45','2021-06-23 18:10:45'),
(218,'Stephanie','ARAO','STEPHANIE JOYCE','LASTIMOSO','FEMALE','NEW','2002-08-11','STA. LUCIA, PAGADIAN CITY','09303631587','ffetz1991@gmail.com','BSED','BEED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'Purok 7','2021-06-23 18:12:27','$2y$10$D8c2W8b4bMJutKleKCOKP.f9/V9t.Rb02RKlclmvFgUgz7NVwkW7C','STUDENT',NULL,'2021-06-23 18:11:29','2021-06-23 18:12:27'),
(219,'Rhea Jean','GANIOLON','RHEA JEAN','LAPITAN','FEMALE','NEW','2002-04-08','ISIDRO D. TAN, TANGUB CITY','09187132832','rheajean.ganiolon@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purok I','2021-06-23 18:12:27','$2y$10$0dGmhC1bElnSOPfPO/fYEOytsSKx6ZofF6l/A6w0XqK8xSq411wo.','STUDENT',NULL,'2021-06-23 18:11:46','2021-06-23 18:12:27'),
(220,'Allysa Mendoza','MENDOZA','ALLYSA BELLE','QUILICOT','FEMALE','NEW','2002-09-13','DEL CARMEN LUBAO PAMPANGA','09772739070','allyzamendoza13@gmail.com','BSED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'P-8 Catadman','2021-06-23 18:13:21','$2y$10$12vU6NTbHMwglYoRq0AJguO9LcT88g8oyysVkaHi.KvofT6VTpo4O','STUDENT',NULL,'2021-06-23 18:12:37','2021-06-23 18:13:21'),
(221,'Manalaoalexies@gmail.com','MANALAO','ALEXIES MAE','FUENTES','FEMALE','NEW','2002-01-14','BAGONG PAG-ASA QUEZON CITY','09061801952','manalaoalexies@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Poblacion II',25955,'Purok 5 basa st.','2021-06-23 18:14:25','$2y$10$3pI6bLQzWwd82KjmSKJwd.80BhZOEs9Sf7g/HABc9hZ1UZP9QuzoK','STUDENT',NULL,'2021-06-23 18:13:45','2021-06-23 18:14:25'),
(222,'bunsualenwel067@gmail.com','BUNSUA','LENWEL','AGBONA','MALE','NEW','2002-10-01','OZAMIZ CITY','09664732641','bunsualenwel067@gmail.com','BSED-MATH','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'P-1','2021-06-23 18:14:35','$2y$10$w7xGHUd7aOJjKDOOY6nGZup.ZNJh6FUnK0IX9W9fIuQe7zCfnhTIi','STUDENT',NULL,'2021-06-23 18:14:08','2021-06-23 18:14:35'),
(223,'jessaamemong@gmail.com','AMEMONG','JESSA','TADLAS','FEMALE','NEW','1998-02-07','BOGO CAPALARAN, MOLAVE, ZDS.','09229517522','jessaamemong@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Olive','2021-06-23 18:15:22','$2y$10$WVoXiFnuCMFOY5EyR7Pzie7Wrjy3MrpXbCDXDBPKFg0aJXTe1YsSC','STUDENT',NULL,'2021-06-23 18:14:12','2021-06-23 18:15:22'),
(224,'Maeregine','TUMILAP','MAEREGINE','SOLIS','FEMALE','NEW','2002-05-30','VILLABA TANGUB CITY','09489759319','maeregine.tumilap@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Villaba',26289,'Purok 1','2021-06-23 18:20:15','$2y$10$.S2gJyEaZ2c5HYNr4gwhgeUlhxvvGPYmksxGqnmByo.HzwfelDbYe','STUDENT',NULL,'2021-06-23 18:14:57','2021-06-23 18:20:15'),
(225,'Joshua_Sauro','SAURO','JOSHUA','OMPOC','MALE','NEW','1999-05-24','OZAMIZ CITY','09516568318','joshuasauro24@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Pulot',26132,'Purok-6','2021-06-23 18:17:50','$2y$10$sbUb1nyAqOq0GEiYBkiKj.an1lW3C91qoJwZUxZRZoeieh2wMDEI6','STUDENT',NULL,'2021-06-23 18:16:07','2021-06-23 18:17:50'),
(226,'delosreyesjengyqueen2001@gmail.com','DELOS REYES','JENGY QUEEN','RODRIGUEZ','FEMALE','TRANSFEREE','2001-04-25','MHARS OZAMIS','09518837922','delosreyesjengyqueen2001@gmail.com','BSBA-HRM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'P4','2021-06-23 18:17:30','$2y$10$Wf3XLh3jnoL3mxuqWdfdaOVDRQHDuY418lPSk6AkCEYfmLUJMja2e','STUDENT',NULL,'2021-06-23 18:16:30','2021-06-23 18:17:30'),
(227,'Jayjango11','PAREDES','JAY D\' JANGO','BROWN','MALE','NEW','2002-12-11','BONIFACIO MISAMIS OCCIDENTAL','+639701221066','diazbanglos@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 2','2021-06-23 18:27:30','$2y$10$ptavSWBh4QuYeQ4272z5FesKdsBch23qSU8OdMgWEaRKbobYRdVvG','STUDENT',NULL,'2021-06-23 18:17:10','2021-06-23 18:27:30'),
(228,'punishercasas@gmail.com','CASAS','MODESTO JR.','SUNGAHID','MALE','NEW','2002-08-14','POB.B, MIDSALIP, ZAMBOANGA DEL SUR','09073302331','punishercasas@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Aurora','Bagong Mandaue',40771,'Purok 3','2021-06-23 18:17:57','$2y$10$ti/ylISXCaQuZo1vQNMlk.ulWIn288VMQQM4Aa4wJtPlzuO2q1LB2','STUDENT',NULL,'2021-06-23 18:17:11','2021-06-23 18:17:57'),
(229,'SabalJes','JESSA','SABAL','DELA CRUZ','FEMALE','NEW','2002-12-26','TANGUB CITY','09555994889','jessasabal608@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','San Miguel','Mati',41294,'Purok 4','2021-06-23 18:18:08','$2y$10$yEKqWgVVedwr3F7EnOCLT.tcIRqRPgCBO4KMtyoUNzVhNKPWI4XXe','STUDENT',NULL,'2021-06-23 18:17:18','2021-06-23 18:18:08'),
(230,'AcunoE','ACUNO','ELPIE JHON','AM-IS','MALE','NEW','2003-02-02','ROXAS, PALAWAN','09639289404','elpieacuno394@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok-2',NULL,'$2y$10$XyBtSA1Ud4Dq6lHchblD1uoMYA/ZpBYEZmWoCGOSKk1ueqxopWb5S','STUDENT',NULL,'2021-06-23 18:17:31','2021-06-23 18:17:31'),
(231,'Joshua A. Barquin','BARQUIN','JOSHUA','ATON','MALE','NEW','2003-03-03','CEBU CITY','09618055731','Barquinjoshwang@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Panaon','San Andres',26152,'PUROK-3',NULL,'$2y$10$cRzwPkVzReSWAP3IfpRR3OCbXcwaO.r3fEfDhLbmwcKUM5PNhvabq','STUDENT',NULL,'2021-06-23 18:17:41','2021-06-23 18:17:41'),
(232,'Shaina','ABACIAL','SHAINA','CABISAY','FEMALE','NEW','2003-07-09','MIGCANAWAY,TANGUB CITY','09954845671','shaina.abacial03@gmail.com','BSED','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Purok Saging-saging/Deloso Street','2021-06-23 18:21:57','$2y$10$I4xyFcVWuuNeZjNyPkSz0eG4qKXylgN1a.pEESvcbiGW6xzmtQTCu','STUDENT',NULL,'2021-06-23 18:18:10','2021-06-23 18:21:57'),
(233,'AlfredoSiaboc','SIABOC','ALFREDO','SAGA','MALE','NEW','2021-12-17','SAN ANDRES PANAON','09368285670','pedrosiaboc085@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Panaon','San Andres',26152,'PUROK-3','2021-06-23 18:40:43','$2y$10$2YqObomiJ5TXdWNkTizMfu2yr66wXn1eSKOk3BzEJQOxvHbpHlZmG','STUDENT',NULL,'2021-06-23 18:18:31','2021-06-23 18:40:43'),
(234,'Bebiejoy','CABALLES','BEBIE JOY','C.','FEMALE','NEW','2001-10-08','BARANGAY 6 TANGUB CITY','09510898980','bebiejoycaballes19@gmail.com','BSED-MAPEH','BSED-ENGL','FULL ONLINE',NULL,'Surigao del Sur','San Agustin','Gata',39018,'P-6 Hamburger','2021-06-23 18:21:40','$2y$10$ijN0iP880ewvdnWhseqMVeEiSfpCUf.IJoRQ.bupwFsVIH9vAH4YC','STUDENT',NULL,'2021-06-23 18:18:38','2021-06-23 18:21:40'),
(235,'chinitamorein0813@gmail.com','ALJAS','CHRISTINE MAE','MONTEMOR','FEMALE','NEW','2003-01-13','OZAMIS CITY','09458592610','chinitamorein0813@gmail.com','BSBA-MM','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Maloro',26262,NULL,'2021-06-23 18:40:25','$2y$10$FL4AaS3r2Q8NcWb2AO4nI.l9hJ5j.btw5Lsbzp5VBfSeJZfIHgNhS','STUDENT',NULL,'2021-06-23 18:18:50','2021-06-23 18:40:25'),
(236,'Glyeah Castillon','CASTILLON','GLYEAH ANGELA','','FEMALE','NEW','2002-08-02','PANAON MISAMIS OCCIDENTAL','09383003215','eahcastillon@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Panaon','Punta',26150,'Purok7 Punta Panaon','2021-06-23 18:20:24','$2y$10$Ia6QB4K7nZ6FkGEOglyKxuIcyBJSLdejSkmCgTlQc5KxP6KRB0AOa','STUDENT',NULL,'2021-06-23 18:19:48','2021-06-23 18:20:24'),
(237,'mikepahilan25','PAHILAN','MIKE LAURENCE','SALUNOY','MALE','NEW','2002-07-25','GABUNON, TAMBULIG, ZAMBOANGA DEL SUR','09451291869','mikelaurencepahilan@gmail.com','BSED-MATH','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok-5','2021-06-23 18:20:40','$2y$10$mJFFit0Jbf/PHnP1VbG/AunkL6IW0oyYSba9hJr6FuZWm1gInqtUC','STUDENT',NULL,'2021-06-23 18:20:15','2021-06-23 18:20:40'),
(238,'Yhemafe','SAHUL','YHEMAFE','SUMAYLO','FEMALE','NEW','2003-02-11','CALOLOT,TAMBULIG ZDS','09162307235','Yhemafe@icloud.com','BS CRIM','BSED','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purple 1','2021-06-23 20:10:28','$2y$10$ve/M2lv1CPy21dTQggmfHO3I7ygVyZ2a.1BQJh6cBS6PD0NzmcsIe','STUDENT',NULL,'2021-06-23 18:20:58','2021-06-23 20:10:28'),
(239,'apriljaymacarayo23@gmail.com','MACARAYO','APRIL JAY','NONE','MALE','NEW','2021-04-14','OZAMIS CITY','09632349273','apriljaymacarayo23@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'Purok 2','2021-06-23 18:23:22','$2y$10$xtx7VAkwPtpULe87F76ZQ.8oA9.GIhvdaoKP9622FpZzQUVcEQKXG','STUDENT',NULL,'2021-06-23 18:21:15','2021-06-23 18:23:22'),
(240,'Jaspertaotoan20@gmail.com','TAOTO-AN','JASPER LLOYD','MARTINEZ','MALE','NEW','2002-07-27','PUROK 4,DIGSON,BONIFACIO,MISAMIS OCCIDENTAL','09486449974','Jaspertaotoan20@gmail.com','BSED-MAPEH','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Bonifacio','Digson',25894,'Purok 4','2021-06-23 18:40:32','$2y$10$pVEghG92WzJf1vxjrb/5o.At5nECV.UURk1InAkt3o9FFSD0fy/Cq','STUDENT',NULL,'2021-06-23 18:21:20','2021-06-23 18:40:32'),
(241,'dinopoljaylord78@gmail.com','DINOPOL','JAY LORD','ABELLA','MALE','TRANSFEREE','1999-01-31','LOWER USOGAN','09518837942','dinopoljaylord78@gmail.com','BSBA-HRM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Lower Usugan',25901,'P5','2021-06-23 18:23:24','$2y$10$DgtllCnduBrvAej8zrNg6ONJWDqbx/7qdcxwC3TM0NjcwrOzlmBsa','STUDENT',NULL,'2021-06-23 18:22:15','2021-06-23 18:23:24'),
(242,'Phelipsamporna@gmail.com','SAMPORNA','PHELIP','CONCHAS','MALE','NEW','2002-11-19','MIALEN, CLARIN, MISAMIS OCCIDENTAL','09102863387','philsamporna@gmail.com','BSCS','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Mialen',25951,'Purok 2 Mialen','2021-06-23 18:24:37','$2y$10$eHNa5qM7q9VTJmzPCj64w.wJFN8TPjZKuQfnG28T65Iop5VFfmjfu','STUDENT',NULL,'2021-06-23 18:22:47','2021-06-23 18:24:37'),
(243,'aprilrosemonteza02@gmail.com','MONTEZA','APRIL ROSE','ABIABI','FEMALE','NEW','2003-04-04','POBLACION UNO,CLARIN,MISAMIS OCCIDENTAL','09382791793','aprilrosemonteza02@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Poblacion I',25954,'Purok 6','2021-06-23 18:25:59','$2y$10$bKFYkChkaH7JzBbW.Neu8e4IcZyk86dpp9THwzHPuXoB7Uk7bCTyK','STUDENT',NULL,'2021-06-23 18:22:55','2021-06-23 18:25:59'),
(244,'09361793900','CABUSAS','CHERRYL ANN','DRAGON','FEMALE','NEW','2002-06-24','BACOLOD LANAO DEL NORTE','09359801330','cabusascheng@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Lanao del Norte','Lala','Maranding',19961,'Purok Narra Maranding Lala Lanao Del Norte','2021-06-23 18:27:39','$2y$10$heqUINJFd6pR7UDDAx6ff.DhC59.RQiZjC/xUsBP7XSOqXRl2JeQy','STUDENT',NULL,'2021-06-23 18:22:59','2021-06-23 18:27:39'),
(245,'JersonTiken','TIKEN','JERSON','GADOGDOG','MALE','NEW','2001-02-28','STA. CRUZ DAVAO DEL SUR','09067934097','jersontiken7@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Lanao del Norte','Lala','Raw-An',19967,'P-4 Raw an Lala','2021-06-23 18:25:40','$2y$10$Yu9FIqDF5Fq5RYlciFU1QOqV24ZAJaYrhx1WGsSDOQ9CoMS6pAp8y','STUDENT',NULL,'2021-06-23 18:23:08','2021-06-23 18:25:40'),
(246,'alguzarremelito27@gmail.com','ALGUZAR','REMELITO','SUBESA','MALE','NEW','2002-02-07','GINGOOG CITY, MISAMIS ORIENTAL','09683013687','alguzarremelito27@gmail.com','BS CRIM','BEED','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Dullan',25842,'P-5',NULL,'$2y$10$75xFz.uHmSO9e3MDUXV6Me4e4zcDrxTPZaszaLpSMH7iJtPE//wOW','STUDENT',NULL,'2021-06-23 18:23:45','2021-06-23 18:23:45'),
(247,'Dale','OVALO','SHEM DALE','CHATA','MALE','NEW','1999-10-25','CALAMBA MISAMIS OCCIDENTAL','09484568969','shemdaleovalo25@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Brgy. Sta.Maria',NULL,'$2y$10$LWOyq3QoCS2tjp7zmI/VtO/JAwbianOrKwnQbdPDX6XpNmZECiVeC','STUDENT',NULL,'2021-06-23 18:23:48','2021-06-23 18:23:48'),
(248,'roseniñamalazarte08','MALAZARTE','ROSE NIñA','REPUELO','FEMALE','NEW','2003-01-08','OROQUIETA CITY','09078769302','malazartecydrick@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Conat',25839,'Purok 6, Conat, Aloran,Misamis Occidental','2021-06-23 18:26:33','$2y$10$k6Bi38Jjuh4.0SxFpNr/0uT70nG09xdqESA9FZ7Nx1KclcA2DlCW.','STUDENT',NULL,'2021-06-23 18:24:53','2021-06-23 18:26:33'),
(249,'Lovely','EDULLANTES','LOVELY','BACALING','FEMALE','NEW','2003-03-15','STA.CRUZ TANGUB CITY','09613693280','lovely.edullantes@gamil.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'Purok-3',NULL,'$2y$10$kHaV1v4LtjwPrIYpn9MVcecG4c4TxbOgYPh.4F9fTbPb0UOsGcg7G','STUDENT',NULL,'2021-06-23 18:25:00','2021-06-23 18:25:00'),
(250,'kris_desiree','PAMAYLAON','KRIS DESIREE','CABRERA','FEMALE','NEW','2001-12-02','DIPOLO, MOLAVE ZAMBOANGA DEL SUR','09095264609','krisdesiree18@gmail.com','BSBA-HRM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Dipolo',41169,'Purok Melon, Dipolo Molave Zamboanga del Sur','2021-06-23 18:26:03','$2y$10$2r/CpMQhQ3bVHW7ap5X9J.vC511FTfYJiRm/PIjFm6RUnuYfSIY7q','STUDENT',NULL,'2021-06-23 18:25:32','2021-06-23 18:26:03'),
(251,'Pamelaamor1803@gmail.com','SAGA','PAMELA AMOR','TAYROS','FEMALE','NEW','2003-06-18','SMLAO HOSPITAL OZAMIZ CITY','09362481609','pamelaamorsaga1803@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Panaon','Camanucan',26143,'Purok-2','2021-06-23 18:29:27','$2y$10$eT.nmRvj8mLpvGjLZ5sQd.T1xjOZwdeqFC5pcNT1ODFUhM9mLwk7W','STUDENT',NULL,'2021-06-23 18:25:44','2021-06-23 18:29:27'),
(252,'cybilnabua@gmail.com','NABUA','ROSE CYBIL','MANGUBAT','FEMALE','NEW','2002-10-22','STA.MARIA TANGUB CITY','639303704297','cybilnabua@gmail.com','BSBA-HRM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok-3','2021-06-23 18:28:00','$2y$10$x85TVcgy36.OgeDqxQNawucX911H17.4nzE8ashi7Gt1GzOsh/Qyu','STUDENT',NULL,'2021-06-23 18:26:55','2021-06-23 18:28:00'),
(253,'bolayogailenegrace@gmail.com','BOLAY-OG','AILENE GRACE','NERI','FEMALE','NEW','2003-01-07','P-2 CANIBUNGAN DAKU, CLARIN, MISAMIS OCCIDENTAL','09105302832','bolayogailenegrace@gmail.com','BSED-MATH','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Clarin','Canibungan Daku',25936,'Purok 2','2021-06-23 18:29:16','$2y$10$OLpU1heDS4m.3jqBhr0z1em2sVcBpGMQUZJE2yLeaguQ47c8Q1Kiy','STUDENT',NULL,'2021-06-23 18:26:57','2021-06-23 18:29:16'),
(254,'jarinerivera06@gmail.com','RIVERA','JARINE','DELUNA','MALE','NEW','1998-07-06','UPPER DIMOROK','09386825621','jarinerivera06@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Lakatan',NULL,'$2y$10$n02mv2WpkcWIP2wp8.z0/uWQO5qBwG6eU9Il5fLEKviwd9klZAa4i','STUDENT',NULL,'2021-06-23 18:27:32','2021-06-23 18:27:32'),
(255,'Wendell Beth E. Alcachupas','ALCACHUPAS','WENDELL BETH','EBARORA','FEMALE','NEW','2002-09-03','OZAMIZ CITY','09272771297','alcachupaswendellbeth@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok 7','2021-06-23 18:31:05','$2y$10$5IjgtFVqb5lRSMGSSOwCJeIejmtJrL2WLjlkRZg6UiOObBWe0AUtC','STUDENT',NULL,'2021-06-23 18:27:35','2021-06-23 18:31:05'),
(256,'nirvzosabel@gmail.com','OSABEL','NIRVANAH','','FEMALE','NEW','2003-07-09','DMDTMH TANGUB CITY','+639510898852','nirvzosabel@gmail.com','BSED-FIL','BEED','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purok 2','2021-06-23 19:25:49','$2y$10$WRQ19VChh.EancxQJNzhGujMNkaWHuOR4jqfD3rJpxrQ7cd8TizN2','STUDENT',NULL,'2021-06-23 18:27:59','2021-06-23 19:25:49'),
(257,'Kristalshientorres','TORRES','KRISTAL SHIEN','DAPIN','FEMALE','NEW','2021-03-07','03/07/01','09317529246','tkristal22@gmail.com','BSED-ENGL','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Oroquieta City','Layawan',26063,'P-3 Brgy. Layawan',NULL,'$2y$10$GlvLrM5h0T3gDqPWyMzET.Q6eXmVZn1x24WGzHnD1cU0zjWceoj42','STUDENT',NULL,'2021-06-23 18:28:32','2021-06-23 18:28:32'),
(258,'robertcaspe96@gmail.com','CASPE','ROBERT','BALIOS','MALE','NEW','1996-10-02','DASMARIñAS CAVITE','09972366360','robertcaspe96@gmail.com','BSED-ENGL','BSED-MATH','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Cabol-Anonan',26295,'Purok 4 Cabol-Anonan,Tudela,Misamis, Occidental','2021-06-23 18:32:16','$2y$10$VCd9OggpVwdrvgnoAjs90OVToVZhnEJ0jNBdQNCbc0.Cg672gPMe6','STUDENT',NULL,'2021-06-23 18:28:35','2021-06-23 18:32:16'),
(259,'09510332668','MANLEGRO','RONIE JOSEP','NONE','MALE','NEW','2002-08-28','OZAMIZ CITY','09510332668','roniemanlegro@gmail.com','AB POLSCI','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'P7',NULL,'$2y$10$1CEWDhy7VwQJTOYt4ly82uhd49FXu8iunhz8sTy1ENv5Ks2yEj71q','STUDENT',NULL,'2021-06-23 18:28:58','2021-06-23 18:28:58'),
(260,'rebuyalorenz@gmail.com','REBUYA','MAR LORENZ','UGMAD','FEMALE','NEW','2003-02-11','LOWER SANTO NIÑO, MAHAYAG, ZAMBOANGA DEL SUR','09072806465','rebuyalorenz@gmail.com','BSBA-HRM','AB COMM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lower Santo Ni±o',41092,'Purok 6','2021-06-23 18:31:55','$2y$10$4VvER6ZWjN5JxWMrXhY67Om6obQVJOFvPlCBgzS0vqEQjhTJUhnna','STUDENT',NULL,'2021-06-23 18:29:00','2021-06-23 18:31:55'),
(261,'Joshua Aton Barquin','BARQUIN','JOSHUA','ATON','MALE','NEW','2003-03-03','CEBU CITY','09618055731','joshuaatonbarquin123@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Panaon','San Andres',26152,'PUROK-3','2021-06-23 18:33:11','$2y$10$wsUwGWt2rcKw5JaWE7iRUOPY67pOlkr6aHSuuavhcgOXeUQOPyVIS','STUDENT',NULL,'2021-06-23 18:29:28','2021-06-23 18:33:11'),
(262,'dfgm2002@gmail.com','MACALISANG','DESTINY FAITH','GANOHAY','FEMALE','NEW','2002-10-03','TUDELA MUNICIPAL HOSPITAL','09505665603','dfgm2002@gmail.com','BSBA-MM','BSED-MATH','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Libertad Alto',26225,'Purok 1','2021-06-23 18:37:31','$2y$10$5EqSaTMGxCsedfD7scK8tud5KakVKR91xHt2Bm6XeFtXaf8V6Fofa','STUDENT',NULL,'2021-06-23 18:29:30','2021-06-23 18:37:31'),
(263,'Kyle_Musico63','MUSICO','KYLE CHRISTIAN','DURA','MALE','NEW','2002-12-07','SEñOR, SINACABAN, MISAMIS OCCIDENTAL','09272760265','kylechristianmusico63@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Se±or',26232,'Purok Sweethoney','2021-06-23 18:39:44','$2y$10$VNGR6l0i1YfRk54FJbeSreoBouYU5CKVlmk9UAfmnkBOb4ppdskeS','STUDENT',NULL,'2021-06-23 18:29:48','2021-06-23 18:39:44'),
(264,'jastenruthv@gmail.com','VELOS','JASTEN RUTH','ORTIZ','FEMALE','NEW','2003-02-05','MHARS GEN. HOSPITAL','09380024204','jastenruthv@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok-3','2021-06-23 18:31:18','$2y$10$IfZ3fkOeCZQygWVEre/ozOYKPhJ8JwhHMRhwickfUAnUrcwK1u4Zi','STUDENT',NULL,'2021-06-23 18:30:08','2021-06-23 18:31:18'),
(265,'Jaica Almojallas','ALMOJALLAS','JAICA','ALCORIN','FEMALE','NEW','2002-09-27','BRGY. CALOLOT, TAMBULIG','09679320272','jaicaalmojallas17@gmail.com','BS CRIM','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 4',NULL,'$2y$10$01y8FJJE4Mhn/Rd629zf6e7TpEe9ZMyooRRMasd.1MTRTAZMYmGi2','STUDENT',NULL,'2021-06-23 18:30:36','2021-06-23 18:30:36'),
(266,'Arian Mae Caballero','CABALLERO','ARIAN MAE','ABENES','FEMALE','NEW','2003-07-08','TUMAPIC, MAHAYAG ZAMBOANGA DEL SUR','09704483211','arianmaeacaballero@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Tumapic',41108,'Purok 1',NULL,'$2y$10$L5qyYikLTtSTyCXL3XrVz.GHENiSCJdGCiftMyOCwODXKLOrdXtYO','STUDENT',NULL,'2021-06-23 18:30:45','2021-06-23 18:30:45'),
(267,'lopezvince0044@gmail.com','LOPEZ','VINCE FROILAN','ACUñA','MALE','NEW','2002-12-23','QUEZON CITY','09771327835','lopezvince0044@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Panaon','Poblacion',26149,'Purok 4','2021-06-23 18:31:33','$2y$10$BhvcppdUNCxQg2irazoovuU4sgGqpKEpDFWIjEZVjKTOT75NN6ioK','STUDENT',NULL,'2021-06-23 18:31:02','2021-06-23 18:31:33'),
(268,'RosalieBago-od','BAGO-OD','ROSALIE','SANGEL','FEMALE','NEW','2001-12-06','BUENASUERTE, TUKURAN, ZAMBOANGA DEL SUR','09074705645','bagoodrosalie10@gmail','BSBA-MM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Switch',41279,'Purok 1-B',NULL,'$2y$10$HhwIHDv6zga/JHqPQ.fRh.CCneNTbR1dFQObz0q7T/rXNoJ9yMa4K','STUDENT',NULL,'2021-06-23 18:32:25','2021-06-23 18:32:25'),
(269,'Kyle Cahigas','CAHIGAS','KYLE','EMONG','MALE','NEW','2003-05-10','MHARS GEN. HOSPITAL','09639396903','kcahigas9@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Guba',25944,'Purok 4','2021-06-23 18:47:37','$2y$10$I3L445hH/fbDnMhs2wKnsOWCDXHMSUhPyAzkpJe69HywKsQemB0li','STUDENT',NULL,'2021-06-23 18:32:32','2021-06-23 18:47:37'),
(270,'Alfredosagasiaboc','SIABOC','ALFREDO','SAGA','MALE','NEW','2003-12-17','SAN ANDRES PANAON','09368285670','alfredsaga90@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Panaon','San Andres',26152,'PUROK-3',NULL,'$2y$10$CdYVAtW6CXoolnslbvTEhe8r9pXYLSGlnMGqHiIVRLLSGx2hxm3JC','STUDENT',NULL,'2021-06-23 18:33:02','2021-06-23 18:33:02'),
(271,'Kylaviernesmarie@gmail.com','VIERNES','KYLA MARIE','EDO','FEMALE','NEW','2003-07-18','PUROK 6- KINANGAY NORTE CLARIN MISAMIS OCCIDENTAL','09464919269','Kylaviernesmarie@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Kinangay Norte',25945,'Purok 6','2021-06-23 18:34:35','$2y$10$5RAq8aafBvQo8zb.HNHuVuSFZBHxSjNRBwKuXSHhUsN3Kce7ZyooG','STUDENT',NULL,'2021-06-23 18:33:11','2021-06-23 18:34:35'),
(272,'Jydamigo','AMIGO','JYD DHARYL','','MALE','NEW','2003-05-08','MOLAVE,CULO ZAMBOANGA DEL SUR','09380251333','jydamigo22@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok Malipayon 1','2021-06-23 18:39:02','$2y$10$q09YKyShFUamA4rTZkAhvOlZxlhgGQERBnlLEf.UWoPVd9umb4fnS','STUDENT',NULL,'2021-06-23 18:34:12','2021-06-23 18:39:02'),
(273,'Joann Dasok','DASOK','JOANN','DANGIN','FEMALE','NEW','2002-10-22','NAPUROG,TUDELA,MIS.OCC.','09510322250','Joanndangindasok@gmail.com','GEN  MID','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Napurog',26314,'Purok 2','2021-06-23 19:06:01','$2y$10$7QYQ3FXRLHRkBlI3HCr24exwCDSmjGvldbu/Yu7kV/7ofr.aeldya','STUDENT',NULL,'2021-06-23 18:34:15','2021-06-23 19:06:01'),
(274,'hannagressy@gmail.com','BROñOLA','HANNA GRACE','REBUSTO','FEMALE','NEW','2002-11-03','LOWER SAGADAN BAROY LANAO DEL NORTE','09078834866','hannagressy@gmail.com','BSED-ENGL','BSED-FIL','BLENDED',NULL,'Lanao del Norte','Tubod','Camp V',20260,'Purok-1','2021-06-23 18:39:46','$2y$10$oNo8O8zrO1xV2eHIURwe3eOqf7J.8TRv9gifsdfvsKowatM8DTOUi','STUDENT',NULL,'2021-06-23 18:34:17','2021-06-23 18:39:46'),
(275,'Romeric','ESTRIBOR','ROMERIC','BAHIAN','MALE','NEW','2002-11-03','TAMBULIG, ZAMBOANGA DEL SUR','09081630254','estriborromeric@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Plaridel','Southern Poblacion',26186,'Purok 3','2021-06-23 18:36:49','$2y$10$WBWG6xnOPFnLUuazDuNpu.r88QuIA/KcqPiJJpqr36ug0/7dAoKKa','STUDENT',NULL,'2021-06-23 18:34:19','2021-06-23 18:36:49'),
(276,'Irenemendaros@gmail.com','MENDAROS','IRENE','TUñACAO','FEMALE','NEW','2002-12-05','PANAGHIUSA, AURORA ZAMBOANGA DEL SUR','09096527438','irenemendaros03@gmail.com','BSOA','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Aurora','Panaghiusa',40802,'Purok Regla','2021-06-23 18:44:14','$2y$10$bew21xKHmr97AT1erDXt0er5fB.Uu5Z277t8CrU5A.E/7EUEbQviG','STUDENT',NULL,'2021-06-23 18:34:27','2021-06-23 18:44:14'),
(277,'Jasongongob','GONGOB','JASON','QUIMNO','MALE','NEW','2002-12-25','SAN APOLINARIO TANGUB CITY , MISAMIS OCCIDENTAL','09381447750','justcallmegongob12@gmail.com','BSED','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','San Apolinario',26276,'P_3 San Apolinario  Tangub City','2021-06-23 18:35:43','$2y$10$.NL/6PZKkWXY0ZxEW9qYlO6njJLK1sgbPC678/a9YBOA325YHsL2a','STUDENT',NULL,'2021-06-23 18:34:32','2021-06-23 18:35:43'),
(278,'Eve','BAYADOG','EVE','BESTO','FEMALE','NEW','2002-03-13','ISIDRO D. TAN TANGUB CITY','09463217019','eve.bayadog@gmail.com','BSED-MATH','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'P-4 Isidro D. Tan Tangub City','2021-06-23 18:37:18','$2y$10$zGU0jEzMOyxvZF9JvCUS/eleBjSqwC94h1ulxAEPEevbC/.9HBb5y','STUDENT',NULL,'2021-06-23 18:35:01','2021-06-23 18:37:18'),
(279,'fuertesjerry8@gmail.com','FUERTES','JERRY','TAUTO-AN','MALE','NEW','2001-08-24','DIGSON,BONIFACIO,MISAMIS OCCIDENTAL','09518406918','fuertesjerry8@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Digson',25894,'Purok 4','2021-06-23 18:43:54','$2y$10$X1adIBTEo6XUrox5oMfl.OoUgIFxBawGf0Lwo2Dyjd9nvEtTjo1bm','STUDENT',NULL,'2021-06-23 18:36:04','2021-06-23 18:43:54'),
(280,'Jerometalaroc','TALAROC','JEROME','UDTOHAN','MALE','NEW','2002-04-21','PROVINCIAL HOSPITAL','09266871248','talarocjerome@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'Purok 3','2021-06-23 18:39:13','$2y$10$WzhuETqLOpqFyb.Xryujc.yA1VIw/lAAi9HOSmHAUyQ0SitHHbpg.','STUDENT',NULL,'2021-06-23 18:36:20','2021-06-23 18:39:13'),
(281,'christineconingco16@gmail.com','CONINGCO','CHRISTINE','DACOL','FEMALE','NEW','2002-12-22','TABO-O, JIMENEZ, MISAMIS OCCIDENTAL','09468950169','christineconingco16@gmail.com','BEED','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok 2-B','2021-06-23 18:37:42','$2y$10$8R9Av.AQW681jo2V15qQsemme9XqzgvT117dj7DJbizg827SMDwue','STUDENT',NULL,'2021-06-23 18:36:52','2021-06-23 18:37:42'),
(282,'ivyjoylobricatacmo@gmail.com','TACMO','IVY JOY','LOBRICA','FEMALE','NEW','2002-10-23','TUNGAWAN, SOMINOT ZAMBOANGA DEL SUR','09078823889','ivyjoylobricatacmo@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Sominot','Tungawan',41344,'Purok 1','2021-06-24 08:32:50','$2y$10$Htw5fFR79t02d3e5t17/8ODQFO.lxo8NOdtruYy/LxBdeWsla911i','STUDENT',NULL,'2021-06-23 18:36:57','2021-06-24 08:32:50'),
(283,'louiblissrivera@gmail.com','RIVERA','LOUI BLISS','SEñORON','FEMALE','NEW','2003-08-29','UPPER DIMOROK MOLAVE ZAMBOANGA DEL SUR','09096229166','louiblissrivera@gmail.com','BSOA','AB ENGLISH','BLENDED',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Purok 3 kaimeto','2021-06-23 18:39:52','$2y$10$Bjhk3TVj7mn9yfZIP/P1v.WBtwGmJ32c/BanmqTqrh3W3NqyLo5Kq','STUDENT',NULL,'2021-06-23 18:37:09','2021-06-23 18:39:52'),
(284,'RhemcyraYonson','YONSON','RHEM CYRA','DIDAL','FEMALE','NEW','2003-06-21','REBE, LALA, LANAO DEL NORTE','09755784853','rhemcyrayonson07@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Lanao del Norte','Lala','Rebe',19968,'Purok 2-A','2021-06-23 18:46:31','$2y$10$AYRYaXKvPZiEQ581RbVrNeDhKIIXWQQDd2oNCxZNodqUHLfOQbgHq','STUDENT',NULL,'2021-06-23 18:37:19','2021-06-23 18:46:31'),
(285,'Amarahkhiana@gmail.com','MANLANGIT','JANELLA','ROBLES','FEMALE','NEW','2001-11-05','CATADMAN ACACIA','09954853086','manlangitjanellarobles@gmail.com','BSED','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'7','2021-06-23 18:39:14','$2y$10$uOKITmKrYztDNyvMM1F48.kWASvAvSVC.2xpu9Dct8ZPelMEQeMTi','STUDENT',NULL,'2021-06-23 18:38:13','2021-06-23 18:39:14'),
(286,'James21','MELGAR','JAMES MER','URSONAL','MALE','NEW','2000-04-21','PAMUTUNGAN, JUBAY, LILOAN, CEBU','09235522124','jamesmermelgar43@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Bag-Ong Balamban',41082,'Purok 4','2021-06-23 18:46:14','$2y$10$rjFwDGiw8YLBx9tA84YJzuwN6FlzmEJhg.VtXAbTD2rmqvguYmTNu','STUDENT',NULL,'2021-06-23 18:38:25','2021-06-23 18:46:14'),
(287,'hanshineko','ALFARO','HANSHINE CAMILLE','CAñETE','FEMALE','NEW','2001-08-15','P-3 BONGBONG OZAMIZ CITY','09276190447','hanshineko@yahooo.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-3 Bongbong',NULL,'$2y$10$CjHoQYyg6vyFz5JqFtKiZ.DOQtRn0woy4vm4O.phlBb/HyJz6llyW','STUDENT',NULL,'2021-06-23 18:38:26','2021-06-23 18:38:26'),
(288,'09101657799','CARCAGENTE','ALBERT JOHN','MANALILI','MALE','NEW','2002-02-02','NOVALECHES QUEZON CITY','09304346728','albertjohncarcagente@gmail.com','BSED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 6 Poblacion',NULL,'$2y$10$mS2qwJIrCptXHyuOkNJk8.e.vsMM8aSheQ33p87cJGgqtCIONOy6C','STUDENT',NULL,'2021-06-23 18:38:29','2021-06-23 18:38:29'),
(289,'aprilroseandoy123','ANDOY','APRIL ROSE','MEDINA','FEMALE','NEW','2003-04-23','OZAMIZ CITY','09083320588','aprilroseandoy123@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'Purok-3','2021-06-23 18:40:34','$2y$10$WKs6wumXpWeYp/.b.fHZA.r4rS7vMRTkcFfG6TRT7m2sS.eZEnR3i','STUDENT',NULL,'2021-06-23 18:38:43','2021-06-23 18:40:34'),
(290,'mendezarcelly@gmail.com','MENDEZ','ARCELLY','CUARTO','FEMALE','NEW','2003-08-13','UPPER BAG-ONG TUDELA JOSEFINA ZAMBOANGA DEL SUR','09121202848','mendezarcelly@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Reservoir','2021-06-23 18:44:03','$2y$10$J3/v5JYhA733zYICB6.E3.B0t.mlLdlf6xgoZHjQo4J5Z/VGmbuwa','STUDENT',NULL,'2021-06-23 18:39:23','2021-06-23 18:44:03'),
(291,'docdocdianne@gmail.com','BORONGAN','TRISHIA DIANNE','DOCDOC','FEMALE','NEW','2002-06-23','MHARSGEN','09091556131','docdocdianne@gmail.com','GEN  MID','BEED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'3 Pingol st','2021-06-23 18:56:27','$2y$10$Jxge2usAG0r63c3eugWgouhef7RnNOxci3yhIttEz3zhLMQoZx1vW','STUDENT',NULL,'2021-06-23 18:39:34','2021-06-23 18:56:27'),
(292,'charburden7@gmail.com','BURDEN','CHARLES ADRIAN','FLORES','MALE','NEW','2002-03-13','BUTUAN CITY HOSPITAL','09086753721','charburden7@gmail.com','BSBA-MM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Dumingag','Bag-Ong Valencia',40923,'Purok 2 Bag-ong Valencia','2021-06-23 18:43:23','$2y$10$WI6J0N0JUYn3XDyOBnlABuVRAP/xWkLOfpoKk.oEhhT30Tw8nwQAO','STUDENT',NULL,'2021-06-23 18:39:47','2021-06-23 18:43:23'),
(293,'Jomgonzales21','GONZALES','JOSE MARI','CALAHAT','MALE','NEW','2002-09-12','MUNTINLUPA CITY','09972365547','jomygonzales123@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 7 bañadero','2021-06-23 18:46:10','$2y$10$UZUv71QEgxxgXypctr5Vwu00IppVgN/Mehmnemd8hsFw4Aov.1pOi','STUDENT',NULL,'2021-06-23 18:39:48','2021-06-23 18:46:10'),
(294,'Adamacuno','ACUNO','ELPIE JHON','AM-IS','MALE','NEW','2003-02-02','ROXAS, PALAWAN','09639289404','elpieacuno424@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok-2','2021-06-23 18:41:43','$2y$10$P3YGj8Eb.PP3rB81HcpSk.rZZ8dTyO7Yu7xXFSb2Lf.9FDuBhIikW','STUDENT',NULL,'2021-06-23 18:41:11','2021-06-23 18:41:43'),
(295,'valtagalogon@gmail.com','TAGALOGON','VAL','TUMAMPOS','MALE','NEW','2003-02-14','MISAMIS OCCIDENTAL PROVINCIAL HOSPITAL','09150434242','valtagalogon@gmail.com','BSED','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Aloran','Palayan',25858,'6',NULL,'$2y$10$TIvzK3qVscP5ktP0I6TDMOt14e1d1oueLwVZNerghaOVxr4hkd8j6','STUDENT',NULL,'2021-06-23 18:41:17','2021-06-23 18:41:17'),
(296,'Nicanor E. Crosio Jr.','CROSIO','NICANOR JR.','ELEMENTO','MALE','NEW','2003-07-01','SINUZA, OZAMIZ CITY','09127692827','Nicanorcrosio57@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 3',NULL,'$2y$10$iS9MIMBy3tdWV8emPHYQBeDiUEL.8LZtJDr9TGnbnIyKVsk3pHQIO','STUDENT',NULL,'2021-06-23 18:41:53','2021-06-23 18:41:53'),
(297,'riverajarine66@gmail.com','RIVERA','JARINE','DELUNA','MALE','NEW','1998-07-06','UPPER DIMOROK','09386825621','riverajarine66@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Purok-4 Lakatan','2021-06-23 18:48:39','$2y$10$h6UBP/r1IyK2mha3rnGz7uFGtp6DnKXhJn6GNH.Hrarkoazko6zDG','STUDENT',NULL,'2021-06-23 18:41:54','2021-06-23 18:48:39'),
(298,'NealeLagumbay22','LAGUMBAY','NEALE','GALLOSA','MALE','NEW','2003-03-22','P6B MASABUD CLARIN MISAMIS OCCIDENTAL','09639631801','NealeLagumbay22@yahoo.com','BS CRIM','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Masabud',25950,'P6B Masabud',NULL,'$2y$10$/2KX1gS8Xm5M0e7vg3d5a.NwwvUsTOgKQbvalg7nK6CAbAZGUjmGy','STUDENT',NULL,'2021-06-23 18:42:40','2021-06-23 18:42:40'),
(299,'ryanemong130@gmail.com','EMONG','RYAN','ALAMAG','MALE','RETURNEE','2001-05-31','GUBA','09530522151','ryanemong130@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Guba',25944,'Purok 4','2021-06-23 18:46:56','$2y$10$CBX1wFkShi91dNZVAr4uxu5SFZ8bW5Pcl2jFfYwx35YQ7I8F2MPCy','STUDENT',NULL,'2021-06-23 18:43:07','2021-06-23 18:46:56'),
(300,'Michael_caceres','CACERES','MICHAEL','ALMADEN','MALE','NEW','1998-10-08','TULUAN MIDSALIP ZAMBOANGA DEL SUR','09465995339','michaelcaceres479@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Happy Valley',41371,'Purok 7','2021-06-23 18:45:14','$2y$10$6svUwkquEDNjqQ81ATe6D.0i9NUz6P1mba49sbSboxZRHTHkANnSG','STUDENT',NULL,'2021-06-23 18:43:25','2021-06-23 18:45:14'),
(301,'kizzy_minoza25@yahoo.com','MIñOZA','KC','ABUCAY','FEMALE','NEW','2002-07-25','COMMONWEALTH AURORA ZAMBOANGA DEL SUR','09632345902','kcminoza08@gmail.com','BEED','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Aurora','Commonwealth',40784,'Lapu-lapu','2021-06-23 18:46:07','$2y$10$SQ8vfrSNvDFK6pbOzccFP.TMylipRFfBwDCLaRHa.s70BWoN9ofMW','STUDENT',NULL,'2021-06-23 18:43:45','2021-06-23 18:46:07'),
(302,'Gwen Asokl','ASOK','GWEN','','FEMALE','NEW','2001-10-20','CAMPO 1V RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09317193267','gwenasok@gmail.com','GEN  MID','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Campo IV',41259,'Purok Mangga 3','2021-06-23 18:55:16','$2y$10$3Cq1uR3qxLNXQn3J49sghe0Q8OXkvekGz.lEe173NdF.yyvMRLWbm','STUDENT','9Zhpuhp5bH9l7gc8qOTzDP7llHBiDqkP7NtIHR1pLZHECMs4jkuPue7GcNO8','2021-06-23 18:44:23','2021-06-23 18:55:16'),
(303,'fernandezxtine19','FERNANDEZ','CRISTINE JANE','BUENO','FEMALE','NEW','2003-12-19','TONDO, MANILA','09061696319','fernandezxtine19@gmail.com','BS CRIM','AB ENGLISH','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lourmah',41090,'Purok 6',NULL,'$2y$10$MgETaj9pDD27JUuj7nWV4uctCeAx/Vi7Z/YJnW0GVG0DTdgUo5FT2','STUDENT',NULL,'2021-06-23 18:44:29','2021-06-23 18:44:29'),
(304,'Arnold Oculares Jr.','OCULARES','ARNOLD JR.','DIAZ','FEMALE','NEW','2002-02-20','OZAMIS CITY','09971238082','arnoldoculares2002@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok-4','2021-06-23 18:46:07','$2y$10$JNtuf9OdDE8aeKCY7B5SSOocmvfrerh3f2YFfV6Bk8wSSnjyrG0vi','STUDENT',NULL,'2021-06-23 18:45:05','2021-06-23 18:46:07'),
(305,'ChaSangel','BAGO-OD','ROSALIE','SANGEL','FEMALE','NEW','2001-12-06','BUENSUERTE, TUKURAN, ZAMBOANGA DEL SUR','09074705645','bagoodrosalie@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Switch',41279,'Purok 1-B','2021-06-23 18:51:04','$2y$10$bkzcq8h5AHlYUfqCPmbS.e/Qe26zhSVYTfvW/D37qbDIHLqzdWrpG','STUDENT',NULL,'2021-06-23 18:45:40','2021-06-23 18:51:04'),
(306,'Danimar','ALBINDA','DANIMAR','SAPUAY','MALE','NEW','2001-10-14','MANGA, PAGADUAN CITY','09534487213','dalbinda14@gmail.com','BSBA-MM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Pagadian City','Manga',41220,'Purok 9, Del Pilar','2021-06-23 19:00:59','$2y$10$KP00qgFTnlTn5sr5xhyL4u2iinZq7wN1JJtqImy4teyZdKFAn8mhq','STUDENT',NULL,'2021-06-23 18:45:43','2021-06-23 19:00:59'),
(307,'Charlotte_yamson@yahoo.com','YAMSON','CHARLOTTE','IMBOY','FEMALE','NEW','1998-09-24','CABOL-ANONAN','09076351290','charlotte_yamson@yahoo.com','GEN  MID','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Cabol-Anonan',26295,'P-2 Cabol-anonan',NULL,'$2y$10$LgIiX5VQKhs520mQepEypeeuZhwpKUhoOF/bDOPv9H7faCUmxAa8m','STUDENT',NULL,'2021-06-23 18:45:53','2021-06-23 18:45:53'),
(308,'Apolo Roda','RODA','MARIANO APOLO','BACUS','MALE','NEW','2002-11-18','#37 TRICON ST. BRGY. DALIG ANTIPOLO CITY','09456922529','marianoapoloroda@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Manaka',26127,'Purok-1','2021-06-23 18:47:04','$2y$10$CU.Q7d5tCkIRznUfczYK0.9jA1F1wlhCGpXy3B0ibkXsTT.dtTgc.','STUDENT',NULL,'2021-06-23 18:46:25','2021-06-23 18:47:04'),
(309,'Vence Zyle A. Pelong','PELONGO','VENCE ZYLE','AMANCIO','FEMALE','NEW','2002-11-23','TAMBULIG ZAMBOANG DEL SUR','09383787030','Vencezylepilongo@gmail.com','BSED-ENGL','BSED-SOCSTUD','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Riverside',41382,'Purok Nangka',NULL,'$2y$10$Kq7KfIy0Cr1whKIFiGLHjeYJo.9XeiCulaAmFUHXT5x0wJHUeON/e','STUDENT',NULL,'2021-06-23 18:46:49','2021-06-23 18:46:49'),
(310,'joannasaluta2003@gmail.com','SALUTA','JOANNA','TORRES','FEMALE','NEW','2003-01-20','SM LAO OZAMIS CITY','09389645920','joannasaluta2003@gmail.com','BSOA','GEN  MID','BLENDED',NULL,'Misamis Occidental','Clarin','Lupagan',25948,'Purok 6','2021-06-23 18:49:34','$2y$10$nofa1U5N/4C4FhPqW/8shufuQt9ytF5Fmguy7g5NR.UOp1W7vDVau','STUDENT',NULL,'2021-06-23 18:46:59','2021-06-23 18:49:34'),
(311,'Gemalyn A. Apale','APALE','GEMALYN','ALENSONORIN','FEMALE','NEW','2000-11-06','OZAMIS CITY','09305001173','apalejemz@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'Purok piape Sinonoc',NULL,'$2y$10$q83H3TyUv6KqLlWP0Ae9jehPVqbX7aaLluMTznY8M6.0ER8q71TYu','STUDENT',NULL,'2021-06-23 18:47:51','2021-06-23 18:47:51'),
(312,'ecielmaepollescas','POLLESCAS','ECIEL MAE','LANGGAM','FEMALE','TRANSFEREE','2002-06-12','LOWER STO. NIñO MAHAYAG ZAMBOANGA DEL SUR','09504220397','john19ciel19@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Lower Santo Ni±o',41092,'Purok, 5B','2021-06-23 18:48:33','$2y$10$wrnAgrBlghruuYYC0Tblc.wKvixE718hBAjeV0lZquY4rf.W6kihO','STUDENT',NULL,'2021-06-23 18:47:58','2021-06-23 18:48:33'),
(313,'Em Em Cusad','CUSAD','EM EM','ASOK','FEMALE','NEW','2003-09-08','CAMPO 1V RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09381184979','ememcusad08@gmail.com','GEN  MID','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Campo IV',41259,'Purok Mangga 3','2021-06-23 18:52:40','$2y$10$86VjEy04vgRulrhAcmsy6.dZybcylBG5a2ITLUp8hNuB.fFkvBPg6','STUDENT',NULL,'2021-06-23 18:48:00','2021-06-23 18:52:40'),
(314,'ramosmaeann.15@gmail.com','AWA','MAE ANN','RAMOS','FEMALE','NEW','2001-06-12','UPPER STO. NIñO, MAHAYAG ZAMBOANGA DEL SUR','09367516870','ramosmaeann.15@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Makuguihon',41176,'P-Gumamela , Magsagsay st.',NULL,'$2y$10$VIdxT1/PVCtsb494F8Xw0.TYF5uVAt3J5nzPUHnSwEPTvcLpg/oG2','STUDENT',NULL,'2021-06-23 18:48:28','2021-06-23 18:48:28'),
(315,'Marjorie Pearl','MALOLOY-ON','MARJORIE PEARL','','FEMALE','NEW','2002-09-19','BAESA, QUEZON CITY','09271650427','marjoriepearlmaloloyon@gmail.com','BSED-ENGL','BSED-MAPEH','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 6','2021-06-23 20:16:17','$2y$10$w8wxnGaed3N6TdvZnwZlZO77Fyx37KflveOz16L4RFTzzloLrsVQS','STUDENT',NULL,'2021-06-23 18:48:57','2021-06-23 20:16:17'),
(316,'Phoebeann30','MAGLINAO','PHOEBE ANN','AMOROTO','FEMALE','NEW','2001-12-30','AURORA ZAMBOANGA DEL SUR','09670238567','kurtcandole@gmail.com','BSED','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Midsalip','Dumalinao',41138,'Purok 4','2021-06-23 18:49:28','$2y$10$3KZMAmVXQ6TSITPnjZhKseFkDkzc4s0N3CloFreTu0BXwVh69FdoO','STUDENT',NULL,'2021-06-23 18:48:57','2021-06-23 18:49:28'),
(317,'Marjoriecapute@yahoo.com','CAPUTE','MARJORIE','CANO','FEMALE','NEW','2001-04-29','BANDERA, DALAON MOLAVE ZAMBOANGA DEL SUR','09631149923','marjoriecapute@yahoo.com','BSBA-HRM','BSED','BLENDED',NULL,'Zamboanga del Sur','Molave','Dalaon',41168,'Bandera',NULL,'$2y$10$Fuh6NkMrtE2R1CMBAaXLcO0bQlLfbYgzZf/cyt.x/G3.0P0T9aQI2','STUDENT',NULL,'2021-06-23 18:49:02','2021-06-23 18:49:02'),
(318,'elwinmaribao@gmail.com','MARIBAO','ELWIN','LIQUIT','MALE','NEW','2001-09-18','CALOT TAMBULIG ZAMBOANGA DEL SUR','09555262162','elwinmaribai@gmail.com','BSED','BSED','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 2',NULL,'$2y$10$vcrGhrn94cXS4rCm6YA30OU3cLBKv5jnBOXF14zatV8kLKtz5rHVK','STUDENT',NULL,'2021-06-23 18:49:05','2021-06-23 18:49:05'),
(319,'Jesselyn','ESPAñOL','JESSELYN','OPLIMO','FEMALE','NEW','2003-10-14','NEMEñO JOSEFINA ZAMBOANGA DEL SUR','09094692635','selymoplimo@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Zamboanga del Sur','Josefina','Neme±o',40993,'Purok 3 Manggium',NULL,'$2y$10$Dj/054GPiXa2Dq5gYnF5rOLxCtIvamv3Js5iFeuFx/3x2MmU03pGm','STUDENT',NULL,'2021-06-23 18:49:11','2021-06-23 18:49:11'),
(320,'Leslie','FORTICH','LESLIE','BARRIO','FEMALE','NEW','2002-04-02','MOLAVE ZAMBOANGA DEL SUR','09998907522','fortichleslie4@gmail.com','GEN  MID','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'Mabini street Molave Zamboanga Del Sur','2021-06-23 18:52:17','$2y$10$SetT3y0V7bDTvIq9o5Weo.UZQxPa6GtPHcQu9.6gxe/RSZytD/01C','STUDENT',NULL,'2021-06-23 18:50:14','2021-06-23 18:52:17'),
(321,'Khyzl16','BANGCONG','KHYZL','DESMANOS','FEMALE','NEW','2002-09-16','MIDSALIP ZAMBONGA DEL SUR','09505855871','Khyzlbangcong16@gmail.com','BSBA-HRM','AB COMM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'Magallanes St.','2021-06-23 18:54:30','$2y$10$gz2YbiXY1EjpLV2Jn2j8OObJmLy0.6ro.FhslPCusJ14fvD7GNa3a','STUDENT',NULL,'2021-06-23 18:50:36','2021-06-23 18:54:30'),
(322,'Judyannomandam783.@gmail.com','OMANDAM','JUDY ANN','PALER','FEMALE','NEW','2003-06-07','BRGY.TULUAN TAMBULIG ZAMBOANGA DEL SUR','09486996700','Judyannomandam783@gmail.com','BSOA','BSOA','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Tuluan',41387,'Purok Centro','2021-06-23 18:58:46','$2y$10$rBX57p2MDB/vxxT6ZCN.5uTOKBqYS.TZ5jSfHUX0zJ7zpsMQnuzby','STUDENT',NULL,'2021-06-23 18:50:37','2021-06-23 18:58:46'),
(323,'_settiezarahpegalan','PEGALAN','SETTIE ZARAH','VILLAMOR','FEMALE','NEW','2002-09-01','LANAO DEL NORTE PROVINCIAL HOSPITAL, BAROY LANAO DEL NORTE','09264121076','seth11pegalan@gmail.com','AB POLSCI','BSBA-HRM','FULL ONLINE',NULL,'Lanao del Norte','Kapatagan','Poblacion',19899,'Sampaguita St., Purok 7','2021-06-23 18:52:00','$2y$10$CbQgwM.vDPJOqcJqFf.GwuEvHiplOBEX/7lOF0WCT11Z4IGvI4SWK','STUDENT',NULL,'2021-06-23 18:50:40','2021-06-23 18:52:00'),
(324,'ninsagario','SAGARIO','NIñA','N/A','FEMALE','TRANSFEREE','2001-01-22','BALAGATASA MAIGO LANAO DEL NORTE','09639217578','ninsagario01@gmail.com','AB COMM','AB ENGLISH','BLENDED',NULL,'Lanao del Norte','Maigo','Balagatasa',20009,'4','2021-06-23 18:53:53','$2y$10$LRK8Aa6a8BqAjUH97Jix4ewMmS/ZszZwOiIISYrA0Z60gblDQ1rnq','STUDENT',NULL,'2021-06-23 18:51:08','2021-06-23 18:53:53'),
(325,'catherenetumagna','TUMAGNA','CATHERENE','DUMAYOG','FEMALE','TRANSFEREE','2002-07-17','CONCEPCION MIS OCC','09651548243','cathrenetumagna17@gmail.com','BSED-MAPEH','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Sapang Dalaga','Poblacion',26209,'Purok Jasmine',NULL,'$2y$10$6t0Zr7hQezPxzLe4nYaCd.CqbXbHC5lkMTzQznkFd1ducUF..kfse','STUDENT',NULL,'2021-06-23 18:51:47','2021-06-23 18:51:47'),
(326,'Jevielimare','LIMARE','JEVIE','URSAIZ','MALE','NEW','2002-10-27','MADASIGON, MOLAVE ZAMBOANGA DEL SUR','09096437994','jevielimare08@gmail.com','BEED','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Purok Bulawanon, Abad Santos st.','2021-06-23 18:53:40','$2y$10$V3Sb7emsJUVFY2pMHV68/ekiGagYC3oDKPUuvZXCsHPeCBiD.OhtW','STUDENT',NULL,'2021-06-23 18:52:19','2021-06-23 18:53:40'),
(327,'alfechetrexie@gmail.com','ALFECHE','TREXIE','BATION','FEMALE','NEW','2002-10-02','SM LAO HOSPITAL','09639385118','alfechetrexie@gmail.com','BS CRIM','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok -7','2021-06-23 18:53:21','$2y$10$Uy4rg6v2DoR1ItDNSeY.EOt6RFiEGn7Ldeoww4Vgl1I6p.5V272ry','STUDENT',NULL,'2021-06-23 18:52:41','2021-06-23 18:53:21'),
(328,'Marilyn G. Noya','NOYQ','MARILYN','GUMIMOD','FEMALE','NEW','2003-03-10','UPPER TIPARAK TAMBULIG ZAMBOANGA DEL SUR','09093196554','marilynnoya47@gmail.com','BSBA-MM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok-4','2021-06-23 18:54:42','$2y$10$LawKNgtBU1mPe1nFNbvFfusVk3YSkQ09sKP6WIrHMuQeafDhTdZYG','STUDENT',NULL,'2021-06-23 18:52:44','2021-06-23 18:54:42'),
(329,'Mauwei','SIBAY','MERYROSE','MANABA','FEMALE','NEW','2002-10-05','KOLAMBUGAN, DISTRICT HOSPITAL','09530417029','Meryrose1052002@gmail.com','BSOA','BSBA-MM','FULL ONLINE',NULL,'Lanao del Norte','Kolambugan','Pantar',19939,'2','2021-06-23 18:54:22','$2y$10$8/0bRyeLm.KSmK7.hDgb9urjJr4qPybyl8iSXdpXuCdbRepxnh6CG','STUDENT',NULL,'2021-06-23 18:53:07','2021-06-23 18:54:22'),
(330,'jenniferberidacarlos','CARLOS','JENNIFER','BERDIDA','FEMALE','NEW','2003-06-16','MOLAVE ZAMBOANGA DEL SUR','090918176292','jenniferberdidacarlos@gmail.com','BSCS','BSCS','BLENDED',NULL,'Zamboanga del Sur','Molave','Blancia',41165,'Purok Makugihon','2021-06-23 19:09:16','$2y$10$juv1/Rhxvf42DoGSec8xueWIsZf9OJx4z8IdKu8c6SGrC/UeGnYYi','STUDENT','O0MhMqt5VYThIsZVVZmgF66B54foIucgVHLm3yr304lyHJlDocXKCr2t4MGd','2021-06-23 18:53:25','2021-06-23 19:09:16'),
(331,'reginebolambao7@gmail.com','BOLAMBAO','REGINE','SONAJO','FEMALE','NEW','2003-04-23','MANGA, TANGUB CITY','09480260066','reginebolambao7@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'1','2021-06-23 18:55:33','$2y$10$0n91ENutIVOB8hPV6uhXXuyh/4FrjyHuogvXaOXsFcgpl.Ami73k6','STUDENT',NULL,'2021-06-23 18:54:49','2021-06-23 18:55:33'),
(332,'Vencezylepelongo_26','PELONGO','VENCE ZYLE','AMANCIO','FEMALE','NEW','2002-11-23','TAMBULIG ZAMBOANG DEL SUR','09383787030','vencepelongo@gmail.com','BSED-ENGL','BSED-SOCSTUD','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Riverside',41382,'Purok Nangka','2021-06-23 21:56:51','$2y$10$4BC6Kv1dZTAP3.XrJfBpteUNMjGwSmKIn51Q6r9WdRZVFvbv/u09y','STUDENT',NULL,'2021-06-23 18:54:54','2021-06-23 21:56:51'),
(333,'Maria Ava Timon','TIMON','MARIA AVA','SALADAGA','MALE','NEW','2003-10-18','LIBUTAD, SAN SIMON PAMPANGA','09302618113','mariaavatimon@gmail.com','BSBA-MM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 5','2021-06-23 19:00:13','$2y$10$bVDTwkOSxtucuDp6XxUza.segj0S4VD1vyMeFCtgRJUFYqga/dxde','STUDENT',NULL,'2021-06-23 18:55:17','2021-06-23 19:00:13'),
(334,'Ze Zea','BAUTISTA','ROSEZEA CRISHA MAE','NELMIDA','FEMALE','NEW','2002-12-07','POB. TUBOD LANAO DEL NORTE','09055714020','kringbautista7@gmail.com','BSED-ENGL','BSED-ENGL','BLENDED',NULL,'Lanao del Norte','Tubod','Poblacion',20272,'Purok 2 RCIS',NULL,'$2y$10$Z28GRebfpA61OZbpz1JpEun.E8JBu055/aDTSIVtlk3Flk5z1TWTy','STUDENT',NULL,'2021-06-23 18:55:36','2021-06-23 18:55:36'),
(335,'RichanEngano','ENGANO','RICHAN','BURGONIA','MALE','NEW','1999-04-24','SUMIRAP TANGUB CITY','09486008643','Chanagwapeta@gmail.com','BSED-ENGL','BSED-SOCSTUD','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Sumirap',26285,'Purok 1','2021-06-23 19:10:48','$2y$10$HkBxyczsqLkCEh1l2p9RMO.ZgC4IEGYhZuriAte6yntm6XavH.UsS','STUDENT',NULL,'2021-06-23 18:56:18','2021-06-23 19:10:48'),
(336,'maeannawa@gmail.com','AWA','MAE ANN','RAMOS','FEMALE','NEW','2001-06-12','UPPER STO. NIñO, MAHAYAG ZAMBOANGA DEL SUR','09367516870','maeannawa@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Makuguihon',41176,'P-Gumamela , Magsagsay st.','2021-06-23 18:57:13','$2y$10$5pQjU8Jw2JB62immmrxTleh8JSyR.Mp1bACQRpWmZdbMntrM0rmdO','STUDENT',NULL,'2021-06-23 18:56:45','2021-06-23 18:57:13'),
(337,'jojcabatingan@gmail.com','SALADAGA','JOJEAN','CABATINGAN','FEMALE','NEW','2002-11-11','LAPERIAN TUKURAN ZABOANGA DEL SUR','09654953198','jojcabatingan@gmail.com','BSED-ENGL','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Maningcol',26128,NULL,'2021-06-23 18:58:30','$2y$10$QU5ed9MVVdFHCyJ7Wfl8..32nNUE71DUM1xaCGR7g5uIsVa2jz20e','STUDENT',NULL,'2021-06-23 18:57:16','2021-06-23 18:58:30'),
(338,'edrylmaealcano01','ALCANO','EDRYL MAE','MARQUEZ','FEMALE','TRANSFEREE','2001-10-29','TAGULO, TUKURAN ZAMBOANGA DEL SUR','09508021690','edrylmaealcano01@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Dimalco',25895,'Purok 5',NULL,'$2y$10$5CZwcUu1T8f2TCg47glc8.R6kCscQDlXHIm6pKwFWpkFLMcF1zpIu','STUDENT',NULL,'2021-06-23 18:57:23','2021-06-23 18:57:23'),
(339,'albarracinjanerose@gmail.com','ALBARRACIN','JANE ROSE','SARNO','FEMALE','NEW','2003-01-13','PUROK 3, BONGABONG TANGUB CITY','09754751230','albarracinjaneros@gmail.com','BSED-ENGL','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'Purok 3',NULL,'$2y$10$SB1A35etrPCMkYe4wxi7/OBQ13hBqsgZSjJQGQRZ61BSfiffOtQi6','STUDENT',NULL,'2021-06-23 18:57:30','2021-06-23 18:57:30'),
(340,'Dennespasculado','PASCULADO','DENNES','CLOMA','MALE','NEW','2002-08-27','SUMALIG TAMBULIG ZAMBOANGA DEL SUR','09632365382','pasculadodennes78@gmail.com','BSED','BEED','FULL ONLINE',NULL,'Misamis Occidental','Oroquieta City','Langcangan Proper',26061,'Purok 7',NULL,'$2y$10$uzXlh1NBv1I6Hc9cnBVddOqgPbZE82dKhUL4Rcz4.W5D3h6R5CzaG','STUDENT',NULL,'2021-06-23 18:58:23','2021-06-23 18:58:23'),
(341,'kylledionson','DIONSON','KYLLE','ANGGOT','MALE','NEW','2002-08-03','AURORA ZAMBOANGA DEL SUR','09515767446','kylledionson12@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Campo IV',41259,'Purok, Bayanihan','2021-06-23 18:58:59','$2y$10$OZImCZYaT13QfGtrmvZ/J.XjaT9HL8O3Ws3jyWQbhBkIIxFp5FIre','STUDENT',NULL,'2021-06-23 18:58:35','2021-06-23 18:58:59'),
(342,'Ivyarong','REDOBLADO','IVY','ARONG','FEMALE','NEW','2001-02-04','MAHAYAG ZAMBOANGA DEL SUR','09566731485','ivyredoblado684@gmail.com','GEN  MID','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Kabuhi',41089,'Purok 1 KABUHI MAHAYAG ZAMBOANGA DEL SUR','2021-06-23 19:00:17','$2y$10$W2w.e1ht2uMbtiHAs7H32OLd4g.GiNVxMEorMssn4k9dyPWRaaZcy','STUDENT',NULL,'2021-06-23 18:58:57','2021-06-23 19:00:17'),
(343,'Meshel Gomonit','GOMONIT','MESHEL','SARITA','FEMALE','NEW','2003-03-09','NEW VILLAGE, TAMBULIG, ZAMBOANGA DEL SUR','09106923328','mesheljanegomonit05@gamail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','New Village',41380,'PUROK 1',NULL,'$2y$10$Dq4AzA2HonzG/UHh3LKrbu0KZJ647M5hstH67ddUbga6h/ur/uwAO','STUDENT',NULL,'2021-06-23 18:58:57','2021-06-23 18:58:57'),
(344,'Ethyl A. Cañonero','CAÑONERO','ETHYL','ANDRIN','FEMALE','NEW','2002-08-03','PIKINIT SULTAN NAGA DIMAPORO LANAO DEL NORTE','09264157341','ethylcanonero25@gmail.com','BSED','AB ENGLISH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tusik',25912,'Purok-6','2021-06-23 19:00:55','$2y$10$kqTsdGY9T4vipuut2LfDYO7pN5NhDJWPKvZDP4.8IjH.NH1f4rIC.','STUDENT',NULL,'2021-06-23 18:59:28','2021-06-23 19:00:55'),
(345,'Kurt Maghanoy','LADIT','JOHN LORD','MAGHANOY','MALE','NEW','1998-08-10','CARMEN ANNEX, OZAMIZ CITY','09108150114','danylvenparojinog17@gmail.com','BSED-MAPEH','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carmen',26104,'Purok 6','2021-06-23 19:01:44','$2y$10$PrnZg825I2VymqnSnwjWjeRqv8wbD00j9dZPJ9jX8UZALKs96PQyu','STUDENT',NULL,'2021-06-23 18:59:53','2021-06-23 19:01:44'),
(346,'DagaasJ','DAGA-AS','JOE','TEMONIO','MALE','NEW','1999-01-22','MATAMPAY LALA LMAO DEL NORTE','09122866143','dagaasjoe@gmail.com','BSED','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Mantic',26264,'Purok 6','2021-06-23 19:01:09','$2y$10$nBQbYtftoVC6mL6UfwyckOGOeo8Dq4cl.np.fw/6/YpiXSinqKUJq','STUDENT',NULL,'2021-06-23 18:59:56','2021-06-23 19:01:09'),
(347,'Markaaron06','DE GUZMAN','MARK AARON','','MALE','TRANSFEREE','1998-10-07','MALINAO, ALBAY','09957145712','markaarondeguzman53@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'6','2021-06-23 19:03:12','$2y$10$6wP40FWZflcp.g1JKu8QR.MfCZXMKQyhYfo0kaVj7zUjhwP8DJU5S','STUDENT',NULL,'2021-06-23 19:00:37','2021-06-23 19:03:12'),
(348,'charmendomingillo012@gmail.com','DOMINGILLO','CHARMEN','ALCONERA','FEMALE','NEW','2002-03-29','DALAPANG OZAMIZ CITY','09464831602','charmendomingillo012@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Dalapang',26108,'PUROK-2','2021-06-23 19:01:51','$2y$10$ahDKb11TTSQZ7qtxjDPQLeUMOv6EW3okSV2cDK4rm726bnX5N/Bau','STUDENT',NULL,'2021-06-23 19:00:47','2021-06-23 19:01:51'),
(349,'ivyjotacmo1@gmail.com','TACMO','IVY JOY','LOBRICA','FEMALE','NEW','2002-10-23','TUNGAWAN, SOMINOT ZAMBOANGA DEL SUR','09078823889','ivyjoytacmo1@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Sominot','Tungawan',41344,'Purok 1',NULL,'$2y$10$AETqcNL3fy.TkVM34D8KOOtc8BrL7JBohzCEUgIkFUi9L8FzxBB1q','STUDENT',NULL,'2021-06-23 19:01:47','2021-06-23 19:01:47'),
(350,'villaruzmikee17','VILLARU','MIKEE JULIANA','CABARDO','FEMALE','NEW','2003-07-03','BAGUMBANG, BONIFACIO MISAMIS OCCIDENTAL','09055759979','villaruzmikee17@gmail.com','BSED-MAPEH','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Bonifacio','Bagumbang',25887,'Purok 4 Bagumbang Bonifacio Misamis Occidental','2021-06-23 19:03:33','$2y$10$yU.1L8dpfw/9ql7VsmnsF.lXYS3vJcG9L8U78FouRN6AtecjEt7Su','STUDENT',NULL,'2021-06-23 19:01:53','2021-06-23 19:03:33'),
(351,'cendybaguio','BAGUIO','CENDY','JUDAYA','FEMALE','NEW','2021-10-04','CABGAN, TAMBULIG, ZAMBOANGA DEL SUR','09757632404','cendybaguio02@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Cabgan',41366,'Purok 2','2021-06-23 19:07:37','$2y$10$5.inhOxEPegSR5OyLmlzSu.RdNGmX2pDaOoVWj/KK35kDycP1j89.','STUDENT',NULL,'2021-06-23 19:02:31','2021-06-23 19:07:37'),
(352,'Johncarlosaraniogon_26','SARANIOGON','JOHN CARLO','ARCENAS','MALE','NEW','2003-07-14','TAMBULIG ZAMBOANGA DEL SUR','09389221907','johncarlosaraniogon97@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok 4','2021-06-23 22:26:34','$2y$10$CqiEFOqRpk.wxk7EtpzMTunTbL3PyD2weQ6.VgmfBvXR6PuGrflIS','STUDENT',NULL,'2021-06-23 19:03:04','2021-06-23 22:26:34'),
(353,'Jangabriel','TUMANDA','JAN GABRIEL','ORO','MALE','NEW','2002-06-17','BATANGAS HOSPITAL','09639618747','jantumandagabriel@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Oroquieta City','Dolipos Alto',26053,'Purok-1 Dolipos Alto','2021-06-23 19:04:28','$2y$10$6dVDu.HXJ0.MD6Rm0ceVNu5uga/kF5BmUpEeFTPSWk0F8SET7Re9C','STUDENT',NULL,'2021-06-23 19:03:37','2021-06-23 19:04:28'),
(354,'catherenetumagna17','TUMAGNA','CATHERE','DUMAYOG','FEMALE','TRANSFEREE','2002-07-17','CONCEPCION MISAMIS OCCIDENTAL','09651548243','catherenetumagna17@gmail.com','BSED-MAPEH','BSED-SOCSTUD','FULL ONLINE',NULL,'Misamis Occidental','Sapang Dalaga','Poblacion',26209,'Purok Jasmine','2021-06-23 19:06:55','$2y$10$QUBfnflOK7Uz3VOK35YGkOUjfHx4PwpOJsTwahXV19iRb0cJTGcj2','STUDENT',NULL,'2021-06-23 19:04:50','2021-06-23 19:06:55'),
(355,'itsmesamson05@gmail.com','SAMSON','ELENA','ROSALES','FEMALE','NEW','2003-04-28','PUROK 5 PANALSALAN TANGUB CITY','09639240051','itsmesamson05@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Panalsalan',26271,'Purok 5 Panalsalan Tangub City','2021-06-23 19:29:58','$2y$10$0eybjp1Dsskbml8mIl7ySurILhcQR145rtwnl2aS58K1nwP82/LK.','STUDENT',NULL,'2021-06-23 19:04:50','2021-06-23 19:29:58'),
(356,'Dennescloma','PASCULADO','DENNES','CLOMA','MALE','NEW','2002-08-27','SUMALIG TAMBULIG ZAMBOANGA DEL SUR','09632365382','dennespasculado@gmail.com','BSED','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Oroquieta City','Langcangan Proper',26061,'Purok 7','2021-06-23 19:07:32','$2y$10$XcthQb5Kg1knCc7Q8alaBO2deGomfkqaj9Xp5rl0M8wgRUwZ6ytgq','STUDENT',NULL,'2021-06-23 19:06:14','2021-06-23 19:07:32'),
(357,'lomoljoserjohn@gmail.com','LOMOLJO','SER JOHN','SUMILE','MALE','NEW','2003-05-14','SUMIRAP TANGUB CITY','09300147441','lomoljoserjohn@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Sumirap',26285,'Purok 3','2021-06-23 19:08:46','$2y$10$OqHHozhtJTN8hiJk/axdheDUojGUn9ZeuykciH5f5LlqTKZrmeZDW','STUDENT',NULL,'2021-06-23 19:06:47','2021-06-23 19:08:46'),
(358,'Jeaniellavado18@gmail.com','LLAVADO','JEANIE','MIRAFUENTES','FEMALE','NEW','2002-01-12','BAGUMBANG, MISSAMISS OCCIDENTAL','09957411016','jeaniellavado18@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Molave','Lower Dimorok',41173,'Purok 1',NULL,'$2y$10$HctHUXuKTklC80NrXoDio.bV2uIB3HhHsTPgavn8F7QcckEImKKsS','STUDENT','wZtl9bmsCEfWRSGHKbbH999qGRUE5go1I8aKiuUdLdTC9CrXk0EobiHJIWAw','2021-06-23 19:07:01','2021-06-24 05:53:28'),
(359,'Janica Same','SAME','JANICA','BUOC','FEMALE','NEW','2003-01-16','CAMPO V, RAMON MAGSAYSAY, ZAMBOANGA DEL SUR','09514682052','janica.same@yahoo.com','BSED-ENGL','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok 4',NULL,'$2y$10$Lln2WNsGDwQxMd3o5Fg7x.wQhoY3PZbsNe16GyH3JNIxaamxTufrG','STUDENT',NULL,'2021-06-23 19:08:10','2021-06-23 19:08:10'),
(360,'elwinliquit@gmail.com','MARIBAO','ELWIN','LIQUIT','MALE','NEW','2001-09-18','CALOLOT TAMBULIG ZAMBOANGA DEL SUR','09555262162','elwinliquit@gmail.com','BSED','BSED','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 2',NULL,'$2y$10$VvwjffeCL4hJJOrITKBsGOrewra1NXfKJe21XER00g.XiwlQfDkxG','STUDENT',NULL,'2021-06-23 19:08:10','2021-06-23 19:08:10'),
(361,'Janie','ABELLA','JANIE','SAGANAY','MALE','NEW','2002-10-04','P6 PISAAN BONIFACIO MISAMIS OCCIDENTAL','09639217086','chabelitaabella82@gmail.com','BS CRIM','AB ENGLISH','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Pisa-An',25905,'P6','2021-06-23 19:10:38','$2y$10$MzO5B0yqXpsj1YcpqcNbP.KpUFrV6ONT9v8o53WrMRUGbJDNPJ8SS','STUDENT',NULL,'2021-06-23 19:08:53','2021-06-23 19:10:38'),
(362,'Tecsonjenelyn8@gmail.com','TECSON','JENELYN','ALBO','FEMALE','NEW','2002-10-03','GARANG TANGUB CITY','09055424104','tecsonjenelyn8@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Garang',26252,'Purok-4',NULL,'$2y$10$qluinwcwku.zk/YRnqRDtOiCh0Y2kFDR0jfATXdN/1Sqw6PNwofKK','STUDENT',NULL,'2021-06-23 19:09:05','2021-06-23 19:09:05'),
(363,'reymarkbalat','BALAT','REY MARK','PAGALARAN','MALE','NEW','2002-03-17','TAGUANAO ALORAN MISAMIS OCCIDENTAL','09122865076','reymark1702@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Aloran','Taguanao',25864,'Purok 2','2021-06-23 19:11:04','$2y$10$fU5X2Belee0jnBWcRSKPreQryOE1kU8s5jRnwZle5S7D.q1LNS9Fq','STUDENT',NULL,'2021-06-23 19:09:17','2021-06-23 19:11:04'),
(364,'ridgeryancole1@gmail.com','COLE','RIDGE RYAN','PLANGCA','MALE','NEW','2002-06-03','ILIGAN CITY','09754908438','ridgeryancole1@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'PUROK-4 GANGO OZAMIS CITY','2021-06-23 19:18:19','$2y$10$dsUyPAZ6yj14MVPvDcP6bOeszfNsMZodlT/67DO9dQ684K5AzhiUa','STUDENT',NULL,'2021-06-23 19:11:47','2021-06-23 19:18:19'),
(365,'chenemaeconsigo@gmail.com','CONSIGO','CHENEMAE','CEBALLOS','FEMALE','NEW','2004-09-24','BOCATOR, TANGUB CITY','09267865130','chenemaeconsigo@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Pangabuan',26272,'Purok-4','2021-06-23 19:13:06','$2y$10$xB7Q1xnmYlp./Vcib8GuF.Va12zppFDI2kiN74ByshLSC4LApe8Ku','STUDENT',NULL,'2021-06-23 19:11:48','2021-06-23 19:13:06'),
(366,'Jediesaluta','SALUTA','JEDIE','SOLATORIO','MALE','NEW','2003-08-12','LABO,ALORAN MISAMIS OCCIDENTAL','09654084849','jediesaluta@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Labo',25844,'Purok 1 labo street',NULL,'$2y$10$jIZLOFiLanCKGhz9/rJC4OkMrxrtWS0et6EINeVHxNosXVsopKJtK','STUDENT',NULL,'2021-06-23 19:11:54','2021-06-23 19:11:54'),
(367,'ADelaRosa2002','DELA ROSA','ANGELINE','AYACAIDE','FEMALE','NEW','2021-04-21','SM LAO MEMORIAL HOSPITAL, OZAMIS CITY','09327445829','lindelarosa21@gmail.com','AB ENGLISH','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Lower Lodiong',41376,'PUROK 7','2021-06-23 19:12:29','$2y$10$0.cvjI8/x2XIb38w6dfrhu8TZBIKQvC/v.M7OQT50.6uxFFGgEioC','STUDENT',NULL,'2021-06-23 19:11:57','2021-06-23 19:12:29'),
(368,'Micadevi.00@gmail.com','RAMOS','MICA','CORTEZ','FEMALE','NEW','2003-01-29','DMDTMH TANGUB CITY','09683014390','Micadevi.00@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Purok Perez','2021-06-23 19:28:34','$2y$10$CjqFqCEpaOXnqEv91wpvku9QVUEnmdYfNOnKFwk4o6wLIyzXW/teC','STUDENT','UCpXaAHNFQLOWjTHYa7JMgLppLwSxWxsuiewrPBICmUSRQlH9G8kBxMzs6fg','2021-06-23 19:12:00','2021-06-23 19:28:34'),
(369,'Guraychristianpaul@gmail.com','GURAY','CHRISTIAN PAUL','BETERO','MALE','NEW','2002-11-26','SINACABAN MISAMIS OCCIDENTAL','09317377520','guraychristianpaul@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Bougainvilla','2021-06-23 20:10:28','$2y$10$5tQfH3AqdRjRexsWEYx9o.kJWwwtBH3Vf.j1jF/SL8P9TNcXkocCm','STUDENT',NULL,'2021-06-23 19:12:18','2021-06-23 20:10:28'),
(370,'Xyrah','SUMBI','XYRAH MAE','XYXY','FEMALE','NEW','2003-06-03','HOSPITAL OZARAGA, DIGSON, BONIFACIO, MISAMIS OCCIDENTAL','09122922613','xyrahsumbi@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Demetrio Fernan',25893,'Purok 1','2021-06-23 19:13:26','$2y$10$bPmKAY/6nlKtPmZf9PegeucqUfKqlGvqH/HUFip8WnMtbkujHOO3e','STUDENT',NULL,'2021-06-23 19:12:43','2021-06-23 19:13:26'),
(371,'09109770213','MONTALBAN JR.','RENANTE','PROCIA','MALE','NEW','2003-08-12','P-1 MOLICAY OZAMIZ CITY','09124309896','montalbanrenante@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'P-1 Lower Urban','2021-06-23 19:15:08','$2y$10$/pTNXafq8dioiHJaKmddk.LpmnEFyYWkTxBrU9Chj7GTThfIlAKL.','STUDENT',NULL,'2021-06-23 19:13:09','2021-06-23 19:15:08'),
(372,'marjohraejirehmaniwang@gmail.com','MANIWANG','MARJOHRAE JIREH','CALAMBA','FEMALE','NEW','2003-03-03','OZAMIZ CITY','0948137892','marjohraejirehmaniwang@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Sinacaban','Dinas',26222,'Purok 6','2021-06-23 19:14:48','$2y$10$zLSZF.7DWlNriipUAXfo6uG6Ui9nn9zfdAudCAsrQgKvWs/OMyJom','STUDENT',NULL,'2021-06-23 19:13:27','2021-06-23 19:14:48'),
(373,'kenyaaata','ABARQUEZ','KEN','BODIONGAN','MALE','NEW','2002-10-12','OZAMIZ','09382121911','kenabarquez521@gmail.com','BSED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Baybay Triunfo',26098,'Purok 5 Cotta Area','2021-06-23 19:14:16','$2y$10$A1vItXT4/U2I7H3TGFiJd.QGLvBzWUZ9w3jLk5wWrqB7Q11XarTUm','STUDENT',NULL,'2021-06-23 19:13:39','2021-06-23 19:14:16'),
(374,'Laiza','SUDE','KAREN LAIZA','PATA','FEMALE','NEW','2002-10-25','POBLACION, TUBOD , LANAO DEL NORTE','09979928598','karenlaizas@gmail.com','BSED-MAPEH','BSOA','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Poblacion',20272,'Purok 2 RCIS POBLACION TUBOD LDN',NULL,'$2y$10$0yJtKfZGMrPV/uNGlrOrLOSpEBrEW.Q7.e.d2mE8HDGDI/kTSD7xG','STUDENT',NULL,'2021-06-23 19:14:08','2021-06-23 19:14:08'),
(375,'nercuamarryfe@gmail.com','NERCUA','MARRY FE','ABAJAR','FEMALE','NEW','2003-06-12','P-2 KATIPUNAN,PLARIDEL,MISAMIS,OCCIDENTAL','09368846711','nercuamarryfe@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Plaridel','Katipunan',26170,'Purok-2',NULL,'$2y$10$BUjlfNCIsjDUW/W3RXsYqe41//cz4QUBeE.mFrQGE1BwPKt21Yhpu','STUDENT',NULL,'2021-06-23 19:14:51','2021-06-23 19:14:51'),
(376,'angeltirbalagot@gmail.com','BALAGOT','ANGELTIR','MANONGAS','FEMALE','NEW','2002-12-23','MEDINA HOSPITAL OZAMIS','09107824973','angeltirbalagot@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Jimenez','Butuay',25992,'Purok 4','2021-06-23 19:24:00','$2y$10$narsgW.iXi8JqkteXBUO4uE1qHoXdQZUlfYFxAZMTRP6X65yR0FAu','STUDENT',NULL,'2021-06-23 19:15:03','2021-06-23 19:24:00'),
(377,'Christine','ELMEDULAN','CHRISTINE MAE','JUBAY','FEMALE','NEW','2001-11-24','GOV. ALFONSO D. TAN COLLEGE','09482088476','elmedulanchristine974@gmail.com','BS CRIM','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purok 4 Isidro D. Tan','2021-06-23 19:15:43','$2y$10$9FrrISc/C1dttPHFBZ5SCe47aZNA7Jbazf5RZ8OT0dITPNVke9WKG','STUDENT',NULL,'2021-06-23 19:15:13','2021-06-23 19:15:43'),
(378,'uzzielbustamante123@gmail.com','BUSTAMANTE','UZZIEL','GALLETO','FEMALE','NEW','2002-06-08','CANIBUNGAN PROPER TUDELA','09516501950','uzzielbustamante123@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Canibungan Proper',26300,'Purok 3','2021-06-23 20:04:54','$2y$10$z6.nvs5086o912xOHsXO0uSUDm7n29vJgA3GBsb4/fujA2AZ3iyT6','STUDENT','e5TIShBfnNqLJ2ejgiUEBbh1kelz695ePiSR9gOOraSFkigbITnHTurGhc0L','2021-06-23 19:16:49','2021-06-23 20:04:54'),
(379,'franzynearco','CANTONAO','FRANZYNE CHASTY MARIE','ARCO','FEMALE','NEW','2003-03-24','OZAMIS CITY','09661890819','franzynearco@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Poblacion II',25955,'purok 1','2021-06-23 20:05:27','$2y$10$4cxN1Pja986dF4t.RUM0puG3qaAHtFWb00BIZpA/HQ6re/pi8zl32','STUDENT',NULL,'2021-06-23 19:17:20','2021-06-23 20:05:27'),
(380,'andojarmarymay@gmail.com','ANDOJAR','MARY MAY','TOMARAS','FEMALE','NEW','2003-05-10','PAITON, TANGUB CITY','09128909412','Andojarmarymay@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Paiton',26270,'Purok 4','2021-06-23 19:18:58','$2y$10$m01s6I.PEtFWyW8KBlm2LeANWFkN7IUbUwPGZ7q88pon0BgM7q0SK','STUDENT',NULL,'2021-06-23 19:17:21','2021-06-23 19:18:58'),
(381,'taneza.maychelle1998@gmail.com','TAñEZA','APRIL MARY','LAPERA','FEMALE','NEW','2002-04-20','CULO, MOLAVE ZDS','09974828656','taneza.maychelle1998@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'New Society 2','2021-06-23 19:18:43','$2y$10$9Rfmzf09.u7UZ71O5FiUa.e2uCnwChOf2kO1w3lNxKThobVIX8AG2','STUDENT',NULL,'2021-06-23 19:17:43','2021-06-23 19:18:43'),
(382,'Evelyn Andrada','ANDRADA','EVELYN','ALBRANDO','FEMALE','NEW','2002-09-12','EBARLE JOSEFINA ZAMBOANGA DEL SUR','09512031228','andradaeve12@gmail.com','BSOA','BSOA','BLENDED',NULL,'Zamboanga del Sur','Josefina','Ebarle',40986,'Purok 2 Santol','2021-06-23 19:30:43','$2y$10$YKodfn5ghfo9xnJO1u1.POftpK/oj6bXomTtbkxtzwURDYE6DrFSe','STUDENT',NULL,'2021-06-23 19:18:23','2021-06-23 19:30:43'),
(383,'dalanginnelmaeann@gmail.com','DALANGIN','NELMAE ANN','CACHUELA','FEMALE','NEW','2002-10-26','GUMAHAN, JOSEFINA, ZAMBOANGA DEL SUR','09512031377','dalanginnelmaeann@gmail.com','BSBA-HRM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Reservoir','2021-06-23 19:28:31','$2y$10$w8muSC2lbXGSPAYu3IDVL.9b3adiOYQw1oBj6NHF0hltceFSe6/dG','STUDENT',NULL,'2021-06-23 19:19:24','2021-06-23 19:28:31'),
(384,'Jenevieve D. Perez','PEREZ','JENEVIEVE','DURANGPARANG','FEMALE','NEW','2002-05-10','BAYABAS, AURORA, ZAMBOANGA DEL SUR','09515772867','jenevieveperez37@gmail.com','BSED-SOCSTUD','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Aurora','Romarate',40805,'San Antonio','2021-06-23 19:20:35','$2y$10$RqGet93JtKr5MOPZN.jl9.RLuXpd65mSBBeqJyKZUb7RswngGJL62','STUDENT',NULL,'2021-06-23 19:20:07','2021-06-23 19:20:35'),
(385,'serjy1112@gmail.com','SALE','SERJY LOU','DELA CALZADA','FEMALE','NEW','2002-01-11','BACOLOD, OZAMIZ CITY','09464626642','serjy1112@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bacolod',26092,'Purok Bonifacio','2021-06-23 19:21:00','$2y$10$.gCN/4e6dJF3fLUC779fW.eZudM5uBPSLsi8VmYwbA9Of/J9.KoW.','STUDENT',NULL,'2021-06-23 19:20:24','2021-06-23 19:21:00'),
(386,'Meshel Jane Gomonit','GOMONIT','MESHEL','SARITA','FEMALE','NEW','2021-03-09','NEW VILLAGE TAMBULIG ZAMBOANGA DEL SUR','09106923328','mesheljanegomonit05@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','New Village',41380,'PUROK 1','2021-06-23 19:37:36','$2y$10$XCIxwUu1aBR2viSoIJVtQuOAqpF4.YuVtJdS8Z.HKGPMF0yALvWdG','STUDENT',NULL,'2021-06-23 19:20:35','2021-06-23 19:37:36'),
(387,'Salutajedie','SALUTA','JEDIE','SOLATORIO','MALE','NEW','2003-08-12','LABO ALORAN MISAMIS OCCIDENTAL','09654084849','jediesaluta083@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Labo',25844,'Purok1 labostreet',NULL,'$2y$10$mkf.vtmalJtacTCx51EuFuBmMf4H1gkRPBpS4qHoHLn3JbUvjDbcO','STUDENT',NULL,'2021-06-23 19:21:10','2021-06-23 19:21:10'),
(388,'abigailtomarce','TOMARCE','ABIGAIL','CAPABLANCA','FEMALE','NEW','2000-12-20','ANTIPOLO CITY','09382726189','abigailtomarce1220@gmail.com','BSCS','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Purok Mangga, Abad Santos','2021-06-23 20:52:59','$2y$10$F1myGz2Mi3iJSg3PSLhQBODTeqkAibn2wEMHR2fbm1oiDOLmEzvHq','STUDENT',NULL,'2021-06-23 19:22:06','2021-06-23 20:52:59'),
(389,'Glendil18','CANDAWAN','GLENDIL','CABILIDA','MALE','NEW','2002-05-26','ALORAN,MISAMIS OCCIDENTAL','09569016604','cglendil@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Manamong',25851,'P-3 Manamong Aloran, Misamis Occidental','2021-06-23 19:30:35','$2y$10$lqsTaZ5TY1VPdLo0F64gO.t2QBFvc4q55yfu96K8ascjjMApcoIFC','STUDENT',NULL,'2021-06-23 19:22:36','2021-06-23 19:30:35'),
(390,'Ortizjanrymae@gmail.com','ORTIZ','JANRY MAE','MANZANO','FEMALE','NEW','2003-01-27','VILLABA, TANGUB CITY','09382869833','ortizjanrymae@gmail.com','BSED-MATH','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Villaba',26289,'None','2021-06-23 19:24:38','$2y$10$TvsReXE4hEoiejyOR6/l0eUtXLuv1qNVUpznvmG.Q9NWfpWvmaQde','STUDENT',NULL,'2021-06-23 19:22:38','2021-06-23 19:24:38'),
(391,'Ajaymanalilicarcagente','CARCAGENTE','ALBERT JOHN','MANALILI','MALE','NEW','2002-06-02','NOVALECHES QUEZON CITY','09304346728','ajaymanalili222@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 6','2021-06-23 19:25:44','$2y$10$/5zwVSkM/6KF/bNXgZrCj.xb5PYIe8DpuXw8NcxzDgdRzD2Sisx1.','STUDENT',NULL,'2021-06-23 19:22:51','2021-06-23 19:25:44'),
(392,'karyljoygekin','GEKIN','KARYL JOY','ABELLA','FEMALE','NEW','2003-03-29','CAMP 5, TUBOD, LANAO DEL NORTE','09463705581','karylgekin29@gmail.com','BSED-MATH','BSED','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Camp V',20260,'Purok 1','2021-06-23 19:23:56','$2y$10$4Ynlr.GDzzt0Bh9I7BOGgeaSN9hCjAwYhsuNaHaPke7g.y/vcaFIS','STUDENT',NULL,'2021-06-23 19:22:53','2021-06-23 19:23:56'),
(393,'cabuscajonahfe@gmail.com','CABUSCA','JONAH FE','MENDEZ','FEMALE','NEW','2003-06-15','UPPER BAG-ONG TUDELA , JOSEFINA, ZAMBOANGA DEL SUR','09676393898','cabuscajonahfe@gmail.com','GEN  MID','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Purok reservoir','2021-06-23 19:25:50','$2y$10$wBs1WPMY.EYH2DluMOH0..tqwyvp2Fpz/wLOg7lZiQm7bF1YHImZC','STUDENT',NULL,'2021-06-23 19:23:00','2021-06-23 19:25:50'),
(394,'Leonemay Compayan','COMPAYAN','LEONEMAY','AMAD','FEMALE','NEW','2003-01-31','GABUNON, TAMBULIG ZDS','09682849315','compayanleonemay@gmail.com','AB POLSCI','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Gabunon',41370,'Purok 4','2021-06-23 19:25:03','$2y$10$k.cEeSEStjOZKt9f.7WH7eNzl/R3PpRy.gScww67XSVIr5NKPs0Ku','STUDENT',NULL,'2021-06-23 19:24:17','2021-06-23 19:25:03'),
(395,'Tina','BLANCIA','TINA','FLORES','FEMALE','NEW','2003-07-09','OZAMIS CITY','09631003989','tinablancia13@gmail.com','BSOA','BSOA','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok malipayon1','2021-06-23 19:26:31','$2y$10$ZXsW5uEmuP6v7uYNApuUbuk2.JbChHFxLOERdE3EXRiARis1SpoDi','STUDENT',NULL,'2021-06-23 19:24:20','2021-06-23 19:26:31'),
(396,'Axl_Bugahod18','BUGAHOD','AXL ROSE','BACAD','FEMALE','NEW','2002-10-18','SEñOR, SINACABAN, MISAMIS OCCIDENTAL','09099355836','bugahodaxl@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Se±or',26232,'Purok Gumamela',NULL,'$2y$10$gDTzUBjdizujWbS/lQxwauy6Iy8zoGKyYmLfV9LajDPkWz7Ybj32G','STUDENT',NULL,'2021-06-23 19:24:29','2021-06-23 19:24:29'),
(397,'Arian Mae Abenes Caballero','CABALLERO','ARIAN MAE','ABENES','FEMALE','NEW','2003-07-08','TUMAPIC,  MAHAYAG ZAMBOANGA DEL SUR','09704483211','curlytaps103199@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Tumapic',41108,'Purok 1','2021-06-23 19:32:16','$2y$10$C4h6a13eA5quNHaMhYqox.nJrTGDcGYsM4q4vItxW7h8iJzHKuZEu','STUDENT',NULL,'2021-06-23 19:24:37','2021-06-23 19:32:16'),
(398,'trixelleloisenavarro@gmail.com','NAVARRO','TRIXELLE LOISE','APAG','FEMALE','NEW','2002-10-20','GABUNON TAMBULIG ZAM.DEL SUR','09485808517','trixelleloisenavarro@gmail.com','BSED','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 1 kabulihan poblacion bonifacio misamis occidental','2021-06-24 10:17:33','$2y$10$.s7KSvD0K07SuEymvgHKieGwkx/8o9QG.MUOr9YIkkdfns9Vw2Xui','STUDENT',NULL,'2021-06-23 19:25:42','2021-06-24 10:17:33'),
(399,'Shaina_narciso','NARCISO','SHAINA','CABUTAY','FEMALE','NEW','2002-02-19','LOWER TIPARAK TAMBULIG ZAMBOANGA DEL SUR','09638289767','narcisoshaina0@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Happy Valley',41371,'Purok 7','2021-06-23 19:26:53','$2y$10$XNvfSvhU6/DdS9Or3D9A.erJjDQRjkXfCZ4KaR2A/I3R5b.gXnyxu','STUDENT',NULL,'2021-06-23 19:25:55','2021-06-23 19:26:53'),
(400,'Joel Mandawe','MANDAWE','JOEL','DAYAGBEL','MALE','NEW','2003-05-20','CANIANGAN TANGUB CITY','09354736563','jhonwamandawe@gmail.con','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Oriental','Opol','Taboc',26758,'Zone 4',NULL,'$2y$10$3XkpcRuofGCIvM.RmLyYne3jqgib2Kc9YE139qUlda85R7VbeXPBa','STUDENT',NULL,'2021-06-23 19:26:22','2021-06-23 19:26:22'),
(401,'Balindres','BALINDRES','JHOVIL ROSE','','FEMALE','NEW','2003-03-26','P-1 KINANGAY NORTE CLARIN MISAMIS OCCIDENTAL','09362332932','balindresjhovilrose@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'P-5 Lapasan Clarin Misamis Occidental','2021-06-23 19:27:47','$2y$10$8leSyHVGvmy5WTlYb6yxY.ZtkVc6.z6OviC0WTLrHUWMPyHdhY7DW','STUDENT',NULL,'2021-06-23 19:26:41','2021-06-23 19:27:47'),
(402,'melyn','TANCOGO','ROMELYN','ESCOTON','FEMALE','NEW','1986-07-25','PALOMPON,LEYTE','09104210213','ashtan497@gmail.com','BSOA','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'purok 3','2021-06-23 19:27:55','$2y$10$KQenNNh/y77jwI3M55RvyORq/srOnCvIqgCQkQcZqM7Sc.p/CLDni','STUDENT',NULL,'2021-06-23 19:26:56','2021-06-23 19:27:55'),
(403,'Hernalisa16','BONIAO','HERNALISA','MILVAR','FEMALE','NEW','2003-05-16','POB.1 CLARIN MISAMIS OCCIDENTAL','09383070385','hernalisa162003@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok 7 Bliss','2021-06-23 19:28:34','$2y$10$EXlF8rt6zKq3/KnaQn5W5uaw5GxjCUJ5tA888ABWuHQM0XjnedY6S','STUDENT',NULL,'2021-06-23 19:27:39','2021-06-23 19:28:34'),
(404,'kristelpadillab.14@gmail.com','PADILLA','KRISTEL JOYCE','BOSMEON','FEMALE','NEW','2002-09-20','AURORA, ZAMBOANGA DEL SUR','09518309940','kristelpadillab.14@gmail.com','BSED-ENGL','BSCS','BLENDED',NULL,'Zamboanga del Sur','Aurora','San Jose',40806,'Purok Rosas A','2021-06-23 19:29:59','$2y$10$oV8bfYBkIK.UKFr8b5BTdeuhX.OB0zLdX.v/yjc0OO3IgNfIw2XhK','STUDENT',NULL,'2021-06-23 19:28:05','2021-06-23 19:29:59'),
(405,'Jinky','LESONDRA','JINKY MEI','EGPAN','FEMALE','NEW','2003-05-19','TUKURAN ZAMBOANGA DEL SUR','09566243814','Jinkymaelesondra@gmail.com','BSED','BEED','FULL ONLINE',NULL,'Zamboanga del Sur','Tukuran','Santo Ni±o',41428,'Alibang-bang','2021-06-23 19:38:43','$2y$10$8EQj2LI8eBVUuJjy6d5uPu1QGyY7QOvQXrfdz2qaeWklUsOQNEDU2','STUDENT',NULL,'2021-06-23 19:28:19','2021-06-23 19:38:43'),
(406,'Vincechoii04@gmail.com','MANAGANTAN','VINCE CYRIL','POWAO','MALE','NEW','2021-11-24','SUMIRAP TANGUB CITY','09481080616','Vincechoii04@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Sumirap',26285,'Purok 3','2021-06-23 19:32:36','$2y$10$uQpDIoOLoDewsPQHFY.ZZOLxfz112eF/xta47QC0.bBQ1e3c2VOcS','STUDENT',NULL,'2021-06-23 19:29:19','2021-06-23 19:32:36'),
(407,'Josemari12','GONZALES','JOSE MARI','CALAHAT','MALE','NEW','2002-09-12','MUNTINLUPA CITY','09972365547','jomg775@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok-7 bañadero','2021-06-23 19:31:04','$2y$10$6CJlUVq2bPqvS.EXDMeh5evEod04OjBuUMT39UDgqjuL/38Fgso9C','STUDENT',NULL,'2021-06-23 19:29:48','2021-06-23 19:31:04'),
(408,'crisjoyrollen12','ROLLEN','CRISJOY','SOLIS','FEMALE','NEW','2002-12-24','OLD SAWMILL BACLAY TUKURAN, ZAMBOANGA DEL SUR','09464857790','crisjoyrollen12@gmail.com','BSBA-MM','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Bambong Daku',41256,'Purok 3','2021-06-23 19:31:38','$2y$10$jYiTr9t.bG6d/Lyd2vA2DumzhMNAALwGyt1rW9yk2SoTVxMGdACr6','STUDENT',NULL,'2021-06-23 19:30:44','2021-06-23 19:31:38'),
(409,'earlkated@gmail.com','EARL KATE','DAGAPIOSO','','FEMALE','NEW','2003-02-03','CABANATUAN CITY NUEVA ECIJA','09518454251','earlkated@gmail.com','BEED','BEED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Baybay San Roque',26096,'1','2021-06-23 19:32:08','$2y$10$4tHaLtN7daknCGK8Pp94hejpSAsPXBP08.khf63m05M5H6DsTvszC','STUDENT',NULL,'2021-06-23 19:31:10','2021-06-23 19:32:08'),
(410,'rodylin','MACION','MACION','BANO','FEMALE','NEW','2021-10-22','OZAMIZ CITY','09380019138','rodsmacion@gmail.com','GEN  MID','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'Purok 6','2021-06-23 19:33:35','$2y$10$fg8fUUwg3392Nan7q1phP.Lkf4wS55CyeS68Et6qEaR3oDNYyOzh2','STUDENT',NULL,'2021-06-23 19:31:11','2021-06-23 19:33:35'),
(411,'Charlotteyamson54@gmail.com','YAMSON','CHARLOTTE','IMBOY','FEMALE','NEW','1998-09-24','CABOL-ANONAN TUDELA MISAMIS OCCIDENTAL','09076351290','Charlotteyamson54@gmail.com','GEN  MID','BSED-MATH','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Cabol-Anonan',26295,'Purok-2','2021-06-23 19:35:55','$2y$10$cQZg9G653a2GfTXxAO91O.sR2ghPNsyYUg4vJYzxQCx19L7sxMYQq','STUDENT',NULL,'2021-06-23 19:31:51','2021-06-23 19:35:55'),
(412,'Nicanor Crosio','CROSIO','NICANOR JR.','ELEMENTO','MALE','NEW','2003-07-01','SINUZA, OZAMIZ CITY','09667707640','nicanorcrosio@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 3',NULL,'$2y$10$lcZKKsxu0T0VqfVZT/Sf1eh48QPQGVRmrABHenDTwbUK3hyHA9YQi','STUDENT',NULL,'2021-06-23 19:32:15','2021-06-23 19:32:15'),
(413,'marilynt030@gmail.com','TOLENTINO','MARILYN','CABILLON','FEMALE','NEW','2002-12-01','MHARS REGIONAL OZAMIZ CITY, MISAMIS OCCIDENTAL','09510332146','marilynt030@gmail.com','BSOA','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Labinay',26121,'P-3','2021-06-23 19:34:50','$2y$10$FHWXk8/GXfd5N87RSpsz4OlZe13eTkoyop2eKPpDWDzdolPmXCIoi','STUDENT',NULL,'2021-06-23 19:33:26','2021-06-23 19:34:50'),
(414,'Remonjay','TACDER','REMON JAY','ZOSOBRADO','MALE','NEW','2002-07-15','PUROK6 PISAAN BONIFACIO MISAMIS OCCIDENTAL','09070744709','remonjay22@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Pisa-An',25905,'Purok6',NULL,'$2y$10$R4iafQ9WnKbU3vTTFqEA1.zRc3oOKzO32kJyC8GwWfCT6dh0VbsPq','STUDENT',NULL,'2021-06-23 19:33:31','2021-06-23 19:33:31'),
(415,'lorescomiaclintly29@gmail.com','LORESCO','MIA CLINTLY','ECOT','FEMALE','NEW','2001-01-29','GUMAHAN, JOSEFINA, ZAMBOANGA DEL SUR','09512537912','lorescomiaclintly29@gmail.com','GEN  MID','BSED-FIL','FULL ONLINE',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Sta. Cecelia A',NULL,'$2y$10$8F1.eWBQB.EYYCtfnwAwS.OKFySzJ1AUly7e9z9zmsm3VS0uS.kdu','STUDENT',NULL,'2021-06-23 19:33:44','2021-06-23 19:33:44'),
(416,'erronpaulbuala@gmal.com','BUALA','ERRON PAUL','WASQUIN','MALE','NEW','2002-08-24','MALINGAO TUBOD LANAO DEL NORTE','09465278485','erronpaulbuala@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'Hinagdanan','2021-06-23 19:37:32','$2y$10$qVW2sDovFSzSMdHuJNJU0emXdRZjIdmHpDROOJEH7H.bG/wHUJmJy','STUDENT',NULL,'2021-06-23 19:34:24','2021-06-23 19:37:32'),
(417,'jbbacalso123@gmail.com','BACALSO','JERSON','LINGUEZ','MALE','NEW','2002-10-05','STA. MARIA TANGUB CITY','09552733388','jbbacalso123@gmail.com','BSED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok 4','2021-06-23 19:51:02','$2y$10$SBSmWHl.lpIGgIAdz7zxKu9UNhAfSpxQPS5TDXse0s/t2eTQlqe62','STUDENT',NULL,'2021-06-23 19:34:26','2021-06-23 19:51:02'),
(418,'Anelyn Tanggap','TANGGAP','ANELYN','BANSAL','FEMALE','NEW','1998-02-28','GUITALOS, MIDSALIP ZDS','09076421587','tanggapanelyn@gmail.com','GEN  MID','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Guitalos',41142,'Purok 1','2021-06-23 19:38:55','$2y$10$I5e6.zfit8pBtSY3sR.OIeWBZquXSxSWNiBGN1BRvPFC.ylI03Uou','STUDENT',NULL,'2021-06-23 19:35:03','2021-06-23 19:38:55'),
(419,'Ruffa Abellana','ABELLANA','RUFFA JANE','DAMO-AG','FEMALE','TRANSFEREE','1999-02-15','OZAMIZ CITY','09632365163','ruffajaneabellana99@gmail.com','BSED','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Kinuman Norte',26119,'Purok 2','2021-06-23 19:35:57','$2y$10$mgFe4FMYSqoS21zrKXhT.OtRMk6E/oIuaTYNe1RnOPk0ll/cF63kK','STUDENT',NULL,'2021-06-23 19:35:33','2021-06-23 19:35:57'),
(420,'Mae fernandez','FERNANDEZ','CHURCHILL MAE','CABASAG','FEMALE','NEW','2002-11-30','UPPER STO NINO  ( P-4) MAHAYAG ZDS','09700480623','churchillfernandez21@gmail.com','BEED','AB ENGLISH','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Upper Santo Ni±o',41110,'P-4','2021-06-23 19:57:09','$2y$10$HV3Yrxattv87vQD0eAJa6.G4OGahZTQDNSKwR8g.l/wC27SPYsEUe','STUDENT',NULL,'2021-06-23 19:35:47','2021-06-23 19:57:09'),
(421,'Sheryljaneelcarte','ELCARTE','SHERYL JANE','CAYUD-ONG','FEMALE','NEW','2002-03-23','BALILI, KAPATAGAN, LANAO DEL NORTE','09274455462','elcarte.sheryljane@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Lanao del Norte','Kapatagan','Balili',19880,'3',NULL,'$2y$10$GGKe09cDZlV.4Sq9vdPijuUgqP0j46d5Y84el0I8d0BMU0aKPwo1C','STUDENT',NULL,'2021-06-23 19:35:59','2021-06-23 19:35:59'),
(422,'cyrel777@gmail.com','BILANG','JAYCYRLE','CATARAJA','MALE','NEW','2001-01-25','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09077507779','cyrel777@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan',NULL,'$2y$10$Ah.SBfCUstsv62aV5t/sReBY/CJ6E5Zt9mYm/KJUN9BKCSEoBXqJe','STUDENT',NULL,'2021-06-23 19:36:13','2021-06-23 19:36:13'),
(423,'docdoc_sabuero@yahoo.com','DOCDOC','IAN ALEXIS','SABUERO','MALE','NEW','2001-05-16','OZAMIS CITY','09530522979','docdocianalexis.2001@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'P-7 Gango Ozamis City',NULL,'$2y$10$mEb.lDuYWlNx1fwJ27sZZO9cn/C0/YJSlNVEWxfOidbpJqXavZtgG','STUDENT',NULL,'2021-06-23 19:36:32','2021-06-23 19:36:32'),
(424,'Joel D. Mandawe','MANDAWE','JOEL','DAYAGBEL','MALE','NEW','2003-05-20','CANIANGAN TANGUB CITY','09354736563','jhonwamandawe@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Oriental','Opol','Taboc',26758,'Zone 4','2021-06-23 19:41:37','$2y$10$j04eTTpt.eQD/5yrqM4gweIKhJaOl9Jd6wzc9kyOC8jcB7A1Z9v.q','STUDENT',NULL,'2021-06-23 19:36:44','2021-06-23 19:41:37'),
(425,'atumaras338@gmail.com','TUMARAS','ARLYN','GOMIALA','FEMALE','TRANSFEREE','1999-11-17','MAMAGUM, SND, LDN','09677749185','atumaras338@gmail.com','BSED','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Paiton',26270,'4','2021-06-23 19:40:24','$2y$10$4o54GyejzTW7H8yHuqXIZO5u/kZwM/PaAKUSz.XRTyg4bNtTchc3m','STUDENT',NULL,'2021-06-23 19:37:25','2021-06-23 19:40:24'),
(426,'mariannjoytanilon668@gmail.com','TANILON','MARIANN JOY','SABAYTON','FEMALE','NEW','2003-03-12','PINAMUNGAJAN, CEBU','09639598029','mariannjoytanilon668@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Lanao del Norte','Baroy','Maliwanag',19820,'Purok 7','2021-06-23 19:39:43','$2y$10$5e/ZnT/aUdMZ3lwaczRYpe0Iq9vl44AFuhSzM.kYuQ8gjTw/doNLi','STUDENT',NULL,'2021-06-23 19:38:45','2021-06-23 19:39:43'),
(427,'James Ryan','GALON','JAMES RYAN','LAGUE','MALE','NEW','2002-09-14','MHARS GEN','09308661840','galonjamesryan@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tudela','Pan-Ay Diot',26315,'Purok 1','2021-06-23 19:46:16','$2y$10$YlTHraw9J0CyWtSRjGb7ieKs3LHOcdihrgDq9rMNgaBy4Dbh9N6Ki','STUDENT',NULL,'2021-06-23 19:38:45','2021-06-23 19:46:16'),
(428,'Leniel Ebarora','EBARORA','LENIEL','S','MALE','NEW','2003-11-28','OZAMIZ CITY','09663688219','ebaroral@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok 7 bong bong ozamis city','2021-06-23 19:41:41','$2y$10$dMpIdkKcht9CiaSu13T1wucObrCCB30sJAmSCYjPITDuzAtZegudO','STUDENT',NULL,'2021-06-23 19:38:46','2021-06-23 19:41:41'),
(429,'margiscampa­ner@gmail.com','CAMPANER','MARGIS','LATO','FEMALE','NEW','2003-04-21','MOLAVE','09383796751','margiscampaner@gamil.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'PUROK MALIPAYON 2 CULO',NULL,'$2y$10$xO1Bp7zlMJMiU4HsDX7I3OaS4bztmeDwTs3F4wDgvQLLgRms.9Ixi','STUDENT',NULL,'2021-06-23 19:38:52','2021-06-23 19:38:52'),
(430,'Honeybee Cadile','CADILE','HONEYBEE','ARMADA','FEMALE','NEW','2002-02-06','CANIOGAN TUBOD LDN','09362335907','cadilehoneybee907@gmail.com','BS CRIM','BSOA','FULL ONLINE',NULL,'Lanao del Norte','Lala','Maranding',19961,'Lemon tree','2021-06-23 19:40:17','$2y$10$4RYwqJcffXMXYsPYkaDf9O3tNgRRVwLFIeVnectnjnzGCje1hSyvq','STUDENT',NULL,'2021-06-23 19:38:52','2021-06-23 19:40:17'),
(431,'benjieluna79@gmail.com','LUNA','BENJIE JR.','MANLANGIT','MALE','NEW','2003-12-10','DALAON MOLAVE ZAMBOANGA DEL SUR','09639675275','benjieluna79@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Dalaon',41168,'Suhi',NULL,'$2y$10$cg4BtYHEDvfc0gWqg/ke3.kyvMZslkgJXSji8eHG1YhF0XU2vyt6.','STUDENT',NULL,'2021-06-23 19:38:57','2021-06-23 19:38:57'),
(432,'Rafeil Joy','AMANCIO','RAFEIL JOY','ABUCAY','FEMALE','NEW','2003-08-18','ANONANG BONIFACIO MISAMIS OCCIDENTAL','09369270746','rafeiljoy123@gmail.com','BSCS','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Bag-Ong Anonang',25886,'Purok 2','2021-06-23 19:47:40','$2y$10$JGI22UeDWPZ1I8CeTEPcwOxn5ki5PzXgcCfk0.EsoypqGzSNWpINC','STUDENT',NULL,'2021-06-23 19:40:04','2021-06-23 19:47:40'),
(433,'florjohnmark40@gmail.com','FLOR','JOHN MARK','TIMTIM','MALE','NEW','2002-12-04','SINUZA OZAMIS CITY','09639201468','florjohnmark40@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 3','2021-06-23 19:50:07','$2y$10$gzL1fJgXZrer3vEZv5D9p.PyNdMaBKFEW.DHd.hgSIjjXHuzF0D3W','STUDENT',NULL,'2021-06-23 19:40:41','2021-06-23 19:50:07'),
(434,'jan.mamalias02@gmail.com','MAMALIAS','JAN LEUEL','SALVA','MALE','NEW','2002-01-01','MOLAVE ZAMBOANGA DEL SUR','09639675330','jan.mamalias02@gmail.com','BSED','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok Guapa',NULL,'$2y$10$w.gqrHY7Ef4K2vFwYLzFCOj85LSo03OV6EQ9jhp0jn5n3jQfYLgaK','STUDENT',NULL,'2021-06-23 19:40:44','2021-06-23 19:40:44'),
(435,'gallardokhennith@gmail.com','GALLARDO','KENNITH','GAPOL','MALE','TRANSFEREE','2021-12-27','LUSONG, TUBURAN CEBU','09950066011','gallardokhennith@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Pulot',26132,'Prk. 7','2021-06-23 19:43:05','$2y$10$0.h6vXJFrI1yyz6ihGbt3.KaRohbMqE17EdI9d9gr9am2H/XVk3BC','STUDENT',NULL,'2021-06-23 19:41:22','2021-06-23 19:43:05'),
(436,'rucelmadarimot8','MADARIMOT','RUCEL','CAGA-ANAN','FEMALE','NEW','2001-07-08','OROQUIETA CITY','09071564488','rucelmadarimot8@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Conat',25839,'Purok 6, Conat, Aloran,Misamis Occidental','2021-06-23 20:00:40','$2y$10$R.oKZC37TYJMMh164m6c5OkqvIxdTa7i27gFteQrcJNibpI/yVDxe','STUDENT',NULL,'2021-06-23 19:41:50','2021-06-23 20:00:40'),
(437,'Anamarie_opiar','OPIAR','ANA MARIE','BAYLOSIS','FEMALE','NEW','2001-06-12','BALIAN PAYAO ZAMBOANGA SIBUGAY','09067906993','opiaranamarie@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok 2 Maliwanag','2021-06-23 19:43:10','$2y$10$ENAElQNWD5hlad1TxEKEsO7F7JSlZP0E1WWdXKWw69rEQMUXeMrGW','STUDENT',NULL,'2021-06-23 19:42:41','2021-06-23 19:43:10'),
(438,'bogoleonilynfiel@gmail.com','BOGO','LEONILYN','FIEL','FEMALE','NEW','2003-09-01','MISAMIS OCCIDENTAL PROVINCIAL HOSPITAL OROQUIETA CITY','09950118284','bogoleonilynfiel@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Aloran','Macubon',25848,'Purok 1','2021-06-23 19:47:34','$2y$10$h3o3bxjWsuvBj6riijjNMelJKw0YOqgexutsVbeDAad7jXhs0SVBO','STUDENT',NULL,'2021-06-23 19:42:47','2021-06-23 19:47:34'),
(439,'Moj','GONZALES','JOSE MARI','CALAHAT','MALE','NEW','2002-09-12','MUNTINLUPA CITY','09972365547','gonzalesmoj9@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok-7 bañadero','2021-06-23 19:43:13','$2y$10$Jas.bWH6U0.ERbrha0gQ8uFUn2mfFGLkJKuBlBV.YMMcDlV5W5pdG','STUDENT',NULL,'2021-06-23 19:42:50','2021-06-23 19:43:13'),
(440,'Micz0129','ATES','MICO','REMULTA','MALE','NEW','2002-01-29','MHARS REGIONAL TRAINING AND TEACHING HOSP., OZAMIZ CITY MIS. OCC.','09501031407','micoates791@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok 1','2021-06-23 19:43:27','$2y$10$I1cUWMcWPyHqkyspYz6iJeppeKuxwUYrw5PXGgwEhPUWTa4Y8t5xe','STUDENT',NULL,'2021-06-23 19:42:51','2021-06-23 19:43:27'),
(441,'mortesfebiegrace@gmail.com','MORTES','FEBIE GRACE','CAMPOS','FEMALE','NEW','2003-02-19','STA.MARIA TANGUB CITY','09127475237','mortesfebiegrace@gmail.com','BEED','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'2','2021-06-23 19:44:32','$2y$10$wiq/LySQYzb5ddPL1fp5EOqn.ouC/FBv6R8Uyw.CtBCcjUpFF0uhm','STUDENT',NULL,'2021-06-23 19:43:26','2021-06-23 19:44:32'),
(442,'Mitos Elle','ELLE','MITOS','AME','FEMALE','NEW','2002-05-02','OZAMIZ CITY','09460904403','elle.mitos27@gmail.com','AB ENGLISH','AB ENGLISH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'Purok-5','2021-06-23 20:01:35','$2y$10$vaPkdLV/TQHpq2U20v9DqerqydW.r0makCFD5w.bkfiZtLIo0SdGq','STUDENT',NULL,'2021-06-23 19:43:30','2021-06-23 20:01:35'),
(443,'Lyca','RENTOR','LYCA MAE','MACALISANG','FEMALE','NEW','2002-04-25','SAGACAD DINAS ZAMBOANGA  DEL SUR','09481040153','tazzanaevrea@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Clarin','Poblacion III',25956,'Poblacion 3 Milanes Apartment','2021-06-23 19:47:05','$2y$10$.c/BKAZEnbGqdKGcJQyKEuv5KdmZJ/ZiwF8bahqLkqjtab4lODj82','STUDENT',NULL,'2021-06-23 19:43:47','2021-06-23 19:47:05'),
(444,'NyleRobie','OCAB','NYLE ROBIE','PAREL','FEMALE','NEW','2002-01-30','POBLACION, CARMEN, COTABATO','09122852839','nylerobie@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Bougainvillea',NULL,'$2y$10$KdEYDSIU9u4rlp7/1DvQYu8hncE543xhwG6Op1dpvL9UX1nAZ7NEK','STUDENT',NULL,'2021-06-23 19:43:54','2021-06-23 19:43:54'),
(445,'Gwin143','CARREON','GWIN','LAPITAN','FEMALE','NEW','2003-04-12','LUMPONID MIDSALIP ZAMBOANGA DEL SUR','09970753975','gwincarreon143@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'3rd South Deloso St. Prk. Noneluna','2021-06-23 19:51:08','$2y$10$0Kk5fdxu/FEMi0jOlTbJDOY2GE7iHtrTIiAB1mC1H4KIdZ4I/kKdW','STUDENT',NULL,'2021-06-23 19:43:55','2021-06-23 19:51:08'),
(446,'kimjoshua.jumalon','JUMALON','KIM JOSHUA','ALIVIO','MALE','TRANSFEREE','2001-09-17','QUEZON CITY, MANILA','09261844076','jumalonkimjoshua37@gmail.com','BSED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'P-6 Tabid, Ozamiz City',NULL,'$2y$10$m0LITyrf2Pv4JMPSkPSF0eflHXSUgwipZYHnFnhPhrfYbiMB/fjnm','STUDENT',NULL,'2021-06-23 19:43:55','2021-06-23 19:43:55'),
(447,'dianajeanvillastique340@gmail.com','VILLASTIQUE','DIANA JEAN','BONGCAWEL','FEMALE','NEW','2003-02-20','MATUGNAW TANGUB CITY','09357425037','dianajeanvillastique340@gmail.com','GEN  MID','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Montol',25904,'Purok3','2021-06-23 19:49:05','$2y$10$TJD1ELy0mtML1mpGhexpROLXlwZ46SlFRGTysg3HbGaDgI3teWZrO','STUDENT',NULL,'2021-06-23 19:44:11','2021-06-23 19:49:05'),
(448,'nercuamarryfe@email.com','NERCUA','MARRY FE','ABAJAR','FEMALE','NEW','2003-06-12','P-2 KATIPUNAN,PLARIDEL,MISAMIS,OCCIDENTAL','09368846711','nercuamarryfe@email.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Plaridel','Katipunan',26170,'P-2',NULL,'$2y$10$vCf2RBtcR8EY2DCxWMCxeejvdkJ7u3mIeJWKY7Y5OG3s3jCojKGhG','STUDENT',NULL,'2021-06-23 19:44:36','2021-06-23 19:44:36'),
(449,'Jane Ates','ATES','EARL JANE','CALUNOD','FEMALE','NEW','2002-06-17','SND,LANAO DEL NORTE','09510433738','janearl.ates@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Pagadian City','Balangasan',41187,'Purok Tabing Ilog',NULL,'$2y$10$C4/fXTz2cNVVlP0aozWW5.3yZpp8F4ANr3CspFhOJx6ew9roMjZeO','STUDENT',NULL,'2021-06-23 19:44:52','2021-06-23 19:44:52'),
(450,'Patrick Kean Incoy','INCOY','PATRICK KEAN','QUILO','MALE','NEW','2002-11-10','OROQUIETA CITY MISAMIS OCCIDENTAL','09276188922','patrickkean9@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Labo',25844,NULL,'2021-06-23 19:45:35','$2y$10$z4v7Ka568okDH.UypKE9S.j6jMmROGlkJ27Df.FDpnjt.9uHy8TT2','STUDENT',NULL,'2021-06-23 19:45:11','2021-06-23 19:45:35'),
(451,'queenejoienaquines@gmail.com','NAQUINES','QUEENEJOIE','PIOJO','FEMALE','NEW','2021-02-25','PAGADIAN CITY','09518241923','queenejoienaquines@gamil.com','BSISM','BEED','FULL ONLINE',NULL,'Zamboanga del Sur','Aurora','Libertad',40794,'Purok Sto.Nino',NULL,'$2y$10$FRWZwMV9x1P9nvaT85dcVu4oVVy6TDdGPnOVaWIGP3FiPOX.tLlaS','STUDENT',NULL,'2021-06-23 19:45:24','2021-06-23 19:45:24'),
(452,'Bloody18','ORNOPIA','BLOODY-MIER','PIKITPIKIT','MALE','NEW','2002-11-11','KABUHI,MAHAYAG,ZAMBOANGA DEL SUR','09667458906','ornopiablai@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Kabuhi',41089,'P-1','2021-06-23 19:47:07','$2y$10$N2UJFBxrCd3.bul8une2Se1I6iOkxCgx8GUjaQ8DpissMTOG72Yi2','STUDENT',NULL,'2021-06-23 19:45:53','2021-06-23 19:47:07'),
(453,'nabele','TONGA','RONABELE','CABAHUG','FEMALE','NEW','2003-04-19','LANAO NORTE PROVINCIAL HOSPITAL, BAROY, LANAO DEL NORTE','09265870989','nabele.tonga@gmail.com','BSCS','BSBA-MM','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Dalama',20263,'Purok 3','2021-06-23 19:46:30','$2y$10$dkk9vE7.rHp3YsSfGxEjh.NvPyZU2CkemJq7Ocf47Di.z0islAjtm','STUDENT',NULL,'2021-06-23 19:46:02','2021-06-23 19:46:30'),
(454,'sanjuanjovelyn16@gmail.com','SAN JUAN','JOVELYN','JOGUILON','FEMALE','NEW','2001-10-16','LILOAN BONIFACIO MISAMIS OCCIDENTAL','09679320529','sanjuanjovelyn16@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'Purok 7','2021-06-23 19:49:21','$2y$10$kaUHrq/ovB6n1YonGiN/ausbVCLjhfd3oRvY0KmpuwJYLy3AqB/ju','STUDENT',NULL,'2021-06-23 19:46:33','2021-06-23 19:49:21'),
(455,'Dabschen','DABALOS','CHERRY','SALINAS','FEMALE','NEW','2003-03-04','MAGALLANES ST. MOLAVE, ZAMBOANGA DEL SUR','09074464615','cherrydabalos03@gmail.com','BSCS','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'MAGALLANES ST.',NULL,'$2y$10$VOcEbFQWAG60lMHAhDXqR.96p82bPNdejqizluBw6W4Ds9TxenPOW','STUDENT',NULL,'2021-06-23 19:46:40','2021-06-23 19:46:40'),
(456,'Jhamaicadaniel123','DANIEL','JHAMAICA MAE','CABISAY','FEMALE','NEW','2003-03-03','DMDTMH','09489758271','jhamaicadaniel@yahoo.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Noniluna',NULL,'$2y$10$25.DSZno8fwdYSEDK.jymuqfuUdPaFq4SNo6mZj6JDRQrwuQ1aXZ2','STUDENT',NULL,'2021-06-23 19:46:56','2021-06-23 19:46:56'),
(457,'legaralezbeth15@gmail.com','LEGARA','LEZBETH','BOSMION','FEMALE','NEW','2003-03-23','MHARS GEN HOSPITAL OZAMIZ CITY','09105851452','legaralezbeth15@gmail.com','BSOA','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Labinay',26121,'Purok-3',NULL,'$2y$10$InqMQLrRcwS9.cEx7DWAtO9DvqrTeSrE/6.DPcrCJjuRfggVV3PNq','STUDENT',NULL,'2021-06-23 19:47:26','2021-06-23 19:47:26'),
(458,'May Cenas','CENAS','MAY','','FEMALE','TRANSFEREE','2003-05-14','OROQUIETA CITY','09121681213','mcenas14@gmail.com','BSED-FIL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Jimenez','Butuay',25992,'Purok 1','2021-06-23 19:48:14','$2y$10$NMAuEvYMLyhjJYuEso2fqeMC7JeFZ.5FPho4UrSSVCnFyU4ucgsNS','STUDENT',NULL,'2021-06-23 19:47:29','2021-06-23 19:48:14'),
(459,'cmrullin@gmail.com','RULLIN','CHERRYL MAE','CENTINO','FEMALE','NEW','2004-10-04','SAN JUAN PANAON MISAMIS OCCIDENTAL','09093334280','cmrullin@gmail.com','BEED','BEED','BLENDED',NULL,'Misamis Occidental','Panaon','San Juan',26153,'Purok 3','2021-06-24 09:41:01','$2y$10$/GPgEA/mv7hULPDyjUPegeDu3JC5T8E20.yZn0OMgB29f1Q41mTbe','STUDENT',NULL,'2021-06-23 19:47:30','2021-06-24 09:41:01'),
(460,'Catherine','JAVIER','CATHERINE','HIMPAYAN','FEMALE','NEW','2001-07-04','LEBAK, SULTAN KUDARAT','09382797530','javiercatherine3@gmail.com','BSOA','AB COMM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'Purok 1','2021-06-23 19:59:36','$2y$10$0IoHJD9DDqg9Y0Gr8mI.Xe6gvJ4MjcqZc9ceKhquhPguKUX.y/D8y','STUDENT',NULL,'2021-06-23 19:47:50','2021-06-23 19:59:36'),
(461,'Eric','CALUNOD','ERIC','ONGUE','MALE','NEW','2002-08-09','OZAMIZ CITY','09','calunod.eric2002@gmail.con','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 100',NULL,'$2y$10$tVmp57P.WtNwWh5wRUzUFeS0JMv.0XZS/aJpBT.GxyLpdXCPOmqKW','STUDENT',NULL,'2021-06-23 19:48:23','2021-06-23 19:48:23'),
(462,'alcoranjohnpaul4@gmail.com','ALCORAN','JOHN PAUL','DELA CERNA','MALE','NEW','2003-03-22','VOCATOR,MISAMIS OCCIDENTAL','09456075079','alcoranjohnpaul4@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'P3','2021-06-23 20:41:44','$2y$10$qrodiowYKsK8yKi0blVvHOIgCMKssWwUCdO6CC3nOIweLpg8aO0Ia','STUDENT',NULL,'2021-06-23 19:49:07','2021-06-23 20:41:44'),
(463,'Roseljariojr','JARIO','ROSEL JR','MAPUTI','MALE','NEW','2021-06-23','ABAGA LILOAN BONIFACIO MISSAMIS OCCIDENTAL','09532732846','roseljariojr143@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'Purok 6 Abaga',NULL,'$2y$10$dKW0UNsR48bO0lay/V9tauzPE1cDimLzq2H/KInd0J511kcY0UY82','STUDENT',NULL,'2021-06-23 19:49:14','2021-06-23 19:49:14'),
(464,'Marinel','CORPUZ','MARINEL','LINGGO','FEMALE','NEW','2002-10-20','LINCONAN, BONIFACIO MISAMIS OCCIDENTAL','09061265336','corpuzmarinel24@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Linconan',25899,'Purok-3 Linconan, Bonifacio Misamis Occidental','2021-06-23 20:13:19','$2y$10$qMabaYsIaa3pZQ5kdRAs6eszOOo/ziyG9ECjYQAQj8c4F69SEPdmS','STUDENT',NULL,'2021-06-23 19:49:20','2021-06-23 20:13:19'),
(465,'margiscampaner@gmail.com','CAMPANER','MARGIS','LATO','FEMALE','NEW','2003-04-21','MOLAVE','09383796751','margiscampaner@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'MALIPAYON 2 CULO','2021-06-23 19:52:53','$2y$10$cAzcRMbl0gk6vUHTUmpL9.20v7HXpPN1lUVYq44F9sbwNrOGBp/Ru','STUDENT','0lVX8awL88aVXvqJpesDtUtvCItojd8e5QLYT6yr9ctfloA2xe4JvgpbyPGN','2021-06-23 19:49:30','2021-06-23 19:52:53'),
(466,'Nicanor E. Crosio','CROSIO','NICANOR JR.','E.','MALE','NEW','2003-07-01','SINUZA, OZAMIZ CITY','09127692827','nicanorcrosio379@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 3','2021-06-23 19:52:42','$2y$10$P.vdWnXIKB0Qko2GSE4Qhe14yQEL/RD1.VVZ3phd6CJ5hVVL0QP0y','STUDENT',NULL,'2021-06-23 19:49:37','2021-06-23 19:52:42'),
(467,'angelasagario02@gmail.com','SAGARIO','ANGELA','BENALDO','FEMALE','NEW','2002-05-26','POBLACION. MAHAYAG, ZAMBOANGA DEL SUR','09476443192','angelasagario02@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 7, Poblacion. Mahayag, Zamboanga Del Sur','2021-06-23 19:52:27','$2y$10$Cif7ytuAok8alkBXMENIw.qtcUCoDi6hLMSCN8QnyA18ai0MQw.T.','STUDENT',NULL,'2021-06-23 19:50:03','2021-06-23 19:52:27'),
(468,'193981','SOLATORIO','WINMAR','ABONG','MALE','NEW','2003-10-25','PRENZA, TANGUB CITY','09639393990','winmarsolatorio4@gmail.com','BSED-SOCSTUD','BSED','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Prenza',26273,'Purok 1','2021-06-23 19:56:04','$2y$10$97GZHcetO8t1P1c0L3.EIe10hf1jtyh39G/TiRc9hWYRKho.8C8EW','STUDENT',NULL,'2021-06-23 19:50:47','2021-06-23 19:56:04'),
(469,'aprilgracedalo12e@gmail.com','DALO','APRIL GRACE','SELIM','FEMALE','NEW','2003-04-10','PAGADIAN CITY ZAMBOANGA DEL SUR','09510857126','aprilgracedalo12e@gmail.com','BSBA-MM','AB ENGLISH','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok Tarsing','2021-06-23 19:54:15','$2y$10$pjc2s/ABF./yPM/0.ZuO/.lIPaLKx2Jo30mfi.orU4VCokVeLWE7m','STUDENT',NULL,'2021-06-23 19:51:26','2021-06-23 19:54:15'),
(470,'jerico1318','APDUHAN','EL JERICO JOHN','SOLIJON','MALE','NEW','2002-09-13','MHARS HOSPITAL','09505282548','kuyaekoy13@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok 1','2021-06-23 19:52:56','$2y$10$InFDdxmpVGBdanROir/s.OkCWW1NJnS.rcEgaQBTfk/FqjYu3qWvG','STUDENT',NULL,'2021-06-23 19:51:48','2021-06-23 19:52:56'),
(471,'Eric.Calunod2002','CALUNOD','ERIC','ONGUE','MALE','NEW','2002-08-09','OZAMIZ CITY','09464779368','eric.calunod2002@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 9','2021-06-23 19:53:16','$2y$10$qpK8CBtrUzMcpxZ2.RVvguZRC.T3nWwyG0Fr3Uga3MCJbNQ48iJ9C','STUDENT',NULL,'2021-06-23 19:52:46','2021-06-23 19:53:16'),
(472,'Ladymairesocampos','OCAMPOS','LADY MAIRES','SUMANLAD','FEMALE','NEW','2002-01-24','MHARS GEN','09635595786','ladymairesocampos@gmail.com','BEED','BSED-SOCSTUD','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 3','2021-06-23 20:19:48','$2y$10$RsI5PM6PdPseErwdx8KBRu2aKmlLMhfs3.Cylacg8Rz1NYcnHLKea','STUDENT',NULL,'2021-06-23 19:53:06','2021-06-23 20:19:48'),
(473,'jerahsagusay@gmail.com','SAGUSAY','JERAH','SUBRADO','FEMALE','NEW','2002-10-27','JIMENEZ, MISAMIS OCCIDENTAL','09686150124','jerahsagusay@gmail.com','BSED-MAPEH','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok 3 TABO-o',NULL,'$2y$10$UWCS2FDKqcLidow3eJPsVubO7P3mIP83C8yhajMMtfmm.IGVVUkGW','STUDENT',NULL,'2021-06-23 19:53:16','2021-06-23 19:53:16'),
(474,'Jomjom12','GONZALES','JOSE MARI','CALAHAT','MALE','NEW','2002-09-12','MUNTINLUPA CITY','09972365547','gonzalesjom88@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 7 bañadero','2021-06-23 19:54:10','$2y$10$aSoYs3sWQNKcNk82.doLPu/fWsezAFLnwFhFsqpkuRZA1m4nnzmEG','STUDENT',NULL,'2021-06-23 19:53:49','2021-06-23 19:54:10'),
(475,'eivonhb','RICALDE','NOVIE','MAGPULONG','FEMALE','NEW','1992-11-14','KINANGAY SUR, CLARIN, MISAMIS OCCIDENTAL','09305867992','eivonricalde@gmail.com','BEED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Embargo',26112,'Purok 1','2021-06-23 19:57:33','$2y$10$7WWVd4bZjJ2.4V/p2VobXeAoKFF0NikUpVtn54PandYeSqHbFD072','STUDENT',NULL,'2021-06-23 19:54:18','2021-06-23 19:57:33'),
(476,'Jhamaicadaniel143','DANIEL','JHAMAICA MAE','CABISAY','FEMALE','NEW','2003-03-03','DMDTMH','09489758271','jhamaicamaedaniel@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Noniluna',NULL,'$2y$10$.dXY/HPdh9PVwkc2wZJVqe6OMkuEIRzQnodtNIPXscJawli/9eOZe','STUDENT',NULL,'2021-06-23 19:55:06','2021-06-23 19:55:06'),
(477,'Chacha07','HISTA','CHARRIZE','LADAO','FEMALE','NEW','2003-07-07','MAGALLANES ST. MOLAVE ZAMBOANGA DEL SUR','09093651878','charrizehista@gmail.com','BSCS','AB POLSCI','BLENDED',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'MAGALLANES ST.',NULL,'$2y$10$DX5yBp6PobbFz2TnnEMql..eqGXbLpxr1o4CmsDBTA7jbtd.Z2Pty','STUDENT',NULL,'2021-06-23 19:55:11','2021-06-23 19:55:11'),
(478,'Akira20','BANGOLAN','ARIAN','VILLAPAñA','MALE','TRANSFEREE','2001-08-02','EASTERN SOMINOT ZAMBOANGA DEL SUR','09957303758','bangolanarian@gmail.com','BS CRIM','BSED-FIL','BLENDED',NULL,'Zamboanga del Sur','Sominot','Eastern Poblacion',41333,'Purok Doña Luz','2021-06-23 19:56:53','$2y$10$8aJhfKVLWDaUS/fbcQuN4Ofm8ICdrONlWuQVhQ7xJAiLCwnlBMjWi','STUDENT',NULL,'2021-06-23 19:55:24','2021-06-23 19:56:53'),
(479,'Jemuel','BENGHIT','JEMUEL','CARREON','MALE','NEW','2002-09-02','DMDTMH','09078796169','jemuelbenghit32@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Noneluna','2021-06-23 19:59:55','$2y$10$RzFN9UE1mGrqWIrglGhfyuXk4c0n/xDEL.Wp.EC2EcHiY6T4hwy5C','STUDENT',NULL,'2021-06-23 19:55:57','2021-06-23 19:59:55'),
(480,'hannahn376@gmail.com','BACO','HANNAH NICOLE','MAGALLON','FEMALE','NEW','2002-10-01','MEDINA HOSPITAL','09632381443','hannahn376@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Clarin','Segatic Diot',25960,'Purok 1','2021-06-23 19:58:48','$2y$10$WsvSJYnoEKok/7wcx8yuNeLdQox5BdPM5xerCHT0hirTUvUmTHJ/6','STUDENT',NULL,'2021-06-23 19:56:08','2021-06-23 19:58:48'),
(481,'Juliet','BARRIENTOS','JULIET','CUSTODIO','FEMALE','NEW','2001-12-06','SINACABAN','09388358769','julietbarrientos222@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Villaflor',26089,'P-7 Transville Villaflor Oroquieta City','2021-06-23 20:02:26','$2y$10$NbXnl9g0n36I999Sw1w9qeYGUKm/f.L0ZYTPU516S3DLevS1McM96','STUDENT',NULL,'2021-06-23 19:57:17','2021-06-23 20:02:26'),
(482,'Aprilferr','SAGARIO','APRIL FERR','JAGONIA','MALE','NEW','2002-04-18','POBLACION , BONIFACIO, MISAMIS OCCIDENTAL','09078725593','aprilferr@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 5',NULL,'$2y$10$RfieuJOvCrb2pVDssz8C0eEbRVWX007Slz1EhZWkUnxpfKBM86eQS','STUDENT',NULL,'2021-06-23 19:57:18','2021-06-23 19:57:18'),
(483,'Desiree_Sabellano','SABELLANO','DESIREE','','FEMALE','NEW','2003-05-31','MOLAVE LYING-INN','09637493980','desireebacurnay@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Molave','Makuguihon',41176,'PUROK GUMAMELA, GUILLEN STREET',NULL,'$2y$10$/nt0TuEq8D6B/OwzbjeUz.P3LlaKg8v3GP4Dm20mYTtkBYXXUcbJq','STUDENT',NULL,'2021-06-23 19:57:59','2021-06-23 19:57:59'),
(484,'CherrySumalinog','SUMALINOG','CHERRYMIE','CATIAG','FEMALE','NEW','2002-07-18','BAG-ONG OPON, RAMON MAGSAYSAY, ZAMBOANGA DEL SUR','09512677006','cherrymiesumalinog@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Mabini',41269,'Purok 3-Mangga','2021-06-23 20:02:02','$2y$10$T/HAvsJj1c9g4/nICvqz2ONk99U28BNLY2TALqGAWc/dvB4Vo8Bzu','STUDENT',NULL,'2021-06-23 19:58:04','2021-06-23 20:02:02'),
(485,'Mayeek','PONTILLAS','MAY','FLORES','FEMALE','NEW','2002-02-04','KOLAMBUGAN LANAO DEL NORTE','09268329024','maypontillas8@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Kolambugan','Austin Heights',19924,'Purok 3','2021-06-23 19:58:53','$2y$10$faDveh4fTbJEqE6d2dcpl.JgJlLVKerBb8GSepH5GAQsnoO1w2ZoG','STUDENT',NULL,'2021-06-23 19:58:29','2021-06-23 19:58:53'),
(486,'Reysan Acla','ACLA','REYSAN','SUMALPONG','MALE','NEW','2002-12-31','BASIRANG, TUDELA, MIS. OCC','09652150101','reysanacla@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Basirang',26292,'Purok 1',NULL,'$2y$10$dswRxKRITgwvimK4btMTjeRXeHuiMeMoO/bK0mBQt9K/NrFqbGshS','STUDENT',NULL,'2021-06-23 19:58:51','2021-06-23 19:58:51'),
(487,'kenneth16','CABASAG','KENNETH','MARIMON','MALE','NEW','2002-10-16','CAGAY-ANON SINACABAN','09510332407','Kennethcabasag04@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Cagay-Anon',26218,'Roxas','2021-06-23 20:00:17','$2y$10$X8rlaZpyBDVHlGPxJaNo0uBdyNzRCHr8j9IXSI53RjtKKvFasufVS','STUDENT',NULL,'2021-06-23 19:58:59','2021-06-23 20:00:17'),
(488,'Ismael','VERGAS','ISMAEL','TAMULA','MALE','TRANSFEREE','1994-10-11','OZAMIZ CITY','09998414884','leamvergas@gmail.com','BSCS','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tinago',26139,'malinawon','2021-06-23 19:59:33','$2y$10$IK6d63QeVHgLxHhalWCjwedWQb37jeRm.ZQcxbVFerNR53ya9gxoW','STUDENT',NULL,'2021-06-23 19:59:09','2021-06-23 19:59:33'),
(489,'Arnie0511','PACALDO','ARNIE','ELUMBRA','MALE','NEW','2002-05-11','OZAMIS CITY','09302188914','arniepacaldo0511@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carmen',26104,'P8A Carmen annex','2021-06-23 20:01:14','$2y$10$F6F6C1AjmYYC5yFNYuTJqO34wHXxhPBWWW9vxcy4LMiWeQ32A3ody','STUDENT',NULL,'2021-06-23 19:59:24','2021-06-23 20:01:14'),
(490,'Jaira Joy T. Sarigumba','SARIGUMBA','JAIRAH JOY','TAMO-O','FEMALE','NEW','2002-07-12','DASMARIñIAS CAVITY','09567503422','jairahjoysarigumba55@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Aloran','Culpan',25840,'Purok 1','2021-06-23 20:54:12','$2y$10$FKqQpd3boyOSzDDuLU52z.wToe6NdqldmnALZ/uMNGHkv2rDmgZ9i','STUDENT','c3ulw441DkAmuM4ccYufiBGN2k77mnOP15eeBFOu9smCsshn86hK1U31c84c','2021-06-23 20:00:25','2021-06-23 20:54:12'),
(491,'Concon.amores@gmail.com','PATALINGHUG','ARLENE','AMORES','FEMALE','TRANSFEREE','2002-08-17','TINOTONGAN TUKURAN ZAMBOANGA DEL SUR','09381120582','concon.amores@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','San Vicente',41385,'Purok2',NULL,'$2y$10$GmFwgXWn0uRFPSk/Jg4aj.94uEiDZEgIV.XLE4Aej0.KFnv/dumXC','STUDENT',NULL,'2021-06-23 20:00:26','2021-06-23 20:00:26'),
(492,'qmarilou51@gmail.com','QUINTO','MARILOU','RELATIVO','FEMALE','NEW','2002-09-08','MOLAVE, ZAMBOANGA DEL SUR','09074464442','qmarilou51@gmail.com','BSBA-MM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African Daisy 2, Bliss','2021-06-23 20:04:44','$2y$10$IYSc6I6OCHF.j1bYqLLlcuenWFT9UDiP7RnGwCRuAdaBRw3e15eXW','STUDENT',NULL,'2021-06-23 20:00:31','2021-06-23 20:04:44'),
(493,'maricarliantada@yahoo.com','LIANTADA','MARICAR','MALALIS','FEMALE','NEW','2003-09-03','PUROK-5, LORENZO TAN, TANGUB CITY','09303165898','maricarliantada@yahoo.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok-5 Lorenzo Tan',NULL,'$2y$10$4Zvm56IvLtz59CRg4YveROazHS.xsacd3.DIjd1jTQV5plUojbSiC','STUDENT',NULL,'2021-06-23 20:00:45','2021-06-23 20:00:45'),
(494,'Clark','CALVO','CLARK','JUNIO','MALE','NEW','2001-02-16','SAN ISIDRO MAHAYAG ZAMBOANGA DEL SUR','09700396306','clarkcalvoj@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','San Isidro',41101,'Piña','2021-06-23 20:01:20','$2y$10$JGX/Vg4hoSXTNp8DH0LnaOjfwHaS6SDmUweMCUg4T5yRXyL1gWNqO','STUDENT',NULL,'2021-06-23 20:01:01','2021-06-23 20:01:20'),
(495,'Ka-ye','FLORES','KAYE SANDRA','ALIWATE','FEMALE','NEW','2002-12-01','MOLAVE ZAMBOANGA DEL SUR','09509610200','kayesandraflores222@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'Dahlia',NULL,'$2y$10$DAlr.OQ7tntRZc2kx1BAd.iLwjUPvISzHqlJQOhIAscOHssY5pEJu','STUDENT',NULL,'2021-06-23 20:01:53','2021-06-23 20:01:53'),
(496,'James kyle Tabil','TABIL','JAMES KYLE','','MALE','NEW','2002-12-21','MACABAYAO JIMENEZ','09304355386','jameskyletabil@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Macabayao',25998,'Purok-5','2021-06-23 20:10:37','$2y$10$/FTZ4TL.0IA9gDXBI6FHZewLxOLLxjZtNMUwQ9I7FLhuVgaHpLJGe','STUDENT',NULL,'2021-06-23 20:02:05','2021-06-23 20:10:37'),
(497,'Eric2002','CALUNOD','ERIC','ONGUE','MALE','NEW','2002-08-09','OZAMIZ CITY','09464779368','calunod.eric2002@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 9','2021-06-23 20:06:03','$2y$10$8Oo6trMpWQd3weNsde9AG.eP8DHQpqz7D4CH9PGLDdYHWRFUHIA/C','STUDENT',NULL,'2021-06-23 20:02:37','2021-06-23 20:06:03'),
(498,'Janluije','ESPINOSA','JANLUIJE','RESPICIO','MALE','RETURNEE','2021-01-13','MHARS RTTH','09510332663','janluijeespinosa.gmail@com','BSOA','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'Purok 1 Silanga Tangub city',NULL,'$2y$10$JTrUotXn2OkGQPZwjXBR/Of22dTml7E9moLkL.QB58QQG1/NgDjp2','STUDENT',NULL,'2021-06-23 20:03:09','2021-06-23 20:03:09'),
(499,'Princessrosegarcines','GARCINES','PRINCESS ROSE','DOLINO','FEMALE','TRANSFEREE','2003-05-04','KINUMAN SUR OZAMIZ CITY','09108760640','garcinesprincessrose@gmail.com','BSED-FIL','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Kinuman Sur',26120,'P-2 B Kinuman Sur Ozamiz City','2021-06-23 20:08:45','$2y$10$YN4Su6BNKBT/wWBzSlWUAe//7lW.nfT4A2vL671RpFoGxy2uxjS4e','STUDENT',NULL,'2021-06-23 20:03:32','2021-06-23 20:08:45'),
(500,'ryanjade','CORPUZ','RYAN JADE','MACION','MALE','NEW','2003-08-23','OZAMIZ','09381320318','ryanjadecorpuz@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'Purok 6','2021-06-23 20:03:42','$2y$10$3gKTkTdEDAtgtmOdo2.lH.yZqKH6j.BNh/VX6GpgxYKPwaHYDZ.uy','STUDENT',NULL,'2021-06-23 20:03:32','2021-06-23 20:03:42'),
(501,'rubiaaivy@gmail.com','RUBIA','AIVY','GALINDO','FEMALE','NEW','2002-02-05','PUNTA, PANAON MISAMIS OCCIDENTAL','09054914688','rubiaaivy@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Panaon','Punta',26150,'Purok 4',NULL,'$2y$10$NFtmq2iD5rcF4uZa3HK7cevw7.chbyVs1isdWNGn7b/qJGB4X9tEe','STUDENT',NULL,'2021-06-23 20:04:38','2021-06-23 20:04:38'),
(502,'Cyril Abero','ABERO','CYRIL','LABITO','MALE','NEW','2002-09-01','SINACABAN','09639611890','cyrilabero090102@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Gumamela','2021-06-23 20:13:42','$2y$10$tROPPuh0BS77XYFbePNX5uohM3OuW2H/uLM0.cpZ8C/BGUtVR29vW','STUDENT','CG17C6U5WFshCCOeNdJ9sbFO7x6j00PnhnKaJqsD2VPLVeXsF8XDI3ryAxSv','2021-06-23 20:04:44','2021-06-23 20:13:42'),
(503,'Glyzau@gmail.com','UROT','GLYZA','DIAZ','FEMALE','NEW','2002-11-30','RIVERSIDE TAMBULIG ZAMBOANGA DEL SUR','09094902215','glyzau@gmail.com','BSED-SOCSTUD','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Riverside',41382,'Nangka','2021-06-23 20:06:24','$2y$10$43B5yoHtID8M82c8AXjXF.XTyiTGg5iJSjdh3bv5beWznsPDpbqP2','STUDENT',NULL,'2021-06-23 20:04:58','2021-06-23 20:06:24'),
(504,'Elaine27','SANCHEZ','ELAINE NIEL','','FEMALE','NEW','2003-07-27','TOLOGAN HAGONOY DAVAO DEL SUR','09513808584','elainenielsanchez@gmail.com','GEN  MID','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Santa Cruz',26008,'Purok 2','2021-06-23 20:06:39','$2y$10$nDRUhcgKGzY9PexBknjVw.9WMqoG3QJV2tGsLKdgMb062tmrPJ2jW','STUDENT',NULL,'2021-06-23 20:05:12','2021-06-23 20:06:39'),
(505,'royroy29','CAPAROSO','ROY','COQUILLA','MALE','TRANSFEREE','2002-05-29','MIGPANGE,BONIFACIO,MISAMIS,OCCIDENTAL','09510499404','roycaparoso36@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Migpange',25903,'Purok 4 Migpange','2021-06-23 20:12:11','$2y$10$yyDrLqpG6cJgDu4qlPgT9elI6/TjkqprPiXgTm1TA79nV8K2inwM.','STUDENT',NULL,'2021-06-23 20:05:16','2021-06-23 20:12:11'),
(506,'Kian Fritz','ENGUITO','KIAN FRITZ','BACO','MALE','NEW','2002-10-25','OZAMIZ CITY','09095393781','kianfritzenguito@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Poblacion B',41156,'Purok 1','2021-06-23 20:12:53','$2y$10$AYdcQYPeWgWMdFT/rusB.OiNI1kC0SbdHujpRmCigv1SyH4VGIQuO','STUDENT',NULL,'2021-06-23 20:05:50','2021-06-23 20:12:53'),
(507,'zapatosathealaine.com','ZAPATOS','ATHEA LAINE','MORTES','FEMALE','NEW','2002-12-09','STA. MARIA, TANGUB CITY','09501104353','zapatosathealaine@gmail.com','GEN  MID','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok 2','2021-06-23 20:06:59','$2y$10$PQN5FKrBMS7yaodcBm1ZO.WU8C5ufblqT0eLKa6FL9bmTiQNpnzoa','STUDENT',NULL,'2021-06-23 20:06:01','2021-06-23 20:06:59'),
(508,'alyssajulia20@gmail.com','DALO','ALYSSA JULIA','BARICUATRO','FEMALE','NEW','2003-08-03','BAGUIO CITY BENGUET','09469031616','alyssajulia20@gmail.com','BSED-ENGL','AB POLSCI','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'PUROK TARSING','2021-06-23 20:08:25','$2y$10$g0zrsHJT8s2FEUyeONS8/.8xVSFeuszwVXg4wZMYfYik7hyEal9.u','STUDENT',NULL,'2021-06-23 20:06:38','2021-06-23 20:08:25'),
(509,'Ferrsagario','SAGARIO','APRIL FERR','JAGONIA','MALE','NEW','2002-04-18','POB. BONIFACIO, MIS. OCCIDENTAL','09078725593','aprilferrs@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 5','2021-06-24 08:23:39','$2y$10$TGa/Yj7xrheCQP.lihK.Ru2DCcQuzVgo.PdZcr/atCIi0/fFra29O','STUDENT',NULL,'2021-06-23 20:06:56','2021-06-24 08:23:39'),
(510,'Krisia','ESPINOSA','KRISIA MAY ESPINOSA','QUINTO','FEMALE','NEW','2021-06-21','OZAMIS CITY','09154536410','krisiaespinosa@gmail.com','BSED','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'2','2021-06-23 20:09:15','$2y$10$Pjak1PThUXh3k4OlBbJQOuS1qRn8.tQno.lqXlfWyQgyI3oXCQs1i','STUDENT',NULL,'2021-06-23 20:07:02','2021-06-23 20:09:15'),
(511,'mhyloresco9@gmail.com','LORESCO','MIA CLINTLY','ECOT','FEMALE','NEW','2001-01-29','GUMAHAN JOSEFINA ZAMBOANGA DEL SUR','09512537912','mhyloresco9@gmail.com','GEN  MID','BSED-FIL','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Sta. Cecelia A','2021-06-23 20:07:42','$2y$10$x3IK77OKReiebW2tFoQeueF0J6VHPUvQ6WQSSfrIXJT4m/3R7X2Ca','STUDENT',NULL,'2021-06-23 20:07:13','2021-06-23 20:07:42'),
(512,'Avegel Tagaytay','TAGAYTAY','AVEGEL','MAASIN','FEMALE','NEW','2002-03-13','UPPER TIPARAK TAMBULIG ZAMBOANGA DEL SUR','09500580667','avegel_123@yahoo.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok 1 mangga',NULL,'$2y$10$rsFgRL3lda9uVxWbk7hOL.jaAxWRr7SKCrAJMxmx6kgQqKzsj5mF6','STUDENT',NULL,'2021-06-23 20:07:59','2021-06-23 20:07:59'),
(513,'Efril Mae Aljas','ALJAS','EFRIL MAE','DAHILOG','FEMALE','NEW','2002-04-27','DALISAY, ALORAN, MISAMIS OCCIDENTAL','09460551604','aljasefrilmae@gmail.com','BSED','AB COMM','BLENDED',NULL,'Misamis Occidental','Aloran','Ospital',25857,'Purok 3','2021-06-23 20:11:20','$2y$10$UnelxPHXdDfdzCxzzDeKte25se6mhasWnm9qJ2Wtog2Lw7uinza6S','STUDENT',NULL,'2021-06-23 20:08:31','2021-06-23 20:11:20'),
(514,'Cristal Mae largo','LARGO','CRISTAL MAE','LASCUñA','FEMALE','NEW','2002-08-21','BARANGAY VII, POLAO TANGUB CITY','09519476859','cristalmaelargo@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay VII - Upper',26245,'Purok 3','2021-06-23 20:13:04','$2y$10$IIp1.zN4Db2H63DFKJImieMxFAJzjENbZy3C96VqkxgzZtAX/MYjW','STUDENT',NULL,'2021-06-23 20:08:42','2021-06-23 20:13:04'),
(515,'Roger','MANLEGRO','ROGER','DUPAL-AG','MALE','NEW','2001-06-14','POBLACION, MAHAYAG ZAMBOANGA DEL SUR','09530989963','manlegro7@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Katipunan',41266,'Purok 1A','2021-06-23 20:21:31','$2y$10$u1ehIvOsowTtzAEYv.a8qeeAUvwjnzQK19r5FU9FJStpAwb/4isA6','STUDENT',NULL,'2021-06-23 20:08:47','2021-06-23 20:21:31'),
(516,'Elvie Kepte','KEPTE','ELVIE','EPE','FEMALE','NEW','2003-04-01','EBARLE JOSEFINA ZAMBOANGA DEL SUR','09651537084','kepteelvie01@gmail.com','BSOA','BSOA','BLENDED',NULL,'Zamboanga del Sur','Josefina','Ebarle',40986,'1 Hill Top','2021-06-24 02:50:41','$2y$10$GJgmG48n3OtayQe9hDdv9ulrR5e.pVND.YktQW2iyIo.SF.wU8nKK','STUDENT',NULL,'2021-06-23 20:09:06','2021-06-24 02:50:41'),
(517,'janerosealbarracin0@gmail.com','JANE ROSE','ALBARRACIN','SARNO','FEMALE','NEW','2003-01-13','P-3 BONGABONG TANGUB CITY','09754751230','janerosealbarracin0@gmail.com','BSED-ENGL','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'Purok 3','2021-06-23 21:25:41','$2y$10$8J2P4MdbU0oypFR/PZZ.pOa2FvZHBorXNhp3y2IXpyDnhmZTLJhHy','STUDENT',NULL,'2021-06-23 20:09:58','2021-06-23 21:25:41'),
(518,'legendhax01@gmail.com','BASERA','JOHN CLOYD','ALBARICO','FEMALE','TRANSFEREE','2003-02-04','MOLAVE , ZAMBOANGA DEL SUR','09631313779','legendhax01@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Tarsing','2021-06-23 20:14:44','$2y$10$4uI4bOelDjQSaBIqvN9f1eHhPmNtR1cRa1brrcZt7Qn7E08R2HQS6','STUDENT',NULL,'2021-06-23 20:10:12','2021-06-23 20:14:44'),
(519,'jmlljay@gmail.com','ANO-OS','JOMELLE JAY','DIEZ','MALE','NEW','2003-06-17','LILO-AN BONIFACIO MISAMIS OCCIDENTAL','09776838312','diezjovelyn@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'P-1',NULL,'$2y$10$6LQ.VBRH.V/fniHGU6DluuD18O96t94W9Oft0iMTE388MXu8DxhpG','STUDENT',NULL,'2021-06-23 20:10:33','2021-06-23 20:10:33'),
(520,'Jhamaicadaniel111','DANIEL','JHAMAICA MAE','CABISAY','FEMALE','NEW','2003-03-03','DMDTMH','09489758271','jhamaicadaniel@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Noniluna',NULL,'$2y$10$JMwXq0NX5KGjvj.QcadomOdkHxaU6lS2vOi/0idw6PC89c6iemR8C','STUDENT',NULL,'2021-06-23 20:10:50','2021-06-23 20:10:50'),
(521,'jasminpodiotan25','PODIOTAN','JASMIN','CLARET','FEMALE','NEW','2002-09-25','ALORAN','09463875127','jasminpodiotan25@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Conat',25839,'Purok 6, Conat, Aloran,Misamis Occidental','2021-06-23 20:12:20','$2y$10$NirhSz.WXQXyqYoSgNjMcuYmFEiEnRO4iKmuT7JVPET6yVsCfW0Ea','STUDENT',NULL,'2021-06-23 20:11:34','2021-06-23 20:12:20'),
(522,'lumicayjohnalter@gmail.com','LUMICAY','JOHN ALTER','PARMISANA','MALE','NEW','2003-07-29','ZAMBOANGA','09465526948','lumicayjohnalter@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Macabayao',25998,'6','2021-06-23 20:16:42','$2y$10$CMyzEDymOtn7CHAKVls1fOXJ6HJXaManR/5zTp/JKFJkAVmBrQeuu','STUDENT',NULL,'2021-06-23 20:11:44','2021-06-23 20:16:42'),
(523,'Jovern Tomatao','TOMATAO','JOVEEN','SUAN','MALE','NEW','2002-01-31','PULOT OZAMIZ CITY','09383075335','joverntomatao@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Pulot',26132,'Purok 4','2021-06-23 20:12:37','$2y$10$Cd.eHfcoL85nUPjFfqGYWe80rNWr6eN/FcwB3H85QYYpcBl2vjX2u','STUDENT',NULL,'2021-06-23 20:11:44','2021-06-23 20:12:37'),
(524,'angelou','LADA','ANGELOU','BAJAO','MALE','NEW','2003-06-22','OZAMIZ CITY','09100043258','angeloulada461@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'Purok 6','2021-06-23 20:15:28','$2y$10$kIFuXE2YrKJpToQDxyE3I.2BwcdVx.B012z3aikv4SqRcmbnzNqYG','STUDENT',NULL,'2021-06-23 20:13:15','2021-06-23 20:15:28'),
(525,'Fat Reahana Ingoh','INGOH','FAT REAHANA','ALAMAG','FEMALE','NEW','2002-12-14','OZAMIS CITY','09512665626','reahanaingoh@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Purok Elena Mabini Street',NULL,'$2y$10$EI.TAECIDlhhOU9auyCVwOAKzdW4l2O72hDef28HVQBr8noFwZtzK','STUDENT',NULL,'2021-06-23 20:13:32','2021-06-23 20:13:32'),
(526,'divineelove12@gmail.com','ACQUIATAN','DIVINE LOVE','PINEDA','FEMALE','TRANSFEREE','2021-07-24','JIMENEZ MEDICARE COMMUNITY HOSPITAL','09383073187','divineelove12@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Jimenez','Butuay',25992,'Purok 5','2021-06-23 21:08:37','$2y$10$xmPEyg/vRePPDElboPGtlOEhIRGSUrT7QFo/8VOk0gbSxWwM2yakW','STUDENT',NULL,'2021-06-23 20:14:15','2021-06-23 21:08:37'),
(527,'Jhon123','TIERRA','JOHN CHRISTOPHER','PANDAN','MALE','NEW','2001-08-15','MIGCANAWAY TANGUB CITY','09639391523','jctierra1@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Prk. Maaba','2021-06-23 20:22:07','$2y$10$DXBrtQfOPSH4WteJ5PX.6e3x7rQglNWfJd91MTHw2v31Bn0DsP81u','STUDENT',NULL,'2021-06-23 20:14:18','2021-06-23 20:22:07'),
(528,'julietpatcho','PATCHO','JULIET','ALFECHE','FEMALE','NEW','2002-07-03','LANAO NORTE PROVINCIAL HOAPITAL','09061279649','juliet.patcho2002@gmail.com','AB POLSCI','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok 5','2021-06-23 20:17:21','$2y$10$ZOoMCJBcJASlyvgp0clgFOeXIBwtBiHqmNols.jcjTuXMOvNtqoJi','STUDENT',NULL,'2021-06-23 20:15:05','2021-06-23 20:17:21'),
(529,'09678400898','LAPINIG','ANGELINE','JOVERTO','FEMALE','NEW','2002-08-05','SAPA LUBOC AURORA ZAMBOANG DEL SUR','09678400898','angelinelapinig05@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Aurora','Sapa Loboc',40808,'Makugihon','2021-06-24 08:55:35','$2y$10$3CDMHcIJjrEw602SOApFG.5PhpGM3L8imDCrFOxj1NE4OksF4f2JG','STUDENT',NULL,'2021-06-23 20:15:29','2021-06-24 08:55:35'),
(530,'Zeazea','BAUTISTA','ROSEZEA CRISHA MAE','NELMIDA','FEMALE','NEW','2002-12-07','POBLACION TUBOD LANAO DEL NORTE','09055714020','zeazeabautista@gmail.com','BSED-ENGL','BSED-ENGL','BLENDED',NULL,'Lanao del Norte','Tubod','Poblacion',20272,'Purok 2 RCIS','2021-06-23 20:16:40','$2y$10$IV4.IEUVAbGGFDLxLg8WSuqCX3t8XVrJ4VDkXBBZHNmmpt9rVFLYK','STUDENT',NULL,'2021-06-23 20:16:05','2021-06-23 20:16:40'),
(531,'Geneviemamalias','MAMALIAS','GENEVIE','ABARQUEZ','FEMALE','NEW','2003-01-13','BOGO CAPALARAN MOLAVE ZAMBOANGA DEL SUR','09061219378','geneviemamalias1@gmail.com','BSED-FIL','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok Olive','2021-06-23 20:17:33','$2y$10$NwQXi926DHguGFlonor2v.62N576XtZmyK5G3JQ65Z3.bK/K3JfLu','STUDENT',NULL,'2021-06-23 20:16:27','2021-06-23 20:17:33'),
(532,'Concepcion','REMOCALDO','CONCEPCION','VILLANTES','FEMALE','NEW','2004-12-08','SM LAO HOSPITAL','09519392483','concepcionremocaldo8@gmail.com','BSED-ENGL','AB ENGLISH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Kinuman Sur',26120,'Purok 2-C','2021-06-23 20:21:54','$2y$10$dYaKdsuZU5Wj4ywGSeibgeZwm4F9cfKqGNEWCwHLd5MgUP0ScHEB.','STUDENT',NULL,'2021-06-23 20:17:19','2021-06-23 20:21:54'),
(533,'Almie.alix','ALIX','ALMIE JANE','PENTON','FEMALE','NEW','2001-05-24','SAPANG DALAGA MIS. OCC.','09562905127','090917miyang@gmail.com','BSED-ENGL','AB ENGLISH','BLENDED',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Purok 3','2021-06-23 20:18:16','$2y$10$b2IYJmtLUEHJFrS/hs0zt.QPVWzzAvSHh2ahWPZ6tTqtjHrSyegVi','STUDENT',NULL,'2021-06-23 20:17:28','2021-06-23 20:18:16'),
(534,'cindysismundo8@gmail.com','SISMUNDO','CINDY','BULAT-AG','FEMALE','NEW','2002-06-08','OZAMIS CITY','09512041426','cindysiamundo8@gmail.com','BSOA','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok Tarsing',NULL,'$2y$10$In12bZjXJb3UI75/gLQI/Oa3DQdTFBC9MFWyF1i7cYk.oRiGxOuCi','STUDENT',NULL,'2021-06-23 20:18:10','2021-06-23 20:18:10'),
(535,'Janluije123','ESPINOSA','JANLUIJE','RESPICIO','MALE','RETURNEE','2001-01-13','MHARSGEN RTTH','09510332663','janluijeespinosa@gmail.com','BSOA','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'Purok 1 Silanga Tangub city',NULL,'$2y$10$G6GFyCgnAroEJkCXdFlwfu0vgfLWbfe.jgU.4xckAoKslOc3Fkewu','STUDENT',NULL,'2021-06-23 20:18:11','2021-06-23 20:18:11'),
(536,'jerico','ALFECHE','JERICO','ZAMORA','MALE','NEW','2002-11-02','JIMENEZ','09510332407','jerico.alfeche12@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'purok-7',NULL,'$2y$10$oZSrYdiSCQ9p9zghsEokj.qaQOtHwKRymmTW.HgbOT3QZmsBThFV6','STUDENT',NULL,'2021-06-23 20:19:07','2021-06-23 20:19:07'),
(537,'deocamponorien@yahoo.com','DEOCAMPO','NORIEN','LINDAO','FEMALE','NEW','2003-03-10','OROQUIETA CITY','09515770599','deocamponorien45@yahoo.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Norte',26079,'Purok -4',NULL,'$2y$10$bVb4v4HQGbCoTKXcOQ0l5uLkU9srdplux3iFORR7ckEFeP8WxVzQO','STUDENT',NULL,'2021-06-23 20:19:31','2021-06-23 20:19:31'),
(538,'jenelyntecson341@gmail.com','TECSON','JENELYN','ALBO','FEMALE','NEW','2002-10-03','GARANG TANGUB CITY','09055424104','jenelyntecson341@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Garang',26252,'Purok-4','2021-06-23 20:30:43','$2y$10$zkSuyfKwUSCIf5cj/paMBeOorziaFDC40RL4y99VQEmc/fM3MSCli','STUDENT',NULL,'2021-06-23 20:20:26','2021-06-23 20:30:43'),
(539,'christinearabis8@gmail.com','ARABIS','CHRISTINE EDEL','GUILO','FEMALE','NEW','2000-08-04','BOCATOR TANGUB CITY','0966368493','christinearabis8@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bocator',26247,'Purok-6','2021-06-23 20:21:39','$2y$10$dP9WXidIyQr1FGVI3mUBw.BRkFvM8zI4m3VOnRwPmG/GgwJDhT/Jq','STUDENT',NULL,'2021-06-23 20:20:51','2021-06-23 20:21:39'),
(540,'lezbethlegara@gmail.com','LEGARA','LEZBETH','BOSMION','FEMALE','NEW','2003-03-23','MHARS GEN HOSPITAL OZAMIZ CITY','09105851452','lezbethlegara@gmail.com','BSOA','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Labinay',26121,'P-3','2021-06-23 20:23:13','$2y$10$NEYyajbONkHhnNUAYFqnVec4i68.Mcom.UOPuz1FXcDAAV8al2eXm','STUDENT',NULL,'2021-06-23 20:20:54','2021-06-23 20:23:13'),
(541,'Demple Eslit','ESLIT','DEMPLE','BACULINAO','FEMALE','RETURNEE','1994-06-27','ILIGAN CITY','09635608179','eslitdem@gmail.com','BSED-ENGL','AB ENGLISH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 6','2021-06-23 20:23:24','$2y$10$HCbv7qhS0idqnp7eIncbOuXnUvdbr/jE/1bMShj7HBoEPsNtPilx2','STUDENT',NULL,'2021-06-23 20:21:00','2021-06-23 20:23:24'),
(542,'Louigie123','JAMERO','LOUIGIE','CABEROS','MALE','NEW','2003-08-03','SICPAO,MAHAYAG,ZAMBO SUR','09126273914','louigiej@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Sicpao',41105,'4','2021-06-23 20:26:35','$2y$10$cq7as9rtNq/k5fJtmUO2VecYLjWjVFnQCWcXobiM9BYjfco0kFEHa','STUDENT',NULL,'2021-06-23 20:21:04','2021-06-23 20:26:35'),
(543,'charmanesandoval4@gmail.com','SANDOVAL','CHARMANE','CABUSAS','FEMALE','NEW','2002-10-28','GARANG, TANGUB CITY','09754953820','charmanesandoval4@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Garang',26252,'Purok-4','2021-06-23 20:29:18','$2y$10$jMDZJ6GjyStUQpHTxf.9zOjt45imLmjBd7swJQqMBdvDXnOiXW9Wm','STUDENT',NULL,'2021-06-23 20:21:09','2021-06-23 20:29:18'),
(544,'Rhearodriguez','RODRIGUEZ','RHEA GAY','ASTILLERO','FEMALE','NEW','2003-08-06','MHARSGEN','09954791132','rheya110@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Migpange',25903,'Purok 5',NULL,'$2y$10$ZyGkxeDiSJize0q9KwION.ktD1cEVaGQ6/nI.IoGGyqW8mE95C7Qm','STUDENT',NULL,'2021-06-23 20:21:51','2021-06-23 20:21:51'),
(545,'Queenejoie','NAQUINES','QUEENEJOIE','PIOJO','FEMALE','NEW','2002-02-25','PAGADIAN CITY','09518241923','queenejoienaquines@gmail.com','BSISM','BEED','FULL ONLINE',NULL,'Zamboanga del Sur','Aurora','Libertad',40794,'Purok Santo Niño','2021-06-23 20:22:30','$2y$10$.Iob71E5mohk9PznaKDSgOrkvdNrwdWfstyAfT3ZAflDKE5gbYDwG','STUDENT',NULL,'2021-06-23 20:21:57','2021-06-23 20:22:30'),
(546,'degorocrezil@gmail.com','DEGORO','CREZIL','VINZON','FEMALE','NEW','2002-06-28','SUDLON','09518006403','degorocrezil@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Domingo','2021-06-23 20:37:47','$2y$10$cp2EdFXoSD2I6iolHdpPUeOb7sZ9J/5H7fE534T45.9VFdCYDIbvG','STUDENT','jiNKBvtE54FU7tl28K41cCTpyivGSdNZAGrNmhAmlfyKNLCZsArpaRstQ3Lg','2021-06-23 20:22:05','2021-06-23 20:37:47'),
(547,'innalumbay','LUMBAY','INNA','MACARIAL','FEMALE','TRANSFEREE','1999-11-10','LALUD,DON VICTORIANO MISAMIS OCCIDENTAL','09469033801','lumbayinna@gmail.com','BSED-MAPEH','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Lalud',25983,'Purok 5','2021-06-23 20:23:51','$2y$10$rOAExyxTL9w0yOPZNTpJIO3Zx3ykZWajDu/FBitDl3vfZFzeu89PO','STUDENT',NULL,'2021-06-23 20:22:10','2021-06-23 20:23:51'),
(548,'johnlloyd','PEñA','JOHN LLOYD','','MALE','TRANSFEREE','2021-09-18','OZAMIS CITY','09673152891','johnpa445@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'6','2021-06-23 20:25:17','$2y$10$Ciu/x1vm.gCxZeychAuL3u813xju.t3U0YrQPSW.7d6aYWz1/jpJa','STUDENT',NULL,'2021-06-23 20:22:48','2021-06-23 20:25:17'),
(549,'Micah Jane Belano','BELANO','MICAH JANE','ENOJA','FEMALE','NEW','2003-01-29','COLUPAN BAJO','09639299274','micahjanebelano@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'Purok Sta. Cruz','2021-06-23 20:25:57','$2y$10$LccWbt6VstlBFo3kcL7dze5hEt/ush4KedqM6ERRXfDcDIAUU4kFC','STUDENT',NULL,'2021-06-23 20:22:57','2021-06-23 20:25:57'),
(550,'Julaicaleopoldo030@gmail.com','LEOPOLDO','JULAICA','SANIPA','FEMALE','NEW','2002-08-28','MHARGEN OZAMIZ CITY','09383164080','Julaicaleopoldo030@gmail.com','BSED-FIL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'Catadman Mangga',NULL,'$2y$10$kwjpLTa1VnwYf5njQsUqEeQjn5AKdFUkzTSPD3B3defnVHhrWrUuC','STUDENT',NULL,'2021-06-23 20:23:24','2021-06-23 20:23:24'),
(551,'clarelabadisos@yahoo.com','LABADISOS','REY-ANN CLARE','TAMULA','FEMALE','NEW','2003-02-28','MHARS GENERAL HOSPITAL, OZAMIS CITY','09460843049','clarelabadisos@yahoo.com','BSED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Clarin','Poblacion IV',25957,'Purok 5',NULL,'$2y$10$/dl0Li9sx5vphVyymVl0jeRdM/otxUHAySbqaTp41RPUnj3giHZ1C','STUDENT',NULL,'2021-06-23 20:24:36','2021-06-23 20:24:36'),
(552,'lambojonpaularmand48@gmail.com','LAMBOJON','PAUL ARMAND','RAMIREZ','MALE','NEW','2001-02-18','P-6 MIGPANGI, BONIFACIO, MISAMIS OCCIDENTAL','09300543655','lambojonpaularmand48@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Migpange',25903,'Purok 6','2021-06-23 20:25:38','$2y$10$CaOVpoDvjeCs/wfdhYimEuQieFwdOVLwalIoEZgjBBMVwYTvJ6Dsu','STUDENT',NULL,'2021-06-23 20:24:48','2021-06-23 20:25:38'),
(553,'jovamorecaliao','CALIAO','JOVA MORE','MACAHIDHID','FEMALE','NEW','2001-09-28','LOPEZ JAENA','09635595723','jovamorecaliao2001@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Conat',25839,'Purok 6, Conat, Aloran,Misamis Occidental','2021-06-23 20:27:22','$2y$10$0hn1XO25PJQKbSqyoEZE/.BtpzICbaa4INIaT.bVAOLG3.vIYBP0q','STUDENT',NULL,'2021-06-23 20:26:58','2021-06-23 20:27:22'),
(554,'Fredilyn E Flores','FLORES','FREDILYN','EBARIAL','FEMALE','NEW','2003-01-20','TUNGAWAN, ZAMBOANGA SIBUGAY','09271552407','fredilynlendi@gmail.com','BSOA','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Dimaluna',26110,'Purok - 6','2021-06-23 20:55:27','$2y$10$ayUhXGCuHElmgkRFgoPJUeyAn8MdEBICRc/g346yNjeEedfXtTbKS','STUDENT',NULL,'2021-06-23 20:27:22','2021-06-23 20:55:27'),
(555,'vieranthonycut@gmail.com','PUTOL','VIER ANTHONY','SUMAY','MALE','NEW','2001-12-04','MHARS GENERAL HOSPITAL','09776238582','vieranthonycut@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Maikay',26309,'3','2021-06-23 20:39:38','$2y$10$uORSbm.9ZVkOQTQXq5oyu.ktnGC0XiqU1f3KlYG1s5Vwcw8PZu2Za','STUDENT',NULL,'2021-06-23 20:28:08','2021-06-23 20:39:38'),
(556,'ebcaskarl@gmail.com','EBCAS','KARL','RONAMO','MALE','NEW','2021-09-13','BLANCIA HOSPITAL','09700803185','ebcaskarl@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok 2','2021-06-24 06:59:58','$2y$10$KQ2kBDdVSWJauYs1ybrb/ujgalZlwWBMMAKJ8NGhUcK3qVQMbpqBe','STUDENT',NULL,'2021-06-23 20:28:21','2021-06-24 06:59:58'),
(557,'Reahana Ingoh','INGOH','FAT REAHANA','ALAMAG','FEMALE','NEW','2002-12-14','OZAMIS CITY','09512665626','ingohreahana@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Purok Elena Mabini Street','2021-06-23 20:30:02','$2y$10$O/RKEDyix1hy.rCqZ7xWi.V0i98/mGjerQMrQLjqo1w15sIZog.Ze','STUDENT',NULL,'2021-06-23 20:28:22','2021-06-23 20:30:02'),
(558,'Jockielyn M. Montejo','MONTEJO','JOCKIELYN','MANISAN','FEMALE','NEW','2002-12-23','AURORA ZAMBOANGA DEL SUR','09264152248','jackielynmontejo34@gmail.com','BSED','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'P-7 bliss Lapasan','2021-06-23 20:36:07','$2y$10$E8B4QEBASplLfQBcyvkUkOgvTZgETg1Tiw/MlKsBSeqv7cdJ0QxUK','STUDENT','6C4drkA3azA80T35q7MeUuP9YIis9ir16AO5WNN9YHDTR4dq4RzNKmxkqjiE','2021-06-23 20:30:03','2021-06-23 22:09:09'),
(559,'Juvanie','AGALA','JUVANIE','DELOS REYES','MALE','NEW','2003-06-27','SENIOR, SAN PABLO, ZAMBOANGA DEL SUR','09972393868','j6272003@gmail.com','BSBA-MM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Balintawak',26094,'Purok 4','2021-06-23 20:30:54','$2y$10$Tf0xD37qDW.fbS6HUfHkBe9mzxWRs/.wiPu98zrdk6DtopdguG.ou','STUDENT',NULL,'2021-06-23 20:30:06','2021-06-23 20:30:54'),
(560,'Janica0821','CARREON','JANICA','OCAñA','FEMALE','NEW','2003-03-14','BULORON, MIDSALIP, ZAMBOANGA DEL SUR','09970753975','carreonjanica8@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Nuneluna','2021-06-23 20:30:37','$2y$10$58ravIqzr7RTLVZjKNjkx.VYhfZNHIpSXI/2Tq56qvsRyyqQKObrm','STUDENT',NULL,'2021-06-23 20:30:08','2021-06-23 20:30:37'),
(561,'jannyqt','ABING','JAN CLARO','ELNAS','MALE','NEW','2003-06-13','EASTERN LOOC PLARIDEL MISAMIS OCCIDENTAL','09104490936','janclaroabing25@gmail.com','AB COMM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Eastern Looc',26168,'Purok 1','2021-06-23 20:30:42','$2y$10$dgcNK9kHZTtyzKYsI.d3huANdMoyqWzK3./6SCJpYMfZAEWcU4AZ2','STUDENT',NULL,'2021-06-23 20:30:15','2021-06-23 20:30:42'),
(562,'Manilyn','LUMBAY','MANILYN','GUMICAL','FEMALE','TRANSFEREE','2000-08-11','DON VICTORIANO MISS. OCC.','09380006485','lumbaymanilyn@gmil.com','GEN  MID','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Lalud',25983,'Purok 5',NULL,'$2y$10$vuk5BHrP4JFYqoPPVzRD6OaCThg6oemo3m/PKTGkNTeV/dOUC7iPm','STUDENT',NULL,'2021-06-23 20:30:30','2021-06-23 20:30:30'),
(563,'danicapoloyapoy@gmail.com','POLOYAPOY','DANICA','','FEMALE','NEW','2002-11-26','MANILA','639489759421','danicapoloyapoy@gmail.com','BSBA-HRM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Dimalco',25895,'Purok 3','2021-06-23 20:31:43','$2y$10$6U8MpOvual4pW/4x2dejS.pGnXvjAKYWTDEnGrBXH2y.WCMCY1A76','STUDENT',NULL,'2021-06-23 20:30:54','2021-06-23 20:31:43'),
(564,'babyjanejasme23@gmail.com','JASME','BABY JANE','JUANICO','FEMALE','NEW','2002-04-23','MANLABAY DUMINGAG ZAMBOANGA DEL SUR','09515336010','babyjanejasme23@gmail.com','BSBA-MM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Dumingag','San Pablo',40957,'Purok golden shower','2021-06-23 20:33:08','$2y$10$iVxTCC5kvWoyG/O4ov6DCOepuCBOIdflpDs381yHimAFse74ookgu','STUDENT',NULL,'2021-06-23 20:31:40','2021-06-23 20:33:08'),
(565,'GMinguito','MINGUITO','GARRIEL','MABAO','MALE','NEW','2003-07-20','TIAMAN BONIFACIO MISAMIS OCCIDENTAL','09515385873','garrielminguito143@gmail.com','BSBA-MM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tiaman',25911,'2','2021-06-23 20:32:43','$2y$10$eG8B4m9TVNa5ghlzBIDjFe880gQJ5xTx/glUNlDnlSIG0Tbv/1vxi','STUDENT',NULL,'2021-06-23 20:32:05','2021-06-23 20:32:43'),
(566,'arcinokhaira@gmail.com','ARCINO','KHAIRA','FUEGO','FEMALE','NEW','2003-02-01','MHARSGEN','09217774751','arcinokhaira@gmail.com','BSED-ENGL','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Camanse',26219,'6','2021-06-23 20:42:58','$2y$10$astyorf4DeLZA6j3x5C3I.4GJaE0l1lrjaxDfzTvUVv26c2QzXaJu','STUDENT',NULL,'2021-06-23 20:32:19','2021-06-23 20:42:58'),
(567,'maratamae2002@gmail.com','MARATA','RHEA MAE','PEPITO','FEMALE','TRANSFEREE','2002-06-02','PANAGAAN MAHAYAG ZAMBOANGA DEL SUR','09317536535','maratamae2002@gmail.com','GEN  MID','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Lalud',25983,'purok 7','2021-06-23 20:34:27','$2y$10$1s7X0v5oA4esqXr4wt95muDr9iE0y3Xpqo0QapN5AbywO0w64q7Qq','STUDENT',NULL,'2021-06-23 20:32:31','2021-06-23 20:34:27'),
(568,'Erica Recamadas','RECAMADAS','ERICA','ABADIES','FEMALE','NEW','2001-06-16','SAN JOSE, MAHAYAH, ZAMBOANGA DEL SUR','09516313364','ericarecamadas62@gmail.com','GEN  MID','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African Daisy 1','2021-06-23 20:33:41','$2y$10$L.ukRATaU1Un15HDH2C.zeg9YbtHjk7BmtJZZianj/OgHWEFs8cO.','STUDENT',NULL,'2021-06-23 20:32:32','2021-06-23 20:33:41'),
(569,'egiehatague88@gmail.com','HATAGUE','EGIE','CONTRIDAS','MALE','NEW','2002-11-11','JIMENEZ','09102919000','egiehatague88@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok 5-B','2021-06-23 20:34:12','$2y$10$aAVBa.XgjO35MtWrcGg4cuAfu5/HzPDpwR0bHWK/PSjmVKRZr69Fm','STUDENT',NULL,'2021-06-23 20:32:37','2021-06-23 20:34:12'),
(570,'marisolabrinica81@gmail.com','ABRINICA','MARISOL','SUMALPONG','FEMALE','NEW','2001-07-08','LOPEZ JAENA','09167659745','marisolabrinica@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Lopez Jaena','Eastern Poblacion',26023,'Purok 6',NULL,'$2y$10$w1PYZ16cwgVWWmAwTNKWQOLnNaU3p8uiK7EUjkV9ZWW4qV9fjZGf2','STUDENT',NULL,'2021-06-23 20:32:58','2021-06-23 20:32:58'),
(571,'Angelo B. Oplado','OPLADO','ANGELO','BELANO','MALE','NEW','2002-09-19','CEBU','09513030786','belano73@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'Purok Sta Cruz','2021-06-23 20:33:31','$2y$10$5OcgIajFU62SUEIIfa8nVuV3Ut/782ZlsqzGOiOVF5aDnkLHlmelG','STUDENT',NULL,'2021-06-23 20:33:00','2021-06-23 20:33:31'),
(572,'Cristal_Sarcina','SARCINA','CRISTAL MAE','BALURAN','FEMALE','NEW','2002-08-02','ILIGAN CITY','09482252742','Cristalmaebs@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Boniao',41084,'Purok 5','2021-06-23 20:35:19','$2y$10$7D4lm8xQE8NjpJHX7HKN5Oo8f1x31iGkEo7xEqpMgeKwbudlLj7ZS','STUDENT',NULL,'2021-06-23 20:33:18','2021-06-23 20:35:19'),
(573,'Marcmamac','MAMAC','MARC','ALBERCA','MALE','NEW','2002-11-21','DOñA MARIA D TAN HOSPITAL','+639159063829','marc112102@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok 2','2021-06-23 20:33:57','$2y$10$yrVdXIJZ1A6udNBSR4fFqefF7s/Z8W7MW6AHVX2HeJnx9vJul1l42','STUDENT',NULL,'2021-06-23 20:33:26','2021-06-23 20:33:57'),
(574,'dacolchristine@gmail.com','CONINGCO','CHRISTINE','DACOL','FEMALE','NEW','2002-12-22','JIMENEZ, MISAMIS OCCIDENTAL','09468950169','dacolchristine@gmail.com','BEED','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok 2B',NULL,'$2y$10$wAiVAzPSTWw9fjxl8run0eyeeua/Im9yaKHD5QmO64nOYWTL4TKvm','STUDENT',NULL,'2021-06-23 20:33:37','2021-06-23 20:33:37'),
(575,'kissmithalturas@gmail.com','PATULADA','KISSMITH','ALTORAS','FEMALE','TRANSFEREE','2003-08-05','MAQUILAO, TANGUB CITY','09187132767','kissmithalturas@gmail.com','BSED-MATH','BEED','BLENDED',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok-5','2021-06-23 20:35:22','$2y$10$p3cEfVNw9itUaX00jeiBpePnQssJRLoztzQnC/9g8Z23p/rkLEfNa','STUDENT',NULL,'2021-06-23 20:33:45','2021-06-23 20:35:22'),
(576,'Knorrcubes@yahoo.com','DEOCAMPO','NORIEN','LINDAO','FEMALE','NEW','2003-03-10','OROQUIETA CITY','09515770599','noriendeocampo45@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Norte',26079,'Purok-4','2021-06-23 20:38:41','$2y$10$GQITtWH.e6NPRzvmh6meheCwvL07VO7CXedWDrippBWx1nmSlRftu','STUDENT',NULL,'2021-06-23 20:33:59','2021-06-23 20:38:41'),
(577,'Mary Joy','YAP','MARY JOY','DABALOS','FEMALE','NEW','2003-07-17','OZAMIS','09639812319','maryyap2003@gmail.com','GEN  MID','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Guillien St.','2021-06-23 20:37:41','$2y$10$Ia1YgLfg91MdeJk1viqPkeSYNj256f.XO//05w.xoqEac8Z.7uvoS','STUDENT',NULL,'2021-06-23 20:34:16','2021-06-23 20:37:41'),
(578,'Reyno dumam-ag','DUMAM-AG','REYNO','YBANEZ','MALE','NEW','2021-10-20','MOPH','09157330651','broreyno_20@yahoo.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'Purok 6,taboc sur',NULL,'$2y$10$jW8GIhWufdHP70hjSleMdex0S5mfOhtVINkF7GJyqXqgvK/AiZxS.','STUDENT',NULL,'2021-06-23 20:34:37','2021-06-23 20:34:37'),
(579,'jorgiagabriellejavier','JAVIER','JORGIA GABRIELLE','','FEMALE','NEW','2001-03-03','OZAMIZ CITY','09461764679','jorgiagabriellejavier@gmail.com','BSBA-MM','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'Purok 3','2021-06-23 20:35:19','$2y$10$LpcrG0YlPLXRKIpE3/5gJui6o7tZgA0zsZmJ//EVNEs45SiAYoj3y','STUDENT',NULL,'2021-06-23 20:34:38','2021-06-23 20:35:19'),
(580,'Sahul','SAHUL','YHEMAFE','SUMAYLO','FEMALE','NEW','2003-02-11','CALOLOT,TAMBULIG ZDS','09162307235','yhemafes@gmail.com','BS CRIM','BSED-MATH','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 1','2021-06-23 20:59:09','$2y$10$Bfky.PpRzF8j6rQjI1UBPO21JbDPCGEJm14mWrENZqDyWHnGrinv2','STUDENT',NULL,'2021-06-23 20:34:57','2021-06-23 20:59:09'),
(581,'ricalumangca12','LUMANGCA','RICA','LARANO','FEMALE','NEW','2021-08-06','GUINGONA OZAMIZ CITY','09078729292','ricalumangca93@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Guingona',26118,'3',NULL,'$2y$10$RCTxZim8J.C2MbYF3a4beOGkuIcDuWEjd3MBk4ksvu5R1mke/vebS','STUDENT',NULL,'2021-06-23 20:35:16','2021-06-23 20:35:16'),
(582,'renel123','CARREON','RENEL','MONTECINO','MALE','NEW','2000-07-20','BULORON MIDSALIP ZAMBOANGA DEL SUR','09389676999','renelcarreo@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Prk. Maaba','2021-06-23 20:36:26','$2y$10$MGivaWnzms7j43BIIffbUe6a4e9tp7N66x0jtlaE7nn5wC4GKQvCa','STUDENT',NULL,'2021-06-23 20:35:23','2021-06-23 20:36:26'),
(583,'RJ','TACDER','REMON JAY','ZOSOBRADO','MALE','NEW','2002-07-15','PUROK6','09070744709','Remonjayt@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Pisa-An',25905,'Purok6','2021-06-23 20:39:30','$2y$10$LEWmC/WR8/h.PaKwlXF7vOgpnMGUBng/y7ozvt7PVu4EHM4Gxyc2i','STUDENT',NULL,'2021-06-23 20:35:36','2021-06-23 20:39:30'),
(584,'Mark Estopia','ESTOPIA','MARK','SEMINO','MALE','NEW','2002-11-21','CLARIN, MISAMIS OCCIDENTAL','09563397441','estopiamark02@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'PUROK 8','2021-06-23 21:29:07','$2y$10$3ajE5Me8CIUqDeyyndK47Op6INQrgiCt1JQqdgp7ZsQFjhG5lfCZ2','STUDENT',NULL,'2021-06-23 20:35:42','2021-06-23 21:29:07'),
(585,'Lai','SUDE','KAREN LAIZA','PATA','FEMALE','NEW','2002-10-25','POBLACION TUBOD LANAO DEL NORTE','09979928598','laizanggg@gmail.com','BSED-MAPEH','BSED','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Poblacion',20272,'Purok 2 RCIS POBLACION TUBOD LDN',NULL,'$2y$10$2ez6P0v/Ek3SspBT43a1vu4TOwhAkHs/6ZjVpZu.IvIrIO7Gc1Rw6','STUDENT',NULL,'2021-06-23 20:35:43','2021-06-23 20:35:43'),
(586,'Jimar070','TANO','JIMAR JR.','MEIR','MALE','RETURNEE','1999-07-10','MHARSGEN','09503422542','jimartano7@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Tangub City','Capalaran',26250,'P3',NULL,'$2y$10$McSGGp9unh9KShQH3YU7C.3oX7xeFYBQjxx8QbQkPW4dbrtj1FnbG','STUDENT',NULL,'2021-06-23 20:36:18','2021-06-23 20:36:18'),
(587,'Lovely Edullantes','EDULLANTES','LOVELY','BACALING','FEMALE','NEW','2003-03-15','STA.CRUZ TANGUB CITY','09613693280','lovely.edullantes@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'Purok-3','2021-06-23 20:39:10','$2y$10$WizkxCW/mqzWXfEL0m.BquQB02b97N3gUg2uyTUDelRnsQV9Km.Ly','STUDENT',NULL,'2021-06-23 20:36:51','2021-06-23 20:39:10'),
(588,'gezel','SUMAYLO','GEZEL JEE','SEGUALAN','FEMALE','TRANSFEREE','2001-05-03','SAN AGUSTIN, TRECE MARTIRES CITY, CAVITE','09757894742','ggtanyag311@gmail.com','AB POLSCI','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Panalsalan',26271,'Purok 1 Baybay','2021-06-23 23:36:36','$2y$10$bm87eYCCT58/BOo11DGI9.lvrAJ.P6ygRRG9krqJ7ldeJFSXseTOK','STUDENT',NULL,'2021-06-23 20:39:44','2021-06-23 23:36:36'),
(589,'Sylviaarong@gmail.com','ARONG','SYLVIA','CAGORO','FEMALE','NEW','2021-06-23','ILIGAN','09505887481','Sylviaarong@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Lower Dimalinao',41172,'Gemilina',NULL,'$2y$10$PvCPiBAHH5Z8ZFrldTw.je.kJriLZeiconIr3C5TZ2Dbr8YmTYEJe','STUDENT',NULL,'2021-06-23 20:40:18','2021-06-23 20:40:18'),
(590,'Joshua','PITOGO','JOSHUA','CELESTIAN','MALE','NEW','2003-08-03','MANILA','09388361914','pitogoj13@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Clarin','Mialen',25951,'Purok 1','2021-06-23 21:33:26','$2y$10$xvkKTsvVuB46HNe0Izq13.cz7njLOlhjOmKRwUtJIZwOyUGBLs0Va','STUDENT',NULL,'2021-06-23 20:40:20','2021-06-23 21:33:26'),
(591,'Markdavecarbonilla00002@gmail. Com','FABRIGA','RUEL JEAN','ALESNA','MALE','NEW','2003-05-22','UPPER TIPARAK TAMBULIG ZAMBOANGA DEL SUR','09511093074','markdavecarbonilla00002@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok 1 mangga','2021-06-23 20:43:20','$2y$10$D.B2Po/ZVJWxPFkkPiU6S.cuMVR3UvzbZGPGDvNv1k5Hvk8ozoFkK','STUDENT',NULL,'2021-06-23 20:40:50','2021-06-23 20:43:20'),
(592,'JakeHylas53','ABASOLO','KRISTIAN JADE','CESPON','MALE','NEW','2002-08-21','GANGO OZAMIZ CITY','09103102164','abasolokristian@gmail.com','BS CRIM','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'Purok 7','2021-06-23 21:22:58','$2y$10$snDF3mAqWZVZ/fl4kWuhPOLvI8iFGKom4loyZ6qC7t4FO5pEzgmVm','STUDENT',NULL,'2021-06-23 20:41:12','2021-06-23 21:22:58'),
(593,'jacobcalunsag','CALUNSAG','JACOB','BERGADO','MALE','NEW','2001-11-04','DIMALCO, BONIFACIO, MISAMIS OCCIDENTAL','09078770913','calunsagjacob@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Dimalco',25895,'Purok 5','2021-06-23 20:44:04','$2y$10$19VkHnSF3kc03hsP2XJ0M.qVWla8XkYvSlAzaQAdyHuOLtOy9/HOS','STUDENT',NULL,'2021-06-23 20:41:47','2021-06-23 20:44:04'),
(594,'Dychel Mae Dela Torre','DELA TORRE','DYCHEL MAE','CABRIANA','FEMALE','NEW','2002-11-18','BARANGAY 6, TANGUB CITY','09519448312','dycheldmae@gmail.com','BSED-ENGL','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay VI - Lower P',26244,'Purok 3',NULL,'$2y$10$WWbVT1lYBE8PW3B8mjClpeps25Ae9qoIQnCzdBCnBdzRIYAOGr/Va','STUDENT',NULL,'2021-06-23 20:42:39','2021-06-23 20:42:39'),
(595,'analynbernido1@gmail.com','BERNIDO','ANALYN','BAGUIO','FEMALE','NEW','2002-11-21','STO.NIñO TUKURAN ZAMBOANGA DEL SUR','09557604338','analynbernido1@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Maikay',26309,'Purok 3','2021-06-23 20:46:13','$2y$10$onv65jsAv70b/oEcX2YhyuFKvqc9wvt2iej3SBO1BTSwnYeHl8Q2K','STUDENT',NULL,'2021-06-23 20:42:44','2021-06-23 20:46:13'),
(596,'Jhunmarklucas1.gmail.com','LUCAS','JHUN MARK','RAFOLS','MALE','NEW','2002-03-17','CAMANUCAN,PANAON,MISAMIS,OCCIDENTAL','09381461553','Jhunmarklucas1.gm@il.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Panaon','Camanucan',26143,'1',NULL,'$2y$10$1b08rDIuyk6Gx3mdj8.tw.vmnGMgpW9LgnncGfDpI2Ev3vFjO92OC','STUDENT',NULL,'2021-06-23 20:42:57','2021-06-23 20:42:57'),
(597,'maedethafaithfuentes@gmail.com','FUENTES','MA. EDETHA FAITH','CALUNOD','FEMALE','NEW','2002-03-09','FAITH HOSPITAL, OZAMIS CITY','09384010379','maedethafaithfuentes@gmail.com','AB COMM','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Migpange',25903,'Purok 6','2021-06-23 20:45:30','$2y$10$ZJcO/xodPuzNbDJ26.Qt1.0IRV0wKrV/yOKk60kfM/Xf.Yd.SomI2','STUDENT','5z8rt3uTkqlFPvmT0N33Bk8L6KKISsgiBYyaqtI9ZSv9ZUpFw4dKYbxdORJD','2021-06-23 20:43:08','2021-06-23 20:45:30'),
(598,'irigomaryrose@gmail.com','IRIGO','MARY ROSE','','FEMALE','NEW','2003-05-12','LAS PIñAS DISTRICT HOSPITAL','09122268292','irigomaryrose@gmail.com','BSBA-HRM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'1','2021-06-23 20:50:21','$2y$10$k1wRwPafGy5sUYykJqKfU.EajNkTT3iRLi/nnIXancLLMOwL7S8Ay','STUDENT',NULL,'2021-06-23 20:44:04','2021-06-23 20:50:21'),
(599,'Manilyn11','LUMBAY','MANILYN','GUMICAL','FEMALE','TRANSFEREE','2000-08-11','DON VICTORIANO MISS. OCC.','09265353523','lumbaymanilyn@gmail.com','GEN  MID','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Lalud',25983,'Purok 5','2021-06-23 20:44:44','$2y$10$J9JGHttmA/dCfrtwn2Xxke9oakLgXTrfaC1l/pqfRpRfBkuZfINeu','STUDENT',NULL,'2021-06-23 20:44:09','2021-06-23 20:44:44'),
(600,'Chriza Mae T. Lapiz','LAPIZ','CHRIZA MAE','TUASTOMBAN','FEMALE','NEW','2002-12-21','LITAPAN OZAMIZ CITY','09673147719','Chrizamaelapiz2@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Litapan',26125,'P-3','2021-06-23 21:07:03','$2y$10$o6F.HJjcfpX3f8FLwx/guOJ5PQGtXhiGJDoLmX/SOwUt1uWr8J2vy','STUDENT',NULL,'2021-06-23 20:44:10','2021-06-23 21:07:03'),
(601,'JcB.','BUENO','JOHN CARLO','CANTORNE','MALE','NEW','2003-05-29','LOURMAH,MAHAYAG,Z,D,S','09631480682','buenocarlo77@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Lourmah',41090,'Purok7','2021-06-23 22:15:33','$2y$10$j23R8tyV4JT2laGDJkQI6OyZVC/g3GdMUHofM3NqVZGp3uxuDufH.','STUDENT','QulcrGZ8oXJcRNeTtvxIvn7TPlRge6O6ij6zdRZQy5rqQtszePqyBOByPJYt','2021-06-23 20:44:41','2021-06-23 22:15:33'),
(602,'Derfla nitcimo','OMICTIN','AFREDO','DINAWANAO','MALE','RETURNEE','2001-01-07','DUMINGAG ZAM. SUR.','09519399173','alfredomictin55@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Bucayan',40926,'PUROK 2',NULL,'$2y$10$L29V163mdtREt5.7QtB/Je91FNE.FqwRPvjg8IprqEYrDIAz1yjcq','STUDENT',NULL,'2021-06-23 20:44:42','2021-06-23 20:44:42'),
(603,'Anthunc@gmail.com','CANONEO','ANTHUN MARK','CURAMBAO','MALE','NEW','2002-01-06','OZAMIZ CITY','09264154157','anthunc@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Nabuna',25856,'P-2 nabuna',NULL,'$2y$10$A.WmxU69QGwyLeWcHise.OEyjzdJyWfnv.XF5f9W.TNQ9Dm1bBQN.','STUDENT',NULL,'2021-06-23 20:45:02','2021-06-23 20:45:02'),
(604,'kianmarkbauya@gmail.com','BAUYA','KIAN MARK','PANUNCIALMAN','MALE','NEW','2002-07-14','DIGSON','09971238270','kianmarkbauya@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Dimalco',25895,'Purok 4','2021-06-23 20:47:26','$2y$10$jeiQnJMRCQzI16W3f/FOAefzQY.u5t4B2f14J2sW0IPfKvroAGXIK','STUDENT',NULL,'2021-06-23 20:45:14','2021-06-23 20:47:26'),
(605,'jericoalfeche12@gmail.com','ALFECHE','JERICO','ZAMORA','MALE','NEW','2002-11-02','JIMENEZ','09510332407','jericoalfeche12@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'purok 7',NULL,'$2y$10$TbgmbUJ.9X1RM912RFwzW.YK/rSCgyGl/2WG6w5HSSOKojxsH5eJm','STUDENT',NULL,'2021-06-23 20:45:16','2021-06-23 20:45:16'),
(606,'clarelabadisos28@gmail.com','LABADISOS','REY-ANN CLARE','TAMULA','FEMALE','NEW','2003-02-28','MHARS GENERAL HOSPITAL, OZAMIS CITY','09460843049','clarelabadisos28@gmail.com','BSED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Clarin','Poblacion IV',25957,'Purok 5','2021-06-23 21:08:45','$2y$10$Ais/WzEPTofxavqVcdvfk.2djLePpE9CuTunZpI4ky7GfsgEP7RsG','STUDENT',NULL,'2021-06-23 20:45:34','2021-06-23 21:08:45'),
(607,'Jhamaica123','DANIEL','JHAMAICA MAE','CABISAY','FEMALE','NEW','2003-03-03','DMDTMH','09489758271','jhamaicadaniel8@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Prk. Noneluna','2021-06-23 20:48:02','$2y$10$/U5O4U7vCUmhPWnTVekLEOz7NEu67pqMiR/1pddpwfHMZn9Zy1M8i','STUDENT',NULL,'2021-06-23 20:46:44','2021-06-23 20:48:02'),
(608,'Mary Joy A. Tanes','TANES','MARY JOY','ALBIOS','FEMALE','NEW','2001-08-27','AURORA GENERAL HOSPITAL','09362158105','maryjoytanes@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Ramon Magsaysay','Katipunan',41266,'PUROK 1B','2021-06-24 08:32:12','$2y$10$JRCRKgbU.5N9K/ntSiyRdO7rnUnEWl/0sYTrS/mQlIOgTTw94LmtO','STUDENT',NULL,'2021-06-23 20:48:10','2021-06-24 08:32:12'),
(609,'Jayrence alcuizar','ALCUIZAR','JAYRENCE','SANJORJO','MALE','NEW','2003-08-14','OZAMIS CITY','09052169070','Jayrencealcuizar@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Bocator',26247,'Tangub city','2021-06-23 20:49:02','$2y$10$VxsJRfJcHpP.0ZDcMNS4POXsQ0zdA7uhcZ/s2XMq6sjHAOPP9XWku','STUDENT',NULL,'2021-06-23 20:48:30','2021-06-23 20:49:02'),
(610,'karlzetans1975@gmail.com','EBCAS','KARL','RONAMO','MALE','NEW','2003-09-13','BLANCIA HOSPITAL','09700803185','karlzetans1975@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok2',NULL,'$2y$10$6YR4nPSMQgPA5Tk4IO74oehr.8Zif76wzCNuDAoSCKdY4c.ObR/uq','STUDENT',NULL,'2021-06-23 20:48:58','2021-06-23 20:48:58'),
(611,'CJ Patria','PATRIA','CJ','BUGAS','MALE','NEW','2003-04-07','SINACABAN MISAMIS OCCIDENTAL','09454656736','cjpatria222@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Sinacaban','Libertad Bajo',26226,'Purok Casoy 2 Libertad Bajo','2021-06-23 21:00:40','$2y$10$2Dy95NvQlEz6dkPSND.u0OsyiS2gQOUMW/ob/FTkcxxnbRPV9rcyO','STUDENT',NULL,'2021-06-23 20:49:08','2021-06-23 21:00:40'),
(612,'Dychel Mae C. Dela Torre','DELA TORRE','DYCHEL MAE','CABRIANA','FEMALE','NEW','2002-11-18','BARANGAY 6, TANGUB CITY','09519448312','dychelmaed@gmail.com','BSED-ENGL','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay VI - Lower P',26244,'Purok 3','2021-06-23 20:51:34','$2y$10$qhqdxDM7x82xoA2.EPO4ieobPG4E5.7tH6VQfZQrA0hRmr8j5XDGi','STUDENT',NULL,'2021-06-23 20:49:27','2021-06-23 20:51:34'),
(613,'johnmarv185@gmail.com','MAGLINTE','JOHN MARV','DAHUNAN','MALE','NEW','2002-08-03','MOLICAY, OZAMIZ CITY, MISAMIS OCCIDENTAL','09632425692','johnmarv185@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Pulot',26132,'Purok 2','2021-06-23 20:50:39','$2y$10$0POLidreqXV0uWOLqO9vkOJ2REX824jgNavAdmCv4FsNdQnQvHBBO','STUDENT',NULL,'2021-06-23 20:49:46','2021-06-23 20:50:39'),
(614,'stefaniegracemaluto@gmail.com','MALUTO','STEFANIE GRACE','OLINARES','FEMALE','NEW','2003-03-26','P-1 BONGBONG OZAMIZ CITY','09102829006','stefaniegracemaluto@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'Purok-1','2021-06-23 20:50:31','$2y$10$LZyIO.mVAkDeTjqQ.h2MHOJ5HsL5mucILXfBYI1tzh36ElWtXcaAO','STUDENT',NULL,'2021-06-23 20:49:55','2021-06-23 20:50:31'),
(615,'09157330651','DUMAM-AG','REYNO','YBANEZ','MALE','NEW','2021-10-20','MOPH','09157330651','09157330651@yahoo.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'Purok 6,taboc sur',NULL,'$2y$10$QGXpFTj/Xz6Wvs1J5S7BtO7Hy8WRzs3gWjMgs5OHZM1hyIHwTJK6y','STUDENT',NULL,'2021-06-23 20:50:04','2021-06-23 20:50:04'),
(616,'Daisy Mae','BABAYRAN','DAISY MAE','','FEMALE','NEW','2002-12-10','SEGATIC DAKU CLARIN MIS. OCC.','09121844212','daisymaebabz@gmail.com','BEED','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Clarin','Segatic Daku',25959,'Purok 5','2021-06-23 20:54:26','$2y$10$Rv20sPbwhjDX2uiCZ62SC.sA4AO2Wu8oHvE3V0DV1k9O6/i39wjP2','STUDENT',NULL,'2021-06-23 20:50:29','2021-06-23 20:54:26'),
(617,'jemuelbugas808@gmail.com','BUGAS','JEMUEL','SUERTE','MALE','NEW','2003-03-04','MAHAYAG ZAMBOANGA DEL SUR','09481258566','jemuelbugas808@gmail.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Guripan',41087,'Purok6','2021-06-23 20:53:58','$2y$10$NFPWeLqKdAKl8jk1du3n9ebAYLSAYfFIYVMrufPdTybqBKlYDqP6y','STUDENT',NULL,'2021-06-23 20:50:45','2021-06-23 20:53:58'),
(618,'Talmaebs','SARCINA','CRISTAL MAE','BALURAN','FEMALE','NEW','2002-08-02','ILIGAN CITY','09482252742','Lieutenantcristal@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Boniao',41084,'Purok 5','2021-06-23 20:51:34','$2y$10$1263kP70NviUsV8kZZWKxeaYP5tLomBDHLhUtKziVDYqBovH9wSye','STUDENT',NULL,'2021-06-23 20:51:13','2021-06-23 20:51:34'),
(619,'April Jay','PERMANO','APRIL JAY','CABUGUAS','FEMALE','TRANSFEREE','2003-04-15','P-5 MANAKA OZAMIZ CITY','09519403626','apriljaypermano99@gmail.com','BSED-FIL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Manaka',26127,'P-5 Manaka','2021-06-23 21:22:40','$2y$10$0BVKsU.yOwrlhnO1hfNGmuV/KIdeb.FTqtSIkDqPnkaYn.z5LFB6C','STUDENT',NULL,'2021-06-23 20:51:31','2021-06-23 21:22:40'),
(620,'jerico20','ALFECHE','JERICO','ZAMORA','MALE','NEW','2002-11-02','JIMENEZ','09510332407','jericoalfeche@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok-7','2021-06-23 20:52:23','$2y$10$MFLWJ/3QM5bqk7fWfPwRUO5pVDUv3IJd0owK4VyK.S/b5axeHZfie','STUDENT',NULL,'2021-06-23 20:51:51','2021-06-23 20:52:23'),
(621,'AL_Ali','ALIGATO','ALMA FE','','FEMALE','NEW','2003-01-08','BONIFACIO MISAMIS OCCIDENTAL','09076442182','sparkmafe@gmail.com','BSBA-HRM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 1','2021-06-23 20:55:25','$2y$10$hCXBwdYOsOLJhH.cBFDEJuwdTPv4CwI9zRZ.KF/.NyJe2CF3/Ag.q','STUDENT',NULL,'2021-06-23 20:51:59','2021-06-23 20:55:25'),
(622,'JENNY NELMIDA','NELMIDA','JENNY','ESPEJA','FEMALE','NEW','2003-06-20','BACOLOD CITY NEGROS OCCIDENTAL','09758801917','jennynelmida.15@gmail.com','AB POLSCI','BSBA-HRM','FULL ONLINE',NULL,'Lanao del Norte','Magsaysay','Daan Campo',19987,'purok 3','2021-06-23 20:53:46','$2y$10$UBXzikJdV0s3M7Lw3U3AHeDZggRcUPzWIh6Pm/SAMkUcYh5ovfUey','STUDENT',NULL,'2021-06-23 20:52:33','2021-06-23 20:53:46'),
(623,'joshua03','PITOGO','JOSHUA','CELESTIAN','MALE','NEW','2003-08-03','MANILA','09388361914','joshua.morgun@yahoo.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Clarin','Mialen',25951,'Purok1',NULL,'$2y$10$EIqf84JKVltgQdDP3uQI/uuyf00cSPVswxFv3CBA6wchYrHJHBa.C','STUDENT',NULL,'2021-06-23 20:53:05','2021-06-23 20:53:05'),
(624,'Elmie','SARSABA','ELMIE MAR','TOME','MALE','NEW','2002-12-07','REMEDIOS BONIFACIO MISAMIS OCCIDENTAL','O9639478840','luzmindaabella1@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Remedios',25907,'P2','2021-06-23 20:53:27','$2y$10$aN/7H2KVGdh37oghdj87TO.TzWs1bWHXDQDIxCEGRHlf54.9KxBv2','STUDENT',NULL,'2021-06-23 20:53:10','2021-06-23 20:53:27'),
(625,'niñostephenlapiz','LAPIZ','NIñO STEPHEN','CAñETE','MALE','NEW','2021-11-19','CABANGLASAN, BUKIDNON','09305787411','ninyolapiz8@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Litapan',26125,'P-4',NULL,'$2y$10$3B.JeOqQ3GY/sEGHrgXFKedn9vxDH3vx3EX7yiGwztQFJbas61gYG','STUDENT',NULL,'2021-06-23 20:53:24','2021-06-23 20:53:24'),
(626,'harby_sinarillios','SINARILLOS','HARBY','CAMUS','MALE','NEW','2001-07-22','BONIAO MAHAYAG ZAMBOANGA DEL SUR','09614904628','harbysinarillios@gmail.com','BSCS','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Boniao',41084,'Purok 7 Boniao Mahayag Zamboanga Del Sur','2021-06-23 20:54:16','$2y$10$/Lz.UKZbridlWaIcFyUNsuAAqo4GFsCYKQofmh2nZ2CHcBjj3YXme','STUDENT',NULL,'2021-06-23 20:53:28','2021-06-23 20:54:16'),
(627,'RosbethMorandante','MORANDANTE','ROSEBETH','SEMINE','FEMALE','NEW','2003-05-24','BAñADERO OZAMIZ CITY','09505254374','bethrose094@gmail.com','BSED-MATH','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'P1A','2021-06-23 21:00:39','$2y$10$0Lu1sl2tHtk4YmfzvMDEGeIRcW5d7vRuHbOIHY7Jz4Kvduy1ENW8.','STUDENT','lEByHM6xYyB0wjOmiqUxdRF1ZAZmi9mL2xNeprZrbN0q0zjQ8NikdL3Mb12z','2021-06-23 20:53:35','2021-06-23 21:28:03'),
(628,'Harchie Khyrl Tagaro','TAGARO','HARCHIE KHYRL','ALCOSEBA','FEMALE','NEW','2003-01-30','POBLACION BONIFACIO MISAMIS OCCIDENTAL','09382787632','harchiekhyrlt@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'Purok 5','2021-06-23 21:01:58','$2y$10$gFOIvWW/4SI/AE8hhe5Ez.Ji16hhglaJkaWzEP9uJMjx/IYGTXGkW','STUDENT',NULL,'2021-06-23 20:53:49','2021-06-23 21:01:58'),
(629,'Rogelen','DONTAR','ROGELEN','BUCOG','FEMALE','NEW','2021-06-27','DOMALINAO ZAMBOANGA DEL SUR','09518007543','dontarrogelenbb@gmail.com','BSISM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'Purok 7','2021-06-23 20:54:37','$2y$10$XpgtYJF7xn7gOyyMQqzo9u6yBW4vXGyb/DFvXr0cimdkXl3.FjbAW','STUDENT',NULL,'2021-06-23 20:53:49','2021-06-23 20:54:37'),
(630,'edusmajaspersem@gmail.com','EDUSMA','JASPER SEM','RODRIGUEZ','MALE','NEW','2021-12-15','MUNICIPALITY OF TUDELA','09261834469','edusmajaspersem@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','San Nicolas',26316,'Purok 1',NULL,'$2y$10$wZpCbVEwRqU0k8RjWioL1eCF3QGGj3tJtP/QgBEdUAA92o/yGDAzm','STUDENT',NULL,'2021-06-23 20:54:52','2021-06-23 20:54:52'),
(631,'Marcaljun020219','RESUELLO','MARC ALJUN','BARREDO','MALE','TRANSFEREE','2003-05-05','PASIG CITY','09305915671','marcaljunresuello@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Lala','Darumawang Ilaya',19955,'Purok9','2021-06-23 21:01:22','$2y$10$qVS/3zGWxmdRSVlcydvoheE1VHkbKyNQogo8Bqst2F2.6QiiWNvsC','STUDENT',NULL,'2021-06-23 20:56:05','2021-06-23 21:01:22'),
(632,'Claire Saquin','SAQUIN','CLAIRE','TABURADA','FEMALE','NEW','2002-11-22','DOñA MARIA D. TAN HOSPITAL','09517924104','clairesaquin@gmail.com','GEN  MID','BSCS','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok 4','2021-06-23 20:57:54','$2y$10$VEYEhY9sTTJli0iRnkhWz.uckaIgtXucfl7pMO8KL1gK1Z3/rpvYu','STUDENT',NULL,'2021-06-23 20:56:11','2021-06-23 20:57:54'),
(633,'japaykentmark@gmail.com','JAPAY','KENT MARK','OGAPAY','MALE','NEW','2002-04-21','MAIKAY TUDELA MIS. OCC.','09530413242','japaykentmark@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Maikay',26309,'3','2021-06-23 20:57:11','$2y$10$O.0s/Y.xXazNoKzSfgXm3OpSO6U82sM.lsaFXkwuLH6d5EZIckuYS','STUDENT',NULL,'2021-06-23 20:56:35','2021-06-23 20:57:11'),
(634,'Kristel Jade A. Largo','LARGO','KRISTEL JADE','ANG-UG','FEMALE','NEW','2003-04-30','LITAPAN OZAMIZ CITY','09107748197','largokristeljade@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Litapan',26125,'Purok 5 Litapan Ozamiz City','2021-06-23 21:07:18','$2y$10$Q3ce0FnEE.Cd1S0br6DheewLi46X3BB.Y3LBRa9PoyMMv1.Znx9nC','STUDENT',NULL,'2021-06-23 20:57:40','2021-06-23 21:07:18'),
(635,'DEXTER','EGOS','DEXTER','ANGHAG','MALE','NEW','2002-08-14','LOWER SALUG DAKU MAHAYAG ZAMBOANGA DEL SUR','09162951879','egosdexter@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Lower Salug Daku',41091,'Purok 1 libra','2021-06-23 20:59:16','$2y$10$L0LyCc1kfjUZpMgXvrvvJOYHHJMdHGQCA05aCjNlMx.cEwM.l/zSu','STUDENT',NULL,'2021-06-23 20:58:09','2021-06-23 20:59:16'),
(636,'Gwyneth Geralde','GERALDE','GWYNETH','MAABA','FEMALE','NEW','2003-09-09','DOñA MARIA D. TAN MEMORIAL HOSPITAL','09072140601','gwyniseu26@gmail.com','BSED-ENGL','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purple 3','2021-06-23 22:46:34','$2y$10$f2GaTtRNwt5SM77h8BG7SO8bUPUdGLz1zcVIWyC8WdFEEhkMrgZL2','STUDENT',NULL,'2021-06-23 20:58:34','2021-06-23 22:46:34'),
(637,'geovannas@gmail.com','PITOGO','GEOVANNAS','HASIM','FEMALE','NEW','2003-08-08','OZAMIS CITY','09102916315','geovannas@gmail.com','GEN  MID','BEED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Demetrio Fernan',25893,'Purok 3',NULL,'$2y$10$Wcu88mDM.bYjojBAOcHOJOAX8iUmbiWzCxeoxYPyDhlLojJemSJhy','STUDENT',NULL,'2021-06-23 20:59:31','2021-06-23 20:59:31'),
(638,'daphnesabongan@gmail.con','SABONGAN','DAPHNE','MERCADO','FEMALE','NEW','2002-09-09','PARAISO, MAHAYAG, ZAMBOANGA DEL SUR','09107406035','daphnesabongan@gmail.com','BSED-FIL','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok 1','2021-06-23 21:15:30','$2y$10$6di69EVaumXgTYumpjcDFeuzGvMuXoqaEagTdTQRKDKdj.MDwGh5O','STUDENT','s1MHAJ5kMstmmeFYBvFEThxnMZF3fspHZKqGMiyuyD5imRRaUqODmatum8Zf','2021-06-23 20:59:48','2021-06-23 21:15:30'),
(639,'Maricarmalalis@yahoo.com','LIANTADA','MARICAR','LIANTADA','FEMALE','NEW','2003-09-03','LORENZO TAN, TANGUB CITY','09303165898','maricarmalalis@yahoo.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok-5',NULL,'$2y$10$D8gduXPHl52M3X4kciJF/uNXaWQYjDEvyXeZNC74wjXw9na468Fju','STUDENT',NULL,'2021-06-23 20:59:49','2021-06-23 20:59:49'),
(640,'Jerson Evidientes','EVIDIENTES','JERSON','VALDEZ','MALE','NEW','2001-12-30','AQUINO TANGUB CITY','09380018871','evidientesjerson16@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Aquino',26235,'Purok1','2021-06-24 07:49:18','$2y$10$twkwSf6EA74oKh7rsbbDYOvqXfA6A0h/YG2hNxi1q9OtqS6O1Qdfy','STUDENT',NULL,'2021-06-23 21:00:46','2021-06-24 07:49:18'),
(641,'Kthln Mljy','ESTILLOSO','KATHLEEN MILJOIY','ABASTAS','FEMALE','NEW','2003-08-02','OZAMIS CITY','09952393847','estillosok@gmail.com','BSBA-MM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Lily','2021-06-23 21:02:06','$2y$10$8PBIpwIUbXJtUFViy3Vd1OuOgZgIN56hHNxaePMhgjVdIOrJaWk3u','STUDENT',NULL,'2021-06-23 21:01:21','2021-06-23 21:02:06'),
(642,'montealtojericho03@gmail.com','MONTEALTO','JERICHO','MACALITONG','MALE','NEW','2001-06-03','MALIBANGCAO,CLARIN MIS. OCC.','09516530708','montealtojericho03@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Clarin','Malibangcao',25949,'Purok 3','2021-06-23 21:06:57','$2y$10$/lTuQC4LFbTl48fv4AqceeOkI8pIdbf7QXB8iBQtUytwTZY/3T8aq','STUDENT',NULL,'2021-06-23 21:01:56','2021-06-23 21:06:57'),
(643,'Jenmermagallnesegas','EGAS','JENMER','MAGALLANES','MALE','NEW','2021-11-12','LINCONAN','09673044332','jenmeregas@gmial.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Linconan',25899,'Purok 1',NULL,'$2y$10$795wO5pmqv1rV3H.C2ZgW.X6SwR13ClIeOF28rONHbXHzFw0yILA6','STUDENT',NULL,'2021-06-23 21:03:52','2021-06-23 21:03:52'),
(644,'Ianie L. Lubguban','LUBGUBAN','IANIE','LANGGAM','FEMALE','NEW','2002-07-20','BRGY. CANIANGAN RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09078744191','ianielubguban008@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Caniangan',41261,'Purok 2 Daisy','2021-06-23 21:08:06','$2y$10$vbIXvIG7T7KKtmG0IyHNE.DLjJCidC.dU6.JU6VQh5tmx4jS.kHum','STUDENT',NULL,'2021-06-23 21:04:12','2021-06-23 21:08:06'),
(645,'princessannvillalon','VILLALON','PRINCESS ANN','CUARESMA','FEMALE','NEW','2002-11-22','BAYBAY MANTIC, T. C.','09773507912','princessannvillalon@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Tangub City','San Vicente',26277,'Purok 1','2021-06-23 21:13:22','$2y$10$pX6ayKQxmruRFxFhCeuEAeA.bDn6VWsE24LyiDdctjLhtbKSrc4Ea','STUDENT',NULL,'2021-06-23 21:04:38','2021-06-23 21:13:22'),
(646,'ricalumangca5','LUMANGCA','RICA','LARANO','FEMALE','NEW','2001-08-06','GUINGONA OZAMIZ CITY','09078729292','erldioso0@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Guingona',26118,'3',NULL,'$2y$10$QXJbf0v/kxTEg9bEOw84SOXEB72M7E5xAYFVhsCbz0RYRF75e3ZRC','STUDENT',NULL,'2021-06-23 21:04:48','2021-06-23 21:04:48'),
(647,'Cherrielyn Lesondra','LESONDRA','CHERRIELYN','EGBOS','FEMALE','NEW','2002-02-01','OZAMIZ CITY','09105509995','lesondracheng@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Baybay Santa Cruz',26097,'1','2021-06-23 21:06:36','$2y$10$T5ayCVRGe8LK1ySXyn7i2.Cf1wda3W57nknC22LhCIJkxzvfiCOz6','STUDENT',NULL,'2021-06-23 21:05:36','2021-06-23 21:06:36'),
(648,'Joseph larry miano','MIANO','JOSEPH LARRY','ENOC','MALE','NEW','2002-12-10','OZAMIS CITY','09152450466','josephlarrymiano@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tusik',25912,'Penascio ,purok 3','2021-06-23 21:17:05','$2y$10$81cEA2uSacCsR9NQN2M4Ou44/ALmwEdOlv4uAK3OjU5wDHdv7Owum','STUDENT',NULL,'2021-06-23 21:06:14','2021-06-23 21:17:05'),
(649,'Jackmanlegro3@gmail.com','MANLEGRO','JACK','LLANTO','MALE','NEW','2001-08-13','LOWER CAMPO4 RAMON MAGSAYSAY ZAMBONGA DEL SUR ZAMBONGA DEL SUR','09489489798','jackmanlegro3@gamail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Mabini street',NULL,'$2y$10$/KkRS3hnAt3zDeaxiNdV7eyPZ6rGJredFAAcUKlaa/FdEh5BGppMC','STUDENT',NULL,'2021-06-23 21:06:17','2021-06-23 21:06:17'),
(650,'Jeane Lou','LIMBAGO','JEANE LOU','BUYSER','FEMALE','NEW','2002-12-01','SEGATIC DIOT, CLARIN, MISAMIS OCCIDENTAL','09506636151','JeaneLouLimbago00@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Clarin','Segatic Diot',25960,'5','2021-06-23 21:08:12','$2y$10$Y1LmRiUt2za2gYl1tNdWzeaIdzlTddfg7g43lPk/GJguieDhu/NVC','STUDENT',NULL,'2021-06-23 21:06:26','2021-06-23 21:08:12'),
(651,'Curambao@gmail.com','CANONEO','ANTHUN MARK','CURAMBAO','MALE','NEW','2002-01-06','OZAMIZ CITY','09264154157','curambao@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Nabuna',25856,'P-2 nabuna',NULL,'$2y$10$60XgXy6lINdb/nEPYIwha.OS/h/Qx2OL.RhNOMiIGWJ9JIQTROX/O','STUDENT',NULL,'2021-06-23 21:06:29','2021-06-23 21:06:29'),
(652,'pretzcelestian@gmail.com','CELESTIAN','PRET\'Z NICEL','SARAJENA','FEMALE','NEW','2002-11-10','CALOLOT HEALTH CENTER','09305277095','pretzcelestian@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Zamboanga del Sur','Tambulig','San Jose',41384,'Purok 4','2021-06-23 21:07:57','$2y$10$0b2MWnsq4mCcoYvujyOxleBTUucu/xcyTvzodkvWHvDg69CyKII9S','STUDENT',NULL,'2021-06-23 21:06:35','2021-06-23 21:07:57'),
(653,'CRISTY TAYROS','TAYROS','CRISTY','HENTERONE','FEMALE','NEW','2003-03-18','TANGUB CITY, MISAMIS OCCIDENTAL','09639393587','chentayroscristy@gmail.com','BSBA-MM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'Purok 3','2021-06-23 21:30:55','$2y$10$zO7Ok2bfFpWOoLJWIS.5de7zXjfwRM/1aUJ3AOgMqTPyUapLp1qq6','STUDENT',NULL,'2021-06-23 21:07:49','2021-06-23 21:30:55'),
(654,'maryjune.mortez','MORTEZ','MARYJUNE','BATION','FEMALE','NEW','2003-06-27','SM LAO, OZAMIZ CITY','09097595726','maryjune.mortez101@gmail.com','BSOA','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'P-6B','2021-06-23 21:12:01','$2y$10$fQ.59jN.cC52f3KCT4fMdOoDg7RjfMeKYBMAyYBAnzxo3qvlBLdaC','STUDENT',NULL,'2021-06-23 21:07:51','2021-06-23 21:12:01'),
(655,'arafejumawan221@gmail.com','JUMAWAN','ARA FE','A.','FEMALE','NEW','2003-02-21','SILANGA P2 TANGUB CITY','09639217256','arafejumawan221@gmail.com','AB ENGLISH','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'PUROK 2','2021-06-23 21:13:43','$2y$10$rAU/5jvpL5Ie2jScf6YK/eCEmv/kRmz3nvvmEjK3x4fcJB3qr8IMK','STUDENT',NULL,'2021-06-23 21:09:19','2021-06-23 21:13:43'),
(656,'Kensuke','BAGCAT','KENNETH','BETONIO','MALE','NEW','2003-01-03','OZAMIZ CITY','09661609985','izunabagcat@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Pulot',26132,'2','2021-06-23 21:10:56','$2y$10$IS4LYR96tZguIfO9GynHHOVvzZ9qNawTaKHnhZF1uqtLvNLeB7q.6','STUDENT',NULL,'2021-06-23 21:09:25','2021-06-23 21:10:56'),
(657,'Marilis612','MARQUITA','MARILIS','TABLON','FEMALE','RETURNEE','1996-06-12','JIMENEZ, MISAMIS OCCIDENTAL','09054902556','marilismarquita612@gmail.com','BEED','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Jimenez','Mialem',26002,'Purok-2','2021-06-23 21:15:56','$2y$10$7OnsaS59NwOqvhyXhGyiBuDoNSfHfWwJ4gvL7GQm55V1TUVBF8DkK','STUDENT',NULL,'2021-06-23 21:09:46','2021-06-23 21:15:56'),
(658,'RudmerAndrew','BALUNDO','RUDMER ANDREW','RUPINTA','MALE','NEW','2003-11-10','OZAMIS CITY','09776239760','rrbalundo@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Aguada',26091,'P-5',NULL,'$2y$10$4Qb.bMRxA3YID/RPmMGEi.Xn9oYIUyP8VIpmNFV5S9ukl.I1NI9Z2','STUDENT',NULL,'2021-06-23 21:09:54','2021-06-23 21:09:54'),
(659,'khryzl.rhy@gmail.com','TACANG','KHRYZL RHY','TOMPONG','FEMALE','NEW','2003-02-25','SAN PEDRO, DUMINGAG, ZAMBOANGGA DEL SUR','09700810095','khryzl.rhy@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Dumingag','Calumanggi',40927,'Purok 2','2021-06-23 21:13:46','$2y$10$jz2sYJfOaTfAZ4iiFRtA1usziqoQbdR5LSwKndSPvYjE5Dve8n.W2','STUDENT',NULL,'2021-06-23 21:10:14','2021-06-23 21:13:46'),
(660,'jenjen','HERBANO','JESSICA','MUTIA','FEMALE','NEW','2000-07-25','SILANGA TANGUB CITY','09482035215','Jessicaherbano034@gmail.com','BSOA','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'Purok 2','2021-06-23 21:11:17','$2y$10$r3pVc6MV/otk6Ui6TvCFfOXwqPDZ92M5RlhC/NA2RXexd5Z5HS7.q','STUDENT',NULL,'2021-06-23 21:10:20','2021-06-23 21:11:17'),
(661,'jovitdoisapuay','SAPUAY','JOVIT DOI MARZEUS','BAHIAN','MALE','NEW','2002-03-18','LAPERIAN TUKURAN ZAMBOANGA DEL SUR','09066633976','jovitdoi123@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tukuran','Laperian',41416,'Purok 1-B',NULL,'$2y$10$ClOu/yAoGv1ZPueJrQoyEOr0qhiduOVz3MQpSdZEXrh4mIfx0olL2','STUDENT',NULL,'2021-06-23 21:11:11','2021-06-23 21:11:11'),
(662,'Hermai','ARCAMO','HERMAI','PANTUHAN','FEMALE','NEW','2021-05-20','DIMALCO BONIFACIO MISS OCC','0975 495 4913','hermaiarcamo20@gmail.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Dimalco',25895,'Purok 3 dimalco',NULL,'$2y$10$MQSszdrFlzrTqBFDXXSGjO1AfoYxDVjaAFGldkGjy31Lxn7VBf0HG','STUDENT',NULL,'2021-06-23 21:11:35','2021-06-23 21:11:35'),
(663,'alferezjemaica@gmail.com','ALFEREZ','JEMAICA','CUAJOTOR','FEMALE','NEW','2001-12-01','PALILI MIDSALIP ZAMBOANGA DEL SUR','09617986568','alferezjemaica@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Midsalip','Palili',41150,'P-1','2021-06-23 21:24:18','$2y$10$.esSj2gaGiUB1sBfDgp5UejsfE5/6CjNCMn6J4umiq5lXcS28ZGWC','STUDENT',NULL,'2021-06-23 21:12:00','2021-06-23 21:24:18'),
(664,'curambaogulbe462@gmail.com','GULBE','GERALDINE','CURAMBAO','FEMALE','NEW','2003-02-15','PALILI, MIDSALIP, ZAMBOANGA DEL SUR','09515718462','curambaogulbe462@gmail.com','GEN  MID','BSED-MAPEH','FULL ONLINE',NULL,'Zamboanga del Sur','Midsalip','Palili',41150,'Purok 1','2021-06-23 21:15:10','$2y$10$YqoA5GtXf8Y0ZomsCyBhYOgOq2J7lT3KlsYEkFiAXfOBkAwK53W/2','STUDENT',NULL,'2021-06-23 21:12:05','2021-06-23 21:15:10'),
(665,'Broreyno_20@yahoo.com','DUMAM-AG','REYNO','YBANEZ','MALE','NEW','2021-10-20','MOPH','09388358769','09157330651@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'Purok 6,taboc sur',NULL,'$2y$10$yEDQqoYX/w2I6k2BhkvfFOIhhqpK7hoert6noq4wbbV.Zugn0U1tG','STUDENT',NULL,'2021-06-23 21:12:50','2021-06-23 21:12:50'),
(666,'tayrosirish23@gmail.com','TAYROS','LRISH MAE','HENTERONE','FEMALE','NEW','2021-09-30','BONGABONG TANGUB CITY','09466537699','tayrosirish23@gmail.com','GEN  MID','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'PUROK 3','2021-06-23 21:22:48','$2y$10$AgGCr7dcdf2AvqWCh39q1uQlDJkvbS.Lb4dHkcxSr/7Rh2Df7ulb6','STUDENT',NULL,'2021-06-23 21:12:58','2021-06-23 21:22:48'),
(667,'jarioroseljr@gmail.com','JARIO','ROSEL','MAPUTI','MALE','NEW','2003-04-21','LILOAN BONIFACIO MISAMIS OCCIDENTAL','09532732846','jarioroseljr@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'Purok 6, Abaga','2021-06-23 21:32:51','$2y$10$9ZNqlnakrAbWiPTNa1oBSOWQs.RHKEmFN9bEkZ3nT6zMOgpjALyE.','STUDENT',NULL,'2021-06-23 21:13:32','2021-06-23 21:32:51'),
(668,'Lailai','SUDE','KAREN LAIZA','PATA','FEMALE','NEW','2002-10-25','POBLACION TUBOD LANAO DEL NORTE','09979928598','nokaren655@gmail.com','BSED','BSED-MAPEH','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Poblacion',20272,'Purok 2 RCIS POBLACION TUBOD LDN',NULL,'$2y$10$gcA/Zc3IcRpBD8SDy0hNHeEwJs/zLf9KmMwPInk1gWbYzN5NEUwnG','STUDENT',NULL,'2021-06-23 21:14:45','2021-06-23 21:14:45'),
(669,'Janica B. Same','SAME','JANICA','BUOC','FEMALE','NEW','2003-01-16','CAMPU V RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09514682052','perlasame63@gmail.com','BSED-ENGL','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok-4',NULL,'$2y$10$p1MzRPVkELql6Kz1PlRlJ.e0f3gnvmlpjKnvh/eQmxZXaR4ByfP0.','STUDENT',NULL,'2021-06-23 21:15:30','2021-06-23 21:15:30'),
(670,'Annalie','DULA','ANNALIE','AMBA','FEMALE','NEW','2000-05-26','PUROK 7, POBLACION 3, CLARIN MISAMIS OCCIDENTAL','09078769919','annaliedula26@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'Purok Hinagdanan','2021-06-23 21:21:06','$2y$10$rXeOgFtBt7excqJcl6oB3expQIJ8qzpxBzqstY9Yplualz9xO0SkK','STUDENT',NULL,'2021-06-23 21:15:47','2021-06-23 21:21:06'),
(671,'Wiliampelayojr','PELAYO','WILLIAM JR.','MAMALIAS','MALE','NEW','2002-12-09','BOGO CAPALARAN MOLAVE ZAMBOANGA DEL SUR','09305025727','williampelayo6@gmail.com','BS CRIM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Olive','2021-06-23 21:18:13','$2y$10$pr7dyUQXUEqB6t2OUZCNIOIqxc/EbHOVfG7/SiJwRcjX83NdzjrNe','STUDENT',NULL,'2021-06-23 21:16:42','2021-06-23 21:18:13'),
(672,'julaicaleopoldo7@gmail.com','LEOPOLDO','JULAICA','SANIPA','FEMALE','NEW','2002-08-28','MHARGEN OZAMIZ CITY','09383164080','julaicaleopoldo7@gmail.com','BSED-FIL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'Catadman Mangga','2021-06-23 21:19:34','$2y$10$bZaGkC2YKczz1ykupG3b0ONkTXJdtxgYrnpy6IpcShO0oJxF3AtoS','STUDENT',NULL,'2021-06-23 21:17:01','2021-06-23 21:19:34'),
(673,'deasismayirene','DE ASIS','MAY IRENE','BATON','FEMALE','NEW','2001-08-01','BALATACAN, TANGUB CITY','09466034015','deasismayiren@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Balatacan',26236,'Purok Humayan',NULL,'$2y$10$Wcn6taW50S14Z5bmDmtRAuTlOB5ZXyb8mk3zEBRw.LhqVEBn7d6n2','STUDENT',NULL,'2021-06-23 21:17:02','2021-06-23 21:17:02'),
(674,'Arielizarusiana','RUSIANA','ARIELIZA','SEVILLA','FEMALE','NEW','2001-09-21','POBLACION LEON B. POSTIGO ZAMBOANGA DEL NORTE','09501869285','ruscianaa@gmail.com','BSED','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Makuguihon',41176,'Pinya Guillen st','2021-06-23 21:23:31','$2y$10$/DenoNReR4KqLAgy7/cPVeBdUXAeGYmOlIlOQGA006LxCL67aaxCC','STUDENT',NULL,'2021-06-23 21:17:35','2021-06-23 21:23:31'),
(675,'Marvencedric.baldo','BALDO','MARVEN CEDRIC','ABBU','MALE','NEW','2002-07-03','TUDELA MUNICIPAL HOSPITAL','09567527224','marvencedricb@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','San Nicolas',26316,'P-2 San Nicolas','2021-06-23 21:23:04','$2y$10$Y/cvUQDLY5iM8r/fMv/2AOSnsdc8DGcBG17WFVhnS8r1gddJqzVtK','STUDENT',NULL,'2021-06-23 21:18:27','2021-06-23 21:23:04'),
(676,'jovitdoisapuay18','SAPUAY','JOVIT DOI MARZEUS','BAHIAN','MALE','NEW','2002-03-18','LAPERIAN TUKURAN ZAMBOANGA DELSUR','09066633976','jovitdoi18@gmail.com','BSCS','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tukuran','Laperian',41416,'Purok 1-B','2021-06-23 21:19:01','$2y$10$j8aGHqGxKeLdaYETTnJwVuPDxJU1f7R./hlOfL0mvx.YD.ukG7Qt6','STUDENT',NULL,'2021-06-23 21:18:45','2021-06-23 21:19:01'),
(677,'reynodumamag@gmail.com','DUMAM-AG','REYNO','YBANEZ','MALE','NEW','2021-10-20','MOPH','09157330651','Dumamagreyno@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Taboc Sur',26080,'Purok 6, taboc sur',NULL,'$2y$10$jEZx8WQh2b488VplcFN4Ke9HPtSigH/alIZE0SAPBdNI/ou/ZCKj6','STUDENT',NULL,'2021-06-23 21:19:16','2021-06-23 21:19:16'),
(678,'Lessamieibaya123@gmail.com','IBAYA','LESSAMIE','CONSIGO','FEMALE','TRANSFEREE','2004-11-03','DARUMAWANG BUCANA LALA LANAO DEL NORTE','09352561090','lessamieibaya123@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Lanao del Norte','Lala','Darumawang Bucana',19954,'Purok-6','2021-06-23 21:53:54','$2y$10$.7ccUTxrekQCS2uAs33Ot.NSX9lSiC7wGFSMoMOZlYoaFvsL6d0FO','STUDENT',NULL,'2021-06-23 21:19:46','2021-06-23 21:53:54'),
(679,'jeamayagma01','MAYAGMA','JEA','AGAN','FEMALE','NEW','2003-04-02','REBOKON DUMALINAO ZAMBOANGA DEL SUR','09090787279','jeamayagma693@gmail.com','BSCS','BSED-FIL','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'Purok 5','2021-06-23 21:33:08','$2y$10$buw7Jk9iNsSEER.GJk.M..2GsYJfPW455bwPXAQtGOU4wqeExj8KS','STUDENT',NULL,'2021-06-23 21:20:30','2021-06-23 21:33:08'),
(680,'salomonmaryann123@gmail.com','SALOMON','MARY ANN','','FEMALE','NEW','2002-09-09','SUMIRAP, TANGUB CITY','09551833522','salomonmaryann@gmail.com','BSED-MATH','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Baybay',25888,'Purok 2',NULL,'$2y$10$xIHB1qtC8M5txlMpWvX.ieEiK5IlSfc6EubyuprvS6r/9L3ZUV0Z.','STUDENT',NULL,'2021-06-23 21:20:50','2021-06-23 21:20:50'),
(681,'Honey','ABUGATAL','HONEY MAE','LUMINGKIT','FEMALE','NEW','2003-02-10','MANGA, TANGUB CITY','09757160851','honeymae.abugatal@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'Purok 5',NULL,'$2y$10$z8nsCdmawA8JGBPU7o9Qy.mPdcsKgUnAyU048Uw2rfpGETF9GCeVG','STUDENT',NULL,'2021-06-23 21:20:56','2021-06-23 21:20:56'),
(682,'Edu','FUERTES','EDU','CALME','MALE','NEW','2002-07-10','COLUPAN BAJO SINACABAN, MISAMIS OCCIDENTAL','09465472464','edufuertes0.1@gmail.com','BSED-ENGL','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Colupan Bajo',26221,'Purok Sampaguita','2021-06-23 21:22:30','$2y$10$IqdINReC32YeFJhnNH8k8Oy/6pQKWEiTelWCOMthfrX8kOSYq0zMe','STUDENT',NULL,'2021-06-23 21:21:42','2021-06-23 21:22:30'),
(683,'Elvin Jade Simbajon','SIMBAJON','ELVIN JADE','CALAGO','MALE','NEW','2001-09-12','ROSARIO, CAVITE','09618187462','simbajonelvinjade@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Calolot',41367,'3','2021-06-23 21:23:18','$2y$10$6bKvdMo/NP0EKZ0SBW./Yu5xnsOiyHL5/NSQqNYjiNEm0qr8dlwT.','STUDENT',NULL,'2021-06-23 21:22:29','2021-06-23 21:23:18'),
(684,'Gryshia','LOBGOBAN','GRYSHIA','ALQUIZOLA','FEMALE','NEW','2003-07-03','CASILAK SAN AGUSTIN TUDELA MISAMIS OCCIDENTAL','+639639226814','agryshia@gmail.co','AB POLSCI','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Casilak San Agustin',26301,'Purok 1',NULL,'$2y$10$lyP4AlvP/FoQ4kvO582SB.5pRmis14nAg4uu25IhZpDcTUYBODFqW','STUDENT',NULL,'2021-06-23 21:22:30','2021-06-23 21:22:30'),
(685,'Mary Joy Villegas','VILLEGAS','MARY JOY','MAYORDO','FEMALE','NEW','2002-12-25','BANGLAY,TANGUB CITY','09460246068','villegasmaryjoy56@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Banglay',26238,'Purok-7, Banglay Tangub City','2021-06-24 08:07:09','$2y$10$95WG1NsBOzjU8cNvBtg5behw/Ub3ffeucc7pomKfh.A/E3SFpJLwW','STUDENT',NULL,'2021-06-23 21:23:29','2021-06-24 08:07:09'),
(686,'princesscagatan23@gmail.com','CAGATAN','PRINCESS','MAGADAN','FEMALE','NEW','2003-09-23','BOLINSONG BONIFACIO MISAMIS OCCIDENTAL','09632361411','princesscagatan23@gmail.com','BS CRIM','BSED','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Pisa-An',25905,'Purok 5',NULL,'$2y$10$74wtB06wtHHcyjN/HQzNWOtUT.o/fqKQFQnpSvJ8PTUmKi8CoHwtG','STUDENT',NULL,'2021-06-23 21:24:30','2021-06-23 21:24:30'),
(687,'trexielagas8@gmail.com','LAGAS','TREXIE','NINANG','FEMALE','NEW','2002-08-18','PUROK 1 BASIRANG TUDELA MIS.OCC','09097770534','trexielagas8@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Tudela','Basirang',26292,'PUROK 1',NULL,'$2y$10$K24zxCW.TFXakM6QgM0sb.e2KeBagn9zd5RsQm6D6fJ8S7hYPqQcS','STUDENT',NULL,'2021-06-23 21:24:34','2021-06-23 21:24:34'),
(688,'alma27mancao@gmail.com','MANCAO','ALMALYN','TAHOY','FEMALE','NEW','2000-10-07','OZAMIZ CITY','09506223699','alma27mancao@gmail.com','BSED-FIL','GEN  MID','BLENDED',NULL,'Misamis Occidental','Ozamis City','Kinuman Norte',26119,'1','2021-06-23 21:26:51','$2y$10$yTgN.bm9cGhSiQvRgoga1uGQw8YW5BwbD80jPROR6MH.3oVdvIZDi','STUDENT',NULL,'2021-06-23 21:24:40','2021-06-23 21:26:51'),
(689,'Cristinerosel03','GONZALES','CRISTINE ROSEL','NAMOC','FEMALE','NEW','2003-09-03','CULO, MOLAVE ZAMBOANGA DEL SUR','09632858874','gonzalescristine72@gmail.com','AB COMM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok New Society 2','2021-06-24 11:27:21','$2y$10$syv6v2T6P8gYzyP3j01gM.tzIM0qupDhwsZ1IDeB9y5jpxDn2QMbO','STUDENT',NULL,'2021-06-23 21:24:46','2021-06-24 11:27:21'),
(690,'Jepherson Granada','GRANADA','JEPHERSON','','MALE','NEW','2002-12-16','TAGWANAO, ALORAN MISAMIS OCCIDENTAL','09276187841','jephersongranada16@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Calube',25836,'Purok1','2021-06-23 21:25:13','$2y$10$v.pavVR/ZxAMaFCyaNzwluuRJnTlvcimUzrJ78JyOlDFYY0E6nt6e','STUDENT',NULL,'2021-06-23 21:24:47','2021-06-23 21:25:13'),
(691,'Jhasmin Santander','SANTANDER','JHASMIN','RAMAYRAT','FEMALE','NEW','2003-09-06','MANINGCOL OZAMIZ CITY','09619081466','santankyle@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bacolod',26092,'Purok Rizal',NULL,'$2y$10$uuLZDeMeXwPoKSRV7sWPxe.jrqqJxG/nnEZBk6FO6Q9FL8JWivfW6','STUDENT',NULL,'2021-06-23 21:25:38','2021-06-23 21:25:38'),
(692,'bagkat15eloisa@gmail.com','BAGKAT','ELOISA','MACAN','FEMALE','NEW','2003-06-15','CENTRU NAPU, TUDELA, MISAMIS OCCIDENTAL','09383023981','bagkat15eloisa@gmail.com','BSED-ENGL','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Lampasan',25984,'Purok 1 Mangga',NULL,'$2y$10$FWYd1EVueXd9MCofVOT85esZA9TmeuEPb0e6L9gkFYPu9Mgm46XHG','STUDENT',NULL,'2021-06-23 21:25:55','2021-06-23 21:25:55'),
(693,'Cauntonganyasher@gmail.com','CAUNTONGAN','YASHER','MACABANGON','MALE','NEW','2002-08-11','RIVERSIDE KOLAMBUGAN LANAO DEL NORTE','09639598492','Macabangonyasher@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Kolambugan','Riverside',19942,'Prk4 Riverside Kolambugan Lanao Del Norte',NULL,'$2y$10$rgdAkSqJXe3ajMhcyKrJ3enfIW17xrduyfIiIVS1Aa8wnTSVHIfh2','STUDENT',NULL,'2021-06-23 21:26:22','2021-06-23 21:26:22'),
(694,'Alexandra','CALUNOD','ALEXANDRA','NEBRES','FEMALE','NEW','2002-04-15','TONDO, MANILA','09517964248','alexandracalunod15@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'Purok-3','2021-06-23 21:28:41','$2y$10$BxA1JSzAIFpJsZGEHrI2V.9O.OXBq9TFmtmv.EqX12zXKApWP7RwC','STUDENT',NULL,'2021-06-23 21:28:12','2021-06-23 21:28:41'),
(695,'Rica05','CUARESMA','RICA','TEVES','FEMALE','NEW','2003-09-05','GATA DIOT CLARIN MISAMIS OCCIDENTAL','09639230737','cuaresmarica62@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Clarin','Gata Diot',25943,'Purok-2 Gata Diot Clarin Misamis Occidental','2021-06-23 21:39:02','$2y$10$I0atOj6wjmJPo3sQy8JdOuE4d77xomejopsbkPR7ciHGEnWr0lwE2','STUDENT',NULL,'2021-06-23 21:30:15','2021-06-23 21:39:02'),
(696,'rickamaeentrampas','ENTRAMPAS','RICKA MAE','VILLARTA','FEMALE','NEW','2002-09-26','OCAñA, CARCAR, CEBU CITY','09057898101','rickamaeentrampas@gmail.com','GEN  MID','BS CRIM','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Malingao',20267,'Purok-4','2021-06-23 23:36:11','$2y$10$0FiCla7w8Vy9Ok1IBJCd.eZYhFtA9WJrBb1.9iqYqExn3/icjojNG','STUDENT',NULL,'2021-06-23 21:31:54','2021-06-23 23:36:11'),
(697,'armankarlpasanting42@gmail.com','PASANTING','ARMAN KARL','BADILLA','MALE','NEW','2003-07-15','OZAMIS CITY','09639476602','armankarlpasanting42@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Clarin','Canipacan',25938,'1','2021-06-23 21:44:25','$2y$10$KmWORVQ3ggvjdX63Bh9BE.dQggDLkzJnS6Wnm.4oa3YC/0mInFrkS','STUDENT',NULL,'2021-06-23 21:32:13','2021-06-23 21:44:25'),
(698,'MitchelAdurable@gmail.com','ADORABLE','MITCHEL MAE','DAHILI','FEMALE','NEW','2003-08-09','MOBOD','09350618774','MitchelAdurable@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Lopez Jaena','Sibula',26041,'Purok 5 katugasan','2021-06-23 21:38:08','$2y$10$Gkeo1nC2X/bhtABFPvEV3e3J4/tq8MIIK4ikYMz7Jf9hok4jwHkQm','STUDENT',NULL,'2021-06-23 21:32:22','2021-06-23 21:38:08'),
(699,'micarizada531@gmail.com','RIZADA','MICA','','FEMALE','NEW','2003-06-03','TUSIK, BONIFACIO MISAMIS OCCIDENTAL','09093285927','micarizada531@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'P.2','2021-06-23 21:39:16','$2y$10$3aYcajw8.zBnUWpa0uC4EeJ./nC5Xo/8XTdFbK5hrIfzIwrZ6XHMy','STUDENT',NULL,'2021-06-23 21:32:43','2021-06-23 21:39:16'),
(700,'magkilatangele@gmail.com','MAGKILAT','ANGELE','REVELLEZA','FEMALE','NEW','2000-01-15','BANGLAY TANGUB CITY','09556727242','magkilatangele@gmail.com','BSED-SOCSTUD','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','Banglay',26238,'Purok-1','2021-06-23 21:39:42','$2y$10$JDKUWlvEtnyy2JvNEzJokesfXH79TFy/AeIfT30ferw8qjq.x5xcK','STUDENT',NULL,'2021-06-23 21:32:45','2021-06-23 21:39:42'),
(701,'brayangalleto@gmail.com','BAGKAT','ELOISA','MACAN','FEMALE','NEW','2003-06-15','TUDELA, MISAMIS OCCIDENTAL','09383023981','brayangalleto@gmail.com','BSED-ENGL','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Lampasan',25984,'Purok1 Mangga','2021-06-23 21:38:35','$2y$10$EMJjsdeRNuy/45L450Ekc..4OmbWZ.IaAXzhXAhBS021/91dED4NO','STUDENT',NULL,'2021-06-23 21:33:41','2021-06-23 21:38:35'),
(702,'Mr. Cute','CANINO','RAFAELLE ANGELO','CATIAN','MALE','NEW','2002-10-10','DIMALUNA, OZAMIZ CITY','09776103796','rafaelleangelocanino@gmail.com','BSCS','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Dimaluna',26110,'P-4A','2021-06-23 21:36:12','$2y$10$D/3Ar9AJoTPkb2G663fZneQK3NzlmG6FoaiieEZ67XCEX1gmclnOS','STUDENT',NULL,'2021-06-23 21:35:30','2021-06-23 21:36:12'),
(703,'eloisajeandano.olpha@gmail.com','DANO','ELOISA JEAN','JAICTIN','FEMALE','NEW','2002-09-23','MINAULON, BACOLOD, LANAO DEL NORTE','09662939215','eloisajeandano.olpha@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Lanao del Norte','Bacolod','Minaulon',19785,'1','2021-06-23 21:40:59','$2y$10$DvbAm6d5FRsV9oMHUMWzh.9t1mb.3zmth4tUivD6Zk0AIjxl9WDyG','STUDENT',NULL,'2021-06-23 21:35:42','2021-06-23 21:40:59'),
(704,'rueljeanfabriga.@gmail.com','FABRIGA','RUEL JEAN','ALESNA','MALE','NEW','2003-05-22','UPPER TIPARAK TAMBULIG ZAMBOANGA DEL SUR','09511093074','rueljeanfabrig.@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok 1 mangga',NULL,'$2y$10$KxcrrVOsQ8vAncQn1tnHeuhLMVPzPEwPRGeC/8K4pF3kWuX8OXi.q','STUDENT',NULL,'2021-06-23 21:35:42','2021-06-23 21:35:42'),
(705,'Maryann@gmail.com','SALOMON','MARY ANN','','FEMALE','NEW','2002-09-09','SUMIRAP, TANGUB CITY','09551833522','salomonmaryann123@gmail.com','BSED-MATH','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Baybay',25888,'Purok 1','2021-06-23 21:38:01','$2y$10$3NkAe4xGKGWypUy3Xa5.LONMsa3gYCmNwiVO4CIfxjkjJF.IXzJ02','STUDENT',NULL,'2021-06-23 21:35:44','2021-06-23 21:38:01'),
(706,'adecirjella81@gmail.com','ADECIR','JELLA','NAPIñAS','FEMALE','NEW','2002-04-29','SAN NICOLAS TUDELA MISAMIS OCCIDENTAL','09776457002','adecirjella81@gmail.com','BSBA-HRM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','San Nicolas',26316,'Purok 2','2021-06-23 21:39:48','$2y$10$SgvcgjKnQChr2Tq5vaC2UOSEAlVThAtwwFa.R9yhy5jh/R9VVvLFq','STUDENT',NULL,'2021-06-23 21:35:55','2021-06-23 21:39:48'),
(707,'Ann Janeth Manlangit','MANLANGIT','ANN JANETH','TOLLENO','FEMALE','NEW','2002-06-18','OZAMIZ CITY','09501033350','annjanethmanlangit65@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Jimenez','Dicoloc',25995,'Purok Nangka','2021-06-23 21:36:24','$2y$10$PcVIrFlF1MsOF1ptVAlFbOYtHSEWmelgK7YfndJ4P69.SUDrhmbB2','STUDENT',NULL,'2021-06-23 21:35:55','2021-06-23 21:36:24'),
(708,'Alfin','ARARAO','ALFIN','SALABSAB','MALE','NEW','2003-05-19','PUROK 4 PANAY, CLARIN, MIS. OCC.','09124357696','alfin019@gmail.com','BSED-FIL','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Kinangay Norte',25945,'Purok 4',NULL,'$2y$10$Ez5n5nMYZcRsvmqJyKFWa.QlBnpQUq1Mn9hgGO/rcd0ou/KcQMgLi','STUDENT',NULL,'2021-06-23 21:36:36','2021-06-23 21:36:36'),
(709,'jomelle','ANO-OS','JOMELLE JAY','DIEZ','MALE','NEW','2003-06-17','LILOAN BONIFACIO MISAMIS OCCIDENTAL','09383794510','mdece4096@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Baliangao','Magsaysay',25876,'P-1','2021-06-23 21:40:11','$2y$10$Bkk0ZIpTUI88NBZenRl3HeqcDbN4lX1da4EDzBLJK99PSMojVoh4.','STUDENT',NULL,'2021-06-23 21:37:20','2021-06-23 21:40:11'),
(710,'princessdemespenido@gmail.com','ESPENIDO','PRINCESS DEM','ALEGADO','FEMALE','NEW','2003-12-20','CLARIN MISAMIS OCCIDENTAL','09124765463','princessdemespenido@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Clarin','Poblacion III',25956,'Purok V','2021-06-23 21:45:28','$2y$10$28dw2CtwiTgAO.jyeGyUDOBtN/N.t4OLuuLZ62LXjeS0bhoxxUnou','STUDENT',NULL,'2021-06-23 21:37:44','2021-06-23 21:45:28'),
(711,'kim.ricarro@gmail.com','RICARRO','KIMBERLY','LUBIANO','FEMALE','NEW','2003-06-02','MABINI, MOLANAY, QUEZON PROVINCE','09353892818','kim.ricarro@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Zamboanga del Norte','Sergio Osmena Sr.','Bagong Baguio',40531,'Purok 3','2021-06-23 21:42:34','$2y$10$ZjummZSkwgliG9cA32pba.rMj9kvedPFqHnr7Nqp7pFUSZJAgQpAm','STUDENT',NULL,'2021-06-23 21:37:46','2021-06-23 21:42:34'),
(712,'deasismayirene@gmail.com','DE ASIS','MAY IRENE','BATON','FEMALE','NEW','2001-08-01','BALATACAN, TANGUB CITY','09466034015','deasismayirene@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Balatacan',26236,'Purok Humayan',NULL,'$2y$10$hABE4jtYB6V9invHLL3Ye.8IcQARL/QHyWgQ/g/RrxS34HurEG61W','STUDENT',NULL,'2021-06-23 21:37:49','2021-06-23 21:37:49'),
(713,'Valcharles30','SAGARINO','VAL CHARLES','','MALE','NEW','2000-09-30','ZAMBOANG CITY','09152378256','labajovalcharles30@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Cebu','Lapu-Lapu City','Baring',11403,'Causwagan','2021-06-23 21:41:19','$2y$10$GHNno3G06JvrmwtsVuIFeuh6xKdpPOcoG8lBKsdunNX6Ima1Bf.Fy','STUDENT',NULL,'2021-06-23 21:39:12','2021-06-23 21:41:19'),
(714,'daingmae94@gmail.com','DAING','MAE','TAMBAJOYOT','FEMALE','NEW','2003-08-24','SIQUIJOR, SIQUIJOR','09094691864','daingmae94@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Tuluan',41387,'Purok Centro','2021-06-23 21:40:11','$2y$10$Di0t4RGHXVGJp7wr6/Dc9OwX2N9H9dyAixaCh2JbWs4nEhfva5PgC','STUDENT',NULL,'2021-06-23 21:39:31','2021-06-23 21:40:11'),
(715,'FS','SUGANO','FLORIVY','CLARIN','FEMALE','NEW','2002-06-22','OROQUIETA CITY','09075138933','florivysugano84@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Oriental','Cagayan de Oro City','Kauswagan',26446,'Rodolfo N',NULL,'$2y$10$ZVBQubu5OzAAPz2/q3q2x.7UUCrD0eX1BlxRbOk2QGxQIDKG.SRf6','STUDENT',NULL,'2021-06-23 21:39:42','2021-06-23 21:39:42'),
(716,'Gein Quezon','QUEZON','GEIN','DUMASIG','FEMALE','NEW','2001-11-08','TITURON, TANGUB CITY','09105300889','geinquezon@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Kauswagan',26257,'P-7',NULL,'$2y$10$NSBxhCoO8Bd9fwB/7MZRqOD1iwm4fTAejvsfZYkxIL2xEdANrJAQy','STUDENT',NULL,'2021-06-23 21:39:58','2021-06-23 21:39:58'),
(717,'sardan.rochelle07@gmail.com','SARDAN','ROCHELLE','SAQUIN','FEMALE','NEW','2003-03-27','DAVAO CITY','09358444453','sardan.rochelle07@gmail.com','BSOA','BSBA-MM','FULL ONLINE',NULL,'Misamis Oriental','Cagayan de Oro City','Iponan',26445,'Balaos','2021-06-23 21:41:48','$2y$10$5go3UQXXgBgGIeD/ze/ml.OqUKjzkjpyDip7pIdlUAEJ6QjmOxPuC','STUDENT',NULL,'2021-06-23 21:40:07','2021-06-23 21:41:48'),
(718,'rueljeanfabriga. @gmail.com','FABRIGA','RUEL JEAN','ALESNA','MALE','NEW','2003-05-22','UPPER TIPARAK TAMBULIG ZAMBOANGA DEL SUR','09511093074','rueljeanfabriga.@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok 1 mangga',NULL,'$2y$10$XwsKIkdGkMFEtnGO8rWTIOqPhoiXGlInQqix3tGufZxBz5kX7kiY.','STUDENT',NULL,'2021-06-23 21:41:23','2021-06-23 21:41:23'),
(719,'Kentoy','TEMONIO','KENT IAN','ABIS','MALE','NEW','2000-06-21','PUROK1 PANTA-ON OZAMIS CITY','09105503479','kentiantemonio@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Calabayan',26100,'Purok2 Calabayan Ozamis City','2021-06-23 21:42:41','$2y$10$e2C2GZFB33OwYV/TKYQil.M74irruqEaFj/8WZ.SBj0Vf7QOoVPYe','STUDENT',NULL,'2021-06-23 21:41:48','2021-06-23 21:42:41'),
(720,'chrischan.arangote','ARANGOTE','CHRISTIAN','SUMOLONG','MALE','NEW','2003-07-06','PONLACION, KAPATAGAN LANAO DEL NORTE','+639264231891','kathmanatom2020@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Lanao del Norte','Kapatagan','Poblacion',19899,'Mahayahay Kapatagan Lanao del Norte','2021-06-23 21:47:11','$2y$10$NP17rMbkCXMnyzwudc9JfOEgVSyvfNZ2JeI46wcVQzpuqFH9M3Sjy','STUDENT',NULL,'2021-06-23 21:42:13','2021-06-23 21:47:11'),
(721,'charlenetutor861@gmail.com','TUTOR','CHARLENE','CAñETE','FEMALE','NEW','2002-07-30','HOSPITAL OZARAGA, DIGSON, BONIFACIO, MISAMIS OCCIDENTAL','09639240228','charlenetutor861@gmail.com','BSBA-MM','BEED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Demetrio Fernan',25893,'Purok 2','2021-06-23 21:44:53','$2y$10$razspKvVK3INdu0dcxOrgeGqEKcQn10AZllYQyNtJ/RJvn/ed4FnC','STUDENT',NULL,'2021-06-23 21:42:14','2021-06-23 21:44:53'),
(722,'denies02','CARVAJAL','DENIES MARIE','TAGBAR','FEMALE','NEW','2002-10-25','ILIGAN CITY','09562003465','deniescarvajal76@gmail.com','BSED','GEN  MID','BLENDED',NULL,'Lanao del Norte','Iligan City','Tubod',19874,'Prk. San Antonio Tubod','2021-06-23 21:43:34','$2y$10$lzt4GpHmiNgWGg.SRo1zZeEufE6UbDNDqOBWpW4HvsvZE22VaI1xK','STUDENT',NULL,'2021-06-23 21:42:53','2021-06-23 21:43:34'),
(723,'ALFIN19','ARARAO','ALFIN','SALABSAB','MALE','NEW','2003-05-19','PUROK 4 PANAY, CLARIN, MIS. OCC.','09124357696','alfinararao020@gmail.com','BSED-FIL','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Kinangay Norte',25945,'Purok 4','2021-06-23 21:44:05','$2y$10$EqAJeLsvxmoJrySOeMLmpeMvbE/3M65yrs1CUGT/uAo77PhNQxDt.','STUDENT',NULL,'2021-06-23 21:43:19','2021-06-23 21:44:05'),
(724,'Kevin Ver Obad','OBAD','KEVIN VER','ALBOR','MALE','NEW','1999-03-16','CALOOCAN CITY','09123966457','Kevinverobad@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tudela','Napurog',26314,'Purok 4','2021-06-23 21:49:59','$2y$10$bCqNFUKaxa9Ck1ZS4nmBpu3mAKx52AU.xE4j28YFYYeeMwTs4hT4C','STUDENT',NULL,'2021-06-23 21:43:53','2021-06-23 21:49:59'),
(725,'Claudine Therese Aliman','ALIMAN','CLAUDINE THERESE','SANCHEZ','FEMALE','NEW','1998-12-01','LUINAB ILIGAN CITY','09070650367','claudinealiman44@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Aloran','Lawa-An',25845,'P-3','2021-06-23 21:47:27','$2y$10$2VEGC0ZJMpX2PJ43P7fOAeFfakfXicCmNLMc6pPWekCg5Dc7HkGr.','STUDENT',NULL,'2021-06-23 21:43:59','2021-06-23 21:47:27'),
(726,'MarkPrailes13','PRAILES','MARK JADE','AGUSTINEZ','MALE','NEW','2002-11-30','TANDUBUAY, SAN PABLO ZDS.','09516547813','markprailes@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Taguima',26320,'Purok 2','2021-06-23 21:44:33','$2y$10$KZ7pF9aZCSzNYFgkAmr8setDtSTr6/if./VxoDHT4dxmLFFgzUEpi','STUDENT',NULL,'2021-06-23 21:43:59','2021-06-23 21:44:33'),
(727,'Mylsmaq','MAQUILAN','MYLKA ANN','PACTURAN','FEMALE','NEW','2003-01-28','OROQUIETA CITY','09635625145','mylsmaquilan2803@gmail.com','BSED','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Looc Proper',26174,'Purok 2','2021-06-23 21:50:49','$2y$10$mujOa5vy5pL.EnvnNL7rmekS4RFSoPVJZsxxwCo4nKC8oBthnevDS','STUDENT',NULL,'2021-06-23 21:45:51','2021-06-23 21:50:49'),
(728,'Aradostena','ARADO','STENA LUZ','MURIEDAS','FEMALE','NEW','2003-06-17','MISAMIS OCCIDENTAL PROVINCIAL HOSPITAL','09519402647','aradostena@gmail.com','BSED-ENGL','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Tipolo',26187,'Purok-3, Tipolo, Plaridel, Misamis, Occidental','2021-06-23 21:47:27','$2y$10$jXr./DO.63KBw7WkRq3UPuxnKFqwQTY8MLcTP2sb/cu19Lbey1M4m','STUDENT',NULL,'2021-06-23 21:46:03','2021-06-23 21:47:27'),
(729,'cabillon18','CABILLON','KNESSA FHEY','PALAO','FEMALE','NEW','2002-02-17','CENTRO NAPU TUDELA MISAMIS OCCIDENTAL','09754909054','cabillon18@yahoo.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Centro Napu',26303,'Purok 1','2021-06-23 21:51:45','$2y$10$J6QsIMfN5WtgtnJZKg6.GeF/kNNtNAeOH0SHfbWl4ltvrCp1Qqniq','STUDENT',NULL,'2021-06-23 21:46:17','2021-06-23 21:51:45'),
(730,'princess123@gmail.com','CAGATAN','PRINCESS','MAGADAN','FEMALE','NEW','2021-09-23','BOLINSONG BONIFACIO MISAMIS OCCIDENTAL','09632361411','princess123@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Bolinsong',25889,'Purok 5',NULL,'$2y$10$lbaZuhwuTjEqNfF4FOLl7.r2jm4D0oIUt3rXrvePK2FxS4bXcitT6','STUDENT',NULL,'2021-06-23 21:46:31','2021-06-23 21:46:31'),
(731,'Jerica Marie Ordeniza','ORDENIZA','JERICA MARIE','TOMATAO','FEMALE','NEW','2003-01-22','TITURON, TANGUB CITY PORUK 3','09700519468','jericamarieo@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Labuyo',26259,NULL,'2021-06-23 21:49:26','$2y$10$LpYiGHgPirFbhjbeQQP63.FgAmgMU1v7PiT7DPfkriqx5PTiI3rMq','STUDENT',NULL,'2021-06-23 21:47:41','2021-06-23 21:49:26'),
(732,'Jessalyn Hapitan','HAPITAN','JESSALYN','DINOPOL','FEMALE','NEW','2002-10-25','POBLACION KAPATAGAN LANAO DEL NORTE','09352501336','hapitan.jessalyn@gmail.com','BSED-ENGL','BSED-MAPEH','FULL ONLINE',NULL,'Lanao del Norte','Kapatagan','Poblacion',19899,'Purok 15 Tulaybuhangin','2021-06-23 22:01:26','$2y$10$NNLVOGPhmnguQHQtgOwnKOe2kC8suFyFVQ1lJ8dow6Z5hs8VdpLdC','STUDENT',NULL,'2021-06-23 21:50:18','2021-06-23 22:01:26'),
(733,'cyrosejean02ambos@gmail.com','AMBOS','CYROSE JEAN','SOLATORIO','FEMALE','NEW','2003-11-02','BAROY, LANAO DEL NORTE','09651685386','Cyrosejean02ambos@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Sapad','Katipunan',20184,'Purok 3','2021-06-23 22:02:11','$2y$10$UO7FZ7hnhdIfTfbgO1PVYevPnma4a8qpI7D.NP6CvgwB.ggj.hvc2','STUDENT',NULL,'2021-06-23 21:51:44','2021-06-23 22:02:11'),
(734,'christineannepolido@gmail.com','POLIDO','CHRISTINE ANNE','E.','FEMALE','NEW','2003-01-04','BUENAVISTA','09754954419','christineannepolido@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Buenavista',26294,'1','2021-06-23 22:15:37','$2y$10$Zt.94JuJ4X0IBTLttY.mlO1OV9cYg9AFoFfGmY7byxR026ds0kWz.','STUDENT',NULL,'2021-06-23 21:52:12','2021-06-23 22:15:37'),
(735,'trexielagas@gmail.com','LAGAS','TREXIE','NINANG','FEMALE','NEW','2002-08-18','PUROK 1 BASIRANG, TUDELA MIS.OCC','09097770534','trexielagas@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Tudela','Basirang',26292,'PUROK 1',NULL,'$2y$10$xwEYOhXqZb2njvZM3SUfZOHr6aYLMVxk0OEfB17rWjqZxfqN1brOK','STUDENT',NULL,'2021-06-23 21:53:30','2021-06-23 21:53:30'),
(736,'@hearttyhelera25','HELERA','HEARTTY','','FEMALE','NEW','2021-03-25','PUROK 1, BONGABONG, TANGUB CITY','09972389799','hearttyhelera@gmail.com','BSED-ENGL','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'PUROK-1','2021-06-23 21:55:59','$2y$10$p46M5taXxx25MaJRdoi9Vu4lKRH7ojnim8bzPmCT83G0Dq35UI9h6','STUDENT',NULL,'2021-06-23 21:53:56','2021-06-23 21:55:59'),
(737,'Ayen','PARAGOSO','RYL RHANIE','ARDINES','FEMALE','NEW','2001-11-15','CULO MOLAVE ZAMBOANGA DEL SUR','09465720006','rylrhanieparagoso467@gmail.com','AB COMM','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Yellow bell','2021-06-23 22:02:13','$2y$10$jyeJZxBl7gZvwrSB1q.QKuiWUbBacqvHe782fQIm3M0NP3DK1Odau','STUDENT',NULL,'2021-06-23 21:54:13','2021-06-23 22:02:13'),
(738,'rhaselllibrando','LIBRANDO','RHASELL','PAT','MALE','NEW','2002-06-03','BLISS,MOLAVE ZAMBOANGA DEL SUR','09519399703','rhaselllibrando1234@gmail.com','BS CRIM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African Daisy 1','2021-06-23 21:58:13','$2y$10$hIftydzAmdIE8A.ZuCTBhem5Tywn7qqGiN.3LJs.Zrc9KO3WjLDwy','STUDENT',NULL,'2021-06-23 21:54:52','2021-06-23 21:58:13'),
(739,'Lore_ann','ALVARICO','ANA LORRAINE','MAGASO','FEMALE','NEW','2001-10-03','MIDSAYAP, NORTH COTABATO','09673168112','analorrainealvarico@gmail.com','GEN  MID','BSBA-MM','BLENDED',NULL,'Lanao del Norte','Tubod','Poblacion',20272,'Purok 1 TCES Lamac, Tubod Lanao del Norte','2021-06-23 21:56:30','$2y$10$Jcrs4fEScd4mUdrra1v19ujRDYV5Zi1no2hdSDImhFG1L3/dKMB7.','STUDENT',NULL,'2021-06-23 21:55:59','2021-06-23 21:56:30'),
(740,'JOSELITO','CAGAS','JOSELITO','','MALE','NEW','2002-01-31','TANGUB CITY','09619085508','cagasjoselito07@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Aquino street','2021-06-23 21:58:14','$2y$10$DpiRPbKoGbWyjHaM4sIZe.Z9AESEZaQIAZtEk/TeGaHxY6AC5ql4i','STUDENT',NULL,'2021-06-23 21:57:28','2021-06-23 21:58:14'),
(741,'ridacarriaga','CARRIAGA','RIDAFE','NADERA','FEMALE','NEW','2002-10-29','TUNGAWAN, TAMBULIG, ZAMBOANGA DEL SUR','09300490367','ridafecarriaga27@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Tungawan',41388,'Purok Kalitundan','2021-06-23 21:58:32','$2y$10$w9Rc.zfLSSBUiKgvAplGSO.ZwcQII2WDOib.v5kXYuF.P2WyVyWFq','STUDENT',NULL,'2021-06-23 21:57:34','2021-06-23 21:58:32'),
(742,'manzanoelay29@gmail com','MANZANO','LEONILA','ABELLA','FEMALE','NEW','2003-07-29','SM LAO, OZAMIZ CITY, MISAMIS OCCIDENTAL','09381425664','manzanoelay29@gmail.com','BEED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'PUROK 6','2021-06-23 22:04:54','$2y$10$1FcMiA2.e0jxcte9e406BO8k.PBjLLbdDWNsEj29Z7N8/8L8iInB2','STUDENT','VvFiwN5w6eB8pmyOlZFkWZXFfvZvHFClUKNfe69Scerkgu4xwX42YSSq675G','2021-06-23 21:58:12','2021-06-23 22:27:06'),
(743,'Yangsacares@gmail.com','SACARES','MARY GRACE','COBITA','FEMALE','NEW','1999-12-14','PAN-AY CLARIN MISAMIS OCCIDENTAL','09380324679','yangsacares@gmail.com','BSED-ENGL','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'3','2021-06-23 21:59:11','$2y$10$TWHkUN9L51xGMS2yu5KmHu/fIYW.spkX9rG2Lfx.OFtErFgczo2CO','STUDENT',NULL,'2021-06-23 21:58:49','2021-06-23 21:59:11'),
(744,'jayarmodia20@gmail.com','RUPINTA','JAY','ARMODIA','MALE','NEW','2002-08-20','OZAMIZ CITY','09061806209','jayarmodia20@gmail.com','BS CRIM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Litapan',26125,'P-2','2021-06-23 22:07:02','$2y$10$HMxkN0x/L00.mMIuLQ15uejcdUws9Wg3eBOwCrsI19PPBfw4TfQ52','STUDENT',NULL,'2021-06-23 21:59:32','2021-06-23 22:07:02'),
(745,'aclaericjohn10@gmail.com','ACLA','ERIC JOHN','JANOLGUE','MALE','NEW','2002-11-26','POB.1 CLARIN MISAMIS OCCIDENTAL','09512520605','aclaericjohn10@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Buenavista',26294,'Purok 1','2021-06-23 22:18:48','$2y$10$Hn6C9ox.DmObftY9aGJTHOyiolPTJbxqEcJ3iYvhY.TO0SyrF5NSK','STUDENT',NULL,'2021-06-23 21:59:39','2021-06-23 22:18:48'),
(746,'Reneboy raymarat quijano jr.','QUIJANO','RENEBOY','GANDALON','MALE','NEW','2001-05-18','MHARS GEN','09317583519','reneboyquijano967@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'P-1',NULL,'$2y$10$cDJK2k9qdO7JYkIlSZ2hV.KDu5uCpGi1wOcjl8.RHqh/0sw6E2AbC','STUDENT',NULL,'2021-06-23 22:00:21','2021-06-23 22:00:21'),
(747,'RoldanP','PIEDAD','ROLDAN','NERICUA','MALE','NEW','2002-09-29','CAMPO 4, RAMON MAGSAYSAY','09335387509','bebongpiedad@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Campo IV',41259,'Purok Malamboon','2021-06-23 22:01:31','$2y$10$6xqF2CtayhE1L9p/I4KnGeJANkUWsjtNK8lYYwQWtU682vaLZGrh6','STUDENT',NULL,'2021-06-23 22:00:46','2021-06-23 22:01:31'),
(748,'janselvillahermosa81@gmail.com','VILLAHERMOSA','JANSEL','FAJARDO','MALE','NEW','2003-01-26','BALAMBAN DISTRICT HOSPITAL','09154559838','janselvillahermosa81@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'P-3,Abaga','2021-06-23 23:08:29','$2y$10$5pn9D7039niXXjutCxfQ9uSHtWU3l5.4.ILLYtZu1Jy0cXEVx7lP6','STUDENT',NULL,'2021-06-23 22:01:06','2021-06-23 23:08:29'),
(749,'Joel jr otos','OTOS','JOEL JR','BASMAYOR','MALE','NEW','2002-12-07','MALIBANGCAO CLARIN MISAMIS OCCIDENTAL','09505947364','joeljrotos@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Clarin','Malibangcao',25949,'Poruk3',NULL,'$2y$10$yNdfUylFj3viZllCbTAaCOMpLTE9RbYxz/BO21owZHf8Rnpq.cFsm','STUDENT',NULL,'2021-06-23 22:01:22','2021-06-23 22:01:22'),
(750,'mawengbalayong@gmail.com','BALAYONG','EMMANUEL','ASARI','MALE','NEW','2003-04-01','KINANGAY SUR CLARIN MIS OCC','09309889355','mawengbalayong@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Tinacla-An',25961,'Purok 2 clarin','2021-06-23 22:16:59','$2y$10$.rfY2UAuTTqeEzxexbh2ZuIAgCi2DRFinhHH2z0jTBVnfhw5ZqVH.','STUDENT',NULL,'2021-06-23 22:01:39','2021-06-23 22:16:59'),
(751,'zerotwo02','BOLANDO','JHONARIEL','DAQUE','MALE','NEW','2002-09-15','OROQUIETA CITY','09639238211','bolando.jhonariel01@gmail.com','BSED-FIL','BSED-MATH','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Poblacion I',26071,'Bernad.Street','2021-06-23 22:03:43','$2y$10$skfoS/1Tm9v.vGvGzJJhI.c5H/FntUoNLB/jyBxvXmvruIuFrtge.','STUDENT',NULL,'2021-06-23 22:01:46','2021-06-23 22:03:43'),
(752,'Regine Beth B. Roxas','ROXAS','REGINE BETH','BESIN','FEMALE','NEW','2001-12-22','PUNTA,SILUM,MANTICAO MISAMIS ORIENTAL','09095010708','reginebethroxas354@gmailcom','GEN  MID','BSED','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Riverside',41382,'Purok Santol',NULL,'$2y$10$1z4fYQMgNmYfJw5n1wXPQurD9Ff0ZS1f69.t9xot6EIUpRMmeLVz.','STUDENT',NULL,'2021-06-23 22:02:11','2021-06-23 22:02:11'),
(753,'dixiecabanday02@gmail.com','CABANDAY','DIXIE','ALJAS','FEMALE','NEW','2002-10-10','DMDTMH','09506860761','dixiecabanday02@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Purok Perez','2021-06-23 22:05:35','$2y$10$cnoLE/I4RaffgTUjNSVxv.FOqO.m.LDtYpDvoexzk.z6gFO3Z7.Ee','STUDENT',NULL,'2021-06-23 22:04:37','2021-06-23 22:05:35'),
(754,'sarsalejoangelou1@gmail.com','SARSALEJO','ANGELOU','QUILATON','MALE','RETURNEE','2002-10-03','ISIDRO D TAN TANGUB CITY','09661892038','sarsalejoangelou@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purok-1 Isidro D Tan Tangub City',NULL,'$2y$10$NFHVLw1g70MjrMvjzPXEKuMvcN.xx/XvIiQ4.O11bqV2Bc11EPFL6','STUDENT',NULL,'2021-06-23 22:04:39','2021-06-23 22:04:39'),
(755,'Florivy Sugano','SUGANO','FLORIVY','CLARIN','FEMALE','NEW','2002-06-22','OROQUIETA CITY','09075138933','sugano.florivy16@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Lao Proper',26172,'Purok 5, Lao Proper, Plaridel Misamis Occidental','2021-06-23 22:06:46','$2y$10$uZ3Now1MSS81qwWvg9AXnuza6H94T5L2bsu9GWTboHWa5mI/a9amq','STUDENT',NULL,'2021-06-23 22:05:08','2021-06-23 22:06:46'),
(756,'whiskyban@gmail.com','BANUELOS','WHISKY','','MALE','NEW','2001-11-14','CEBU','09639391429','whiskyban@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Canubay',26050,'Purok 4','2021-06-23 22:06:52','$2y$10$zRJPmDzmqxXYrYVR9.D73.3UgIoLjtUtkiPwYIyxYYjHA4Ug7Fo0.','STUDENT',NULL,'2021-06-23 22:05:12','2021-06-23 22:06:52'),
(757,'christophersacares1998@gmail.com','SACARES','CHRISTOPHER','COBITA','MALE','NEW','1998-11-25','PAN-AY CLARIN MISAMIS OCCIDENTAL','09664157489','christophersacares1998@gmail.com','BSED-ENGL','AB ENGLISH','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'3','2021-06-23 22:20:43','$2y$10$FGr9/NvhzovImqTh2C0xmuYHObL/lSGyDWwe4JmMQhLC4toMra5uy','STUDENT',NULL,'2021-06-23 22:06:33','2021-06-23 22:20:43'),
(758,'GLpepito812','PEPITO','GRACEL LOU','CAMARADOR','FEMALE','NEW','2002-08-01','GUMAHAN, JOSEFINA, ZAMBOANGA DEL SUR','09666901855','gracelcampepito@gmail.com','BSED','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Purok Reservoir','2021-06-23 22:07:29','$2y$10$tYGnav/nxuChLV1iTz6loedvhYqeko72sf7AYd4jAwlvlrkGv2f7e','STUDENT',NULL,'2021-06-23 22:07:06','2021-06-23 22:07:29'),
(759,'Alliahmariecarpio@gmail.com','CARPIO','ALLIAH MARIE','DANO','FEMALE','NEW','2002-08-09','SANTA CATALINA MINALIN PAMPANGA','09081480178','alliahmariecarpio@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok1',NULL,'$2y$10$ZM5Kc3kdOEwnEt7pu4eyS.RcHFQEeMDOhg.x0T0CDdE0B2QBWK6nu','STUDENT',NULL,'2021-06-23 22:08:18','2021-06-23 22:08:18'),
(760,'Marchissa Mae Alforque','ALFORQUE','MARCHISSA MAE','COLANGGO','FEMALE','NEW','2002-03-18','MHAR\'S GEN OZAMIZ CITY','09078726408','marchissamaealforque@gmail.com','BSED-ENGL','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok-8',NULL,'$2y$10$x.vn.rLO89TBlLNEyWBynOozgyBOAYdqBb1ou.1odmxnvbpxCkU9G','STUDENT',NULL,'2021-06-23 22:08:22','2021-06-23 22:08:22'),
(761,'Regine Beth Besin Roxas','ROXAS','REGINE BETH','BESIN','FEMALE','NEW','2001-12-22','PUNTA,SILUM,MANTICAO MISAMIS ORIENTAL','09095010708','reginebethroxas354@gmail.com','GEN  MID','BSED','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Riverside',41382,'Purok Santol','2021-06-23 22:21:41','$2y$10$O8lM0VzrhKads/4zvKJB..sqZQooeKjyiEZObVDxkD7oWiqhc9Wsa','STUDENT',NULL,'2021-06-23 22:09:07','2021-06-23 22:21:41'),
(762,'belcatambacan@gmail.com','CATAMBACAN','BEL RENALD','ZULITA','MALE','NEW','2003-04-25','MALABON CITY,MANILA','09653497123','belcatambacan@gmail.com','BSED-MATH','BS CRIM','BLENDED',NULL,'Lanao del Norte','Lala','Magpatao',19960,'Purok 1','2021-06-23 22:12:49','$2y$10$amTqexOu0C26CzT6Hi3PmOchjMgOCbcJbPk30AfawkEYTSW/XrGri','STUDENT',NULL,'2021-06-23 22:09:52','2021-06-23 22:12:49'),
(763,'reymarkabadilla@gmail.com','ABADILLA','REY MARK','ONTOLAN','MALE','NEW','2002-01-02','CLARIN MISAMIS OCCIDENTAL','09079080419','reymarkabadilla6@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Clarin','Poblacion III',25956,'Purok V','2021-06-23 22:25:34','$2y$10$QCx1mLErrJaNYg8I80rlBuEoJf/NyAlZafVtgg0Pb9aLkqSLUS/vu','STUDENT',NULL,'2021-06-23 22:10:45','2021-06-23 22:25:34'),
(764,'Juliusonis@gmail.com','ONIS','JULIUS','P.','MALE','NEW','2003-07-28','MARS JEN','09352493441','onisjulius54@gmail.com','BSED-MAPEH','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Baybay',25888,'1',NULL,'$2y$10$mgqasY1RRrucCFBUZU1X1.6C.bkv.pmVVCbSSinIFeyPXzeyhovXC','STUDENT',NULL,'2021-06-23 22:10:55','2021-06-23 22:10:55'),
(765,'Ricmarlumactod@gmail.com','LUMACTOD','RICMAR','REMOS','MALE','NEW','2021-06-23','SAN ANTONIO OZAMIZ CITY','09632428608','Ricmarlumactod@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'P-6','2021-06-23 22:15:52','$2y$10$.eX7n9Op/zCtfhGvnkW7eufpn9SnocH1Vuyb5GvO06TI4KG0qrnmq','STUDENT',NULL,'2021-06-23 22:11:05','2021-06-23 22:15:52'),
(766,'shairajaneincoymacas1998@gmail.com','MACAS','SHAIRA JANE','INCOY','FEMALE','NEW','1998-09-30','CALUBE ALORAN MISAMIS OCCIDENTAL','09770717932','shairajaneincoymacas1998@gmail.com','BEED','BEED','BLENDED',NULL,'Misamis Occidental','Aloran','San Pedro',25861,'Purok 1','2021-06-23 22:14:29','$2y$10$VJn0KUzm3c5RPkKeK1.FD.zP/rWhQx7f9JTXW3xYj5sQcn1DaYQBq','STUDENT',NULL,'2021-06-23 22:11:13','2021-06-23 22:14:29'),
(767,'annalousarona1@gmail.com','SARONA','ANNALOU','ABARRO','FEMALE','NEW','2002-11-20','EL- SALVADOR LALA LANAO DEL NORTE','09368128049','annalousarona1@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Lanao del Norte','Kapatagan','Poblacion',19899,'Purok 15 TULAYBUHANGIN','2021-06-23 22:12:31','$2y$10$ohwctRoUDuh00cOTJA2h8.Ofrz2RNGCfYo7rKkfV9eZxSVwIGDTxW','STUDENT',NULL,'2021-06-23 22:11:43','2021-06-23 22:12:31'),
(768,'regidorrachel35@gmail.com','REGIDOR','ROCHE','BADIANG','FEMALE','NEW','2002-01-17','STA. CRUZ TANGUB CITY','09382679683','regidorrachel35@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Cruz',26278,'Purok 1','2021-06-23 22:17:31','$2y$10$phbcTLJWfO.sgWR7VWZC8uHd4alSvmLW3mhT21doHmi5GCdva1Lfq','STUDENT',NULL,'2021-06-23 22:12:35','2021-06-23 22:17:31'),
(769,'Lady Fatima','RICO','LADY FATIMA','CAGOD','FEMALE','NEW','2002-10-17','GUMAHAN, JOSEFINA, ZAMBOANGA DEL SUR','09163516468','rladyfatima@gmail.com','AB POLSCI','BSED-SOCSTUD','BLENDED',NULL,'Zamboanga del Sur','Josefina','Gumahan',40987,'Purok Reservoir','2021-06-23 22:13:38','$2y$10$EF/YF5TRaJcJeMAR82WGcOpDo6JvWyUFbuCrmzlg7X4u0Ito0wbly','STUDENT',NULL,'2021-06-23 22:12:39','2021-06-23 22:13:38'),
(770,'Clintford Padayhag','PADAYHAG','CLINTFORD','BALANG','MALE','NEW','1999-02-23','CAPUCAO OZAMIZ,CITY','09078731071','clintfordpadayhag66@gmail.com','AB COMM','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Capucao P.',26102,'Purok 1','2021-06-23 22:13:15','$2y$10$whNiZ4XZlmfiQtvG9VGsMexxmd/dVtEKspwNCOtjudl7WhYLjZu32','STUDENT',NULL,'2021-06-23 22:12:40','2021-06-23 22:13:15'),
(771,'Angieloulyn','ABATAYO','ANGIELOULYN','MONTEMAYORES','MALE','NEW','2002-09-01','TANGUB CITY','09461651436','angielouabatayo@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok 6','2021-06-23 22:14:17','$2y$10$V5S8MTq2sVZOKVwPB7o5teC9C5QbKP4EXXx3ghYXQ/h7ccgucNTTy','STUDENT',NULL,'2021-06-23 22:13:05','2021-06-23 22:14:17'),
(772,'Jayveegamutan','GAMUTAN','JAYVEE','ELMEDULAN','MALE','TRANSFEREE','2002-04-19','OZAMIS','09562675841','jayveegamutan69@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Maikay',26309,'Purok 3','2021-06-23 22:16:07','$2y$10$OxquTOEHXaWdh8YuYzR5o.4Phdn7ZFLTFeU0mqGQ8mBXCigdmUL.m','STUDENT',NULL,'2021-06-23 22:13:57','2021-06-23 22:16:07'),
(773,'Jael','LOVITOS','JENNY ANNE','ENRIQUEZ','FEMALE','NEW','1990-01-13','ILIGAN CITY','09972015989','enriquez2790@gmail.com','BSED-MATH','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Barangay VI - Lower P',26244,'Purok 3','2021-06-23 22:19:30','$2y$10$mj1KMPDjfsiFGAjO0sLXdu2xyWUN6bbAg1US8aDQQozPSnRnD7Vfq','STUDENT',NULL,'2021-06-23 22:17:48','2021-06-23 22:19:30'),
(774,'bacusfritz18@gmail.com','BACUS','FRITZ','','MALE','TRANSFEREE','2003-04-02','BONIFACIO MISAMIS OCCIDENTAL','09380339294','bacusfritz18@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Bolinsong',25889,'P-7','2021-06-23 22:25:06','$2y$10$2JgDWfis5Mn24RG6JruwkeWgGRvVKqdKqw3YDqyZJjcQOnnF.dpqC','STUDENT',NULL,'2021-06-23 22:18:45','2021-06-23 22:25:06'),
(775,'Juliusonis123@gmail.com','ONIS','JULIUS','P.','MALE','NEW','2003-07-28','MARS JEN','09352493441','juliusonis54@gmail.com','BSED-MAPEH','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Baybay',25888,'1',NULL,'$2y$10$1G28nIo/RKQnctYcKky.puTtkaohGDHCUbVdgE3i.O0S.YKrGGRdm','STUDENT',NULL,'2021-06-23 22:19:31','2021-06-23 22:19:31'),
(776,'Janmarloucampus@gmail.com','ABELLANA','JAN MARLOU','CAMPUS','MALE','NEW','2002-01-18','GINGOOG','09518459877','janmarloucampus@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Maningcol',26128,'Matinabangon','2021-06-23 22:23:30','$2y$10$gCBAbuF5YhSNLGgi9dmhTOKzALKsGqLa62dB.4WlmmMIyD5sbrdiG','STUDENT',NULL,'2021-06-23 22:20:16','2021-06-23 22:23:30'),
(777,'kclargosa@gmail.com','LARGOSA','KRISFEL CLEAH','YOBERO','FEMALE','NEW','2003-04-16','MOPH','09074063876','kclargosa@gmail.com','BSED-MAPEH','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Ibabao',25843,'Purok 1 Benito Apepe Street','2021-06-23 22:22:36','$2y$10$W75s7KAORxa7vA3r7Mhe.utoi42tbteTHpZR3S/UHQj4v8ims3ALm','STUDENT',NULL,'2021-06-23 22:21:47','2021-06-23 22:22:36'),
(778,'LuxLeighApos','APOS','LUX LEIGH','NERI','FEMALE','NEW','2003-01-14','OROQUIETA CITY','09124765961','luxleighapos@gmail.com','BSOA','BSCS','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Langcangan Upper',26062,'Purok5',NULL,'$2y$10$ppAuMua91DJTGk98BvKzUeq4NquTWyKuNQeM87DZJUAnY4wElSNaC','STUDENT',NULL,'2021-06-23 22:21:54','2021-06-23 22:21:54'),
(779,'aswekentmark348@gmail.com','ASWE','KENT MARK','REYES','MALE','NEW','2000-12-17','KIMAT TANGUB CITY','09501203294','aswekentmark348@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Catagan',26251,'Purok 6','2021-06-23 22:26:50','$2y$10$VkG3DAk3YN8USBSvAeF8z.LccToPOIVI5JPZC35.qedD4fdB58QZe','STUDENT',NULL,'2021-06-23 22:24:58','2021-06-23 22:26:50'),
(780,'alfredomictin@gmail.com','OMICTIN','AFREDO','DINAWANAO','MALE','RETURNEE','2001-01-07','DUMINGAG ZAMBUANGA DER SUR','09519399173','alfredomictin@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Bucayan',40926,'PUROK 2',NULL,'$2y$10$SMp3yJQ5OkxjX4XAHkiIgOAJGWkepA8xjgYuc85F6SFY10HQF6pPi','STUDENT',NULL,'2021-06-23 22:26:58','2021-06-23 22:26:58'),
(781,'Sunshine Pandan','PANDAN','SUNSHINE','GABO','FEMALE','NEW','2002-09-07','PUROK 2, MIGPANGE, BONIFACIO, MISAMIS OCCIDENTAL','+63 963 928 7595','gabopandansunshine@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Migpange',25903,'Purok 2','2021-06-23 22:30:04','$2y$10$xQsKwAy6yJaRc8XSk.LeCOj6TUJpkts77oonnwY0bIfxnIijc4rbq','STUDENT',NULL,'2021-06-23 22:29:24','2021-06-23 22:30:04'),
(782,'nogasmarygold7@gmail.com','NOGAS','MARY GOLD','YLANAN','FEMALE','NEW','2003-07-27','TABID OZAMIZ CITY','09380013467','nogasmarygold7@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'Purok-1 Hinagdong','2021-06-23 22:41:41','$2y$10$eeea3HwloysmRLj28CHGXemMdzJmyh2vzIxkejDctTF9zShSYjVCa','STUDENT',NULL,'2021-06-23 22:30:03','2021-06-23 22:41:41'),
(783,'NIKKI BASALO','BASALO','NIKKI','DELGADO','FEMALE','NEW','2000-11-16','OZAMIS CITY','09631472407','nikkidbasalo@gmail.com','BSCS','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Barangay I - City Hall',26239,'Kalaw street','2021-06-23 22:32:30','$2y$10$X85ha2grvR38xnO50rCPEuR6Qryjm.wohg8s5YDKR/CTMIFj5Lari','STUDENT',NULL,'2021-06-23 22:30:03','2021-06-23 22:32:30'),
(784,'cailingsean25@gmail.com','CAILING','SEAN JOSHUA','SUEZO','MALE','NEW','2002-03-25','OZAMIZ CITY','09518503384','cailingsean25@gmail.com','BSBA-HRM','BSED','BLENDED',NULL,'Misamis Occidental','Ozamis City','Baybay Santa Cruz',26097,'Purok 2','2021-06-23 22:36:26','$2y$10$0RhLJNQy1T73iNnTuCbCBO70YjMDNLCkmAPplxxO.kaj9d4MsnjRu','STUDENT',NULL,'2021-06-23 22:31:25','2021-06-23 22:36:26'),
(785,'krizzeynn','BARIL','KRIZA NEIL','PALLAR','FEMALE','NEW','2003-02-15','OROQUIETA CITY','09508013849','krizaneilb@gmail.com','BEED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Apil',26043,'P-3','2021-06-23 22:34:45','$2y$10$9WKTXWZe4W56VjirVRK09uRnYTIhGXtq9JYB/OAIFWlOFALCpWzPq','STUDENT',NULL,'2021-06-23 22:31:34','2021-06-23 22:34:45'),
(786,'Sherly jane A. Sarbida','SARBIDA','SHERLY JANE','ALBURO','FEMALE','NEW','2002-09-01','UPPER SICPAO, SOMINOT','09356987989','Sherlyjanesarbida09@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Sominot','Upper Sicpao',41345,'Purok 6','2021-06-24 05:56:10','$2y$10$.57Rgti4FzNZaYVee09mcOd33TtawwmbZlEYll8rM0b5.Jqs9JTY6','STUDENT',NULL,'2021-06-23 22:34:12','2021-06-24 05:56:10'),
(787,'Kaye','BARCO','KAYE','SABADO','FEMALE','NEW','2002-06-27','BUTUAY JIMENEZ MIS. OCC.','09507766663','bfrence@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Jimenez','Butuay',25992,'P-5 Butuay','2021-06-23 22:48:19','$2y$10$GmXuOqiU1ev84NploHRWz.VMNeTrPKWfOgs/lHIhGluRYEplukUJG','STUDENT',NULL,'2021-06-23 22:35:14','2021-06-23 22:48:19'),
(788,'Jenny Lou','GARCIA','JENNY LOU','LORENIANA','FEMALE','NEW','2003-02-11','SINUSA, OZAMIS CITY','09511962209','garciajennylou64@gmail.com','AB ENGLISH','AB ENGLISH','BLENDED',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 5','2021-06-23 22:38:12','$2y$10$U0juBqX9ejg4ZIuf//BOQunJicXZb1AYsfXqHaWNnOYZFQPeIRV5G','STUDENT',NULL,'2021-06-23 22:35:18','2021-06-23 22:38:12'),
(789,'Joevicjagonia605@gmail.com','JAGONIA','JOEVIC','FLORES','MALE','TRANSFEREE','2002-02-24','OZAMIZ CITY','09380324428','Joevicjagonia605@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carmen',26104,'Purok 2','2021-06-23 22:41:59','$2y$10$XsmeH03HDN1WmbWwRwfbHO6KBmXov55Bdsl0qAcZUIBiY.EfGQL8S','STUDENT',NULL,'2021-06-23 22:38:35','2021-06-23 22:41:59'),
(790,'janpol.babylove@gmail.com','RODRIGUEZ','JOHN PAUL','ALAB','MALE','NEW','2002-04-08','SIMASAY TANGUB CITY','09052172239','janpol.babylove@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'PUROK 6','2021-06-23 22:42:24','$2y$10$/5mLY4zDk1iuzofoBui7QeoYUk5J4HI5xm2iy027tTuyON73j5.wa','STUDENT',NULL,'2021-06-23 22:40:11','2021-06-23 22:42:24'),
(791,'sarsalejoangelo7@gmail.com','SARSALEJO','ANGELOU','QUILATON','MALE','RETURNEE','2002-10-03','ISIDRO D TAN TANGUB CITY','09661892038','sarsalejoangelo7@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purok-1, Isidro D Tan Tangub City','2021-06-23 22:43:18','$2y$10$/azydVOAi1jNc7D0pLd5z.vjMsUOGvo3.Ope5GMo8PaYUTLRndV4e','STUDENT',NULL,'2021-06-23 22:40:16','2021-06-23 22:43:18'),
(792,'Hani','ABUGATAL','HONEY MAE','LUMINGKIT','FEMALE','NEW','2003-02-10','MANGA, TANGUB CITY','09757160851','abugatal.honeymae17@gmail.com','GEN  MID','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Manga',26263,'P-5',NULL,'$2y$10$WgAtlxB6JhFuyjU5nPZvyeinHEFMmofVxpaRUgPMsTj00KWROH8pO','STUDENT',NULL,'2021-06-23 22:40:51','2021-06-23 22:40:51'),
(793,'Shaina L. Amba','AMBA','SHAINA','LUZA','FEMALE','NEW','2002-10-08','OZAMIS CITY','09380013649','shainaamba56@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'Purok 3','2021-06-23 22:44:14','$2y$10$Omj.nlEYKCphJ.r3nmIRkOXGM0f4OHF0gDv6pQrfQrBupcTa2gJhO','STUDENT',NULL,'2021-06-23 22:41:04','2021-06-23 22:44:14'),
(794,'Junel Sumagang','SUMAGANG','JUNEL','ALIMAN','MALE','NEW','2001-06-07','TUNGAWAN,TAMBULIG ZDS','09153595567','junealiman53@gmail.com','BS CRIM','BSED-ENGL','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Happy Valley',41371,'Purok 3','2021-06-23 22:48:38','$2y$10$BypkoiFshU3i8TE8.A51zuy5gUMn4OqxHcYPhhxtGZqQadHIPBjum','STUDENT',NULL,'2021-06-23 22:44:32','2021-06-23 22:48:38'),
(795,'jasonparedes97@gmail.com','PAREDES','JAYSON','ALQUISAR','MALE','NEW','1998-01-15','PAGADIAN CITY','09566036370','jasonparedes97@gmail.com','BSED-FIL','BEED','BLENDED',NULL,'Lanao del Norte','Baroy','Village',19833,'2','2021-06-23 22:46:13','$2y$10$9dQMRPZe.viW.uuVF2p4W.oPsQBvoWxR7zDM4vBTj5pSRU4Zf4L5e','STUDENT',NULL,'2021-06-23 22:44:43','2021-06-23 22:46:13'),
(796,'jashmineloiza.suwarya@gmail.com','SUWARYA','JASHMIN ELOIZA','PEñONAL','FEMALE','TRANSFEREE','2002-07-16','PAGADIAN CITY ZAMBOANGA DEL SUR','09129299788','jashmineloiza.suwarya@gmail.com','BS CRIM','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Bonifacio','Digson',25894,'2','2021-06-23 22:46:30','$2y$10$DsUOfxgk9LQDtRqRPlAT2.twbzQioFxekNpqJIAb3kY.wevsRtm3i','STUDENT',NULL,'2021-06-23 22:46:03','2021-06-23 22:46:30'),
(797,'chariefem@gmail.com','MAGADAN','CHARIE FE','CLAPANO','FEMALE','NEW','2003-10-22','NAPUROG,TUDELA,MISAMIS,OCCIDENTAL','639097704515','chariefem@gmail.com','GEN  MID','BEED','BLENDED',NULL,'Misamis Occidental','Tudela','Napurog',26314,'Purok 3','2021-06-23 22:55:04','$2y$10$BujeWi..wLjrZHgD77ho7O/egQI0v5F1eAyD3UDbYy3wuo1p6CzRy','STUDENT','4yHRHMQNbbL3ny1FBw09JDJSWxxWmF3BOqAzmQszuiWXciLus5OtI5SsUxK5','2021-06-23 22:46:38','2021-06-23 22:55:04'),
(798,'Alliahmariedanocarpio@gmail.com','CARPIO','ALLIAH MARIE','DANO','FEMALE','NEW','2002-08-09','CLARIN MISAMIS OCCIDENTAL','09391466949','Alliahmariedanocarpio@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'P-1 Lapasan,Clarin,Misamis Occidental',NULL,'$2y$10$JjyBGZEjoch1gDff2AwhF.zx.mRlCoPU3ZaM6Vmevlc8fNtPKg8Ga','STUDENT',NULL,'2021-06-23 22:49:58','2021-06-23 22:49:58'),
(799,'Daphne Sabongan','SABONGAN','DAPHNE','MERCADO','FEMALE','NEW','2002-09-09','PARAISO, MAHAYAG, ZAMBOANGA DEL SUR','09107406035','daphnesabongan2002@gmail.com','BSED','BS CRIM','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'1','2021-06-23 22:54:11','$2y$10$9gzo5DmixnDL1dtzR1Wj4.2RpdE5KJvX9URlIPSZDezn9ZHp9Y0rO','STUDENT',NULL,'2021-06-23 22:53:10','2021-06-23 22:54:11'),
(800,'bagondolmichie@gmail.com','BAGONDOL','MICHIE ANN','CABAHUG','FEMALE','NEW','2001-08-09','BAYOG,ZAMBOANGA DEL SUR','09552766581','bagondolmichie@gmail.com','BEED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Apil',26043,'Purok-2','2021-06-23 23:03:45','$2y$10$hu0av56aPT61x3KBlQOWl.XZHqbYwHyX4mwRnsK22qG9JUPOpVBYy','STUDENT',NULL,'2021-06-23 22:53:19','2021-06-23 23:03:45'),
(801,'arafejumawan','JUMAWAN','ARA FE','A.','FEMALE','NEW','2003-02-21','SILANGA P2 TANGUB CITY','09629217256','arafejumawan22@gmail.com','BSED-ENGL','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Silanga',26282,'Purok 2',NULL,'$2y$10$8hbXk83NfdKx1pFY1qxU3Ozd5yifoabcoJ/ld9w3nHxvGnboep3t2','STUDENT',NULL,'2021-06-23 22:59:13','2021-06-23 22:59:13'),
(802,'Maybealboroto@gmail.com','ALBOROTO','MAYBELINE','LAMPERA','FEMALE','NEW','2002-12-02','BALUC TANGUB CITY','09678358942','Maybealboroto@gmail.com','BS CRIM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Baluk',26237,'2','2021-06-23 23:04:46','$2y$10$dURp4P48pIMRStkzpdt26OAzKNa.0x2H31ZZ4ZpaNsaW3hIV91afu','STUDENT',NULL,'2021-06-23 23:00:38','2021-06-23 23:04:46'),
(803,'kcjeanandales060703','ANDALES','KC JEAN','PAGAYAMAN','FEMALE','NEW','2003-06-07','UPPER LIASON TAMBULIG ZAMBOANGA DEL SUR','09701240929','kcjeanandales060703@gmail.com','BSBA-HRM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Liason',41389,'Purok 2','2021-06-23 23:07:07','$2y$10$scE9W65XsoGuMxTn11MGw.CPm96eMVXSMeJHy92WiCXYf5KdVkXwO','STUDENT',NULL,'2021-06-23 23:06:46','2021-06-23 23:07:07'),
(804,'Sabrinavillalonsala','SALA','SABRINA','VILLALON','FEMALE','NEW','2002-07-30','SANTA ROSA NUEVA ECIJA','09533289205','sabrinasala709@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok-Tarsing','2021-06-23 23:10:48','$2y$10$fZS6OX0e3ZCnAtQcRccn0u6n6AHc5qx.l63OnRVGUx6MHcUtEyCdK','STUDENT',NULL,'2021-06-23 23:10:05','2021-06-23 23:10:48'),
(805,'laisangeline@gmail.com','LAIS','ANGELINE','PESTAñAS','FEMALE','NEW','2002-08-15','GATA DAKU CLARIN MISAMIS OCCIDENTAL','09380023608','laisangeline@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Gata Daku',25942,'Purok 5','2021-06-23 23:15:23','$2y$10$vNjhZJ4VNf0.nlPol.DtduH4yynDW0QkojoXOlGviqpBCdFz6PHea','STUDENT',NULL,'2021-06-23 23:11:31','2021-06-23 23:15:23'),
(806,'Mark Anthony','ABELANO','MARK ANTHONY','ARCOY','MALE','NEW','2003-02-15','KINANGAY SUR CLARIN MIS. OCC.','09511970243','markanthonyabelano03@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Clarin','Kinangay Sur',25946,'Purok 5',NULL,'$2y$10$bY9pjM.dArn0.QUR.iQ/u.SwNpSTfGu3gruTm3/pIDS5RB/jt6tra','STUDENT',NULL,'2021-06-23 23:12:27','2021-06-23 23:12:27'),
(807,'Eden Rose E. Flor','FLOR','EDEN ROSE','ESCABAS','FEMALE','NEW','2003-04-22','TUGAS,TANGUB CITU','09108882312','floredenrose@gmail.com','BSED-MATH','BSED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Bagumbang',25887,'Purok 1-A','2021-06-23 23:15:15','$2y$10$XQhBxklxGKBU4025pPUSQOqnftE4lhci.OvaeSCPZ6Bihpj6fsFku','STUDENT',NULL,'2021-06-23 23:12:28','2021-06-23 23:15:15'),
(808,'rhealyncrosio','CROSIO','RHEA LYN','GARCIA','FEMALE','NEW','2003-06-17','PUROK-5 SINUZA, OZAMIS CITY','09122912873','rhealyncrosio@gmail.com','BSED-MATH','BSED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok-5','2021-06-23 23:24:18','$2y$10$g2koHvO958MI7n238vrEzeAfsv.iZqNpE0x4S0pDyE195uorVj7FW','STUDENT',NULL,'2021-06-23 23:15:10','2021-06-23 23:24:18'),
(809,'Carpioalliah11@gmail.com','CARPIO','ALLIAH MARIE','DANO','FEMALE','NEW','2002-08-09','CLARIN MISAMIS OCCIDENTAL','09391466949','Carpioalliah11@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'P-1 Lapasan,Clarin,Misamis Occidental','2021-06-23 23:24:07','$2y$10$JUA81K/GZKu72nkfaHFnKOrYyEVBnrB6X0jc5NQYbGmJEqto3zOii','STUDENT',NULL,'2021-06-23 23:20:53','2021-06-23 23:24:07'),
(810,'cabandojanneth@gmail.com','CABANDO','JANNETH','','FEMALE','NEW','2001-01-12','OZAMIZ CITY','09506864264','cabandojanneth@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','Baybay San Roque',26096,'Purok 1','2021-06-23 23:21:23','$2y$10$T15..2Ee06G54YxKLXjnCOLmBg8zpvsfij/wCU5qasDckOCYXqtPC','STUDENT',NULL,'2021-06-23 23:20:55','2021-06-23 23:21:23'),
(811,'iantampus20@gmail.com','TAMPUS','CARL IAN','','MALE','NEW','2003-02-02','LAS PIñAS,CAVITE','09515777473','iantampus20@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Lower Usugan',25901,'2','2021-06-24 00:00:46','$2y$10$JtB6Z9dGKRXDBgxFoLHQkua44SGsw10kCcbEeSM8WuoA2DdGuEIIS','STUDENT',NULL,'2021-06-23 23:25:53','2021-06-24 00:00:46'),
(812,'paglinawancarl7@gmail.com','PAGLINAWAN','CARL CRISTENSON','ARNADO','MALE','NEW','2001-11-13','BAROY PROVINCIAL HOSPITAL, LANAO DEL NORTE','09754318499','paglinawancarl7@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Lanao del Norte','Tubod','Pigcarangan',20270,'Purok-1 Baybay Bucana','2021-06-23 23:28:42','$2y$10$avxhliGtPeM1eJwlbAEcSuPH7TTli8V.cGSkwJyjjExquH5ODB602','STUDENT',NULL,'2021-06-23 23:26:15','2021-06-23 23:28:42'),
(813,'Samanthasala','SALA','SAMANTHA','VILLALON','FEMALE','NEW','2002-07-30','SANTA ROSA NUEVA ECIJA','09157076326','Sammyvillalon2418@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok-Tarsing','2021-06-23 23:28:50','$2y$10$8S3ltKCqqDJ8AEKoNFH.xukql.DImgFw8YoDFnpcyBgO.lfqwlMHC','STUDENT',NULL,'2021-06-23 23:27:26','2021-06-23 23:28:50'),
(814,'avancenajessa736@gmail.com','AVANCEñA','JESSA MAE','N/A','FEMALE','NEW','2003-07-03','CANIBUNGAN DAKU, CLARIN, MISAMIS OCCIDENTAL','09633149793','avancenajessa736@gmail.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Clarin','Canibungan Daku',25936,'2','2021-06-23 23:41:40','$2y$10$Uu99HStZ739aRuOhi2.AuunG30z2tDIPTyBmLuu7kiHxcCyg90BWi','STUDENT',NULL,'2021-06-23 23:28:06','2021-06-23 23:41:40'),
(815,'Juvylyn','MEDRANO','JUVYLYN','BALUWENG','FEMALE','NEW','2001-11-24','SAN VICENTE DUMINGAG ZAMBOANGA DEL SUR','09161974309','juvylynmedrano44@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','San Vicente',40959,'Purok-1, Dumingag Zamboanga del sur','2021-06-23 23:38:46','$2y$10$qQDkWT.bUOCuqLLKAWLnIe2Yfg8LOCAoFbvWPp1mazpqnXQiQ.gBC','STUDENT',NULL,'2021-06-23 23:31:15','2021-06-23 23:38:46'),
(816,'Vonvon816','TICLING','VON RANNIEL','NONE','MALE','NEW','2001-08-16','BRGY MOBOD PUROK-6 OROQUIETA CITY MISAMIS OCCIDENTAL','09305776342','vonvonuba@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Oroquieta City','Canubay',26050,'6','2021-06-23 23:42:27','$2y$10$aRzOeYB.ntthYYBkRpbLQuXiSWrHktcA.krjn.9kv4CsKmN7.oc46','STUDENT',NULL,'2021-06-23 23:37:22','2021-06-23 23:42:27'),
(817,'Salting02222','SALTING','DEN JERICH ASHLY','SATURINAS','MALE','NEW','2002-03-03','PUROK 1 TABOO JIM. MIS. OCC.','09516547825','Salting02222@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Purok 1',NULL,'$2y$10$sjwk2FjYBxes6iXcICJM/uYt7wPoH5YtdiQ8gsUsTzG9rtquDmodi','STUDENT',NULL,'2021-06-23 23:38:56','2021-06-23 23:38:56'),
(818,'Sherry Grace Zamora Balus','BALUS','LASHERRY GRACE','ZAMORA','FEMALE','NEW','2001-03-14','ALANG ALANG TAMBULIG','09465785124','gracebalus031401@gmail.com','BSBA-HRM','BEED','BLENDED',NULL,'Zamboanga del Sur','Molave','Makuguihon',41176,'Mabini st','2021-06-23 23:44:54','$2y$10$mxrNopSseCvDJD.J8PcJFunb0PRF58Ra4ZLgLSNCgNVOPs9kbtF9e','STUDENT',NULL,'2021-06-23 23:44:02','2021-06-23 23:44:54'),
(819,'jebbymerida@gmail.com','MERIDA','JEBERLYN','CAPAPAS','FEMALE','NEW','2003-06-14','PUROK KAWAYANAN, SAN ISIDRO, MAHAYAG, ZAMBOANGA DEL SUR','09261817858','jebbymerida@gmail.com','BSED-MAPEH','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Mahayag','San Isidro',41101,'Purok Kawayanan','2021-06-23 23:48:24','$2y$10$TekJ.mZ5TFagWGeu0bpEcutphCEeM3r8ftOhU57xFBt54TimxcVx6','STUDENT',NULL,'2021-06-23 23:44:57','2021-06-23 23:48:24'),
(820,'ayrlglyns@gmail.com','SUMALINOG','AYRL GLYN','BALAIS','MALE','NEW','2003-01-23','MIDSALIP ZAMBOANGA DEL SUR','09278587633','ayrlglyns@gmail.com','BSED-ENGL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Tudela','Bongabong',26293,'3','2021-06-23 23:57:46','$2y$10$qS4ANCrm/H9LFo8nTLDyDO.ceamsGckNdetHhnsZEKVR/YI0V0MJe','STUDENT',NULL,'2021-06-23 23:56:49','2021-06-23 23:57:46'),
(821,'Jehonieangelgomez@gmail.com','GOMEZ','JEHONIE ANGEL','BATLAG','FEMALE','NEW','2003-07-29','CLARIN MISAMIS OCCIDENTAL','09391466949','Jehonieangelgomez@gmail.com','BSOA','GEN  MID','BLENDED',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'P-1 Pan-ay,Clarin,Misamis Occidental',NULL,'$2y$10$2y6x37iKXhDs86l7lXw37OJEu4QrMfxNJOrmCEap0Otc/mhhfjmDa','STUDENT',NULL,'2021-06-23 23:57:39','2021-06-23 23:57:39'),
(822,'Jehonieangelg@gmail.com','GOMEZ','JEHONIE ANGEL','BATLAG','FEMALE','NEW','2003-07-29','CLARIN MISAMIS OCCIDENTAL','09391466949','Jehonieangelg@gmail.com','BSOA','GEN  MID','BLENDED',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'P-1 Pan-ay,Clarin,Misamis Occidental','2021-06-24 00:07:30','$2y$10$f7OJDOIiJwVQhBZrIAwEWOvD0iX4tvuinzrwfI55d3eVGgAtUVtkm','STUDENT',NULL,'2021-06-24 00:06:56','2021-06-24 00:07:30'),
(823,'CJ B. Patria','PATRIA','CJ','BUGAS','MALE','NEW','2003-04-07','SINACABAN','09454656736','Cjpatria04@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Libertad Bajo',26226,'Purok Casoy 2','2021-06-24 00:14:48','$2y$10$dGP3Jbbt/BFM8Ozur07pCewVqGe2TyO/k.ChZMsU3DSv8AqB1sKr.','STUDENT',NULL,'2021-06-24 00:13:48','2021-06-24 00:14:48'),
(824,'Marchissamae Alforque','ALFORQUE','MARCHISSAMAE','COLANGGO','FEMALE','NEW','2002-03-18','MHTA','Mhar\'s Gen','alforquemarchissamae@gmail.com','BSED-ENGL','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok-8',NULL,'$2y$10$c4Ai0YzupO7DZSvesCPe/.OxkR8jHuFB8dANXHqKBGCacZlVbprmS','STUDENT',NULL,'2021-06-24 00:36:22','2021-06-24 00:36:22'),
(825,'Alforque Marchissa Mae','ALFORQUE','MARCHISSA MAE','COLANGGO','FEMALE','NEW','2002-03-18','MHAR\'S GEN','09078726408','marchissamaealforque@yahoo.com','BSED-ENGL','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok-8',NULL,'$2y$10$QmFV9ypyLBjis3rBd3nGueTu/wuSL/Fwpjph9Mz0Bxkgrd9E6fI2i','STUDENT',NULL,'2021-06-24 01:19:36','2021-06-24 01:19:36'),
(826,'anghelitaaa','ENRIQUEZ','ANGEL JHEMA RHAYE','FLORES','FEMALE','NEW','2003-08-26','UPPER LODIONG,  TAMBULIG,  ZAMBOANGA DEL SUR','09562507304','angel.flrs.nrqz@gmail.com','AB POLSCI','AB COMM','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Upper Lodiong',41390,'2','2021-06-24 01:46:14','$2y$10$TXTiw/dPPvMBSYtQMZOvJOSxuusN6mKj3PugIb8VrpRBZQTEZnEXO','STUDENT',NULL,'2021-06-24 01:45:31','2021-06-24 01:46:14'),
(827,'MislosRenn','MISLOS','RENNALOU','N/A','FEMALE','NEW','2002-09-11','MOLAVE, ZAMBOANGA DEL SUR','09128833899','rennaloumislos@gmail.com','BSCS','BSED','BLENDED',NULL,'Zamboanga del Sur','Molave','Maloloy-On',41177,'Dahlia','2021-06-24 02:07:49','$2y$10$WJ/15VQrWq977ybiCeOBquj.rm08aIdQyI/H886V5SwkyAfmAXDSS','STUDENT',NULL,'2021-06-24 02:07:19','2021-06-24 02:07:49'),
(828,'Jennifer Jamisola','JAMISOLA','JENNIFER','CUARESMA','FEMALE','NEW','1995-04-26','TIGBAO ZAMBOANGGA DEL SUR','09483419982','jenniferjamisola01@gmail.com','BSBA-HRM','BEED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'Purok 2',NULL,'$2y$10$5wTnEyRbAtzwF0FEQSYDj.OPsJTZCzQjkvsVbARE0rkSe6AdTIn2G','STUDENT',NULL,'2021-06-24 02:17:43','2021-06-24 02:17:43'),
(829,'Karenarbuis','ARBUIS','KAREN JOY','MONTUERTO','FEMALE','NEW','2002-12-21','GUNTING, BARILI, CEBU','09977506243','karenmontuertoarbuis@gmail.com','BSED-MATH','BSCS','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Bag-Ong Tabogon',41364,'Purok 1 - Matinabangon','2021-06-24 02:51:50','$2y$10$sKpr3fZi0ELPaQAkk4R0s.j4Pf5UVjFvBlEVplSFCXoMcdo4/vXfi','STUDENT',NULL,'2021-06-24 02:45:14','2021-06-24 02:51:50'),
(830,'naranjomaryrose19@gmail.com','NARANJO','MARY ROSE','DEL SOCORRO','FEMALE','NEW','2002-10-19','KAUSWAGAN TANGUB CITY','09305430450','naranjomaryrose19@gmail.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Kauswagan',26257,'5','2021-06-24 06:12:47','$2y$10$fAuRtaezPa6cVCoAhaNLcuZRkYkY0ve4XhWaxLdBmNTQNWoShH0gK','STUDENT',NULL,'2021-06-24 03:38:48','2021-06-24 06:12:47'),
(831,'raymondjayson030@gmail.com','JAYSON','RAYMOND','RANILE','MALE','NEW','2002-01-09','PULOT, OZAMIZ CITY','09054911447','raymondjayson030@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Dimaluna',26110,'Purok-1 Dimaluna','2021-06-24 04:12:44','$2y$10$4fF4G/QWSgi2KFDcNeiKgumLdBFNEFFb2REVJVYSPjB5YCXapffEC','STUDENT',NULL,'2021-06-24 04:11:39','2021-06-24 04:12:44'),
(832,'riveroedralyn016@gmail.com','RIVERO','EDRALYN','ESCUADRO','FEMALE','NEW','2003-04-19','SINUSA OZAMIZ CITY','09679945311','riveroedralyn016@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'P-6','2021-06-24 04:46:31','$2y$10$TCJ1gBCD02kDLZbrftSSoe/8JR4dY6MzVUbpfF3Y0bqbKjuFv16vG','STUDENT',NULL,'2021-06-24 04:45:15','2021-06-24 04:46:31'),
(833,'Angelou Yangan','YANGAN','ANGELOU','FUENTES','MALE','NEW','2003-01-24','MOLAVE ZAMBOANGA DEL SUR','09121641858','yangan.angelou2003@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Molave','Rizal',41180,'Purok Uranus','2021-06-24 05:00:30','$2y$10$RJ95nkEKNPy8jWtFCFUhKuSDab2CMdQtBrHRRM.5yq09suo2cdrb2','STUDENT',NULL,'2021-06-24 04:59:37','2021-06-24 05:00:30'),
(834,'Villavelezregjane2002@gmail.com','VILLAVELEZ','REGJANE','FEROLINO','FEMALE','NEW','2002-08-24','BALOK SINDANGAN ZAMBOANGA DEL NORTE','09519438104','villavelezregjane2002@gmail.com','BSBA-MM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Diguan',26109,'Purok 7','2021-06-24 05:25:28','$2y$10$VcXT9TdcG1Ub51Nr5Vw4suuHZIfp9g/fsXkvjzHPeLszH2gKNMoTC','STUDENT','1Ahs1pehFOn0TQggQ6ZydeMpRbx5WPJrxByG1hEIl5DZk7nRvdoZxRrb28Og','2021-06-24 05:16:21','2021-06-24 05:25:28'),
(835,'Felinesiarez@gmail.com','SIAREZ','MA. ANGELA FELINE','TRADIO','FEMALE','NEW','2003-01-03','DOñA MARIA D.TAB','09362360349','felinesiarez@gamil.coom','GEN  MID','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','Tituron',26287,'Purok -2',NULL,'$2y$10$xWTmaDSyqmXPyulnLtAQJuL9KW6/RpZBGsvxWGFxHN6ovoC6CzixS','STUDENT',NULL,'2021-06-24 05:31:18','2021-06-24 05:31:18'),
(836,'Reneboy ramayrat quijano jr.','QUIJANO','RENEBOY','GANDALON','MALE','NEW','2001-05-18','MHARS GEN','09317583519','eppiecasas1@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Ozamis City','Molicay',26130,'P-1',NULL,'$2y$10$GzgeACTOuKK2uatbbwY.NOw882O.IHVVne1F4HwFG8XbDqg9yp5A.','STUDENT',NULL,'2021-06-24 05:36:07','2021-06-24 05:36:07'),
(837,'dymarktugahan@gmail.com','TUGAHAN','ANDY MARK','LUMANTAS','MALE','NEW','2001-07-12','CARMEN, JIMENEZ, MISAMIS OCCIDENTAL','09058166083','mardylynlumantastugahan@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Jimenez','Carmen',25993,'Purok 5',NULL,'$2y$10$tkRSVwbyHXh8mm2bQxyxCeVtShr5DtjWb7cbD1fFeEElZEhad0t7O','STUDENT',NULL,'2021-06-24 05:42:29','2021-06-24 05:42:29'),
(838,'Euriel','LONGCOB','EURIEL','UNABIA','MALE','NEW','2002-01-02','PUROK-7, MALINGAO, TUBOD, LANAO DEL NORTE','09304390261','dodongzchannelvlog@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Tubod','Malingao',20267,'Purok 7','2021-06-24 10:59:08','$2y$10$llG2wa329EYFGauyjO0mlOF/bAXn9/bcu4JeCXPPDYOykHCQNbzEa','STUDENT',NULL,'2021-06-24 05:51:48','2021-06-24 10:59:08'),
(839,'pearlmutia0@gmail.com','MUTIA','PEARL JOY','DELOS REYES','FEMALE','NEW','2002-07-31','PAGADIAN CITY','09053413590','pearlmutia0@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','San Vicente',26277,'Purok 1','2021-06-24 06:19:22','$2y$10$JzYPFC44GmipxIoI2T4Hv.LncTEVA0XPp98sW/aAwwrPeIav3wMXy','STUDENT',NULL,'2021-06-24 06:03:08','2021-06-24 06:19:22'),
(840,'Imie Fe Hoyohoy','HOYOHOY','IMIE FE','MARPE','FEMALE','NEW','2003-06-20','P-3 MIALEN,CLARIN,MISAMIS OCCIDENTAL','09097997348','imiefe.yahoo.com@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Clarin','Mialen',25951,'P-3',NULL,'$2y$10$jmG/UW0iETLYvFDlJ0RmA.97k/4XrIdXpAV5B9ctlDzJl7Whw88hm','STUDENT',NULL,'2021-06-24 06:03:59','2021-06-24 06:03:59'),
(841,'siarezfeline143@gmail.com','SIAREZ','MA. ANGELA FELINE','TRADIO','FEMALE','NEW','2003-01-10','TANGUB CITY','09667441879','estrosasanastacio@gmail.com','GEN  MID','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'Purok 2',NULL,'$2y$10$SnrBZOTQxapW8BsFydKF2..tpvZGgUTA6T9Shyt2ZBqAgk0uHfk6C','STUDENT',NULL,'2021-06-24 06:08:28','2021-06-24 06:08:28'),
(842,'cristelbarrientos317@gmail.com','BARIENTOS','CRISTEL JOYCE','VILLAMERO','FEMALE','TRANSFEREE','2003-05-29','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09362653648','cristelbarrientos317@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok 3','2021-06-24 06:21:08','$2y$10$UVERUzVLomDkOKGjXweq5efGVS4UpxVD6VswR44vzUz53SCIJMDvq','STUDENT',NULL,'2021-06-24 06:17:13','2021-06-24 06:21:08'),
(843,'Guingay','CAMELOTES','GUINGAY','NANO','FEMALE','NEW','2001-05-31','MAHAYAG, ZAMBOANGA DEL SUR','09700396321','danghilgegay@gmail.com','BSCS','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Sicpao',41105,'Purok6','2021-06-24 06:23:35','$2y$10$kevT3m7N.UAW7m.x3oKNvuOtpNC3GAXefookcixkVy5/lD4iwvgtm','STUDENT',NULL,'2021-06-24 06:19:17','2021-06-24 06:23:35'),
(844,'jake143@gmail.com','ESTROSAS','JAKE RAFUNZEL','TORRES','MALE','NEW','2003-05-24','TANGUB CITY','09468849639','applesiarez143@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay VI - Lower P',26244,'Purok 1',NULL,'$2y$10$nHeqRQ3WfzlgFpWofrPBW.nxHyuV7DaWo0rtwJOImsomSTfZ1XfRG','STUDENT',NULL,'2021-06-24 06:21:29','2021-06-24 06:21:29'),
(845,'Jeanie','LLAVADO','JEANIE','MIRAFUENTES','FEMALE','NEW','2002-01-12','BAGUNGBANG BONIFACIO MIS.OCC','09957411016','llavadojeanie311@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Lower Dimorok',41173,'4 Lower Dimorok Molave ZDS','2021-06-24 06:24:15','$2y$10$ta1aFnmIkYyufHC66NlVgeOd1nQTV8avetp7xLHkysVu/XAZKbJkK','STUDENT',NULL,'2021-06-24 06:23:14','2021-06-24 06:24:15'),
(846,'jessamaealbarico','ALBARICO','JESSA MAE','YAGAO','FEMALE','NEW','2003-09-15','SUDLON MOLAVE ZAMBOANGA DEL.SUR','09382071216','jessamaealbarico@gmail.com','BSOA','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Molave','Sudlon',41184,'Purok1','2021-06-24 06:33:05','$2y$10$YMvLcu2C/JdmfqS9IQdoC.XSssu1fO5VLv9DszEfMwoF97oBrB77m','STUDENT',NULL,'2021-06-24 06:27:16','2021-06-24 06:33:05'),
(847,'gianniscalvin12@gmail.com','DAYONDON','LADY JOYCE','MALISA','FEMALE','TRANSFEREE','2000-12-04','DIGU-AN, OZAMIZ CITY','09105316943','gianniscalvin12@gmail.com','BSED-SOCSTUD','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Diguan',26109,'Purok 7','2021-06-24 06:29:17','$2y$10$MgcyQJshXvCJg/XYW7YFuemUfe.623obd3dKoapo3eojz7uEZ24UC','STUDENT',NULL,'2021-06-24 06:28:42','2021-06-24 06:29:17'),
(848,'mariviclabigan36@gmail.com','LABIGAN','MARIVIC','B.','FEMALE','NEW','2021-06-24','MONTOL BONIFACIO MISAMIS OCCIDENTAL','09066632625','mariviclabigan36@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Ozamis City','50th District',26090,'Purok 3',NULL,'$2y$10$sTPOVswxpwP0QMJq.ZPmXebSP3n7GMMmuxN2KeUondm9DQ5KY.Gd6','STUDENT',NULL,'2021-06-24 06:41:09','2021-06-24 06:41:09'),
(849,'Jeny_D','DOMINGUEZ','JENYFEIR','WASAWAS','FEMALE','NEW','2003-05-16','SINACABAN, MISAMIS OCCIDENTAL','09362146958','jenyfeirdominguez@gmail.com','BS CRIM','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Purok Arfican Daisy','2021-06-24 06:42:19','$2y$10$uqp1p4BTvHoqx7LGPypMG.UXa/tJRR2lAtOeBla/6KTP8qsW.Df0S','STUDENT',NULL,'2021-06-24 06:41:10','2021-06-24 06:42:19'),
(850,'Anthunmark@gmail.com','CANONEO','ANTHUN MARK','CURAMBAO','MALE','NEW','2002-01-06','OZAMIZ CITY','09264154157','anthunmark@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Nabuna',25856,'P-2','2021-06-24 06:51:07','$2y$10$KP.b76xTZ0sieLeXS7i/gOQvWBKDMBsZebYCbze.snjj7EQTfWTdO','STUDENT',NULL,'2021-06-24 06:46:06','2021-06-24 06:51:07'),
(851,'Arcamo','ARCAMK','HERMAI','PANTUHAN','FEMALE','NEW','2002-05-20','DIMALCO BONIFACIO MISAMIS OCCIDENTAL','0975 495 4913','hermaiarcamo@yahoo.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Dimalco',25895,'Purok 3 dimalco',NULL,'$2y$10$hH1nRj1rgtvivfEUCMAr1OrI9l68QanGcYK/WcrbFqiRtnn0yuJwO','STUDENT',NULL,'2021-06-24 06:51:57','2021-06-24 06:51:57'),
(852,'marjohvalmaniwang@gmail.com','MANIWANG','MARJOHVAL','CALAMBA','MALE','NEW','2002-02-14','OZAMIZ CITY','09481379892','marjohvalmaniwang@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Sinacaban','Dinas',26222,'Purok-6','2021-06-24 06:56:43','$2y$10$UfyfLJEzfhQUe/tFj9uo/.i1ZHMCPtKCPCYmPskdPLwkaZMYraI0.','STUDENT',NULL,'2021-06-24 06:56:13','2021-06-24 06:56:43'),
(853,'Airine Fuertes','FUERTES','AIRINE','SIMENE','FEMALE','NEW','2003-03-11','KINUMAN NORTE, OZ. CITY','09307731598','fuertesairine66@gmail.com','BSBA-MM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Ozamis City','Kinuman Norte',26119,'P-1 Kinuman Norte','2021-06-24 07:03:18','$2y$10$VYHtlaEZqLFVLQa5mYXdOOKgL1StaTOB.bCQ2P8OodBOTeXTms2om','STUDENT',NULL,'2021-06-24 06:59:34','2021-06-24 07:03:18'),
(854,'gelayalferez31@gmail.com','ALFEREZ','ANGEL MAE','ALBIOS','FEMALE','NEW','2002-07-31','MIGCANAWAY, TANGUB CITY','09639357250','gelayalferez31@gmail.com','GEN  MID','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Migcanaway',26267,'Maaba',NULL,'$2y$10$mUiAfyOQ3RtHvQCP3KfNM.lE2rvj36kj2LfTL111n/.Cj/M6iOG36','STUDENT',NULL,'2021-06-24 07:01:18','2021-06-24 07:01:18'),
(855,'angelica rivera','RIVERA','ANGELICA','MABAGA','FEMALE','NEW','2001-11-26','UPPER DIMOROK MOLAVE ZAMBOANGA DEL SUR','09304416404','angelicamabagarivera@gmail.com','BSOA','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Purok 4/Lakatan','2021-06-24 07:04:00','$2y$10$J6wuNpVxLF60HT1A.6GwpehnlihxbmzGYiC3g76Qp7ZpIsx3KQbJS','STUDENT',NULL,'2021-06-24 07:02:42','2021-06-24 07:04:00'),
(856,'Ktlyn','DEGAMO','KATLYN','HASSAN','FEMALE','NEW','2003-01-24','REMEDIOS, BONIFACIO, MISAMIS OCCIDENTAL','09054911992','katlyndegamo124@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'P-2 Sitio Kabulihan','2021-06-24 07:14:38','$2y$10$T5wl0h1B.etoo4nfeoSXKeKA5BngHPKDDUEo5W7nBMx4xIBzKlgwm','STUDENT','CMbr8ByR50DYrzMvGQA2ilKjIWlh4NAis0GNyQc4OOrkGeARVX1vOZVNYP1I','2021-06-24 07:10:09','2021-06-24 07:14:38'),
(857,'juliemaemalinaodignum@gmail.com','DIGNUM','JULIE MAE','MALINAO','FEMALE','NEW','2003-07-14','MHARS REGIONAL TRAINING AND TEACHING HOSP. OZAMIZ CITY MIS.OCC','09515753150','juliemaemalinaodignum@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Sumirap',26285,'Baybay Bonifacio purok 1','2021-06-24 07:26:27','$2y$10$iYmEdzjvPvgsu/U8sp1OSeaZ2NlJKwJ/Sg5Di9qQPh/Ggjg7uEsOu','STUDENT',NULL,'2021-06-24 07:13:14','2021-06-24 07:26:27'),
(858,'hanshinebibi','ALFARO','HANSHINE CAMILLE','CAñETE','FEMALE','NEW','2001-08-15','BONGBONG OZAMIZ CITY','09276190447','hanshinebibi@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-3 Bongbong',NULL,'$2y$10$3dUqB/oDMZS2x0QFmdEMguNDpENvGOpBb8ivL1xe0PseF/wJueNMm','STUDENT',NULL,'2021-06-24 07:17:35','2021-06-24 07:17:35'),
(859,'Rowelyn Regis','REGIS','ROWELYN','BERIOSO','FEMALE','NEW','2003-03-03','TUSIK, BONIFACIO, MISAMIS OCCIDENTAL','09682083152','regisrowelyn@gmail.com','AB ENGLISH','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tusik',25912,'Purok 1','2021-06-24 09:38:31','$2y$10$pGz3YZjirTQhI59g1k5.TOKSbxPRi8VVminnTpxnnifHqioJJtWtu','STUDENT',NULL,'2021-06-24 07:19:49','2021-06-24 09:38:31'),
(860,'Adelfa Tenio','TENIO','ADELFA','JUNIO','FEMALE','NEW','2003-08-13','UPPER BICUTAN TAGUIG CITY','09516551266','adelfatenio123@gmail.com','BSED','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Clarin','Canibungan Daku',25936,'Purok 2','2021-06-24 07:22:27','$2y$10$vJZGP9DdDYcshtj/TBsNIu58QrSVXKGQCwi6cbPcr66JgeL5VOmT2','STUDENT',NULL,'2021-06-24 07:21:44','2021-06-24 07:22:27'),
(861,'Kimkimsumalpong2@gmail.com','SUMALPONG','EULYMAE','TANASAC','FEMALE','NEW','1998-01-27','DAWA JOSEFINA ZAMBOANGA DEL SUR','09278586266','Kimkimsumalpong2@gmail.com','BSED-MAPEH','BSED-MAPEH','FULL ONLINE',NULL,'Zamboanga del Sur','Josefina','Dawa',40985,'purok 3 mahogany','2021-06-24 07:26:07','$2y$10$fEghqVCq8u9MW486CeX4sOLU3nUJL3ETfHDfQgGIMBGggur4caKw.','STUDENT',NULL,'2021-06-24 07:22:29','2021-06-24 07:26:07'),
(862,'Reysilen','PONCE','REYSILEN','BALUNSO','FEMALE','NEW','2001-04-20','TAGPOS BINANGONAN RIZAL','09513963381','reysilen420@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Tumapic',41108,'Purok 3 Gumamela','2021-06-24 07:25:22','$2y$10$ixkop6lbH8Z3DfOXR5rL0OSA2DO4m2.YeaWleppN3y4soMaIMBBDW','STUDENT',NULL,'2021-06-24 07:23:21','2021-06-24 07:25:22'),
(863,'AB SERASPE','SERASPE','ABIGAIL','MAJORENOS ORENOS','FEMALE','NEW','2003-07-29','PUROK 6, BONIAO, MAHAYAG, ZAMBOANGA DEL SUR','09169079779','abseraspe@gmail.com','BSCS','AB ENGLISH','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Boniao',41084,'Purok 6','2021-06-24 07:26:29','$2y$10$dRfvPQq2vt6ygIswDweleeBWkFzz6YY3kS1MebdHMkYxmxLszwxU6','STUDENT',NULL,'2021-06-24 07:25:38','2021-06-24 07:26:29'),
(864,'JEspinosa','ESPINOSA','JUNREY','LUBAY','MALE','NEW','1997-06-30','OZAMIZ CITY','09511708341','crissnatania@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Malaubang',26126,'Purok 6','2021-06-24 07:28:44','$2y$10$rH.KAEJav8kVJRxrHxRCYeYTmHiHcdseTqzEs2wL0IxY.TPsH7ZIa','STUDENT',NULL,'2021-06-24 07:27:16','2021-06-24 07:28:44'),
(865,'CBridgette92','COTINGJO','HONEY BRIDGETTE','LLAGAS','FEMALE','NEW','2002-09-02','P7, KINANGAY NORTE, CLARIN, MISAMIS OCCIDENTAL','09567636997','Cotingjo.b@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Kinangay Norte',25945,'7','2021-06-24 07:32:37','$2y$10$m7RDh92iix2TZuvSmedOXOdkV5Tvhe863R4xEECuOdUey.BqZVSW6','STUDENT',NULL,'2021-06-24 07:28:11','2021-06-24 07:32:37'),
(866,'charlesmars.dungog@gmail.com','DUNGOG','CHARLES MARS','DAYONDON','MALE','NEW','2002-05-15','OZAMIS CITY, MISAMIS OCCIDENTAL','09667433241','charlesmars.dungog@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'P2','2021-06-24 07:31:28','$2y$10$G1pecIeUgFg1ZtggvStsmO39EztAdOWGpRphncwjkzexZXY/ZgTjS','STUDENT',NULL,'2021-06-24 07:29:41','2021-06-24 07:31:28'),
(867,'Jayannjalalon@gmail.com','GUTIERREZ','JAY ANN','BALANSAG','FEMALE','NEW','2002-07-16','SAS MUAN PAMPANGA','09381711575','Jayannjalalon@gmail.com','BSED-MAPEH','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Clarin','Cabunga-An',25935,'Purok 2','2021-06-24 07:46:56','$2y$10$XOEJ6g.6p5d68p3IHzu8jepi4uFMt3OrHpVn0fPQ9BBP7N6xyP.1S','STUDENT',NULL,'2021-06-24 07:33:12','2021-06-24 07:46:56'),
(868,'nadinekaterivera28','RIVERA','NADINE KATE','DANDAN','FEMALE','NEW','2002-11-16','UPPER DIMOROK MOLAVE ZAMBOANGA DEL SUR','09639656060','nadinekaterivera28@gmail.com','BEED','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Molave','Upper Dimorok',41185,'Purok-5/lansones','2021-06-24 07:33:52','$2y$10$ouYk4325fHFmusuZQ7uxUOjEgMnhhE/dhLp4d3e.zf9lbF/s4DS2K','STUDENT',NULL,'2021-06-24 07:33:16','2021-06-24 07:33:52'),
(869,'Mariane M. Udal','UDAL','MARIANE','MANULAT','FEMALE','NEW','2021-11-19','BULACAN','09488428730','marianeudal988@gmail.com','BSED-MAPEH','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Clarin','Cabunga-An',25935,'Purok4','2021-06-24 07:41:53','$2y$10$GY02kzXrcnqZQTkCVSetyuOm3o9LPuTZQkRfBRTxPSw4Vhlw.vC1e','STUDENT',NULL,'2021-06-24 07:33:30','2021-06-24 07:41:53'),
(870,'sheenajoypepito@gmail.com','PEPITO','SHEENA JOY','SALUTA','FEMALE','NEW','2003-12-25','PANAGAAN, MAHAYAG, ZAMBOANGA DEL SUR','09106593913','sheenajoypepito@gmail.com','BSED-SOCSTUD','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Panagaan',41096,'3','2021-06-24 07:36:15','$2y$10$Zd.9lbXWvANqp61yeR.7re55HvhftfuYY1B23OxUM9ED0jmoU6gYG','STUDENT',NULL,'2021-06-24 07:34:55','2021-06-24 07:36:15'),
(871,'Keytchey23','LAUZA','KITCHIE','','FEMALE','NEW','2002-11-23','GATA DIOT','09501111131','kitchielauza23@gmail.com','BEED','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Gata Diot',25943,'Purok 4','2021-06-24 07:38:11','$2y$10$X7p7gRadStrHycjnkM7qZOxsUolTULezrdlL1/2iPva/Xhb1KI2LG','STUDENT',NULL,'2021-06-24 07:35:26','2021-06-24 07:38:11'),
(872,'jaylordanquira86','ANQUIRA','JAYLORD','ALIA','MALE','NEW','2002-05-01','BAYOG, ZAMBOANGA DEL SUR','09383073351','jayalia86@gmail.com','BSED-ENGL','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lupagan',25948,'Purok 5','2021-06-24 07:42:32','$2y$10$C6NrRFJsjdcBUa897DEnI.dp7giaFg7av1GE85okLiBTj8zJ1fz0i','STUDENT',NULL,'2021-06-24 07:37:28','2021-06-24 07:42:32'),
(873,'jaylemaevilliamor@gmail.com','VILLAMOR','JAYLE MAE','NERI','FEMALE','NEW','2001-09-12','PAITON TANGUB CITY','09052172238','jaylemaevilliamor@gmail.com','BSED-FIL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Tangub City','Paiton',26270,'7','2021-06-24 07:40:52','$2y$10$0cjggI.DHB90/s6q/pI3e.xj1gEIm4nMTkmGDgnVfhn3ddvAxtvZ2','STUDENT',NULL,'2021-06-24 07:37:35','2021-06-24 07:40:52'),
(874,'Rhea Bente','BENTE','RHEA','LAMESA','FEMALE','NEW','2002-06-19','SINACABAN MISS. OCC.','09512673024','rheabente19@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Sinacaban','Libertad Bajo',26226,'Casoy 1','2021-06-24 07:41:51','$2y$10$mfQMoCRjwdltAvxfyQv.2uizXYIQLPgWLmEQMEPKEl025SXnZAoLC','STUDENT',NULL,'2021-06-24 07:39:53','2021-06-24 07:41:51'),
(875,'graceannecinco7@gmail.com','CINCO','GRACE ANNE','','FEMALE','NEW','2003-08-06','SINUSA , OZAMIZ CITY','09362381701','graceannecinco7@gmail.com','BSED-MATH','BSED-MATH','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Purok 6','2021-06-24 07:41:44','$2y$10$VMKFG5/vkkm0Gfvrbfug5ecAtIBuaNpRF/jm2bhfB3.jP/Xh8MU76','STUDENT',NULL,'2021-06-24 07:40:49','2021-06-24 07:41:44'),
(876,'everlyolor@gmail.com','OLOR','EVERLY','SUHAY','FEMALE','NEW','2002-03-29','POB.MAHAYAG ZAMBOANGA DEL SUR','09750391910','everlyolor@gmail.com','BSBA-HRM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 5,poblacion mahayag zamboanga del sur',NULL,'$2y$10$c.Pd10H0rYt8rYiuggIjkuasmLqPMQtyHVC8DoF04oNtgu/ixoKwS','STUDENT',NULL,'2021-06-24 07:42:33','2021-06-24 07:42:33'),
(877,'melviesjhon@gmail.com','MALUTO','ELVIES JHON','OLINARES','MALE','NEW','2001-05-22','P-1, BONGBONG, OZAMIS CITY','09381313305','melviesjhon@gmail.com','BSED-MATH','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1','2021-06-24 07:47:42','$2y$10$blIfvlyNA.UTm7eiN/LwGe2ehNdP/uh2lKVrbxv4/XlxoRfHw6ACi','STUDENT',NULL,'2021-06-24 07:45:04','2021-06-24 07:47:42'),
(878,'Molde Sheena','MOLDE','SHEENA MAE','AYING','FEMALE','NEW','2002-04-23','POB. SND LDN','09279861034','sheenamaemolde195@gmail.com','BSBA-MM','BEED','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay III- Market',26241,'2','2021-06-24 07:55:48','$2y$10$9GEGoCVv6t1yyPwzfDi4zeFiC1xQnwzVK4tdta1VEMrroXELhn3A2','STUDENT',NULL,'2021-06-24 07:50:06','2021-06-24 07:55:48'),
(879,'Christelmaesumalinog','SUMALINOG','MARIA CHRISTEL MAE','SENO','FEMALE','NEW','2003-09-23','KATIPUNAN RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09550552149','sumalinogchristelsumalinog@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Katipunan',41266,'Purok 1A',NULL,'$2y$10$TKwnsIMzolb4xLP0.v10pOiKLEeWIGIgAypXnL4OpZQI10RnuSwZO','STUDENT',NULL,'2021-06-24 07:50:31','2021-06-24 07:50:31'),
(880,'Shierlene143','SARIGUMBA','SHIERLENE','ATES','FEMALE','NEW','2003-02-11','BONGBONG OZAMIZ CITY MISAMIS OCCIDENTAL','09632873280','sarigumbashierlene@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1',NULL,'$2y$10$P.izjkRDZ6Mifj6Yy.QlROsI.pKPJ./ivMQGVv6K5Al3drn7JG2Oi','STUDENT',NULL,'2021-06-24 07:51:46','2021-06-24 07:51:46'),
(881,'Sarahmay20','MAGSOLING','SARAH MAY','DAWIS','FEMALE','NEW','2001-05-20','PARAISO MAHAYAG, ZAMBOANGA DEL SUR','09309532796','sarahmaydawis20@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Aguada',26091,'Purok 5 Circumferential Road Aguada Ozamiz City','2021-06-24 07:52:55','$2y$10$1Lp3rdF8V4vanEQ3bmNQoOziZz9J5ZcpGdtSRy2pgxURuEMyD7LRG','STUDENT',NULL,'2021-06-24 07:51:51','2021-06-24 07:52:55'),
(882,'dencil15','DUMPA','DENCIL MARIE','CARTAJENAS','FEMALE','NEW','2003-08-15','SEBASI, CLARIN MISAMIS OCCIDENTAL','09317583876','dencilmaried@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sangay Daku',26134,'Purok 3','2021-06-24 08:02:11','$2y$10$U5X7EcylK31dq4vc2I4YS.4B1/U2ZeorICl.LJNvASTMux6DGYpkO','STUDENT',NULL,'2021-06-24 07:51:53','2021-06-24 08:02:11'),
(883,'Irish Potestas','POTESTAS','IRISH','CAGAS','FEMALE','NEW','2003-01-13','BALUC TANGUB CITY','09978665865','potestasirish@gmail.com','BSED-FIL','BSED','BLENDED',NULL,'Misamis Occidental','Tangub City','Baluk',26237,'Purok 3','2021-06-24 07:59:58','$2y$10$/eOYNmjyYqRBFbRy2E2wZOBtTNrs9rKmuoguUgOG5eKA6NLl86pEi','STUDENT',NULL,'2021-06-24 07:53:52','2021-06-24 07:59:58'),
(884,'angelgriffinbatlagomar@gmail.com','BATLAG','ANGEL GRIFFIN','','FEMALE','NEW','2002-11-03','PUROK-2, PAN-AY, CLARIN MISAMIS OCCIDENTAL','09303700585','angelgriffinbatlagomar@gmail.com','BSED-MATH','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'Purok-2','2021-06-24 07:58:55','$2y$10$/bF0ZMHuMOKAyUNQ77UoVO1lWiT8jvMFdfcJtAKchSPcg5sI2gPqe','STUDENT',NULL,'2021-06-24 07:56:08','2021-06-24 07:58:55'),
(885,'Jubbel Secuya','SECUYA','JUBBEL','ALFORQUE','FEMALE','NEW','2003-04-25','BALATACAN, TANGUB CITY','09464790809','secuyajubbel@gmail.com','AB ENGLISH','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Balatacan',26236,'Lambay','2021-06-24 07:57:13','$2y$10$ZI4ptN27y11oVuYZ3pNIz.D68Tu8NkeT4Z82uwNyxAbcZqtxax5R2','STUDENT',NULL,'2021-06-24 07:56:32','2021-06-24 07:57:13'),
(886,'Jermie Lagata','LAGATA','JERMIE','MUTIA','MALE','NEW','1999-04-19','TUGAYA ALORAN MISAMIS OCCIDENTAL','09503430288','lagatajermie@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Tugaya',25869,'Purok2','2021-06-24 08:19:37','$2y$10$HtGi7dFPDszmRDmkk2eYLONYm9yPI3/d3yppFqynGp952H/jmhlU.','STUDENT',NULL,'2021-06-24 07:57:21','2021-06-24 08:19:37'),
(887,'Kuyaje','TACTACON','JERICHO','BANGCOLONGAN','MALE','NEW','2001-12-24','P-3 PAN AY DIOT TUDELA, MISAMIS OCCIDENTAL','09639259031','tactaconjericho4@gmail.com','BSED-ENGL','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Pan-Ay Diot',26315,'Purok-3','2021-06-24 07:59:31','$2y$10$PNSNqicwQBhpeW3300w4QeSBnkoTocQHhPFtUQuh7eJz6ftCCQqyu','STUDENT',NULL,'2021-06-24 07:57:59','2021-06-24 07:59:31'),
(888,'edenlingolingo@gmail.com','LINGOLINGO','EDEN MAY','VIñA','FEMALE','NEW','2002-09-23','NAPUROG, TUDELA MISAMIS OCCIDENTAL','09552766262','edenlingolingo@gmail.com','BEED','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tudela','Napurog',26314,'Purok 3','2021-06-24 08:01:12','$2y$10$9h0HzNbeKff4fUZWLGDC6OunUp7Ux46eJYwMm0QP9G6Dy.sD4JVni','STUDENT',NULL,'2021-06-24 07:58:05','2021-06-24 08:01:12'),
(889,'lunabenjie52@gmail.com','LUNA','BENJIE JR.','MANLANGIT','MALE','NEW','2003-12-10','DALAON MOLAVE ZAMBOANGA DEL SUR','09639675275','lunabenjie52@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Molave','Dalaon',41168,'SUHI','2021-06-24 07:59:03','$2y$10$tWGFUgsF0W6vCBkuWJaH8ezFp.Hb98gdVUgbn/umSTQptxdnAVOW2','STUDENT',NULL,'2021-06-24 07:58:26','2021-06-24 07:59:03'),
(890,'Kent Marl Ricalde','RICALDE','KENT MARL','AGCALARI','MALE','NEW','2002-10-09','SM LAO MEMORIAL CITY GENERAL HOSPITAL','09464947365','kentmarlr@gmail.com','BSED-MAPEH','BSED-SOCSTUD','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Embargo',26112,'Purok - 1','2021-06-24 08:02:05','$2y$10$AZoBilcVNHLb5Q.33xaUN.PBBuV3O3LsnYkB2m8tm13Gf.h0GZJku','STUDENT',NULL,'2021-06-24 08:00:55','2021-06-24 08:02:05'),
(891,'levimarkmedellada@gmail.com','MEDELLADA','LEVI MARK','SAGARIO','MALE','NEW','2002-06-09','SM LAO MEM CITY GEN. HOSPITAL','09973909710','levimarkmedellada@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 8','2021-06-24 08:05:44','$2y$10$1j1xpBxYd76DGtGhEOfaDOL3YiFS2ukFk73tkhWptXyz8KAKSZ65K','STUDENT',NULL,'2021-06-24 08:01:39','2021-06-24 08:05:44'),
(892,'pbmitzi.gonzaga@gmail.com','GONZAGA','PB MITZI','BIHAG','FEMALE','NEW','2002-09-26','PLARIDEL,MISAMIS OCCIDENTAL','09639361614','pbmitzi.gonzaga@gmail.com','AB POLSCI','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Plaridel','Eastern Looc',26168,'Purok Parpagayo','2021-06-24 08:04:09','$2y$10$yJRPsiqtuznrGF9r/7Q1tOptcjniH/t0IYPM5pLxxEsPW1pmOGMUy','STUDENT',NULL,'2021-06-24 08:03:32','2021-06-24 08:04:09'),
(893,'James Lomocso','LOMOCSO','JAMES','PARMISANA','MALE','NEW','2002-10-13','TUBOD, ILIGAN CITY, LANAO DEL NORTE','09362397290','jameslomocso94@gmail.com','AB POLSCI','BS CRIM','BLENDED',NULL,'Misamis Occidental','Sinacaban','Colupan Alto',26220,'Purok 1 Sampaguita','2021-06-24 08:10:03','$2y$10$d2WSCrhgM.HzdMJgud0PhedLPs2XASTuTck4knaAhQE.y6khlEFtG','STUDENT',NULL,'2021-06-24 08:05:39','2021-06-24 08:10:03'),
(894,'suaybaguio.claire5935@gmail.com','CLAIRE','SUAYBAGUIO','DAG-UMAN','FEMALE','NEW','2003-04-07','MHARS REGIONAL TRAINING AND TEACHING HOSPITAL. OZAMIS CITY','09486435935','suaybaguio.claire5935@gmail.com','BEED','BSED-MATH','BLENDED',NULL,'Misamis Occidental','Jimenez','Butuay',25992,'Purok-3','2021-06-24 08:13:56','$2y$10$aC1hi8hHnvaWH5Hfm0SR9ucp1SPUuT8LE6cf5mczZCpFLL9lS8X/G','STUDENT',NULL,'2021-06-24 08:06:55','2021-06-24 08:13:56'),
(895,'villarin123@gmail.com','VILLARIN','ARLENE','ENOC','FEMALE','NEW','2002-06-16','MAHAYAG','09518009549','villarin123@gmail.com','GEN  MID','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'purok 7',NULL,'$2y$10$blLzMbvl1r2tzBbxqbbx7uGbpLFVU5qoksK5diTJkXNPBkTvP5j9a','STUDENT',NULL,'2021-06-24 08:06:58','2021-06-24 08:06:58'),
(896,'KENN ANGCAY GERONGAY','GERONGAY','KENN','ANGCAY','FEMALE','NEW','2021-08-03','REMEDIOS, BONIFACIO MISAMIS OCCIDENTAL','09264158072','angcaykenn@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Rufino Lumapas',25908,'PUROK 1, KABUHILAN, POBLACION BONIFACIO','2021-06-24 08:09:21','$2y$10$w9JaKtaBJuRhewHZ24sXsOpholvsB4OPO8/RniGITS3DCU/gq883a','STUDENT',NULL,'2021-06-24 08:08:05','2021-06-24 08:09:21'),
(897,'Churchill Ann Omandam','OMANDAM','CHURCHILL ANN','PODIOTAN','FEMALE','NEW','2002-12-29','LIBERTAD, SOMINOT ZAMBOANGA DEL SUR','09128877958','ChurchillAnnOmandam937@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Bibilop',41130,'Purok 2','2021-06-24 08:09:43','$2y$10$77Mv0IxgYRMAAF2GdwynVe5jNIrcpDeaVlkqseo8I7L5A6Jybn1Yq','STUDENT',NULL,'2021-06-24 08:08:44','2021-06-24 08:09:43'),
(898,'Jericho Egbus','EGBUS','JERICHO','ENOMAR','MALE','NEW','2002-12-12','LORENZO TAN TANGUB CITY','09281598742','enomarjericho@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'2','2021-06-24 08:11:48','$2y$10$3uaO41Uj.rrEhFNJX0/RA.qatQM8GqAWBXdt/Ya.2HWx8BGNF2CFO','STUDENT',NULL,'2021-06-24 08:09:47','2021-06-24 08:11:48'),
(899,'eucelmae','CAñETE','EUCEL MAE','SAPIO','FEMALE','NEW','2003-07-03','PUROK 1 LIBRA LOWER SALUG DAKU MAHAYAG ZAMBOANGA DEL SUR','09317193439','eucelmaesapio@gmail.com','BSCS','BSOA','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lower Salug Daku',41091,'Purok 1 Libra Lower Salug Daku Mahayag Z.D.S','2021-06-24 08:11:45','$2y$10$UK2EoTozttd4bzsG8gjll.ihZfS8fh8gWct42oo1dcVOld0yOlVj6','STUDENT',NULL,'2021-06-24 08:11:04','2021-06-24 08:11:45'),
(900,'rylcolellaban@gmail.com','LLABAN','MERRYL COLE','MACION','FEMALE','NEW','2002-07-05','OZAMIZ CITY','09504673122','rylcolellaban@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Ozamis City','Tinago',26139,'Traffic Light','2021-06-24 08:11:54','$2y$10$u2re9u4WXaQUHTohNirSr.CsSYGNsw8CpyH9Y.Gl4wBAVvYjEhkVS','STUDENT',NULL,'2021-06-24 08:11:17','2021-06-24 08:11:54'),
(901,'doverteaiverson@yahoo.com','DOVERTE','AIVERSON','TRADIO','MALE','NEW','2003-05-01','709 MARIANO STREET, BAGBAGUIN, BISALAO, CALOOCAN CITY','09078837772','doverteaiverson01@gmail.com','BSED-MATH','BSED','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'Purok 1, Luansing Street','2021-06-24 08:17:15','$2y$10$GRDCXFBaS2foBjzaVnf0Yet0XAdfbxSBDjtdjCo.JH5Iefde.3je6','STUDENT',NULL,'2021-06-24 08:12:36','2021-06-24 08:17:15'),
(902,'josephrhyd@gmail.com','DELA PEñA','JOSEPH RHY','BANTUGAN','MALE','NEW','2002-04-19','DOñA MARIA D TAN MEMORIAL HOSPITAL','09514666263','josephrhyd@gmail.com','BS CRIM','BSED-MAPEH','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Isidro D. Tan',26256,'Purok 5 isidro D Tan','2021-06-24 08:14:16','$2y$10$iPzBGHByutB0PR3WEzv4QeRVXGcaz.UoVhcuQu6.uRfRXhg9eo4tW','STUDENT',NULL,'2021-06-24 08:13:39','2021-06-24 08:14:16'),
(903,'Jed Medillo03','MEDILLO','JED','PEROCHO','MALE','NEW','2003-06-20','SAN ANTONIO, OZAMIZ CITY','09305244820','jedmedillo@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'9','2021-06-24 08:18:31','$2y$10$lXngHZTUjGLYBEZ2Q46Bo.7a6AB8OVcRLGSAL0uLF518n7CVglgDi','STUDENT',NULL,'2021-06-24 08:14:26','2021-06-24 08:18:31'),
(904,'Anabellejalem30@gmail.com','JALEM','ANABELLE','CABILES','FEMALE','NEW','1992-01-30','CARANGAN,OZAMIZ CITY','09164785190','Anabellejalem30@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay II - Marilou',26240,'purok 4,barangay 2 tangub city','2021-06-24 08:22:52','$2y$10$6cThuvAmvaDOe7vYS2TGde/big/c5N4yhwrRrq9yYU2q3lxJa08fK','STUDENT',NULL,'2021-06-24 08:14:54','2021-06-24 08:22:52'),
(905,'Mabognongretchen98@gmail.com','MABOGNON','GRETCHEN','','FEMALE','TRANSFEREE','1994-12-26','RIVERSIDE TAMBULIG ZAMBO.SUR','09056885785','mabognongretchen98@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tiaman',25911,'Purok 2',NULL,'$2y$10$O7uQ/iSd1sW8GTa9frxx9eQhqsK0h30CK8HocvtyqEaFgNAA5wNQq','STUDENT',NULL,'2021-06-24 08:15:07','2021-06-24 08:15:07'),
(906,'RenjelRose','MADELO','RENJEL ROSE','LABRADOR','FEMALE','NEW','2003-01-12','MOLAVE ZAMBOANGA DEL SUR','09488792984','renjelrose@gmail.com','GEN  MID','BSCS','BLENDED',NULL,'Zamboanga del Sur','Molave','Madasigon',41175,'Dagohoy st','2021-06-24 08:19:33','$2y$10$XGIWJh59ilfDbCgAA6vX/.Oh1aJupOHvWvIq4nHhSjiIVZTye2R1m','STUDENT',NULL,'2021-06-24 08:19:09','2021-06-24 08:19:33'),
(907,'pjohnsyril@gmail.com','PABURADA','JOHN SYRIL','PINOTE','MALE','TRANSFEREE','1995-12-04','MALORO,TANGUB CITY','09559311498','pjohnsyril@gmail.com','BSED-SOCSTUD','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Maloro',26262,'Purok Orchids','2021-06-24 08:27:51','$2y$10$9y1F0SaarQbiFjfnGoJLaenAU9dSv/TW9dClal3O8TNxDmGYPkDIK','STUDENT',NULL,'2021-06-24 08:19:45','2021-06-24 08:27:51'),
(908,'Shierlenepretty#18','SARIGUMBA','SHIERLENE','ATES','FEMALE','NEW','2003-02-11','BONGBONG OZAMIZ CITY MISAMIS OCCIDENTAL','(0963) 287 3280','shierlenesarigumba@yahoo.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1',NULL,'$2y$10$eu0c/fVqsVV75Aeb/P3lB.n2dH.ftKF5Rfi7DayeRR8xaXJE20KNK','STUDENT',NULL,'2021-06-24 08:21:28','2021-06-24 08:21:28'),
(909,'AGNA','ABELLA','ANCELE GRACE NIñA','.','FEMALE','NEW','2002-01-12','CEBU CITY','09456793307','agnaabella@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Maloro',26262,'Purok orchids',NULL,'$2y$10$ch1elx63u1DfsdU/AiMVC.CJ3rebSgm5lFYB/7pXDlTfIUYXqRaVa','STUDENT',NULL,'2021-06-24 08:22:59','2021-06-24 08:22:59'),
(910,'Joshua Decafe','DECAFE','JOSHUA','VILLãPAZ','MALE','NEW','2001-11-22','MHARS REGIONAL TRAINING AND TEACHING HOSPITAL OZAMIZ CITY MIS. OCC.','09700489983','decafejoshua136@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 3','2021-06-24 08:25:20','$2y$10$BTXY1/HyYvHDaXyzu2zXC.95vsc6jubSJcF6WDfddjgXc73iuVH3e','STUDENT',NULL,'2021-06-24 08:24:40','2021-06-24 08:25:20'),
(911,'alforquemarchissa@gmail.com','ALFORQUE','MARCHISSA MAE','COLANGGO','FEMALE','NEW','2002-03-18','MHARS GEN. HOSPITAL','09078726408','alforquemarchissa@gmail.com','BSED-ENGL','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok-8','2021-06-24 08:26:03','$2y$10$45JZQzIKnTo6vO5khl73lehah9KQtjWdRtLbNwtum4AgqHX3Fblre','STUDENT',NULL,'2021-06-24 08:25:07','2021-06-24 08:26:03'),
(912,'Butch Cabardo','CABARDO','BUTCH','CAñADA','MALE','NEW','2002-10-03','CULO, MOLAVE, ZAMBOANGA DEL SUR','09670236199','Cabardobutch515@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African Daisy 1','2021-06-24 08:28:31','$2y$10$wsX6UK7jpCvE/5u0FHYjoOzk8DJrHdwqq2ujHAhj4WyZbjnig/GLS','STUDENT',NULL,'2021-06-24 08:27:19','2021-06-24 08:28:31'),
(913,'Kate Princess','BORREROS','KATE PRINCESS','ALAYA-AY','FEMALE','NEW','2003-07-19','CULO MOLAVE ZAMBOANGA DEL SUR','09104020606','borreroskateprincess1@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Culo',41167,'New Society 1','2021-06-24 08:41:13','$2y$10$8lJFUlZ5O1DtRP19MuLjZ.x3T.lBS1igl/e4LbdAWRXO/RZmMuQBe','STUDENT',NULL,'2021-06-24 08:27:43','2021-06-24 08:41:13'),
(914,'beverlyannparadero05@gmail.com','PARADERO','BEVERLY ANN','ANDAM','FEMALE','NEW','2003-04-05','BARAKANAS, TUBOD, LANAO DEL NORTE','09362304834','beverlyannparadero05@gmail.com','BSED-ENGL','GEN  MID','BLENDED',NULL,'Lanao del Norte','Tubod','Barakanas',20256,'3','2021-06-24 09:03:02','$2y$10$d/jxKCcTXkX4M0xOQScV/eSQWqGlQkW7TNYFXmVCoATQu.89fwjmO','STUDENT',NULL,'2021-06-24 08:28:05','2021-06-24 09:03:02'),
(915,'Kim Ayacaide','AYACAIDE','KIMBERLY','RAMAYRAT','FEMALE','NEW','2002-05-15','UPPER USOGAN BONIFACIO MISS. OCC','09078558320','kimayacaide2@gmail.com','BSED','BSED-FIL','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Miligan',41178,'Nangka','2021-06-24 08:32:16','$2y$10$JXBrrXwrNR1KypCioN4fIe9.fLr70cQWd4Vx6pm5rGB3ngzfknFa.','STUDENT',NULL,'2021-06-24 08:28:38','2021-06-24 08:32:16'),
(916,'perezapril151@gmail.com','PEREZ','APRIL RAIN','MONTEROLA','FEMALE','NEW','2002-04-12','MAHAYAG, ZAMBOANGA DEL SUR','09104095124','perezapril151@gmail.com','BSCS','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Poblacion',41099,'Purok 5','2021-06-24 08:29:33','$2y$10$wLCFoyHnkltJepXzXxwRD.uNtvULSKRgjcgZiDqITSgl6rwPf37k6','STUDENT',NULL,'2021-06-24 08:28:52','2021-06-24 08:29:33'),
(917,'Lady Love','ELECCION','LADY LOVE','BARIL','FEMALE','NEW','2002-09-17','BRGY. VII, TANGUB CITY','09505240940','ladyloveeleccion4@gmail.com','BEED','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay VII - Upper',26245,'2','2021-06-24 08:30:24','$2y$10$7bXoSb.Z0QEPhQE5CLxcV.zy/YU08LCPcB3mGpeR24QVv.ka.RuzC','STUDENT',NULL,'2021-06-24 08:29:37','2021-06-24 08:30:24'),
(918,'Xylene','PUMICPIC','XYLENE','GASIONG','FEMALE','NEW','2002-12-02','PUROK 2 UPPER STO NIñO','09262969746','klenezylepumicpic@gmail.com','BSOA','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Upper Santo Ni±o',41110,'Purok 2 Upper sto ninyo','2021-06-24 08:33:54','$2y$10$9wog12Pg92j4sCmadoPl9.KyKCy0euufHuL6KC1YdNbb5LWhLsBSS','STUDENT',NULL,'2021-06-24 08:32:14','2021-06-24 08:33:54'),
(919,'jecylgonzaleslaluna@gmail.com','LALUNA','JECYL','GONZALES','FEMALE','NEW','2021-07-13','DUMLAN MACO COMPOSTELLA VALLEY PROVINCE','09300257545','jecylgonzaleslaluna@gmail.com','BSED','BSED','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Sinuza',26136,'Prk. 1','2021-06-24 08:49:50','$2y$10$pkal.yNjnCBieTEo4ZT/uukFbb/WaV.RovVLDv/K0pTHrSgTR3rbC','STUDENT',NULL,'2021-06-24 08:32:45','2021-06-24 08:49:50'),
(920,'Edjaysagariogascon','GASCON','ED JAY','S','MALE','NEW','2002-11-19','SM LAO','09304754846','edjaygascon7@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'Purok 1 San Jose village','2021-06-24 08:46:30','$2y$10$c/22GZh5CoyXPqqVMtNF4u6mhDzRfY8rogyRL9CoO27FXEsAk.8Ma','STUDENT',NULL,'2021-06-24 08:34:44','2021-06-24 08:46:30'),
(921,'April Jean','DAHUNAN','APRIL JEAN','','FEMALE','NEW','2003-04-03','MOLAVE ZAMBOAMGA DEL SUR','09512676664','aprildahunan02@gmail.com','BSED-FIL','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Miligan',41178,'Purok nangka','2021-06-24 08:43:24','$2y$10$8wnqRKYbtQzGTH.gtf.3ceTrwZau8xHtvGjb/d2bdYgOA/yIGd5da','STUDENT',NULL,'2021-06-24 08:36:37','2021-06-24 08:43:24'),
(922,'09465019260','TIZON','JHON MICHAEL','COYME','MALE','NEW','2002-11-06','BRGY GONOSAN, MOLAVE ZAMBOANGA DEL SUR','09517917116','jhonmichaeltizon972@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Gonosan',41171,'Purok Merasol, Brgy. Gonosan','2021-06-24 08:49:57','$2y$10$LiO8c2zxpeO/e83sxrgK.ebUeHSO3MScy4q69KMl9UqSa6V6sEaR2','STUDENT',NULL,'2021-06-24 08:36:52','2021-06-24 08:49:57'),
(923,'jasminreccataburada@gmail.com','TABURADA','JASMIN RECCA','PEPITO','FEMALE','NEW','2002-08-06','STA. MARIA, TANGUB CITY','09082497661','jasminreccataburada@gmail.com','BSED-MAPEH','BEED','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok-2','2021-06-24 09:01:36','$2y$10$95HhNxpvWNxbIDGSwwAQBecS0v59/Y7KbkXZjE1NT0byvMrIvEXwi','STUDENT',NULL,'2021-06-24 08:37:29','2021-06-24 09:01:36'),
(924,'sawieqt208','DELA TORRE','SARAH JEAN','CABISADA','FEMALE','NEW','2002-12-20','LUPAGAN, CLARIN, MISAMIS OCCIDENTAL','09635633848','sawiedelatorre208@gmail.com','BEED','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Clarin','Lupagan',25948,'Purok-4','2021-06-24 08:39:57','$2y$10$liBHtfl2Grkorv3BgAUilO1yOoyIK4sJJoc4BOFk.wFl2CFRKltPa','STUDENT',NULL,'2021-06-24 08:37:48','2021-06-24 08:39:57'),
(925,'bismontenecole@gmail.com','BISMONTE','NECOLE ANN','ACOSTA','FEMALE','NEW','2003-06-17','MIALEM, JIMENEZ, MISAMIS OCCIDENTAL','09351467916','bismontenecole@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Aloran','Labo',25844,NULL,'2021-06-24 08:42:20','$2y$10$xmU/xgHW01/c3wEG0F6vzurjA0DQClu0tduOL6Cm/XFctpceeisii','STUDENT',NULL,'2021-06-24 08:39:01','2021-06-24 08:42:20'),
(926,'kyshajeslieg@gmailmcom','GUILLERMO','KYSHA JESLIE','GONZAGA','FEMALE','NEW','2003-01-07','LOOC PROPER, PLARIDEL, MISAMIS OCCIDENTAL','09460846782','kyshajeslieg@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Looc Proper',26174,'Purok 2','2021-06-24 08:42:25','$2y$10$QuHg1cg7hWEJTJZ28b8eD.zin5TuZ0mDZUT7daBRf2jLv5wdfXM2e','STUDENT',NULL,'2021-06-24 08:41:33','2021-06-24 08:42:25'),
(927,'earliemanlegro@gmail.com','MANLEGRO','EARLIE','LUMACTOD','FEMALE','NEW','2002-12-10','MHARS GEN HOSPITAL','09187113851','earliemanlegro@gmail.com','BSOA','AB COMM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'Purok-7 Gango, Manlegro Street','2021-06-24 08:42:46','$2y$10$3Tw28O./lImps9cqWasbu.KkpMElIsTdwOBv4ufgBafKlDSdGNSZ2','STUDENT',NULL,'2021-06-24 08:42:12','2021-06-24 08:42:46'),
(928,'jofemariem@gmail.com','MAGHINAY','JOFE MARIE','VILLAGONZALO','FEMALE','NEW','2003-01-13','GUINALABAN TANGUB CITY','09383118787','jofemariem@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tangub City','Guinalaban',26254,'Purok-1','2021-06-24 08:45:32','$2y$10$DLjLkhI4tfsExErR4lvwqeWxZS/P1m5dfJ1iWF51sMMkvJQWUhzvW','STUDENT',NULL,'2021-06-24 08:42:42','2021-06-24 08:45:32'),
(929,'BrendilynAlburo','ALBURO','BRENDILYN','LAPUT','FEMALE','NEW','2002-10-04','OZAMIS CITY','09511970646','alburobrendilyn@gmail.com','BSED-MATH','BSED-MATH','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'Purok 2','2021-06-24 08:56:52','$2y$10$uNNABzxz0wpEwBnKhTszSOrmL0rErvAZ6zoxcEeRM.oAf5w6UA5Zi','STUDENT',NULL,'2021-06-24 08:42:46','2021-06-24 08:56:52'),
(930,'Chariz Faith S. Lagunda','LAGUNDA','CHARIZ FAITH','SARONA','FEMALE','TRANSFEREE','2001-12-20','BAYBAY BONIFACIO','09518370136','deserie143@yahoo.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Baybay',25888,'Purok 3 Baybay Bonifacio',NULL,'$2y$10$iT/RhcUUkkJNT60U5qXdke2Y.vtO27uR6pFAZUv9v5vhqbaEvAlai','STUDENT',NULL,'2021-06-24 08:43:58','2021-06-24 08:43:58'),
(931,'lucymarierepaso','REPASO','LUCYMARIE','DALAGON','FEMALE','NEW','2003-04-25','LOURNMAH MAHAYAG ZAMBOANGA DEL SUR','09684264379','lucymarierepaso@gmail.com','BSOA','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lourmah',41090,'Purok 5','2021-06-24 08:48:08','$2y$10$dq8HeexM6KD7CNK3EGPPz.XTVvwwEBJjedxGZPZ3FtFXTRoK2bFWS','STUDENT',NULL,'2021-06-24 08:44:27','2021-06-24 08:48:08'),
(932,'Edjaygascon','ED JAY','GASCON','S','MALE','NEW','2002-11-19','SM LAO','09304754846','edjaygascon8@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'Purok 1 San jose village',NULL,'$2y$10$H5OGtnqd3w8hLhQV83yyxuCdr9gegKhpZ61C2TIm3tCkEdaws/E2a','STUDENT',NULL,'2021-06-24 08:44:51','2021-06-24 08:44:51'),
(933,'Bernalyn E. Cabasis','CABASIS','BERNALYN','ENCARNACION','FEMALE','NEW','2003-05-03','DARUMAWANG ILAYA, LALA, LANAO DEL NORTE','09168815002','cabasisberna@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Lanao del Norte','Lala','Darumawang Ilaya',19955,'Purok 3','2021-06-24 08:46:49','$2y$10$k3UXMFkjZ4qkvgNpBLEnnuN2I/ltD40MT9j5fWWuuhyL/VL1SE69y','STUDENT',NULL,'2021-06-24 08:45:14','2021-06-24 08:46:49'),
(934,'Leahpatilan02@gmail.com','PATILAN','LEA MAE','PONCE','FEMALE','NEW','2003-04-21','ILIGAN CITY, LANAO DEL NORTE','09516530173','leahpatilan02@gmail.com','BS CRIM','BSED','BLENDED',NULL,'Misamis Occidental','Ozamis City','Gango',26114,'Prk 1 Rizal','2021-06-24 08:47:20','$2y$10$sz3EAYMFkiyNgOOVjKFv..UKwixWckqrMhvb8L2oI8aIAr3xxof4W','STUDENT',NULL,'2021-06-24 08:46:33','2021-06-24 08:47:20'),
(935,'Rosemelyn','GUMILOS','ROSEMELYN','CATALA.','FEMALE','NEW','2001-12-11','CALOLOT TAMBULIG ZAMBOANGA DEL SUE','09513931552','melynmedina101@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Tambulig','New Village',41380,'5/New Village','2021-06-24 08:52:15','$2y$10$uDhn.1Y8vU9QI7m7YbIEgul9cqrAA7APnbgUp6F/uuBxtqxLsvstO','STUDENT',NULL,'2021-06-24 08:47:25','2021-06-24 08:52:15'),
(936,'marryfenercua@gmail.com','NERCUA','MARRY FE','ABAJAR','FEMALE','NEW','2003-06-12','P-2 KATIPUNAN,PLARIDEL,MISAMIS,OCCIDENTAL','09368846711','marryfenercua@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Plaridel','Katipunan',26170,'P-2','2021-06-24 08:51:54','$2y$10$UXwjL/Iq7BRHq.lyxaB8g..6CPmyNy10Oo2wfg5HqfBtmNv.gyoYG','STUDENT',NULL,'2021-06-24 08:50:48','2021-06-24 08:51:54'),
(937,'reginojeanmae0@gmail.com','REGINO','JEAN MAE','CONTESTABLE','FEMALE','NEW','2003-05-05','KOLAMBUGAN DISTRICT HOSPITAL','09550247983','reginojeanmae0@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Lanao del Norte','Bacolod','Minaulon',19785,'PUROK 1',NULL,'$2y$10$gqbavVUB/J7AfYjbfJxvNeydFzsXUdffFvTfqsz5EoWxPj.UaRVYi','STUDENT',NULL,'2021-06-24 08:51:32','2021-06-24 08:51:32'),
(938,'deborahgalia@yahoo.com','GALIA','DEBORAH','UY','FEMALE','NEW','2021-10-12','SINACABAN, MISAMIS OCCIDENTAL','09461880475','deborahgalia78@gmail.com','BEED','BS CRIM','BLENDED',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Rosal','2021-06-24 09:01:39','$2y$10$vzprdCK4W/qBy0jZq.GhY.6XOdXkmbsukwSgJeWjQxzvsHp5ZQkcu','STUDENT',NULL,'2021-06-24 08:53:15','2021-06-24 09:01:39'),
(939,'Fretzel Enerio Lingo-lingo','LINGO-LINGO','FRETZEL','ENERIO','FEMALE','NEW','2004-10-30','ORANG DAKO,CABGAN TAMBULIG ZAMBOANGA DEL SUR','09169803644','fretzeleneriolingolingo@gmail.com','BSBA-MM','BSCS','BLENDED',NULL,'Zamboanga del Sur','Tambulig','Cabgan',41366,'Purok 2 Laoton,Cabgan','2021-06-24 09:21:02','$2y$10$ycvM5O3ZErknJ826YV9Kl..rwYkskVvX0uGhEY1rmR4H7F/lw5ZWS','STUDENT',NULL,'2021-06-24 08:55:42','2021-06-24 09:21:02'),
(940,'hannahagad07@gmail.com','AGAD','HANNAH MAY','SURIGAO','FEMALE','NEW','2002-05-15','DALAPANG, OZAMIS CITY','09460559911','hannahagad07@gmail.com','BSED-MAPEH','BEED','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok Tarsing',NULL,'$2y$10$7gc07jxzSuTH..1YvYR9c.K.h/rzZZjKchPBH1XgUhcRvjPpBmXum','STUDENT',NULL,'2021-06-24 08:55:58','2021-06-24 08:55:58'),
(941,'Cyrel Bilang','BILANG','JAYCYRLE','CATARAJA','MALE','NEW','2001-01-25','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09077507779','cyrel2021@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 09:00:35','$2y$10$FkC4jOSqrJIP6EizOa6s0uSdOMU7ErktvfwHSlHx6qujmxUoXe31q','STUDENT',NULL,'2021-06-24 08:56:41','2021-06-24 09:00:35'),
(942,'Fuentes','FUENTES','MARDONIO','CABALLES','MALE','NEW','2001-10-25','AGUADA OZAMIZ CITT','09383068062','chrololucifer3@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Ozamis City','Aguada',26091,'Purok/9','2021-06-24 08:59:03','$2y$10$Y/NlmoeTke9vD6Zk2E8IxeS8rfivbupCi0qfB1eaIAPrXxi/or1Ya','STUDENT',NULL,'2021-06-24 08:56:48','2021-06-24 08:59:03'),
(943,'shierlenecute18','SARIGUMBA','SHIERLENE','ATES','FEMALE','NEW','2003-02-24','BONGBONG OZAMIZ CITY MISAMIS OCCIDENTAL','09632873280','shierlenesarigumba0@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1','2021-06-24 08:59:33','$2y$10$rjHLohOISG9f32fooZ5L0Opklnh68PWUarkffTf3EBOyCA2aeQ/zC','STUDENT',NULL,'2021-06-24 08:58:07','2021-06-24 08:59:33'),
(944,'Krizzia','POTOT','KRIZZIA KATE','GOOC','FEMALE','NEW','2003-01-04','PARASAN, MOLAVE ZAMBOANGA DEL SUR','09512676892','krizziapotot@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok Anibong','2021-06-24 08:58:50','$2y$10$OMX3refIWCF48Y/Apefjt.B1XSEMaIypKhgqSQQq.ql.Snt9jZC7S','STUDENT',NULL,'2021-06-24 08:58:13','2021-06-24 08:58:50'),
(945,'Mary Joy m.villegas','VILLEGAS','MARY JOY','MAYORDO','FEMALE','NEW','2002-12-25','BANGLAY, TANGUB CITY','09460246068','villegasmaryjoy25@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Banglay',26238,'Purok-7, Banglay Tangub City',NULL,'$2y$10$JkO8ocG4enuC9t6b/XsfneDZzgwOSEuREmAHPUxiGlZxVjFiFHlwy','STUDENT',NULL,'2021-06-24 08:58:52','2021-06-24 08:58:52'),
(946,'Dave E. Maitom','MAITOM','DAVE','EMPERIO','MALE','NEW','2001-03-23','APIL, OROQUIETA CITY, MISAMIS OCCIDENTAL','09753341174','maitomdave21@gmail.com','BSCS','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Kapalaran',41372,'Purok 4','2021-06-24 09:04:57','$2y$10$ATNQUtpiBtZiNjwSqkfm9uDl2u9Isk1zkYz/U3WvLT6hNYrR/9IdC','STUDENT',NULL,'2021-06-24 09:01:13','2021-06-24 09:04:57'),
(947,'daphneyganiolon@gmail.com','GANIOLON','DAPNEY','BUZARANG','FEMALE','NEW','2002-03-20','MANGA TANGUB CITY','09501237855','daphneyganiolon@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Manga',26263,'P2 manga Tangub city',NULL,'$2y$10$0REa42JABCVlFrMhTeZqvOb2sVt9nyvbc4gC2GxzdRAg1k2S.ztam','STUDENT',NULL,'2021-06-24 09:02:20','2021-06-24 09:02:20'),
(948,'Elenavie Cadotdot','CADOTDOT','ELENAVIE','HILAGA','FEMALE','NEW','2002-11-03','BALUGO, TAMBULIG ZAMBOANGA DEL SUR','09514698982','elenaviecadotdot1132@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Balugo',41365,'Purok 3, Santan','2021-06-24 09:09:06','$2y$10$4LOd5zNYYOBBS32BqnXyNuNZvnNSJByBErDXYD4UxnuuGsvmjCJvO','STUDENT',NULL,'2021-06-24 09:02:36','2021-06-24 09:09:06'),
(949,'Dre','BATION','ANDRE JOMEL','BRIN','MALE','TRANSFEREE','2002-02-08','TABID , OZAMIZ CITY','09649242390','andrejomelbation@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Litapan',26125,'Purok - 4 Litapan Ozamiz city','2021-06-24 09:04:18','$2y$10$ZQ6sVBxPqqCPuQqZFv9rKuPE2xRu6VcRW4pjN3tZFcHUbeK1A1eJq','STUDENT',NULL,'2021-06-24 09:03:39','2021-06-24 09:04:18'),
(950,'Mary Rose Purlas Calinga','CALINGA','MARY ROSE','PURLAS','FEMALE','NEW','2003-03-26','DULLAN BONIFACIO MISAMIS OCCIDENTAL','09267891904','Maryrosecalinga6@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Bonifacio','Dullan',25896,'Purok-3','2021-06-24 09:07:47','$2y$10$4hn8c0vIRISHK6FSkRd/7.q4/XouQzd4G7UerJx23GdLcoWzIYlHC','STUDENT',NULL,'2021-06-24 09:04:18','2021-06-24 09:07:47'),
(951,'Irish25','BUSTAMANTE','IRISH LYN','ABELLANA','FEMALE','NEW','2002-01-25','BONGBONG OZAMIS CITY','09516801314','canalesaljun@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1 Barangay Bongbong Ozamis City','2021-06-24 09:43:54','$2y$10$2gNysKiyugA45R5sYLXBnOKVufCH6//Y06iEPIxiyhZ.9sgj/3xTW','STUDENT',NULL,'2021-06-24 09:05:16','2021-06-24 09:43:54'),
(952,'Moisesluz376@gmail.com','MOISES','LUZ','ANGHAG','FEMALE','NEW','2003-05-01','YAHONG TUDELA MISAMIS OCCIDENTAL','09301440133','Moisesluz376@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tudela','Yahong',26322,'Purok-4','2021-06-24 09:12:26','$2y$10$osG8cPgxb8IZXEVP/UDvx.BGjE6R.3wxJ9kSeCMtXK8wXapaPd7ue','STUDENT',NULL,'2021-06-24 09:05:42','2021-06-24 09:12:26'),
(953,'Jane','TOLENTINO','JANE','CALAGO','FEMALE','NEW','2022-08-24','PARASAN MOLAVE ZAMBOANGA DEL SUR','09352571668','jhanegarcia32email@com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok Anibong',NULL,'$2y$10$wgrgGVDwis.vLkgid9Voi.89m8o7dBgs0yqa7ds7nnpkXoKX52JAy','STUDENT',NULL,'2021-06-24 09:06:39','2021-06-24 09:06:39'),
(954,'hyacinth rasonable','RASONABLE','HYACINTH','PATA','FEMALE','NEW','2001-09-21','BAGUMBANG, BONIFACIO, MISAMIS OCCIDENTAL','09485384797','hyacinthrasonable21@gmail.com','BS CRIM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Bagumbang',25887,'Purok 2','2021-06-24 09:08:29','$2y$10$uqtJD8gZeEJbp6AfVUClOeN7VRVJV0js98h51To4p8c72eMHqOPl.','STUDENT',NULL,'2021-06-24 09:06:58','2021-06-24 09:08:29'),
(955,'JohairaCngy','CAANGAY','JOHAIRA','SOTERIO','FEMALE','TRANSFEREE','2002-11-26','SAPAD LANAO DEL NORTE','09124960000','johaira2611@gmail.com','BSCS','BSBA-MM','BLENDED',NULL,'Lanao del Norte','Magsaysay','Poblacion',20000,'purok #2 Aquino','2021-06-24 09:10:06','$2y$10$GgsAJVLDRPF5U7iq.p2Fz.vM0M/FpVqDvc3vHB9bBrYxm1Ds4ZoW6','STUDENT',NULL,'2021-06-24 09:07:17','2021-06-24 09:10:06'),
(956,'Queenie Mae C. Manlangit','MANLANGIT','QUEENIE MAE','CATANA','FEMALE','TRANSFEREE','2003-03-15','BAYBAY BONIFACIO','09516530621','manlangitqueeniemae@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Baybay',25888,'Purok 1 Baybay Bonifacio',NULL,'$2y$10$d.45r1HlA7Nxp.Go1UwCWOXqL5aISP484CIBQPU9f/7poHvL6z0.i','STUDENT',NULL,'2021-06-24 09:09:56','2021-06-24 09:09:56'),
(957,'Crisdel Cataraja','CATARAJA','CRISDEL','MIER','MALE','NEW','2001-11-21','AURORA ZAMBOANGA DEL SUR','09757421455','catarajacrisdel@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 09:10:35','$2y$10$l1AvrT2Y5Ok/r3HkxZvVtOidgvFjVbfW.vydFU86eGFM7yF9CiQE2','STUDENT',NULL,'2021-06-24 09:10:07','2021-06-24 09:10:35'),
(958,'elljoe','CAGA-ANAN','ELLJOE PAUL','TILAO','MALE','NEW','2001-10-03','OROQUIETA MOPH','09639216264','cagaananelljoepaul@gmail.com','BEED','BEED','BLENDED',NULL,'Misamis Occidental','Panaon','Salimpuno',26151,'Purok 1','2021-06-24 09:17:22','$2y$10$A/mhLCAygDUieCvLbIRDF.3kuvga/CzFVfO505JyYbxLSMw2sILpa','STUDENT',NULL,'2021-06-24 09:10:36','2021-06-24 09:17:22'),
(959,'dagapiosoearlkate@gmail.com','DAGAPIOSO','EARL KATE','','FEMALE','NEW','2003-02-03','CABANATUAN CITY NUEVA ECIJA','0951 845 4251','dagapiosoearlkate@gmail.com','BS CRIM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Baybay San Roque',26096,'1',NULL,'$2y$10$N/4FyDoNTkCCdGp6jqNxE.yQ5iZc9p1yRatVvywFXm7PAdAXi3t2K','STUDENT',NULL,'2021-06-24 09:10:40','2021-06-24 09:10:40'),
(960,'darylldaig101103@gmail.com','DAIG','DARYLL','CAW-IT','MALE','NEW','2003-10-11','SILONGON TUDELA MIS. OCC.','09368287252','darylldaig101103@gmail.com','BSED-ENGL','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tudela','Silongon',26318,'Purok 1',NULL,'$2y$10$indjG0gNy9UbSw0wILUow.kAeWnCVlispjOx/aXmu4zWMe5d2Xqmi','STUDENT',NULL,'2021-06-24 09:10:53','2021-06-24 09:10:53'),
(961,'Angel Mae Almanoche','ALMANOCHE','ANGEL MAE','PELIBINO','FEMALE','NEW','2003-02-21','TAGOLALO,AURORA,ZAMBOANGA DEL SUR','09517981446','angelmaealmanoche@gmail.com','BSED-MAPEH','BSED-SOCSTUD','BLENDED',NULL,'Zamboanga del Sur','Aurora','Tagulalo',40809,'San Isidro','2021-06-24 09:17:06','$2y$10$qwlLMP5OFraYVIqsSyofw.p9twl6WXqeB94KzJughmTgvhlWrGphu','STUDENT',NULL,'2021-06-24 09:13:13','2021-06-24 09:17:06'),
(962,'Jemimah Jane Pabatang','PABATANG','JEMIMAH JANE','LUZA','FEMALE','NEW','2003-02-07','MACABAYAO, JIMENEZ, MISAMIS OCCIDENTAL','09559835670','pabatangjemimah@gmail.com','BS CRIM','BSCS','BLENDED',NULL,'Misamis Occidental','Jimenez','Macabayao',25998,'P-2',NULL,'$2y$10$BL41nx2UqJiqRW6I5U46EeKobKJMpekR7RH6rY7BkC9u2Pqyh0mXG','STUDENT',NULL,'2021-06-24 09:14:11','2021-06-24 09:14:11'),
(963,'Jhane','TOLENTINO','JANE','CALAGO','FEMALE','NEW','2002-08-24','PARASAN MOLAVE ZAMBOANGA DEL SUR','09352571668','jhanegarcia32@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok Anibong',NULL,'$2y$10$KuR7lQpLTF6BU0SQcUg6iOi5RyfeAgCGjyuTBzKu9Ub.z7ickIWzy','STUDENT',NULL,'2021-06-24 09:14:20','2021-06-24 09:14:20'),
(964,'Fraichey dell','MARIQUIT','FRAICHEY DELL','MALON','FEMALE','NEW','2002-08-15','SINACABAN MIS.OCC','09465526718','fraicheydell@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Sinacaban','Se±or',26232,'Purok Gumamela','2021-06-24 10:16:55','$2y$10$.No08ythg7l.70zYtDSyiu23ZrJF2y309.c59vjQr4rHaDWkd7Y2W','STUDENT',NULL,'2021-06-24 09:14:23','2021-06-24 10:16:55'),
(965,'Marjun','PLANGCA','MARJUN','LAUZA','MALE','NEW','2001-01-03','AURORA ZAMBOANGA DEL SUR','09631480938','plancamarjun@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Lourmah',41090,'Purok 3','2021-06-24 09:16:35','$2y$10$NLb.jZhItflyDtKdfN0gPe8juHGePZn7YbftCXOSXDvRa/4n5jXyi','STUDENT',NULL,'2021-06-24 09:15:07','2021-06-24 09:16:35'),
(966,'khailguillermoguillermo@gmail.com','GUILLERMO','KHAIL ROJEE','GONZAGA','MALE','NEW','2001-12-01','LOOC PROPER, PLARIDEL, MISAMIS, OCCIDENTAL','09126081391','khailguillermoguillermo@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Looc Proper',26174,'Purok 2','2021-06-24 09:19:16','$2y$10$SOUpWx64hzde8K1aU3V8cu8EklJp7iTLFsmX2bc3l5shAJFaMwKvK','STUDENT',NULL,'2021-06-24 09:18:34','2021-06-24 09:19:16'),
(967,'jhesseloishi@gmail.com','OLARTE','JAHNLEY','JOSOL','MALE','NEW','2001-01-28','UPPER BAG-ONG TUDELA,JOSEFINA, ZAMBOANGA DEL SUR','09106180024','jhesseloishi@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Josefina','Upper Bagong Tudela',40997,'Purok Durian','2021-06-24 09:20:58','$2y$10$kM.98CCfASvNxZC6Thrm..VoRSzMiZtX/E0hUhnvBrEJqkL5Sgm36','STUDENT',NULL,'2021-06-24 09:20:16','2021-06-24 09:20:58'),
(968,'@Khrieza019','CAPARIDA','KHRIEZA JANE','A.','FEMALE','NEW','2002-08-01','SAN JOSE TAMBULIG ZDS','09355957069','Khriezajanecaparida078@gmail.com','BSCS','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','San Jose',41384,'PUROK 1',NULL,'$2y$10$Z7Na7Xyl.8kCND4jczJnReE2pxIzH3BnFsZ5TawYo27GdoJeJTdKy','STUDENT',NULL,'2021-06-24 09:20:52','2021-06-24 09:20:52'),
(969,'Racheltactacon','TACTACON','RACHEL','MAñABO','FEMALE','NEW','2002-11-13','CLARIN MISAMIS OCCIDENTAL','09503004043','racheltactacon20@gmail.com','BEED','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'9','2021-06-24 09:28:55','$2y$10$aKU21kG5FLxtx1owedENNeX6DX5ZjRfi5NzEDtOR/l1/tJ0M66Ibu','STUDENT',NULL,'2021-06-24 09:21:10','2021-06-24 09:28:55'),
(970,'shellamiemelo@gmail.com','MELO','SHELAMEI','D','FEMALE','NEW','2002-07-13','BAGUMBANG, BONIFACIO MISAMIS OCCIDENTAL','09304726988','shellamiemelo@gmail.com','BSBA-HRM','BEED','BLENDED',NULL,'Misamis Occidental','Bonifacio','Bagumbang',25887,'Purok-2 Bagumbang','2021-06-24 09:26:14','$2y$10$jkJgwCk1nfdslxsKcJcQ0uaRCCu9S6LUNFTm0pqXafuW2n/oKQa52','STUDENT','VcYkKNIoqH7yyh0LA0dsTboVAeQPKdiCij4c2pjCbQ3tP4LwXCCCTkK1Fydn','2021-06-24 09:21:18','2021-06-24 09:26:14'),
(971,'eljerjohnalicando','ALICANDO','ELJER JOHN','DAPAC','MALE','NEW','2001-02-27','PAN AY DIOT TUDELA MIS OCC','09468710299','Eljerjohnalicando@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Pan-Ay Diot',26315,'Pan-ay Diot purok 3',NULL,'$2y$10$k8u0PF9q5VWTPxqIL3GfUej8MEyEw3kRF4/awH0IGGR9Il7xd0vdW','STUDENT',NULL,'2021-06-24 09:21:39','2021-06-24 09:21:39'),
(972,'reynajane.yunting@gmail.com','YUNTING','REYNA JANE','NEPOMUCENO','FEMALE','NEW','2003-02-18','OZAMIS CITY','09382187641','reynajane.yunting@gmail.com','BSBA-MM','BSED','BLENDED',NULL,'Zamboanga del Sur','Molave','Makuguihon',41176,'Guillen Street','2021-06-24 09:26:13','$2y$10$iUXF.P8CgPTMztQiUrlzmOQ6b/s2UyTL81XIAaTDPwD5YOCE3ZI1S','STUDENT',NULL,'2021-06-24 09:22:13','2021-06-24 09:26:13'),
(973,'Diane Shane','NARANJO','DIANE SHANE','LAURENCIANA','FEMALE','NEW','2002-01-02','NIA ROOD DAANG AMAYA TANZA, CAVITE','09158976112','dianeshanenaranjo@gmail.com','AB POLSCI','BSCS','BLENDED',NULL,'Misamis Occidental','Tangub City','Kauswagan',26257,'Purok-5','2021-06-24 09:24:39','$2y$10$wM1sjeuMRdHMTPwfXcFvPeFwrT0UNB14Un.NX3UZpfr1iFuG5iVHq','STUDENT',NULL,'2021-06-24 09:23:06','2021-06-24 09:24:39'),
(974,'Ace_solon18','SOLON','ACE ANJIEVEL','BARRIENTOS','FEMALE','NEW','2002-10-18','PASINGKALAN RAMON MAGSAYSAY ZAMBOANGA DEL SURE','09367526716','aceanjievelsolon038@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Pasingkalan',41273,'Purok 2',NULL,'$2y$10$p64T5jSCtR8TTjTBaZ615eomDTpg6PXcor1BA9cJjZVWqZXjnlSeS','STUDENT',NULL,'2021-06-24 09:24:43','2021-06-24 09:24:43'),
(975,'mzyrilmae@gmail.com','MISAL','ZYRIL MAE','ANTO','FEMALE','NEW','2002-08-23','PAN-AY CLARIN MISAMIS OCCIDENTAL','09464890869','mzyrilmae@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'Purok-8','2021-06-24 09:26:22','$2y$10$4dfOWlfM09qSxXIIQ5lw1ODZMI8PlSWaY5naCkXzZ0a07J.c9eYd6','STUDENT',NULL,'2021-06-24 09:25:44','2021-06-24 09:26:22'),
(976,'nylerobieocab2002','OCAB','NYLE ROBIE','PAREL','FEMALE','NEW','2002-01-30','C','09959133875','nylerobieocab2002@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Bougainvillea','2021-06-24 09:26:54','$2y$10$iwiErnV8//LWEakX/A2tNuDZA4v5HqkVMGOJL1WvIL9s38I04bsLm','STUDENT',NULL,'2021-06-24 09:26:22','2021-06-24 09:26:54'),
(977,'mabognongretchen26@gmail.com','MABOGNON','GRETCHEN','','FEMALE','TRANSFEREE','1994-12-26','RIVERSIDE TAMBULIG ZAMBOANGA DEL SUR','09056885785','mabognongretchen26@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Tiaman',25911,'Purok 2','2021-06-24 09:42:31','$2y$10$LXALGqnAmtoDrOaZS6Ak8uJrCLtn3aiK8c0Tab6COSzRAa9yN7jc.','STUDENT',NULL,'2021-06-24 09:27:10','2021-06-24 09:42:31'),
(978,'esmadeimilda@gmail.com','ESMADE','IMILDA','KINLET','FEMALE','NEW','2002-10-02','LILOAN BONIFACIO MISAMIS OCCIDENTAL','09305346515','esmadeimilda@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Liloan',25898,'PUROK 3','2021-06-24 09:30:09','$2y$10$4jLBlF.aE2vfA0F55BSpIulVRXpn5DMBrsAjtAAXqzW1o8dshG2yK','STUDENT',NULL,'2021-06-24 09:28:58','2021-06-24 09:30:09'),
(979,'Jomarie Denoy','DENOY','JOMARIE','LUMUSAD','FEMALE','NEW','2003-03-19','TABID OZAMIZ CITY','09164928778','jomariedenoy478@gmail.com','BSBA-HRM','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'P2 tabid ozamiz city',NULL,'$2y$10$iQRP7nFc8Qenq5WbB1Qa2e4LYd/4XjTYzMMR9Hl6qy6wfyGT1UT0O','STUDENT',NULL,'2021-06-24 09:29:39','2021-06-24 09:29:39'),
(980,'Jhaney','TOLENTINO','JANE','CALAGO','FEMALE','NEW','2002-08-24','PARASAN','09352571668','tjhane32@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok Anibong',NULL,'$2y$10$q1WZ.RPuUUzIH/u1cbGFj.KZk3T/XJrraPk6ECPKv68hcA7fYv5Iu','STUDENT',NULL,'2021-06-24 09:30:47','2021-06-24 09:30:47'),
(981,'ronelynbodiongan13@gmail.com','BODIONGAN','RONELYN','BALAZO','FEMALE','NEW','2002-10-13','SINUZA TUDELA MISAMIS OCCIDENTAL','09305074346','ronelynbodiongan13@gmail.com','BEED','BEED','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Sinuza',26319,'5','2021-06-24 09:40:23','$2y$10$Fo1yRB7IabWBApNKRJ.p5.NvmAmRswVrGK7M9BGpUW8o6hTaAW5CK','STUDENT',NULL,'2021-06-24 09:30:56','2021-06-24 09:40:23'),
(982,'kimberlyjeandalion1@gmail.com','DALI-ON','KIMBERLY JEAN','COLAGBANG','FEMALE','NEW','2002-12-01','MHARS GEN','09362473819','kimberlyjeandalion1@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Gumbil',26307,'Purok-7','2021-06-24 09:39:31','$2y$10$nftl2ldpcZ.7/./OKtRmlO9THNLbjt53/xAjD1O9.HGgHBYrXsQWS','STUDENT',NULL,'2021-06-24 09:30:57','2021-06-24 09:39:31'),
(983,'catherinecabayag@gmail.com','CABAYAG','CATHERINE','BODIONGAN','FEMALE','NEW','2003-06-17','TUDELA MUNICIPAL HOSPITAL','09754985519','catherinecabayag@gmail.com','BEED','BEED','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Sinuza',26319,'2','2021-06-24 09:37:48','$2y$10$te1yKanqWCIAjJgYdj5jhuaGUBKVN1Y1VUovMcI2CqbfHtR6tmboa','STUDENT',NULL,'2021-06-24 09:30:57','2021-06-24 09:37:48'),
(984,'magaborojanie@gmail.com','MAG-ABO','ROJANIE','LACRE','FEMALE','NEW','2003-05-30','SM LAO HOSPITAL','09513797679','magaborojanie@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok 4','2021-06-24 09:37:13','$2y$10$tzj2w.PfN8lXFpIiagUDlOMTJWnyW7s.RZF8iyag4SmHUTS7GgiRC','STUDENT',NULL,'2021-06-24 09:30:57','2021-06-24 09:37:13'),
(985,'ronejeia@gmail.com','ALINDAHAW','RONEJEI','CUIZON','MALE','NEW','2002-09-02','SINUZA,TUDELA MISAMIS OCCIDENTAL','09504695325','ronejeia@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Sinuza',26319,'P-5 Sinuza Tudela Misamis Occidental','2021-06-24 09:35:16','$2y$10$vG3qMFI1D3obhop7qokSF.D9QRhwJ00nBEexS0vB2jv1KDwKac/pu','STUDENT',NULL,'2021-06-24 09:30:59','2021-06-24 09:35:16'),
(986,'joerramanusa@gmail.com','MANUSA','JOERRA','PELLERIN','FEMALE','NEW','2002-11-17','BALATACAN TANGUB CITY','09093821865','joerramanusa@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Balatacan',26236,'Purok-7 pasayan',NULL,'$2y$10$3atEDTutYST26BhMVlw4Oe1QRN9DgFCqPM1AqG/Mh7ZMK1ZdB1OO2','STUDENT',NULL,'2021-06-24 09:31:24','2021-06-24 09:31:24'),
(987,'Diegojrnacion789','NACION','DIEGO','SASAM','MALE','NEW','2002-02-23','TIMBABABOY MIDSALIP ZDS','09166205793','diegojrnacion789@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Palayan',NULL,'$2y$10$Cgqsfsx5bRfnOF3pUxgDLukBiLQCfX8Bqyax8hAtPPAKCKlV9lwlK','STUDENT',NULL,'2021-06-24 09:31:37','2021-06-24 09:31:37'),
(988,'gabasjeed@gmail.com','GABAS','JEED','ABATAYO','FEMALE','TRANSFEREE','1999-12-09','PULOT OZAMIS CITY','09519476939','gabasjeed@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Pulot',26132,'7','2021-06-24 09:36:17','$2y$10$jd4Hu57xuzNtPb4p/m7nvOQc/nAcC2WQd1QxqnNL6DZGmFyVJgx52','STUDENT',NULL,'2021-06-24 09:33:24','2021-06-24 09:36:17'),
(989,'Bustamantealvie8@gmail.com','BUSTAMANTE','ALVIE','VILLANUEVA','MALE','NEW','2003-04-06','POBLACION, KAPATAGAN LANAO DEL NORTE','09954793616','bustamantealvie8@gmail.com','BSBA-MM','BSOA','FULL ONLINE',NULL,'Lanao del Norte','Kapatagan','Poblacion',19899,'Purok Makuguihon/17','2021-06-24 09:42:19','$2y$10$n.QOGCdFKzlLtn0z0Ca3/u9A1wy2fkfRfJczaNWaVxjjQlOnMKdx.','STUDENT',NULL,'2021-06-24 09:33:29','2021-06-24 09:42:19'),
(990,'Ronnie Caroro','CARORO','RONNIE','VILLOSIDO','MALE','TRANSFEREE','2021-05-21','BAGAKAY OZAMIZ CITY','09653498328','mhedannyindong82@gmail.com','BS CRIM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'P-2 bagakay ozamiz city',NULL,'$2y$10$i3ka6Qq7K4k.kaBekoTmdeH8ZzrzcK7OKYi0.CmC1awLcmOt6if46','STUDENT',NULL,'2021-06-24 09:34:26','2021-06-24 09:34:26'),
(991,'Jovylivanapales@yahoo.com','APALES','JOVYL IVAN','BANGUIS','MALE','TRANSFEREE','2001-11-09','BICUTAN TAGUIG CITY','09052180897','ajovylivanapales@gmail.com','BSED-MAPEH','BS CRIM','BLENDED',NULL,'Misamis Occidental','Aloran','Labo',25844,'Purok-2',NULL,'$2y$10$2U0bk5QlLlqM0o8iDxDptOKizVS/uHLCjMA0UYrmn/p7u/A.h1N9G','STUDENT',NULL,'2021-06-24 09:36:55','2021-06-24 09:36:55'),
(992,'Pearl_pitogo21','PITOGO','PEARL MARIE','JOSOL','FEMALE','NEW','2003-04-21','TANGUB CITY','09074788388','pitogopearl21@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok Venus','2021-06-24 09:40:28','$2y$10$z6rPeb72L1xiXV79idhwQuYS3xiYy/tvKFi.yku4trjYmmePS.P5q','STUDENT',NULL,'2021-06-24 09:37:22','2021-06-24 09:40:28'),
(993,'@Jane_19','CAPARIDA','KHRIEZA JANE','A.','FEMALE','NEW','2002-08-01','SAN JOSE TAMBULIG ZDS','09355957069','Khriezajane@gmail.com','BSCS','BSCS','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','San Jose',41384,'PUROK 1','2021-06-24 09:41:19','$2y$10$48cFSQJTuUyD2aMcj8JoBujj1e7NGkEQUPUByWvQaYZJ08LnT5JAa','STUDENT',NULL,'2021-06-24 09:37:59','2021-06-24 09:41:19'),
(994,'Melodyfuentes2023@gmail.com','FUENTES','MELODY','BUGHAO','FEMALE','NEW','2003-05-20','EASTERN LOOC, PLARIDEL, MISAMIS OCCIDENTAL','09077216592','melodyfuentes2023@gmai.com','BSED-FIL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Plaridel','Eastern Looc',26168,'Purok Espada',NULL,'$2y$10$iCaIHvUlgLcD5I6ZTjez0eulldGQqEiYTFQ76jNHBUHN598kb3vJO','STUDENT',NULL,'2021-06-24 09:39:57','2021-06-24 09:39:57'),
(995,'Mayee18','ARDOñA','MARIEL','SABELLANO','FEMALE','NEW','2002-03-13','INASAGAN AURORA ZAMBOANGA DEL SUR','09165613101','ardoniamariel@gmail.com','BSED-MATH','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Aurora','Inasagan',40786,'Lower Inasagan, Purok Maabi-abihon','2021-06-24 09:45:37','$2y$10$AmHgu4GkiwuYkHyB2syi2urT.dpBM/OcWGfZ/Idvk97Q6omXZIRU6','STUDENT',NULL,'2021-06-24 09:41:57','2021-06-24 09:45:37'),
(996,'Carlo','PACQUIAO','JHON CARLO','','MALE','NEW','2000-02-18','OZAMIZ CITY','09516550654','jhoncarlopacquiao@gmail.com','BSBA-HRM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Malaubang',26126,'P-3 malaubang','2021-06-24 09:44:15','$2y$10$rOZ/Cl9Y5JeovgPl8mjN8u3SjbVcXxeV4dtCmyXZ2ak9wscPmZTbu','STUDENT',NULL,'2021-06-24 09:42:12','2021-06-24 09:44:15'),
(997,'EdjayBonglay21','BONGLAY','EDJAY','','MALE','NEW','2018-11-21','CARCAR CITY CEBU','09279869031','edjaybabyboy@gmail.com','BS CRIM','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Poblacion',25906,'P-2','2021-06-24 09:54:44','$2y$10$8pwoBfIvvG7aP.bixkph3uURfMItRnKTrs3ebBMPRSzIT2bqBbamq','STUDENT',NULL,'2021-06-24 09:42:37','2021-06-24 09:54:44'),
(998,'Charles Escatron','ESCATRON','CHARLES','MARTIZANO','MALE','NEW','2001-09-28','SEGATIC DIOT, CLARIN, MISAMIS OCCIDENTAL','09519392338','charlesescatron@gmail.com','BS CRIM','BSOA','BLENDED',NULL,'Misamis Occidental','Clarin','Segatic Diot',25960,'PUROK 1','2021-06-24 09:46:27','$2y$10$28pYGhCZWCCkLisXW8QE0OMsA4uJkIyUXRnnxLNEIV2eCsRbRVOrm','STUDENT',NULL,'2021-06-24 09:42:43','2021-06-24 09:46:27'),
(999,'justinjamesyagao@gmail.com','MARAPAO','STEPHANIE','SABAR','FEMALE','NEW','2002-11-03','TONDO, MANILA','0938 306 7223','justinjamesyagao@gmail.com','BS CRIM','AB POLSCI','FULL ONLINE',NULL,'Misamis Occidental','Panaon','Baga',26141,'Purok 1 Lunas',NULL,'$2y$10$JVMERX5GXD6q5khWnKSIvOc5/hb3qLdfDSxuOTv5gKsH4bsLEGwC.','STUDENT',NULL,'2021-06-24 09:43:54','2021-06-24 09:43:54'),
(1000,'Jolie Mae Floren','FLOREN','JOLIE MAE','LARGO','FEMALE','NEW','2001-12-09','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09505623126','florenjolie18@gmail.com','GEN  MID','BSOA','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 09:46:40','$2y$10$d0sgwkx3R0rIEc9tXGCzn.hxGG2AwXtsJRdJ9WWVgXQqWmDwA/bdS','STUDENT',NULL,'2021-06-24 09:44:14','2021-06-24 09:46:40'),
(1001,'Bazarj','BAZAR','JOREY','BONGCAWIL','MALE','NEW','2002-11-04','LORENZO TAN TANGUB CITY','09071128531','ecarniser@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok-4','2021-06-24 09:45:49','$2y$10$odaTAOOc6He8LcmRlRCT0Ofa11TtLRvBY8JJJVXGB3m018gumH.Cq','STUDENT',NULL,'2021-06-24 09:44:33','2021-06-24 09:45:49'),
(1002,'cosep602@gmail.com','COSEP','EDISON','','MALE','NEW','2002-08-01','TANGUB CITY','09657296327','cosep602@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Tangub City','Pangabuan',26272,'Purok-9 Baybay talisay','2021-06-24 09:46:31','$2y$10$LTU7WSBTg0T0r2kwurEihO63iVJbfJWo73QUEjUcbv9c/o2i99Qku','STUDENT',NULL,'2021-06-24 09:44:43','2021-06-24 09:46:31'),
(1003,'Marianegracefuertes@gmail.com','FUERTES','MARIANE GRACE','CUAJOTOR','FEMALE','NEW','2002-12-22','CASUSAN ALORAN MISAMIS OCCIDENTAL','09150475595','marianegracefuertes@gmail.com','BS CRIM','BSED-MATH','BLENDED',NULL,'Misamis Occidental','Aloran','Casusan',25838,'Purok 3','2021-06-24 09:47:39','$2y$10$wkKc85YyZeoE.DOoCIeT7OLLtOwLMcrY9Zl2/Hqq13WWhRKeYJsge','STUDENT',NULL,'2021-06-24 09:45:16','2021-06-24 09:47:39'),
(1004,'JoselynVillasin','VILLASIN','JOSELYN','BARORO','FEMALE','NEW','2002-06-25','CALAMBA DISTRICT HOSPITAL','09755060807','villasinjoselyn3@gmail.com','BSED','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Plaridel','Northern Poblacion',26180,'Purok 1','2021-06-24 09:47:58','$2y$10$vTyiBDZmwypUS8vG1Ty4pebl3Ki4po6mAN1ruLjzLMoVUpx4kpgBS','STUDENT',NULL,'2021-06-24 09:45:47','2021-06-24 09:47:58'),
(1005,'Jonieboyamucay123@gmail.com','AMUCAY','JONIEBOY','MANDAO','MALE','NEW','2000-01-31','LAMPASAN DON VICTORIANO','09187277114','Jonieboyamucay12345@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Don Victoriano Chiongbian','Tuno',25990,'Purok 2, Tuno Don Victoriano Misamis Occidental',NULL,'$2y$10$Ftk3UtVVEYozadV5jKFJfOcYzC3FXpr3QjiQ/TAwXJN//nRjfeBQW','STUDENT',NULL,'2021-06-24 09:46:10','2021-06-24 09:46:10'),
(1006,'Jhaane','TOLENTINO','JANE','CALAGO','FEMALE','NEW','2002-08-24','PARASAN','09357432351','tolentinojhane433@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok Anibong',NULL,'$2y$10$X4bY/QidmLDrhepDyRoWtuohzWw9wMtmAavaf/K9EghaFQeqllBfy','STUDENT',NULL,'2021-06-24 09:46:16','2021-06-24 09:46:16'),
(1007,'agotkenthjoshua@gmail.com','AGOT','KENTH JOSHUA','MAGLANGIT','MALE','NEW','2001-11-09','LOOC PROPER PLARIDEL MIS. OCC.','09386700693','agotkenthjoshua@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Plaridel','Looc Proper',26174,'purok 6','2021-06-24 09:53:25','$2y$10$Nd7lqj/sN2baOemZzOpZU.9U9GhSg30n5CW49zAMX8bZUUbpa8g3i','STUDENT',NULL,'2021-06-24 09:48:13','2021-06-24 09:53:25'),
(1008,'richshellylangi.08','LANGI','RICHSHELLEY','BONTES','FEMALE','NEW','2002-03-08','LOBOGON, ALORAN, MISAMIS OCCIDENTAL','09639397973','rchshlly.08@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Aloran','Lobogon',25846,'Rubia','2021-06-24 10:27:11','$2y$10$QCG8fQ.i25lcFyQirHE6cuht77SlC.U0vySDd9X1nkyTy2v5H9j9.','STUDENT','QdGszfX2CImhRFM2ixYAc3QneKG4QnmmQtxqnaRFwcpLPgJeBvNdqcE7Hft1','2021-06-24 09:49:37','2021-06-24 10:27:11'),
(1009,'Apple Mae','CAYLAN','APPLE MAE','TULBA','FEMALE','NEW','2021-12-18','POOK TSINA, SABANG, LIPA CITY','09639638878','caylanapplemaetulba@gmail.com','BSED-ENGL','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Do±a Consuelo',26111,'P-6',NULL,'$2y$10$NzO.2zF1M478gXnX3DazuujzuitcY5iQ.0deUakHdcQUpyem3Gnfa','STUDENT',NULL,'2021-06-24 09:51:57','2021-06-24 09:51:57'),
(1010,'Pradojmark','PRADO','JOHN MARK','AMACNA','MALE','NEW','2002-10-17','UPPER TIPARAK TAMBULIG ZDS','09094903271','pradojmark@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok7 pinya',NULL,'$2y$10$8GvH11YrQZezmL4cP5RY0eiaCe/6nuFvbkurFfcirmjAWSlstveKq','STUDENT',NULL,'2021-06-24 09:52:22','2021-06-24 09:52:22'),
(1011,'Maryrosejlaboga','LABOGA','MARY ROSE','JUMUAD','FEMALE','NEW','2002-04-29','PUROK 5 LABUAY, MAIGO, LANAO DEL NORTE','09975921924','maryrosejlaboga@gmail.com','BSOA','BS CRIM','FULL ONLINE',NULL,'Lanao del Norte','Maigo','Labuay',20014,'Purok 5','2021-06-24 09:53:09','$2y$10$mVW51nSQcvLP8QmYKdAJeOoIuPL255Js83RFgsjzGHkBdLu9WfK6K','STUDENT',NULL,'2021-06-24 09:52:36','2021-06-24 09:53:09'),
(1012,'Kizzy Looc','LOOC','KIZZY MAE','BANSUA','FEMALE','RETURNEE','1998-01-17','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09554515498','loockizzymae@gmail.com','GEN  MID','BSOA','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 09:54:37','$2y$10$bs8sHPH2eICYeERtEGch2eifaLDuZMwJFIMJGrTrHTn4fhYnZr7gG','STUDENT',NULL,'2021-06-24 09:53:38','2021-06-24 09:54:37'),
(1013,'sismundocindy6@gmail.com','SISMUNDO','CINDY','BULAT-AG','FEMALE','NEW','2002-06-08','OZAMIS CITY','09512041426','sismundocindy6@gmail.com','BSOA','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Bogo Capalaran',41166,'Purok Tarsing','2021-06-24 09:56:41','$2y$10$nXgkPmV6T32Q84qgdoTu.uq72K2LYIijdV9ju3pw2.yjJL/cYxvTG','STUDENT',NULL,'2021-06-24 09:54:15','2021-06-24 09:56:41'),
(1014,'Nidyloujanemanayan07','MANAYAN','NIDYLOU JANE','PEPANIA','FEMALE','NEW','2003-07-05','OROQUIETA CITY','09381372720','nidyloujanemanayan215@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Oroquieta City','Ciriaco C. Pastrano',26051,'Purok 2','2021-06-24 10:23:06','$2y$10$s6ff0YYMtXXA4s4j3afVJOtkKDnmUZfnOEXE5d1DrdfSGjzgcAGdi','STUDENT',NULL,'2021-06-24 09:54:18','2021-06-24 10:23:06'),
(1015,'Marycindy','MANDAO','MARY CINDY','VALLES','FEMALE','NEW','2003-02-02','CONAT, ALORAN','09292627135','mandaomarycindy@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Aloran','Conat',25839,'PUROK 2',NULL,'$2y$10$sXqEchtMgw2MxoBymHSeg.7LNdH.4lKYp/ZtVSyVGnLtnBEBq8HeW','STUDENT',NULL,'2021-06-24 09:54:36','2021-06-24 09:54:36'),
(1016,'Jamby Kyla Aguhob','AGUHOB','JAMBY KYLA','RODRIGUEZ','FEMALE','NEW','2003-09-24','BALATACAN,TANGUB CITY','09150446156','jambyaguhob@gmail.com','AB POLSCI','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Balatacan',26236,'pasayan',NULL,'$2y$10$V9NPb7agopfA592gHEfB8.3sYKVuLeXajsg840sPDlS2GKzfwrNkK','STUDENT',NULL,'2021-06-24 09:55:15','2021-06-24 09:55:15'),
(1017,'markchristianquaton07','QUATON','MARK CHRISTIAN','DURIG','MALE','NEW','2002-01-07','MANILA','09120588918','christianquaton@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Misamis Occidental','Sinacaban','Sinonoc',26233,'Purok Piape','2021-06-24 10:00:45','$2y$10$FnUvbJSv3nhFrLJaDyiGNuTyY/hOLiZD7abHIh8OCTo.E3oAJi0De','STUDENT',NULL,'2021-06-24 09:55:19','2021-06-24 10:00:45'),
(1018,'April Grace B. Undag','UNDAG','APRIL GRACE','BANAAG','FEMALE','NEW','2000-04-19','DALIGDIGAN SALVADOR LANAO DEL NORTE','09514899216','undagapril39@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Lanao del Norte','Salvador','Daligdigan',20158,'Purok 1','2021-06-24 09:57:00','$2y$10$SGyWYF0R4uJ8DHzHH9bHqeEB8dZAzZrH.60EPBkN2Q2TjUlQEAkdW','STUDENT',NULL,'2021-06-24 09:55:26','2021-06-24 09:57:00'),
(1019,'Abel Dagaas otom','OTOM','ABEL','DAGAAS','FEMALE','NEW','2002-07-21','MIGPANGE BONIFACIO MISS OCC.','09700757788','abelotom11x@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Migpange',25903,'Purok 4 Migpange','2021-06-24 09:59:21','$2y$10$X37StxVUl9LjQrByS4RGGu2jn2RxIqz6ZCeZzq6Bh1VyrqRoTzET6','STUDENT',NULL,'2021-06-24 09:55:41','2021-06-24 09:59:21'),
(1020,'Jerrylyn','GIRIT','JERRYLYN','LANTACA','FEMALE','NEW','2002-07-09','TANGUEGUIRON, TUBOD, LANAO DEL NORTE','09363496724','jerrylyngirit@gmail.com','BSED','BSOA','BLENDED',NULL,'Lanao del Norte','Kolambugan','Simbuco',19945,'7','2021-06-24 09:56:37','$2y$10$TJhMRMKEObCEZJC.5PxYvOCk60mm75sDOQ6gHlzpSFVQVbiuBOnEm','STUDENT',NULL,'2021-06-24 09:55:52','2021-06-24 09:56:37'),
(1021,'Maria sumalinog','SUMALINOG','MARIA CHRISTEL MAE','SENO','FEMALE','NEW','2003-09-23','KATIPUNAN RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09550552149','sumalinogmaria9@gmail.com','BSBA-MM','BSOA','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Katipunan',41266,'Purok1-A','2021-06-24 09:58:53','$2y$10$O0pax7EaPljA/pwkRLn8U.706y7Px7SrJuyJDpiskbGEl3AP0D0ri','STUDENT',NULL,'2021-06-24 09:56:34','2021-06-24 09:58:53'),
(1022,'Edjay Sagario Gascon','GASCON','ED JAY','S','MALE','NEW','2002-11-19','SM LAO','09304754846','Edjaygascon2@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'Purok 1 san jose village',NULL,'$2y$10$HtmmnD1Np2mKAzuBnSxWI.JfO87KIUvrnkwddpdlE19iyF7C3mq2C','STUDENT',NULL,'2021-06-24 09:56:37','2021-06-24 09:56:37'),
(1023,'Joshua_lusterio12','LUSTERIO','JOSHUA','VENEZUELA','MALE','NEW','2002-07-16','POBLACION SINACABAN MISSAMIS OCCIDENTAL','09754730153','joshlusterio1602@gmail.com','BS CRIM','BSISM','FULL ONLINE',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Purok Santal 1',NULL,'$2y$10$T00xZKXFcWn7kgMy/.JC0ump2asf.Zc9BmoiP29dQydQTmtl.MGK6','STUDENT',NULL,'2021-06-24 09:58:34','2021-06-24 09:58:34'),
(1024,'Ruela Abuan','ABUAN','RUELA','LUMACTOD','FEMALE','NEW','2002-11-18','SM. LAO. OZAMIZ CITY','09516545491','abuanruela@gmail.com','AB COMM','BSOA','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'Purok 5','2021-06-24 09:59:30','$2y$10$M2aKatUUBPxjI2BJaLGWUurhiOJtsYatF31Xq7M9e8vhR5TXzlAtS','STUDENT',NULL,'2021-06-24 09:58:53','2021-06-24 09:59:30'),
(1025,'Zachy','TOLENTINO','JANE','CALAGO','FEMALE','NEW','2002-08-24','PARASAN','09352571668','tolentinojane433@gmail.com','BSBA-MM','BSBA-HRM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Parasan',41179,'Purok Anibong','2021-06-24 09:59:29','$2y$10$wd.lcRKMjN9tPlw8oydW/uTALlffsttLkQ1uS/FfxDBcKWmBtK.EG','STUDENT',NULL,'2021-06-24 09:59:04','2021-06-24 09:59:29'),
(1026,'Crisafern_28','FERNANDEZ','CRISA MARIEL','N/A','FEMALE','NEW','2001-09-10','MAQUILAO, TANGUB CITY','09078708308','crisamarielf@gmail.com','BSED-SOCSTUD','BSED','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Prenza',26273,'Purok 2','2021-06-24 10:16:06','$2y$10$pPiiEgBQRSJhHJw/JQw5yelLEnZwMntwE3HL/6Y4z1OgudvaaT5z.','STUDENT',NULL,'2021-06-24 09:59:13','2021-06-24 10:16:06'),
(1027,'Marian Mae Lumingkit','LUMINGKIT','MARIAN MAE','GOMEZ','FEMALE','NEW','2002-11-14','STA.MARIA TANGUB CITY','09062413868','marianlumingkit@gmail.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok 6','2021-06-24 10:15:28','$2y$10$mWJf4TYFroe3YKkg6DTLRezfmJ/v.Ut2VJAhFstwPu.ehA68sZxhy','STUDENT',NULL,'2021-06-24 09:59:16','2021-06-24 10:15:28'),
(1028,'Maryrose','VERADIO','MARY ROSE','MACUTOB','FEMALE','NEW','2003-01-05','TUBOD, LANAO DEL NORTE','09659706478','veradiomarymacutob@gmail.com','BSED','BSED','BLENDED',NULL,'Lanao del Norte','Tubod','Taden',20276,'3','2021-06-24 10:20:23','$2y$10$TIorVSsQKFJieajBl/4fsu8KSR9RLyQa3AeVD4Thr7IIhTLPT6z0C','STUDENT',NULL,'2021-06-24 10:17:38','2021-06-24 10:20:23'),
(1029,'scharlitwamelda@gmail.com','WAMELDA','SCHARLIT','MALINAO','FEMALE','NEW','2003-02-08','SILANGIT TANGUB CITY','09516530998','scharlitwamelda@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Misamis Occidental','Tangub City','Barangay V - Malubog',26243,'Purok-3 7th South Street','2021-06-24 10:18:55','$2y$10$LEGKEujT8ETLML0Abx.WGe1F9rdSeYMbpgB6abgTIPZNogstJi/4y','STUDENT',NULL,'2021-06-24 10:18:02','2021-06-24 10:18:55'),
(1030,'Diego Nacion','NACION','DIEGO','SASAM','MALE','NEW','2002-02-23','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09166205793','naciondiego21@gmail.com','GEN  MID','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 10:23:55','$2y$10$JVok.RHByqaSV/vnqF/V3ORQ0b3OLPyDOFKihT6kqf5a.w7aznMwS','STUDENT',NULL,'2021-06-24 10:19:31','2021-06-24 10:23:55'),
(1031,'daisyjaneperez323@gmail.com','PEREZ','DAISY JANE','LISONDRA','FEMALE','NEW','2002-04-01','S.M LAO GENERAL HOSPITAL','09302586154','daisyjaneperez323@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok 8 Mayors village','2021-06-24 10:24:52','$2y$10$08/CN6UpVfF2nSK7Ir88hOXI5.x4ViwqpPCqHVlWlFxQzDa.Ggt9q','STUDENT',NULL,'2021-06-24 10:20:41','2021-06-24 10:24:52'),
(1032,'mitzilobiano05@gmail.com','LOBIANO','MITZI ABEGAIL','TRASONA','FEMALE','NEW','2003-06-28','IGANO COMMUNITY HOSPITAL','09480543972','mitzilobiano05@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Zamboanga del Sur','Molave','Mabuhay',41174,'Purok Paglaum',NULL,'$2y$10$GxR7w1QuMTW6LNbjJGOkfODm/BhfNbfJDajW8ZjJS9f.NgcVDPZDS','STUDENT',NULL,'2021-06-24 10:20:46','2021-06-24 10:20:46'),
(1033,'clargen1521@gmail.com','CAñADORA','CLARGEN','ROJO','FEMALE','NEW','2003-01-31','BASAK MANDAUE CITY, CEBU','09357374807','Clargen1521@gmail.com','BEED','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok 5','2021-06-24 10:21:51','$2y$10$0V8jajcej23uPrdLc3Ja8.B8/ojajaJSJ.lnO62qEgMUYP3X9nzdy','STUDENT',NULL,'2021-06-24 10:21:35','2021-06-24 10:21:51'),
(1034,'Cocajann@gmail.com','COCA','JAY-ANN','LALIM','FEMALE','NEW','2003-07-04','BAMBONG DAKU RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09975761809','cocajayann@gmail.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Paradise',41272,'Purok 4',NULL,'$2y$10$ptfJSBAnYcRuVjHa1/EwCORm5wRqm3mL4vf9J.C7XJ513nIsHy0rS','STUDENT',NULL,'2021-06-24 10:21:45','2021-06-24 10:21:45'),
(1035,'Jenmermagallanesegas','EGAS','JENMER','MAGALLANES','MALE','NEW','2021-11-12','LINCONAN','09673044332','jenmeregas@mail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Linconan',25899,'Purok 1',NULL,'$2y$10$YPt6SV1rM8aTt/sStk/qoOj58dCaT2oWdxNEVWrTMvLFUMnaZjeYi','STUDENT',NULL,'2021-06-24 10:22:06','2021-06-24 10:22:06'),
(1036,'albarracinivan','ALBARRACIN','IVAN','SARNO','MALE','NEW','2001-07-17','P-3 BONGABONG TANGUB CITY','09651896810','albarracinivan812@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'P-3','2021-06-24 10:23:45','$2y$10$5kKrWKQDgfqPXPnzlO995etLAMyq.UFwqnmaQuWD.Oe8wdWi28YgG','STUDENT',NULL,'2021-06-24 10:22:11','2021-06-24 10:23:45'),
(1037,'Jayravel','CALUNSAG','JAYRAVEL','SUANER','FEMALE','NEW','2003-02-19','BAGUITAN GUIPOS ZAMBOANGA DEL SUR','09515776499','calunsagjayravel@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Malaubang',26126,'P-2 Malaubang Talisay','2021-06-24 10:47:19','$2y$10$QA12aJk/5KhPC704Fda2.unRJPOYtYPoH9qfzQWIkgZPkdWxmIOQe','STUDENT','GLZ6ishGaFv2WKwsoR4ScKHFzF7tTPXJxCbBYuHEejNu2ysmI9ccOsaeqOe8','2021-06-24 10:22:21','2021-06-24 10:47:19'),
(1038,'rosselynbraga@gmail.com','BRAGA','ROSSELYN','SOLIS','FEMALE','NEW','2002-11-11','STA.CRUZ MAHAYAG ZAMBOANGA DEL SUR','09292061251','rosselynbraga@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Mahayag','Boniao',41084,'Purok 3','2021-06-24 10:24:26','$2y$10$YaczecHjC4aYlZDBmUaJUOodVIbaOWWL4hXrWCkX45nLDMORfcq.G','STUDENT',NULL,'2021-06-24 10:22:46','2021-06-24 10:24:26'),
(1039,'dannierose021@gmail.com','BUDLONG','DANNIE ROSE','BARIñAN','FEMALE','NEW','2002-12-21','MALINGAO, TUBOD, LANAO DEL NORTE','09651540219','dannierose021@gmail.com','BSED-ENGL','GEN  MID','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Malingao',20267,'P4','2021-06-24 10:29:30','$2y$10$sxIzMDtJAh8R0OKgiQw8F.mdMK/6JxBImKrpjPWotFCEm2e3QKft2','STUDENT',NULL,'2021-06-24 10:23:05','2021-06-24 10:29:30'),
(1040,'Johnmarkprado','PRADO','JOHN MARK','AMACNA','MALE','NEW','2002-10-17','UPPER TIPARAK TAMBULIG ZDS','09094903271','pradojmark17@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Upper Tiparak',41391,'Purok7 pinya','2021-06-24 10:28:31','$2y$10$vRyfTrCg999OumSzePYzFuvn7hMu8p5UTabyWTvqpVYLuA.Ynsir.','STUDENT',NULL,'2021-06-24 10:24:14','2021-06-24 10:28:31'),
(1041,'recorteykingh@gmail.com','HORTILANO','ART JESUA','CASTRO','MALE','NEW','2001-12-08','MAQUILAO, TANGUB CITY','09108831032','recorteykingh@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok 1',NULL,'$2y$10$xaCcEgAQ0f0N.OzTadYnieGlb8bKBViSyZkhu2/8sGXBjjBFjI70O','STUDENT',NULL,'2021-06-24 10:24:20','2021-06-24 10:24:20'),
(1042,'clarkzone1010@gmail.com','BATION','CLARK','MANGUILIMOTAN','MALE','NEW','2021-07-10','KAPATAGAN LANAO DEL NORTE','09362355523','clarkzone1010@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Lanao del Norte','Baroy','Poblacion',19824,'4','2021-06-24 10:26:04','$2y$10$QlGLH431zwi7t8zKsTnBMuR0YUN0u7267DAx9ZJRyQN4yZPCsx7z.','STUDENT',NULL,'2021-06-24 10:25:19','2021-06-24 10:26:04'),
(1043,'Andrey','TUASTOMBAN','ANDREY','BONGO','MALE','TRANSFEREE','2003-04-08','LITAPAN OZAMIZ CITY','09665745384','andreytuastomban6@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Litapan',26125,'Purok-4 Litapan Ozamiz City',NULL,'$2y$10$EijbJBJ10U4KCzhKhxN7WeiRpTKX8Qfvz8gRUI0u82utUK9xJ4oNW','STUDENT',NULL,'2021-06-24 10:25:56','2021-06-24 10:25:56'),
(1044,'Cristine','VILLAPA','CRISTINE','CATMON','FEMALE','NEW','2021-09-30','SURIGAO DEL SUR','09505816399','cristinereyes962@gmail.com','BSED-MAPEH','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Lourmah',41090,'Purok 3','2021-06-24 10:31:20','$2y$10$4pQiMu94FBQMOc2N0rtNZ.oDycEVryiXUxfSglgCl1i7c5fsGIETi','STUDENT',NULL,'2021-06-24 10:26:07','2021-06-24 10:31:20'),
(1045,'AizaaSaberon@gmail.com','MANABAY','AIZA','S.','FEMALE','NEW','2001-11-17','BAG-ONG ARGAO MOLAVE, ZAMBOANGA DEL SUR','09512677486','AizaaSaberon@gmail.com','BSED-ENGL','AB COMM','BLENDED',NULL,'Zamboanga del Sur','Molave','Bagong Argao',41163,'Purok 5','2021-06-24 10:38:50','$2y$10$pkmoy3CXSlrk7rWaEvWObOuRFPpPAhDNCMSt16gW8QviORhFPq29e','STUDENT',NULL,'2021-06-24 10:27:02','2021-06-24 10:38:50'),
(1046,'Sarnosheilamae@gmail.com','SARNO','SHEILA MAE','CHAVEZ','FEMALE','NEW','2001-07-07','BAG-ONG ARGAO','09632460420','sarnosheilamae@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Zamboanga del Sur','Molave','Bagong Argao',41163,'Purok 1',NULL,'$2y$10$9zq3HB.IJUAeN3YK2/zajuiuLe94qP9V0oA1Ntar5XZ/Qv4UMNAPK','STUDENT',NULL,'2021-06-24 10:27:11','2021-06-24 10:27:11'),
(1047,'Abigaishaira11@gmail.com','OSTIA','ABIGAIL SHAIRA','BAER','FEMALE','NEW','2001-07-11','MAYPAJO CALOOCAN CITY','09530522311','abigailshaira11@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Clarin','Poblacion III',25956,'Puro 3',NULL,'$2y$10$UK4WIw7GGCX1xHzXP7EmHOai/g7gbAlyWjZBvgcwJhipvUfid1dI6','STUDENT',NULL,'2021-06-24 10:27:12','2021-06-24 10:27:12'),
(1048,'Ladymaeeng','OLIVAR','LADY MAE','PAMPILO','FEMALE','NEW','2002-12-16','MAQUILAO, TANGUB CITY','09481567119','ladymaeolivar2002@gmail.com','BSED-MAPEH','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Malipayon','2021-06-24 10:30:24','$2y$10$c3T5STRix840Im8iP.1o3ujJ.mI902lp/gkuF0JeQo8Sj7O5LKrm6','STUDENT',NULL,'2021-06-24 10:27:50','2021-06-24 10:30:24'),
(1049,'Junafe Cañete','CAñETE','JUNAFE','HISULER','FEMALE','NEW','2002-09-23','LORENZO TAN TANGUB CITY','09975878700','Junafe@xn--caete-pta','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Lorenzo Tan',26260,'Purok 7 Upper Lorenzo Tan',NULL,'$2y$10$QU2IeJggzebovVmu/bzoresSSKJq4x3O922.qGxGbPOfqAev7t3KS','STUDENT',NULL,'2021-06-24 10:30:07','2021-06-24 10:30:07'),
(1050,'JhecyMarcMaghinay','MAGHINAY','JHECY MARC','GALINATO','MALE','NEW','2003-03-21','MOLAVE ZAMBOANGA DEL SUR','09512665894','GalinatoJM21@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Campo IV',41259,'Manga','2021-06-24 10:33:00','$2y$10$R6QvjybOkzjWHCLSmhB8WuRL4ATHCH2.OIoj9VqmMR/MAB6.hbO7S','STUDENT',NULL,'2021-06-24 10:32:02','2021-06-24 10:33:00'),
(1051,'artjesuahortilano19@gmail.com','HORTILANO','ART JESUA','CASTRO','MALE','NEW','2001-12-08','MAQUILAO, TANGUB CITY','09389673514','artjesuahortilano19@gmail.com','BS CRIM','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Maquilao',26265,'Purok 1',NULL,'$2y$10$kwqzqMCnm0st.a3.s1FGkuHnCw3lq78UvDitJn/XJ13M4qxQTc9oi','STUDENT',NULL,'2021-06-24 10:32:04','2021-06-24 10:32:04'),
(1052,'valtagalogon5@gmail.com','TAGALOGON','VAL','TUMAMPOS','MALE','NEW','2003-02-14','MOPH','09150434242','valtagalogon5@gmail.com','BSED','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Aloran','Palayan',25858,'6','2021-06-24 10:33:00','$2y$10$VAPPOAAbbZUkQDBt3NfhDeZkRRtzTeu/By8DFqzF699jpBY2sSG5a','STUDENT',NULL,'2021-06-24 10:32:31','2021-06-24 10:33:00'),
(1053,'rafaelchristian.samson','SAMSON','RAFAEL CHRISTIAN','JUMAO-AS','MALE','NEW','2002-04-11','OZAMIZ CITY','09460611759','rafaelchristian.samson11@gmail.com','BSCS','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Baybay Santa Cruz',26097,'Zamora Extension','2021-06-24 10:34:23','$2y$10$ADWJ1gUgbCrcyATyjZRrs.IP6mqJKRRATYCh7n9zboA.zIM4HgjUK','STUDENT',NULL,'2021-06-24 10:33:12','2021-06-24 10:34:23'),
(1054,'Rio burlat','BURLAT','RIO','MATANOG','MALE','NEW','2001-01-21','BARANGAY MILIGAN MOLAVE','09513746540','rioburlat143@gmail.com','GEN  MID','BSED-FIL','FULL ONLINE',NULL,'Zamboanga del Sur','Molave','Miligan',41178,'Purok ferry','2021-06-24 10:44:47','$2y$10$T9bDar6CAh3jr5al8qAujObCnlA8S0NCP.u4mZv.aPNuJ3b6hspKO','STUDENT',NULL,'2021-06-24 10:34:17','2021-06-24 10:44:47'),
(1055,'JambyAguhob','AGUHOB','JAMBY KYLA','RODRIGUEZ','FEMALE','NEW','2003-09-24','BALATACAN, TANGUB CITY','09150446156','itsjamby24@gmail.com','AB ENGLISH','BSOA','BLENDED',NULL,'Misamis Occidental','Tangub City','Balatacan',26236,'Pasayan',NULL,'$2y$10$XnoBRq60ye3uT7LuyyHJ4OHkw6Za0kKZFOhrnN.8uaMeA.Hqz4R3S','STUDENT',NULL,'2021-06-24 10:34:44','2021-06-24 10:34:44'),
(1056,'Grace16','HORTELANO','GRACE','UCAB','FEMALE','NEW','2002-03-16','BONGBONG OZAMIS CITY','09639244255','gracehortelano123456@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1 Barangay Bongbong Ozamis City','2021-06-24 11:10:37','$2y$10$xGLl19RzoKEfdM1ZAvSpaeJweRlhDRiJcINmptCMgpvGq3YXP/idu','STUDENT',NULL,'2021-06-24 10:35:01','2021-06-24 11:10:37'),
(1057,'suico.marvejoy2000@gmail.com','SUICO','MARVE JOY','SAPIO','FEMALE','RETURNEE','2000-08-12','P1 LIBRA LOWER SALUG DAKU, MAHAYAG, ZAMBOANGA DEL SUR','09566299955','suico.marvejoy2000@gmail.com','BSBA-MM','BS CRIM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Lower Salug Daku',41091,'PUROK 1 LIBRA','2021-06-24 10:36:42','$2y$10$UPPCrIegEmnml6XYHpD6S.brWypjvV45yiqHkNFKPEmCqrfb/72ZO','STUDENT',NULL,'2021-06-24 10:35:36','2021-06-24 10:36:42'),
(1058,'Renjhonmagsayo','MAGSAYO','REN JHON','MAALAM','MALE','NEW','2002-11-12','COTABATO CITY','09128750428','magsayorenjohn@gmail.com','BSED-MAPEH','BSISM','BLENDED',NULL,'Misamis Occidental','Clarin','Tinacla-An',25961,'Purok 6','2021-06-24 10:39:07','$2y$10$T61qQtr/Z3bP4hhNHVqRp.hMftwGVAmFnS0YDuompRC/oUAFM972i','STUDENT',NULL,'2021-06-24 10:35:36','2021-06-24 10:39:07'),
(1059,'Kristineramos873@gmail.com','RAMOS','KRISTINE','HOLNANERO','FEMALE','NEW','2001-12-04','BAG-ONG ARGAO MOLAVE ZAMBOANGA DEL SUR','09074624303','kristineramos873@gmail.com','BSED-ENGL','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Molave','Bagong Argao',41163,'5',NULL,'$2y$10$iHoQbai7OVgXCiNdmkQqHegN74DItJWaTO60F0eM31jlfrtbH/O9.','STUDENT',NULL,'2021-06-24 10:36:14','2021-06-24 10:36:14'),
(1060,'janjiealjas','ALJAS','JANJIE','MENSURADO','FEMALE','NEW','2003-08-01','SWITCH, RAMON MAGSAYSAY','09306320767','janjie.aljas1@gmail.com','BSCS','BSCS','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok 1 Malipayon','2021-06-24 10:40:14','$2y$10$GEO5FoFKB0/T53//FHy9juW2SJMEi40X5SkmkVmdbiTKiNlabXy9q','STUDENT',NULL,'2021-06-24 10:37:01','2021-06-24 10:40:14'),
(1061,'RevahCeniza10@gmail.com','CENIZA','REVA','AQUINO','FEMALE','NEW','2003-02-10','OZAMIZ CITY','09753217882','RevahCeniza10@gmail.com','BSED-ENGL','BSED-FIL','BLENDED',NULL,'Lanao del Norte','Baroy','Rawan Point',19826,'3','2021-06-24 10:37:42','$2y$10$mMSnXMhiFiIM/HSYrvFbHepZnOXYD5X02H.6/YmSYB5S8XI1bjmjG','STUDENT',NULL,'2021-06-24 10:37:28','2021-06-24 10:37:42'),
(1062,'tejadamecil@gmail.com','TEJADA','MECIL','BOLAY-OG','FEMALE','NEW','2002-02-09','MHARSGEN HOSPITAL','09070537640','tejadamecil@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Tudela','Pan-Ay Diot',26315,'Purok-2','2021-06-24 10:38:33','$2y$10$s6dAyximoRnV0sw8OMwLi.QJIsiKL/El05.CnHNKwcFETEwoXllhm','STUDENT',NULL,'2021-06-24 10:37:35','2021-06-24 10:38:33'),
(1063,'jpnsthegreat@gmail.com','SASA','JINGLE','ARDON','MALE','NEW','2003-01-21','CAMP 5 TUBOD LANAO DEL NORTE','09638146920','jpnsthegreat@gmail.com','BS CRIM','BEED','BLENDED',NULL,'Lanao del Norte','Tubod','Camp V',20260,'Putik 2',NULL,'$2y$10$0.lidO1K9VAbMABRiZOqnOrxtqgsC4NZRy0Qw/iRne6uW0R2tUk16','STUDENT',NULL,'2021-06-24 10:37:41','2021-06-24 10:37:41'),
(1064,'remarbazar00','BAZAR','REMAR','CAÑAMO','MALE','NEW','2000-04-12','TANGUB CITY','09663680460','remarbazar00@gmail.com','BSED-ENGL','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Tangub City','Paiton',26270,'Purok 7','2021-06-24 10:39:47','$2y$10$nB5oftjN7QAjyvk8jt8.JOzPvY9UANFxSo3e0/ogTPdl1XsZ7cAB2','STUDENT',NULL,'2021-06-24 10:38:52','2021-06-24 10:39:47'),
(1065,'paalisborijean@gmail.com','PAALISBO','RIJEAN','MARGAHA','FEMALE','NEW','2003-03-09','MHARS GEN. OZAMIZ CITY','09463137293','paalisborijean@gmail.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'Purok-4 San Antonio','2021-06-24 10:40:24','$2y$10$qQkSddHPTa76HEAHd7WJru1GmdMLY/Ei4Sx6q5ixFDpxDgU5ukNdO','STUDENT',NULL,'2021-06-24 10:39:03','2021-06-24 10:40:24'),
(1066,'juliemaepangasian128@gmail.com','PANGASI-AN','JULIE MAE','CANE','FEMALE','NEW','2002-07-11','OZAMIZ CITY','09514705519','juliemaepangasian128@gmail.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'Purok 4 Lam-an Blumentritt St.,','2021-06-24 10:41:17','$2y$10$ZBRrTlrh2HpOBH/2zjpMMeAVOFL4mGgzINbtZaMSWwUyHTPrN4o6S','STUDENT',NULL,'2021-06-24 10:39:03','2021-06-24 10:41:17'),
(1067,'Laycatapia@gmail.com','TAPIA','MA.LAYCA','CAMPOMANES','FEMALE','NEW','2003-05-22','REMEDIOS, BONIFACIO MISAMIS OCCIDENTAL','09093285270','laycatapia@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Remedios',25907,'Purok 2','2021-06-24 10:51:12','$2y$10$XfjpwAGGRYDk6Ey7hCe.Du8Y3w13/Sgku.JZtvuzjYwZhSPWM0lb2','STUDENT',NULL,'2021-06-24 10:39:03','2021-06-24 10:51:12'),
(1068,'johanamae015@gmail.com','VILLA','JOHANA MAE','MIRAL','FEMALE','NEW','2003-03-26','SAN FERNANDINO R.T.LIM ZAMBOANGA SIBUGAY','+639957416397','johanamae015@gmail.com','BSBA-HRM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'P-3 Bañadero','2021-06-24 10:41:45','$2y$10$yJVaZM7aSyeuB4WlchqgsuoxLbOgGnJl48sRrU6.5wI5/JenMsga2','STUDENT',NULL,'2021-06-24 10:39:30','2021-06-24 10:41:45'),
(1069,'Chamy Ocaya Rapliza','RAPLIZA','CHAMY','OCAYA','FEMALE','NEW','2003-07-24','MISAMIS OCCIDENTAL PROVINCIAL HOSPITAL','09506239633','chamyrapliza@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Aloran','Lawa-An',25845,'P-5',NULL,'$2y$10$eMYrUCXAg9AMTByNbaZQoOIDYtoHEL/wtt8QZu4ORELPQrzqu3m16','STUDENT',NULL,'2021-06-24 10:40:38','2021-06-24 10:40:38'),
(1070,'Leizlmanabo@gmail.com','BUTUAN','KARLEIZL','MAñABO','FEMALE','NEW','2000-06-23','BACOLOD, OZAMIZ CITY, MIS. OCC.','09106371067','Leizlmanabo@gmail.com','BS CRIM','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bacolod',26092,'Purok 3 Bonifacio','2021-06-24 10:51:41','$2y$10$cGCTwxMdQCOTmMyY7ExD/OGyHOEpIAUXpbJkbwKc7wG2u2cN.64mO','STUDENT',NULL,'2021-06-24 10:41:50','2021-06-24 10:51:41'),
(1071,'Jennifer19','DAIG','JENNIFER','MAGHANOY','FEMALE','NEW','2002-05-19','BONGBONG OZAMIS CITY','09388359540','Daigjennifer24@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bongbong',26099,'P-1 Barangay Bongbong Ozamis City','2021-06-24 11:27:25','$2y$10$AWCy9TWC6tuLJMepWswrruMTi.caqL1TjhsuHJYaobcYPu48FQApm','STUDENT',NULL,'2021-06-24 10:42:13','2021-06-24 11:27:25'),
(1072,'Diego01','NACION','DIEGO','S.','MALE','NEW','2002-02-23','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09166052793','naciondiego01@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 10:44:05','$2y$10$tNZoId/YMTD3RGT2GMM5UO.E.ek4qf55Rufm/HjzQ9FDZ01DV6QPS','STUDENT',NULL,'2021-06-24 10:43:04','2021-06-24 10:44:05'),
(1073,'Johnny07','DIONSAY','JOHN CHRISTIAN','ALUPIT','MALE','NEW','2002-03-09','TUDELA, MISAMIS, OCCIDENTAL','09617422143','christiandionsay07@gmail.com','BS CRIM','BSED','FULL ONLINE',NULL,'Zamboanga del Sur','Ramon Magsaysay','Bobongan',41258,'Purok 6','2021-06-24 10:45:10','$2y$10$2daowg5ja8hoGIfkEPIpKONTZcRCCmy35UPEejNiCIdWJRtgFqFFW','STUDENT',NULL,'2021-06-24 10:44:40','2021-06-24 10:45:10'),
(1074,'lagatarizamae@gmail.com','LAGATA','RIZA MAE','ANTIGA','FEMALE','NEW','2002-12-31','SAN ROQUE PANAON MISAMIS OCCIDENTAL','09380324284','lagatarizamae@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Panaon','San Roque',26154,'P-3','2021-06-24 10:58:23','$2y$10$/v1zK8Gk2dqLHCJw6GNL1u60TyBVhCif7AtkT3z543MDqn9oqoy.W','STUDENT',NULL,'2021-06-24 10:44:44','2021-06-24 10:58:23'),
(1075,'christinefigueras249@gmail.com','FIGUERAS','MARY CHRISTINE','BANTILAN','FEMALE','NEW','2002-12-23','BAROY, LANAO DEL NORTE','09384889666','christinefigueras249@gmail.com','BSED-MAPEH','BEED','BLENDED',NULL,'Lanao del Norte','Baroy','Poblacion',19824,'Purok - 7','2021-06-24 10:45:35','$2y$10$14SPNSejVpNbCUmKQ3VwvONaaXKo7hV5Ye5KZX6DsSK7HUYBMT/Ra','STUDENT',NULL,'2021-06-24 10:44:50','2021-06-24 10:45:35'),
(1076,'kimjoshua','ARIZALA','KIM JOSHUA','','MALE','NEW','2002-10-19','CULO, MOLAVE','09275605683','arizalakim27@gmail.com','BEED','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Purok Yellow Bell','2021-06-24 10:46:53','$2y$10$58zSgWb1PmaIhsc/S1nfhegtbBREiMs5fY8c7wvJD.lzeVgd3av/W','STUDENT',NULL,'2021-06-24 10:45:03','2021-06-24 10:46:53'),
(1077,'@ANALOUDUMON','DACAPIO','ANALOU','DUMON','FEMALE','NEW','2001-10-27','MOLAVE, ZAMBOANGA DEL SUR','09260480635','anajanecandog@gmail.com','GEN  MID','GEN  MID','FULL ONLINE',NULL,'Lanao del Norte','Tubod','Malingao',20267,'Purok 8, Babuyan, Malingao, Tubod Lanao Del Norte','2021-06-24 10:49:15','$2y$10$SwSvPHNslxKSnVA3YwevYOGquehISJbd.Yo/3mSr9P6yFpMjkDpfG','STUDENT',NULL,'2021-06-24 10:46:35','2021-06-24 10:49:15'),
(1078,'chayrishmabida2@gmail.com','MABIDA','CHAYRISH-JANE','TOMARONG','FEMALE','NEW','2002-12-31','RUFINO LUMAPAS, BONIFACIO, MISAMIS OCCIDENTAL','09559967092','chayrishmabida2@gmail.com','BSED','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Rufino Lumapas',25908,'Purok 5','2021-06-24 11:11:09','$2y$10$Q2WnX1CYPob18alWcETHsOXuZy4Ey7J98YeR.ugI5RlagVeHV44iS','STUDENT','jolWkQKETBunnMqUre69JxF8FOfrEFfTZu1HPDn5Do49yZ6lrqrqOBDpUc51','2021-06-24 10:47:04','2021-06-24 11:11:09'),
(1079,'Janinedingding@yahoo.com','DINGDING','JANINE','CANDILLADA','FEMALE','NEW','2002-10-06','MANINGCOL, OZAMIZ CITY','09638186844','janinemariedingding@gmail.com','BSBA-MM','BSED-MATH','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'Purok 5','2021-06-24 10:53:07','$2y$10$S0v9Xfvp0AQKOMhpSWm.9ei45j3aHGB6S0fy0N4/xDMPTLy9bH6w6','STUDENT',NULL,'2021-06-24 10:47:08','2021-06-24 10:53:07'),
(1080,'Kimjushuaalbarico24@gmail.com','ALBARICO','KIMJUSHUA','NOGAS','MALE','NEW','2002-11-24','DIGSON,BONIFACIO, MISS, OCC','09108822632','kimjushuaalbarico24@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Digson',25894,'2','2021-06-24 11:04:34','$2y$10$eb/2hK/uZ6i6zcP9K.ZAQuT3P8GLzaPVcpwTTiFL5ssG/NyIyE6kq','STUDENT',NULL,'2021-06-24 10:48:05','2021-06-24 11:04:34'),
(1081,'ramoskristine873@gmail.com','RAMOS','KRISTINE','HOLNANERO','FEMALE','NEW','2001-12-04','BAG-ONG ARGAO MOLAVE ZAMBOANGA DEL SUR','09074624303','ramoskristine873@gmail.com','BSED-ENGL','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Molave','Bagong Argao',41163,'5','2021-06-24 10:51:54','$2y$10$beRaifaORV/Wo.XR7EIJ0.1VvYf/WRSxAQdk5L.aiiRbjE2la2Pj6','STUDENT',NULL,'2021-06-24 10:48:32','2021-06-24 10:51:54'),
(1082,'Jaycel Lasta','LASTA','JAYCEL MAE','CABUG','FEMALE','NEW','2002-09-11','QUEZON CITY','09777363379','jaycelmaelasta@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Jimenez','Sibaroc',26010,'Purok 7',NULL,'$2y$10$nl1QKdG7dHLvO2055UuIIetTxeJjFIGyyX1U8Yv2qHolCyEi9DvzO','STUDENT',NULL,'2021-06-24 10:49:01','2021-06-24 10:49:01'),
(1083,'lantayajunefe@gmail.com','LAMANILAO','JUNEFE','LANTAYA','FEMALE','NEW','2003-02-11','MATLING, MALABANG, LANAO DEL SUR','09512676688','lantayajunefe@gmail.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Sicpao',41105,'PUROK 3',NULL,'$2y$10$HXSXH9YCbI/1p81Z1lCebOWBia/.M7hvUjtc7gcn6lqmvnQYmEFou','STUDENT',NULL,'2021-06-24 10:49:41','2021-06-24 10:49:41'),
(1084,'stephanieshainaquilo@gmail.com','QUILO','STEPHANIE SHAINA','CAPARIDA','FEMALE','NEW','2003-06-23','SAN JOSE TAMBULIG ZAMBOANGA DEL SUR','09639762273','stephanieshainaquilo@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','San Jose',41384,'Purok 1','2021-06-24 10:50:40','$2y$10$qSwnK.kNMC2Kzlz3JGnKleY4tMKYODPpslyg24plObNZwKK.1XY0K','STUDENT',NULL,'2021-06-24 10:49:48','2021-06-24 10:50:40'),
(1085,'RhyneVincent','LIGSANAN','RHYNE VINCENT','DANGGA','MALE','NEW','2002-01-29','OZAMIS CITY','09382789842','lapasanpurok1@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok1','2021-06-24 11:18:58','$2y$10$0DVsToobns88yBxl6s.OWuEF7Cd1dW.g51k24Lphu.BN/TWb39sXu','STUDENT',NULL,'2021-06-24 10:51:06','2021-06-24 11:18:58'),
(1086,'santarin@gmail.com','SANTARIN','BEA KRISTINE','MEDILLO','FEMALE','NEW','2021-05-15','CULO MOLAVE','09304718167','santarin@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'Talisay',NULL,'$2y$10$3tVz47YU8/KYTyThj/iQ.OucQgSnyLX6NOlLx9xgeAfTNITz5N0kS','STUDENT',NULL,'2021-06-24 10:51:25','2021-06-24 10:51:25'),
(1087,'Ana Grace','LOFRANCO','ANA GRACE','PONTANAR','FEMALE','NEW','2001-08-09','OZAMIZ CITY','09639389615','anagracelofranco@gmail.com','BSOA','BSOA','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'P-1 San Jose Village,','2021-06-24 10:52:01','$2y$10$GOHM3BNGw9VWfPu/eW9FA.uOHAHaNoYRjKqHQ/9MVy7ygxj1lE7Fy','STUDENT',NULL,'2021-06-24 10:51:30','2021-06-24 10:52:01'),
(1088,'dodongbenz10@gmail.com','SAMRANO','MATTHEW GLENN','PAYE','MALE','NEW','2003-07-27','CAGAY-ANON, SINACABAN, MISAMIS OCCIDENTAL','09099190383','dodongbenz10@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Sinacaban','San Vicente',26231,'Purok 1',NULL,'$2y$10$CsonBPO202GVHAhquUQ7YO94BFt.fOvMb.IkCFr.cRKxrOOMpVRii','STUDENT',NULL,'2021-06-24 10:52:11','2021-06-24 10:52:11'),
(1089,'Diego2021','NACION','DIEGO','S.','MALE','NEW','2002-02-23','TIMBABOY MODSALIP ZAMBOANGA DEL SUR','09166052793','diegonacion15@gmail.comcom','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan',NULL,'$2y$10$.ZLqoq5w8OuLJIT.spaUUOsIRv3fPKRF2wcfgCEdSwfv2xpV20DC6','STUDENT',NULL,'2021-06-24 10:52:20','2021-06-24 10:52:20'),
(1090,'Mylene  L. Baroro','BARORO','MYLENE','LABRADOR','FEMALE','NEW','2002-04-19','KIMAT, TANGUB CITY','09078708446','mylenebaroro136@gmail','BSBA-MM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Tangub City','Kimat',26258,'Purok 4',NULL,'$2y$10$ijbFgMkuR2LwMji8Zo5N7elIzV.BK82v0zqc5217BYpPW8/nYFbea','STUDENT',NULL,'2021-06-24 10:52:45','2021-06-24 10:52:45'),
(1091,'criezel0818','CATANGUE','CRIEZEL MAE','ELECCION','FEMALE','NEW','2002-08-18','SAN LUIS AGUSAN DEL SUR','09515751855','criezelcatangue@gmail.com','BSOA','AB COMM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African Daisy 1, Bliss',NULL,'$2y$10$JI58.lzi6rJEyEA2MRdpVeGVqEb1Drjm973D23.JV3sE6f32SA17O','STUDENT',NULL,'2021-06-24 10:56:01','2021-06-24 10:56:01'),
(1092,'Mherafe','CABUG','MHERAFE','PALANGPANGAN','FEMALE','NEW','2003-06-01','SIBAROC, JIMENEZ, MIS. OCC.','09155191903','mfpcabug@gmail.com','BEED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Jimenez','Sibaroc',26010,'Purok 7','2021-06-24 11:01:27','$2y$10$LWRHoHMeR7QRr2xGCwUJa.l1eiEVzrrcZIYLOHZuslaynqrly0Zqi','STUDENT',NULL,'2021-06-24 10:56:29','2021-06-24 11:01:27'),
(1093,'yapprince67@gmail.com','ALQUIZAR','CHURCHIL JOHN','','MALE','NEW','2002-06-03','P-1 BALUC TANGUB CITY','09639393839','yapprince67@gmail.com','BS CRIM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Tangub City','Baluk',26237,'PUROK 1','2021-06-24 10:59:52','$2y$10$fSC75VYaMsd0Q1tMbF.ExOPORGEqPXQ/bSiTJX.SVJYMlgkqduHhW','STUDENT',NULL,'2021-06-24 10:56:37','2021-06-24 10:59:52'),
(1094,'annabelledaguman','DAG-UMAN','ANNABELLE','TACLAP','FEMALE','NEW','2002-04-03','CANATOAN SIOCON ZDN','09090908944','annabelledaguman1@gamail.com','AB POLSCI','AB POLSCI','BLENDED',NULL,'Zamboanga del Sur','Molave','Blancia',41165,'Makiangayon',NULL,'$2y$10$mHLFUp5Dyjy/ZwIy.7IsvOVLfSPNPLEYto.o4eT/hEOd3ARSmmE2q','STUDENT',NULL,'2021-06-24 10:58:04','2021-06-24 10:58:04'),
(1095,'Lmyreselao@gmail.com','LAO','LADY MYRESE','ALMACEN','FEMALE','NEW','2003-08-18','BUALAN,TUBOD,LANAO DEL NORTE','09362325883','lmyreselao@gmail.com','BEED','BSED','BLENDED',NULL,'Lanao del Norte','Tubod','Bualan',20258,'Purok 3','2021-06-24 10:59:05','$2y$10$WZUiQOSNT4qy7153hJkZv.Pje9WIlE0IlaVbGiUqpiTqHP19NJY5G','STUDENT',NULL,'2021-06-24 10:58:34','2021-06-24 10:59:05'),
(1096,'sxrjngx01@gmail.com','SALE','SERJY LOU','DELA CALZADA','FEMALE','NEW','2002-01-11','BACOLOD OZAMIZ CITY','09464626642','srjyngx01@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bacolod',26092,'Purok Bonifacio','2021-06-24 10:59:14','$2y$10$yxugfHn7Jdl1Bi3nURXTP.d6lfgolExaL8d3Oiu/ZEngfbXn3vttG','STUDENT',NULL,'2021-06-24 10:58:52','2021-06-24 10:59:14'),
(1097,'MarkAnthonyAbelano','ABELANO','MARK ANTHONY','ARCOY','MALE','NEW','2003-02-15','PUROK5 KINANGAY SUR CLARIN MISAMIS OCCIDENTAL','09511970243','abelanomarkanthony@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Misamis Occidental','Clarin','Kinangay Sur',25946,'Purok5','2021-06-24 11:28:25','$2y$10$J5Gxxt8fQT8.vMKY6klaVeJzWDR1bxYybS.11c7t4.jjrAA9JmnJq','STUDENT',NULL,'2021-06-24 10:59:25','2021-06-24 11:28:25'),
(1098,'Juliet Salveron','SALVERON','JULIET','BULAYBULAY','FEMALE','NEW','2000-06-17','BOLINSONG BONIFACIO MISAMIS OCCIDENTAL','09700813832/09480109995','salveronj9@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Bonifacio','Lower Usugan',25901,'Purok-6','2021-06-24 11:02:57','$2y$10$6WOZNDCSc/LNjxOsukzQxuKmmfGXeyzS0wwC0q4X7pLTmKWiJkIKq','STUDENT',NULL,'2021-06-24 11:02:00','2021-06-24 11:02:57'),
(1099,'junefelamanilao05@gmail.com','LAMANILAO','JUNEFE','LANTAYA','FEMALE','NEW','2003-02-11','MATLING, MALABANG, LANAO DEL SUR','09512676688','junefelamanilao05@gmail.com','BSBA-HRM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Mahayag','Sicpao',41105,'PUROK 3','2021-06-24 11:04:03','$2y$10$W1hoPHVwFEVbok5yR/ds1.80Gj4mUuEdTFNwx4CPJ2wYSwVWOCuuu','STUDENT',NULL,'2021-06-24 11:03:47','2021-06-24 11:04:03'),
(1100,'Christinealamillo710@gmail.com','ALAMILLO','CHRISTINE MAE','ANISLAG','FEMALE','NEW','2002-10-07','MHARS GEN.HOSPITAL','09486008478','christinealamillo710@gmail.com','BS CRIM','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Ozamis City','Banadero',26095,'Purok 5','2021-06-24 11:06:25','$2y$10$QPpdcwMJk28ciEWm8x7ZF.DiFqCuKHZmdp2PyyXiz1idDyKIdggAy','STUDENT',NULL,'2021-06-24 11:03:56','2021-06-24 11:06:25'),
(1101,'DagumanAnnabelle','DAG-UMAN','ANNABELLE','TACLAP','FEMALE','NEW','2002-04-03','CANATUAN SIOCON ZDN','09090908944','annabelledaguman7@gmail.com','AB POLSCI','AB POLSCI','BLENDED',NULL,'Zamboanga del Sur','Molave','Blancia',41165,'Makiangayon','2021-06-24 11:23:51','$2y$10$I9M5FkepV8vzUhtMCNRV5OfQFqEWU4NimRSZMnalL2DERB/WPji4m','STUDENT',NULL,'2021-06-24 11:04:16','2021-06-24 11:23:51'),
(1102,'Renagene Egay','EGAY','RENAGENE','BRUCE','FEMALE','NEW','2002-01-08','P.5 UPPER RUFINO LUMAPAS, BONIFACIO, MISAMIS OCCIDENTAL','09759286239','renageneegay08@gmail.com','BSED-ENGL','AB ENGLISH','BLENDED',NULL,'Misamis Occidental','Bonifacio','Rufino Lumapas',25908,'5','2021-06-24 11:07:07','$2y$10$HYBhi0kHgYgzJGmRylliV.NI25zWpwfrWkvB0VvnPV91RPx7jQqyq','STUDENT',NULL,'2021-06-24 11:04:43','2021-06-24 11:07:07'),
(1103,'jezielnamoco7@gmail.com','NAMOCO','JEZIEL','MOLEJON','FEMALE','NEW','2000-09-29','DULLAN BONIFACIO MIS. OCC.','09632846806','jezielnamoco7@gmail.com','BSBA-MM','BSED-FIL','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Bolinsong',25889,'Purok-4','2021-06-24 11:15:42','$2y$10$hDeWBWuusSkKCfFNIKx8f.MtwC23aNTQ3vsGGGWkNjfQVshWhw2Je','STUDENT',NULL,'2021-06-24 11:04:54','2021-06-24 11:15:42'),
(1104,'Catherine Joy Basin','BASIN','CATHERINE JOY','','FEMALE','NEW','2002-08-01','TONDO, MANILA','09380224623','catherinebasin24@gmail.com','AB COMM','AB ENGLISH','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'P-5','2021-06-24 11:09:47','$2y$10$dlX8D2o8XPpbQsABxzzK1OdlDmuz2h2m8htcPuXfahC8qv6HPMn2m','STUDENT',NULL,'2021-06-24 11:06:14','2021-06-24 11:09:47'),
(1105,'Desiree Fernandez Hintacutan','HINTACUTAN','DESIREE','FERNANDEZ','FEMALE','NEW','2002-11-18','MATAMPAY ILAYA LALA LANAO DEL NORTE','09362408419','desireehintacutan@gmail.com','BS CRIM','BSED-FIL','FULL ONLINE',NULL,'Lanao del Norte','Lala','Darumawang Ilaya',19955,'Purok 2','2021-06-24 11:08:58','$2y$10$Az9aGogeQgFeyIr4/bGN5erbi/ms2zAnploJBnWd8.x3dmKVq/ebC','STUDENT',NULL,'2021-06-24 11:07:57','2021-06-24 11:08:58'),
(1106,'towerpushmega@gmail.com','PEñONAL','JERSON','NIEZ','MALE','NEW','2021-10-25','MOLAVE ZAMBOANGA DEL SOR','09309521402','towerpushmega@gmail.com','BSBA-MM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Demetrio Fernan',25893,'PUROK 1','2021-06-24 11:20:07','$2y$10$DNAV2kK9aQ0fMKePSgOYduoVTdIGL8sAHVixHvTfmRlOonrHJyDdG','STUDENT',NULL,'2021-06-24 11:08:40','2021-06-24 11:20:07'),
(1107,'Masayonmarlie00@gmail.com','MASAYON','MARLIE','ABAL','MALE','RETURNEE','1989-05-08','TUGAYA, ALORAN MISAMIS OCCIDENTAL','09128882834','masayonmarlie00@gmail.com','BSBA-MM','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Aloran','Tugaya',25869,'1','2021-06-24 11:13:08','$2y$10$yJdDxbNyWgYiHl1X/ZAe.e3cvRMV2DQ1MARJCZUV4q9M7XIQhs41q','STUDENT',NULL,'2021-06-24 11:09:43','2021-06-24 11:13:08'),
(1108,'Nacion2021','NACION','DIEGO','S.','MALE','NEW','2002-02-23','TIMBABOY MIDSALIP NATIONAL HIGH SCHOOL','09166052793','diegonacion@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan',NULL,'$2y$10$suFJl.REV2nlhJdvEYaq.Ow9AAPImQSWAsu2cErMAY2C7g59KTbui','STUDENT',NULL,'2021-06-24 11:10:32','2021-06-24 11:10:32'),
(1109,'matthewglennsamrano@gmail.com','SAMRANO','MATTHEW GLENN','PAYE','MALE','NEW','2003-07-27','CAGAY-ANON, SINACABAN, MISAMIS OCCIDENTAL','09099190383','matthewglennsamrano@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Sinacaban','San Vicente',26231,'Purok 1',NULL,'$2y$10$MAUxR5tHD9W4.7DubA4WJOigBk2gy2M/Hk18MYJN.ynqRyXJAs4Ce','STUDENT',NULL,'2021-06-24 11:10:34','2021-06-24 11:10:34'),
(1110,'Janicagray48','BOLAY-OG','JANICA','PORNIA','FEMALE','NEW','2001-08-29','LOCSOON, TUDELA, MISAMIS OCCIDENTAL','09505666113','janicagray48@gmail.com','BSBA-HRM','BSOA','BLENDED',NULL,'Misamis Occidental','Tudela','Yahong',26322,'Purok 2','2021-06-24 11:13:14','$2y$10$cOwk1ql0Kv45Kt6sTh9M4.RsbppmwDuZG5RsEj95b6EA41ktxEAi.','STUDENT',NULL,'2021-06-24 11:10:41','2021-06-24 11:13:14'),
(1111,'serjylousale@gmail.com','SALE','SERJY LOU','DELA CALZADA','FEMALE','NEW','2002-01-11','BACOLOD, OZAMIZ CITY','09464626642','serjylousale@gmail.com','BS CRIM','BSBA-HRM','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Bacolod',26092,'Purok Bonifacio','2021-06-24 11:12:50','$2y$10$dloPaAkmF8KUyfPxGXG64elkU.o0QEIIc7kp/r8rm8QwKxcNYppT.','STUDENT',NULL,'2021-06-24 11:10:55','2021-06-24 11:12:50'),
(1112,'sarnosheilamae20@gmail.com','SARNO','SHEILA MAE','CHAVEZ','FEMALE','NEW','2001-07-07','BAG-ONG ARGAO','09632460420','sarnosheilamae20@gmail.com','BSED-ENGL','BSED-ENGL','BLENDED',NULL,'Zamboanga del Sur','Molave','Bagong Argao',41163,'purok 1',NULL,'$2y$10$xJFZbHruqlUJdscnQd5WveBhtceOEDO4Iqnxfyuqx/CA1Qeez/yyW','STUDENT',NULL,'2021-06-24 11:11:12','2021-06-24 11:11:12'),
(1113,'Ricardo Lumacad','LUMACAD JR.','RICARDO','MOREñO','MALE','NEW','2001-02-05','MARAWI CITY','09639287550','ricardolumacadjr@gmail.com','BSED','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Ozamis City','Baybay Santa Cruz',26097,'Purok 1','2021-06-24 11:19:10','$2y$10$2A4JoCwLeBZQoDCRe9FPvepk09P9b3RNKzqjHbkeKvuzqqEqpgrJu','STUDENT',NULL,'2021-06-24 11:17:15','2021-06-24 11:19:10'),
(1114,'Johnford','CHAVEZ','CARILLE JOHN FORD','CARABAL','MALE','NEW','2003-01-04','SM LAO','09515719407','carillechavez7@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'Purok 1 san jose village','2021-06-24 11:21:46','$2y$10$a.8OiBa9eRa6ImKDXwFQj.1DG9NZVxT8pObq2gpGSJID/aQMZuyNa','STUDENT',NULL,'2021-06-24 11:18:06','2021-06-24 11:21:46'),
(1115,'phing09','RODRIGUEZ','PINKY','ASURO','FEMALE','NEW','2001-03-09','KAPATAGAN LANAI DEL NORTE','09369189589','pnkyxxrdrguez@gmail.com','BSED','BSED-ENGL','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Carangan',26103,'P-3 B','2021-06-24 11:29:20','$2y$10$HBueqtvgg/xczZLtFDW76.TBh7rnopa7tMepGPxHf2ul2ayKTrBAK','STUDENT',NULL,'2021-06-24 11:18:27','2021-06-24 11:29:20'),
(1116,'mmonton119@yahoo.com','MONTON','MADELYN JANE','DELA CRUZ','FEMALE','NEW','2003-01-16','BAG-ONG ARGAO MOLAVE, ZAMBOANGA DEL SUR','09365558039','mmonton119@yahoo.com','BSED-ENGL','BSED','BLENDED',NULL,'Zamboanga del Sur','Molave','Bagong Argao',41163,'PUROK 2','2021-06-24 11:49:18','$2y$10$AUtDkTMQRAiry0BmHPHyr.KGPh7plgBSmCh3g4hpRBoey3zOYmfqu','STUDENT',NULL,'2021-06-24 11:20:20','2021-06-24 11:49:18'),
(1117,'Nell Jean Galindo','GALINDO','NELL JEAN','BACOR','FEMALE','NEW','2002-06-12','MEDINA HOSPITAL','09505790153','NellJeanGalindo@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Sinacaban','Poblacion',26227,'Paragayo','2021-06-24 11:21:29','$2y$10$koQuOKKwYfgwzD3dCm.yfubEjlqcU6kvjc96gQyVM4YZpoT.waS.2','STUDENT',NULL,'2021-06-24 11:21:05','2021-06-24 11:21:29'),
(1118,'Jayanncoca@gmail.com','COCA','JAY-ANN','LALIM','FEMALE','NEW','2003-07-04','BAMBONG DAKU RAMON MAGSAYSAY ZAMBOANGA DEL SUR','09975761809','marialuisa.lalim@yahoo.com','BSBA-MM','BSBA-MM','BLENDED',NULL,'Zamboanga del Sur','Ramon Magsaysay','Paradise',41272,'Purok 4',NULL,'$2y$10$KfPHJHiG6Iu9PEz755yinuEjQkHxeCbXUR2idrX/RnyGpCtx/y9iy','STUDENT',NULL,'2021-06-24 11:21:16','2021-06-24 11:21:16'),
(1119,'Romelyn Saguindang','SAGUINDANG','ROMELYN','SARINO','FEMALE','NEW','2002-04-03','DOLORES, CLARIN, MISAMIS OCCIDENTAL','09631390438','romelynsaguindang@gmail.com','BSOA','BSBA-HRM','BLENDED',NULL,'Misamis Occidental','Clarin','Dolores',25941,'Purok 1',NULL,'$2y$10$DeliiOj7T/uCRakwZVYzsO32mP/qKCN/qBZLw.08ODnWRDshrWJre','STUDENT',NULL,'2021-06-24 11:23:00','2021-06-24 11:23:00'),
(1120,'Regina Arcino','ARCINO','REGINA','ALBERCA','FEMALE','NEW','2003-05-08','SINARA ALTO, JIMENEZ MISAMIS OCCIDENTAL','09516517050','regina.arci14@gmail.com','BSBA-MM','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Sinacaban','San Vicente',26231,'7',NULL,'$2y$10$W5QuV7LGYLYlSGqCGNk7J.DcVKgNJ.vRyMLb1SZ2NU/K28jxfc5M2','STUDENT',NULL,'2021-06-24 11:23:07','2021-06-24 11:23:07'),
(1121,'jorimrizadarupinta','RUPINTA','JORIM','RIZADA','MALE','NEW','2003-07-06','MHARS REGIONAL TRAINING AND TEACHING HOSPITAL','09276195643','jorimrizadarupinta@gmail.com','BSCS','BSCS','FULL ONLINE',NULL,'Misamis Occidental','Ozamis City','Tabid',26138,'Purok 4',NULL,'$2y$10$cezv/p1xCCiFCvhlR5XtWechLULkZhAwYKuZcoin02A1FOXMGINim','STUDENT',NULL,'2021-06-24 11:23:42','2021-06-24 11:23:42'),
(1122,'Harveabadilla1@gmail.com','ABADILLA','HARVEY','LLEDO','MALE','NEW','1999-10-01','MHARSGEN HOSPITAL','09468824688','harveabadilla1@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Lapasan',25947,'Purok-4','2021-06-24 11:35:36','$2y$10$Ffbf2kU8LVHg.NBGQob.7.eSNB5nSZbLgczrQvhSm3y26m.YY6W/W','STUDENT',NULL,'2021-06-24 11:24:22','2021-06-24 11:35:36'),
(1123,'Zacky Vince Carel Ponce','PONCE','ZACKY VINCE CAREL','GAPO','MALE','NEW','2002-09-13','SAN JOSE TAMBULIG ZAMBOANGA DEL SUR','09187300789','zackyvinceponce@gmail.com','BS CRIM','BSED-MATH','BLENDED',NULL,'Zamboanga del Sur','Tambulig','San Jose',41384,'Purok 4','2021-06-24 11:34:16','$2y$10$x79QxcsnPuvnO73DdEWKLOq/moWrxLdvf9JL0bDRWX5JtYdBp6Bm6','STUDENT',NULL,'2021-06-24 11:26:47','2021-06-24 11:34:16'),
(1124,'Jaihel Paye Pang-an','PANG-AN','JAIHEL','PAYE','FEMALE','NEW','2002-10-15','KATIPUNAN','09380209604','panganjaihel@gmail.com','BEED','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Sinacaban','Katipunan',26224,'Purok6',NULL,'$2y$10$G/9OAF0GEPcTDXBb/ijPsO/t9NM4pBhaSX7WltqGXzslEXS.iJJ86','STUDENT',NULL,'2021-06-24 11:27:48','2021-06-24 11:27:48'),
(1125,'LGBASIN14','BASIN','LOUIE GHAY','','MALE','NEW','2001-07-14','MANILA','09106693639','louieghay14@gmail.com','AB COMM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Ozamis City','San Antonio',26133,'5','2021-06-24 11:33:14','$2y$10$TmCSXUE6nt.cfykUA7OxbuZnTriQ0KoslkFu67NdqWfSSoMLeWrVC','STUDENT',NULL,'2021-06-24 11:29:13','2021-06-24 11:33:14'),
(1126,'Charissa','RIEGO','CHARISSA','CABAHUG','FEMALE','NEW','2021-02-24','TAGOLALO AURORA ZAMBOANGA DEL SUR','09267721975','cherryzahriego@gmail.com','GEN  MID','BSED-MAPEH','BLENDED',NULL,'Misamis Occidental','Tangub City','Maloro',26262,'Purok 5','2021-06-24 11:34:58','$2y$10$lpvUdddKcZcVnzbMlL9PuOnqGzBRLHKhzNovGfEWr.V7KIzyOkjW.','STUDENT',NULL,'2021-06-24 11:29:19','2021-06-24 11:34:58'),
(1127,'melodyfuentes2023','FUENTES','MELODY','BUGHAO','FEMALE','NEW','2003-05-20','EASTERN LOOC, PLARIDEL','09077216592','melodyfuentes2023@gmail.com','BSED-FIL','BSED-ENGL','BLENDED',NULL,'Misamis Occidental','Plaridel','Eastern Looc',26168,'Purok Espada',NULL,'$2y$10$iwwZSMGkoM0cP7qE91pBleJMVRkpoi7q6E6IXTlSOEvBpyV9/RL.u','STUDENT',NULL,'2021-06-24 11:29:43','2021-06-24 11:29:43'),
(1128,'NacionDiego','NACION','DIEGO','S.','MALE','NEW','2002-02-23','TIMBABOY MIDSALIP ZAMBOANGA DEL SUR','09166205703','naciondiego2002@gmail.com','BS CRIM','BSISM','BLENDED',NULL,'Zamboanga del Sur','Midsalip','Timbaboy',41158,'Purok palayan','2021-06-24 11:31:27','$2y$10$G..Tqm9lax22SE7/HPvRCeJ8ml432HNIvrx4J7Ikvi.f/nogtom6.','STUDENT',NULL,'2021-06-24 11:30:08','2021-06-24 11:31:27'),
(1129,'Je-ann S. Yorong','YORONG','JE-ANN','SOLIS','FEMALE','NEW','2003-01-23','OZAMIZ','09468869631','Jeannyorong@gmail.com','BSED','BEED','BLENDED',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'Purok 11',NULL,'$2y$10$FH9kcYpztiWxC9ug5TAmh.uRKhVQ2a.4gshXh.SAP6KTqbulTbMHW','STUDENT',NULL,'2021-06-24 11:31:38','2021-06-24 11:31:38'),
(1130,'Devy Jopia','JOPIA','DEVY','BANQUIL','MALE','NEW','2001-05-28','CLARIN MISAMIS OCCIDENTAL','09513811411','devyjopia01@gmail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Clarin','Tinacla-An',25961,'Purok 2','2021-06-24 11:33:11','$2y$10$g/d1d6o9BkKLZXACw9F8DOiPqxs.5MaRB/soGVADLKRKv.XSq8oSG','STUDENT',NULL,'2021-06-24 11:32:20','2021-06-24 11:33:11'),
(1131,'criezel855','CATANGUE','CRIEZEL MAE','ELECCION','FEMALE','NEW','2002-08-18','SAN LUIS AGUSAN DEL SUR','09515751855','jessoncatangue1999@gmail.com','BSOA','AB COMM','BLENDED',NULL,'Zamboanga del Sur','Molave','Culo',41167,'African Daisy 1, Bliss','2021-06-24 11:33:13','$2y$10$G7C4EC3yhJTcqp/VO.1HMen/SC8vXMs13is/Z16gJUPFcyemUbuHy','STUDENT',NULL,'2021-06-24 11:32:20','2021-06-24 11:33:13'),
(1132,'Princess18','LIMPAHAN','PRINCESS','RAMIREZ','FEMALE','NEW','2003-06-20','CABUNGA-AN, CLARIN, MISAMIS OCCIDENTAL','09352496202','jay27.babe@gmail.com','BSBA-MM','GEN  MID','FULL ONLINE',NULL,'Misamis Occidental','Clarin','Cabunga-An',25935,'Purok3',NULL,'$2y$10$8q5HVTvnAzKuW8XCjclHZOIj3wCx8GIAfPt6RmIlJKiiRShTyJvSe','STUDENT',NULL,'2021-06-24 11:33:15','2021-06-24 11:33:15'),
(1133,'Charlie_gacang','GACANG','CHARLIE','LEDENIO','MALE','NEW','2003-08-02','P-2 BAGAKAY,OZAMIZ,CITY','09516550109','gacangcharlie@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Bagakay',26093,'P-2 BAGAKAY OZAMIZ CITY','2021-06-24 11:36:22','$2y$10$boIDXATS3rXB9jbyIgCIo.2fOqN5cEtXZIcmd3MiR7Zw0gRv.6qGK','STUDENT',NULL,'2021-06-24 11:33:32','2021-06-24 11:36:22'),
(1134,'marivicebisa18@gmail.com','EBISA','MARIVIC','LIRAZAN','FEMALE','NEW','2002-04-02','IGANO COMMUNITY HOSPITAL, MOLAVE ZAMBOANGA DEL SUR','09633021294','marivicebisa18@gmail.com','BEED','AB POLSCI','FULL ONLINE',NULL,'Zamboanga del Sur','Dumingag','Maralag',40951,'Purok 4','2021-06-24 11:34:23','$2y$10$99bVnmpGKiFyBNQXlwIt8.U/20K0yJhTDCp7GYdytv5foF5o2AMim','STUDENT',NULL,'2021-06-24 11:33:47','2021-06-24 11:34:23'),
(1135,'zaibelcuezon','CUEZON','ZAIBEL JHANE','GALLETO','FEMALE','NEW','2001-01-19','SETI, JIMENEZ, MISAMIS OCCIDENTAL','09563075774','zaibel.cuezon@gmail.com','BSED-ENGL','BEED','BLENDED',NULL,'Misamis Occidental','Jimenez','Gata',25996,'Purok 1, Gata','2021-06-24 11:41:32','$2y$10$D89Z8oIKFrzCpHE5JCgxPeOYK4bo9nJ1qXOybKjlrFauji52tyiDi','STUDENT',NULL,'2021-06-24 11:34:37','2021-06-24 11:41:32'),
(1136,'Gilgaven','PAYE','GILGAVEN','LOMO','MALE','NEW','2002-04-27','OROQUIETA CITY PROVINCIAL HOSPITAL','09197133164','gilgaven@gmail.com','BSCS','BSCS','BLENDED',NULL,'Misamis Occidental','Jimenez','Macabayao',25998,'Purok 6',NULL,'$2y$10$S4CwteJ8FTiCN3IYDm4Z2OIpUx4daQCPmFnuuKWAxIWAc4Rtx7Fce','STUDENT',NULL,'2021-06-24 11:36:54','2021-06-24 11:36:54'),
(1137,'Francis','SARAMOSING','FRANCIS DUNE','NANO','MALE','NEW','2002-11-02','TINACLAAN CLARIN','09632327676','saramosingfrancis24@gamail.com','BS CRIM','AB POLSCI','BLENDED',NULL,'Misamis Occidental','Clarin','Tinacla-An',25961,'P-5',NULL,'$2y$10$PWqLz7YmU036jA8jU1ZtcetaEzQNEm77hweTzOW17fcgniMhDjlRC','STUDENT',NULL,'2021-06-24 11:38:00','2021-06-24 11:38:00'),
(1138,'princess cagatan91@gmail.com','CAGATAN','PRINCESS','MAGADAN','FEMALE','NEW','2021-09-23','BOLINSONG BONIFACIO MISAMIS OCCIDENTAL','09632361411','princesscagatan91@gmail.com','BS CRIM','BS CRIM','FULL ONLINE',NULL,'Misamis Occidental','Bonifacio','Pisa-An',25905,'Purok 5','2021-06-24 11:40:28','$2y$10$5rzD0aI7BWaMCeRinfIJju1hsmrGCl.QzJ2BUykr7df0xishGA/8y','STUDENT',NULL,'2021-06-24 11:39:21','2021-06-24 11:40:28'),
(1139,'ChrismarMurayao@gmail.com','MURAYAO','CHRISMAR','CASANES','MALE','NEW','2002-06-04','STA.MARIA TANGUB CITY','09381315476','chrismarMurayao@gmail.com','BS CRIM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Santa Maria',26279,'Purok-3',NULL,'$2y$10$/nVEuUQFHbhSKTnBPg7G8.alDFNdg7nn1n8JgAgw7m8YgTqsIkXeq','STUDENT',NULL,'2021-06-24 11:39:54','2021-06-24 11:39:54'),
(1140,'Lotchie V Veloso','VELOSO','LOTCHIE','VACALARES','FEMALE','NEW','2002-11-28','BONGABONG TANGUB CITY','09352495202','Lotchieveloso@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Misamis Occidental','Tangub City','Bongabong',26248,'Purok 1',NULL,'$2y$10$voPnvJJSduJvCB946t5ZxuxZ.mxu5ONWzeH56PASQB91K7vgZIIpu','STUDENT',NULL,'2021-06-24 11:40:08','2021-06-24 11:40:08'),
(1141,'Je-ann Solis Yorong','YORONG','JE-ANN','SOLIS','FEMALE','NEW','2003-01-23','OZAMIZ','09468869631','jeannyorong2@gmail.com','BEED','BEED','BLENDED',NULL,'Misamis Occidental','Ozamis City','Catadman-Manabay',26105,'Purok 11',NULL,'$2y$10$FhuWFq2BBnfJ88mgy111qec5UrCQCc93pDWz9HMtVcJcpJHm.ujLO','STUDENT',NULL,'2021-06-24 11:40:46','2021-06-24 11:40:46'),
(1142,'Lia','BAUTISTA','LIA','CABRERA','FEMALE','NEW','2002-12-18','CAMPOIV, RAMON MAGSAYSAY, ZAMBOANGA DEL SUR','09754323597','liacabrerabautista8@gmail.com','BSBA-MM','BSBA-MM','FULL ONLINE',NULL,'Zamboanga del Sur','Tambulig','Balugo',41365,'PUROK 3',NULL,'$2y$10$AcDxPkxxPFuDepA83gNzyuHPSFv6ZvTq2iTTTkzasQ9UpGprMG.tG','STUDENT',NULL,'2021-06-24 11:41:48','2021-06-24 11:41:48'),
(1143,'gantoosjessell@gmail.com','GANTOOS','JESSELL','CLERIGO','FEMALE','NEW','2003-01-10','PUROK-5, PAN-AY, CLARIN, MISAMIS OCCIDENTAL','09103455985','gantoosjessell@gmail.com','BS CRIM','BSED-FIL','BLENDED',NULL,'Misamis Occidental','Clarin','Pan-Ay',25952,'Purok-5','2021-06-24 11:43:25','$2y$10$RZmoWyj72KXOUMVS//LOjulwRoxF7CUqNUvHPs950qlvb2R0bZtey','STUDENT',NULL,'2021-06-24 11:42:00','2021-06-24 11:43:25'),
(1144,'gerliemaglinao','MAGLINAO','GERLIE','CUBAR','FEMALE','NEW','2002-09-28','AURORA, ZAMBOANGA DEL SUR','09496609210','gerliemaglinao2002@gmail.com','BS CRIM','BS CRIM','BLENDED',NULL,'Misamis Occidental','Ozamis City','Lam-An',26123,'Purok 1','2021-06-24 11:46:20','$2y$10$29.PymscJLNqn9fVfs6pvejm92cOgY9308uvL73oJloBmZV2SWhC2','STUDENT',NULL,'2021-06-24 11:42:34','2021-06-24 11:46:20'),
(1145,'Gry','LOBGOBAN','GRYSHIA','ALQUIZOLA','FEMALE','NEW','2003-07-03','CASILAK SAN AGUSTIN TUDELA MISAMIS OCCIDENTAL','+639639226814','agryshia@gmail.com','AB POLSCI','AB COMM','FULL ONLINE',NULL,'Misamis Occidental','Tudela','Casilak San Agustin',26301,'Purok 1','2021-06-24 11:45:23','$2y$10$hZNLb/2mnV0ofnkV1ZU3fOhL8NXI4YWxwrqBKClYldtvnST6qU0e.','STUDENT',NULL,'2021-06-24 11:44:53','2021-06-24 11:45:23'),
(1146,'Jeralyn','TAG-ULO','JERALYN','BAGUNDOL','FEMALE','NEW','2003-01-16','TUDELA, MISAMIS OCCIDENTAL','09106470336','jeralyntagulo823@gmail.com','BSED-ENGL','BEED','BLENDED',NULL,'Misamis Occidental','Tudela','Canibungan Proper',26300,'Purok 2','2021-06-24 11:45:49','$2y$10$7STShe94RbhV8tD6ag8NdOnpKDQRo2rZb.KjUY9mXHtPtZP5XWLb6','STUDENT',NULL,'2021-06-24 11:45:11','2021-06-24 11:45:49'),
(1147,'cristyjeanjunio','JUNIO','CRISTY JEAN','ABASOLA','FEMALE','NEW','2003-06-14','BECOR JIMENEZ MISAMIS OCCIDENTAL','09317539067','cristyjunio92@gmail.com','BSED-ENGL','BSED','FULL ONLINE',NULL,'Misamis Occidental','Jimenez','Tabo-O',26013,'Becor Purok-6',NULL,'$2y$10$OXRi2wa06V5KWqphHjT/1evEIgALxkk4dfQcZfEa4gJRGVgU3GdBy','STUDENT',NULL,'2021-06-24 11:46:03','2021-06-24 11:46:03'),
(1148,'Juvygaray11@gmail.com','GARAY','JUVY','BULAYBULAY','FEMALE','TRANSFEREE','2001-06-09','TENIAPAN SAN PABLO ZAMBOANGA DEL SUR','09072093728','Juvygaray11@gmail.com','BSED-SOCSTUD','BSED-SOCSTUD','BLENDED',NULL,'Misamis Occidental','Tangub City','Tituron',26287,'Purok 2','2021-06-24 11:50:17','$2y$10$ax760.RmutQ4MXOyQ2sqkubLnrQhqVY/VnRAKdpJKnomBsL.1GzVi','STUDENT',NULL,'2021-06-24 11:47:17','2021-06-24 11:50:17'),
(1149,'leonielmisamis08@gmail.com','MISAMIS','LEONIEL','MAHINAY','MALE','NEW','2002-07-08','SINACABAN','09639398285','leonielmisamis08@gmail.com','BS CRIM','BSOA','BLENDED',NULL,'Misamis Occidental','Sinacaban','Colupan Bajo',26221,'Purok Sampaguita',NULL,'$2y$10$UIAL08AOlgWfdmii8Tu0o.OLUjfrohjsP20jT5g7UqzrPBx1zmHiK','STUDENT',NULL,'2021-06-24 11:48:17','2021-06-24 11:48:17'),
(1150,'angelicamante975@gmail.com','MANTE','ANGELICA','OPSIMA','FEMALE','NEW','2002-11-08','P-3 CANIBUNGAN DAKU, CLARIN MISAMIS OCCIDENTAL','09639222268','angelicamante975@gmail.com','BS CRIM','BSBA-MM','BLENDED',NULL,'Misamis Occidental','Clarin','Canibungan Daku',25936,'Purok 3',NULL,'$2y$10$RpUco7KPImQb5FDVp/LzHuRB5MCHSC2oD3YaGSqa3bXJ20OAVeaL.','STUDENT',NULL,'2021-06-24 11:48:25','2021-06-24 11:48:25'),
(1151,'Cherry Joy','RAYA','CHERRY JOY','PAICA','FEMALE','NEW','2001-09-14','BAGONG OROQUIETA GUIPOS ZAMBOANGA DEL SUR','09639362244','cherryjoyraya6@gmail.com','BS CRIM','GEN  MID','BLENDED',NULL,'Misamis Occidental','Tudela','Barra',26291,'Purok 3 Barra','2021-06-24 11:49:12','$2y$10$UgHuLdiTwKzUuncmMyDnNe3OVS8EbDnS9HqFyYhf7rhFq8xXoSMRS','STUDENT',NULL,'2021-06-24 11:48:32','2021-06-24 11:49:12'),
(1152,'Jessa Mae Luzon','LUZON','JESSA MAE','ORBILLA','FEMALE','NEW','2021-04-11','ESTRELLA SINACABAN MISAMIS OCCIDENTAL','09488596765','jessamaeluzon04@gmail.com','BEED','BEED','BLENDED',NULL,'Misamis Occidental','Sinacaban','Estrella',26223,'6',NULL,'$2y$10$T3NxjTnYkS8YqE/9Y6VWoePgIyvdjsjQoybdx1CebjdfJTL8TBwV6','STUDENT',NULL,'2021-06-24 11:49:29','2021-06-24 11:49:29'),
(1153,'Francis dune','SARAMOSING','FRANCIS DUNE','NANO','MALE','NEW','2002-11-02','TINACLA-AN CLARIN','09632327676','saramosingfrancis24@gmail.com','BS CRIM','AB COMM','BLENDED',NULL,'Misamis Occidental','Clarin','Tinacla-An',25961,'P-5',NULL,'$2y$10$zY0XZlOaSk64i56zhnK7CeRtGE7w57wGiSU0e5qXsN98l2c8htIom','STUDENT',NULL,'2021-06-24 11:50:19','2021-06-24 11:50:19');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
