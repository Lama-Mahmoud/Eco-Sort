const User = require('../../models/User');

async function addUser(body, hashPassword) {
    
    const {
        first_name,
        lasst_name,
        email,
        role,
        region,
        city,
        DOB

    } = body;
  
    const user = new User({
        first_name,
        lasst_name,
        email,
        role,
        region,
        city,
        DOB,
        password: hashPassword
    });
  
    return await user.save();
  }

  
module.exports={
    addUser,}
