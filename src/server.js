const express = require('express');
const app = express();
var product = 'Fake Product';

// default port 3000 on purpose as it makes use of the env variable first, which is declared on the docker-commpose.yml file
const PORT = process.env.PORT || 3000;
const HOST = "0.0.0.0";

// setting database credentials through env vars
const { Client } = require('pg')
const client = new Client({
  host: process.env.DBHOST,
  user: process.env.DBUSER,
  password: process.env.DBPASSWORD,
});

// root endpoint, hello message concatenated with the "product" variable
app.get('/', (req, res) => {
   res.send("Hello " + product)
});

// readiness health check of the database
app.get("/ready", async (req, res) => {
  const database = await client.query("SELECT 1").then(() => "up").catch(() => "down");

  res.send({
    database,
  });
});

// connection to postgres and startup log message 
(async () => {
  await client.connect();

  app.listen(PORT, () => {
    console.log(`app started on http://${HOST}:%d`, PORT);
  });
})();
