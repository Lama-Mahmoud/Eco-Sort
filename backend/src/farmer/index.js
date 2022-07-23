const { Router } = require('express');
const { complain} = require('./controller/farmer');
const router = Router();


router.post('/complain', complain);


module.exports = router;