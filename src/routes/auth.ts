import { Request, Response, Router } from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { User } from '../database';

const router = Router();

// POST /signup endpoint
router.post('/signup', async (req: Request, res: Response) => {
  try {
    const { email, password, firstName, lastName } = req.body;

    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ message: 'User with that email already exists.' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    await User.create({
      email,
      firstName,
      lastName,
      password: hashedPassword,
    });

    res.status(200).json({ message: 'User successfully registered.' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'An error occurred while registering the user.' });
  }
});

// POST /login endpoint
router.post('/login', async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(400).json({ message: 'Invalid login credentials.' });
    }

    const match = await bcrypt.compare(password, user.password);
    if (!match) {
      return res.status(400).json({ message: 'Invalid login credentials.' });
    }

    const token = jwt.sign({ userId: user.email }, 'secret_key', { expiresIn: '1h' });

    res.status(200).json({ token });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'An error occurred while logging in the user.' });
  }
});

export default router;