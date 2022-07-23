const mongoose = require('mongoose');


const biodegradableSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    image:{
        type:String,
        required:true
    },
    amount:{
        type:Number,
        required:true
    },
    handled:{
        type:Boolean,
        required:true
    },
    state:{
        type:Boolean
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
    beneficiary_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
    },

});


module.exports = mongoose.model('Biodegradable', biodegradableSchema);