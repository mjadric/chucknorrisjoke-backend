import React, { useState } from 'react';
import axios from 'axios';

const Registration = ({ onRegister }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [registrationStatus, setRegistrationStatus] = useState('');

  const handleRegistration = async () => {
    try {
      const response = await axios.post('http://127.0.0.1:8800/api/signup', { email, password, firstName, lastName });

      // Check if registration was successful
      if (response.status === 201) {
        const { message } = response.data;
        onRegister(message);
      } else {
        // Set registration status to inform the user
        setRegistrationStatus('User with that email already exists.');
      }
    } catch (error) {
      console.error('Error during registration:', error);
    }
  };

  return (
    <div>
      <h2>Registration</h2>
      {registrationStatus && <p style={{ color: 'red' }}>{registrationStatus}</p>}
      <label>Email:</label>
      <input type="text" value={email} onChange={(e) => setEmail(e.target.value)} />
      <br />
      <label>Password:</label>
      <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
      <br />
      <label>First Name:</label>
      <input type="text" value={firstName} onChange={(e) => setFirstName(e.target.value)} />
      <br />
      <label>Last Name:</label>
      <input type="text" value={lastName} onChange={(e) => setLastName(e.target.value)} />
      <br />
      <button onClick={handleRegistration}>Register</button>
    </div>
  );
};

export default Registration;
