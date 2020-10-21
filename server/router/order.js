const express = require("express");
const server = express.Router();
const mysql = require("../mysql");

server.post("/addorder", (req, res) => {
  // console.log(req.body.checkIn, req.body.checkOut,req.body.lid,req.body.phone);
  let checkIn = req.body.checkIn;
  let checkOut = req.body.checkOut;
  let lid = req.body.lid;
  let phone = req.body.phone;
  let order_time = req.body.orderTime;
  let pay_time = req.body.payTime;
  // let Ostatus = req.body.Ostatus;
  // let user_id = req.body.lid;
  console.log(checkOut, checkIn);
  // 联合查表插入语句
  // 用户uname，phone
  let sql = "select user.user_id,user.uname,origin.lid,origin.title,origin.price from hotel_user as user inner join hotel_origin as origin on lid= ? where user_id= ?";
  mysql.query(sql, [lid, "1"], (err, results) => {

    if (err) throw err;
    if (results.length > 0) {
      // console.log(results);
      sql = "insert hotel_order(checkIn_time,checkOut_time,lid,user_id,pay_time,order_Time,Ostatus) values(? ,?,?,?,?,?,?)";
      mysql.query(sql, [checkIn, checkOut, lid, "1", pay_time, order_time, "1"], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          res.send({ code: "1" });
        }
        else {
          res.send({ code: "0" });
        }

      });
    }
  });
});


module.exports = server;