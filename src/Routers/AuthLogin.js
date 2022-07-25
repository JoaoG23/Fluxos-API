module.exports = function Auth( req, resp, next ) {
    const token = req.header('authorization-token');
    if(!token) return resp.status(401).send('Proibida a navegacão');
    try {
        const verificaUsuarioToken = jwt.verify(token , process.env.TOKEN_SECRET);
        req.user = verificaUsuarioToken;
        next();

    } catch (error) {
        resp.status(401).send('Acesso Negado');
    }
}