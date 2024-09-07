const Statement = require('../models/Statement');
const Report = require('../models/Report'); 
const sequelize = require('../config/index');

const generateReport = async () => {
    try {
      const reports = await Statement.findAll({
        attributes: [
          'date',
          'userId',
          [sequelize.fn('GROUP_CONCAT', sequelize.col('description')), 'concatDescription'],
          [sequelize.fn('SUM', sequelize.col('amount')), 'total_amount'],
          'paymentStatus'
        ],
        group: ['date', 'userId'],
        raw: true
      });
  
      // Save report data in the Report model if not already exists
      for (const reportData of reports) {
        // Check if a report already exists with the same identifiers
        const existingReport = await Report.findOne({
          where: {
            date: reportData.date,
            userId: reportData.userId,
            
            
            // Add more conditions if needed
          },
        });
     
        if (!existingReport) {
          // Create a new report only if it doesn't already exist
          await Report.create({
            date: reportData.date,
            userId: reportData.userId,
            description: reportData.concatDescription,
            totalAmount: reportData.total_amount,
            paymentStatus: reportData.paymentStatus
          });
        }
      }
  
      console.log('Report generated successfully.');
    } catch (error) {
      console.error('Error generating report:', error);
    }
  };
  
  const fetchReport = async (userId) => {
    try {
      // Generate new reports first
      await generateReport();
  
      // Fetch reports from the Report table based on userId
      const reports = await Report.findAll({
        where: {
          userId: userId,
          // Add more conditions as needed
        },
      });
  
      // Return the fetched reports
      return reports;
    } catch (error) {
      console.error('Error fetching report:', error);
      throw error;
    }
  };
  
  module.exports = { generateReport, fetchReport };
  