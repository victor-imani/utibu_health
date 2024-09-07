// createOrder.js

const Order = require('../models/Order');
const Statement = require('../models/Statement');
const Drug = require('../models/Drug');
const sequelize = require('../config/index');

const createOrder = async (orderData) => {
  let transaction;
  try {
    // Start a transaction
    transaction = await sequelize.transaction();

    // Create the order
    const order = await Order.create({ 
        userId: orderData.userId,
        
     }, { transaction });

    // Create statements for each order item
    for (const item of orderData.orderItems) {
      const drug = await Drug.findByPk(item.id);
      if (!drug || drug.quantity < item.quantity) {
        throw new Error(`Drug ${item.medicationName} is not available in sufficient quantity`);
      }

      // Calculate the amount for the statement based on drug price and quantity
      const amount = drug.price_per_unit * item.quantity;

      // Create the corresponding statement
      const statementData = {
        date: new Date(), // Use the current date/time
        description: `Ordered ${item.quantity} units of ${item.medicationName}`,
        amount,
        orderId: order.id,
        userId: order.userId,
      };
      await Statement.create(statementData, { transaction });

      // Update the drug quantity
      drug.quantity -= item.quantity;
      await drug.save({ transaction });
    }

    // Commit the transaction
    await transaction.commit();

    // Return the created order
    return order;
  } catch (error) {
    // Rollback the transaction if any error occurs
    if (transaction) await transaction.rollback();
    throw error;
  }
};

module.exports = createOrder;
