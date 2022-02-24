-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.7.1-MariaDB-1:10.7.1+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for examenDB
CREATE DATABASE IF NOT EXISTS `examenDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `examenDB`;

-- Dumping structure for table examenDB.api_actors
CREATE TABLE IF NOT EXISTS `api_actors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_actors: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_actors` DISABLE KEYS */;
INSERT INTO `api_actors` (`id`, `name`, `description`, `age`) VALUES
	(1, 'Sergio Mendoza', 'Actor Nacido en Mérida Yucatán..........', 21),
	(2, 'Roger Almeyda', 'Actor nacido en Tabasco', 20);
/*!40000 ALTER TABLE `api_actors` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_composers
CREATE TABLE IF NOT EXISTS `api_composers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_composers: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_composers` DISABLE KEYS */;
INSERT INTO `api_composers` (`id`, `name`, `description`, `age`) VALUES
	(1, 'Sergio Mendoza ', 'Actor nacido en Merida Yucatan', 20),
	(2, 'Roger Almeyda', 'Actor nacido en Cardenas Tabasco', 20);
/*!40000 ALTER TABLE `api_composers` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_directors
CREATE TABLE IF NOT EXISTS `api_directors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_directors: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_directors` DISABLE KEYS */;
INSERT INTO `api_directors` (`id`, `name`, `description`, `age`) VALUES
	(1, 'Sergio Mendoza ', 'Actor nacido en Merida Yucatan', 21),
	(2, 'Roger Almeyda', 'Actor nacido en Cardenas Tabasco', 20);
/*!40000 ALTER TABLE `api_directors` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_movie
CREATE TABLE IF NOT EXISTS `api_movie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `ranking` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_movie_category_id_9097c8bb_fk_api_moviecategories_id` (`category_id`),
  CONSTRAINT `api_movie_category_id_9097c8bb_fk_api_moviecategories_id` FOREIGN KEY (`category_id`) REFERENCES `api_moviecategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_movie: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_movie` DISABLE KEYS */;
INSERT INTO `api_movie` (`id`, `name`, `description`, `ranking`, `category_id`) VALUES
	(1, 'El Conjuro', 'Da unn chingo de miedo', 10, 1),
	(2, 'El Conjuro 2', 'Da aún mas miedo', 9, 1);
/*!40000 ALTER TABLE `api_movie` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_moviecategories
CREATE TABLE IF NOT EXISTS `api_moviecategories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_moviecategories: ~1 rows (approximately)
/*!40000 ALTER TABLE `api_moviecategories` DISABLE KEYS */;
INSERT INTO `api_moviecategories` (`id`, `name`) VALUES
	(1, 'Terror');
/*!40000 ALTER TABLE `api_moviecategories` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_movie_actor
CREATE TABLE IF NOT EXISTS `api_movie_actor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `actors_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_actor_movie_id_actors_id_f37a6598_uniq` (`movie_id`,`actors_id`),
  KEY `api_movie_actor_actors_id_005bb283_fk_api_actors_id` (`actors_id`),
  CONSTRAINT `api_movie_actor_actors_id_005bb283_fk_api_actors_id` FOREIGN KEY (`actors_id`) REFERENCES `api_actors` (`id`),
  CONSTRAINT `api_movie_actor_movie_id_60cbba11_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_movie_actor: ~3 rows (approximately)
/*!40000 ALTER TABLE `api_movie_actor` DISABLE KEYS */;
INSERT INTO `api_movie_actor` (`id`, `movie_id`, `actors_id`) VALUES
	(3, 1, 1),
	(1, 1, 2),
	(2, 2, 2);
