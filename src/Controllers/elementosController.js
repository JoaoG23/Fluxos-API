const connect = require('../Model/dbconnect');
const services = require('./services');

const elementosController = {

    visualizar: async (req, resp) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_ver_tudo_tabela('tb_elementos');`;
            const respostaQuery = await dbc.query(sql);
            const respostaFinal = respostaQuery[0][0];
            resp.json(respostaFinal);
        } catch (error) {
            
            resp.status(404).send(error)
        }
    },
    inserir: async (req, resp) => {

        try {

            const nomeElemento = req.body.nome_elemento;
            const dbc = await connect();
            const sql = `CALL pr_inserir_descricao('tb_elementos', ? );`;
            const values = [nomeElemento];
            const respostaQuery = await dbc.query(sql, values);

            const respostaFinal = respostaQuery[0][0][0].resposta;
            resp.status(201).json(respostaFinal);
        } catch (error) {
            resp.status(404).send(error);
        }
    },
    deletar: async (req, resp) => {

        try {
            let id = req.params.id_elemento;

            if (!id) {
                id = req.body.id_elemento
            }

            const dbc = await connect();
            const sql = `CALL pr_deletar_descricao('tb_elementos','idelementos', ? );`;
            const values = [id];
            const respostaQuery = await dbc.query(sql, values);

            const respostaFinal = respostaQuery[0][0][0].resposta;
            resp.json(respostaFinal);
        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    editar: async (req, resp) => {

        try {

            const id = req.body.id_elemento;
            const nomeElemento = req.body.nome_elemento;


            const dbc = await connect();
            const sql = `CALL pr_editar_descricao('tb_elementos', 'descricao_elementos', ?, 'idelementos', ?);`;
            const values = [nomeElemento, id];
            const respostaQuery = await dbc.query(sql, values);

            const respostaFinal = respostaQuery[0][0][0].resposta;
            resp.json(respostaFinal)
        } catch (error) {
            resp.status(404).send(error)
        }
    },
    // deletarItem: async ( req, resp ) => {

    // try {

    //     const idEncontrado = req.params.id;
    //     if (!idEncontrado) {
    //         id = req.body.id;
    //     } 

    //     const dbc = await connect();
    //     const sql = `CALL pr_deletar_fluxocaixa(?);`;
    //     const values = [id];
    //     const respostaQuery = await dbc.query(sql, values);

    //     const respostaFinal = respostaQuery[0][0][0].resposta;
    //         resp.json(respostaFinal)
    // } catch (error) {
    //         resp.status(404).send(error)
    //     }
    // }
};

module.exports = elementosController;
