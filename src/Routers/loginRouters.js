const express = require('express'); 
const router = express.Router(); 
const loginController = require('../Controllers/loginController');

router.get("/", loginController.verTodos);

router.post("/", loginController.registrar);

module.exports = router;