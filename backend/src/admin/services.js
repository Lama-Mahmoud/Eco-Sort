const NonBiodegradable= require("../../models/NonBiodegradable");
const Complain=require("../../models/Complain")
const Biodegradable= require("../../models/Biodegradable");




async function handlingNonBiodegradable(reqId,admin_id){
    const handleNonbiodegradable= await NonBiodegradable.findByIdAndUpdate(reqId,
        {
            handled:true,
            state:true,
            admin_id:admin_id
        })
    return await handleNonbiodegradable;
}


async function getAllComplains(region)
{
    return await Complain.find({region:region, handled:false});
}

module.exports={
    handlingNonBiodegradable,
    getAllComplains,
}