const Complain = require('../../models/Complain');
const Biodegradable = require('../../models/Biodegradable');


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

}