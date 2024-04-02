import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:utibu_health/controllers/auth_controller.dart';
import 'package:utibu_health/models/statement_model.dart';
import 'package:utibu_health/utils/strings.dart';

class StatementController extends GetxController {
  final AuthController authController = Get.find();
  final RxList<Statement> statements = <Statement>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    ever(authController.currentUser, (_) {
      if (authController.currentUser.value != null) {
        fetchStatements();
      }
    });
  }

  Future<void> fetchStatements() async {
    try {
      isLoading.value = true;
      int userId = authController.currentUser.value!.id;
      var response = await http.get(Uri.parse('$baseUrl/api/reports/fetchReports/$userId'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        statements.assignAll(data.map((item) => Statement.fromJson(item)).toList());
        // print(response);
      } else {
        throw Exception('Failed to fetch statements');
      }
    } catch (e) {
      print('Error fetching statements: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
