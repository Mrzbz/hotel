const express = require("express");
const server = express.Router();
const mysql = require("../mysql.js");
server.get("/detail", (req, res) => {
  
  let lid = req.query.lid;
  // console.log(lid);
  let sql = "select lid,position,title,subtitle,price,area,img1 from hotel_origin where lid= ?";
  mysql.query(sql, [lid], (err, result) => {
    if (err) throw err;
    res.send({ message: "ok", code: 1, result: result });
  })
  // res.send("ok");
})

module.exports = server;