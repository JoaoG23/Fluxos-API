require('dotenv').config();
const app = require('./server');
const port = process.env.PORT_SERVIDOR || 3000;

app.listen(port ,() =>{
    console.log("Servidor Rodando em PORTA ", port);
});