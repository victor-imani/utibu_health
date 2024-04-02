const Drug = require('../models/Drug');

// Create drug
exports.createDrug = async (req, res) => {
  try {
    const newDrug = await Drug.create(req.body);
    res.status(201).json(newDrug);
  } catch (error) {
    console.error('Error creating drug:', error);
    res.status(500).json({ error: 'Failed to create drug' });
  }
};

// Get all drugs
exports.getDrugs = async (req, res) => {
  try {
    const drugs = await Drug.findAll();
    res.status(200).json(drugs);
  } catch (error) {
    console.error('Error fetching drugs:', error);
    res.status(500).json({ error: 'Failed to fetch drugs' });
  }
};
// Get drug by ID
exports.getDrugById = async (req, res) => {
  const { id } = req.params;
  try {
    const drug = await Drug.findByPk(id);
    if (!drug) {
      return res.status(404).json({ error: 'Drug not found' });
    }
    res.status(200).json(drug);
  } catch (error) {
    console.error('Error fetching drug:', error);
    res.status(500).json({ error: 'Failed to fetch drug' });
  }
};

// Update drug
exports.updateDrug = async (req, res) => {
  const { id } = req.params;
  try {
    const [updated] = await Drug.update(req.body, {
      where: { id },
    });
    if (updated) {
      const updatedDrug = await Drug.findByPk(id);
      res.status(200).json(updatedDrug);
    } else {
      throw new Error('Drug not found');
    }
  } catch (error) {
    console.error('Error updating drug:', error);
    res.status(500).json({ error: 'Failed to update drug' });
  }
};

// Delete drug
exports.deleteDrug = async (req, res) => {
  const { id } = req.params;
  try {
    const deleted = await Drug.destroy({
      where: { id },
    });
    if (deleted) {
      res.status(204).send();
    } else {
      throw new Error('Drug not found');
    }
  } catch (error) {
    console.error('Error deleting drug:', error);
    res.status(500).json({ error: 'Failed to delete drug' });
  }
};
