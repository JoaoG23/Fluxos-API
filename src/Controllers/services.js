const connect = require('../Model/dbconnect');

// **** SERVICE *****
/*
Tudo que é usado mais de 
2 vezes ou mais ficara aqui
evitando repeticao de codigo 
*/

const services = {

    ifExistsRegister: async (nome_tabela, nomeColunaId, id) => {

        try {

            const dbc = await connect();

            const verificarSql = `CALL pr_verifica_existe_registro(?, ?, ? );`;
            const values = [nome_tabela, nomeColunaId, id];
            const queryVerificar = await dbc.query(verificarSql, values);
            const isExisteRegistro = queryVerificar[0][0][0].resposta;

            return isExisteRegistro;
        }

        catch (error) {
            console.error(error);
        }
    },

    listAll: async (nome_tabela) => {

        try {

            const dbc = await connect();

            const listSql = `CALL pr_ver_tudo_tabela(?);`;
            const values = [nome_tabela];
            const query = await dbc.query(listSql, values);
            const allRegistro = query[0][0];

            return allRegistro;
        }

        catch (error) {
            console.error(error);
        }
    },

    listForID: async (nome_tabela, nomeColunaId, id) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_selecionar_um( ? , ? , ? );`;
            const values = [nome_tabela, nomeColunaId, id];
            const respostaQuery = await dbc.query(sql, values);
            const respostaFinal = respostaQuery[0][0];
            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },

    listForName: async (nome_tabela, colunaDePesquisa, nomeProcurado) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_selecionar_algum_elemento_caracteres( ? , ? , ? );`;
            const values = [nome_tabela, colunaDePesquisa, nomeProcurado];
            const respostaQuery = await dbc.query(sql, values);
            const respostaFinal = respostaQuery[0][0];
            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },

    insert: async (nome_tabela, nome_insert) => {

        try {

            const dbc = await connect();
            const sql = `CALL pr_inserir_descricao( ?, ? );`;
            const values = [nome_tabela, nome_insert];
            const respostaQuery = await dbc.query(sql, values);

            const respostaFinal = respostaQuery[0][0][0].resposta;
            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },

    remove: async (nome_tabela, nomeColunaId, id) => {

        try {

            const dbc = await connect();
            const sql = `CALL pr_deletar_descricao( ?,?, ? );`;
            const values = [nome_tabela, nomeColunaId, id];
            const respostaQuery = await dbc.query(sql, values);

            const respostaFinal = respostaQuery[0][0][0].resposta;
            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },

    edit: async (nome_tabela, colunaAModificar, novoDadoEditar, nomeColunaId, id) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_editar_descricao( ?, ? , ? ,? ,? );`;
            const values = [nome_tabela, colunaAModificar, novoDadoEditar, nomeColunaId, id];
            const respostaQuery = await dbc.query(sql, values);
            const respostaFinal = respostaQuery[0][0][0].resposta;

            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },

    calculatesBasedOnCriteria: async (mes, ano, colunaAModificar, criterio1, idElemento, criterio2) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_calcula_gastoganho( ?, ?, ? , ? ,? ,? );`;
            const values = [mes, ano, colunaAModificar, criterio1, idElemento, criterio2];
            const respostaQuery = await dbc.query(sql, values);
            const respostaFinal = respostaQuery[0][0][0];

            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },

    calculatesBasedOnCriteriaWithName: async (mes, ano, colunaAModificar, criterio1, idElemento, criterio2) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_calcula_gastoganho_com_criterio( ?, ?, ? , ? ,? ,? );`;
            const values = [mes, ano, colunaAModificar, criterio1, idElemento, criterio2];
            const respostaQuery = await dbc.query(sql, values);
            const respostaFinal = respostaQuery[0][0][0];

            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    },
    
    countFieldForTable: async (tablePesquisada, idElemento) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_conta_quantocampos_tabela( ? , ? );`;
            const values = [tablePesquisada, idElemento];
            const respostaQuery = await dbc.query(sql, values);
            const respostaFinal = respostaQuery[0][0][0].resposta;

            return respostaFinal;
        } catch (error) {
            console.error(error);
        }
    }

}

module.exports = services;