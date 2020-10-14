SET NAMES UTF8;
DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel CHARSET=UTF8;
USE hotel;


-- 用户表

CREATE TABLE hotel_user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,   #用户id
  uname VARCHAR(32),                        #用户名
  upwd VARCHAR(32),                         #密码
  phone VARCHAR(16),                        #手机
  avatar VARCHAR(128),                      #头像
  gender BOOLEAN                            #性别
);



-- 订单表

CREATE TABLE hotel_order(
  aid INT PRIMARY KEY AUTO_INCREMENT, #订单编号
  user_id INT,                        #用户id
  Ostatus INT,                        #订单状态：1-完成，2-待支付，3-交易失败
  order_time BIGINT,                  #下单时间
  pay_time BIGINT,                    #付款时间
  checkin_time BIGINT,                #入住时间
  checkout_time BIGINT                #离店时间
);


-- 房源表

CREATE TABLE hotel_origin(
  lid INT PRIMARY KEY AUTO_INCREMENT, #房源编号
  title VARCHAR(128),                 #主标题
  subtitle VARCHAR(128),              #副标题
  price DECIMAL(7,2),                 #价格
  position VARCHAR(64),               #位置
  rType VARCHAR(64),                  #户型
  img1 VARCHAR(128),                  #详情图片
  img2 VARCHAR(128),
  img3 VARCHAR(128),
  img4 VARCHAR(128),
  area SMALLINT,                      #面积
  bed BOOLEAN,                        #床
  wifi BOOLEAN,                       #wifi
  washing BOOLEAN,                    #洗衣机
  air_conditioner BOOLEAN,            #空调
  toilet BOOLEAN                      #独立卫浴
);


-- 插入用户数据
INSERT hotel_user (user_id,uname,upwd,phone,gender) VALUES(1,'ROOT','123456','13534668325',1);

-- 插入订单表
INSERT hotel_order (aid,user_id,Ostatus,order_time,pay_time,checkin_time,checkout_time) 
VALUES (1,1,2,1602609901509,null,1602624567895,16026578984562);

-- 插入房源信息
INSERT hotel_origin (
  lid,
  title,
  subtitle,
  price,
  position,
  rType,
  img1,img2,img3,img4,
  area,
  bed,
  wifi,
  washing,
  air_conditioner,
  toilet) VALUES
