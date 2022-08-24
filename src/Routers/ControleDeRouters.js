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

// router.use('/admin/fluxo' , auth.comum,  auth.admin, fluxoCaixaRouter);
router.use('/admin/fluxo' , fluxoCaixaRouter); // Lembre-se de voltar a rota correta.
router.use('/admin/elementos',  auth.comum,  auth.admin, elementosRouters);
router.use('/admin/subelementos', auth.comum,  auth.admin,subelementosRouters);
router.use('/admin/tipos', auth.comum,  auth.admin, tiposRouters);
router.use('/admin/subtipos',  auth.comum,  auth.admin, subtiposRouters);
router.use('/admin/minitipos',  auth.comum,  auth.admin, minitiposRouters);
router.use('/admin/nanotipos', auth.comum,  auth.admin, nanotiposRouters);
router.use('/admin/usuario', auth.comum,  auth.admin ,usuarioRouter);
router.use('/calculos',  auth.comum,  calculoValoresRouters);
router.use('/login', loginRouter);


module.exports = router;