const mongoose = require('mongoose');


const userSchema = new mongoose.Schema({
    first_name: {
        type: String,
        required: true,
        min: 3,
        max: 255,
    },
    last_name: {
        type: String,
        required: true,
        min: 3,
        max: 255,
    },
    email: {
      type: String,
      required: true,
      min: 12,
      max: 255,
      unique: true,
    },
    password: {
      type: String,
      required: true,
      min: 6,
      max: 1024,
    },
    date: {
      type: Date,
      default: Date.now,
    },
    role:{
        type: String,
        required: true,
    },
    // IF the user is an admin this array will be filled with the ids of handled NonBiodegradable wastes
    // IF the user is a recycler or farmer this array will be filled with the ids of 
    //NonBiodegradable wastes Recycling requests issued by them
    NonBiodegradables: [{
      type: mongoose.Schema.Types.ObjectId,
      ref: 'NonBiodegradable'
    }],

    // IF the user is an admin or farmer this array will be filled with the ids of handled Biodegradable wastes
    // IF the user is a recycler this array will be filled with the ids of 
    //Biodegradable wastes Recycling requests issued by them
    Biodegradables: [{
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Biodegradable'
    }],

    // IF the user is an admin this array will be filled with the ids of handled Complains
    // IF the user is a recycler or farmer this array will be filled with the ids of 
    //Complains issued by them
    Complains: [{
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Complain'
    }],
});

module.exports=mongoose.model('User',userSchema);