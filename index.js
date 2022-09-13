
// --- -initialize --------

require('dotenv').config();

const path = require('path');
const express = require('express');
const cors = require('cors');
const app = express();

const port = process.env.PORT_SERVIDOR || 3000;
const controleDeRouters = require('./src/Routers/ControleDeRouters');
app.use(cors());
app.use("/v1" ,express.json(), controleDeRouters);

// Para molito
// app.use(express.static(path.join(__dirname, 'view')));

// +app.get('/*', function (req, res) {
//   res.sendFile(path.join(__dirname, 'view', 'index.html'));
// });

app.listen(port ,() =>{
    console.log("Servidor Rodando em PORTA ", port);
});