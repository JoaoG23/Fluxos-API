const express = require('express'); 
const router = express.Router(); 
const tiposController = require('../Controllers/tiposController');

router.get("/", tiposController.visualizarTodos);
router.get("/:id_tipos", tiposController.visualizarPeloID);

router.post("/", tiposController.inserir);

router.put("/", tiposController.editar);
router.put("/:id_tipos", tiposController.editar);

router.delete("/", tiposController.deletar);
router.delete("/:id_tipos", tiposController.deletar);

module.exports = router;