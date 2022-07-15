const express = require('express'); 
const router = express.Router(); 
const subelementosController = require('../Controllers/subelementosController');

router.get("/", subelementosController.visualizarTodos);
router.get("/:id_subelementos", subelementosController.visualizarPeloID);

router.post("/", subelementosController.inserir);

router.put("/", subelementosController.editar);

router.delete("/", subelementosController.deletar);
router.delete("/:id_subelementos", subelementosController.deletar);

module.exports = router;