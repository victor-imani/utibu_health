const Statement = require('../models/Statement');

// Fetch statements controller
// Modify fetchStatements function to fetch orders/statements by user ID
const fetchStatements = async (req, res) => {
    try {
      const userId = req.params.userId; // Assuming user ID is passed in the request
      // Fetch statements/orders by user ID
      const statements = await Statement.findAll({
        include: [{ model: Order, where: { userId: userId } }],
      });
      res.status(200).json(statements);
    } catch (error) {
      console.error('Error fetching statements:', error);
      res.status(500).json({ error: 'Failed to fetch statements' });
    }
  };
  

module.exports = { fetchStatements };
