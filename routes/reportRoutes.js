const express = require('express');
const router = express.Router();
const { generateReport, fetchReport } = require('../controllers/reportController');


router.post('/generate', async (req, res) => {
  try {
    await generateReport();
    res.status(200).send('Report generated successfully.');
  } catch (error) {
    console.error('Error generating report:', error);
    res.status(500).send('Error generating report.');
  }
});

// Route to fetch reports based on userId
router.get('/fetchReports/:userId', async (req, res) => {
    const userId = req.params.userId;
  
    try {
      // Call the fetchReport function to get reports for the specified userId
      const reports = await fetchReport(userId);
      res.json(reports);
    } catch (error) {
      console.error('Error fetching reports:', error);
      res.status(500).json({ error: 'Error fetching reports' });
    }
  });

module.exports = router;
