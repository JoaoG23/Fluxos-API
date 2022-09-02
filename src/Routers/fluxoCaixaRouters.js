const { json } = require('express');
const express = require('express'); 
const router = express.Router(); 
const fluxoCaixaController = require('../Controllers/fluxoCaixaController');

router.get("/:id", fluxoCaixaController.verItemID);
router.get("/numero/:id", fluxoCaixaController.verItemIDComIdCategoria);
router.get("/", fluxoCaixaController.visualizarTodosItems);

router.post("/", fluxoCaixaController.inserirItem);

router.put("/", fluxoCaixaController.editarItem);

router.delete("/:id", fluxoCaixaController.deletarItem);
router.delete("/", fluxoCaixaController.deletarItem);


module.exports = router;