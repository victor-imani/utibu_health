const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); // If needed
const authRoutes = require('./routes/authRoutes');
const orderRoutes = require('./routes/orderRoutes');
const statementRoutes = require('./routes/statementRoutes');
const drugRoutes = require('./routes/drugRoutes');
const reportRoutes = require('./routes/reportRoutes');
const paymentRoutes = require('./routes/paymentRoutes');

const app = express();

const sequelize = require('./config/index'); // Import Sequelize instance
const User = require('./models/User'); // Import User model

// Sync models with the database
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection to database successful');
    await sequelize.sync(); // Sync all models
    console.log('Models synced with database');
    // Start your server or perform other operations here
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
})();

// Example usage of the User model
// User.create({ name: 'John Doe', email: 'john@example.com', password: 'password123', phone: '1234567890' });
// More operations like findAll, findOne, update, delete, etc. can be performed using User model

// Middleware
app.use(cors()); // Enable CORS if needed
app.use(bodyParser.json());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/orders', orderRoutes);
app.use('/api/statements', statementRoutes);
app.use('/api/drugs', drugRoutes);
app.use('/api/reports', reportRoutes);
app.use('/api/payments', paymentRoutes);

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
