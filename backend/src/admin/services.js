const NonBiodegradable= require("../../models/NonBiodegradable");



async function handlingNonBiodegradable(reqId,admin_id){
    const biodegradable= await NonBiodegradable.findByIdAndUpdate(reqId,
        {
            handled:true,
            state:true,
            admin_id:admin_id
        })
    return await biodegradable;
}


async function getAllComplains(body)
{
    const region=body.region;
    return await Complain.find({region:region, handled:false});
}

module.exports={
    handlingNonBiodegradable,
    getAllComplains,
    d
}