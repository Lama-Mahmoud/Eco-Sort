const User = require('../../../models/User');
const {newComplain, newNnonBioRecycle,handlingBiodegradable, getAllBioRequests}=require('../services');

async function complain(req, res) {
    try{
        //adding new Complain 
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
        //adding new Non BIodegradable 
        const nonBioRecycleReq = await newNnonBioRecycle(req.body);

        console.log('Result =>', nonBioRecycleReq);

        //updating non-biodegradables array
        const updateUser=await User.findByIdAndUpdate(nonBioRecycleReq.user_Id,
            {$push:{
                NonBiodegradables:nonBioRecycleReq._id
            }

            });
        return res.send({ NonBiodegradables: nonBioRecycleReq._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}



async function biodegradable(req, res) {
    try{
        
        //taking biodegradables from Recyycler 
        const biodegradableHandling = await handlingBiodegradable(req.body._id, req.body.beneficiary_id);

        console.log('Result =>', biodegradableHandling);

        //updating non-biodegradables array
        const updateUser=await User.findByIdAndUpdate(biodegradableHandling.beneficiary_id,
            {$push:{
                Biodegradables:biodegradableHandling._id
            }

            });
        return res.send({ Biodegradables: biodegradableHandling._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}


async function AllBioRecycle(req,res){
    try{
        const getBio=await getAllBioRequests(req.body.region);
        console.log(req.body.region);
        console.log("Biodegradable",getBio);
        return res.send({Biodegradable:getBio});

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }
}

module.exports={
    complain,
    nonBioRecycle,
    biodegradable,
    AllBioRecycle
}