const NonBiodegradable= require("../../models/NonBiodegradable");



async function handlingNonBiodegradable(reqId,admin_id){
    const biodegradable= await NonBiodegradable.findByIdAndUpdate(reqId,
        {
            state:true,
            admin_id:admin_id
        })
    return await biodegradable;
}


module.exports={
    handlingNonBiodegradable,

}