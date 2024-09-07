const Order = require('../models/Order');
const Statement = require('../models/Statement');
const Drug = require('../models/Drug');
const Payment = require('../models/Payment');
const sequelize = require('../config/index');


const placeOrder = async (req, res) => {
  const { orderItems, userId, payment, amount } = req.body;

  let transaction;
  try {
    // Start a transaction
    transaction = await sequelize.transaction();

    // Create the order
    const order = await Order.create({ userId: userId,
       medicationName:  orderItems[0].medicationName,
      quantity: orderItems[0].quantity,
      amount: amount, // Calculate order amount based on items
      payment,
    }, { transaction }); 

    // Check if payment is "Pay Now"


    if (payment === 'Pay Now') {
    
      const paymentRecord = await Payment.findOne({
        where: {
          amount: req.body.amount,
          transactionCode: req.body.transactionCode,
        
          // Add more conditions if needed
        },
        // raw: true
      });

    
      console.log('Payment Record:', paymentRecord);
      
      if (paymentRecord) {
        // console.log('Payment Record Found:', paymentRecord.toJSON());
        // Update payment status to Paid
        await order.update({ paymentStatus: 'Paid' }, { transaction });
      } else {
        console.log('No Payment Record Found');
      }      
    }
    // Create statements for each order item
    for (const item of orderItems) {
      const drug = await Drug.findByPk(item.id, { transaction });
      if (!drug || drug.quantity < item.quantity) {
        
        res.status(400).json({ status: false, message: `Drug ${item.medicationName} is not available in sufficient quantity` });
      }

      // Create the corresponding statement
      const statementData = {
        date: new Date(),
        description: `Ordered ${item.quantity} units of ${item.medicationName}`,
        amount: drug.price_per_unit * item.quantity,
        orderId: order.id,
        userId, // Use the userId from req.body
        quantity: item.quantity,
        medicationName: item.medicationName,
        paymentStatus: order.paymentStatus
      };
      await Statement.create(statementData, { transaction });

      // Update the drug quantity
      drug.quantity -= item.quantity;
      await drug.save({ transaction });
    }

    // Commit the transaction
    await transaction.commit();

    res.status(201).json({ status: true, message: 'Order placed successfully', order });
  } catch (error) {
    // Rollback the transaction if any error occurs
    if (transaction) await transaction.rollback();
    // console.log(req.body);
    console.error('Error placing order:', error);
    res.status(500).json({ error: 'Failed to place order' });
    }

};
// Function to calculate order amount based on items

module.exports = { placeOrder };
