const User = require('../../../models/User');
const {newComplain,newBioRecycle}=require('../services');


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

async function BioRecycle(req, res) {
    try{
        const BioRecycleReq = await newBioRecycle(req.body);

        console.log('Result =>', BioRecycleReq);

        //updating biodegradables array
        const updateUser=await User.findByIdAndUpdate(BioRecycleReq.user_Id,
            {$push:{
                Biodegradables:BioRecycleReq._id
            }

            });
        return res.send({ Biodegradable: BioRecycleReq._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}

module.exports={
    complain,
    BioRecycle
}
