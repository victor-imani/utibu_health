import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:utibu_health/controllers/order_controller.dart';
import 'package:utibu_health/models/user_model.dart';
import 'package:utibu_health/utils/strings.dart';


class AuthController extends GetxController {
// final OrderController orderController = Get.find();
  Rx<User?> currentUser = Rx<User?>(null); // Observable current user

  void setCurrentUser(User user) {
    currentUser.value = user;
    // orderController.setCurrentUserId(user.id); // Pass user ID to OrderController
  }

   Future<bool> signIn(String emailAddress, String password) async {
    try {
      // Make API request to authenticate user
      var response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),
        body: jsonEncode({'email': emailAddress, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body);
        // Assuming setCurrentUser sets the user in some global state
        setCurrentUser(User(
          id: userData['id'],
          name: userData['name'],
          emailAddress: userData['email'],
          phoneNumber: userData['phone'],
          token: userData['token'],
        ));

        return true; // Authentication successful
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      print('Error signing in: $e');
      throw Exception('Error signing in');
    }
     // Default to authentication failed
  }

  Future<bool> signUp(String name, String email, String password, String confirmPass, String phone) async {
    try {
      // Make API request to register user
      var response = await http.post(
        Uri.parse('$baseUrl/api/auth/register'),
        body: jsonEncode({'name': name, 'email': email, 'password': password, 'passwordConfirm': confirmPass,'phone': phone}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // Registration successful
        return true;
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print('Error registering: $e');
      throw Exception('Error registering');
    }
    
  }

  String signOut() {
     currentUser.value = null;
    // signOut implementation as shown before
    return 'success';
  }
}
