const { Router } = require('express');
const { signup, login } = require('./controller/user');
const router = Router();


// admin signup is not allowed through the app interface
router.post('/auth/signup', signup);

router.post('/auth/login', login);