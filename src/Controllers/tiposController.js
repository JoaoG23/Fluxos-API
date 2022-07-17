const connect = require('../Model/dbconnect');
const services = require('./services');

const tiposController = {

    tabela:'tb_tipos',
    colunaID:'id_tipos',
    colunaDescricao:'descricao_tipos',

    visualizarTodos: async (req, resp) => {

        try {

            const verRegistro = await services.listAll( tiposController.tabela );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    visualizarPeloID: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_tipos;
            const verRegistro = await services.listForID( tiposController.tabela, tiposController.colunaID ,idEncontrado );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const tipoAInserir = req.body.nome_tipos;
            const inserirRegistro = await services.insert( tiposController.tabela, tipoAInserir );
            resp.json(inserirRegistro);

        } catch (error) {
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_tipos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_tipos;
            }

            const registroEncontrado = await services.ifExistsRegister(tiposController.tabela, tiposController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( tiposController.tabela, tiposController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {
            const idEncontrado = req.body.id_tipos;
            const nometipos = req.body.nome_tipos;

            const registroEncontrado = await services.ifExistsRegister( tiposController.tabela, tiposController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( tiposController.tabela, tiposController.colunaDescricao, nometipos, tiposController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = tiposController;
