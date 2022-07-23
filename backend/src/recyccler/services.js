const Complain = require('../../models/Complain');
const Biodegradable = require('../../models/Biodegradable');
const NonBiodegradable= require('../../models/NOnBiodegradable');

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

module.exports={
    newComplain,
    newBioRecycle,
    newNnonBioRecycle
}