const express = require("express");
const app = express.Router();
// 导入MySQL文件
const mysql = require("../mysql"); 



app.get("/login", (req, res) => {
  // res.send("ok");
  mysql.query("select user_id,phone,uname from hotel_user where user_id= 1", (err, results) => {
    if (err) throw err;
    res.send({ message: "success", code: 1, result: results });
  })
})





module.exports = app;