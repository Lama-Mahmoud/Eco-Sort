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

async function handlingBioRecycle(reqId,beneficiary_id){
    const handleBiodegradable= await Biodegradable.findByIdAndUpdate(reqId,
        {
            handled:true,
            state:true,
            beneficiary_id:beneficiary_id
        })
    return await handleBiodegradable;
}


async function getAllComplains(region)
{
    return await Complain.find({region:region, handled:false});
}


async function getAllBioRequests(region)
{
    return await Biodegradable.find({region:region, handled:false});
}


async function getAllNonBioRequests(region)
{
    return await NonBiodegradable.find({region:region, handled:false});
}


module.exports={
    handlingNonBiodegradable,
    getAllComplains,
    getAllBioRequests,
    getAllNonBioRequests,
    handlingBioRecycle,
    
}