/*!40000 ALTER TABLE `api_movie_actor` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_movie_composers
CREATE TABLE IF NOT EXISTS `api_movie_composers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `composers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_composers_movie_id_composers_id_6766172a_uniq` (`movie_id`,`composers_id`),
  KEY `api_movie_composers_composers_id_4d58671b_fk_api_composers_id` (`composers_id`),
  CONSTRAINT `api_movie_composers_composers_id_4d58671b_fk_api_composers_id` FOREIGN KEY (`composers_id`) REFERENCES `api_composers` (`id`),
  CONSTRAINT `api_movie_composers_movie_id_8e616bbc_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_movie_composers: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_movie_composers` DISABLE KEYS */;
INSERT INTO `api_movie_composers` (`id`, `movie_id`, `composers_id`) VALUES
	(2, 1, 2),
	(1, 2, 1);
/*!40000 ALTER TABLE `api_movie_composers` ENABLE KEYS */;

-- Dumping structure for table examenDB.api_movie_directors
CREATE TABLE IF NOT EXISTS `api_movie_directors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `directors_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_movie_directors_movie_id_directors_id_da1262cb_uniq` (`movie_id`,`directors_id`),
  KEY `api_movie_directors_directors_id_3524f1c5_fk_api_directors_id` (`directors_id`),
  CONSTRAINT `api_movie_directors_directors_id_3524f1c5_fk_api_directors_id` FOREIGN KEY (`directors_id`) REFERENCES `api_directors` (`id`),
  CONSTRAINT `api_movie_directors_movie_id_6c704684_fk_api_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `api_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.api_movie_directors: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_movie_directors` DISABLE KEYS */;
INSERT INTO `api_movie_directors` (`id`, `movie_id`, `directors_id`) VALUES
	(1, 1, 2),
	(2, 2, 1);
/*!40000 ALTER TABLE `api_movie_directors` ENABLE KEYS */;

