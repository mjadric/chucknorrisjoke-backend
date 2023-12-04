const express = require('express');
const controllers = require('./auth');
const joke = require('./jokes')
const { authenticate } = require('./jokes');


const router = express.Router();

router.get('/', controllers.getHome);

router.post('/login', controllers.userLogin); 
router.post('/signup', controllers.userSignUp); 

router.get('/random',authenticate,joke.getJoke)



module.exports = router;