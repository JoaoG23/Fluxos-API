const connect = require('../Model/dbconnect');
const services = require('./services');


const fluxoController = {

    visualizarTodosItems: async (req, resp) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_ver_todos_todas_tabela_unidas();`; 
            const query = await dbc.query(sql);
            const resposta = query[0][0];
            resp.json(resposta);
        } catch (error) {
            console.log("visualizarTodosItems: ~ error", error)
            resp.status(404).send(error);
        }
    },
    verItemID: async (req, resp) => {

        let idEncontrado = req.params.id;

        try {
            const dbc = await connect();
            const sql = `CALL pr_selecionar_um('vw_todos_dados_fluxocaixa_unificados', 'id_item_fluxo',? );`;

            // valida se ja existe id
            const registroEncontrado = await services.ifExistsRegister("tb_fluxocaixa", "id_item_fluxo", idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const values = [idEncontrado];
            const query = await dbc.query(sql, values);
            const resposta = query[0][0];
            resp.json(resposta);
        } catch (error) {
            resp.status(404).send(error);
        }
    },

    inserirItem: async (req, resp) => {

        try {

            const idElemento = req.body.elemento;
            const subelementos = req.body.subelementos;
            const tipos = req.body.tipos;
            const subtipos = req.body.subtipos;
            const minitipos = req.body.minitipos;
            const nanotipos = req.body.nanotipos;
            const descricao = req.body.descricao;
            const valor = req.body.valor;

            const saldoEmConta = await services.currentBalance();
            const saldoAtual = valor + parseFloat( saldoEmConta.resposta );


            const dbc = await connect();
            const sql = `CALL pr_inserir_fluxocaixa(?, ?, ?, ?, ?, ?, ?, ?, ?);`;
            const values = [
                idElemento,
                subelementos,
                tipos,
                subtipos,
                minitipos,
                nanotipos,
                descricao,
                valor,
                saldoAtual
            ];
            const query = await dbc.query(sql, values);

            const respostaFinal = query[0][0][0].resposta;
            resp.json(respostaFinal)
        } catch (error) {
            resp.status(404).send(error)
        }
    },
    editarItem: async (req, resp) => {

        try {
            const idItemfluxoCaixa = req.body.id;
            const idElemento = req.body.elemento;
            const subelementos = req.body.subelementos;
            const tipos = req.body.tipos;
            const subtipos = req.body.subtipos;
            const minitipos = req.body.minitipos;
            const nanotipos = req.body.nanotipos;
            const descricao = req.body.descricao;
            const valor = req.body.valor;

            // Valida registro Existe
            const registroEncontrado = await services.ifExistsRegister("tb_fluxocaixa", "id_item_fluxo", idItemfluxoCaixa);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const dbc = await connect();

            const atualizaValores = await services.updateCurrentBalance();
            const saldoAtual = atualizaValores.resposta;
            const sql = `CALL pr_editar_fluxocaixa( ?,?, ?, ?, ?, ?, ?, ?, ?, ? );`;
            const values = [
                idItemfluxoCaixa,
                idElemento,
                subelementos,
                tipos,
                subtipos,
                minitipos,
                nanotipos,
                descricao,
                valor,
                saldoAtual
            ];

            const query = await dbc.query(sql, values);

            const respostaFinal = query[0][0][0].resposta;
            resp.json(respostaFinal)
        } catch (error) {
            resp.status(404).json(error)
        }
    },
    deletarItem: async (req, resp) => {

        try {

            let idEncontrado = req.params.id;
            if (!idEncontrado) {
                idEncontrado = req.body.id;
            }
            const dbc = await connect();
            const values = [idEncontrado];

            // valida se ja existe id
            const registroEncontrado = await services.ifExistsRegister("tb_fluxocaixa", "id_item_fluxo", idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarSql = `CALL pr_deletar_fluxocaixa(?);`;
            const queryDeletar = await dbc.query(deletarSql, values);

            const respostaFinal = queryDeletar[0][0][0].resposta;
            resp.json(respostaFinal);
        } catch (error) {
            resp.status(404).send(error)
        }
    }
};

module.exports = fluxoController;
