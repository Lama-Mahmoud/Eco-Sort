const mongoose = require('mongoose');


const complainSchema = new mongoose.Schema({
    factory_name:{
        type:String,
        required:true
    },
    image:{
        type:String,
        required:true
    },
    complain:{
        type:String,
        required:true
    },
    handled:{
        type:Boolean,
        required:true
    },
    address:{
        type:String,
        required:true
    },
    region:{
        type:String,
        required:true
    },
    city:{
        type:String,
        required:true
    },
    user_Id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required:true
    },
    admin_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
    },

});


module.exports = mongoose.model('Complain', complainSchema);