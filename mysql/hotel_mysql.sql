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
(
  1,
  '万象天成 龙岗中心城 精美单间 家私电齐全 押一付一好停车',
  '龙岗-龙岗中心城-万象天成',
  980,
  '龙岗',
  '1室',
  '1.jpg','1.jpg','1.jpg','1.jpg',
  26,
  1,
  1,
  1,
  1,
  0
 );