-- MySQL dump 10.13  Distrib 5.7.23-ndb-7.6.7, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: hopsworks
-- ------------------------------------------------------
-- Server version	5.7.23-ndb-7.6.7-cluster-gpl

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
-- Table structure for table `account_audit`
--

DROP TABLE IF EXISTS `account_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_audit` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `action` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT NULL,
  `message` varchar(100) COLLATE latin1_general_cs DEFAULT NULL,
  `outcome` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `ip` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `useragent` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `initiator` (`initiator`),
  KEY `target` (`target`),
  CONSTRAINT `FK_257_274` FOREIGN KEY (`initiator`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_257_275` FOREIGN KEY (`target`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_257_296` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_295` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `address1` varchar(100) COLLATE latin1_general_cs DEFAULT '-',
  `address2` varchar(100) COLLATE latin1_general_cs DEFAULT '-',
  `address3` varchar(100) COLLATE latin1_general_cs DEFAULT '-',
  `city` varchar(40) COLLATE latin1_general_cs DEFAULT 'San Francisco',
  `state` varchar(50) COLLATE latin1_general_cs DEFAULT 'CA',
  `country` varchar(40) COLLATE latin1_general_cs DEFAULT 'US',
  `postalcode` varchar(10) COLLATE latin1_general_cs DEFAULT '-',
  PRIMARY KEY (`address_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `FK_257_265` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `current_value` varchar(32) COLLATE latin1_general_cs DEFAULT NULL,
  `failure_max` varchar(32) COLLATE latin1_general_cs DEFAULT NULL,
  `failure_min` varchar(32) COLLATE latin1_general_cs DEFAULT NULL,
  `warning_max` varchar(32) COLLATE latin1_general_cs DEFAULT NULL,
  `warning_min` varchar(32) COLLATE latin1_general_cs DEFAULT NULL,
  `agent_time` bigint(20) DEFAULT NULL,
  `alert_time` datetime DEFAULT NULL,
  `data_source` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `host_id` int(11) DEFAULT NULL,
  `message` varchar(1024) COLLATE latin1_general_cs NOT NULL,
  `plugin` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `plugin_instance` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `provider` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `severity` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `type` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `type_instance` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `FK_481_487` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anaconda_repo`
--

DROP TABLE IF EXISTS `anaconda_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anaconda_repo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authorized_sshkeys`
--

DROP TABLE IF EXISTS `authorized_sshkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorized_sshkeys` (
  `project` varchar(64) NOT NULL,
  `user` varchar(48) NOT NULL,
  `sshkey_name` varchar(64) NOT NULL,
  PRIMARY KEY (`project`,`user`,`sshkey_name`),
  KEY `idx_user` (`user`),
  KEY `idx_project` (`project`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bbc_group`
--

DROP TABLE IF EXISTS `bbc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbc_group` (
  `group_name` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `group_desc` varchar(200) COLLATE latin1_general_cs DEFAULT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cluster_cert`
--

DROP TABLE IF EXISTS `cluster_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cluster_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `common_name` varchar(64) COLLATE latin1_general_cs NOT NULL,
  `organization_name` varchar(64) COLLATE latin1_general_cs NOT NULL,
  `organizational_unit_name` varchar(64) COLLATE latin1_general_cs NOT NULL,
  `serial_number` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `registration_status` varchar(45) COLLATE latin1_general_cs NOT NULL,
  `validation_key` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `validation_key_date` timestamp NULL DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organization_name` (`organization_name`,`organizational_unit_name`),
  UNIQUE KEY `serial_number` (`serial_number`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `FK_257_552` FOREIGN KEY (`agent_id`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster` varchar(48) COLLATE latin1_general_cs NOT NULL,
  `command` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `host_id` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `role` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `service` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conda_commands`
--

DROP TABLE IF EXISTS `conda_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conda_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user` varchar(52) COLLATE latin1_general_cs NOT NULL,
  `op` varchar(52) COLLATE latin1_general_cs NOT NULL,
  `proj` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `channel_url` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `arg` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `lib` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `version` varchar(52) COLLATE latin1_general_cs DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `status` varchar(52) COLLATE latin1_general_cs NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `install_type` varchar(52) COLLATE latin1_general_cs DEFAULT NULL,
  `machine_type` varchar(52) COLLATE latin1_general_cs DEFAULT NULL,
  `environment_yml` varchar(10000) COLLATE latin1_general_cs DEFAULT NULL,
  `install_jupyter` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `FK_481_519` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_520` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inode_pid` bigint(20) NOT NULL,
  `inode_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `inode_id` bigint(20) NOT NULL,
  `partition_id` bigint(20) NOT NULL,
  `projectId` int(11) NOT NULL,
  `description` varchar(2000) COLLATE latin1_general_cs DEFAULT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `public_ds` tinyint(1) NOT NULL DEFAULT '0',
  `public_ds_id` varchar(1000) COLLATE latin1_general_cs DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `dstype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_dataset` (`inode_pid`,`projectId`,`inode_name`),
  KEY `inode_id` (`inode_id`),
  KEY `projectId_name` (`projectId`,`inode_name`),
  KEY `inode_pid` (`inode_pid`,`inode_name`,`partition_id`),
  CONSTRAINT `FK_149_435` FOREIGN KEY (`inode_pid`,`inode_name`,`partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`,`name`,`partition_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_434` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_request`
--

DROP TABLE IF EXISTS `dataset_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `user_email` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `requested` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(3000) COLLATE latin1_general_cs DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`dataset`,`projectId`),
  KEY `projectId` (`projectId`,`user_email`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `FK_302_451` FOREIGN KEY (`projectId`,`user_email`) REFERENCES `project_team` (`project_id`,`team_member`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_429_449` FOREIGN KEY (`dataset`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_438_452` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dela`
--

DROP TABLE IF EXISTS `dela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dela` (
  `id` varchar(200) COLLATE latin1_general_cs NOT NULL,
  `did` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(200) COLLATE latin1_general_cs NOT NULL,
  `status` varchar(52) COLLATE latin1_general_cs NOT NULL,
  `stream` varchar(200) COLLATE latin1_general_cs DEFAULT NULL,
  `partners` varchar(200) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `did` (`did`),
  CONSTRAINT `FK_429_542` FOREIGN KEY (`did`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `state` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `execution_start` bigint(20) DEFAULT NULL,
  `execution_stop` bigint(20) DEFAULT NULL,
  `stdout_path` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `stderr_path` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `hdfs_user` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `app_id` char(30) COLLATE latin1_general_cs DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  `finalStatus` varchar(128) COLLATE latin1_general_cs NOT NULL DEFAULT 'UNDEFINED',
  `progress` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`),
  KEY `job_id` (`job_id`),
  KEY `user` (`user`),
  KEY `submission_time_idx` (`submission_time` DESC, `job_id`),
  KEY `state_idx` (`state`, `job_id`),
  KEY `finalStatus_idx` (`finalStatus`, `job_id`),
  KEY `progress_idx` (`progress` DESC, `job_id`),
  CONSTRAINT `FK_262_366` FOREIGN KEY (`user`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_347_365` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_to_remove`
--

DROP TABLE IF EXISTS `files_to_remove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_to_remove` (
  `execution_id` int(11) NOT NULL,
  `filepath` varchar(255) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`execution_id`,`filepath`),
  CONSTRAINT `FK_361_376` FOREIGN KEY (`execution_id`) REFERENCES `executions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `hops_users`
--

DROP TABLE IF EXISTS `hops_users`;
/*!50001 DROP VIEW IF EXISTS `hops_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `hops_users` AS SELECT 
 1 AS `project_user`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hopssite_cluster_certs`
--

DROP TABLE IF EXISTS `hopssite_cluster_certs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hopssite_cluster_certs` (
  `cluster_name` varchar(129) COLLATE latin1_general_cs NOT NULL,
  `cluster_key` varbinary(7000) DEFAULT NULL,
  `cluster_cert` varbinary(3000) DEFAULT NULL,
  `cert_password` varchar(200) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`cluster_name`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `host_services`
--

DROP TABLE IF EXISTS `host_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster` varchar(48) COLLATE latin1_general_cs NOT NULL,
  `host_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `service` varchar(48) COLLATE latin1_general_cs NOT NULL,
  `group_name` varchar(48) COLLATE latin1_general_cs NOT NULL,
  `status` int(11) NOT NULL,
  `uptime` bigint(20) DEFAULT NULL,
  `webport` int(11) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `stopTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `FK_481_491` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `cores` int(11) DEFAULT NULL,
  `disk_capacity` bigint(20) DEFAULT NULL,
  `disk_used` bigint(20) DEFAULT NULL,
  `host_ip` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `last_heartbeat` bigint(20) DEFAULT NULL,
  `load1` double DEFAULT NULL,
  `load15` double DEFAULT NULL,
  `load5` double DEFAULT NULL,
  `memory_capacity` bigint(20) DEFAULT NULL,
  `memory_used` bigint(20) DEFAULT NULL,
  `private_ip` varchar(15) COLLATE latin1_general_cs DEFAULT NULL,
  `public_ip` varchar(15) COLLATE latin1_general_cs DEFAULT NULL,
  `agent_password` varchar(25) COLLATE latin1_general_cs DEFAULT NULL,
  `num_gpus` tinyint(1) NOT NULL DEFAULT '0',
  `registered` tinyint(1) DEFAULT '0',
  `conda_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  UNIQUE KEY `host_ip` (`host_ip`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invalid_jwt`
--

DROP TABLE IF EXISTS `invalid_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invalid_jwt` (
  `jti` varchar(45) COLLATE latin1_general_cs NOT NULL,
  `expiration_time` datetime NOT NULL,
  `renewable_for_sec` int(11) NOT NULL,
  PRIMARY KEY (`jti`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_input_files`
--

DROP TABLE IF EXISTS `job_input_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_input_files` (
  `execution_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`execution_id`,`name`),
  CONSTRAINT `FK_361_373` FOREIGN KEY (`execution_id`) REFERENCES `executions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_output_files`
--

DROP TABLE IF EXISTS `job_output_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_output_files` (
  `execution_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`execution_id`,`name`),
  CONSTRAINT `FK_361_370` FOREIGN KEY (`execution_id`) REFERENCES `executions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `project_id` int(11) NOT NULL,
  `creator` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `type` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `json_config` text COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_project_idx` (`name`,`project_id`),
  KEY `project_id` (`project_id`),
  KEY `creator` (`creator`),
  KEY `creator_project_idx` (`creator`, `project_id`),
  KEY `creation_time_project_idx` (`creation_time` DESC, `project_id`),
  KEY `type_project_id_idx` (`type`, `project_id`),
  CONSTRAINT `FK_262_353` FOREIGN KEY (`creator`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_352` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs_history`
--

DROP TABLE IF EXISTS `jobs_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs_history` (
  `job_id` int(11) NOT NULL,
  `jar_file` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `execution_id` int(11) NOT NULL,
  `app_id` char(30) COLLATE latin1_general_cs DEFAULT NULL,
  `job_type` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `class_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `arguments` text COLLATE latin1_general_cs NOT NULL,
  `input_blocks_in_hdfs` int(11) NOT NULL,
  `am_memory` int(11) NOT NULL,
  `am_Vcores` int(11) NOT NULL,
  `execution_duration` bigint(20) DEFAULT NULL,
  `queuing_time` bigint(20) DEFAULT NULL,
  `user_email` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `project_name` varchar(100) COLLATE latin1_general_cs NOT NULL,
  `job_name` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `state` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `final_status` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`execution_id`),
  UNIQUE KEY `inode_idx` (`app_id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jupyter_interpreter`
--

DROP TABLE IF EXISTS `jupyter_interpreter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jupyter_interpreter` (
  `port` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`port`,`name`),
  CONSTRAINT `FK_523_530` FOREIGN KEY (`port`) REFERENCES `jupyter_project` (`port`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jupyter_project`
--

DROP TABLE IF EXISTS `jupyter_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jupyter_project` (
  `port` int(11) NOT NULL,
  `hdfs_user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `host_ip` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `secret` varchar(64) COLLATE latin1_general_cs NOT NULL,
  `pid` bigint(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`port`),
  UNIQUE KEY `unique_hdfs_user` (`hdfs_user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `FK_103_525` FOREIGN KEY (`hdfs_user_id`) REFERENCES `hops`.`hdfs_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_526` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jupyter_settings`
--

DROP TABLE IF EXISTS `jupyter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jupyter_settings` (
  `project_id` int(11) NOT NULL,
  `team_member` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `num_tf_ps` int(11) DEFAULT '1',
  `num_tf_gpus` int(11) DEFAULT '0',
  `num_mpi_np` int(11) DEFAULT '1',
  `appmaster_cores` int(11) DEFAULT '1',
  `appmaster_memory` int(11) DEFAULT '1024',
  `num_executors` int(11) DEFAULT '1',
  `num_executor_cores` int(11) DEFAULT '1',
  `executor_memory` int(11) DEFAULT '1024',
  `dynamic_initial_executors` int(11) DEFAULT '1',
  `dynamic_min_executors` int(11) DEFAULT '1',
  `dynamic_max_executors` int(11) DEFAULT '1',
  `secret` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `log_level` varchar(32) COLLATE latin1_general_cs DEFAULT 'INFO',
  `mode` varchar(32) COLLATE latin1_general_cs NOT NULL,
  `umask` varchar(32) COLLATE latin1_general_cs DEFAULT '022',
  `advanced` tinyint(1) DEFAULT '0',
  `archives` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `jars` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `files` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `py_files` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `spark_params` varchar(6500) COLLATE latin1_general_cs DEFAULT '',
  `shutdown_level` int(11) NOT NULL DEFAULT '6',
  `fault_tolerant` tinyint(1) NOT NULL,
  PRIMARY KEY (`project_id`,`team_member`),
  KEY `team_member` (`team_member`),
  KEY `secret_idx` (`secret`),
  CONSTRAINT `FK_262_309` FOREIGN KEY (`team_member`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_308` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jwt_signing_key`
--

DROP TABLE IF EXISTS `jwt_signing_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jwt_signing_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secret` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `name` varchar(45) COLLATE latin1_general_cs NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jwt_signing_key_name_UNIQUE` (`name`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ldap_user`
--

DROP TABLE IF EXISTS `ldap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldap_user` (
  `entry_uuid` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `auth_key` varchar(64) COLLATE latin1_general_cs NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`entry_uuid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  CONSTRAINT `FK_257_557` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` varchar(150) COLLATE latin1_general_cs DEFAULT NULL,
  `user_to` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `date_sent` datetime NOT NULL,
  `subject` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `preview` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `content` text COLLATE latin1_general_cs NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `path` varchar(600) COLLATE latin1_general_cs DEFAULT NULL,
  `reply_to_msg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_from` (`user_from`),
  KEY `user_to` (`user_to`),
  KEY `reply_to_msg` (`reply_to_msg`),
  CONSTRAINT `FK_262_441` FOREIGN KEY (`user_from`) REFERENCES `users` (`email`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_262_442` FOREIGN KEY (`user_to`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_438_443` FOREIGN KEY (`reply_to_msg`) REFERENCES `message` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_to_user`
--

DROP TABLE IF EXISTS `message_to_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_to_user` (
  `message` int(11) NOT NULL,
  `user_email` varchar(150) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`message`,`user_email`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `FK_262_458` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_438_457` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_data`
--

DROP TABLE IF EXISTS `meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(12000) COLLATE latin1_general_cs NOT NULL,
  `fieldid` int(11) NOT NULL,
  `tupleid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`fieldid`,`tupleid`),
  KEY `fieldid` (`fieldid`,`tupleid`),
  CONSTRAINT `FK_404_411` FOREIGN KEY (`fieldid`,`tupleid`) REFERENCES `meta_raw_data` (`fieldid`,`tupleid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_data_schemaless`
--

DROP TABLE IF EXISTS `meta_data_schemaless`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_data_schemaless` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inode_id` bigint(20) NOT NULL,
  `inode_parent_id` bigint(20) NOT NULL,
  `inode_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `inode_partition_id` bigint(20) NOT NULL,
  `data` varchar(12000) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`,`inode_id`,`inode_parent_id`),
  UNIQUE KEY `inode_parent_id` (`inode_parent_id`,`inode_name`,`inode_partition_id`),
  CONSTRAINT `FK_149_427` FOREIGN KEY (`inode_parent_id`,`inode_name`,`inode_partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`,`name`,`partition_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_field_predefined_values`
--

DROP TABLE IF EXISTS `meta_field_predefined_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_field_predefined_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldid` int(11) NOT NULL,
  `valuee` varchar(250) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fieldid` (`fieldid`),
  CONSTRAINT `FK_390_398` FOREIGN KEY (`fieldid`) REFERENCES `meta_fields` (`fieldid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_field_types`
--

DROP TABLE IF EXISTS `meta_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_field_types` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_fields`
--

DROP TABLE IF EXISTS `meta_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_fields` (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `maxsize` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT NULL,
  `tableid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `ftype` mediumint(11) DEFAULT '3',
  `description` varchar(250) COLLATE latin1_general_cs NOT NULL,
  `fieldtypeid` mediumint(11) NOT NULL,
  `position` mediumint(11) DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `tableid` (`tableid`),
  KEY `fieldtypeid` (`fieldtypeid`),
  CONSTRAINT `FK_384_393` FOREIGN KEY (`fieldtypeid`) REFERENCES `meta_field_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_386_392` FOREIGN KEY (`tableid`) REFERENCES `meta_tables` (`tableid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_inode_basic_metadata`
--

DROP TABLE IF EXISTS `meta_inode_basic_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_inode_basic_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inode_pid` bigint(20) NOT NULL,
  `inode_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `partition_id` bigint(20) NOT NULL,
  `description` varchar(3000) COLLATE latin1_general_cs DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inode_pid` (`inode_pid`,`inode_name`,`partition_id`),
  CONSTRAINT `FK_149_422` FOREIGN KEY (`inode_pid`,`inode_name`,`partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`,`name`,`partition_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_log`
--

DROP TABLE IF EXISTS `meta_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_pk1` int(11) NOT NULL,
  `meta_pk2` bigint(20) NOT NULL,
  `meta_pk3` bigint(20) NOT NULL,
  `meta_type` tinyint(1) NOT NULL,
  `meta_op_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_raw_data`
--

DROP TABLE IF EXISTS `meta_raw_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_raw_data` (
  `fieldid` int(11) NOT NULL,
  `tupleid` int(11) NOT NULL,
  PRIMARY KEY (`fieldid`,`tupleid`),
  KEY `tupleid` (`tupleid`),
  CONSTRAINT `FK_390_405` FOREIGN KEY (`fieldid`) REFERENCES `meta_fields` (`fieldid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_400_406` FOREIGN KEY (`tupleid`) REFERENCES `meta_tuple_to_file` (`tupleid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_tables`
--

DROP TABLE IF EXISTS `meta_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_tables` (
  `tableid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `templateid` int(11) NOT NULL,
  PRIMARY KEY (`tableid`),
  KEY `templateid` (`templateid`),
  CONSTRAINT `FK_382_388` FOREIGN KEY (`templateid`) REFERENCES `meta_templates` (`templateid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_template_to_inode`
--

DROP TABLE IF EXISTS `meta_template_to_inode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_template_to_inode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `inode_pid` bigint(20) NOT NULL,
  `inode_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `partition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `inode_pid` (`inode_pid`,`inode_name`,`partition_id`),
  CONSTRAINT `FK_149_416` FOREIGN KEY (`inode_pid`,`inode_name`,`partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`,`name`,`partition_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_382_415` FOREIGN KEY (`template_id`) REFERENCES `meta_templates` (`templateid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_templates`
--

DROP TABLE IF EXISTS `meta_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_templates` (
  `templateid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`templateid`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meta_tuple_to_file`
--

DROP TABLE IF EXISTS `meta_tuple_to_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_tuple_to_file` (
  `tupleid` int(11) NOT NULL AUTO_INCREMENT,
  `inodeid` bigint(20) NOT NULL,
  `inode_pid` bigint(20) NOT NULL,
  `inode_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `partition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tupleid`),
  KEY `inode_pid` (`inode_pid`,`inode_name`,`partition_id`),
  CONSTRAINT `FK_149_402` FOREIGN KEY (`inode_pid`,`inode_name`,`partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`,`name`,`partition_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ndb_backup`
--

DROP TABLE IF EXISTS `ndb_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_backup` (
  `backup_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`backup_id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ops_log`
--

DROP TABLE IF EXISTS `ops_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op_id` int(11) NOT NULL,
  `op_on` tinyint(1) NOT NULL,
  `op_type` tinyint(1) NOT NULL,
  `project_id` int(11) NOT NULL,
  `dataset_id` bigint(20) NOT NULL,
  `inode_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `org_name` varchar(100) COLLATE latin1_general_cs DEFAULT '-',
  `website` varchar(2083) COLLATE latin1_general_cs DEFAULT '-',
  `contact_person` varchar(100) COLLATE latin1_general_cs DEFAULT '-',
  `contact_email` varchar(150) COLLATE latin1_general_cs DEFAULT '-',
  `department` varchar(100) COLLATE latin1_general_cs DEFAULT '-',
  `phone` varchar(20) COLLATE latin1_general_cs DEFAULT '-',
  `fax` varchar(20) COLLATE latin1_general_cs DEFAULT '-',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `FK_257_380` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pia`
--

DROP TABLE IF EXISTS `pia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `personal_data` varchar(4000) COLLATE latin1_general_cs NOT NULL,
  `how_data_collected` varchar(2000) COLLATE latin1_general_cs NOT NULL,
  `specified_explicit_legitimate` int(11) NOT NULL DEFAULT '0',
  `consent_process` varchar(1000) COLLATE latin1_general_cs DEFAULT NULL,
  `consent_basis` varchar(1000) COLLATE latin1_general_cs DEFAULT NULL,
  `data_minimized` int(11) NOT NULL DEFAULT '0',
  `data_uptodate` int(11) NOT NULL DEFAULT '0',
  `users_informed_how` varchar(500) COLLATE latin1_general_cs NOT NULL,
  `user_controls_data_collection_retention` varchar(500) COLLATE latin1_general_cs NOT NULL,
  `data_encrypted` int(11) NOT NULL DEFAULT '0',
  `data_anonymized` int(11) NOT NULL DEFAULT '0',
  `data_pseudonymized` int(11) NOT NULL DEFAULT '0',
  `data_backedup` int(11) NOT NULL DEFAULT '0',
  `data_security_measures` varchar(500) COLLATE latin1_general_cs NOT NULL,
  `data_portability_measure` varchar(500) COLLATE latin1_general_cs NOT NULL,
  `subject_access_rights` varchar(500) COLLATE latin1_general_cs NOT NULL,
  `risks` varchar(2000) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `FK_284_353` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inode_pid` bigint(20) NOT NULL,
  `inode_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `partition_id` bigint(20) NOT NULL,
  `projectname` varchar(100) COLLATE latin1_general_cs NOT NULL,
  `username` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retention_period` date DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `conda` tinyint(1) DEFAULT '0',
  `logs` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `python_version` varchar(25) COLLATE latin1_general_cs DEFAULT NULL,
  `description` varchar(2000) COLLATE latin1_general_cs DEFAULT NULL,
  `payment_type` varchar(255) COLLATE latin1_general_cs NOT NULL DEFAULT 'PREPAID',
  `last_quota_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kafka_max_num_topics` int(11) NOT NULL DEFAULT '100',
  `conda_env` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectname` (`projectname`),
  UNIQUE KEY `inode_pid` (`inode_pid`,`inode_name`,`partition_id`),
  KEY `user_idx` (`username`),
  CONSTRAINT `FK_149_289` FOREIGN KEY (`inode_pid`,`inode_name`,`partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`,`name`,`partition_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_262_290` FOREIGN KEY (`username`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_devices`
--

DROP TABLE IF EXISTS `project_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_devices` (
  `project_id` int(11) NOT NULL,
  `device_uuid` varchar(36) NOT NULL,
  `password` varchar(64) NOT NULL,
  `alias` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `last_logged_in` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`,`device_uuid`),
  CONSTRAINT `FK_284_533` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_devices_settings`
--

DROP TABLE IF EXISTS `project_devices_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_devices_settings` (
  `project_id` int(11) NOT NULL,
  `jwt_secret` varchar(128) NOT NULL,
  `jwt_token_duration` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  CONSTRAINT `FK_284_535` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_pythondeps`
--

DROP TABLE IF EXISTS `project_pythondeps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_pythondeps` (
  `project_id` int(11) NOT NULL,
  `dep_id` int(10) NOT NULL,
  PRIMARY KEY (`project_id`,`dep_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `FK_284_513` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_505_514` FOREIGN KEY (`dep_id`) REFERENCES `python_dep` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs
/*!50100 PARTITION BY KEY (project_id) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_services`
--

DROP TABLE IF EXISTS `project_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_services` (
  `project_id` int(11) NOT NULL,
  `service` varchar(32) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`project_id`,`service`),
  CONSTRAINT `FK_284_300` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_team`
--

DROP TABLE IF EXISTS `project_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_team` (
  `project_id` int(11) NOT NULL,
  `team_member` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `team_role` varchar(32) COLLATE latin1_general_cs NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`,`team_member`),
  KEY `team_member` (`team_member`),
  CONSTRAINT `FK_262_304` FOREIGN KEY (`team_member`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_303` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_topics`
--

DROP TABLE IF EXISTS `project_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_topics` (
  `topic_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `project_id` int(11) NOT NULL,
  `schema_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `schema_version` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `topic_project` (`topic_name`,`project_id`),
  KEY `schema_name_idx` (`schema_name`),
  KEY `project_idx` (`project_id`),
  KEY `schema_idx` (`schema_name`,`schema_version`),
  CONSTRAINT `schema_idx` FOREIGN KEY (`schema_name`,`schema_version`) REFERENCES `schema_topics` (`name`,`version`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_idx` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectgenericuser_certs`
--

DROP TABLE IF EXISTS `projectgenericuser_certs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectgenericuser_certs` (
  `project_generic_username` varchar(120) COLLATE latin1_general_cs NOT NULL,
  `pgu_key` varbinary(7000) DEFAULT NULL,
  `pgu_cert` varbinary(3000) DEFAULT NULL,
  `cert_password` varchar(200) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`project_generic_username`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `python_dep`
--

DROP TABLE IF EXISTS `python_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `python_dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dependency` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `version` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `repo_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `preinstalled` tinyint(1) DEFAULT '0',
  `install_type` int(11) NOT NULL,
  `machine_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dependency` (`dependency`,`version`,`install_type`,`repo_id`,`machine_type`),
  KEY `status` (`status`),
  KEY `repo_id` (`repo_id`),
  CONSTRAINT `FK_501_510` FOREIGN KEY (`repo_id`) REFERENCES `anaconda_repo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remote_material_references`
--

DROP TABLE IF EXISTS `remote_material_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remote_material_references` (
  `username` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `path` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `references` int(11) NOT NULL DEFAULT '0',
  `lock` int(1) NOT NULL DEFAULT '0',
  `lock_id` varchar(30) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`path`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_audit`
--

DROP TABLE IF EXISTS `roles_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_audit` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `target` int(11) NOT NULL,
  `initiator` int(11) NOT NULL,
  `action` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT NULL,
  `message` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `ip` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `outcome` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `useragent` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `initiator` (`initiator`),
  KEY `target` (`target`),
  CONSTRAINT `FK_257_280` FOREIGN KEY (`initiator`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_257_281` FOREIGN KEY (`target`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rstudio_interpreter`
--

DROP TABLE IF EXISTS `rstudio_interpreter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rstudio_interpreter` (
  `port` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`port`,`name`),
  CONSTRAINT `FK_575_582` FOREIGN KEY (`port`) REFERENCES `rstudio_project` (`port`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rstudio_project`
--

DROP TABLE IF EXISTS `rstudio_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rstudio_project` (
  `port` int(11) NOT NULL,
  `hdfs_user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `host_ip` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `secret` varchar(64) COLLATE latin1_general_cs NOT NULL,
  `pid` bigint(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`port`),
  KEY `hdfs_user_idx` (`hdfs_user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `FK_103_577` FOREIGN KEY (`hdfs_user_id`) REFERENCES `hops`.`hdfs_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_578` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rstudio_settings`
--

DROP TABLE IF EXISTS `rstudio_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rstudio_settings` (
  `project_id` int(11) NOT NULL,
  `team_member` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `num_tf_ps` int(11) DEFAULT '1',
  `num_tf_gpus` int(11) DEFAULT '0',
  `num_mpi_np` int(11) DEFAULT '1',
  `appmaster_cores` int(11) DEFAULT '1',
  `appmaster_memory` int(11) DEFAULT '1024',
  `num_executors` int(11) DEFAULT '1',
  `num_executor_cores` int(11) DEFAULT '1',
  `executor_memory` int(11) DEFAULT '1024',
  `dynamic_initial_executors` int(11) DEFAULT '1',
  `dynamic_min_executors` int(11) DEFAULT '1',
  `dynamic_max_executors` int(11) DEFAULT '1',
  `secret` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `log_level` varchar(32) COLLATE latin1_general_cs DEFAULT 'INFO',
  `mode` varchar(32) COLLATE latin1_general_cs NOT NULL,
  `umask` varchar(32) COLLATE latin1_general_cs DEFAULT '022',
  `advanced` tinyint(1) DEFAULT '0',
  `archives` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `jars` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `files` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `py_files` varchar(1500) COLLATE latin1_general_cs DEFAULT '',
  `spark_params` varchar(6500) COLLATE latin1_general_cs DEFAULT '',
  `shutdown_level` int(11) NOT NULL DEFAULT '6',
  PRIMARY KEY (`project_id`,`team_member`),
  KEY `team_member` (`team_member`),
  KEY `secret_idx` (`secret`),
  CONSTRAINT `FK_262_309` FOREIGN KEY (`team_member`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_308` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_topics`
--

DROP TABLE IF EXISTS `schema_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_topics` (
  `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `version` int(11) NOT NULL,
  `contents` varchar(10000) COLLATE latin1_general_cs NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`,`version`),
  KEY `created_on_idx` (`created_on`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shared_topics`
--

DROP TABLE IF EXISTS `shared_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_topics` (
  `topic_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `project_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`topic_name`),
  KEY `topic_idx` (`topic_name`,`owner_id`),
  CONSTRAINT `topic_idx` FOREIGN KEY (`topic_name`,`owner_id`) REFERENCES `project_topics` (`topic_name`,`project_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs
/*!50100 PARTITION BY KEY (topic_name) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ssh_keys`
--

DROP TABLE IF EXISTS `ssh_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ssh_keys` (
  `uid` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `public_key` varchar(2000) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`uid`,`name`),
  CONSTRAINT `FK_257_471` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_commands`
--

DROP TABLE IF EXISTS `system_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `op` varchar(50) COLLATE latin1_general_cs NOT NULL,
  `status` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `exec_user` varchar(50) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `FK_481_349` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_commands_args`
--

DROP TABLE IF EXISTS `system_commands_args`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_commands_args` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command_id` bigint(20) NOT NULL,
  `arguments` varchar(13900) COLLATE latin1_general_cs DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `command_id_idx` (`command_id`),
  CONSTRAINT `command_id_fk` FOREIGN KEY (`command_id`) REFERENCES `system_commands` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tensorboard`
--

DROP TABLE IF EXISTS `tensorboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tensorboard` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hdfs_user_id` int(11) NOT NULL,
  `endpoint` varchar(100) COLLATE latin1_general_cs NOT NULL,
  `elastic_id` varchar(100) COLLATE latin1_general_cs NOT NULL,
  `pid` bigint(20) NOT NULL,
  `last_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hdfs_logdir` varchar(10000) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `user_id_fk` (`user_id`),
  KEY `hdfs_user_id_fk` (`hdfs_user_id`),
  CONSTRAINT `hdfs_user_id_fk` FOREIGN KEY (`hdfs_user_id`) REFERENCES `hops`.`hdfs_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tf_lib_mapping`
--

DROP TABLE IF EXISTS `tf_lib_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_lib_mapping` (
  `tf_version` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `cuda_version` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `cudnn_version` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `nccl_version` varchar(20) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`tf_version`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tf_serving`
--

DROP TABLE IF EXISTS `tf_serving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_serving` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_port` int(11) DEFAULT NULL,
  `local_pid` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `model_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `model_path` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `version` int(11) NOT NULL,
  `local_dir` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `enable_batching` tinyint(1) DEFAULT '0',
  `optimized` tinyint(4) NOT NULL DEFAULT '0',
  `instances` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) DEFAULT NULL,
  `lock_ip` varchar(15) COLLATE latin1_general_cs DEFAULT NULL,
  `lock_timestamp` bigint(20) DEFAULT NULL,
  `kafka_topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Serving_Constraint` (`project_id`,`model_name`),
  KEY `user_fk` (`creator`),
  KEY `kafka_fk` (`kafka_topic_id`),
  KEY `model_name_k` (`model_name`),
  CONSTRAINT `user_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `kafka_fk` FOREIGN KEY (`kafka_topic_id`) REFERENCES `project_topics` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_284_315` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topic_acls`
--

DROP TABLE IF EXISTS `topic_acls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_acls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `project_id` int(11) NOT NULL,
  `username` varchar(150) COLLATE latin1_general_cs NOT NULL,
  `principal` varchar(170) COLLATE latin1_general_cs NOT NULL,
  `permission_type` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `operation_type` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `host` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `role` varchar(255) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `topic_idx` (`topic_name`,`project_id`),
  CONSTRAINT `FK_262_338` FOREIGN KEY (`username`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `topic_idx` FOREIGN KEY (`topic_name`,`project_id`) REFERENCES `project_topics` (`topic_name`,`project_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_certs`
--

DROP TABLE IF EXISTS `user_certs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_certs` (
  `projectname` varchar(100) COLLATE latin1_general_cs NOT NULL,
  `username` varchar(10) COLLATE latin1_general_cs NOT NULL,
  `user_key` varbinary(7000) DEFAULT NULL,
  `user_cert` varbinary(3000) DEFAULT NULL,
  `user_key_pwd` varchar(200) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`projectname`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `FK_260_465` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_287_464` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`gid`),
  KEY `gid` (`gid`),
  CONSTRAINT `FK_255_269` FOREIGN KEY (`gid`) REFERENCES `bbc_group` (`gid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_257_268` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userlogins`
--

DROP TABLE IF EXISTS `userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlogins` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE latin1_general_cs DEFAULT NULL,
  `useragent` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `action` varchar(80) COLLATE latin1_general_cs DEFAULT NULL,
  `outcome` varchar(20) COLLATE latin1_general_cs DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `login_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `login_date` (`login_date`),
  KEY `uid` (`uid`),
  CONSTRAINT `FK_257_345` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) COLLATE latin1_general_cs NOT NULL,
  `password` varchar(128) COLLATE latin1_general_cs NOT NULL,
  `email` varchar(150) COLLATE latin1_general_cs DEFAULT NULL,
  `fname` varchar(30) COLLATE latin1_general_cs DEFAULT NULL,
  `lname` varchar(30) COLLATE latin1_general_cs DEFAULT NULL,
  `activated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(10) COLLATE latin1_general_cs DEFAULT '-',
  `orcid` varchar(20) COLLATE latin1_general_cs DEFAULT '-',
  `false_login` int(11) NOT NULL DEFAULT '-1',
  `status` int(11) NOT NULL DEFAULT '-1',
  `isonline` int(11) NOT NULL DEFAULT '-1',
  `secret` varchar(20) COLLATE latin1_general_cs DEFAULT NULL,
  `validation_key` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `security_question` varchar(20) COLLATE latin1_general_cs DEFAULT NULL,
  `security_answer` varchar(128) COLLATE latin1_general_cs DEFAULT NULL,
  `mode` int(11) NOT NULL DEFAULT '0',
  `password_changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` varchar(500) COLLATE latin1_general_cs DEFAULT '-',
  `mobile` varchar(15) COLLATE latin1_general_cs DEFAULT '-',
  `max_num_projects` int(11) NOT NULL,
  `num_active_projects` int(11) NOT NULL DEFAULT '0',
  `num_created_projects` int(11) NOT NULL DEFAULT '0',
  `two_factor` tinyint(1) NOT NULL DEFAULT '1',
  `tours_state` tinyint(1) NOT NULL DEFAULT '0',
  `salt` varchar(128) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=ndbcluster AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!50001 DROP VIEW IF EXISTS `users_groups`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users_groups` AS SELECT 
 1 AS `username`,
 1 AS `password`,
 1 AS `secret`,
 1 AS `email`,
 1 AS `group_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `id` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `value` varchar(1024) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zeppelin_interpreter_confs`
--

DROP TABLE IF EXISTS `zeppelin_interpreter_confs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zeppelin_interpreter_confs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `interpreter_conf` text COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_UNIQUE` (`project_id`),
  CONSTRAINT `FK_284_499` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `hops_users`
--

/*!50001 DROP VIEW IF EXISTS `hops_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kthfs`@`10.0.2.15` SQL SECURITY DEFINER */
/*!50001 VIEW `hops_users` AS select concat(`pt`.`team_member`,'__',`p`.`projectname`) AS `project_user` from ((`project` `p` join `project_team` `pt`) join `ssh_keys` `sk`) where `pt`.`team_member` in (select `u`.`email` from (`users` `u` join `ssh_keys` `s`) where (`u`.`uid` = `s`.`uid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_groups`
--

/*!50001 DROP VIEW IF EXISTS `users_groups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kthfs`@`10.0.2.15` SQL SECURITY DEFINER */
/*!50001 VIEW `users_groups` AS select `u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`secret` AS `secret`,`u`.`email` AS `email`,`g`.`group_name` AS `group_name` from ((`user_group` `ug` join `users` `u` on((`u`.`uid` = `ug`.`uid`))) join `bbc_group` `g` on((`g`.`gid` = `ug`.`gid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28  9:55:43

--
--  Feature store tables in Hopsworks
--
CREATE TABLE IF NOT EXISTS `feature_store` (
  `id`         INT(11)    NOT NULL AUTO_INCREMENT,
  `project_id` INT(11)    NOT NULL,
  `created`    TIMESTAMP           DEFAULT CURRENT_TIMESTAMP,
  `hive_db_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`hive_db_id`) REFERENCES `metastore`.`DBS` (`DB_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
  ENGINE = ndbcluster
  DEFAULT CHARSET = latin1
  COLLATE = latin1_general_cs;

CREATE TABLE IF NOT EXISTS `feature_group` (
  `id`                      INT(11)    NOT NULL AUTO_INCREMENT,
  `feature_store_id`        INT(11)    NOT NULL,
  `hdfs_user_id`            INT(11)    NOT NULL,
  `created`                 TIMESTAMP           DEFAULT CURRENT_TIMESTAMP,
  `creator`                 INT(11)    NOT NULL,
  `job_id`                  INT(11)    NULL,
  `hive_tbl_id`             BIGINT(20) NOT NULL,
  `version`                 INT(11)    NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`feature_store_id`) REFERENCES `feature_store` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  FOREIGN KEY (`hdfs_user_id`) REFERENCES `hops`.`hdfs_users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`hive_tbl_id`) REFERENCES `metastore`.`TBLS` (`TBL_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`creator`) REFERENCES `users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = ndbcluster
  DEFAULT CHARSET = latin1
  COLLATE = latin1_general_cs;

CREATE TABLE IF NOT EXISTS `training_dataset` (
  `id`                      INT(11)      NOT NULL AUTO_INCREMENT,
  `feature_store_id`        INT(11)      NOT NULL,
  `hdfs_user_id`            INT(11)      NOT NULL,
  `created`                 TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
  `creator`                 INT(11)      NOT NULL,
  `job_id`                  INT(11)      NULL,
  `version`                 INT(11)      NOT NULL,
  `data_format`             VARCHAR(128) NOT NULL,
  `training_dataset_folder` INT(11)      NOT NULL,
  `inode_pid` BIGINT(20) NOT NULL,
  `inode_name`              VARCHAR(255) NOT NULL,
  `partition_id`            BIGINT(20)      NOT NULL,
  `description`             VARCHAR(10000)         DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`feature_store_id`) REFERENCES `feature_store` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  FOREIGN KEY (`hdfs_user_id`) REFERENCES `hops`.`hdfs_users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`creator`) REFERENCES `users` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`training_dataset_folder`) REFERENCES `dataset` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`inode_pid`, `inode_name`, `partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`, `name`, `partition_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
  ENGINE = ndbcluster
  DEFAULT CHARSET = latin1
  COLLATE = latin1_general_cs;

CREATE TABLE IF NOT EXISTS `featurestore_statistic` (
  `id`               INT(11) NOT NULL AUTO_INCREMENT,
  `feature_group_id` INT(11) DEFAULT NULL,
  `training_dataset_id` INT(11) DEFAULT NULL,
  `name`             VARCHAR(500)   DEFAULT NULL,
  `statistic_type`   INT(11) NOT NULL DEFAULT '0',
  `value`            VARCHAR(13300) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`feature_group_id`) REFERENCES `feature_group` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`training_dataset_id`) REFERENCES `training_dataset` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
  ENGINE = ndbcluster
  DEFAULT CHARSET = latin1
  COLLATE = latin1_general_cs;

CREATE TABLE IF NOT EXISTS `featurestore_dependency` (
  `id`               INT(11) NOT NULL AUTO_INCREMENT,
  `feature_group_id` INT(11) DEFAULT NULL,
  `training_dataset_id` INT(11) DEFAULT NULL,
  `inode_pid` BIGINT(20) NOT NULL,
  `inode_name`              VARCHAR(255) NOT NULL,
  `partition_id`            BIGINT(20)      NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`feature_group_id`) REFERENCES `feature_group` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`training_dataset_id`) REFERENCES `training_dataset` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (`inode_pid`, `inode_name`, `partition_id`) REFERENCES `hops`.`hdfs_inodes` (`parent_id`, `name`, `partition_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
  ENGINE = ndbcluster
  DEFAULT CHARSET = latin1
  COLLATE = latin1_general_cs;

CREATE TABLE IF NOT EXISTS `training_dataset_feature` (
  `id`               INT(11) NOT NULL AUTO_INCREMENT,
  `training_dataset_id` INT(11) NOT NULL,
  `name`             VARCHAR(1000) NOT NULL,
  `primary_column`          tinyint(1) NOT NULL DEFAULT '0',
  `description`             VARCHAR(10000) NOT NULL,
  `type`             VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`training_dataset_id`) REFERENCES `training_dataset` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
  ENGINE = ndbcluster
  DEFAULT CHARSET = latin1
  COLLATE = latin1_general_cs;

ALTER TABLE `hopsworks`.`dataset`
  ADD COLUMN `feature_store_id` INT(11) DEFAULT NULL;
ALTER TABLE `hopsworks`.`dataset`
  ADD FOREIGN KEY `featurestore_fk` (`feature_store_id`) REFERENCES `feature_store` (`id`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;
