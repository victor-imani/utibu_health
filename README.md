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
   git clone https://github.com/victor-imani/Utibu_Health.git
   ```
2. Navigate to the project directory:
   ```
   cd Utibu_Health
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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter Community
- Hospital partners and medical advisors
- All contributors and supporters of the Utibu Health project
```
