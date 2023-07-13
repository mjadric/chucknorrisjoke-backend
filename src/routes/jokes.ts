import { Request, Response, Router } from 'express';
import jwt from 'jsonwebtoken';
import axios from 'axios';
import nodemailer from 'nodemailer';
import { User } from '../database';

const router = Router();

interface AuthenticatedRequest extends Request {
  userId?: string;
}

// Middleware for authentication - verifies the validity of JWT token
function authenticate(req: AuthenticatedRequest, res: Response, next: () => void) {
  try {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
      return res.status(401).json({ message: 'Invalid JWT token.' });
    }

    const decodedToken = jwt.verify(token, 'secret_key') as { userId: string };
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

// Send email using Nodemailer
/*async function sendEmail(to: string, subject: string, text: string) {
  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
      user: 'your_email@gmail.com',
      pass: 'your_email_password',
    },
  });

  const mailOptions = {
    from: 'your_email@gmail.com',
    to,
    subject,
    text,
  };

  await transporter.sendMail(mailOptions);
}
*/
// Add a new endpoint for fetching a random joke
router.get('/random', authenticate, async (req: AuthenticatedRequest, res: Response) => {
  try {
    // Fetch a random joke
    const joke = await fetchRandomJoke();

    // Fetch the logged-in user's details from the database
    const userId = req.userId;
    const user = await User.findOne({ where: { email: userId } });

    if (!user) {
      return res.status(404).json({ message: 'User not found.' });
    }

    // Sending the joke to the logged-in user's email using Nodemailer
    //await sendEmail(user.email, 'Chuck Norris Joke', joke);

    res.status(200).json({ joke });
  } catch (error) {
    console.error('Error fetching or sending joke:', error);
    res.status(500).json({ message: 'An error occurred while fetching or sending the joke.' });
  }
});

export default router;