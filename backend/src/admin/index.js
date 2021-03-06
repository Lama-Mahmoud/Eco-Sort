const { Router } = require('express');
const {AllComplain, complain,BioRecycle, nonBioRecycle,AllBioRecycle,AllnonBioRecycle } = require('./controller/admin');
const router = Router();


router.post('/complain', complain);

router.get('/complain', AllComplain);

router.post('/BioRecycle', BioRecycle);

router.get('/BioRecycle', AllBioRecycle);

router.post('/nonBioRecycle', nonBioRecycle);

router.get('/nonBioRecycle', AllnonBioRecycle);


module.exports = router;