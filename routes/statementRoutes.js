const express = require('express');
const router = express.Router();
const statementController = require('../controllers/statementController');

// GET /statements
router.get('/', statementController.fetchStatements);

module.exports = router;
