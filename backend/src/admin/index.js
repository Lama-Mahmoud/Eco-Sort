const { Router } = require('express');
const { complain,BioRecycle, nonBioRecycle } = require('./controller/admin');
const router = Router();


router.post('/complain', complain);

router.post('/BioRecycle', BioRecycle);

router.get('/BioRecycle', AllBioRecycle);

router.post('/nonBioRecycle', nonBioRecycle);

router.get('/nonBioRecycle', AllnonBioRecycle);


module.exports = router;