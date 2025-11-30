const express = require("express");
const app = express();

// Root endpoint
app.get("/", (req, res) => {
  res.json({ message: "Blue-Green API Root" });
});

// Healthcheck
app.get("/health", (req, res) => {
  res.json({ status: "ok", service: "blue-green" });
});

// Version simple (no se conecta a nada)
app.get("/version", (req, res) => {
  res.json({ version: "1.0.0" });
});

module.exports = app;
