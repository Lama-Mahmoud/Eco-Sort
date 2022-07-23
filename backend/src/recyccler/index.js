const { Router } = require('express');
const { complain,BioRecycle, nonBioRecycle } = require('./controller/recycler');
const router = Router();


router.post('/complain', complain);

router.post('/BioRecycle', BioRecycle);

router.post('/nonBioRecycle', nonBioRecycle);


module.exports = router;