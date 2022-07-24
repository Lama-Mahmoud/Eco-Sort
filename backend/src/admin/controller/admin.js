const User = require('../../../models/User');
const {handlingNonBiodegradable,getAllComplains, getAllBioRequests}=require('../services');


async function AllComplain(req,res){
    try{
        const getComplaians=await getAllComplains(req.body.region);
        console.log(req.body.region);
        console.log("complains",getComplaians);
        return res.send({complains:getComplaians});

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



async function AllnonBioRecycle(req,res){
    try{
        const getNonBio=await getAllNonBioRequests(req.body.region);
        console.log(req.body.region);
        console.log("Biodegradable",getNonBio);
        return res.send({Biodegradable:getNonBio});

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
    AllComplain,
    AllBioRecycle,
    AllnonBioRecycle
}