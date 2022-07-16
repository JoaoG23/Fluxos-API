const express = require('express'); 
const router = express.Router(); 
const calculoValoresController = require('../Controllers/calculoValoresController');

router.get("/mesatualgasto", calculoValoresController.verGastoMesAtual);
router.get("/mesatualganho", calculoValoresController.verGanhoMesAtual);
router.get("/saldoatual", calculoValoresController.verSaldoAtual);
// router.get("/:id_calculoValores", calculoValoresController.visualizarPeloID);

// router.post("/", calculoValoresController.inserir);

// router.delete("/", calculoValoresController.deletar);
// router.delete("/:id_calculoValores", calculoValoresController.deletar);

// router.put("/", calculoValoresController.editar);

module.exports = router;