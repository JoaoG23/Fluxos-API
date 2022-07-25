module.exports = function auth( req, resp, next ) {
    const token = req.header('authorization-token');
    if(!token) return resp.status(401).send('Proibida a navegacão');
    try {
        const verificaUsuarioToken = jwt.verify(token , process.env.TOKEN_SECRET);
        req.usuario = verificaUsuarioToken;
        next();

    } catch (error) {
        resp.status(401).send('Acesso Negado');
    }
}