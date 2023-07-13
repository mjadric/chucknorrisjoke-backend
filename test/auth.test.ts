import request from 'supertest';
import app from '../src/server';


describe('Authentication API', () => {
  let server: any;
  let port: number;

  beforeAll(() => {
    server = app.listen(0, () => {
      port = server.address().port;
    });
  });


  it('should register a new user', async () => {
    const response = await request(app)
      .post('/auth/signup')
      .send({
        firstName: 'John',
        lastName: 'Doe',
        email: 'tesdt@example.com',
        password: 'password123',
      });

    expect(response.status).toEqual(200);
    expect(response.body).toEqual({ message: 'User successfully registered.' });
  });

  it('should return an error if user with the same email already exists', async () => {
    const response = await request(app)
      .post('/auth/signup')
      .send({
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'tesdt@example.com',
        password: 'password456',
      });

    expect(response.status).toEqual(400);
    expect(response.body).toEqual({ message: 'User with that email already exists.' });
  });

  it('should log in a user with valid credentials', async () => {
    const response = await request(app)
      .post('/auth/login')
      .send({
        email: 'tesdt@example.com',
        password: 'password123',
      });

    expect(response.status).toEqual(200);
    expect(response.body.token).toBeDefined();
  });

  it('should return an error if login credentials are invalid', async () => {
    const response = await request(app)
      .post('/auth/login')
      .send({
        email: 'tesdt@example.com',
        password: 'incorrectPassword',
      });

    expect(response.status).toEqual(400);
    expect(response.body).toEqual({ message: 'Invalid login credentials.' });
  });

  it('should fetch a random joke for an authenticated user', async () => {
    // Register a new user
    await request(app)
      .post('/auth/signup')
      .send({
        firstName: 'John',
        lastName: 'Doe',
        email: 'test@example.com',
        password: 'password123',
      });

    // Log in the user to obtain the token
    const loginResponse = await request(app)
      .post('/auth/login')
      .send({
        email: 'test@example.com',
        password: 'password123',
      });

    const token = loginResponse.body.token;

    // Fetch a random joke using the obtained token
    const jokeResponse = await request(app)
      .get('/jokes/random')
      .set('Authorization', `Bearer ${token}`);

    expect(jokeResponse.status).toEqual(200);
    expect(jokeResponse.body.joke).toBeDefined();
  });

  afterAll((done) => {
    server.close(done);
  });
  
});