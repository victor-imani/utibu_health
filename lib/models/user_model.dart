class User {
  final int id;
  final String name;
  final String emailAddress;
  final String phoneNumber;
  final String token;
  // final String password; // Note: In production apps, consider using encrypted passwords

  User({
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.phoneNumber,
    required this.token,
    // required this.password,
  });
  
}
