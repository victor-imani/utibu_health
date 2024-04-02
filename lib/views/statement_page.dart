import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:utibu_health/controllers/statement_controller.dart';
import 'package:utibu_health/utils/app_style.dart';

class StatementPage extends StatelessWidget {
  final StatementController statementController =
      Get.put(StatementController());

  StatementPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statement Screen'),
      ),
      body: SafeArea(
        child: Obx(
          () {
            if (statementController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (statementController.statements.isEmpty) {
              return const Center(
                child: Text('No statements available\n\nPull down to refresh'),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await statementController.fetchStatements();
                },
                child: ListView.builder(
                  itemCount: statementController.statements.length,
                  itemBuilder: (context, index) {
                    final statement = statementController.statements[index];
                    return ListTile(
                      title: Text(
                        statement.description,
                        style: appStyle(16.sp, Colors.black, FontWeight.normal),
                      ),
                      trailing: Text(
                        'Amount: \$${statement.totalAmount.toStringAsFixed(2)}',
                        style: appStyle(16.sp, Colors.black, FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Payment status: ${statement.paymentStatus}',
                        style: appStyle(
                            16.sp, Colors.grey.shade700, FontWeight.normal),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
