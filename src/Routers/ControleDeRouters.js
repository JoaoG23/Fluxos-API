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
const usuarioRouter = require('./usuarioRouters');
const loginRouter = require('./loginRouters');

const auth = require('./Auth')

router.use('/fluxo' , auth.comum,  auth.admin, fluxoCaixaRouter);
router.use('/elementos',  auth.comum,  auth.admin, elementosRouters);
router.use('/subelementos', auth.comum,  auth.admin,subelementosRouters);
router.use('/tipos', auth.comum,  auth.admin, tiposRouters);
router.use('/subtipos',  auth.comum,  auth.admin, subtiposRouters);
router.use('/minitipos',  auth.comum,  auth.admin, minitiposRouters);
router.use('/nanotipos', auth.comum,  auth.admin, nanotiposRouters);
router.use('/calculos',  auth.comum,  calculoValoresRouters);
router.use('/usuario', auth.comum,  auth.admin ,usuarioRouter);
router.use('/login', loginRouter);


module.exports = router;