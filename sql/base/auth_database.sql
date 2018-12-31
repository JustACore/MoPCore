/*
Navicat MySQL Data Transfer

Source Server         : LocalCore
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-12-31 12:57:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `gmlevelo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Account System';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('5', 'ADMIN', '8301316D0D8448A34FA6D0C6BF1CBFA2B4A1A93A', 'E3E43D8116AD01872C458A04E953EEA1525E1F7B069FDEC3CF4D2B307ECD016F9D81C0CAF6126E9C', '7FFBB139113BF1331FED017C5AA2241CCF9AB978D4D1D4BFEED7FC7114EC1C95', 'B1B977A22BF26FE26A10347122F7E8B9CCC2AC66244F01B488F27EB3B86A4549', '', '', '2018-12-31 12:35:53', '127.0.0.1', '0', '0', '2018-12-31 12:37:56', '0', '4', '0', '0', 'Win', '0', null);

-- ----------------------------
-- Table structure for `account_access`
-- ----------------------------
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  `comment` text,
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_access
-- ----------------------------

-- ----------------------------
-- Table structure for `account_banned`
-- ----------------------------
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- ----------------------------
-- Records of account_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `account_log_ip`
-- ----------------------------
DROP TABLE IF EXISTS `account_log_ip`;
CREATE TABLE `account_log_ip` (
  `accountid` int(11) unsigned NOT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`accountid`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account_log_ip
-- ----------------------------
INSERT INTO `account_log_ip` VALUES ('2', '127.0.0.1', '2014-11-03 00:58:29');
INSERT INTO `account_log_ip` VALUES ('5', '127.0.0.1', '2018-12-31 12:36:27');
INSERT INTO `account_log_ip` VALUES ('4', '127.0.0.1', '2018-12-31 12:34:37');

-- ----------------------------
-- Table structure for `account_premium`
-- ----------------------------
DROP TABLE IF EXISTS `account_premium`;
CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `gm` varchar(12) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_premium
-- ----------------------------

-- ----------------------------
-- Table structure for `account_spell`
-- ----------------------------
DROP TABLE IF EXISTS `account_spell`;
CREATE TABLE `account_spell` (
  `accountId` int(11) NOT NULL,
  `spell` int(10) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountId`,`spell`),
  KEY `account` (`accountId`) USING HASH,
  KEY `account_spell` (`accountId`,`spell`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account_spell
-- ----------------------------
INSERT INTO `account_spell` VALUES ('1', '472', '1', '0');
INSERT INTO `account_spell` VALUES ('7', '10688', '1', '0');
INSERT INTO `account_spell` VALUES ('7', '10709', '1', '0');
INSERT INTO `account_spell` VALUES ('7', '10714', '1', '0');
INSERT INTO `account_spell` VALUES ('7', '36027', '1', '0');
INSERT INTO `account_spell` VALUES ('7', '123212', '1', '0');
INSERT INTO `account_spell` VALUES ('7', '127816', '1', '0');
INSERT INTO `account_spell` VALUES ('11', '64977', '1', '0');

-- ----------------------------
-- Table structure for `firewall_farms`
-- ----------------------------
DROP TABLE IF EXISTS `firewall_farms`;
CREATE TABLE `firewall_farms` (
  `ip` tinytext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of firewall_farms
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_banned`
-- ----------------------------
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- ----------------------------
-- Records of ip_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_to_country`
-- ----------------------------
DROP TABLE IF EXISTS `ip_to_country`;
CREATE TABLE `ip_to_country` (
  `IP_FROM` double NOT NULL,
  `IP_TO` double NOT NULL,
  `COUNTRY_CODE` char(2) DEFAULT NULL,
  `COUNTRY_CODE_3` char(3) NOT NULL,
  `COUNTRY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IP_FROM`,`IP_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ip_to_country
-- ----------------------------

-- ----------------------------
-- Table structure for `log_vote`
-- ----------------------------
DROP TABLE IF EXISTS `log_vote`;
CREATE TABLE `log_vote` (
  `top_name` varchar(15) NOT NULL DEFAULT 'top',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `date` int(11) NOT NULL,
  PRIMARY KEY (`top_name`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of log_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `mails`
-- ----------------------------
DROP TABLE IF EXISTS `mails`;
CREATE TABLE `mails` (
  `email` varchar(254) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mails
-- ----------------------------

-- ----------------------------
-- Table structure for `realmcharacters`
-- ----------------------------
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- ----------------------------
-- Records of realmcharacters
-- ----------------------------
INSERT INTO `realmcharacters` VALUES ('1', '5', '1');
INSERT INTO `realmcharacters` VALUES ('1', '6', '1');
INSERT INTO `realmcharacters` VALUES ('1', '7', '2');
INSERT INTO `realmcharacters` VALUES ('1', '8', '0');
INSERT INTO `realmcharacters` VALUES ('1', '9', '0');
INSERT INTO `realmcharacters` VALUES ('1', '10', '0');
INSERT INTO `realmcharacters` VALUES ('1', '11', '3');
INSERT INTO `realmcharacters` VALUES ('1', '12', '1');

-- ----------------------------
-- Table structure for `realmlist`
-- ----------------------------
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '16135',
  `online` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- ----------------------------
-- Records of realmlist
-- ----------------------------
INSERT INTO `realmlist` VALUES ('1', 'MoPCore', '127.0.0.1', '8085', '0', '0', '1', '0', '0', '18019', '0');

-- ----------------------------
-- Table structure for `transferts`
-- ----------------------------
DROP TABLE IF EXISTS `transferts`;
CREATE TABLE `transferts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `perso_guid` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `revision` blob NOT NULL,
  `dump` longtext NOT NULL,
  `last_error` blob NOT NULL,
  `nb_attempt` int(11) NOT NULL,
  `state` int(10) DEFAULT NULL,
  `error` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transferts
-- ----------------------------

-- ----------------------------
-- Table structure for `transferts_logs`
-- ----------------------------
DROP TABLE IF EXISTS `transferts_logs`;
CREATE TABLE `transferts_logs` (
  `id` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `perso_guid` int(11) DEFAULT NULL,
  `from` int(2) DEFAULT NULL,
  `to` int(2) DEFAULT NULL,
  `dump` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transferts_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `uptime`
-- ----------------------------
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- ----------------------------
-- Records of uptime
-- ----------------------------
INSERT INTO `uptime` VALUES ('1', '1415005048', '10808', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415016211', '20401', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415090384', '40210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415135850', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415136484', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415137435', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415137994', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415138902', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415139583', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415139737', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415140165', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415141015', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415142730', '3601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415146581', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415150030', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415150471', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415152746', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415153103', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415153397', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415153552', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415154212', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415154516', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415155081', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415156482', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415156911', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415157448', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415157926', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415159802', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415160661', '9001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415170334', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415170498', '18001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415316754', '3008', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415320381', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415320841', '22800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415343813', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415346247', '4813', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415352055', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415352845', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415353761', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415355611', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415385129', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415400779', '1810', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415402882', '6601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415410086', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415410613', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415411736', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415418411', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415419312', '62400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415482616', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415483289', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415483765', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415484178', '3000', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415487438', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415487952', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415489060', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415489988', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415491164', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415492405', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415492752', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415493184', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415493840', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415494161', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415495569', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415497143', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415558672', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415559126', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415559941', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415560626', '18001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415647542', '7810', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415655892', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415656194', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415656780', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415658261', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415658774', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415659605', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415660415', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415661106', '21600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415682840', '7200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415690449', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415740991', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415741569', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415742164', '3001', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415745747', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415746175', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415747104', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415748291', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415748764', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415749330', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415749606', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415749735', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415750946', '4801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415755919', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415758682', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415758884', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415759446', '3601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415771577', '4200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415816170', '10208', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415827064', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415831597', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415832763', '1201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415834553', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415835100', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415835779', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415836040', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415836785', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415837302', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415837851', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415838424', '6001', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415844759', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415911060', '4210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415916092', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415916869', '10201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415927782', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415928868', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415972650', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415973216', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415973534', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415973881', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415974789', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415975087', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415975692', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1415976058', '27600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416003951', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416017334', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416017824', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416018472', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416018817', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416019034', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416019420', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416020061', '3001', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416023700', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416029182', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416069397', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416069759', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416070556', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416071152', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416077456', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416084753', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416086940', '3605', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416092441', '6605', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416128327', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416128727', '10201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416158314', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416159441', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416160564', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416161773', '9001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416171151', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416174460', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416174563', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416175403', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416183575', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416183827', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416183951', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416184672', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416185360', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416185932', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416186674', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416188508', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416188906', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416189186', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416191177', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416191473', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416192052', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416192966', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416222270', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416223386', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416223732', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416225850', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416226572', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416227743', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416229901', '18001', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416248119', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416249092', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416249920', '1801', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416252337', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416255470', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416256082', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416256614', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416310356', '1200', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416329621', '54000', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416383786', '15601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416401510', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416403282', '1800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416405411', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416406352', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416407683', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416408148', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416410037', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416412093', '1212', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416413952', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416417157', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416417397', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416417764', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416418657', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416421008', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416421563', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416423115', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416430044', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416433758', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416473345', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416474049', '1201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416475918', '601', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416477081', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416477481', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416477905', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416478183', '1201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416480037', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416480317', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416480839', '601', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416481810', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416482392', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416486115', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416486618', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416487126', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416488603', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416489056', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416490030', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416490580', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416490791', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416491553', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416511061', '607', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416511875', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416512397', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416513660', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416515357', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416515857', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416516140', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416517039', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416517210', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416518015', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416518355', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416519877', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416557563', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416557941', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416558081', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416559068', '611', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416559882', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416560528', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416561024', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416561801', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416562242', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416562577', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416563120', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416564314', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416564762', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416565393', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416566133', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416566510', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416566782', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416568215', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416608795', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416610328', '35401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416817031', '608', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416817992', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416818652', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416819095', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416819423', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416821590', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416822773', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416823118', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416826122', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416829318', '1228', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416838814', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416838937', '31800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416872973', '1806', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416876337', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416876764', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416878301', '32406', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416914150', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416914770', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416915741', '604', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1416919037', '66605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417435646', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417436268', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417436675', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417437089', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417437794', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417438332', '0', '0', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417438677', '0', '0', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417439044', '7201', '1', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417536341', '68405', '2', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417605219', '0', '0', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417613776', '0', '0', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417614166', '0', '0', 'JadeCore rev. Wed Nov 26 13:08:52 2014 -0800 (2:c7b61fa7944a) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417614335', '0', '0', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417614505', '0', '0', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417614672', '0', '0', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417614835', '4201', '0', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417619494', '601', '1', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417620250', '606', '1', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417621169', '0', '0', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417621291', '0', '0', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417621530', '601', '2', 'JadeCore rev. Tue Dec 02 08:47:30 2014 -0800 (4:ebe627003a0b) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417622568', '71418', '2', 'JadeCore rev. Wed Dec 03 07:48:32 2014 -0800 (5:0140ee18e198) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417722083', '1210', '1', 'JadeCore rev. Wed Dec 03 07:48:32 2014 -0800 (5:0140ee18e198) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417723557', '4201', '1', 'JadeCore rev. Wed Dec 03 08:21:11 2014 -0800 (9:a4538939ebe2) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1417787487', '610', '0', 'JadeCore rev. Wed Dec 03 08:21:11 2014 -0800 (9:a4538939ebe2) (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418043825', '25806', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418388353', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418590633', '2405', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418593242', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418593712', '40800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418634729', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418635414', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418635940', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418636035', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418636191', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418637678', '1206', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418638993', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418641354', '3005', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1418927020', '63006', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419180972', '2405', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419183772', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419184234', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419184484', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419184742', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419184897', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419185151', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419185287', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419186175', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419187144', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419187483', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419187603', '61801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419422490', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419422801', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419423065', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419423274', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419423641', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419423784', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419423916', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419424316', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419424818', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419425324', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419426262', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419426372', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419426705', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419427536', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419428065', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419428303', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419429459', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419429620', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419430180', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419430756', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419431644', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419432009', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419432253', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419432611', '76200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419513187', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419514525', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419515015', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419515358', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419515529', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419516455', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419516625', '4201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419531341', '3001', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419535213', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419535693', '7201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419543548', '40801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419584700', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419585868', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419586108', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419589018', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419589435', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419589849', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419590451', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1419590749', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420040246', '11408', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420245623', '605', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420246792', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420247304', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420248254', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420248417', '37801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420289988', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420290414', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420291396', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420291803', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420292030', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420292291', '16801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420311352', '82801', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420646486', '605', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420647716', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1420647884', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421004943', '58805', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421089256', '61806', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421791958', '1805', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421794079', '600', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421854246', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421854605', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421855019', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421855385', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421855672', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421856366', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421857793', '18601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421877060', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421877772', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421878413', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421878693', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421879348', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421880554', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421926115', '1806', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1421929912', '88801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422019262', '19805', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422039439', '1201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422041274', '1801', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422043478', '56401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422100242', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422104622', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422104754', '31801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422136687', '97801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422280802', '1225', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422282633', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422282839', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422283185', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422283562', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422284270', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422284604', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422284711', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422299124', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422300448', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422300981', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422301578', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422302464', '1800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422304499', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422305421', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422305632', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422306183', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422372025', '2408', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422467463', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422467963', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422468407', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422468640', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422469154', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422469351', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422469659', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422469910', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422470363', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422470654', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422470963', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422474554', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422475050', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422475227', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422475458', '12001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422515418', '7201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422523331', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422523971', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422525213', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422527984', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422528410', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422529007', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422529456', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422529771', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422530104', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422530311', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422530521', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422530858', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422531203', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422531639', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422532092', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422532322', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422532626', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422532825', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422533009', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422533551', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422533863', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422534270', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422534500', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422534670', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422534839', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422536116', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422536257', '10201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422547182', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422547890', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422548326', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422548787', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422549297', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422552812', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422553766', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422554505', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422555245', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422556002', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422556286', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422556659', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422557404', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422557739', '61201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422621211', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422622651', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422625897', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422626493', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422627072', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422627352', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422627578', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422627740', '84001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422711960', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422712436', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422713041', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422713809', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422714743', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422716216', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422716926', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422717199', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422718460', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422718952', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422719342', '72601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422797319', '76801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422875629', '43201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422920876', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422921401', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422921781', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422922043', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422923053', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422923894', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422924591', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422924849', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422926720', '25201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422956852', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422958241', '616', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422959351', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422960290', '1806', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422962586', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422963073', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422963721', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422964494', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422976135', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422977954', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422978282', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422978969', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422979624', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1422980258', '24601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423053572', '4807', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423059213', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423059873', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423061757', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423062223', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423062680', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423064044', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423064216', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423064829', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423065154', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423066280', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423067044', '1800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423069104', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423072578', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423074297', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423074913', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423076930', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423077534', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423079090', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423082698', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423083413', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423083724', '4801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423142875', '21010', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423164859', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423165816', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423167028', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423167302', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423168037', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423169872', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423170367', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423170711', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423171496', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423172110', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423172768', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423173440', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423173819', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423174221', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423175710', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423176501', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423177687', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423183886', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423186916', '29400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423216526', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423216966', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423217992', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423218192', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423218534', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423219073', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423219481', '12001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423233304', '4801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423238978', '1210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423240412', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423241061', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423242126', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423242573', '41401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423308786', '6618', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423316345', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423317153', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423317380', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423318172', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423318663', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423319346', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423320219', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423324264', '11401', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423492562', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423493025', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423493618', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423493865', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423494277', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423495621', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423495918', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423496208', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423496666', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423496891', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423497226', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423499632', '1200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423501520', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423502186', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423503053', '1801', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423505139', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423506889', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423507486', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423507870', '59400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423567759', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423576392', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423581932', '1806', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423592854', '6006', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423599197', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423599380', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423599807', '600', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423600501', '53401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423654389', '609', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423655522', '3601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423659290', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423659502', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423660121', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423660476', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423660598', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423660781', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423660989', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423661202', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423661406', '21001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423851135', '1224', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423867139', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423867633', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423867924', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423868215', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423874788', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423874908', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423875113', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423875211', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423959050', '36610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423996408', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423997245', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423998169', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1423999857', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424000458', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424001600', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424002030', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424002408', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424002940', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424003523', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424008620', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424013754', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424014469', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424014643', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424014909', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424015805', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424016540', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424022355', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424023684', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424024134', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424025629', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424026308', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424026774', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424030295', '54601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424085560', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424086354', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424087116', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424088204', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424089299', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424089807', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424090531', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1424091353', '6606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425073062', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425073819', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425074105', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425074612', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425074810', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425075296', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425076524', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425077096', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425077331', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425078776', '2405', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425081759', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425082697', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425083032', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425083185', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425083393', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425083671', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425084025', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425084236', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425084362', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425085994', '38405', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1425769384', '37205', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426417801', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426418567', '40201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426459392', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426460185', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426680227', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426680850', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426681034', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426681227', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426681441', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426855773', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426856438', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426856680', '1201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426858474', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426859613', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426859867', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426859935', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426860635', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426861461', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426862190', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426863037', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426863198', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426863359', '15001', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426946373', '4200', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426950881', '1207', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426952409', '3600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426956682', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426956780', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426957151', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426958256', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426958362', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1426959388', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427016349', '5401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427032376', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427033120', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427034430', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427034800', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427035707', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427036101', '5401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427111989', '608', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427112984', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427113468', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427113770', '16801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427138177', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427138456', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427139004', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427139347', '47401', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427379268', '1211', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427380712', '73201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427804973', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427886003', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427886233', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427886555', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427887598', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427887937', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427888227', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427888752', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427890024', '8401', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427899090', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427899478', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427899714', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427900828', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427901902', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427902113', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427905534', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1427905674', '66601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428061011', '4810', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428066049', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428067076', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428068098', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428142816', '619', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428143683', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428143912', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428145137', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428146165', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428146774', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428147306', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428736060', '1810', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428738059', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428738328', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428739091', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428739430', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428740080', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428740359', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428740538', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428741555', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428742065', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428742954', '607', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428743679', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428744236', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1428744321', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429790918', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429791829', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429795239', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429795885', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429796834', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429798503', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429799141', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429799512', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429924331', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1429924492', '11401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430856389', '1810', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430858681', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430858847', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430859760', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430860287', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430860682', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430861968', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430862403', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430862632', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430862863', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430863594', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430863961', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430864560', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430865483', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1430866120', '43801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431024711', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431024786', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431025641', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431026202', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431027255', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431028188', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431029201', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431029575', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431029831', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431030722', '51601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1431965383', '21609', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432391241', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432391565', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432391898', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432392484', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432393001', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432393584', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432394093', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432394905', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432395319', '69601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432476595', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432476884', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432477014', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432477314', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432479756', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432484450', '17400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432502091', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432507198', '42002', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432713990', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432715146', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432717292', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432718009', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432718600', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432719064', '1200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432725514', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432725990', '1800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1432729194', '7200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433018021', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433019428', '3000', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433022526', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433023147', '5400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433071376', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433073853', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433074220', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433074970', '4200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433079556', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433080821', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433085558', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433087154', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433088860', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433090241', '5401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433096103', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433096564', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433097210', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433099358', '42602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433142582', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433142949', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433144370', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433146768', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433147740', '8401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433165370', '7202', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433172695', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433173610', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433174712', '1202', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433176015', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433177067', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433178476', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433181125', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433181962', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433182696', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433184062', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433186064', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433186936', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433188294', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433189414', '1802', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433353866', '3002', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433356990', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433357974', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433358166', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433358383', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433358540', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433359026', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433359412', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433359648', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433359922', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433360191', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433360390', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433361076', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433362077', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433362977', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433364779', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433365365', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433366094', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433366574', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433366908', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433367121', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433367298', '37800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433405516', '1202', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433407315', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433407438', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433407599', '7800', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433435934', '3601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1433439718', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434196721', '10202', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434211811', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434212448', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434212558', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434212640', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434213042', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434213255', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434213668', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434213994', '600', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434215763', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434216001', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434216309', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434217126', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434217374', '1201', '3', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434280112', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434280244', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434280364', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434283533', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434284052', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434412548', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434413264', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434414519', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434415032', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434417651', '1805', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434420108', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434643489', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434645089', '1208', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434646919', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434648219', '1207', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434650708', '24007', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434723628', '74407', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434977026', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434977398', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434977860', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434978026', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434978249', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434978416', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434978660', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434979336', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434979460', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434980047', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434980729', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434981115', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434981753', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434981958', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434982499', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434982669', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434982824', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434982978', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434983274', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434983486', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434984098', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434984392', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434984683', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434985370', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1434985781', '69601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435076119', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435076727', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435077152', '22201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435099688', '38405', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435564955', '615', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435565906', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435566446', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435567271', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435568224', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435569620', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435570511', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435571429', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435659930', '1820', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1435687273', '69013', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436666108', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436799925', '16810', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436820906', '608', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436822063', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436822366', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436823284', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436824085', '47401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436884839', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436885298', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436886641', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436886763', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436887410', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436888186', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436889127', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436889995', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436890456', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436891426', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436892232', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436896887', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436898936', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436899264', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436900159', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436901079', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436901921', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436902758', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436903048', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436905339', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436906986', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436908498', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436909113', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436911502', '602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436912821', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436913953', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436915424', '607', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436916635', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1436918177', '1206', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437124775', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437125829', '4801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437222120', '81620', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437424646', '13210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437456596', '5410', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437489742', '36609', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437577408', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437577880', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437579952', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437580429', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437580837', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437581055', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437581469', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437582321', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437583409', '9614', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437593501', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437594901', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437595238', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437596957', '1200', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437598684', '12001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437611063', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437611243', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437611429', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437611794', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437612339', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437612639', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437612785', '40801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437653722', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437654011', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437655256', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437657122', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437658748', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437659130', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437659514', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437660004', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437660254', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437660532', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437660953', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437661510', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437661844', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437662450', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437662708', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437663851', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437664942', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437665922', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437670482', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437671537', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437672371', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437672659', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437673002', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437673236', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437673793', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437674027', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437674294', '18601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437693544', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437694047', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437694215', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437694472', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437694814', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437695044', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437775445', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437776377', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437777245', '8401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437821313', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437821990', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437823932', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437832590', '4809', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437838246', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437838533', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437839513', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437840722', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437841113', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437843072', '609', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437852300', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437852651', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437852868', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437853459', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437853571', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437853689', '18601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437893511', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437893913', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437894072', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437894859', '1200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437896580', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437896862', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437897696', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437897784', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437898977', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437899165', '22201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437922084', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437922622', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437922837', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437923258', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437923423', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437923885', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437924165', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437925035', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437925298', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437925769', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437925950', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437926296', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437926803', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437927060', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437927303', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437927457', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437927757', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437927906', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437928034', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437928162', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437928268', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437929575', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437929887', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437930066', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437930460', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437930598', '5401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437936476', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437936731', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437937116', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437937424', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437937556', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437937689', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437937979', '1201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437939442', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437939686', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437939999', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437940348', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437940611', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437941058', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437941352', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437941577', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437942608', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437943045', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437943241', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437943657', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437944301', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437944784', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437991665', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437992615', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437993119', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437993397', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437993757', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437993962', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437995044', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437995405', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437996124', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437996648', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437996859', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1437999748', '16801', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438016739', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438017242', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438017560', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438017967', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438018642', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438019124', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438019455', '25801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438073562', '1209', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438075373', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438075571', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438076363', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438077992', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438079465', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438080293', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438080962', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438081796', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438082230', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438082757', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438082961', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438083558', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438084059', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438085513', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438086506', '2400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438089048', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438089770', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438091337', '5400', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438124566', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438124869', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438125182', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438125323', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438125980', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438126380', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438127296', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438127519', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438127950', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438128053', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438128492', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438128816', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438129156', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438129895', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438130429', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438130732', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438130921', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438131483', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438131666', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438132388', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438132610', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438132998', '54601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438721823', '2407', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438724724', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438725403', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438725981', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438726350', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1438778930', '5421', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439039790', '609', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439040562', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439041504', '30601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439118528', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439119161', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439119398', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439121394', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439121541', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439122090', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439296577', '1209', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439298215', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439298822', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439299720', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439300285', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439301449', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439301641', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439301850', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439302002', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439302280', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439302390', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439302524', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439302623', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439302718', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439303113', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439464381', '5406', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439639172', '1210', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439641489', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439642835', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439643568', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439644136', '4206', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1439928425', '14410', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440063598', '25811', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440090078', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440090246', '28201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440244530', '1209', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440245907', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440246074', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440249853', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440250400', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440251762', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440251932', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440252612', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440253681', '603', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440254640', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440255724', '7201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440263168', '2406', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440265696', '2405', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440272052', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440273837', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440274240', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440274787', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440276262', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440276846', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440316814', '3606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440321117', '24606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440346247', '3006', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440351206', '26405', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440409229', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440409810', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440410037', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440410444', '1206', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440411994', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440416594', '4814', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440421833', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440428010', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440430898', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440431553', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440435224', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440435469', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440435990', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440441355', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440498618', '1210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440500054', '3601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440507823', '4801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440513215', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440514506', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440515978', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440516700', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440518316', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440521850', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440523437', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440525069', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440526414', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440527125', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440529093', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440530406', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440531123', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440531938', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440581244', '610', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440582613', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440584348', '1801', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440586657', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440586903', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440587201', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440588649', '2402', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440591396', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440592406', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440593208', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440594001', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440595559', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440596157', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440598093', '3602', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440602297', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440604744', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440607467', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440608669', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440610535', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440611722', '5410', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440618816', '1210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440620161', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440621103', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440623414', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440623743', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440625989', '10801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440694248', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440826042', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440828809', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440829396', '6001', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440836383', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440837673', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440839131', '1216', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440841598', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440842561', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440843946', '9605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440854414', '605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440855431', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440856322', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440856899', '1205', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440858887', '6606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440866203', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440866537', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440867755', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440869178', '3605', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1440949909', '33008', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1441021453', '610', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1441107370', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1441108437', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1441695867', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1441696448', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442065987', '4207', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442665265', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442676851', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442681844', '24007', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442706363', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442706854', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442707055', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442707195', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442707481', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442707594', '3001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442711620', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442843686', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442843922', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442844999', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1442845453', '5410', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443039482', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443041233', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443041813', '10200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443053247', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443053746', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443178276', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443178497', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443180128', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443181394', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443181709', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443183063', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443183807', '10201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443194708', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443195057', '34201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443279901', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443281721', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443449766', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443450029', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443450755', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443451172', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443453309', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443457188', '1206', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443466826', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443639856', '21011', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443704823', '6633', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1443988219', '18608', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444066247', '1206', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444068508', '2406', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444074659', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444077109', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444077684', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444078035', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444078257', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444169470', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444169744', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444170126', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444170412', '7201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444223036', '4207', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444227766', '6001', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444236517', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444244769', '21011', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444287025', '8409', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444304600', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444305140', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444401933', '1208', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444404620', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444405909', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444406563', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444407013', '10205', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444839633', '31210', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1444996263', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445344450', '1210', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445346360', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445346625', '1201', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445348177', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445348316', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445349945', '1800', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445685569', '20411', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445708472', '607', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445709231', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445709682', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445711653', '3767', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445717691', '40517', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445759404', '1204', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445761086', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445762104', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445762491', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445763986', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445765504', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445766393', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445766718', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445767509', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445768114', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445773153', '1801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445775627', '7834', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445784162', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445784441', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445785860', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445786929', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445787810', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445788614', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445790101', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445866120', '611', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445869628', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445871391', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445872949', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445875718', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445876632', '601', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445877859', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445878657', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445879447', '1201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445880839', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445883910', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445884806', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445885802', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445886225', '1201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445888162', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445888698', '22201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445938366', '5400', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445944581', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445945078', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445945870', '1206', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1445947739', '67806', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446029351', '2407', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446032710', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446033875', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446034234', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446034813', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446035521', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446036392', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446041077', '42601', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446117969', '4201', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446122963', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446123517', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446123885', '2401', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446131538', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446131960', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446132891', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446133321', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446134186', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446134521', '600', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446135343', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446135726', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446136188', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446136491', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446137083', '1200', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446138931', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446139191', '1801', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446141256', '1201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446145519', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446146029', '601', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446146817', '1201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446148165', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446149123', '63600', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446213000', '1205', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446214913', '1801', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446217053', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446217800', '606', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446218976', '8443', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446249388', '616', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446250790', '601', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446265756', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446266048', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446266189', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446266385', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446266566', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446266770', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446267012', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446267322', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446267910', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446268187', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446268528', '4801', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446273747', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446274588', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446274881', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446275262', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446275622', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446276251', '601', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446277164', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446277934', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446278611', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446278972', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446279361', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446279633', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446279888', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446280167', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446280401', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446280831', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446281214', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446281698', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446282315', '1201', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446284183', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446284633', '5401', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446298743', '6001', '2', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1446401409', '28208', '1', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1447051668', '0', '0', 'JadeCore rev.  () (Win32, Debug)');
INSERT INTO `uptime` VALUES ('1', '1460932612', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1460932991', '12001', '1', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1467497385', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1467499647', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1467505187', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1467505346', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1468771660', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1468771931', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1468775249', '616', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1468777037', '611', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1468778323', '1201', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1468782388', '3015', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1468951703', '3036', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1468957202', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469039094', '6623', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469131300', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469132030', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469132185', '5400', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469198675', '7801', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469206749', '1201', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469208262', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469208852', '600', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469209584', '4200', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469464531', '1823', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469568548', '1822', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469601114', '2400', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469619426', '12600', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1469726859', '12022', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1471633474', '12034', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1471705891', '4227', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1471984021', '3032', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472239528', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472239951', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472240170', '2402', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472303899', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472304258', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472304404', '600', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472305461', '601', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472306236', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472306412', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472306930', '0', '0', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1472307421', '601', '1', 'JadeCore rev.  () (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1546217875', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1546219210', '0', '0', 'JadeCore rev.  () (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1546220022', '0', '0', 'JadeCore rev.  () (Win32, Release)');
