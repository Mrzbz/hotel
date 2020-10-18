const express = require("express");
const server = express();
const cors = require("cors");
const md5 = require("md5");

// 导入body-paser中间件处理post 的参数
const bodyPaser = require("body-parser");
server.use(bodyPaser.urlencoded({
  extended: false
}))


// 监听8000端口
server.listen(8000, () => { console.log("server listen port:8000...") });
// cors解决跨域
server.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"]
})
)


// 测试接口
server.get("/", (req, res) => {
  res.send({message:"hello"})
})

// 导入路由
const UserRouter = require("./router/userRouter.js");
const resultRouter = require("./router/resultRouter");
const Detail = require("./router/detail.js");
server.use("/result", resultRouter);
server.use("/details", Detail);
server.use("/user",UserRouter);//挂载路由
