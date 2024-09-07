// models/Payment.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/index');

const Payment = sequelize.define('Payment', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  transactionCode: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  amount: {
    type: DataTypes.FLOAT,
    allowNull: false,
  },
  date: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
});

module.exports = Payment;
