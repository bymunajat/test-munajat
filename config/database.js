// config/database.js

const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('data_kepegawaian', 'postgres', 'root', {
  host: 'localhost',
  dialect: 'postgres', 
  port: 5432, 
  logging: false 
});

module.exports = sequelize;
