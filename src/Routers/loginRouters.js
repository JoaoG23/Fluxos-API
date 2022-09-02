const express = require('express'); 
const router = express.Router(); 
const usuarioController = require('../Controllers/usuarioController');

router.post("/", usuarioController.logar);
router.post("/registrar", usuarioController.registrar);

module.exports = router;