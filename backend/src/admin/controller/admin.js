const User = require('../../../models/User');
const {handlingNonBiodegradable,getAllComplains}=require('../services');


async function AllComplain(req,res){
    try{
        const getComplaians=await getAllComplains(req.body.region);
        console.log("complains",getComplaians);
        return res.send({complains:getComplaians});

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }
}

async function nonBioRecycle(req, res) {
    try{
        const nonBiodegradableHandling = await handlingNonBiodegradable(req.body._id,req.body.admin_id);

        console.log('Result =>', nonBiodegradableHandling);

        //updating non-biodegradables array for admin
        const updateUser=await User.findByIdAndUpdate(nonBiodegradableHandling.admin_id,
            {$push:{
                Biodegradables:nonBiodegradableHandling._id
            }

            });
        return res.send({ NonBiodegradables: nonBiodegradableHandling._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}


module.exports={
    nonBioRecycle,
    AllComplain
}