const Complain = require('../../models/Complain');
const Biodegradable = require('../../models/Biodegradable');
const NonBiodegradable = require('../../models/NonBiodegradable');



async function newComplain(body){
    
    const{
        factory_name,
        image,
        complain,
        handled,
        region,
        city,
        address,
        user_Id
    }=body
    const comp = new Complain({
        factory_name,
        image,
        complain,
        handled,
        region,
        city,
        address,
        user_Id});
    return await comp.save();

}

async function newNnonBioRecycle(body){
    
    const{
        name,
        image,
        amount,
        handled,
        region,
        city,
        address,
        user_Id
    }=body
    const nonBio = new NonBiodegradable({
        name,
        image,
        amount,
        handled,
        region,
        city,
        address,
        user_Id});
    return await nonBio.save();

}


async function handlingBiodegradable(body){
    console.log(body);
    const reqId=body;
    const biodegradable= await Biodegradable.findByIdAndUpdate(reqId,
        {
            state:true
        })
    return await biodegradable;
}

module.exports={
    newComplain,
    handlingBiodegradable,
    newNnonBioRecycle
}