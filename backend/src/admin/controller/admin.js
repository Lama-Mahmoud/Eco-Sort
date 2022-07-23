const User = require('../../../models/User');



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
}