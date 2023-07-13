Chuck Norris Joke App

This project is an example implementation of an application to fetch and send random Chuck Norris jokes via email.

## Setup:

Clone the repository to your computer using the command:
git clone https://github.com/mjadric/chucknorrisjoke-backend.git

Navigate to the project directory:
cd chucknorrisjoke-backend

Install the project dependencies:
npm install

## Configuration

1. In the `src/database.ts` file, verify the settings for connecting to the database. Currently, it is using a MySQL database with the following settings:
- Username: root
- Password: password
- Host: localhost
- Dialect: mysql

2. In the `src/routes/auth.ts` file, adjust the `secret_key` for generating and verifying JWT tokens.

3. In the `src/routes/jokes.ts` file, if you want to use email sending for the joke, uncomment the code that uses Nodemailer and adjust the email settings (Gmail username and password). Currently, this part of the code is commented out.

## Building

To build the project and generate JavaScript files, run the following command:
npm run build

This will compile the TypeScript files and place the resulting JavaScript files in the dist directory.

Make sure to run the build command before starting the application or running tests, as it ensures that the JavaScript files are up-to-date and ready for execut

## Usage

Start the application using the following command:
npm start
The application will run on port 3000.

## Endpoints

- **POST /auth/signup**: Register a new user with first name, last name, email, and password.

- **POST /auth/login**: Verify user credentials and generate a JWT token.

- **GET /jokes/random**: Fetch a random Chuck Norris joke for an authenticated user (requires JWT token attached).

## Testing

To run the tests, execute the following command:
npm test

## Dependencies

- Express: 4.18.2
- Sequelize: 6.32.1
- Axios: 1.4.0
- Bcrypt: 5.1.0
- Jsonwebtoken: 9.0.1
- Mysql2: 3.5.0
- Nodemailer: 6.9.3

## License

This project is licensed under the ISC License.

