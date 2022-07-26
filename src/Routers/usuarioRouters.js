const express = require('express'); 
const router = express.Router(); 
const usuarioController = require('../Controllers/usuarioController');

router.get("/", usuarioController.verTodos);
router.post("/logar", usuarioController.logar);

router.post("/", usuarioController.registrar);
router.delete("/:id", usuarioController.deletar);
router.delete("/", usuarioController.deletar);
router.put("/", usuarioController.editar);

module.exports = router;