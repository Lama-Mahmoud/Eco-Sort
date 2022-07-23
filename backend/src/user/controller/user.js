

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


module.exports={
    signup,}