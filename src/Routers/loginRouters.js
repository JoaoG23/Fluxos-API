const express = require('express'); 
const router = express.Router(); 
const loginController = require('../Controllers/loginController');

router.get("/", loginController.verTodos);
router.post("/logar", loginController.logar);

router.post("/", loginController.registrar);
router.delete("/:id", loginController.deletar);
router.delete("/", loginController.deletar);
router.put("/", loginController.editar);

module.exports = router;