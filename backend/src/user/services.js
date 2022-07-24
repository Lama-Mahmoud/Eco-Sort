const User = require('../../models/User');

async function addUser(body, hashPassword) {
    
    const {
        first_name,
        last_name,
        email,
        role,
        region,
        city

    } = body;
  
    const user = new User({
        first_name,
        last_name,
        email,
        role,
        region,
        city,
        password: hashPassword
    });
  
    return await user.save();
  }


  //for Login
async function getByEmail(email) {
    return await User.findOne({
      email
    });
  }

  
module.exports={
    addUser,
    getByEmail}
