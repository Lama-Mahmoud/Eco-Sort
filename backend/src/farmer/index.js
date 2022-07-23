const { Router } = require('express');
const { complain,nonBioRecycle} = require('./controller/farmer');
const router = Router();


router.post('/complain', complain);

router.post('/NonBiodegradable', nonBioRecycle);


module.exports = router;