const connect = require('../Model/dbconnect');

const services = {

    seExisteRegistro: async ( nome_tabela, nomeColunaId, id ) => {

        try {

            const dbc = await connect();

            const verificarSql = `CALL pr_verifica_existe_registro(?, ?, ? );`;
            const values = [nome_tabela, nomeColunaId, id];
            const queryVerificar = await dbc.query( verificarSql, values );
            const isExisteRegistro = queryVerificar[0][0][0].resposta;

            return isExisteRegistro;
        }

        catch (error) {
            console.error("Funcao isExisteRegistro", error);
        }
    }
}

module.exports = services;