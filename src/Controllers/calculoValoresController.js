const connect = require('../Model/dbconnect');
const services = require('./services');

const calculoValoresController = {

 
    mes:new Date().getMonth() + 1,
    ano:new Date().getFullYear(),
    coluna:'cod_elementos_item_fluxo',
    criterio1:'=',
    idElemento:1,
    criterio2:'<',

    verGastoMesAtual: async (req, resp) => {

        try {

            const verRegistro = await services.calculatesBasedOnCriteria( 
                calculoValoresController.mes,
                calculoValoresController.ano,
                calculoValoresController.coluna,
                calculoValoresController.criterio1,
                calculoValoresController.idElemento,
                calculoValoresController.criterio2,
                 );

            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },
    verGanhoMesAtual: async (req, resp) => {

        try {
            const verRegistro = await services.calculatesBasedOnCriteria( 
                calculoValoresController.mes,
                calculoValoresController.ano,
                calculoValoresController.coluna,
                calculoValoresController.criterio1,
                calculoValoresController.idElemento,
                calculoValoresController.criterio2 = '>',
                 );

            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    verSaldoAtual: async (req, resp) => {

        try {
            const dbc = await connect();
            const sql = `CALL pr_ver_saldo_atual();`;
            const respostaQuery = await dbc.query(sql);
            const respostaFinal = respostaQuery[0][0][0];

            resp.json(respostaFinal);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const novoElemento = req.body.nome_calculoValores;
            const inserirRegistro = await services.insert( calculoValoresController.tabela, novoElemento );
            resp.json(inserirRegistro);

        } catch (error) {
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_calculoValores;

            if (!idEncontrado) {
                idEncontrado = req.body.id_calculoValores;
            }

            const registroEncontrado = await services.seExisteRegistro(calculoValoresController.tabela, calculoValoresController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( calculoValoresController.tabela, calculoValoresController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {
            const idEncontrado = req.body.id_calculoValores;
            const nomecalculoValores = req.body.nome_calculoValores;

            const registroEncontrado = await services.seExisteRegistro( calculoValoresController.tabela, calculoValoresController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( calculoValoresController.tabela, calculoValoresController.colunaDescricao, nomecalculoValores, calculoValoresController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = calculoValoresController;
