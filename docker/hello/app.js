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
  return res.render('index', {data : 'hello yongho. Pulled from Docker Hub'});
});

app.listen(port);
console.log(`server running on ${port}`);