(1,'万象天成 龙岗中心城 精美单间 家私电齐全 押一付一好停车','龙岗-龙岗中心城-万象天成',980,'龙岗','1室','1.jpg','1.jpg','1.jpg','1.jpg',26,1,1,1,1,0),
(NULL,'振业峦山谷 精装2房 诚心出租 带全部家私家电','龙岗-横岗-振业峦山谷',1900,'龙岗','2室1厅','2.jpg','2.jpg','2.jpg','2.jpg',56,1,1,1,1,1),
(NULL,'精装修两房一厅 大阳台 近地铁 配套齐全 拎包入组 全新家私','龙华区-龙华-富联新村',2000,'龙华','2室1厅','3.jpg','3.jpg','3.jpg','3.jpg',50,1,1,0,1,1),
(NULL,'地铁口物业,楼下生活配套成熟','龙华区-龙华-莱蒙水榭春天五期',890,'龙华','1室1厅','4.png','4.png','4.jpg','4.png',46,1,1,0,1,1),
(NULL,'11号线沙井 精装 家私电齐窗户让你的生活充满阳光','宝安-沙井-鸿荣源禧园',1200,'宝安','1室1厅','5.jpg','5.jpg','5.jpg','5.jpg',35,1,1,0,1,1),
(NULL,'龙辉花园 合租 主卧87.7平米4室1厅1卫性别不限','南山-后海-京光海景花园',1800,'南山','4室1厅','6.jpg','6.jpg','6.jpg','6.jpg',88,1,1,1,1,1),
(NULL,'财富港静装修一房 整租 商城就在楼下 150米就是地铁','宝安-西乡-财富港',3700,'宝安',"一室一厅一卫",'50.jpg','50.jpg','50.jpg','50.jpg',62,1,1,1,1,0),
(NULL,'万科精装3房2厅 家私家电齐全 南北对流 拎包入住','宝安-福永-万科金色领域',5000,'宝安',"三室二厅一卫",'51.jpg','51.jpg','51.jpg','51.jpg',62,1,1,1,1,1),
(NULL,'11号线福永地跌站200米 精装大单间带阳台 可做饭 带车位','宝安-福永-听涛雅苑',2300,'宝安','单间','52.jpg','52.jpg','52.jpg','52.jpg',30,1,1,1,1,1),
(NULL,'华侨城四海云亭户型 二室二厅一卫 带阳台','宝安-沙井-华侨城四海云亭',3400,'宝安','二室二厅一卫','53.jpg','53.jpg','53.jpg','53.jpg',76,1,1,1,1,0),
(NULL,'白金酒店 电梯两房 采光通风好','宝安-新安-白金酒店公寓',3300,'宝安','二室二厅一卫','54.jpg','54.jpg','54.jpg','54.jpg',37,1,1,1,1,1),
(NULL,'光明1号 精装3房 阳台卧室看花园 楼层安静舒适 拎包入住','宝安-光明-光明1号',4600,'光明','三室二厅二卫','55.jpg','55.jpg','55.jpg','55.jpg',90,1,1,1,1,1),
(NULL,'6号线合水口地跌站 近宏发嘉域 免费停车','宝安-公明-海悦花园',700,'光明','一室一厅一卫','56.jpg','56.jpg','56.jpg','56.jpg',36,1,1,0,1,0),
(NULL,'马山头 大三房 双阳台 南北通透 采光 电梯房','宝安-公明-宏发嘉域',700,'光明','三室二厅二卫','57.jpg','57.jpg','57.jpg','57.jpg',109,0,1,1,1,1),
(NULL,'明景园 临地铁 两房 大阳台 采光好','宝安-公明-明景园',1600,'光明','二室一厅一卫','58.jpg','58.jpg','58.jpg','58.jpg',80,1,0,0,1,1),
(NULL,'龙光玖龙台 光明凤凰城科学城位置 精装三房 交通便利','宝安-光明-龙光玖龙台',4800,'光明','三室二厅二卫','59.jpg','59.jpg','59.jpg','59.jpg',90,1,1,1,1,1),
(null, '万象天成 龙岗中心城 精美单间 家私电齐全 押一付一好停车', '龙岗-龙岗中心城-万象天成', '980.00', '龙岗', '1室', '1.jpg', '1.jpg', '1.jpg', '1.jpg', 26, 1, 1, 0, 1, 1),
(null, '振业峦山谷 精装2房 诚心出租 带全部家私家电', '龙岗-横岗-振业峦山谷', '1900.00', '龙岗', '2室1厅', '2.jpg', '2.jpg', '2.jpg', '2.jpg', 56, 1, 0, 1, 1, 1),
(null, '精装修两房一厅 大阳台 近地铁 配套齐全 拎包入组 全新家私', '龙华区-龙华-富联新村', '2000.00', '龙华', '2室1厅', '3.jpg', '3.jpg', '3.jpg', '3.jpg', 50, 1, 0, 1, 1, 1),
(null, '地铁口物业,楼下生活配套成熟', '龙华区-龙华-莱蒙水榭春天五期', '890.00', '龙华', '1室1厅', '4.png', '4.png', '4.jpg', '4.png', 46,  1, 1, 0, 1, 1),
(null, '11号线沙井 精装 家私电齐窗户让你的生活充满阳光', '宝安-沙井-鸿荣源禧园', '1200.00', '宝安', '1室1厅', '5.jpg', '5.jpg', '5.jpg', '5.jpg', 35, 1, 1, 0, 1, 1),
(null, '龙辉花园 合租 主卧87.7平米4室1厅1卫性别不限', '南山-后海-京光海景花园', '1800.00', '南山', '4室1厅', '6.jpg', '6.jpg', '6.jpg', '6.jpg', 88, 1, 1, 1, 1, 0),
(null, '淘金山湖景花园 客厅出阳台可看东湖水库 梧桐山风光 豪华鼎复', '罗湖-水库-淘金山湖景花园', '7900.00', '罗湖', '3室1厅', '100.jpg', '100.jpg', '100.jpg', '100.jpg', 68,  1, 1, 1, 1, 1),
(null, '名骏豪庭精装小三房,看小区花园,卧室出阳台,干净整洁', '罗湖-莲塘-名骏豪庭', '5000.00', '罗湖', '3室1厅', '101.jpg', '101.jpg', '101.jpg', '101.jpg', 69,  1, 1, 1, 1, 1),
(null, '凤凰印象 简洁舒适 一房一厅 拎包入住 高层景观 看房方便', '罗湖-黄贝岭-凤凰印象', '4200.00', '罗湖', '1室1厅', '102.jpg', '102.jpg', '102.jpg', '102.jpg', 42,  1, 1, 1, 1, 1),
(null, '东乐花园, 幽静中的小区,适宜', '罗湖-布心-东乐花园', '4500.00', '罗湖', '2室1厅', '103.jpg', '103.jpg', '103.jpg', '103.jpg', 76, 1, 1, 1, 1, 1),
(null, '罗湖口岸双地铁口一房一厅出租3600', '罗湖-人民南-置地逸轩', '3600.00', '罗湖', '1室1厅', '104.jpg', '104.jpg', '104.jpg', '104.jpg', 39,  1, 1, 1, 1, 0),
(null, '地铁口 卧室出阳台 精美两房 家私齐全 拎包入住 业主心诚租', '罗湖-布心-大地花园', '3600.00', '罗湖', '2室1厅', '105.jpg', '105.jpg', '105.jpg', '105.jpg', 46,  1, 1, 0, 1, 1),
(null, '京基御景一期,租2700双大阳台正看花园游泳池,带全家电', '坪山区-坪山-京基·御景印象', '2700.00', '坪山', '3室1厅', '106.jpg', '106.jpg', '106.jpg', '106.jpg', 89,  1, 0, 1, 1, 1),
(null, '新房源!坪山京基御景一房一厅,家电齐全,拎包入住,随时看房', '坪山区-坪山-京基·御景印象', '1700.00', '坪山', '1室1厅', '107.jpg', '107.jpg', '107.jpg', '107.jpg', 45,  1, 0, 1, 1, 1),
(null, '网红大盘公馆业主诚心出租空房可以按要求配齐吃住一条街', '坪山区-坪山-深城投·中心公馆', '1100.00', '坪山', '1室1厅', '108.jpg', '108.jpg', '108.jpg', '108.jpg', 41,  1, 1, 0, 1, 1),
(null, '拎包入住,业主随和,需要什么添加什么,交通生活方便,', '坪山区-坪山-龙光玖云著', '1800.00', '坪山', '2室1厅', '109.jpg', '109.jpg', '109.jpg', '109.jpg', 52, 1, 1, 1, 1, 0),
(null, '坪山高铁站旁 精装修一房家私齐全 业主好说话 看房方便', '坪山区-坪山-深城投·中心公馆', '1300.00', '坪山', '1室1厅', '110.jpg', '110.jpg', '110.jpg', '110.jpg', 33,  1, 1, 1, 1, 1),
(null, '坪山天虹,精装两房出租,家私家电齐全,拎包入住', '坪山区-坪山-龙光玖云著', '1800.00', '坪山', '2室1厅', '111.jpg', '111.jpg', '111.jpg', '111.jpg', 52, 1, 0, 1, 1, 1);
