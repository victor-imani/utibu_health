// controllers/paymentController.js
const Payment = require('../models/Payment');

const createPayment = async (req, res) => {
  try {
    const { transactionCode, amount } = req.body;
    const payment = await Payment.create({ transactionCode, amount });
    res.status(201).json({ message: 'Payment created successfully', payment });
  } catch (error) {
    console.error('Error creating payment:', error);
    res.status(500).json({ error: 'Failed to create payment' });
  }
};

module.exports = { createPayment };
