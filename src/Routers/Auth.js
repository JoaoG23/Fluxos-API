const jwt = require('jsonwebtoken');

const auth = {

    comum:( req, resp, next ) => {
        const token = req.header('authorization-token');
        if(!token) return resp.status(401).send({situacao:false , msg:'Você ainda não está logado..'});
        try {
            const verificaUsuarioToken = jwt.verify(token , process.env.TOKEN_SECRET);
            req.usuario = verificaUsuarioToken;
            next();
    
        } catch (error) {
            resp.status(401).json(error);
        }
    },
    admin:( req, resp, next) => {

        if (req.usuario.admin) {
            next();
        } else {
            resp.status(401).json({situacao:false , msg:'Acesso negado: Você não é administrador..', redirecionar:false });
        }
    }

}

module.exports = auth;
