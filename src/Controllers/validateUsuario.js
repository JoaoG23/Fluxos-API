const Joi = require('joi');


const registerValidate = ( data ) => {
    const schema = Joi.object({
        nomeusuario: Joi.string().required().min(3).max(50),
        login: Joi.string().required().min(6).max(50),
        senha: Joi.string().required().min(6).max(50),
        email: Joi.string().required().max(50),
        telefone: Joi.string().required().min(6).max(50),
    })
    return schema.validate(data);
}
const editValidate = ( data ) => {
    const schema = Joi.object({
        
        id: Joi.number().required(),
        nomeusuario: Joi.string().required().min(3).max(50),
        login: Joi.string().required().min(6).max(50),
        senha: Joi.string(),
        email: Joi.string().required().min(6).max(50),
        telefone: Joi.string().required().max(50),
        admin: Joi.boolean()
    })
    return schema.validate(data);
}

const loginValidate = ( data ) => {
    const schema = Joi.object({
        usuario: Joi.string().required().min(6).max(50),
        senha: Joi.string().required().min(6).max(50),
    })
    return schema.validate(data);
}


module.exports.loginValidate = loginValidate;
module.exports.registerValidate = registerValidate;
module.exports.editValidate = editValidate;