const express = require('express'); 
const router = express.Router(); 
const fluxoCaixaRouter = require('./fluxoCaixaRouters');
const elementosRouters = require('./elementosRouters');
const subelementosRouters = require('./subelementosRouters');
const tiposRouters = require('./tiposRouters');
const subtiposRouters = require('./subtiposRouters');
const minitiposRouters = require('./minitiposRouters');
const nanotiposRouters = require('./nanotiposRouters');
const calculoValoresRouters = require('./calculoValoresRouters');
const loginRouter = require('./loginRouters');

router.use('/fluxo' , fluxoCaixaRouter);
router.use('/elementos', elementosRouters);
router.use('/subelementos', subelementosRouters);
router.use('/tipos', tiposRouters);
router.use('/subtipos', subtiposRouters);
router.use('/minitipos', minitiposRouters);
router.use('/nanotipos', nanotiposRouters);
router.use('/calculos', calculoValoresRouters);
router.use('/auth', loginRouter);

module.exports = router;