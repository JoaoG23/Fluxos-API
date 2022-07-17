const connect = require('../Model/dbconnect');
const services = require('./services');

const minitiposController = {

    tabela:'tb_minitipos',
    colunaID:'id_minitipos',
    colunaDescricao:'descricao_minitipos',

    visualizarTodos: async (req, resp) => {

        try {

            const verRegistro = await services.listAll( minitiposController.tabela );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    visualizarPeloID: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_minitipos;
            const verRegistro = await services.listForID( minitiposController.tabela, minitiposController.colunaID ,idEncontrado );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const tipoAInserir = req.body.nome_minitipos;
            const inserirRegistro = await services.insert( minitiposController.tabela, tipoAInserir );
            resp.json(inserirRegistro);

        } catch (error) {
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_minitipos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_minitipos;
            }

            const registroEncontrado = await services.ifExistsRegister(minitiposController.tabela, minitiposController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( minitiposController.tabela, minitiposController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {
            const idEncontrado = req.body.id_minitipos;
            const nomeminitipos = req.body.nome_minitipos;

            const registroEncontrado = await services.ifExistsRegister( minitiposController.tabela, minitiposController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( minitiposController.tabela, minitiposController.colunaDescricao, nomeminitipos, minitiposController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = minitiposController;