-- Dumping structure for table examenDB.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table examenDB.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table examenDB.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.auth_permission: ~48 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add API key', 7, 'add_apikey'),
	(26, 'Can change API key', 7, 'change_apikey'),
	(27, 'Can delete API key', 7, 'delete_apikey'),
	(28, 'Can view API key', 7, 'view_apikey'),
	(29, 'Can add actors', 8, 'add_actors'),
	(30, 'Can change actors', 8, 'change_actors'),
	(31, 'Can delete actors', 8, 'delete_actors'),
	(32, 'Can view actors', 8, 'view_actors'),
	(33, 'Can add composers', 9, 'add_composers'),
	(34, 'Can change composers', 9, 'change_composers'),
	(35, 'Can delete composers', 9, 'delete_composers'),
	(36, 'Can view composers', 9, 'view_composers'),
	(37, 'Can add directors', 10, 'add_directors'),
	(38, 'Can change directors', 10, 'change_directors'),
	(39, 'Can delete directors', 10, 'delete_directors'),
	(40, 'Can view directors', 10, 'view_directors'),
	(41, 'Can add movie categories', 11, 'add_moviecategories'),
	(42, 'Can change movie categories', 11, 'change_moviecategories'),
	(43, 'Can delete movie categories', 11, 'delete_moviecategories'),
	(44, 'Can view movie categories', 11, 'view_moviecategories'),
	(45, 'Can add movie', 12, 'add_movie'),
	(46, 'Can change movie', 12, 'change_movie'),
	(47, 'Can delete movie', 12, 'delete_movie'),
	(48, 'Can view movie', 12, 'view_movie');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table examenDB.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$320000$OhfGsdQpntC7JDGnffRPlH$RefsIPn5dBwler2AvKC3xC5JoMZ8JeyjWlOlwZlrBiU=', '2022-02-24 01:39:20.006002', 1, 'newuser', '', '', '', 1, 1, '2022-02-24 01:36:15.472220');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table examenDB.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table examenDB.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table examenDB.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.django_admin_log: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-02-24 01:39:36.691968', 'eTkBcy8z.pbkdf2_sha256$320000$vmVYg6zssylqThifh3fUVu$fztAEg82UzXOPYYzZlqJ0KuJsZ5ZpVQeIP9+AzsvWEM=', '123', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table examenDB.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.django_content_type: ~12 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(8, 'api', 'actors'),
	(9, 'api', 'composers'),
	(10, 'api', 'directors'),
	(12, 'api', 'movie'),
	(11, 'api', 'moviecategories'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'rest_framework_api_key', 'apikey'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table examenDB.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.django_migrations: ~23 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-02-24 01:35:23.210679'),
	(2, 'auth', '0001_initial', '2022-02-24 01:35:25.592490'),
	(3, 'admin', '0001_initial', '2022-02-24 01:35:26.077781'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-24 01:35:26.148931'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-24 01:35:26.226612'),
	(6, 'api', '0001_initial', '2022-02-24 01:35:28.462780'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2022-02-24 01:35:29.010917'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2022-02-24 01:35:29.452812'),
	(9, 'auth', '0003_alter_user_email_max_length', '2022-02-24 01:35:29.666267'),
	(10, 'auth', '0004_alter_user_username_opts', '2022-02-24 01:35:29.814438'),
	(11, 'auth', '0005_alter_user_last_login_null', '2022-02-24 01:35:30.347372'),
	(12, 'auth', '0006_require_contenttypes_0002', '2022-02-24 01:35:30.561855'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2022-02-24 01:35:30.919782'),
	(14, 'auth', '0008_alter_user_username_max_length', '2022-02-24 01:35:31.182093'),
	(15, 'auth', '0009_alter_user_last_name_max_length', '2022-02-24 01:35:31.364517'),
	(16, 'auth', '0010_alter_group_name_max_length', '2022-02-24 01:35:31.565534'),
	(17, 'auth', '0011_update_proxy_permissions', '2022-02-24 01:35:31.703854'),
	(18, 'auth', '0012_alter_user_first_name_max_length', '2022-02-24 01:35:32.002313'),
	(19, 'rest_framework_api_key', '0001_initial', '2022-02-24 01:35:32.445621'),
	(20, 'rest_framework_api_key', '0002_auto_20190529_2243', '2022-02-24 01:35:32.898514'),
	(21, 'rest_framework_api_key', '0003_auto_20190623_1952', '2022-02-24 01:35:33.139242'),
	(22, 'rest_framework_api_key', '0004_prefix_hashed_key', '2022-02-24 01:35:34.149340'),
	(23, 'sessions', '0001_initial', '2022-02-24 01:35:34.581226');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table examenDB.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.django_session: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('1tec60pw2npnb7wh1ye12natnleu3gxh', '.eJxVjMEOwiAQRP-FsyG7VCh49O43EBYWqRpISnsy_rtt0oPeJvPezFv4sC7Fr51nPyVxEShOvx2F-OS6g_QI9d5kbHWZJ5K7Ig_a5a0lfl0P9--ghF62NTOTPhvOqFWOWwBlIeshExE6AIPGDKAMos6ADhOObrRWkWOCxE58vt1SNz4:1nN36G:tTQtpaAc5rgHpdq6EsnDG4KdEngS4daAmHgyqOQ7GIo', '2022-03-10 01:39:20.034486');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table examenDB.rest_framework_api_key_apikey
CREATE TABLE IF NOT EXISTS `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table examenDB.rest_framework_api_key_apikey: ~1 rows (approximately)
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;
INSERT INTO `rest_framework_api_key_apikey` (`id`, `created`, `name`, `revoked`, `expiry_date`, `hashed_key`, `prefix`) VALUES
	('eTkBcy8z.pbkdf2_sha256$320000$vmVYg6zssylqThifh3fUVu$fztAEg82UzXOPYYzZlqJ0KuJsZ5ZpVQeIP9+AzsvWEM=', '2022-02-24 01:39:36.689050', '123', 0, NULL, 'pbkdf2_sha256$320000$vmVYg6zssylqThifh3fUVu$fztAEg82UzXOPYYzZlqJ0KuJsZ5ZpVQeIP9+AzsvWEM=', 'eTkBcy8z');
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
