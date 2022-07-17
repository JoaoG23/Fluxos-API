const express = require('express'); 
const router = express.Router(); 
const calculoValoresController = require('../Controllers/calculoValoresController');

router.get("/mesatualgasto", calculoValoresController.verGastoMesAtual);
router.get("/mesatualganho", calculoValoresController.verGanhoMesAtual);
router.get("/saldoatual", calculoValoresController.verSaldoAtual);
router.get("/gastoultimo12/:ano", calculoValoresController.gastoUltimos12meses);
router.get("/ganhoultimo12/:ano", calculoValoresController.ganhoUltimos12meses);
router.get("/gastosubelementos", calculoValoresController.gastoPorCriterio);
router.get("/ganhosubelementos", calculoValoresController.ganhoPorCriterio);

module.exports = router;