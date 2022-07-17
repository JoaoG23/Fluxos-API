const connect = require('../Model/dbconnect');
const services = require('./services');

const nanotiposController = {

    tabela:'tb_nanotipos',
    colunaID:'id_nanotipos',
    colunaDescricao:'descricao_nanotipos',

    visualizarTodos: async (req, resp) => {

        try {

            const verRegistro = await services.listAll( nanotiposController.tabela );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    visualizarPeloID: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_nanotipos;
            const verRegistro = await services.listForID( nanotiposController.tabela, nanotiposController.colunaID ,idEncontrado );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const tipoAInserir = req.body.nome_nanotipos;
            const inserirRegistro = await services.insert( nanotiposController.tabela, tipoAInserir );
            resp.json(inserirRegistro);

        } catch (error) {
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_nanotipos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_nanotipos;
            }

            const registroEncontrado = await services.ifExistsRegister(nanotiposController.tabela, nanotiposController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( nanotiposController.tabela, nanotiposController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {
            const idEncontrado = req.body.id_nanotipos;
            const nomenanotipos = req.body.nome_nanotipos;

            const registroEncontrado = await services.ifExistsRegister( nanotiposController.tabela, nanotiposController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( nanotiposController.tabela, nanotiposController.colunaDescricao, nomenanotipos, nanotiposController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = nanotiposController;
