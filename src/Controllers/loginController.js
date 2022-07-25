const connect = require("../Model/dbconnect");
const bcrypt = require("bcryptjs");
const services = require("./services");
const loginController = {
  tabela: "tb_login",
  colunaID: "id_login",
  // colunaDescricao:'descricao_subtipos',
  // Nome, telefone, email, tipo,

  logar: async (req, resp) => {
    // const selectedUser = await  ;
    if (!selectedUser) {
      return resp.status(400).send(" The email or Password incorrect");
    }

    const senhaEuserMatch = bcrypt.compareSync(
      req.body.password,
      selectedUser.password
    );
    if (!senhaEuserMatch) {
      return resp.status(400).send(" The email or Password incorrect");
    }

    const token = jwt.sign(
      { _id: selectedUser._id, admin: selectedUser.admin },
      process.env.TOKEN_SECRET
    ); // Gera token segredo

    // TOKEN em header = chave + valor
    resp.header("authorization-token", token); // Inserer no cabecalho
    resp.send(" User Logged !");
    console.log("User Logged !");
  },

  verTodos: async (req, resp) => {
    try {
    //   const dbc = await connect();
      const verTodos = await services.listAll("tb_login");
      resp.json(verTodos);
    } catch (error) {
      resp.status(400).send(error);
    }

    // // const selectedUser = await  ;
    // if (!selectedUser){ return resp.status(400).send(" The email or Password incorrect")};

    // const senhaEuserMatch = bcrypt.compareSync(req.body.password, selectedUser.password);
    // if(!senhaEuserMatch){
    //     return resp.status(400).send(" The email or Password incorrect");
    // }

    // const token = jwt.sign({_id:selectedUser._id , admin: selectedUser.admin }, process.env.TOKEN_SECRET); // Gera token segredo

    // // TOKEN em header = chave + valor
    // resp.header('authorization-token', token); // Inserer no cabecalho
    // resp.send(" User Logged !");
    // console.log('User Logged !');
  },

  registrar: async (req, resp) => {
    try {
      // const {error} = registerValidate(req.body);
      // if (error) { return resp.status(400).send(error.message); }

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

      // const selectedUser = await User.findOne({email:req.body.email});

      // if (selectedUser) {
      //     return resp.status(400).send(" The email already exists");
      // }

      // const user = new User({
      //     name:req.body.name,
      //     email:req.body.email,
      //     password: bcrypt.hashSync(req.body.password) // Encriptar senha antes de chegar ao banco
      // });

      // const savedUser = await user.save();
      resp.send(resposta);
    } catch (error) {
      if (error.sqlState == 23000) {
        resp
          .status(400)
          .send({
            situation: false,
            msg: "Este email já esta cadastrado no sistema ",
          });
        return;
      }
      resp.status(400).send(error);
    }
  },
  esqueciSenha: async (req, resp) => {},
};
module.exports = loginController;
