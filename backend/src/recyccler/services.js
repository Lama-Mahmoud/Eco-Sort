const Complain = require('../../models/Complain');

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


async function newBioRecycle(body){
    
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
    const comp = new Biodegradable({
        name,
        image,
        amount,
        handled,
        region,
        city,
        address,
        user_Id});
    return await comp.save();

}

module.exports={
    newComplain,
    newBioRecycle
}