const connect = require('../Model/dbconnect');
const services = require('./services');

const subelementosController = {

    tabela:'tb_subelementos',
    colunaID:'idsubelementos',
    colunaDescricao:'descricao_subelementos',

    visualizarTodos: async (req, resp) => {

        try {

            const verRegistro = await services.listAll( subelementosController.tabela );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    visualizarPeloID: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_subelementos;
            const verRegistro = await services.listForID( subelementosController.tabela, subelementosController.colunaID ,idEncontrado );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const novoElemento = req.body.nome_subelementos;
            const inserirRegistro = await services.insert( subelementosController.tabela, novoElemento );
            resp.json(inserirRegistro);

        } catch (error) {
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_subelementos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_subelementos;
            }

            const registroEncontrado = await services.ifExistsRegister( subelementosController.tabela, subelementosController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( subelementosController.tabela, subelementosController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {
            const idEncontrado = req.body.id_subelementos;
            const nomeSubelementos = req.body.nome_subelementos;

            const registroEncontrado = await services.ifExistsRegister( subelementosController.tabela, subelementosController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( subelementosController.tabela, subelementosController.colunaDescricao, nomeSubelementos, subelementosController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = subelementosController;
