const express = require("express");

const port = "8080";

const app = express();

const path = require("path");

// ejs 설정
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, '/views'))

app.get("/", (req, res) => {
  // 기본 방식
  // res.send("hello yongho. Pulled from Docker Hub");
  // ejs rendering 방식
  return res.render('index', {
    // 하드코딩 데이터
    PROJECT_NAME: 'BlueGreen Update Test',
    GREETING: 'This is Blue App',

    // docker image arch
    arch : process.arch,

    // k8s container info
    POD_NAME: process.env.POD_NAME,
    POD_IP: process.env.POD_IP,
    NAMESPACE_NAME: process.env.NAMESPACE_NAME,
    NODE_NAME: process.env.NODE_NAME,
    NODE_IP: process.env.NODE_IP,
  });
});

app.listen(port);
console.log(`server running on ${port}`);