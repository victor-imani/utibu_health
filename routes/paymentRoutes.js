// routes/paymentRoutes.js
const express = require('express');
const router = express.Router();
const { createPayment } = require('../controllers/paymentController');

// POST route to create a new payment
router.post('/createPayment', createPayment);

module.exports = router;
