const express = require('express'); 
const router = express.Router(); 
const elementosController = require('../Controllers/elementosController');

router.get("/", elementosController.visualizarTodos);
router.get("/:id_elementos", elementosController.visualizarPeloID);

router.post("/", elementosController.inserir);

router.delete("/", elementosController.deletar);
router.delete("/:id_elementos", elementosController.deletar);

router.put("/", elementosController.editar);
router.put("/:id_elementos", elementosController.editar);

module.exports = router;