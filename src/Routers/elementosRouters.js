const express = require('express'); 
const router = express.Router(); 
const elementosController = require('../Controllers/elementosController');

router.get("/", elementosController.visualizar);

router.post("/", elementosController.inserir);

router.delete("/", elementosController.deletar);
router.delete("/:id_elemento", elementosController.deletar);

router.put("/", elementosController.editar);

module.exports = router;