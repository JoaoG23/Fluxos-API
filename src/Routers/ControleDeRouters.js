const express = require('express'); 
const router = express.Router(); 
const fluxoCaixaRouter = require('./fluxoCaixaRouters');
const elementosRouters = require('./elementosRouters');

router.use('/fluxo' , fluxoCaixaRouter);
router.use('/elementos', elementosRouters);

module.exports = router;