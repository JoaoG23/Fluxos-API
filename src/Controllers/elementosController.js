const connect = require('../Model/dbconnect');
const services = require('./services');

const elementosController = {

 
    tabela:'tb_elementos',
    colunaID:'idelementos',
    colunaDescricao:'descricao_elementos',

    visualizarTodos: async (req, resp) => {

        try {

            const verRegistro = await services.listAll( elementosController.tabela );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    visualizarPeloID: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_elementos;
            const verRegistro = await services.listForID( elementosController.tabela, elementosController.colunaID ,idEncontrado );
            resp.json(verRegistro);

        } catch (error) {

            resp.status(404).send(error)
        }
    },

    inserir: async (req, resp) => {

        try {
            const novoElemento = req.body.nome_elementos;
            const inserirRegistro = await services.insert( elementosController.tabela, novoElemento );
            resp.json(inserirRegistro);

        } catch (error) {
            console.error(error)
            resp.status(404).send(error);
        }
    },
    
    deletar: async (req, resp) => {

        try {
            let idEncontrado = req.params.id_elementos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_elementos;
            }

            const registroEncontrado = await services.ifExistsRegister(elementosController.tabela, elementosController.colunaID, idEncontrado);
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const deletarRegistro = await services.remove( elementosController.tabela, elementosController.colunaID ,idEncontrado );
            resp.json(deletarRegistro);

        } catch (error) {
            console.error(error);
            resp.status(404).send(error);
        }
    },
    
    editar: async (req, resp) => {

        try {

            let idEncontrado = req.params.id_elementos;

            if (!idEncontrado) {
                idEncontrado = req.body.id_elementos;
            }

            const nomeelementos = req.body.nome_elementos;

            const registroEncontrado = await services.ifExistsRegister( elementosController.tabela, elementosController.colunaID, idEncontrado );
            if (registroEncontrado <= 0) {
                resp.status(404).json({ msg: "Esse registro não existe no banco de dados" });
                return;
            }

            const editarRegistro = await services.edit( elementosController.tabela, elementosController.colunaDescricao, nomeelementos, elementosController.colunaID, idEncontrado );
            resp.json(editarRegistro)
        } catch (error) {
            resp.status(404).send(error)
        }
    }

};

module.exports = elementosController;
