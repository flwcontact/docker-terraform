const express = require('express');
const app = express();
var product = 'Fake Product';

const PORT = process.env.PORT || 8080;
const HOST = "0.0.0.0";

app.get('/', (req, res) => {
   res.send("Hello " + product)
});

app.listen(PORT, HOST); 
console.log(`app started on http://${HOST}:${PORT}/`);
