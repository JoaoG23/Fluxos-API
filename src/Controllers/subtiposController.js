const connect = require('../Model/dbconnect');
const services = require('./services');

const subtiposController = {

    tabela:'tb_subtipos',
    colunaID:'idsubtipos',
    colunaDescricao:'descricao_subtipos',

    visualizarTodos: async (req, resp) => {

        try {

            const verRegistro = await services.listAll( subtiposController.tabela );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    visualizarPeloID: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_subtipos;
            const verRegistro = await services.listForID( subtiposController.tabela, subtiposController.colunaID ,idEncontrado );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const tipoAInserir = req.body.nome_subtipos;
            const inserirRegistro = await services.insert( subtiposController.tabela, tipoAInserir );
            resp.json(inserirRegistro);

        } catch (error) {
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_subtipos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_subtipos;
            }

            const registroEncontrado = await services.seExisteRegistro(subtiposController.tabela, subtiposController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( subtiposController.tabela, subtiposController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {
            const idEncontrado = req.body.id_subtipos;
            const nomesubtipos = req.body.nome_subtipos;

            const registroEncontrado = await services.seExisteRegistro( subtiposController.tabela, subtiposController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( subtiposController.tabela, subtiposController.colunaDescricao, nomesubtipos, subtiposController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = subtiposController;
