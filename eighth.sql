/*
Navicat MySQL Data Transfer

Source Server         : abcd
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : eighth

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2019-06-18 14:06:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_books`
-- ----------------------------
DROP TABLE IF EXISTS `t_books`;
CREATE TABLE `t_books` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '书名',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `borrow` int(11) NOT NULL COMMENT '0借阅 1不可借阅',
  `type` int(11) NOT NULL COMMENT '类别id',
  `inventory` int(11) NOT NULL COMMENT '总库存量',
  `residue` int(11) NOT NULL COMMENT '剩余库存量',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传图片路径',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作人',
  `createtime` datetime NOT NULL,
  `visit` int(11) NOT NULL COMMENT '访问量',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_books
-- ----------------------------
INSERT INTO `t_books` VALUES ('3', '中国清官廉史', '李慧', '人民出版社', '100', '1', '4', '100', '99', 'images/book/3.jpg', 'admin', '2019-05-22 20:58:43', '8');
INSERT INTO `t_books` VALUES ('4', '缘分', '李雨生', '人民邮电出版', '99', '1', '18', '100', '97', 'images/book/4.jpg', 'admin', '2019-05-22 21:07:35', '20');
INSERT INTO `t_books` VALUES ('5', '蝴蝶效应经济学', '保罗.真默罗德', '中信出版社', '121', '0', '16', '100', '99', 'images/book/5.jpg', 'admin', '2019-05-22 21:10:18', '15');
INSERT INTO `t_books` VALUES ('6', '海岱', '刘允东', '山东工艺美术学院学术著作出版基金资助', '119', '0', '15', '100', '98', 'images/book/6.jpg', 'admin', '2019-05-22 21:25:58', '33');
INSERT INTO `t_books` VALUES ('7', '古镇', '江彪', '人民出版社', '188', '0', '15', '100', '98', 'images/book/7.jpg', 'admin', '2019-05-22 21:27:39', '29');
INSERT INTO `t_books` VALUES ('8', '遥远的记忆', '苏孟雄', '人民邮电', '175', '0', '15', '100', '100', 'images/book/8.jpg', 'admin', '2019-05-22 21:28:51', '17');
INSERT INTO `t_books` VALUES ('10', '红楼梦', '曹雪芹', '人民出版社', '210', '1', '22', '100', '97', 'images/book/1559008176805.jpg', 'admin', '2019-05-28 09:49:36', '3');
INSERT INTO `t_books` VALUES ('11', '的的范范', 'dafdaf', 'dafdafd', '10', '0', '1', '545', '44', 'images/book/1560324873774.jpg', 'admin', '2019-06-12 15:34:33', '0');
INSERT INTO `t_books` VALUES ('12', 'ajax', '未知', '未知', '99', '1', '15', '20', '20', 'images/book/1560691068538.jpg', 'admin', '2019-06-16 21:17:48', '0');
INSERT INTO `t_books` VALUES ('13', 'nginx', '未知', '未知', '99.1', '0', '15', '30', '30', 'images/book/1560691182294.jpg', 'admin', '2019-06-16 21:19:42', '0');

-- ----------------------------
-- Table structure for `t_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL COMMENT '已借阅',
  `maxnum` int(11) NOT NULL COMMENT '借阅上限',
  `total` int(11) NOT NULL COMMENT '总借阅次数',
  `records` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '借阅书籍id信息',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('10000', '2', '5', '3', '7,10,5');
INSERT INTO `t_person` VALUES ('100004', '0', '5', '0', null);
INSERT INTO `t_person` VALUES ('100078', '2', '5', '2', '6,2');
INSERT INTO `t_person` VALUES ('admin', '1', '5', '6', '1,2,3,4,5,7');

-- ----------------------------
-- Table structure for `t_records`
-- ----------------------------
DROP TABLE IF EXISTS `t_records`;
CREATE TABLE `t_records` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '学号',
  `bid` int(11) NOT NULL COMMENT '图书标号',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '图书名称',
  `borrowtime` datetime NOT NULL COMMENT '借阅时间',
  `returntime` datetime NOT NULL COMMENT '到期时间',
  `status` int(11) NOT NULL COMMENT '状态0 预借 1待还 2即将到期 3超时 4归还',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_records
-- ----------------------------
INSERT INTO `t_records` VALUES ('1', 'admin', '1', '千年古镇', '2019-05-26 09:13:35', '2019-06-26 09:13:48', '4');
INSERT INTO `t_records` VALUES ('2', 'admin', '2', '明年秋天', '2019-04-28 09:14:48', '2019-08-26 00:00:00', '4');
INSERT INTO `t_records` VALUES ('3', 'admin', '3', '中国清官廉史', '2019-05-23 09:16:55', '2019-06-23 09:17:26', '4');
INSERT INTO `t_records` VALUES ('4', 'admin', '4', '缘分', '2019-04-24 09:18:56', '2019-05-24 09:19:34', '4');
INSERT INTO `t_records` VALUES ('5', 'admin', '5', '蝴蝶效应经济学', '2019-04-10 15:56:05', '2019-05-10 15:56:15', '4');
INSERT INTO `t_records` VALUES ('12', '100078', '6', '海岱', '2019-05-28 23:24:34', '2019-06-27 00:00:00', '4');
INSERT INTO `t_records` VALUES ('13', '100078', '2', '明年秋天', '2019-05-28 23:24:58', '2019-06-27 00:00:00', '4');
INSERT INTO `t_records` VALUES ('14', '10000', '7', '古镇', '2019-05-29 10:40:18', '2019-06-28 00:00:00', '4');
INSERT INTO `t_records` VALUES ('15', '10000', '10', '红楼梦', '2019-05-29 11:29:42', '2019-06-28 00:00:00', '0');
INSERT INTO `t_records` VALUES ('16', '10000', '5', '蝴蝶效应经济学', '2019-05-29 11:30:35', '2019-06-28 00:00:00', '1');
INSERT INTO `t_records` VALUES ('17', 'admin', '7', '古镇', '2019-05-09 21:33:56', '2019-06-09 00:00:00', '3');

-- ----------------------------
-- Table structure for `t_sort`
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `parentid` int(11) NOT NULL COMMENT '父级别id',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_sort
-- ----------------------------
INSERT INTO `t_sort` VALUES ('1', '政治军事', '0');
INSERT INTO `t_sort` VALUES ('2', '哲学宗教', '0');
INSERT INTO `t_sort` VALUES ('3', '社会科学总论', '0');
INSERT INTO `t_sort` VALUES ('4', '政治法律', '0');
INSERT INTO `t_sort` VALUES ('5', '航空航天', '0');
INSERT INTO `t_sort` VALUES ('6', '交通运输', '0');
INSERT INTO `t_sort` VALUES ('7', '综合性', '0');
INSERT INTO `t_sort` VALUES ('8', '环科安全', '0');
INSERT INTO `t_sort` VALUES ('9', '工业技术', '0');
INSERT INTO `t_sort` VALUES ('10', '生物科学', '0');
INSERT INTO `t_sort` VALUES ('11', '数理科学与化学', '0');
INSERT INTO `t_sort` VALUES ('12', '天文地球', '0');
INSERT INTO `t_sort` VALUES ('13', '自然科学总论', '0');
INSERT INTO `t_sort` VALUES ('14', '历史地理', '0');
INSERT INTO `t_sort` VALUES ('15', '文学', '0');
INSERT INTO `t_sort` VALUES ('16', '经济', '0');
INSERT INTO `t_sort` VALUES ('17', '文化科学教育与体育', '0');
INSERT INTO `t_sort` VALUES ('18', '语言文字', '0');
INSERT INTO `t_sort` VALUES ('19', '农业科学', '0');
INSERT INTO `t_sort` VALUES ('20', '艺术', '0');
INSERT INTO `t_sort` VALUES ('21', '医药卫生', '0');
INSERT INTO `t_sort` VALUES ('22', '经典理论', '0');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL COMMENT '0管理员 1学生',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL COMMENT '0有效 1无效',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('10000', '123456', '1', '55', '女', '166985623', '0');
INSERT INTO `t_user` VALUES ('100000191', '123456', '1', 'wdedw', '女', '123456789', '0');
INSERT INTO `t_user` VALUES ('100001', '123456', '1', '拉到加拉', '女', '1426587594', '0');
INSERT INTO `t_user` VALUES ('100004', '123456', '1', '马超', '男', '1426875912', '0');
INSERT INTO `t_user` VALUES ('100012', '123456', '0', '小乔', '女', '156648935', '0');
INSERT INTO `t_user` VALUES ('100015', '123456', '1', '安徽', '女', '1547955658', '0');
INSERT INTO `t_user` VALUES ('100016', '123456', '1', '雪域', '男', '15975624585', '0');
INSERT INTO `t_user` VALUES ('100017', '123456', '1', '寒冰', '女', '15432644825', '0');
INSERT INTO `t_user` VALUES ('100018', '123456', '1', '盖伦', '男', '13477410942', '0');
INSERT INTO `t_user` VALUES ('100019', '123456', '1', '小法', '男', '18657803780', '0');
INSERT INTO `t_user` VALUES ('100020', '123456', '1', '悠米', '女', '17635682045', '1');
INSERT INTO `t_user` VALUES ('100021', '123456', '1', '妮蔻', '女', '17625863578', '0');
INSERT INTO `t_user` VALUES ('100022', '123456', '1', '派克', '男', '15628902578', '0');
INSERT INTO `t_user` VALUES ('100023', '123456', '1', '卡莎', '女', '15685203647', '0');
INSERT INTO `t_user` VALUES ('100024', '123456', '1', '佐伊', '女', '17623456021', '0');
INSERT INTO `t_user` VALUES ('100025', '123456', '1', '塔姆', '男', '15682364109', '0');
INSERT INTO `t_user` VALUES ('100026', '123456', '1', '亚索', '男', '13625902506', '0');
INSERT INTO `t_user` VALUES ('100027', '123456', '1', '盲僧', '男', '13405655430', '0');
INSERT INTO `t_user` VALUES ('100028', '123456', '1', 'aaa', '女', '13322567890', '0');
INSERT INTO `t_user` VALUES ('100029', '123456', '1', 'bbb', '男', '15687203602', '0');
INSERT INTO `t_user` VALUES ('100030', '123456', '1', 'ccc', '男', '15920546920', '0');
INSERT INTO `t_user` VALUES ('100031', '123456', '1', 'ddd', '男', '13478907654', '0');
INSERT INTO `t_user` VALUES ('100032', '123456', '1', 'eee', '女', '13523456789', '0');
INSERT INTO `t_user` VALUES ('100033', '123456', '1', 'Allen', '男', '19923400987', '0');
INSERT INTO `t_user` VALUES ('100034', '123456', '1', 'Betty', '男', '18123407896', '0');
INSERT INTO `t_user` VALUES ('100035', '123456', '1', 'Cindy', '女', '18823098765', '0');
INSERT INTO `t_user` VALUES ('100036', '123456', '1', 'Divid', '男', '18290876598', '0');
INSERT INTO `t_user` VALUES ('100037', '123456', '1', 'Ellen', '女', '19923086880', '0');
INSERT INTO `t_user` VALUES ('100038', '123456', '1', 'Floid', '男', '13527897654', '0');
INSERT INTO `t_user` VALUES ('100039', '123456', '1', 'Gorge', '女', '13478965890', '0');
INSERT INTO `t_user` VALUES ('100040', '123456', '1', 'Holk', '女', '17722223245', '0');
INSERT INTO `t_user` VALUES ('100041', '123456', '1', 'Island', '女', '17709345334', '0');
INSERT INTO `t_user` VALUES ('100042', '123456', '1', 'Jack', '男', '18630380443', '0');
INSERT INTO `t_user` VALUES ('100043', '123456', '1', 'Kolly', '女', '13489008779', '0');
INSERT INTO `t_user` VALUES ('100044', '123456', '1', 'Lord', '男', '13529758654', '0');
INSERT INTO `t_user` VALUES ('100045', '123456', '1', 'Molla', '女', '18867857896', '0');
INSERT INTO `t_user` VALUES ('100046', '123456', '1', 'Noral', '男', '19965685543', '0');
INSERT INTO `t_user` VALUES ('100047', '123456', '1', 'Ovil', '女', '15975448668', '0');
INSERT INTO `t_user` VALUES ('100048', '123456', '1', 'Peter', '女', '18208868700', '0');
INSERT INTO `t_user` VALUES ('100049', '123456', '1', 'Queen', '女', '18864786029', '0');
INSERT INTO `t_user` VALUES ('100050', '123456', '1', 'Rose', '女', '13299040049', '0');
INSERT INTO `t_user` VALUES ('100051', '123456', '1', 'Salad', '男', '15234440876', '0');
INSERT INTO `t_user` VALUES ('100052', '123456', '1', 'Tina', '男', '13900769345', '0');
INSERT INTO `t_user` VALUES ('100053', '123456', '1', 'Uu', '女', '13578968765', '1');
INSERT INTO `t_user` VALUES ('100054', '123456', '1', 'Vasy', '男', '18334443344', '0');
INSERT INTO `t_user` VALUES ('100055', '123456', '1', 'Woo', '女', '17799668877', '0');
INSERT INTO `t_user` VALUES ('100056', '123456', '1', 'Xy', '男', '17703451886', '0');
INSERT INTO `t_user` VALUES ('100057', '123456', '1', 'Yoo', '女', '15033548659', '0');
INSERT INTO `t_user` VALUES ('100058', '123456', '1', 'Zonaa', '男', '13965890244', '0');
INSERT INTO `t_user` VALUES ('100059', '123456', '1', 'Joson', '男', '19934502354', '0');
INSERT INTO `t_user` VALUES ('100060', '123456', '1', 'Banner', '女', '18234543890', '0');
INSERT INTO `t_user` VALUES ('100078', '123456', '1', '捡垃圾地方', '男', '11422548245', '0');
INSERT INTO `t_user` VALUES ('100099', '123456', '1', '嘿嘿', '女', '1534485925', '0');
INSERT INTO `t_user` VALUES ('admin', '123', '0', 'admin', '男', '15648', '0');
