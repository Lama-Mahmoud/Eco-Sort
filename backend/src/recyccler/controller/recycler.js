const User = require('../../../models/User');
const {newComplain}=require('../services');


async function complain(req, res) {
    try{
        const fileComplain = await newComplain(req.body);

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

async function BioRecycle(req, res) {
    try{
        const BioRecycleReq = await newBioRecycle(req.body);

        console.log('Result =>', BioRecycleReq);
        const updateUser=await User.findByIdAndUpdate(BioRecycleReq.user_Id,
            {$push:{
                Biodegradables:BiodegradablesReq._id
            }

            });
        return res.send({ complain: BioRecycleReq._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}

module.exports={
    complain,
    BioRecycle
}
