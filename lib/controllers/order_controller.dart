import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:utibu_health/controllers/auth_controller.dart';
import 'package:utibu_health/controllers/drug_controller.dart';
import 'package:utibu_health/models/drug_model.dart';
import 'package:utibu_health/models/order_model.dart';
import 'package:utibu_health/models/user_model.dart';
import 'package:utibu_health/utils/colors.dart';
import 'package:utibu_health/utils/strings.dart';

class OrderController extends GetxController {
  late int userId;

  // OrderController(this.currentUserId); // Constructor to accept current user ID

  // int currentUserId; // Variable to hold current user ID
  User? currentUser;

  // void setCurrentUserId(int userId) {
  //   currentUserId = userId;
  // }

  // Instance of drugController
  final DrugController drugController = Get.find();
  final AuthController authController = Get.find();
  // List to hold available medications
  RxList<Drug> availableMedications = <Drug>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDrugs(); // Call fetchDrugs on initialization
  }

  void fetchDrugs() {
    drugController.fetchDrugs(); // Call fetchDrugs from drugController

    // Listen for changes in drugs list from drugController
    ever(drugController.drugs, (List<Drug>? drugs) {
      if (drugs != null) {
        // Update availableMedications list with fetched drugs
        availableMedications.assignAll(drugs);
        // Refresh the list to notify any listeners
        availableMedications.refresh();
        // print(availableMedications);
      }
    });
  }

  final RxList<Order> orders = <Order>[].obs;
  RxString medicationName = ''.obs;
  RxInt quantity = 0.obs;
  int medicationId = 0;
  RxBool isOrderSuccessful = false.obs;
  var payment = 'Pay Later'.obs;
  var transactionCode = ''.obs;
  RxList<OrderItem> orderItems = <OrderItem>[].obs;
  RxDouble totalCalculatedAmount = 0.0.obs;
  double intermediateAmount = 0.0;
  var calculatedAmount = 0.0.obs;

  // Calculate the total amount based on order items and drug prices
  double calculateAmount() {
    double total = 0;
    for (var item in orderItems) {
      // Fetch drug based on ID from availableMedications
      Drug? selectedDrug =
          availableMedications.firstWhereOrNull((drug) => drug.id == item.id);
      if (selectedDrug != null) {
        total += item.quantity * selectedDrug.pricePerUnit;
      }
    }

    print(total.toString());
    return total;
  }

  // Add order item to the list
  void addOrderItem() {
    if (medicationName.isNotEmpty && quantity.value > 0) {
      // Fetch drug details based on ID
      Drug? selectedDrug = availableMedications
          .firstWhereOrNull((drug) => drug.id == medicationId);
      if (selectedDrug != null) {
        orderItems.add(OrderItem(
          medicationName: selectedDrug.medicationName,
          quantity: quantity.value,
          id: medicationId,
        ));
        intermediateAmount = calculateAmount();

        calculatedAmount.value =
            intermediateAmount.obs.value; // Update observable variable
        // Clear input fields
        medicationName.value = '';
        quantity.value = 0;

        Get.snackbar('Success', 'Item added to order successfully',
            backgroundColor: AppColors.kijaniColor, colorText: Colors.white);
      } else {
        // Show error snackbar if drug details not found
        Get.snackbar('Error', 'Drug details not found',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      // Show error snackbar if fields are empty or invalid
      Get.snackbar('Error', 'Please enter valid medication and quantity',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // Setters for observable variables
  void setMedicationName(String value) => medicationName.value = value;
  void setQuantity(int value) => quantity.value = value;
  void setPayment(String value) => payment.value = value;
  void setTransactionCode(String value) => transactionCode.value = value;
  void setMedicationId(int value) => medicationId = value;

  Future<void> placeOrder() async {
    currentUser = authController.currentUser.value;

    try {
      // Bundle order information
      Order order = Order(
        orderItems: orderItems.toList(),
        userId: currentUser!.id,
        payment: payment.value,
        transactionCode: transactionCode.value,
        amount: calculateAmount(),
      );
      // print(order);
      // Send order request to the server
      // Construct the headers with the JWT token
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': currentUser!.token, // Include the JWT token here
      };

      // Send order request to the server with headers
      var response = await http.post(
        Uri.parse('$baseUrl/api/orders/placeOrder'),
        body: jsonEncode(order.toJson()),
        headers: headers, // Include headers in the request
      );

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        if (data['success'] = true) {
          isOrderSuccessful.value = true;
          // Reset order details
          medicationName.value = '';
          quantity.value = 0;
        } else {
          isOrderSuccessful.value = false;
        }
      } else {
        throw Exception('Failed to place order');
      }
    } catch (e) {
      print('Error placing order: $e');
      isOrderSuccessful.value = false;
    }
  }

  // Remove order item from the list
  void removeOrderItem(int index) {
    if (index >= 0 && index < orderItems.length) {
      orderItems.removeAt(index);
      intermediateAmount = calculateAmount();

      calculatedAmount.value =
          intermediateAmount.obs.value; // Update observable variable
    }
  }
}
