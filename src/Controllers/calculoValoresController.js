const connect = require('../Model/dbconnect');
const services = require('./services');

/**
 * Devido a alguns problemas
 * com as variaveis nao pude 
 * resolver com as variaveis 
 * descricao do problema:
 * 
 * Valores retorna nulos após
 * algumas requests feitas pela API.
 * 
 * @Joao Dev
 */
/*
let mes = new Date().getMonth() + 1;
const ano = new Date().getFullYear();
const coluna = 'cod_elementos_item_fluxo';
const criterio1 = '=';
const idElemento = 3;
const criterio2 = '<';
const tabela = 'tb_subelementos';

*/
const calculoValoresController = {


    verGastoMesAtual: async (req, resp) => {

        try {

            const gastoCalculado = await services.calculatesBasedOnCriteria(
                new Date().getMonth() + 1,
                new Date().getFullYear(),
                'cod_elementos_item_fluxo',
                '=',
                3,
                '<'
            )

            resp.json(gastoCalculado);
        } catch (error) {
            resp.status(404).send(error);
            console.error(error);
        }

    },
    verGanhoMesAtual: async (req, resp) => {

        try {
            const verRegistro = await services.calculatesBasedOnCriteria(
                new Date().getMonth() + 1,
                new Date().getFullYear(),
                'cod_elementos_item_fluxo',
                '=',
                3,
                '>'
            );

            resp.json(verRegistro);

        } catch (error) {
            resp.status(404).send(error)
        }
    },

    verSaldoAtual: async (req, resp) => {

        try {
            const saldoAtual = await services.currentBalance();
            resp.json(saldoAtual);

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
                    i,
                    anoSelecionado,
                    'cod_elementos_item_fluxo',
                    '=',
                    3,
                    '<'
                );
                estoqueMeses.push({ mes: i, verRegistro });
            }
            resp.json(estoqueMeses);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error)
        }

    },

    ganhoUltimos12meses: async (req, resp) => {
        try {
            let anoSelecionado = req.params.ano;

            let estoqueMeses = [];
            for (let i = 1; i < 13; i++) {

                let verRegistro = await services.calculatesBasedOnCriteria(
                    i,
                    anoSelecionado,
                    'cod_elementos_item_fluxo',
                    '=',
                    3,
                    '>'
                );
                estoqueMeses.push({ mes: i, ganho: verRegistro });
            }
            resp.json(estoqueMeses);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }

    },
    gastoPorCriterio: async (req, resp) => {
        try {

            let mesInput = req.params.mes;

            const quantosIds = await services.countFieldForTable('tb_subelementos', 'idsubelementos');
            let estoqueValoresCalculados = [];
            for (let i = 1; i < quantosIds; i++) {

                let verRegistro = await services.calculatesBasedOnCriteriaWithName(
                    new Date().getMonth() + 1,
                    new Date().getFullYear(),
                    'subelementos',
                    '=',
                    i,
                    '<'
                );
                estoqueValoresCalculados.push({ categoria: i, dados: verRegistro });
            }
            resp.json(estoqueValoresCalculados);

        } catch (error) {
            console.error("err", error)
            resp.status(404).send(error)
        }

    },
    ganhoPorCriterio: async (req, resp) => {
        try {
            let mesInput = req.query.mes;

            const quantosIds = await services.countFieldForTable('tb_subelementos', 'idsubelementos'); // Para pesquisa do ultimo ID
            let estoqueValoresCalculados = [];
            for (let i = 1; i < quantosIds; i++) {

                let verRegistro = await services.calculatesBasedOnCriteriaWithName(
                    new Date().getMonth() + 1,
                    new Date().getFullYear(),
                    'subelementos',
                    '=',
                    i,
                    '>'
                );
                estoqueValoresCalculados.push({ categoria: i, dados: verRegistro });
            }
            resp.json(estoqueValoresCalculados);

        } catch (error) {
            console.error("err", error)
            resp.status(404).send(error)
        }

    },

};

module.exports = calculoValoresController;
