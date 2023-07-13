import express, { Router } from 'express';
import authRoutes from './routes/auth';
import jokesRoutes from './routes/jokes';

const app = express();

app.use(express.json());
app.use('/auth', authRoutes);
app.use('/jokes', jokesRoutes);

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});


export default app;