const connect = require('../Model/dbconnect');
const services = require('./services');

const calculoValoresController = {

    mes: new Date().getMonth() + 1,
    ano: new Date().getFullYear(),
    coluna: 'cod_elementos_item_fluxo',
    criterio1: '=',
    idElemento: 1,
    criterio2: '<',
    tabela:'tb_subelementos',

    verGastoMesAtual: async (req, resp) => {

        try {

            const verRegistro = await services.calculatesBasedOnCriteria(
                calculoValoresController.mes,
                calculoValoresController.ano,
                calculoValoresController.coluna,
                calculoValoresController.criterio1,
                calculoValoresController.idElemento,
                calculoValoresController.criterio2 = '<',
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

    gastoUltimos12meses: async (req, resp) => {
        try {

            let anoSelecionado = req.params.ano;

            let estoqueMeses = [];
           for (let i = 1; i < 13; i++) {
               
               let verRegistro = await services.calculatesBasedOnCriteria(
                   calculoValoresController.mes = i,
                   calculoValoresController.ano = anoSelecionado,
                   calculoValoresController.coluna,
                   calculoValoresController.criterio1,
                   calculoValoresController.idElemento,
                   calculoValoresController.criterio2 = '<'
                   );
                 estoqueMeses.push({ mes:i ,verRegistro });
                }
                resp.json(estoqueMeses);
                
            } catch (error) {
                resp.status(404).send(error)
        }

    },

    ganhoUltimos12meses: async (req, resp) => {
        try {
            let anoSelecionado = req.params.ano;

            let estoqueMeses = [];
           for (let i = 1; i < 13; i++) {
               
               let verRegistro = await services.calculatesBasedOnCriteria(
                   calculoValoresController.mes = i,
                   calculoValoresController.ano || anoSelecionado,
                   calculoValoresController.coluna,
                   calculoValoresController.criterio1,
                   calculoValoresController.idElemento,
                   calculoValoresController.criterio2 = '>'
                   );
                 estoqueMeses.push({ mes:i , ganho:verRegistro });
                }
                resp.json(estoqueMeses);
                
            } catch (error) {
                resp.status(404).send(error)
        }

    },
    gastoPorCriterio: async (req, resp) => {
        try {

            // nome da coluna
            // mes 
            let mesInput = req.params.mes;

            const quantosIds = await services.countFieldForTable('tb_subelementos','idsubelementos');
            let estoqueValoresCalculados = [];
           for (let i = 1; i < quantosIds; i++) {
               
               let verRegistro = await services.calculatesBasedOnCriteriaWithName(
                   calculoValoresController.mes || mesInput,
                   calculoValoresController.ano,
                    calculoValoresController.coluna = 'subelementos',
                    calculoValoresController.criterio1,
                     calculoValoresController.idElemento = i,
                      calculoValoresController.criterio2 = '<'
                      );
                    estoqueValoresCalculados.push({categoria:i ,dados:verRegistro});
                }
                resp.json(estoqueValoresCalculados);
                
            } catch (error) {
                console.error("err", error)
                resp.status(404).send(error)
        }

    },
    ganhoPorCriterio: async (req, resp) => {
        try {
            // nome da coluna
            // mes 
            // coluna de ID 
            let mesInput = req.query.mes;

            const quantosIds = await services.countFieldForTable('tb_subelementos','idsubelementos'); // Para pesquisa do ultimo ID
            let estoqueValoresCalculados = [];
           for (let i = 1; i < quantosIds; i++) {
               
               let verRegistro = await services.calculatesBasedOnCriteriaWithName(
                   calculoValoresController.mes = mesInput,
                   calculoValoresController.ano,
                    calculoValoresController.coluna = 'subelementos',
                    calculoValoresController.criterio1,
                     calculoValoresController.idElemento = i,
                      calculoValoresController.criterio2 = '>'
                      );
                 estoqueValoresCalculados.push({categoria:i ,dados:verRegistro});
                }
                resp.json(estoqueValoresCalculados);
                
            } catch (error) {
                console.error("err", error)
                resp.status(404).send(error)
        }

    },

};

module.exports = calculoValoresController;
