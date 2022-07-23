const User = require('../../../models/User');
const {newComplain, newNnonBioRecycle}=require('../services');

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


async function nonBioRecycle(req, res) {
    try{
        const nonBioRecycleReq = await newNnonBioRecycle(req.body);

        console.log('Result =>', nonBioRecycleReq);

        //updating non-biodegradables array
        const updateUser=await User.findByIdAndUpdate(nonBioRecycleReq.user_Id,
            {$push:{
                NonBiodegradables:nonBioRecycleReq._id
            }

            });
        return res.send({ NonBiodegradable: nonBioRecycleReq._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}

module.exports={
    complain,
    nonBioRecycle,

}