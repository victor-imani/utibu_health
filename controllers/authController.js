const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User'); 

// Login controller
const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ where: { email: email } });

    if (!user) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
    // Generate JWT token
    const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET, { expiresIn: '1d' });
    res.status(200).json({ message: 'Login successful', token, phone: user.phone, email: user.email, id: user.id, name: user.name });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Login failed' });
  }
};

// Register controller
const register = async (req, res) => {
  try {
    const { name, email, password, phone, passwordConfirm } = req.body;
    // Hash password
    if (passwordConfirm === password){
    const hashedPassword = await bcrypt.hash(password, 10);
    // Create user
    const user = await User.create({ name, email, password: hashedPassword, phone });
    res.status(201).json({ message: 'User registered successfully', user });
    }
    else{
      res.status(400).json({status: false, message: "Passwords don't match"});
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
};

module.exports = { login, register };
