const express = require("express");
const server = express();

// 导入body-paser中间件处理post 的参数
const bodyPaser = require("body-parser");
server.use(bodyPaser.urlencoded({
  extended: false
}))

// 导入MySQL文件

// 监听8000端口
server.listen(8000, () => { console.log("server listen port:8000...") });

// 测试接口
// server.get("/login", (req, res) => {
//   res.send({Ok:'ok'})
// })

// 导入路由
const router = require("./router/userRouter.js");
server.use("/user",router);//路由拦截
