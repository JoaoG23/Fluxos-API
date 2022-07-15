const express = require('express'); 
const router = express.Router(); 
const nanotiposController = require('../Controllers/nanotiposController');

router.get("/", nanotiposController.visualizarTodos);
router.get("/:id_nanotipos", nanotiposController.visualizarPeloID);

router.post("/", nanotiposController.inserir);

router.put("/", nanotiposController.editar);

router.delete("/", nanotiposController.deletar);
router.delete("/:id_nanotipos", nanotiposController.deletar);

module.exports = router;