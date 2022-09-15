
// --- -initialize --------


const express = require('express');
const cors = require('cors');
const app = express();


const controleDeRouters = require('./src/Routers/ControleDeRouters');
app.use(cors());
app.use("/v1" ,express.json(), controleDeRouters);

// Para monolito front end
// app.use(express.static(path.join(__dirname, 'view')));
// +app.get('/*', function (req, res) {
//   res.sendFile(path.join(__dirname, 'view', 'index.html'));
// });

module.exports = app;
