const express = require("express");
const server = express.Router();

const mysql = require("../mysql");
const { param } = require("./userRouter");


// 按地址、价格或者地址和价格搜索
// 分页操作   待优化
server.get("/result", (req, res) => {
  let price = req.query.price;
  let addr = req.query.addr;
  let page = req.query.page;
  let pageSize = 8;   //每页数量
  let pageCount = 0;  //总页数
  let rowCount = 0;   //总数据量
  let offset = (page - 1) * pageSize; //计算
  // console.log(addr, price);

  let sql = "";
  
  // function search(...params) {
  //   console.log(...params);
  //   let paramsCount = params.length;
  //   switch (paramsCount) {
  //     case 0: 
  //     case 1:
  //     case 2:
  //   }
  //   params.forEach(element => {
      
  //     if (parseInt(element)) {
  //       // 价格
  //     } else {
  //       // 位置
  //     }
  //   })
  // }

  let fun_sql = function (results) {
    sql = "select count(lid) as count from hotel_origin";
    mysql.query(sql, (err, result) => {
        if (err) throw err;
        rowCount = result[0].count;
        pageCount = Math.ceil(rowCount / pageSize);
        res.send({results,pageCount});
      });
  }

  if (price && addr) {
    sql = "select lid,position,title,subtitle,price,area,img1,img2,img3,img4 from hotel_origin where position= ? and price= ? limit " + offset + "," + pageSize;
    mysql.query(sql, [addr, price], (err, results) => {
      if (err) throw err;
      // sql = "select count(lid) as count from hotel_origin";
      // mysql.query(sql, (err, result) => {
      //   if (err) throw err;
      //   rowCount = result[0].count;
      //   pageCount = Math.ceil(rowCount / pageSize);
      //   // console.log(rowCount, pageCount);
      //   res.send({results,pageCount});
      // });
      fun_sql(results);
    });
  } else if (price) {
    sql = "select lid,position,title,subtitle,price,area,img1,img2,img3,img4 from hotel_origin where price= ? limit " + offset + "," + pageSize;
    mysql.query(sql, [price], (err, results) => {
      if (err) throw err;
      // sql = "select count(lid) as count from hotel_origin";
      // mysql.query(sql, (err, result) => {
      //   if (err) throw err;
      //   rowCount = result[0].count;
      //   pageCount = Math.ceil(rowCount / pageSize);
      //   // console.log(rowCount, pageCount);
      //   res.send({ results, pageCount });
      // });
      fun_sql(results);
    });
  } else if (addr) {
    sql = "select lid,position,title,subtitle,price,area,img1,img2,img3,img4 from hotel_origin where position= ?limit " + offset + "," + pageSize;
    mysql.query(sql, [addr], (err, results) => {
      if (err) throw err;
      // sql = "select count(lid) as count from hotel_origin";
      // mysql.query(sql, (err, result) => {
      //   if (err) throw err;
      //   rowCount = result[0].count;
      //   pageCount = Math.ceil(rowCount / pageSize);
      //   // console.log(rowCount, pageCount);
      //   res.send({ results, pageCount });
      // });
      fun_sql(results);
      
    });
  } else {
    sql = "select lid,position,title,subtitle,price,area,img1,img2,img3,img4 from hotel_origin limit " + offset + "," + pageSize;;
    mysql.query(sql, [addr], (err, results) => {
      if (err) throw err;
      // sql = "select count(lid) as count from hotel_origin";
      // mysql.query(sql, (err, result) => {
      //   if (err) throw err;
      //   rowCount = result[0].count;
      //   pageCount = Math.ceil(rowCount / pageSize);
      //   // console.log(rowCount, pageCount);
      //   res.send({ results, pageCount });
      // });
      fun_sql(results);
    });
  }
});





module.exports = server;