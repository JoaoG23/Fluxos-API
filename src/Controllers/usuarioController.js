const connect = require("../Model/dbconnect");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const services = require("./services");
const { json } = require("express");

const usuarioController = {
  tabela: "tb_login",
  colunaID: "id_login",
  // colunaDescricao:'descricao_subtipos',
  // Nome, telefone, email, tipo,

  logar: async (req, resp) => {
    try {
      const nomeUsuario = req.body.usuario;
      const senhaUsuario = req.body.senha;
      const verificarExistenciaUsuario = await services.listForName(
        usuarioController.tabela,
        "nomeusuario_login",
        nomeUsuario
      );

      const usuarioEncontrado = verificarExistenciaUsuario[0];

      if (usuarioEncontrado === 0) {
        return resp.status(400).json("Senha ou Usuario incorretos");
      }

      const senhaEuserMatch = bcrypt.compareSync(
        senhaUsuario,
        usuarioEncontrado.senha_login
      );

      if (!senhaEuserMatch) {
        return resp.status(400).json("Senha ou Usuario incorretos");
      }

      const token = jwt.sign(
        {
          id: usuarioEncontrado.id_login,
          email:usuarioEncontrado.email_login,
          admin: usuarioEncontrado.isadmin_login,
        },
        process.env.TOKEN_SECRET,
        { expiresIn:4000 }
      ); 
        
      resp.header("authorization-token", token); 
      resp
        .status(202)
        .json({ situation: true, msg: "Usuario logado com sucesso", tokenUser:token});

    } catch (error) {
      console.error(error);
      resp.status(400).send(error);
    }
  },

  verTodos: async (req, resp) => {
    try {
      const verTodos = await services.listAll("tb_login");
      resp.json(verTodos);
    } catch (error) {
      resp.status(400).send(error);
    }
  },

  registrar: async (req, resp) => {
    try {
      const dbc = await connect();
      const nome = req.body.nomeusuario;
      const login = req.body.login;
      const senha = bcrypt.hashSync(req.body.senha);
      const email = req.body.email;
      const tel = req.body.telefone;

      const verificarSql = `CALL pr_registrar_usuario( ? , ? , ? , ? , ?, 0 )`;
      const values = [nome, login, senha, email, tel];
      const queryRegistrar = await dbc.query(verificarSql, values);
      const resposta = queryRegistrar[0][0][0];

      resp.status(201).json(resposta);
    } catch (error) {
      if (error.sqlState == 23000) {
        resp.status(400).send({
          situation: false,
          msg: "Este email ou nome de usuario já existe no sistema ",
        });
        return;
      }
      resp.status(400).send(error);
    }
  },

  deletar: async (req, resp) => {
    try {
      
      let idUsuario = req.params.id;
      if (!idUsuario) {
        idUsuario = req.body.id;
      }
      
      const deletarUsuario = await services.remove( usuarioController.tabela, usuarioController.colunaID, idUsuario );
      resp.json(deletarUsuario);
    } catch (error) {
      resp.status(400).json(error);
    }
  },

  editar: async (req, resp) => {
    try {
      
      const dbc = await connect();

      let idUsuario = req.body.id;
      const nome = req.body.nomeusuario;
      const login = req.body.login;
      const senha = bcrypt.hashSync(req.body.senha);
      const email = req.body.email;
      const tel = req.body.telefone;
      const admin = req.body.admin;

      const verificarSql = `CALL pr_editar_usuario( ? , ? , ? , ? , ? , ?, ? )`;
      const values = [idUsuario ,nome, login, senha, email, tel, admin];
      const queryRegistrar = await dbc.query(verificarSql, values);
      const resposta = queryRegistrar[0][0][0].resposta;
      

      resp.json(resposta);
    } catch (error) {
      resp.status(400).json(error);
    }
  },


  esqueciSenha: async (req, resp) => {},
};
module.exports = usuarioController;
