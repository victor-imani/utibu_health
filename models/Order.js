const { DataTypes } = require('sequelize');
const sequelize = require('../config/index'); 
const Statement = require('./Statement');
const Drug = require('./Drug');

const Order = sequelize.define('Order', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  medicationName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  quantity: {
    type: DataTypes.INTEGER,
    allowNull: false,
    default: 0
  },
  amount: {
    type: DataTypes.FLOAT, // Adjust data type as needed
    allowNull: false,
    defaultValue: 0, // Set a default value if necessary
  },
  payment: {
    type: DataTypes.ENUM('Pay Now', 'Pay Later'),
    allowNull: false, // Allow null if payment is not made yet
  },
  paymentStatus: {
    type: DataTypes.ENUM('Pending', 'Paid'),
    allowNull: false,
    defaultValue: 'Pending', // Default to Pending
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    foreignKey: true
  }
});
// Define association with Statement model (optional)
Order.hasOne(Statement);
Order.belongsToMany(Drug, { through: 'OrderDrug' });
Drug.belongsToMany(Order, { through: 'OrderDrug' });

module.exports = Order;
