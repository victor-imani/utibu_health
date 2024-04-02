import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utibu_health/controllers/auth_controller.dart';
import 'package:utibu_health/models/user_model.dart';
import 'package:utibu_health/utils/account_container.dart';
import 'package:utibu_health/utils/app_style.dart';
import 'package:utibu_health/utils/colors.dart';
import 'package:utibu_health/utils/dimensions.dart';
import 'package:utibu_health/views/login_page.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final AuthController authController = Get.find();
  User? currentUser;
  @override
  Widget build(BuildContext context) {
    currentUser = authController.currentUser.value;
    Dimensions dimensions = Dimensions(MediaQuery.of(context));
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(dimensions.padding8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Account",
                style: appStyle(24.sp, Colors.black, FontWeight.bold),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(dimensions.radius20.r),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  CircleAvatar(
                    radius: 45.r,
                    child: Icon(
                      Icons.person,
                      size: dimensions.iconSize24 * 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: dimensions.padding8 * 2,
                        left: dimensions.padding8 * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser!.name,
                          style: appStyle(22.sp, Colors.black, FontWeight.bold),
                        ),
                        Text(
                          currentUser!.emailAddress,
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: AppColors.kijaniColor,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: ((context) => Container())));
                },
                child: const AccountContainer(
                    text: "My Profile", icon: Icons.person)),
            const AccountContainer(text: "Settings", icon: Icons.settings),
            const AccountContainer(
                text: "Help and Support",
                icon: CupertinoIcons.question_square_fill),
            ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: GestureDetector(
                  onTap: () {
                    // Show a dialog to confirm logout
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Logout Confirmation'),
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: <Widget>[
                            // Continue button
                            TextButton(
                              onPressed: () {
                                String result = authController.signOut();

                                if (result == 'success') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const LoginPage())));
                                } // Close the dialog
                              },
                              child: const Text('Continue'),
                            ),
                            // Cancel button
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Logout',
                    style: appStyle(20.sp, Colors.red, FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
