// Authentication.js
import React, { useState } from 'react';
import axios from 'axios';

const Authentication = ({ onLogout, token }) => {
  const [joke, setJoke] = useState('');

  const handleGetJoke = async () => {
    try {
      const response = await axios.get('http://127.0.0.1:8800/api/random', {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.status === 200) {
        const { joke } = response.data;
        setJoke(joke);
      }
    } catch (error) {
      console.error('Error getting a joke:', error);
    }
  };

  return (
    <div>
      <h2>Welcome!</h2>
      <p>Your Token:</p>
      <textarea rows="4" cols="50" value={token} readOnly></textarea>
      <br />
      <button onClick={onLogout}>Logout</button>
      <br />
      <button onClick={handleGetJoke}>Get a Joke</button>
      {joke && (
        <div>
          <h3>Here's a Joke for You:</h3>
          <p>{joke}</p>
        </div>
      )}
    </div>
  );
};

export default Authentication;
