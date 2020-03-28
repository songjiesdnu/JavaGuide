-- MySQL dump 10.13  Distrib 5.7.28, for osx10.14 (x86_64)
--
-- Host: 10.41.57.35    Database: cmovie_info
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Current Database: `cmovie_info`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cmovie_info` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cmovie_info`;

--
-- Table structure for table `old_t_cinema_schedule`
--

DROP TABLE IF EXISTS `old_t_cinema_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_t_cinema_schedule` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cinema_id` int(11) unsigned NOT NULL COMMENT 'cinema_id',
  `movie_id` int(11) unsigned NOT NULL COMMENT 'movie_id',
  `play_time` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '播放时间',
  `end_time` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '结束时间',
  `third_infos` longtext NOT NULL COMMENT '第三方信息',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cinema_id` (`cinema_id`),
  KEY `movie_id` (`movie_id`),
  KEY `play_time` (`play_time`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=233053829 DEFAULT CHARSET=utf8 COMMENT='排期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_t_schedule_screening`
--

DROP TABLE IF EXISTS `old_t_schedule_screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_t_schedule_screening` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `third_id` varchar(30) NOT NULL COMMENT '第三方id',
  `third_from` varchar(30) NOT NULL COMMENT '第三方名称',
  `seq_no` varchar(128) NOT NULL COMMENT '场次号',
  `seat_total_number` int(11) NOT NULL COMMENT '座位总数',
  `seat_remaining_number` int(11) NOT NULL COMMENT '座位余数',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `third_id_third_from_seq_no` (`third_id`,`third_from`,`seq_no`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=1174842214 DEFAULT CHARSET=utf8 COMMENT='t_schedule_screening';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_album`
--

DROP TABLE IF EXISTS `t_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_album` (
  `album_id` bigint(22) NOT NULL COMMENT '专辑id',
  `source_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '专辑聚合源id',
  `album_name` varchar(128) NOT NULL DEFAULT '' COMMENT '专辑名称',
  `album_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专辑状态',
  `album_type` varchar(45) NOT NULL DEFAULT '' COMMENT '专辑类型',
  `content_type` int(11) NOT NULL DEFAULT '-1' COMMENT '子类型',
  `category_id` int(11) NOT NULL DEFAULT '-1' COMMENT '专辑所属类别',
  `is_purchase` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专辑是否需要付费',
  `album_desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '专辑描述',
  `focus` varchar(45) NOT NULL DEFAULT '' COMMENT '专辑关键词',
  `director` varchar(64) NOT NULL DEFAULT '' COMMENT '导演',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '专辑图片地址',
  `local_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '专辑转存图片地址',
  `image_horizontal` varchar(128) NOT NULL DEFAULT '' COMMENT '专辑横图',
  `image_vertical` varchar(128) NOT NULL DEFAULT '' COMMENT '专辑纵图',
  `local_image_horizontal` varchar(128) NOT NULL DEFAULT '' COMMENT '本地化专辑横图',
  `local_image_vertical` varchar(128) NOT NULL DEFAULT '' COMMENT '本地化专辑纵图',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '专辑评分',
  `play_count` bigint(22) NOT NULL DEFAULT '0' COMMENT '专辑播放数',
  `down` bigint(22) NOT NULL DEFAULT '0' COMMENT '专辑踩数',
  `up` bigint(22) NOT NULL DEFAULT '0' COMMENT '专辑顶数',
  `vote` bigint(22) NOT NULL DEFAULT '0' COMMENT '专辑投票数',
  `h5_url` varchar(255) NOT NULL DEFAULT '' COMMENT '专辑H5地址',
  `tv_ids` varchar(8192) NOT NULL DEFAULT '' COMMENT '专辑下视频id',
  `tag_ids` varchar(2048) NOT NULL DEFAULT '' COMMENT '专辑下标签id',
  `credits` varchar(2048) NOT NULL DEFAULT '' COMMENT '专辑演员',
  `credit_detail` varchar(2048) NOT NULL DEFAULT '' COMMENT '演员详情',
  `sets` int(11) NOT NULL DEFAULT '-1' COMMENT '专辑集数',
  `create_time` datetime NOT NULL COMMENT '专辑创建时间',
  `tv_year` varchar(25) NOT NULL DEFAULT '' COMMENT '专辑对应日期',
  `movie_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '专辑对应的影片id',
  `circle_id` bigint(11) NOT NULL DEFAULT '-1' COMMENT '对应饭圈id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '本条数据的更新时间',
  PRIMARY KEY (`album_id`),
  KEY `movie_id` (`movie_id`),
  KEY `update_time` (`update_time`),
  KEY `source_id` (`source_id`),
  KEY `union_album_status_content_type_source_id` (`album_status`,`content_type`,`source_id`),
  KEY `category_id_index` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_album_source`
--

DROP TABLE IF EXISTS `t_album_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_album_source` (
  `scode` bigint(22) NOT NULL COMMENT '来源id',
  `sname` varchar(128) NOT NULL DEFAULT '-1' COMMENT '来源名称',
  `company` varchar(128) NOT NULL DEFAULT '' COMMENT '来源制作方',
  `sdesc` varchar(1024) NOT NULL DEFAULT '' COMMENT '来源描述',
  `play_time` varchar(128) NOT NULL DEFAULT '' COMMENT '播放时间',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '类别id',
  `area` varchar(64) NOT NULL DEFAULT '0' COMMENT '地区',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT '类型',
  `emcee` varchar(1024) NOT NULL DEFAULT '' COMMENT '主持人',
  `credit_detail` varchar(2048) NOT NULL DEFAULT '' COMMENT '主持人详情',
  `image_horizontal` varchar(128) NOT NULL DEFAULT '' COMMENT '来源横图',
  `image_vertical` varchar(128) NOT NULL DEFAULT '' COMMENT '来源纵图',
  `local_image_horizontal` varchar(128) NOT NULL DEFAULT '' COMMENT '本地化来源横图',
  `local_image_vertical` varchar(128) NOT NULL DEFAULT '' COMMENT '本地化来源纵图',
  `circle_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '对应饭圈id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '本条数据的更新时间',
  PRIMARY KEY (`scode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑来源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_bd_xdb_to_rds`
--

DROP TABLE IF EXISTS `t_bd_xdb_to_rds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_xdb_to_rds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_box_predict_detail`
--

DROP TABLE IF EXISTS `t_box_predict_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_box_predict_detail` (
  `movie_id` bigint(20) unsigned NOT NULL COMMENT '影片id',
  `date` date NOT NULL COMMENT '日期',
  `show_rate` float NOT NULL COMMENT '排片率',
  `predict_box` bigint(20) NOT NULL DEFAULT '0' COMMENT '预测票房',
  `real_box` bigint(20) NOT NULL DEFAULT '0' COMMENT '实时票房',
  `difference` float NOT NULL DEFAULT '0' COMMENT '预测误差',
  `movie_name` varchar(256) NOT NULL DEFAULT '' COMMENT '影片名',
  `release_date` date NOT NULL COMMENT '上映日期',
  `day_num` int(11) NOT NULL DEFAULT '0' COMMENT '上映天数',
  `movie_total_box` bigint(20) NOT NULL DEFAULT '0' COMMENT '总票房',
  PRIMARY KEY (`movie_id`,`date`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='影片票房预测详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_box_predict_summary`
--

DROP TABLE IF EXISTS `t_box_predict_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_box_predict_summary` (
  `date` date NOT NULL COMMENT '日期',
  `predict_box` bigint(20) NOT NULL DEFAULT '0' COMMENT '预测票房',
  `real_box` bigint(20) NOT NULL DEFAULT '0' COMMENT '实时票房',
  `box_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '票房更新时间',
  `predict_box_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预测数更新时间',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日票房预测';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cinema_comment`
--

DROP TABLE IF EXISTS `t_cinema_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cinema_comment` (
  `id` bigint(22) NOT NULL COMMENT '评论id',
  `cinema_id` bigint(22) unsigned NOT NULL COMMENT '影片ID',
  `comment` varchar(5000) NOT NULL DEFAULT ' ' COMMENT '评论内容',
  `comment_from` varchar(36) NOT NULL DEFAULT ' ' COMMENT '评论来源',
  `user` varchar(24) NOT NULL DEFAULT ' ' COMMENT '评论人',
  `comment_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论发表时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论入库时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '评论状态,1:正常，0：删除',
  PRIMARY KEY (`id`),
  KEY `cinema_id_comment_time_status` (`cinema_id`,`status`,`comment_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='影院评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cinema_groupon`
--

DROP TABLE IF EXISTS `t_cinema_groupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cinema_groupon` (
  `cinema_id` bigint(20) NOT NULL COMMENT '主键id',
  `groupon_infos` varchar(20480) COLLATE utf8_bin NOT NULL DEFAULT '''''' COMMENT '团购信息',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`cinema_id`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='cinema_group_on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cinema_info`
--

DROP TABLE IF EXISTS `t_cinema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cinema_info` (
  `cinema_id` bigint(22) unsigned NOT NULL COMMENT '影院id',
  `bid` varchar(64) NOT NULL DEFAULT ' ' COMMENT '影院bid',
  `bid_encode` varchar(64) NOT NULL DEFAULT ' ' COMMENT '影院bid_encode',
  `name` varchar(128) NOT NULL DEFAULT ' ' COMMENT '影院名称',
  `address` varchar(256) NOT NULL DEFAULT ' ' COMMENT '影院地址',
  `alias` varchar(1024) NOT NULL DEFAULT ' ' COMMENT '影院别名',
  `postcode` varchar(11) NOT NULL DEFAULT ' ' COMMENT '影院邮编',
  `phone` varchar(64) NOT NULL DEFAULT ' ' COMMENT '影院电话号码',
  `aoi` varchar(256) NOT NULL DEFAULT ' ' COMMENT '影院商圈',
  `city` varchar(40) NOT NULL DEFAULT ' ' COMMENT '城市名',
  `city_id` int(11) NOT NULL COMMENT '城市id',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '地域id',
  `area` varchar(40) NOT NULL DEFAULT ' ' COMMENT '地域名',
  `longitude` varchar(32) NOT NULL DEFAULT ' ' COMMENT '经度',
  `latitude` varchar(32) NOT NULL DEFAULT ' ' COMMENT '维度',
  `point_x` varchar(32) NOT NULL DEFAULT ' ' COMMENT '墨卡托坐标x',
  `point_y` varchar(32) NOT NULL DEFAULT ' ' COMMENT '墨卡托坐标y',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '评分',
  `brand_id` varchar(11) NOT NULL DEFAULT '0' COMMENT '品牌ID,和map的一致',
  `brand_name` varchar(30) NOT NULL DEFAULT '''''' COMMENT '品牌名称',
  `shop_begin` varchar(20) NOT NULL DEFAULT '''''' COMMENT '影院营业开始时间',
  `shop_end` varchar(20) NOT NULL DEFAULT '''''' COMMENT '影院营业结束时间',
  `introduction` varchar(2048) NOT NULL DEFAULT '''''' COMMENT '影院介绍',
  `cinema_logo` varchar(256) NOT NULL DEFAULT '''''' COMMENT '品牌图片url',
  `food_licence` varchar(512) NOT NULL DEFAULT '' COMMENT '食品资质图片',
  `cinema_image` varchar(5120) NOT NULL DEFAULT '''''' COMMENT '影院图片url',
  `is_real_d` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持reald',
  `is_imax` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持imax',
  `is_bigscreen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持bigscreen',
  `is_3d` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持3d',
  `is_double_3d` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持double 3d',
  `is_4d` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持4d',
  `is_4dx` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持4dx',
  `is_dolby` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持dolby',
  `is_4k` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持4k',
  `is_cinelab_jiguangjishu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持Cinelab激光技术',
  `is_cinelab_jiguangjumu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持Cinelab激光技术',
  `is_free_park` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持免费停车',
  `is_loveseat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持情侣座',
  `is_groupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持团购',
  `is_support_pos` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否支持pos机',
  `is_wifi` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否支持wifi',
  `support_glasses` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支持3D眼镜的状态',
  `province` varchar(50) NOT NULL DEFAULT '' COMMENT '省',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `service` varchar(2048) NOT NULL DEFAULT '''''' COMMENT '服务情况',
  `effect` varchar(50) NOT NULL DEFAULT '''''' COMMENT '视觉效果',
  `screen` varchar(256) NOT NULL DEFAULT '''''' COMMENT '屏幕效果',
  `subway` varchar(512) NOT NULL DEFAULT '''''' COMMENT '地铁情况',
  `place` varchar(2048) NOT NULL DEFAULT '''''' COMMENT '周边情况',
  `bus` varchar(1024) NOT NULL DEFAULT '''''' COMMENT '公交情况',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0：下线，1：正常',
  `card_template_id` varchar(512) NOT NULL DEFAULT '''''' COMMENT '会员卡id，逗号分隔',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '地图poi使用uid',
  `guid` varchar(50) NOT NULL DEFAULT '' COMMENT '地图poi使用guid',
  `is_china_bigscreen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持中国巨幕',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持vip',
  PRIMARY KEY (`cinema_id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='影院信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cinema_schedule`
--

DROP TABLE IF EXISTS `t_cinema_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cinema_schedule` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cinema_id` int(11) unsigned NOT NULL COMMENT 'cinema_id',
  `movie_id` int(11) unsigned NOT NULL COMMENT 'movie_id',
  `play_time` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '播放时间',
  `end_time` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT '结束时间',
  `third_infos` longtext NOT NULL COMMENT '第三方信息',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cinema_id` (`cinema_id`),
  KEY `movie_id` (`movie_id`),
  KEY `play_time` (`play_time`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=522815307 DEFAULT CHARSET=utf8 COMMENT='排期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cinema_srcorder`
--

DROP TABLE IF EXISTS `t_cinema_srcorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cinema_srcorder` (
  `cinema_id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `src_order` varchar(1024) NOT NULL DEFAULT '''''' COMMENT 'src_order',
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='t_cinema_srcorder';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_good_code`
--

DROP TABLE IF EXISTS `t_good_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_good_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deal_id` bigint(20) NOT NULL COMMENT '团单id',
  `memcard_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员卡模板id',
  `code` varchar(256) NOT NULL DEFAULT '''' COMMENT '券码',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0 未用，1 已用',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `trans_id` varchar(256) NOT NULL DEFAULT '''' COMMENT '交易id',
  PRIMARY KEY (`id`),
  KEY `deal_id_status` (`deal_id`,`status`),
  KEY `deal_id_memcard_id_status` (`deal_id`,`memcard_id`,`status`),
  KEY `trans_id` (`trans_id`(255))
) ENGINE=InnoDB AUTO_INCREMENT=1035421 DEFAULT CHARSET=utf8 COMMENT='t_good_code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_good_info`
--

DROP TABLE IF EXISTS `t_good_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_good_info` (
  `deal_id` bigint(20) NOT NULL COMMENT '团id',
  `deal_info` varchar(10240) NOT NULL COMMENT '团单信息',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='t_good_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_hengdian_voucher`
--

DROP TABLE IF EXISTS `t_hengdian_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hengdian_voucher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `voucher_no` varchar(32) NOT NULL DEFAULT '' COMMENT '券编号',
  `voucher_code` varchar(64) NOT NULL DEFAULT '' COMMENT '券码',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：0 停用, 1 未用, 2 已用',
  `assigned_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '派发的uid',
  `assigned_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '派发时间',
  `source` varchar(32) NOT NULL DEFAULT '' COMMENT '请求来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='横店线下码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_merchant`
--

DROP TABLE IF EXISTS `t_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_merchant` (
  `merchant_id` bigint(20) NOT NULL COMMENT '商家id',
  `type` tinyint(4) NOT NULL COMMENT '商家类型，0 影院，1 tp',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data` mediumtext NOT NULL COMMENT '数据',
  PRIMARY KEY (`merchant_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='t_merchant';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_movie_actor`
--

DROP TABLE IF EXISTS `t_movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_movie_actor` (
  `actorId` bigint(22) NOT NULL COMMENT '影人id',
  `fanCircleId` int(11) NOT NULL COMMENT '饭圈ID',
  `name` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '影人名字',
  `actorInfo` longtext COLLATE utf8_bin NOT NULL COMMENT '影人信息',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`actorId`),
  KEY `updateTime` (`updateTime`),
  KEY `idx_fanCircleId` (`fanCircleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='影人信息详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_movie_comment`
--

DROP TABLE IF EXISTS `t_movie_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_movie_comment` (
  `id` bigint(22) NOT NULL COMMENT '评论id',
  `movie_id` bigint(22) unsigned NOT NULL COMMENT '影片ID',
  `comment` varchar(5000) NOT NULL DEFAULT ' ' COMMENT '评论内容',
  `comment_from` varchar(36) NOT NULL DEFAULT ' ' COMMENT '评论来源',
  `user` varchar(24) NOT NULL DEFAULT ' ' COMMENT '评论人',
  `comment_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论发表时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论入库时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '评论状态,1:正常，0：删除',
  PRIMARY KEY (`id`),
  KEY `movie_id_comment_time_status` (`movie_id`,`status`,`comment_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1 COMMENT='影片评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_movie_dispatch_content`
--

DROP TABLE IF EXISTS `t_movie_dispatch_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_movie_dispatch_content` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '影片导流内容c端id',
  `content_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '影片导流内容b端id',
  `movie_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '影片id',
  `template_type` int(11) NOT NULL DEFAULT '-1' COMMENT '模板类型',
  `time_line` bigint(22) NOT NULL DEFAULT '-1' COMMENT '时间轴的时间戳',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '发帖详情记录',
  `link` varchar(1024) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `photos` varchar(2048) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `question` varchar(64) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `answer` varchar(256) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `news_style` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `news_content` varchar(1024) NOT NULL DEFAULT '' COMMENT '新闻内容',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否被删除',
  `data_update_time` bigint(22) NOT NULL DEFAULT '-1' COMMENT 'b端更新时间',
  `list_index` int(11) NOT NULL DEFAULT '-1' COMMENT '导流内容的顺序排位',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_id` (`content_id`),
  KEY `movie_id` (`movie_id`),
  KEY `is_hide` (`is_hide`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='影片导流内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_movie_info`
--

DROP TABLE IF EXISTS `t_movie_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_movie_info` (
  `movie_id` bigint(22) unsigned NOT NULL COMMENT '主键id',
  `movie_name` varchar(100) NOT NULL DEFAULT ' ' COMMENT '片名',
  `origin_name` varchar(100) NOT NULL DEFAULT ' ' COMMENT '原名',
  `aliases` varchar(512) NOT NULL DEFAULT ' ' COMMENT '别名',
  `summary` varchar(100) NOT NULL DEFAULT ' ' COMMENT '一句话描述',
  `director` varchar(64) NOT NULL DEFAULT ' ' COMMENT '导演',
  `actors` text NOT NULL COMMENT '演员',
  `company` varchar(256) NOT NULL DEFAULT ' ' COMMENT '发行公司',
  `horizontal_image` varchar(512) NOT NULL DEFAULT '' COMMENT '百度卡片url',
  `distributors` varchar(1024) NOT NULL DEFAULT ' ' COMMENT '发行公司',
  `prod_companies` varchar(1024) NOT NULL DEFAULT '' COMMENT '制片公司',
  `type` varchar(32) NOT NULL DEFAULT ' ' COMMENT '1:剧情 2:惊悚 3:科幻 4:魔幻 5:动作 6:爱情...',
  `screenwriter` varchar(512) NOT NULL DEFAULT ' ' COMMENT '编剧',
  `version` varchar(32) NOT NULL DEFAULT ' ' COMMENT '1:2D 2:IMAX 3:3D 4:蓝光...',
  `country` varchar(32) NOT NULL DEFAULT ' ' COMMENT '1:大陆 2:港台 3:英国 4:美国....',
  `language` varchar(24) NOT NULL DEFAULT ' ' COMMENT '1:中文 2:英文 3:韩文',
  `release_date` bigint(20) NOT NULL DEFAULT '0' COMMENT '上映日期,unixtime',
  `running_time` int(11) NOT NULL COMMENT '片长，分钟',
  `description` varchar(2000) NOT NULL DEFAULT ' ' COMMENT '剧情介绍 限制500字',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '0-100分',
  `trailer_url` longtext NOT NULL COMMENT '影片多种视频',
  `titbits_url` text NOT NULL COMMENT '花絮字段',
  `works_id` int(10) NOT NULL DEFAULT '0' COMMENT '来自于百度视频的唯一ID：works_id',
  `stills_url` varchar(10240) NOT NULL COMMENT '剧照',
  `poster_urls` varchar(2048) NOT NULL DEFAULT ' ' COMMENT '海报,分尺寸大中小',
  `followers` int(11) NOT NULL DEFAULT '0' COMMENT '感兴趣人数',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0：下线，1：正常',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `post_gray` varchar(1024) NOT NULL DEFAULT '''''' COMMENT '海报灰度图',
  `extraInfo` longtext NOT NULL COMMENT '影片扩展信息',
  `fan_circle_id` bigint(22) NOT NULL DEFAULT '0' COMMENT '关联饭圈id',
  PRIMARY KEY (`movie_id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1 COMMENT='影片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_movie_recommend`
--

DROP TABLE IF EXISTS `t_movie_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_movie_recommend` (
  `movie_id` bigint(22) NOT NULL COMMENT '影片id',
  `recommend_movies` varchar(2550) NOT NULL DEFAULT '' COMMENT '同类型影片',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同类型影片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_moviebox`
--

DROP TABLE IF EXISTS `t_moviebox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_moviebox` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `boxDate` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT ' ' COMMENT '单日票房日期',
  `boxUpdatetime` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT ' ' COMMENT '票房更新时间',
  `totalBox` float NOT NULL COMMENT '单日大盘，单位万',
  `totalSchemaNum` int(11) NOT NULL COMMENT '单日场次数',
  `totalTicketNum` int(11) NOT NULL COMMENT '单日人次数',
  `movieBoxInfo` mediumtext COLLATE utf8_bin NOT NULL COMMENT '影片票房详情列表',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `day` (`boxDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2071 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='票房数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_moviebox_info`
--

DROP TABLE IF EXISTS `t_moviebox_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_moviebox_info` (
  `movieId` bigint(22) NOT NULL COMMENT '影片id',
  `beforeReleaseBox` float NOT NULL COMMENT '点映票房，单位万',
  `releaseBox` float NOT NULL COMMENT '首映票房，单位万',
  `realtimeBoxRank` int(11) NOT NULL COMMENT '实时票房排名',
  `totalBoxRank` int(11) NOT NULL COMMENT '累计票房排名',
  `boxDayDetail` mediumtext COLLATE utf8_bin NOT NULL COMMENT '影片分日票房详情',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `realtimeBox` float NOT NULL DEFAULT '0' COMMENT '当日实时票房',
  `realtimeTotalBox` float NOT NULL DEFAULT '0' COMMENT '累计实时票房',
  `realtimeUpdatetime` bigint(22) NOT NULL DEFAULT '0' COMMENT '实时票房数据更新时间戳',
  `preSaleBox` float NOT NULL DEFAULT '0' COMMENT '预售票房',
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='影片票房详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_product`
--

DROP TABLE IF EXISTS `t_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_product` (
  `spu_id` bigint(20) NOT NULL COMMENT 'spuid',
  `spu_info` longtext NOT NULL COMMENT 'spu_info',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`spu_id`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='t_product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_product_brand`
--

DROP TABLE IF EXISTS `t_product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_product_brand` (
  `brand_id` bigint(22) NOT NULL COMMENT '品牌id',
  `brand_name` varchar(128) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `brand_summary` varchar(2550) NOT NULL DEFAULT '' COMMENT '品牌简介',
  `logo_image` varchar(2550) NOT NULL DEFAULT '0' COMMENT '品牌LOGO图',
  `banner_image` varchar(2550) NOT NULL DEFAULT '0' COMMENT '首页品牌banner图',
  `list_banner_image` varchar(2550) NOT NULL DEFAULT '' COMMENT '列表页品牌banner图',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_product_post_history`
--

DROP TABLE IF EXISTS `t_product_post_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_product_post_history` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '商品发帖历史id',
  `type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '商品发帖类型',
  `movie_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '影片id',
  `daily_date` varchar(20) NOT NULL DEFAULT '' COMMENT '发帖日期',
  `tag_name` varchar(32) NOT NULL DEFAULT '' COMMENT '标签名称',
  `post_detail` varchar(1024) NOT NULL DEFAULT '' COMMENT '发帖详情记录',
  `post_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `post_time` varchar(20) NOT NULL COMMENT '发帖时间',
  `create_time` varchar(20) NOT NULL COMMENT '更新时间',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `movie_id` (`movie_id`),
  KEY `daily_date` (`daily_date`),
  KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8 COMMENT='商品发帖历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_schedule_screening`
--

DROP TABLE IF EXISTS `t_schedule_screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_schedule_screening` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `third_id` varchar(30) NOT NULL COMMENT '第三方id',
  `third_from` varchar(30) NOT NULL COMMENT '第三方名称',
  `seq_no` varchar(128) NOT NULL COMMENT '场次号',
  `seat_total_number` int(11) NOT NULL COMMENT '座位总数',
  `seat_remaining_number` int(11) NOT NULL COMMENT '座位余数',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `third_id_third_from_seq_no` (`third_id`,`third_from`,`seq_no`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=2553161609 DEFAULT CHARSET=utf8 COMMENT='t_schedule_screening';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_song`
--

DROP TABLE IF EXISTS `t_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_song` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '歌曲自增id',
  `src` tinyint(1) NOT NULL COMMENT '歌曲来源',
  `song_id` bigint(22) NOT NULL COMMENT '歌曲id',
  `title` varchar(128) NOT NULL COMMENT '歌曲标题',
  `author` varchar(64) NOT NULL COMMENT '作者',
  `has_mv` tinyint(1) NOT NULL COMMENT '是否有mv',
  `image` varchar(2550) NOT NULL COMMENT '第三方的图片',
  `local_image` varchar(2550) NOT NULL COMMENT '本地转存的图片',
  `link` varchar(2550) NOT NULL COMMENT '第三方的链接',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `union_src_song_id` (`src`,`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19404 DEFAULT CHARSET=utf8 COMMENT='歌曲表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_song_src`
--

DROP TABLE IF EXISTS `t_song_src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_song_src` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '歌曲源数据表id',
  `src` tinyint(1) NOT NULL COMMENT '源数据类型',
  `src_id` bigint(22) NOT NULL COMMENT '数据id',
  `name` varchar(128) NOT NULL COMMENT '数据名',
  `song_ids` varchar(2550) NOT NULL COMMENT '歌曲id列表',
  `cover` varchar(2550) NOT NULL COMMENT '歌曲封面',
  `local_cover` varchar(2550) NOT NULL COMMENT '歌曲封面本地链接',
  `mapping_type` tinyint(1) NOT NULL COMMENT '歌曲映射类型',
  `mapping_object_id` bigint(22) NOT NULL COMMENT '歌曲映射结果',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `union_mapping_type_mapping_object_id` (`mapping_type`,`mapping_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33516 DEFAULT CHARSET=utf8 COMMENT='歌曲源数据映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_still_detail`
--

DROP TABLE IF EXISTS `t_still_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_still_detail` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '剧照详情id',
  `movie_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '影片id',
  `still` varchar(1024) NOT NULL DEFAULT '' COMMENT '剧照图片url',
  `actor_info` varchar(1024) NOT NULL DEFAULT '' COMMENT '关联影人信息',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76503 DEFAULT CHARSET=utf8 COMMENT='剧照详情表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_template`
--

DROP TABLE IF EXISTS `t_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_template` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `content` text NOT NULL COMMENT '模板内容',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_template_history`
--

DROP TABLE IF EXISTS `t_template_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_template_history` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '模板历史id',
  `template_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '模板id',
  `params` varchar(1024) NOT NULL DEFAULT '' COMMENT '发帖参数',
  `post_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '帖子id',
  `post_time` varchar(20) NOT NULL COMMENT '发帖时间',
  `update_time` varchar(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8 COMMENT='模板历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_video`
--

DROP TABLE IF EXISTS `t_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_video` (
  `tv_id` bigint(22) NOT NULL COMMENT '视频id',
  `album_id` bigint(22) NOT NULL DEFAULT '-1' COMMENT '专辑id',
  `tv_name` varchar(128) NOT NULL DEFAULT '' COMMENT '视频名称',
  `sub_title` varchar(45) NOT NULL DEFAULT '' COMMENT '视频副标题',
  `tv_desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '视频描述',
  `video_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频状态',
  `time_length` int(11) NOT NULL DEFAULT '0' COMMENT '视频时长',
  `image_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '视频图片状态',
  `image` varchar(2550) NOT NULL DEFAULT '' COMMENT '视频图片',
  `local_image_horizontal` varchar(2550) NOT NULL DEFAULT '' COMMENT '视频转存横图',
  `local_image_vertical` varchar(2550) NOT NULL DEFAULT '' COMMENT '视频转存纵图',
  `h5_url` varchar(2550) NOT NULL DEFAULT '' COMMENT '视频H5地址',
  `swf_url` varchar(2550) NOT NULL DEFAULT '' COMMENT '视频播放地址',
  `is1080p` tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频是否是1080P',
  `issue_time` datetime NOT NULL COMMENT '视频更新时间',
  `play_control` tinyint(1) NOT NULL DEFAULT '1' COMMENT '视频播放平台状态',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '视频是否需要展现',
  `post_changed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发帖变更',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '本条数据的更新时间',
  PRIMARY KEY (`tv_id`),
  KEY `image_status_index` (`image_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-15  9:46:29
