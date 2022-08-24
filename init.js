
// --- -initialize --------

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();

const port = process.env.PORT_SERVIDOR || 3000;
const controleDeRouters = require('./src/Routers/ControleDeRouters');
app.use(cors());
app.use("/" ,express.json(), controleDeRouters);

app.listen(port ,() =>{
    console.log("Servidor Rodando em PORTA ", port);
});