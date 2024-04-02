import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utibu_health/controllers/order_controller.dart';
import 'package:utibu_health/models/drug_model.dart';
import 'package:utibu_health/utils/app_style.dart';
import 'package:utibu_health/utils/colors.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderController orderController = Get.find();

  bool isTransactionCodeVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Screen',
          style: appStyle(20.sp, Colors.black, FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Place Your Order:',
                style: appStyle(20.sp, Colors.black, FontWeight.normal),
              ),
              // SizedBox(height: 20.h),
              // Dropdown for Medication Name (fetch from Drug model)
              Obx(
                () => DropdownButtonFormField<String>(
                  value: orderController.medicationName.isNotEmpty
                      ? orderController.medicationName.value
                      : null, // Set to the current medication name if not empty, otherwise null
                  items: orderController.availableMedications.isNotEmpty
                      ? orderController.availableMedications.map((medication) {
                          return DropdownMenuItem<String>(
                            value: medication.medicationName,
                            child: Text(medication.medicationName),
                          );
                        }).toList()
                      : [
                          const DropdownMenuItem<String>(
                            value: '',
                            child: Text('No drugs available'),
                          ),
                        ],
                  onChanged: orderController.availableMedications.isNotEmpty
                      ? (value) {
                          Drug selectedDrug =
                              orderController.availableMedications.firstWhere(
                            (drug) => drug.medicationName == value,
                            orElse: () => Drug(
                                id: 0,
                                medicationName: '',
                                type: '',
                                quantity: 0,
                                pricePerUnit: 0.0),
                          );
                          orderController
                              .setMedicationName(selectedDrug.medicationName);
                          orderController.setMedicationId(selectedDrug.id);
                          // No need to call setState here since you're using GetX for state management
                        }
                      : null, // Disable onChanged if no drugs available
                  decoration:
                      const InputDecoration(labelText: 'Medication Name'),
                ),
              ),

              SizedBox(height: 10.h),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantity'),
                onChanged: (value) {
                  orderController.setQuantity(int.tryParse(value) ?? 0);
                },
                style: appStyle(18.sp, Colors.black, FontWeight.normal),
              ),
              SizedBox(height: 20.h),
              // Display calculated amount
              Obx(
                () => TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: orderController.calculatedAmount.string),
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),
              ),

              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  orderController.addOrderItem();
                },
                child: const Text('Add Order Item'),
              ),
              SizedBox(height: 20.h),
              // Display added order items
              Expanded(
                child: ListView.builder(
                  itemCount: orderController.orderItems.length,
                  itemBuilder: (context, index) {
                    final orderItem = orderController.orderItems[index];
                    return ListTile(
                      title: Text(orderItem.medicationName),
                      subtitle: Text('Quantity: ${orderItem.quantity}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          orderController.removeOrderItem(index);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              // Dropdown for Payment Option

              DropdownButtonFormField<String>(
                value: orderController.payment.value,
                items: ['Pay Now', 'Pay Later'].map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    orderController.setPayment(value ?? '');
                    // Update visibility based on payment option
                    isTransactionCodeVisible = value == 'Pay Now';
                  });
                },
                decoration: const InputDecoration(labelText: 'Payment Option'),
              ),

              SizedBox(height: 10.h),
              Visibility(
                visible: isTransactionCodeVisible,
                child: TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Transaction Code'),
                  onChanged: (value) {
                    orderController.setTransactionCode(value);
                  },
                ),
              ),

              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () async {
                  await orderController.placeOrder();
                  if (orderController.isOrderSuccessful.value) {
                    Get.snackbar('Success', 'Order placed successfully',
                        backgroundColor: AppColors.kijaniColor,
                        colorText: Colors.white);
                  } else {
                    Get.snackbar('Error', 'Failed to place order',
                        backgroundColor: Colors.red, colorText: Colors.white);
                  }
                },
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
