
// --- -initialize --------

require('dotenv').config();
const express = require('express');
const app = express();
const port = 2001;
const controleDeRouters = require('./src/Routers/ControleDeRouters');

app.use("/" ,express.json(), controleDeRouters);

app.listen(port ,() =>{
    console.log("Servidor Rodando em PORTA ", port);
});