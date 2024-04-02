# Utibu Backend

Utibu Backend is a Node.js server application that serves as the backend for the Utibu Health mobile application. It handles API requests from the Flutter frontend, manages a SQL database using Sequelize, and facilitates the ordering and payment processes for medications.

## Features

- **API Request Handling**: Processes requests from the Flutter frontend.
- **Database Management**: Utilizes Sequelize to interact with a SQL database.
- **Payment Processing**: Manages a payment table with unique transaction codes.
- **Order Management**: Allows users to place orders and view their payment status.

## Getting Started

### Prerequisites

- Node.js
- SQL Database (MySQL, PostgreSQL, etc.)
- Postman (for API testing)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/victor-imani/utibu_backend.git
   ```
2. Navigate to the project directory:
   ```
   cd utibu_backend
   ```
3. Install dependencies:
   ```
   npm install
   ```

### Configuration

1. Create a `.env` file based on the `.env_example` template provided in the repository.
2. Set up your database connection parameters and JWT secrets in the `.env` file.
3. Determine the port number for the server to listen on and set it in the `.env` file.
4. Use ngrok to expose your local server with a public IP and update the `baseUrl` in the `strings.dart` file of the Flutter frontend.

### Running the Server

To start the server, run:

```
npm start
```

### Testing with Postman

Import the provided Postman collection to test the various Express API endpoints. Ensure that you have drugs available in the database to allow for order placement.

### Payment Integration

When a payment is made, the user will receive a transaction code to include in their order request. Update the order's payment status to 'paid' using this code; otherwise, it defaults to 'pending'.

## Contributing

Contributions are welcome! Please read the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

## Acknowledgments

- Node.js Community
- Sequelize Contributors
- All developers and contributors of the Utibu Health project
```

