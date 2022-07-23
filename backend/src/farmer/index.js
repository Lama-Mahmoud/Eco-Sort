const { Router } = require('express');
const { complain,nonBioRecycle} = require('./controller/farmer');
const router = Router();


router.post('/complain', complain);

router.post('/NonBiodegradable', nonBioRecycle);

router.post('/biodegradable', biodegradable);


module.exports = router;