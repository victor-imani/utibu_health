import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utibu_health/utils/app_style.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Utibu Health',
          style: appStyle(20.sp, Colors.white, FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome to Utibu Health!',
              style: appStyle(24.sp, Colors.black, FontWeight.bold),
            ),
            const Image(image: AssetImage("assets/images/utibu_logo.png")),
            SizedBox(height: 20.h),
            Text(
              'Order Your Medications Remotely',
              style: appStyle(18.sp, Colors.grey.shade800, FontWeight.normal),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () {
                // Navigate to the order page
              },
              child: Text(
                'Start Ordering',
                style: appStyle(18.sp, Colors.black, FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
