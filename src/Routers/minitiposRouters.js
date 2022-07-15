const express = require('express'); 
const router = express.Router(); 
const minitiposController = require('../Controllers/minitiposController');

router.get("/", minitiposController.visualizarTodos);
router.get("/:id_minitipos", minitiposController.visualizarPeloID);

router.post("/", minitiposController.inserir);

router.put("/", minitiposController.editar);

router.delete("/", minitiposController.deletar);
router.delete("/:id_minitipos", minitiposController.deletar);

module.exports = router;