require("dotenv").config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const port = 3000;
const userRouter = require('./src/user');
const farmerRouter = require('./src/farmer');
const adminRouter = require('./src/admin');
const recyclerRouter = require('./src/recyccler');

const app = express();

app.use(cors());
app.use(express.json());


const DB_CONNECT = process.env.DB_CONNECT || "";
mongoose.connect(
  DB_CONNECT,
  (err) =>{ 
    if(!err)
    console.log("connected succesfully");
  else
    console.log(err);
}
);


app.use('/api/user', userRouter);
app.use('/api/admin', adminRouter);
app.use('/api/farmer', farmerRouter);
app.use('/api/recycler', recyclerRouter);

app.listen(
    port,
    () => console.log(`Listening on port ${port}`)
  );