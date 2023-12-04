const express = require('express');
const jwt = require('jsonwebtoken');
const axios = require('axios');
const db = require('./database');

const router = express.Router();

// Middleware for authentication - verifies the validity of JWT token
function authenticate(req, res, next) {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    console.log('JWT Token:', token);


    if (!token) {
      return res.status(401).json({ message: 'Invalid JWT token.' });
    }

    const decodedToken = jwt.verify(token, 'secret_key');
    console.log('Decoded Token:', decodedToken);
    
    req.userId = decodedToken.userId;
    next();
  } catch (error) {
    console.error(error);
    res.status(401).json({ message: 'Invalid JWT token.' });
  }
}

// Fetch a random joke from the Chuck Norris API
async function fetchRandomJoke() {
  const chuckNorrisAPI = 'https://api.chucknorris.io/jokes/random';
  const response = await axios.get(chuckNorrisAPI);
  return response.data.value;
}

const getJoke = async (req, res) => {
  try {
    // Fetch a random joke
    const joke = await fetchRandomJoke();

    // Fetch the logged-in user's details from the database
    const userId = req.userId;
    console.log('User ID:', userId);

    const [results] = await db.promise().query('SELECT * FROM account WHERE email = ?', [userId]);
    console.log('Database query results:', results);

    if (results.length === 0) {
      return res.status(404).json({ message: 'User not found.' });
    }

    const user = results[0];
    console.log('User data from the database:', user);


    res.status(200).json({ joke });
  } catch (error) {
    console.error('Error fetching or sending joke:', error);
    res.status(500).json({ message: 'An error occurred while fetching or sending the joke.' });
  }
};

module.exports = { getJoke, authenticate };
