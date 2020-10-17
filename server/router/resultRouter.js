const express = require("express");
const server = express.Router();

const mysql = require("../mysql");


// 按地址、价格或者地址和价格搜索
server.get("/result", (req, res) => {
  let price = req.query.price;
  let addr = req.query.addr;
  console.log(addr, price);
  let sql;
  if (price && addr) {
    sql = "select lid,position,title,subtitle,price,area,img1 from hotel_origin where position= ? and price= ?";
    mysql.query(sql, [addr, price], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
  } else if (price) {
    sql = "select lid,position,title,subtitle,price,area,img1 from hotel_origin where price= ?";
    mysql.query(sql, [price], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
  } else if (addr) {
    sql = "select lid,position,title,subtitle,price,area,img1 from hotel_origin where position= ?";
    mysql.query(sql, [addr], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
  } else {
    sql = "select lid,position,title,subtitle,price,area,img1 from hotel_origin";
    mysql.query(sql, [addr], (err, result) => {
      if (err) throw err;
      res.send(result);
    })
  }
})

module.exports = server;