const { Router } = require('express');
const { complain, nonBioRecycle, biodegradable, AllBioRecycle} = require('./controller/farmer');
const router = Router();


router.post('/complain', complain);

router.post('/NonBiodegradable', nonBioRecycle);

router.post('/biodegradable', biodegradable);

router.get('/BioRecycle', AllBioRecycle);


module.exports = router;