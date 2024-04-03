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

# Utibu Health

Utibu Health is a mobile application prototype developed using Flutter. It enables patients to remotely access a hospital's drug database, order required medications, and optionally make payments. The app also provides users with the ability to view their order history, serving as a digital statement of their transactions.

## Features

- **Drug Database Access**: Users can browse through a comprehensive list of available drugs.
- **Remote Drug Ordering**: Place orders for medications directly from the app.
- **Optional Payment Integration**: Make payments for orders within the app.
- **Order History**: View a history of all drug orders and transactions.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio or Visual Studio Code with Flutter plugins
- An Android or iOS device or emulator

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/victor-imani/utibu_health.git
   ```
2. Navigate to the project directory:
   ```
   cd utibu_Health
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

### Configuration

In the `lib/utils/strings.dart` file, change the `baseUrl` to match the URL of the localhost you expose using ngrok:

```dart
const String baseUrl = 'http://<your-ngrok-url>';
```

This is necessary because the app will likely be connecting to a backend server running on your local machine, which does not have a public IP address.

### Building APK

To generate an APK for Android:

1. Run the following command in your terminal:
   ```
   flutter build apk
   ```
2. Once the build is complete, you'll find the APK at `build/app/outputs/flutter-apk/app-release.apk`.

### Running Tests

To run all unit and widget tests, use the following command:

```
flutter test
```

## Contributing

Contributions are welcome! Please read the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

## Acknowledgments

- Flutter Community
- Hospital partners and medical advisors
- All contributors and supporters of the Utibu Health project
```
