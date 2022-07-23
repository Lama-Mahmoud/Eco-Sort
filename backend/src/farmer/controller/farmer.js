const User = require('../../../models/User');

async function complain(req, res) {
    try{
        const fileComplain = await newComplain(req.body);

        //updating Complains array
        console.log('Result =>', fileComplain);
        const updateUser=await User.findByIdAndUpdate(fileComplain.user_Id,
            {$push:{
                Complains:fileComplain._id
            }

            });
        return res.send({ complain: fileComplain._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}

module.exports={
    complain
}