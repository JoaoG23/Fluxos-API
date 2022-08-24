
const mysql = require('mysql2/promise');
const connect = async() => {
    if(global.connection && global.connection.state !== 'disconnected')
        return global.connection;
    
    const mysql = require("mysql2/promise");
    const connection = await mysql.createConnection({
            host: process.env.HOST_DB,
            user: process.env.USER_DB,
            port:process.env.PORT_DB,
            password: process.env.PASSWORD_DB,
            database:process.env.DATABASE
    });


    // const connection = await mysql.createConnection("mysql://root:admin@localhost:3306/db_controllerfluxo");
    console.log("Conexão concluida com sucesso MySQL!");
    global.connection = connection;
    return connection;
}


module.exports = connect;

