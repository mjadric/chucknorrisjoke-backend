import { Sequelize, DataTypes, Model } from 'sequelize';
import * as bcrypt from 'bcrypt';

const sequelize = new Sequelize('user', 'root', 'password', {
  host: 'localhost',
  dialect: 'mysql'
});

sequelize
  .authenticate()
  .then(() => {
    console.log('Connection has been established successfully.');
  })
  .catch((error) => {
    console.error('Unable to connect to the database:', error);
  });

interface UserAttributes {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
}

class User extends Model<UserAttributes> {
  public firstName!: string;
  public lastName!: string;
  public email!: string;
  public password!: string;
 

  public static async beforeCreateHook(user: UserAttributes): Promise<void> {
    const hashedPassword = await bcrypt.hash(user.password, 10);
    user.password = hashedPassword;
  }
}

User.init(
  {
    firstName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lastName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'User',
  }
);

sequelize
  .sync()
  .then(() => {
    console.log('User table created successfully!');
  })
  .catch((error) => {
    console.error('Unable to create table:', error);
  });

export { sequelize, User };