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

const auth = require('./Auth')

router.use('/fluxo' , auth.admin, fluxoCaixaRouter);
router.use('/elementos',  auth.admin  ,elementosRouters);
router.use('/subelementos',  auth.admin ,subelementosRouters);
router.use('/tipos',  auth.admin , tiposRouters);
router.use('/subtipos',  auth.admin ,subtiposRouters);
router.use('/minitipos',  auth.admin ,minitiposRouters);
router.use('/nanotipos',  auth.admin ,nanotiposRouters);
router.use('/calculos', auth.comum, calculoValoresRouters);
router.use('/auth', loginRouter);


module.exports = router;