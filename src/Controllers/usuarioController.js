const connect = require("../Model/dbconnect");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const services = require("./services");
const { json } = require("express");

const usuarioController = {
  tabela: "tb_login",
  colunaID: "id_login",
  colunaEmail: "email_login",

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

      if (!usuarioEncontrado) {
        resp.status(400).json({situation:false, msg:"Senha ou Usuario incorretos"});
        return;
      }

      const senhaEuserMatch = bcrypt.compareSync(
        senhaUsuario,
        usuarioEncontrado.senha_login
      );

      if (!senhaEuserMatch) {
        resp.status(400).json({situation:false, msg:"Senha ou Usuario incorretos"});
        return;
      }

      const token = jwt.sign(
        {
          id: usuarioEncontrado.id_login,
          email: usuarioEncontrado.email_login,
          admin: usuarioEncontrado.isadmin_login,
        },
        process.env.TOKEN_SECRET,
        { expiresIn: 4000 }
      );

      resp.header("authorization-token", token);
      resp
        .status(202)
        .json({
          usuarioEncontrado,
          situation: true,
          msg: "Usuario logado com sucesso",
          tokenUser: token,
        });
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

  verUmPeloId: async (req, resp) => {
    let idEncontrado = req.params.id;
    try {
      const verTodos = await services.listForID(
        usuarioController.tabela,
        usuarioController.colunaID,
        idEncontrado
      );
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

      console.info(resposta);
      resp.status(201).json(resposta);
    } catch (error) {
      if (error.sqlState == 23000) {
        resp.status(400).send({
          situation: false,
          msg: "Este email ou nome de usuario já existe no sistema ",
        });
        return;
      }
      console.info(error);
      resp.status(400).send(error);
    }
  },

  deletar: async (req, resp) => {
    try {
      let emailUsuario = req.params.id;
      if (!emailUsuario) {
        emailUsuario = req.body.id;
      }

      const deletarUsuario = await services.remove(
        usuarioController.tabela,
        usuarioController.colunaID,
        emailUsuario
      );
      resp.json(deletarUsuario);
    } catch (error) {
      resp.status(400).json(error);
    }
  },

  editar: async (req, resp) => {
    try {
      const dbc = await connect();

      let emailUsuario = req.body.id;
      const nome = req.body.nomeusuario;
      const login = req.body.login;
      const senha = bcrypt.hashSync(req.body.senha);
      const email = req.body.email;
      const tel = req.body.telefone;
      const admin = req.body.admin;

      const verificarSql = `CALL pr_editar_usuario( ? , ? , ? , ? , ? , ?, ? )`;
      const values = [emailUsuario, nome, login, senha, email, tel, admin];
      const queryRegistrar = await dbc.query(verificarSql, values);
      const resposta = queryRegistrar[0][0][0].resposta;

      resp.json(resposta);
    } catch (error) {
      resp.status(400).json(error);
    }
  },

  consultaEmail: async (req, resp) => {
    // Em Breve >>>>>

    // try {
    //   let emailUsuario = req.params.email;
    //   if (!emailUsuario) {
    //     emailUsuario = req.body.email;
    //   }

    //   const seExisteEmail = await services.listForID(
    //     usuarioController.tabela,
    //     usuarioController.colunaEmail,
    //     emailUsuario
    //   );

    //   // Enviar um email com o link
    //   resp.json(seExisteEmail);
    // } catch (error) {
    //   resp.status(400).json(error);
    // }
  },
  esqueciMinhaSenha: async (req, resp) => {

    ///Em Breve >>>>>
    
    // try {
    //   let emailUsuario = req.params.email;
    //   if (!emailUsuario) {
    //     emailUsuario = req.body.email;
    //   }

    //   const seExisteEmail = await services.listForID(
    //     usuarioController.tabela,
    //     usuarioController.colunaEmail,
    //     emailUsuario
    //   );
    //   resp.json(seExisteEmail);
    // } catch (error) {
    //   resp.status(400).json(error);
    // }
  },
};
module.exports = usuarioController;
