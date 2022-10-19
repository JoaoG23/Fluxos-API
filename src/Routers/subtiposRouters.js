const express = require('express'); 
const router = express.Router(); 
const subtiposController = require('../Controllers/subtiposController');

router.get("/", subtiposController.visualizarTodos);
router.get("/:id_subtipos", subtiposController.visualizarPeloID);

router.post("/", subtiposController.inserir);

router.put("/", subtiposController.editar);
router.put("/:id_subtipos", subtiposController.editar);

router.delete("/", subtiposController.deletar);
router.delete("/:id_subtipos", subtiposController.deletar);

module.exports = router;