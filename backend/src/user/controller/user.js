const {  addUser,getByEmail}=require('../services');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const TOKEN_SECRET = process.env.TOKEN_SECRET || "";

async function signup(req, res) {
    try {
        console.log(req.body);
        
        //hashing password
        const salt = await bcrypt.genSalt(10);
        const hashPassword = await bcrypt.hash(req.body.password, salt);
    
        const addUserResult = await addUser(req.body, hashPassword);
        console.log('addUserResult =>', addUserResult);
        
        return res.send({ user: addUserResult._id });
      } catch (error) {
        console.log(error);
      }
}


async function login(req, res) {
    try {
        const user = await getByEmail(req.body.email);
        if (!user) return res.status(400).send('invalid credentials');
    
        // password comparison
        const validPassword = await bcrypt.compare(req.body.password, user.password);
        if (!validPassword) return res.status(400).send('invalid credentials');
    
        const token = jwt.sign(
          {_id: user._id, name: user.name, email: user.email},
          TOKEN_SECRET
        );
    
        return res.header('auth-token', token).send({authToken:token,
           id:user._id,
           region:user.region,
           city:user.city,
           role:user.role});
      } catch (error) {
        console.log(error);
        res.status(500).send(error);
      }
}


module.exports={
    signup,
    login
}