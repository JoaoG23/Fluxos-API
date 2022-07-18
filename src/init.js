
// --- -initialize --------
const express = require('express');
const app = express();
const port = 3000;
const controleDeRouters = require('./Routers/ControleDeRouters');

app.use("/" ,express.json(),controleDeRouters);

app.listen(port ,() =>{
    console.log("Servidor Rodando em PORTA ", port);
});