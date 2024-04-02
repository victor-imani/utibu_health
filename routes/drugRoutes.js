const express = require('express');
const router = express.Router();
const drugController = require('../controllers/drugController');

// Define routes
router.post('/', drugController.createDrug);
router.get('/', drugController.getDrugs);
router.get('/:id', drugController.getDrugById);
router.put('/:id', drugController.updateDrug);
router.delete('/:id', drugController.deleteDrug);

module.exports = router;
