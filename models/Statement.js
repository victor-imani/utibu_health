// models/StatementModel.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/index'); 
const Order = require('./Order');

const Statement = sequelize.define('Statement', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  date: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  description: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  amount: {
    type: DataTypes.FLOAT,
    allowNull: false,
  },
  orderId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    foreignKey: true
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    foreignKey: true
  },
  paymentStatus: {
    type: DataTypes.ENUM('Pending', 'Paid'),
    allowNull: false,
    defaultValue: 'Pending', // Default to Pending
  },
  
});

// Define association with Order model
// Statement.belongsTo(Order);

module.exports = Statement;
