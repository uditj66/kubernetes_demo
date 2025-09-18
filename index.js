import express from "express";
const app = express();

app.use("/", (req, res) => {
  res.json({
    message: "Hello from container",
    service: "hello-nodeeeee",
    pod: process.env.POD_NAME || "unknown",
    time: new Date().toLocaleString("en-IN"),
  });
});

app.get("/readyz", (req, res) => {
  res.status(200).send("ready");
});
app.get("/healthz", (req, res) => {
  res.status(200).send("ok");
});

const port = 3000;
app.listen(port, () => {
  console.log(`server running on  ${port}`);
});
