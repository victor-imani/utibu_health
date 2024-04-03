const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');
// const { verifyToken } = require('../middleware/verifyToken');
// POST /placeOrder
router.post('/placeOrder', orderController.placeOrder);

module.exports = router;
