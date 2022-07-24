const User = require('../../../models/User');
const {
    handlingNonBiodegradable,
    getAllComplains,
    getAllBioRequests,
    getAllNonBioRequests,
    handlingBioRecycle,
    handlingBioRecycle}=require('../services');


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
        //handling a nonBiodegradable Recycle request
        const nonBiodegradableHandling = await handlingNonBiodegradable(req.body._id,req.body.admin_id);

        console.log('Result =>', nonBiodegradableHandling);

        //updating non-biodegradables array for admin
        const updateUser=await User.findByIdAndUpdate(nonBiodegradableHandling.admin_id,
            {$push:{
                NonBiodegradables:nonBiodegradableHandling._id
            }

            });
        return res.send({ NonBiodegradables: nonBiodegradableHandling._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}


async function complain(req, res) {
    try{
        //handling a Complain
        const EditComplain = await handlingComplain(req.body._id,req.body.admin_id);

        console.log('Result =>', EditComplain);

        //updating Complains array for admin
        const updateUser=await User.findByIdAndUpdate(EditComplain.admin_id,
            {$push:{
                Complains:EditComplain._id
            }

            });
        return res.send({ Complains: EditComplain._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}


async function BioRecycle(req, res) {
    try{
        //handling a Biodegradable Recycle request
        const EditBioRecycle = await handlingBioRecycle(req.body._id,req.body.beneficiary_id);

        console.log('Result =>', EditBioRecycle);

        //updating Biodegaradles array for admin
        const updateUser=await User.findByIdAndUpdate(EditBioRecycle.beneficiary_id,
            {$push:{
                Biodegradables:EditBioRecycle._id
            }

            });
        return res.send({ Biodegradable: EditBioRecycle._id });

    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }

}

module.exports={
    nonBioRecycle,
    AllComplain,
    AllBioRecycle,
    AllnonBioRecycle,
    complain,
    BioRecycle
}