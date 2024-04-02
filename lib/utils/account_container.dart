import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utibu_health/utils/app_style.dart';
import 'package:utibu_health/utils/dimensions.dart';

class AccountContainer extends StatelessWidget {
  const AccountContainer({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(MediaQuery.of(context));
    return Container(
      width: double.maxFinite,
      height: 100.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(dimensions.radius20.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Icon(
            icon,
            size: dimensions.iconSize50,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            text,
            style: appStyle(22.sp, Colors.black, FontWeight.bold),
          )
        ],
      ),
    );
  }
}
