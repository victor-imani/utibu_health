import 'package:get/get.dart';
import 'package:utibu_health/controllers/auth_controller.dart';
import 'package:utibu_health/controllers/drug_controller.dart';
import 'package:utibu_health/controllers/order_controller.dart';
import 'package:utibu_health/controllers/statement_controller.dart';

Future<void> init() async{
   Get.put(AuthController());
   Get.put(StatementController()); // Initialize StatementController
  Get.put(DrugController()); 
   Get.put(OrderController());
}