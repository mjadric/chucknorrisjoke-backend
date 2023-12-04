// App.js
import React, { useState } from 'react';
import Login from './components/Login';
import Registration from './components/Registration';
import Authentication from './components/Authentication';

const App = () => {
  const [loggedIn, setLoggedIn] = useState(false);
  const [registrationMessage, setRegistrationMessage] = useState('');
  const [token, setToken] = useState('');

  const handleLogin = (receivedToken) => {
    setToken(receivedToken);
    setLoggedIn(true);
    console.log('Received token:', receivedToken);
  };

  const handleRegistration = (message) => {
    setRegistrationMessage(message);
  };

  const handleLogout = () => {
    // Clear token from more persistent storage
    localStorage.removeItem('authToken');
    // Additional logout logic if needed
    setLoggedIn(false);
    setToken('');
  };

  return (
    <div>
      {!loggedIn ? (
        <>
          <Login onLogin={handleLogin} />
          <Registration onRegister={handleRegistration} />
        </>
      ) : (
        <Authentication
          onLogout={handleLogout}
          token={token}
        />
      )}
      {registrationMessage && <p>{registrationMessage}</p>}
    </div>
  );
};

export default App;
