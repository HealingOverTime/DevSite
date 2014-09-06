-- MySQL dump 10.13  Distrib 5.6.16, for Win32 (x86)
--
-- Host: localhost    Database: vanilla
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `gdn_action`
--

DROP TABLE IF EXISTS `gdn_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_action` (
  `ActionID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Tooltip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CssClass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AwardValue` int(11) NOT NULL DEFAULT '1',
  `Permission` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yaga.Reactions.Add',
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`ActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_action`
--

LOCK TABLES `gdn_action` WRITE;
/*!40000 ALTER TABLE `gdn_action` DISABLE KEYS */;
INSERT INTO `gdn_action` VALUES (1,'Like','I approve!','This indicates casual approval','ReactThumbsUp',1,'Yaga.Reactions.Add',NULL),(2,'Dislike','I disapprove!','This indicates casual disapproval','ReactThumbsUp2',-1,'Yaga.Reactions.Add',NULL),(3,'Promote','This post deserves to be featured on the best of page!','Click me if this content should be featured.','ReactPointUp',5,'Garden.Curation.Manage',NULL);
/*!40000 ALTER TABLE `gdn_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_activity`
--

DROP TABLE IF EXISTS `gdn_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityTypeID` int(11) NOT NULL,
  `NotifyUserID` int(11) NOT NULL DEFAULT '0',
  `ActivityUserID` int(11) DEFAULT NULL,
  `RegardingUserID` int(11) DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HeadlineFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Story` text COLLATE utf8_unicode_ci,
  `Format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `Notified` tinyint(4) NOT NULL DEFAULT '0',
  `Emailed` tinyint(4) NOT NULL DEFAULT '0',
  `Data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ActivityID`),
  KEY `IX_Activity_Notify` (`NotifyUserID`,`Notified`),
  KEY `IX_Activity_Recent` (`NotifyUserID`,`DateUpdated`),
  KEY `IX_Activity_Feed` (`NotifyUserID`,`ActivityUserID`,`DateUpdated`),
  KEY `IX_Activity_DateUpdated` (`DateUpdated`),
  KEY `FK_Activity_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_activity`
--

LOCK TABLES `gdn_activity` WRITE;
/*!40000 ALTER TABLE `gdn_activity` DISABLE KEYS */;
INSERT INTO `gdn_activity` VALUES (1,17,-1,1,NULL,NULL,'{ActivityUserID,You} joined.','Welcome Aboard!',NULL,NULL,NULL,NULL,NULL,'2014-08-15 18:26:54','127.0.0.1','2014-08-15 18:26:54',0,0,'a:0:{}'),(2,15,-1,1,2,NULL,'{RegardingUserID,you} &rarr; {ActivityUserID,you}','Ping! An activity post is a public way to talk at someone. When you update your status here, it posts it on your activity feed.','Html',NULL,NULL,NULL,2,'2014-08-15 18:26:56',NULL,'2014-08-15 18:26:56',0,0,NULL),(3,18,-1,1,NULL,NULL,'{ActivityUserID,user}','Here\'s a status message','Html',NULL,NULL,NULL,1,'2014-08-16 13:52:14','127.0.0.1','2014-08-16 13:52:14',0,0,'a:0:{}');
/*!40000 ALTER TABLE `gdn_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_activitycomment`
--

DROP TABLE IF EXISTS `gdn_activitycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_activitycomment` (
  `ActivityCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ActivityCommentID`),
  KEY `FK_ActivityComment_ActivityID` (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_activitycomment`
--

LOCK TABLES `gdn_activitycomment` WRITE;
/*!40000 ALTER TABLE `gdn_activitycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_activitycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_activitytype`
--

DROP TABLE IF EXISTS `gdn_activitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_activitytype` (
  `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AllowComments` tinyint(4) NOT NULL DEFAULT '0',
  `ShowIcon` tinyint(4) NOT NULL DEFAULT '0',
  `ProfileHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RouteCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ActivityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_activitytype`
--

LOCK TABLES `gdn_activitytype` WRITE;
/*!40000 ALTER TABLE `gdn_activitytype` DISABLE KEYS */;
INSERT INTO `gdn_activitytype` VALUES (1,'SignIn',0,0,'%1$s signed in.','%1$s signed in.',NULL,0,1),(2,'Join',1,0,'%1$s joined.','%1$s joined.',NULL,0,1),(3,'JoinInvite',1,0,'%1$s accepted %4$s invitation for membership.','%1$s accepted %4$s invitation for membership.',NULL,0,1),(4,'JoinApproved',1,0,'%1$s approved %4$s membership application.','%1$s approved %4$s membership application.',NULL,0,1),(5,'JoinCreated',1,0,'%1$s created an account for %3$s.','%1$s created an account for %3$s.',NULL,0,1),(6,'AboutUpdate',1,0,'%1$s updated %6$s profile.','%1$s updated %6$s profile.',NULL,0,1),(7,'WallComment',1,1,'%1$s wrote:','%1$s wrote on %4$s %5$s.',NULL,0,1),(8,'PictureChange',1,0,'%1$s changed %6$s profile picture.','%1$s changed %6$s profile picture.',NULL,0,1),(9,'RoleChange',1,0,'%1$s changed %4$s permissions.','%1$s changed %4$s permissions.',NULL,1,1),(10,'ActivityComment',0,1,'%1$s','%1$s commented on %4$s %8$s.','activity',1,1),(11,'Import',0,0,'%1$s imported data.','%1$s imported data.',NULL,1,0),(12,'Banned',0,0,'%1$s banned %3$s.','%1$s banned %3$s.',NULL,0,1),(13,'Unbanned',0,0,'%1$s un-banned %3$s.','%1$s un-banned %3$s.',NULL,0,1),(14,'Applicant',0,0,'%1$s applied for membership.','%1$s applied for membership.',NULL,1,0),(15,'WallPost',1,1,'%3$s wrote:','%3$s wrote on %2$s %5$s.',NULL,0,1),(16,'Default',0,0,NULL,NULL,NULL,0,1),(17,'Registration',0,0,NULL,NULL,NULL,0,1),(18,'Status',0,0,NULL,NULL,NULL,0,1),(19,'Ban',0,0,NULL,NULL,NULL,0,1),(20,'ConversationMessage',0,0,'%1$s sent you a %8$s.','%1$s sent you a %8$s.','message',1,0),(21,'AddedToConversation',0,0,'%1$s added %3$s to a %8$s.','%1$s added %3$s to a %8$s.','conversation',1,0),(22,'NewDiscussion',0,0,'%1$s started a %8$s.','%1$s started a %8$s.','discussion',0,0),(23,'NewComment',0,0,'%1$s commented on a discussion.','%1$s commented on a discussion.','discussion',0,0),(24,'DiscussionComment',0,0,'%1$s commented on %4$s %8$s.','%1$s commented on %4$s %8$s.','discussion',1,0),(25,'DiscussionMention',0,0,'%1$s mentioned %3$s in a %8$s.','%1$s mentioned %3$s in a %8$s.','discussion',1,0),(26,'CommentMention',0,0,'%1$s mentioned %3$s in a %8$s.','%1$s mentioned %3$s in a %8$s.','comment',1,0),(27,'BookmarkComment',0,0,'%1$s commented on your %8$s.','%1$s commented on your %8$s.','bookmarked discussion',1,0),(28,'Discussion',0,0,NULL,NULL,NULL,0,1),(29,'Comment',0,0,NULL,NULL,NULL,0,1),(30,'BadgeAward',1,0,'%1$s earned a badge.','%1$s earned a badge.',NULL,1,1),(31,'RankPromotion',1,0,'%1$s was promoted.','%1$s was promoted.',NULL,1,1);
/*!40000 ALTER TABLE `gdn_activitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_analyticslocal`
--

DROP TABLE IF EXISTS `gdn_analyticslocal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_analyticslocal` (
  `TimeSlot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Views` int(11) DEFAULT NULL,
  `EmbedViews` int(11) DEFAULT NULL,
  UNIQUE KEY `UX_AnalyticsLocal` (`TimeSlot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_analyticslocal`
--

LOCK TABLES `gdn_analyticslocal` WRITE;
/*!40000 ALTER TABLE `gdn_analyticslocal` DISABLE KEYS */;
INSERT INTO `gdn_analyticslocal` VALUES ('20140815',9,0),('20140816',109,0),('20140817',1,0),('20140818',8,0),('20140903',1,0);
/*!40000 ALTER TABLE `gdn_analyticslocal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_badge`
--

DROP TABLE IF EXISTS `gdn_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_badge` (
  `BadgeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RuleClass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RuleCriteria` text COLLATE utf8_unicode_ci,
  `AwardValue` int(11) NOT NULL DEFAULT '0',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`BadgeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_badge`
--

LOCK TABLES `gdn_badge` WRITE;
/*!40000 ALTER TABLE `gdn_badge` DISABLE KEYS */;
INSERT INTO `gdn_badge` VALUES (1,'What did I just do?','You installed Yaga! Feel free to edit or delete this badge by clicking the buttons on the right.','../applications/yaga/design/images/default_badge.png','ManualAward','a:0:{}',1,0),(2,'Spring 2014','Participated in the Spring 2014 gaming marathon','applications/yaga/design/images/default_badge.png','ManualAward','a:0:{}',10,1),(3,'A Friendly Welcome','Given to members who reply to a newly registered member','applications/yaga/design/images/default_badge.png','NewbieComment','a:2:{s:8:\"Duration\";s:1:\"3\";s:6:\"Period\";s:3:\"day\";}',5,1),(4,'Great advice','Obtained 10 or more accepted answers','applications/yaga/design/images/default_badge.png','QnAAnserCount','a:2:{s:10:\"Comparison\";s:2:\"gt\";s:6:\"Target\";s:2:\"10\";}',5,1);
/*!40000 ALTER TABLE `gdn_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_badgeaward`
--

DROP TABLE IF EXISTS `gdn_badgeaward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_badgeaward` (
  `BadgeAwardID` int(11) NOT NULL AUTO_INCREMENT,
  `BadgeID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `Reason` text COLLATE utf8_unicode_ci,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`BadgeAwardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_badgeaward`
--

LOCK TABLES `gdn_badgeaward` WRITE;
/*!40000 ALTER TABLE `gdn_badgeaward` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_badgeaward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_ban`
--

DROP TABLE IF EXISTS `gdn_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_ban` (
  `BanID` int(11) NOT NULL AUTO_INCREMENT,
  `BanType` enum('IPAddress','Name','Email') COLLATE utf8_unicode_ci NOT NULL,
  `BanValue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountUsers` int(10) unsigned NOT NULL DEFAULT '0',
  `CountBlockedRegistrations` int(10) unsigned NOT NULL DEFAULT '0',
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`BanID`),
  UNIQUE KEY `UX_Ban` (`BanType`,`BanValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_ban`
--

LOCK TABLES `gdn_ban` WRITE;
/*!40000 ALTER TABLE `gdn_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_category`
--

DROP TABLE IF EXISTS `gdn_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `TreeLeft` int(11) DEFAULT NULL,
  `TreeRight` int(11) DEFAULT NULL,
  `Depth` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateMarkedRead` datetime DEFAULT NULL,
  `AllowDiscussions` tinyint(4) NOT NULL DEFAULT '1',
  `Archived` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UrlCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `CssClass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PermissionCategoryID` int(11) NOT NULL DEFAULT '-1',
  `HideAllDiscussions` tinyint(4) NOT NULL DEFAULT '0',
  `DisplayAs` enum('Categories','Discussions','Default') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default',
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `LastDiscussionID` int(11) DEFAULT NULL,
  `LastDateInserted` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `FK_Category_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_category`
--

LOCK TABLES `gdn_category` WRITE;
/*!40000 ALTER TABLE `gdn_category` DISABLE KEYS */;
INSERT INTO `gdn_category` VALUES (-1,-1,1,12,0,0,0,NULL,1,0,'Root','root','Root of category tree. Users should never see this.',1,NULL,NULL,-1,0,'Default',1,1,'2014-08-15 18:26:55','2014-08-15 18:26:55',NULL,NULL,NULL),(2,-1,2,3,1,1,0,NULL,1,0,'General Chat','general-chat','Talk about whatever\'s on your mind',2,'',NULL,-1,0,'Default',1,1,'2014-08-16 13:18:02','2014-08-16 13:18:02',NULL,2,'2014-08-16 14:37:55'),(4,-1,4,5,1,0,0,NULL,1,0,'Advice','advice','Give and receive advice on all topics related to gaming, community leadership, health, harassment and more.',4,'',NULL,-1,0,'Default',1,1,'2014-08-16 13:19:28','2014-08-16 13:21:23',NULL,NULL,NULL),(6,-1,6,7,1,0,0,NULL,1,0,'Fundraising','fundraising','',6,'',NULL,-1,0,'Default',1,1,'2014-08-16 13:20:16','2014-08-16 13:20:16',NULL,NULL,NULL),(7,-1,8,9,1,0,0,NULL,1,0,'Talk to the staff','talk-to-the-staff','Get to know us and give feedback about the project and website',8,'',NULL,-1,0,'Default',1,1,'2014-08-16 13:21:55','2014-08-16 13:21:55',NULL,NULL,NULL),(8,-1,10,11,1,0,0,NULL,1,0,'Staff Room','staff-room','',10,'',NULL,8,0,'Categories',1,1,'2014-08-16 22:50:19','2014-08-16 22:50:19',NULL,NULL,NULL);
/*!40000 ALTER TABLE `gdn_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_comment`
--

DROP TABLE IF EXISTS `gdn_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_comment` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DeleteUserID` int(11) DEFAULT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flag` tinyint(4) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CommentID`),
  KEY `IX_Comment_1` (`DiscussionID`,`DateInserted`),
  KEY `IX_Comment_DateInserted` (`DateInserted`),
  KEY `FK_Comment_InsertUserID` (`InsertUserID`),
  FULLTEXT KEY `TX_Comment` (`Body`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_comment`
--

LOCK TABLES `gdn_comment` WRITE;
/*!40000 ALTER TABLE `gdn_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_conversation`
--

DROP TABLE IF EXISTS `gdn_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_conversation` (
  `ConversationID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contributors` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirstMessageID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ConversationID`),
  KEY `FK_Conversation_FirstMessageID` (`FirstMessageID`),
  KEY `FK_Conversation_InsertUserID` (`InsertUserID`),
  KEY `FK_Conversation_DateInserted` (`DateInserted`),
  KEY `FK_Conversation_UpdateUserID` (`UpdateUserID`),
  KEY `IX_Conversation_RegardingID` (`RegardingID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_conversation`
--

LOCK TABLES `gdn_conversation` WRITE;
/*!40000 ALTER TABLE `gdn_conversation` DISABLE KEYS */;
INSERT INTO `gdn_conversation` VALUES (1,NULL,'a:2:{i:0;s:1:\"2\";i:1;s:1:\"1\";}',NULL,2,'2014-08-15 18:26:55',NULL,NULL,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `gdn_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_conversationmessage`
--

DROP TABLE IF EXISTS `gdn_conversationmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_conversationmessage` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `ConversationID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `FK_ConversationMessage_ConversationID` (`ConversationID`),
  KEY `FK_ConversationMessage_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_conversationmessage`
--

LOCK TABLES `gdn_conversationmessage` WRITE;
/*!40000 ALTER TABLE `gdn_conversationmessage` DISABLE KEYS */;
INSERT INTO `gdn_conversationmessage` VALUES (1,1,'Pssst. Hey. A conversation is a private chat between two or more members. No one can see it except the members added. You can delete this one since I&rsquo;m just a bot and know better than to talk back.','Html',2,'2014-08-15 18:26:55',NULL);
/*!40000 ALTER TABLE `gdn_conversationmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_discussion`
--

DROP TABLE IF EXISTS `gdn_discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_discussion` (
  `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `FirstCommentID` int(11) DEFAULT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountViews` int(11) NOT NULL DEFAULT '1',
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateLastComment` datetime DEFAULT NULL,
  `LastCommentUserID` int(11) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DiscussionID`),
  KEY `IX_Discussion_Type` (`Type`),
  KEY `IX_Discussion_ForeignID` (`ForeignID`),
  KEY `IX_Discussion_DateInserted` (`DateInserted`),
  KEY `IX_Discussion_DateLastComment` (`DateLastComment`),
  KEY `IX_Discussion_RegardingID` (`RegardingID`),
  KEY `IX_Discussion_CategoryPages` (`CategoryID`,`DateLastComment`),
  KEY `FK_Discussion_CategoryID` (`CategoryID`),
  KEY `FK_Discussion_InsertUserID` (`InsertUserID`),
  FULLTEXT KEY `TX_Discussion` (`Name`,`Body`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_discussion`
--

LOCK TABLES `gdn_discussion` WRITE;
/*!40000 ALTER TABLE `gdn_discussion` DISABLE KEYS */;
INSERT INTO `gdn_discussion` VALUES (2,NULL,NULL,2,1,NULL,NULL,NULL,'What upcoming games are you looking forward to and why?','As the title says, what are you watching intently?','Html',NULL,0,NULL,5,0,0,0,'2014-08-16 14:37:55',NULL,'127.0.0.1',NULL,'2014-08-16 14:37:55',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `gdn_discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_draft`
--

DROP TABLE IF EXISTS `gdn_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_draft` (
  `DraftID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`DraftID`),
  KEY `FK_Draft_DiscussionID` (`DiscussionID`),
  KEY `FK_Draft_CategoryID` (`CategoryID`),
  KEY `FK_Draft_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_draft`
--

LOCK TABLES `gdn_draft` WRITE;
/*!40000 ALTER TABLE `gdn_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_flag`
--

DROP TABLE IF EXISTS `gdn_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_flag` (
  `DiscussionID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `InsertName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `AuthorName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `DateInserted` datetime NOT NULL,
  KEY `FK_Flag_InsertUserID` (`InsertUserID`),
  KEY `FK_Flag_ForeignURL` (`ForeignURL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_flag`
--

LOCK TABLES `gdn_flag` WRITE;
/*!40000 ALTER TABLE `gdn_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_invitation`
--

DROP TABLE IF EXISTS `gdn_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_invitation` (
  `InvitationID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `AcceptedUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`InvitationID`),
  KEY `FK_Invitation_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_invitation`
--

LOCK TABLES `gdn_invitation` WRITE;
/*!40000 ALTER TABLE `gdn_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_log`
--

DROP TABLE IF EXISTS `gdn_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_log` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `Operation` enum('Delete','Edit','Spam','Moderate','Pending','Ban','Error') COLLATE utf8_unicode_ci NOT NULL,
  `RecordType` enum('Discussion','Comment','User','Registration','Activity','ActivityComment','Configuration','Group') COLLATE utf8_unicode_ci NOT NULL,
  `TransactionLogID` int(11) DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `RecordUserID` int(11) DEFAULT NULL,
  `RecordDate` datetime NOT NULL,
  `RecordIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OtherUserIDs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `ParentRecordID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Data` mediumtext COLLATE utf8_unicode_ci,
  `CountGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  KEY `IX_Log_RecordType` (`RecordType`),
  KEY `IX_Log_RecordID` (`RecordID`),
  KEY `IX_Log_RecordIPAddress` (`RecordIPAddress`),
  KEY `IX_Log_ParentRecordID` (`ParentRecordID`),
  KEY `FK_Log_CategoryID` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_log`
--

LOCK TABLES `gdn_log` WRITE;
/*!40000 ALTER TABLE `gdn_log` DISABLE KEYS */;
INSERT INTO `gdn_log` VALUES (1,'Edit','Configuration',NULL,NULL,NULL,'2014-08-15 18:26:56',NULL,1,'2014-08-15 18:26:56','127.0.0.1','',NULL,NULL,NULL,'a:1:{s:4:\"_New\";a:7:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}}}',NULL),(2,'Edit','Configuration',NULL,NULL,NULL,'2014-08-15 18:26:59',NULL,1,'2014-08-15 18:26:59','127.0.0.1','',NULL,NULL,NULL,'a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}}}',NULL),(3,'Edit','Configuration',NULL,NULL,NULL,'2014-08-15 18:33:26',NULL,1,'2014-08-15 18:33:26','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:5:\"mixed\";}}}}',NULL),(4,'Edit','Configuration',NULL,NULL,NULL,'2014-08-15 18:35:07',NULL,1,'2014-08-15 18:35:07','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:11:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:5:\"mixed\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:12:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:5:\"mixed\";}}}}',NULL),(5,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 01:26:28',NULL,1,'2014-08-16 01:26:28','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:12:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:5:\"mixed\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:12:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:5:\"mixed\";}}}}',NULL),(6,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 02:37:52',NULL,1,'2014-08-16 02:37:52','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:12:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:5:\"mixed\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:12:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}}}',NULL),(7,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 02:38:02',NULL,1,'2014-08-16 02:38:02','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:12:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";s:5:\"Embed\";a:1:{s:5:\"Allow\";b:1;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}}}',NULL),(8,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 09:07:52',NULL,1,'2014-08-16 09:07:52','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";s:5:\"Embed\";a:1:{s:5:\"Allow\";b:1;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}}}',NULL),(9,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 09:08:16',NULL,1,'2014-08-16 09:08:16','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}}}',NULL),(10,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 13:11:37',NULL,1,'2014-08-16 13:11:37','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}}}',NULL),(11,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 13:20:02',NULL,1,'2014-08-16 13:20:02','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:1:{s:6:\"Layout\";s:6:\"modern\";}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:6:\"modern\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(12,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 13:22:47',NULL,1,'2014-08-16 13:22:47','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:11:\"discussions\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:6:\"modern\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:6:\"modern\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(13,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 13:35:23',NULL,1,'2014-08-16 13:35:23','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:13:\"EmbedFriendly\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(14,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 13:35:26',NULL,1,'2014-08-16 13:35:26','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:7:\"default\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(15,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 13:53:48',NULL,1,'2014-08-16 13:53:48','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(16,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 14:37:55',NULL,1,'2014-08-16 14:37:55','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(17,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 14:53:46',NULL,1,'2014-08-16 14:53:46','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:5:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(18,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:25:16',NULL,1,'2014-08-16 21:25:16','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:5:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:1:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(19,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:25:28',NULL,1,'2014-08-16 21:25:28','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:1:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:13:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:1:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(20,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:25:28',NULL,1,'2014-08-16 21:25:28','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:1:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(21,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:25:56',NULL,1,'2014-08-16 21:25:56','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(22,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:26:02',NULL,1,'2014-08-16 21:26:02','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:4:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(23,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:26:10',NULL,1,'2014-08-16 21:26:10','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:4:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;}s:6:\"Garden\";a:14:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:4:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(24,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:26:10',NULL,1,'2014-08-16 21:26:10','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:4:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:5:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(25,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:26:13',NULL,1,'2014-08-16 21:26:13','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:5:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(26,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:26:56',NULL,1,'2014-08-16 21:26:56','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(27,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:30:59',NULL,1,'2014-08-16 21:30:59','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:15:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(28,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:36:50',NULL,1,'2014-08-16 21:36:50','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:16:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}}}',NULL),(29,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:37:24',NULL,1,'2014-08-16 21:37:24','127.0.0.1','',NULL,NULL,NULL,'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}}}',NULL),(30,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:37:24',NULL,1,'2014-08-16 21:37:24','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}}}',NULL),(31,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:39:37',NULL,1,'2014-08-16 21:39:37','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:6:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:7:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}}}',NULL),(32,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:39:42',NULL,1,'2014-08-16 21:39:42','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:7:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:8:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}}}',NULL),(33,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 21:39:47',NULL,1,'2014-08-16 21:39:47','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:8:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:9:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;s:9:\"OnlineNow\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}}}',NULL),(34,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 22:08:02',NULL,1,'2014-08-16 22:08:02','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:9:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;s:9:\"OnlineNow\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:9:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;s:9:\"OnlineNow\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:2:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}s:9:\"OnlineNow\";a:3:{s:9:\"Frequency\";s:3:\"180\";s:8:\"Location\";a:1:{s:4:\"Show\";s:10:\"discussion\";}s:4:\"Hide\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}}}',NULL),(35,'Edit','Configuration',NULL,NULL,NULL,'2014-08-16 22:36:54',NULL,1,'2014-08-16 22:36:54','127.0.0.1','',NULL,NULL,NULL,'a:10:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:9:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;s:9:\"OnlineNow\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:2:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}s:9:\"OnlineNow\";a:3:{s:9:\"Frequency\";s:3:\"180\";s:8:\"Location\";a:1:{s:4:\"Show\";s:10:\"discussion\";}s:4:\"Hide\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:1:{s:7:\"Version\";s:5:\"0.6.1\";}s:4:\"_New\";a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.1.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:9:\"127.0.0.1\";s:4:\"User\";s:10:\"VanilAdmin\";s:8:\"Password\";s:15:\"R3wy1gqdEvpO6TI\";}s:19:\"EnabledApplications\";a:3:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";s:4:\"Yaga\";s:4:\"yaga\";}s:14:\"EnabledPlugins\";a:9:{s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:8:\"cleditor\";b:1;s:15:\"ProfileExtender\";b:1;s:9:\"AllViewed\";b:1;s:7:\"Emotify\";b:1;s:8:\"Flagging\";b:1;s:13:\"DefaultAvatar\";b:1;s:8:\"Cleanser\";b:1;s:9:\"OnlineNow\";b:1;}s:6:\"Garden\";a:18:{s:5:\"Title\";s:17:\"Healing Over Time\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:10:\"H81JLTDTKH\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:7:{s:12:\"ConfirmEmail\";s:1:\"1\";s:6:\"Method\";s:7:\"Captcha\";s:16:\"ConfirmEmailRole\";s:1:\"3\";s:17:\"CaptchaPrivateKey\";s:40:\"6LebtfgSAAAAALn9usOAZejp1u3dSbU0E9NneE1y\";s:16:\"CaptchaPublicKey\";s:40:\"6LebtfgSAAAAAAORfIgsoMTO3OePbwQbsGumHItn\";s:16:\"InviteExpiration\";s:7:\"-1 week\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:1:{s:11:\"SupportName\";s:17:\"Healing Over Time\";}s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.1.1\";s:11:\"RewriteUrls\";b:1;s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:1;s:12:\"SystemUserID\";s:1:\"2\";s:9:\"Installed\";b:1;s:5:\"Theme\";s:8:\"EmbedHOT\";s:5:\"Embed\";a:2:{s:5:\"Allow\";b:1;s:9:\"RemoteUrl\";s:27:\"http://localhost/community/\";}s:4:\"Html\";a:1:{s:10:\"SafeStyles\";b:0;}s:6:\"Format\";a:1:{s:8:\"Hashtags\";b:0;}s:9:\"Analytics\";a:1:{s:10:\"AllowLocal\";b:1;}s:14:\"InstallationID\";s:22:\"2971-411CE305-ADB18402\";s:18:\"InstallationSecret\";s:40:\"66448b79355ece25749c490c720c7541d3e98c04\";}s:7:\"Plugins\";a:2:{s:14:\"GettingStarted\";a:6:{s:9:\"Dashboard\";s:1:\"1\";s:10:\"Categories\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";s:10:\"Discussion\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}s:9:\"OnlineNow\";a:3:{s:9:\"Frequency\";s:3:\"180\";s:8:\"Location\";a:1:{s:4:\"Show\";s:10:\"discussion\";}s:4:\"Hide\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";a:2:{i:0;s:10:\"categories\";i:1;s:8:\"Internal\";}}s:7:\"Vanilla\";a:3:{s:7:\"Version\";s:5:\"2.1.1\";s:11:\"Discussions\";a:1:{s:6:\"Layout\";s:5:\"table\";}s:10:\"Categories\";a:4:{s:6:\"Layout\";s:5:\"mixed\";s:15:\"MaxDisplayDepth\";s:1:\"3\";s:10:\"DoHeadings\";b:0;s:10:\"HideModule\";b:0;}}s:4:\"Yaga\";a:5:{s:7:\"Version\";s:5:\"0.6.1\";s:9:\"Reactions\";a:1:{s:7:\"Enabled\";s:0:\"\";}s:6:\"Badges\";a:1:{s:7:\"Enabled\";s:1:\"1\";}s:5:\"Ranks\";a:1:{s:7:\"Enabled\";s:1:\"1\";}s:11:\"LeaderBoard\";a:2:{s:7:\"Enabled\";s:0:\"\";s:5:\"Limit\";s:0:\"\";}}}}',NULL);
/*!40000 ALTER TABLE `gdn_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_media`
--

DROP TABLE IF EXISTS `gdn_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_media` (
  `MediaID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignID` int(11) DEFAULT NULL,
  `ForeignTable` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImageWidth` smallint(5) unsigned DEFAULT NULL,
  `ImageHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbWidth` smallint(5) unsigned DEFAULT NULL,
  `ThumbHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MediaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_media`
--

LOCK TABLES `gdn_media` WRITE;
/*!40000 ALTER TABLE `gdn_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_message`
--

DROP TABLE IF EXISTS `gdn_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllowDismiss` tinyint(4) NOT NULL DEFAULT '1',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssetTarget` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CssClass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_message`
--

LOCK TABLES `gdn_message` WRITE;
/*!40000 ALTER TABLE `gdn_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_onlinenow`
--

DROP TABLE IF EXISTS `gdn_onlinenow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_onlinenow` (
  `UserID` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Invisible` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_onlinenow`
--

LOCK TABLES `gdn_onlinenow` WRITE;
/*!40000 ALTER TABLE `gdn_onlinenow` DISABLE KEYS */;
INSERT INTO `gdn_onlinenow` VALUES (1,'2014-09-03 20:59:28',NULL,0);
/*!40000 ALTER TABLE `gdn_onlinenow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_permission`
--

DROP TABLE IF EXISTS `gdn_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_permission` (
  `PermissionID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  `JunctionTable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionColumn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionID` int(11) DEFAULT NULL,
  `Garden.Email.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Messages.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.SignIn.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Curation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.PersonalInfo.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.AdvancedNotifications.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Conversations.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Approval.Require` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Me` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Close` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Flagging.Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Reactions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Reactions.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Reactions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Reactions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Badges.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Badges.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Badges.View` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Ranks.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Yaga.Ranks.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Cleanser.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.OnlineNow.ViewHidden` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.OnlineNow.Manage` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PermissionID`),
  KEY `FK_Permission_RoleID` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_permission`
--

LOCK TABLES `gdn_permission` WRITE;
/*!40000 ALTER TABLE `gdn_permission` DISABLE KEYS */;
INSERT INTO `gdn_permission` VALUES (1,0,NULL,NULL,NULL,3,2,2,2,3,2,2,2,2,2,3,3,3,2,2,2,2,2,3,2,3,0,0,0,0,0,0,0,0,0,0,2,3,2,3,2,2,2,3,2,2,2,2,2),(2,2,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0),(3,3,NULL,NULL,NULL,1,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0),(4,4,NULL,NULL,NULL,1,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0),(5,8,NULL,NULL,NULL,1,0,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0),(6,32,NULL,NULL,NULL,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,1,0,0,0,0,0),(7,16,NULL,NULL,NULL,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,1,0,0,0,0,0),(8,0,'Category','PermissionCategoryID',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,2,2,2,2,2,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,2,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,4,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,8,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,32,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(13,16,'Category','PermissionCategoryID',-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,32,'Category','PermissionCategoryID',8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,16,'Category','PermissionCategoryID',8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `gdn_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_rank`
--

DROP TABLE IF EXISTS `gdn_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_rank` (
  `RankID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `PointReq` int(11) NOT NULL DEFAULT '0',
  `PostReq` int(11) NOT NULL DEFAULT '0',
  `AgeReq` int(11) NOT NULL DEFAULT '0',
  `Perks` text COLLATE utf8_unicode_ci,
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RankID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_rank`
--

LOCK TABLES `gdn_rank` WRITE;
/*!40000 ALTER TABLE `gdn_rank` DISABLE KEYS */;
INSERT INTO `gdn_rank` VALUES (1,'Entry Level','You are in the minor leagues. I suggest you work on your content to progress.',1,1,0,0,NULL,0),(2,'Big Time','You have hit the big time! Keep up the good work.',2,100,0,0,NULL,0);
/*!40000 ALTER TABLE `gdn_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_reaction`
--

DROP TABLE IF EXISTS `gdn_reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_reaction` (
  `ReactionID` int(11) NOT NULL AUTO_INCREMENT,
  `InsertUserID` int(11) NOT NULL,
  `ActionID` int(11) NOT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ParentType` enum('discussion','comment','activity') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentAuthorID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`ReactionID`),
  KEY `IX_Reaction_1` (`InsertUserID`),
  KEY `IX_Reaction_ActionID` (`ActionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_reaction`
--

LOCK TABLES `gdn_reaction` WRITE;
/*!40000 ALTER TABLE `gdn_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_regarding`
--

DROP TABLE IF EXISTS `gdn_regarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_regarding` (
  `RegardingID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `OriginalContent` text COLLATE utf8_unicode_ci,
  `ParentType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `Reports` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegardingID`),
  KEY `FK_Regarding_Type` (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_regarding`
--

LOCK TABLES `gdn_regarding` WRITE;
/*!40000 ALTER TABLE `gdn_regarding` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_regarding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_role`
--

DROP TABLE IF EXISTS `gdn_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Deletable` tinyint(4) NOT NULL DEFAULT '1',
  `CanSession` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_role`
--

LOCK TABLES `gdn_role` WRITE;
/*!40000 ALTER TABLE `gdn_role` DISABLE KEYS */;
INSERT INTO `gdn_role` VALUES (2,'Guest','Guests can only view content. Anyone browsing the site who is not signed in is considered to be a \"Guest\".',1,0,0),(3,'Unconfirmed','Users must confirm their emails before becoming full members. They get assigned to this role.',2,1,1),(4,'Applicant','Users who have applied for membership, but have not yet been accepted. They have the same permissions as guests.',3,0,1),(8,'Member','Members can participate in discussions.',4,1,1),(16,'Administrator','Administrators have permission to do anything.',6,1,1),(32,'Moderator','Moderators have permission to edit most content.',5,1,1);
/*!40000 ALTER TABLE `gdn_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_session`
--

DROP TABLE IF EXISTS `gdn_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_session` (
  `SessionID` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `TransientKey` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_session`
--

LOCK TABLES `gdn_session` WRITE;
/*!40000 ALTER TABLE `gdn_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_spammer`
--

DROP TABLE IF EXISTS `gdn_spammer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_spammer` (
  `UserID` int(11) NOT NULL,
  `CountSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CountDeletedSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_spammer`
--

LOCK TABLES `gdn_spammer` WRITE;
/*!40000 ALTER TABLE `gdn_spammer` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_spammer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_tag`
--

DROP TABLE IF EXISTS `gdn_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_tag` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `CategoryID` int(11) NOT NULL DEFAULT '-1',
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `UX_Tag` (`Name`,`CategoryID`),
  KEY `IX_Tag_Type` (`Type`),
  KEY `FK_Tag_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_tag`
--

LOCK TABLES `gdn_tag` WRITE;
/*!40000 ALTER TABLE `gdn_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_tagdiscussion`
--

DROP TABLE IF EXISTS `gdn_tagdiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_tagdiscussion` (
  `TagID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  PRIMARY KEY (`TagID`,`DiscussionID`),
  KEY `IX_TagDiscussion_CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_tagdiscussion`
--

LOCK TABLES `gdn_tagdiscussion` WRITE;
/*!40000 ALTER TABLE `gdn_tagdiscussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_tagdiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_user`
--

DROP TABLE IF EXISTS `gdn_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varbinary(100) NOT NULL,
  `HashMethod` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8_unicode_ci,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ShowEmail` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` enum('u','m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'u',
  `CountVisits` int(11) NOT NULL DEFAULT '0',
  `CountInvitations` int(11) NOT NULL DEFAULT '0',
  `CountNotifications` int(11) DEFAULT NULL,
  `InviteUserID` int(11) DEFAULT NULL,
  `DiscoveryText` text COLLATE utf8_unicode_ci,
  `Preferences` text COLLATE utf8_unicode_ci,
  `Permissions` text COLLATE utf8_unicode_ci,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateSetInvitations` datetime DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `DateFirstVisit` datetime DEFAULT NULL,
  `DateLastActive` datetime DEFAULT NULL,
  `LastIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllIPAddresses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HourOffset` int(11) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT '0',
  `Verified` tinyint(4) NOT NULL DEFAULT '0',
  `Banned` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `Points` int(11) NOT NULL DEFAULT '0',
  `CountUnreadConversations` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) DEFAULT NULL,
  `CountUnreadDiscussions` int(11) DEFAULT NULL,
  `CountComments` int(11) DEFAULT NULL,
  `CountDrafts` int(11) DEFAULT NULL,
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountBadges` int(11) NOT NULL DEFAULT '0',
  `RankID` int(11) DEFAULT NULL,
  `RankProgression` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UserID`),
  KEY `FK_User_Name` (`Name`),
  KEY `IX_User_Email` (`Email`),
  KEY `IX_User_DateLastActive` (`DateLastActive`),
  KEY `IX_User_DateInserted` (`DateInserted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_user`
--

LOCK TABLES `gdn_user` WRITE;
/*!40000 ALTER TABLE `gdn_user` DISABLE KEYS */;
INSERT INTO `gdn_user` VALUES (1,'HOTMatronAdmin','$P$Bule4r7fIX7hyzeulXtpRLTIc4uSDY1','Vanilla',NULL,NULL,NULL,'Here\'s a status message','management@healingovertime.org',0,'u',10,0,NULL,NULL,NULL,'a:3:{s:16:\"PreviewThemeName\";s:0:\"\";s:18:\"PreviewThemeFolder\";s:0:\"\";s:17:\"ShowAllCategories\";b:0;}','','a:1:{s:12:\"TransientKey\";s:12:\"WNM8CXJ2FNM3\";}',NULL,'1975-09-16 00:00:00','2014-08-15 18:26:54','2014-09-03 21:10:25','127.0.0.1','127.0.0.1','2014-08-15 18:26:54','127.0.0.1','2014-08-16 14:54:05','127.0.0.1',0,NULL,1,0,0,0,0,NULL,1,NULL,0,NULL,NULL,0,NULL,1),(2,'System','77EU5283JK41K3WVEB3W','Random','http://localhost/forum/applications/dashboard/design/images/usericon.png',NULL,NULL,NULL,'system@domain.com',0,'u',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-15 18:26:55',NULL,NULL,NULL,0,NULL,2,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `gdn_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthentication`
--

DROP TABLE IF EXISTS `gdn_userauthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthentication` (
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ForeignUserKey`,`ProviderKey`),
  KEY `FK_UserAuthentication_UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthentication`
--

LOCK TABLES `gdn_userauthentication` WRITE;
/*!40000 ALTER TABLE `gdn_userauthentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthenticationnonce`
--

DROP TABLE IF EXISTS `gdn_userauthenticationnonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthenticationnonce` (
  `Nonce` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthenticationnonce`
--

LOCK TABLES `gdn_userauthenticationnonce` WRITE;
/*!40000 ALTER TABLE `gdn_userauthenticationnonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthenticationnonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthenticationprovider`
--

DROP TABLE IF EXISTS `gdn_userauthenticationprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthenticationprovider` (
  `AuthenticationKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticationSchemeAlias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssociationSecret` text COLLATE utf8_unicode_ci,
  `AssociationHashMethod` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AuthenticateUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignInUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignOutUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProfileUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AuthenticationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthenticationprovider`
--

LOCK TABLES `gdn_userauthenticationprovider` WRITE;
/*!40000 ALTER TABLE `gdn_userauthenticationprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthenticationprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userauthenticationtoken`
--

DROP TABLE IF EXISTS `gdn_userauthenticationtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userauthenticationtoken` (
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TokenSecret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TokenType` enum('request','access') COLLATE utf8_unicode_ci NOT NULL,
  `Authorized` tinyint(4) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Lifetime` int(11) NOT NULL,
  PRIMARY KEY (`Token`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userauthenticationtoken`
--

LOCK TABLES `gdn_userauthenticationtoken` WRITE;
/*!40000 ALTER TABLE `gdn_userauthenticationtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userauthenticationtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usercategory`
--

DROP TABLE IF EXISTS `gdn_usercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usercategory` (
  `UserID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateMarkedRead` datetime DEFAULT NULL,
  `Unfollow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usercategory`
--

LOCK TABLES `gdn_usercategory` WRITE;
/*!40000 ALTER TABLE `gdn_usercategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usercategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usercomment`
--

DROP TABLE IF EXISTS `gdn_usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usercomment` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usercomment`
--

LOCK TABLES `gdn_usercomment` WRITE;
/*!40000 ALTER TABLE `gdn_usercomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userconversation`
--

DROP TABLE IF EXISTS `gdn_userconversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userconversation` (
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `CountReadMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  `DateCleared` datetime DEFAULT NULL,
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `DateConversationUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`ConversationID`),
  KEY `IX_UserConversation_Inbox` (`UserID`,`Deleted`,`DateConversationUpdated`),
  KEY `FK_UserConversation_ConversationID` (`ConversationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userconversation`
--

LOCK TABLES `gdn_userconversation` WRITE;
/*!40000 ALTER TABLE `gdn_userconversation` DISABLE KEYS */;
INSERT INTO `gdn_userconversation` VALUES (1,1,0,1,NULL,NULL,0,0,'2014-08-15 18:26:55');
/*!40000 ALTER TABLE `gdn_userconversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userdiscussion`
--

DROP TABLE IF EXISTS `gdn_userdiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userdiscussion` (
  `UserID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateLastViewed` datetime DEFAULT NULL,
  `Dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`DiscussionID`),
  KEY `FK_UserDiscussion_DiscussionID` (`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userdiscussion`
--

LOCK TABLES `gdn_userdiscussion` WRITE;
/*!40000 ALTER TABLE `gdn_userdiscussion` DISABLE KEYS */;
INSERT INTO `gdn_userdiscussion` VALUES (1,2,NULL,0,'2014-08-16 14:37:55',0,0);
/*!40000 ALTER TABLE `gdn_userdiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usermerge`
--

DROP TABLE IF EXISTS `gdn_usermerge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usermerge` (
  `MergeID` int(11) NOT NULL AUTO_INCREMENT,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MergeID`),
  KEY `FK_UserMerge_OldUserID` (`OldUserID`),
  KEY `FK_UserMerge_NewUserID` (`NewUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usermerge`
--

LOCK TABLES `gdn_usermerge` WRITE;
/*!40000 ALTER TABLE `gdn_usermerge` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usermerge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usermergeitem`
--

DROP TABLE IF EXISTS `gdn_usermergeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usermergeitem` (
  `MergeID` int(11) NOT NULL,
  `Table` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Column` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `RecordID` int(11) NOT NULL,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  KEY `FK_UserMergeItem_MergeID` (`MergeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usermergeitem`
--

LOCK TABLES `gdn_usermergeitem` WRITE;
/*!40000 ALTER TABLE `gdn_usermergeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_usermergeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_usermeta`
--

DROP TABLE IF EXISTS `gdn_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_usermeta` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`UserID`,`Name`),
  KEY `IX_UserMeta_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_usermeta`
--

LOCK TABLES `gdn_usermeta` WRITE;
/*!40000 ALTER TABLE `gdn_usermeta` DISABLE KEYS */;
INSERT INTO `gdn_usermeta` VALUES (0,'Garden.Analytics.LastSentDate','20140818');
/*!40000 ALTER TABLE `gdn_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userpoints`
--

DROP TABLE IF EXISTS `gdn_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userpoints` (
  `SlotType` enum('d','w','m','y','a') COLLATE utf8_unicode_ci NOT NULL,
  `TimeSlot` datetime NOT NULL,
  `Source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Total',
  `UserID` int(11) NOT NULL,
  `Points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SlotType`,`TimeSlot`,`Source`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userpoints`
--

LOCK TABLES `gdn_userpoints` WRITE;
/*!40000 ALTER TABLE `gdn_userpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdn_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdn_userrole`
--

DROP TABLE IF EXISTS `gdn_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gdn_userrole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdn_userrole`
--

LOCK TABLES `gdn_userrole` WRITE;
/*!40000 ALTER TABLE `gdn_userrole` DISABLE KEYS */;
INSERT INTO `gdn_userrole` VALUES (0,2),(1,16);
/*!40000 ALTER TABLE `gdn_userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-06 18:28:09
