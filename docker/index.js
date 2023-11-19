const express = require("express");

const port = "8080";

const app = express();

app.get("/", (req, res) => {
  res.send("hello yongho. Pulled from Docker Hub");
});

app.listen(port);
console.log(`server running on ${port}`);