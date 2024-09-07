// models/DrugModel.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/index'); 

const Drug = sequelize.define('Drug', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  type: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  quantity: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  price_per_unit: {
    type: DataTypes.FLOAT,
    allowNull: false,
  },
});

module.exports = Drug;
