const express = require("express");
const app = express.Router();
// 导入MySQL文件
const mysql = require("../mysql");  //MySQL.js文件中的数据库名没填



app.get("/login", (req, res) => {
  res.send("ok");
  // mysql.query("select id from hotel_user where id= ?", [id], (err, results) => {
  //   if (err) throw err;
  //   res.send({ message: "success", code: 1, result: results });
  // })
})





module.exports = app;