import 'package:flutter/widgets.dart';


class Dimensions{
   final MediaQueryData mediaQueryData;

  Dimensions(this.mediaQueryData);
  
   double get screenHeight => mediaQueryData.size.height; // 890.2857142857143

  double get screenWidth => mediaQueryData.size.width;    // 411.42857142857144


//dynamic height padding and margin
  double get height10 => screenHeight / 91.5;
  double get height15 => screenHeight / 61;
  double get height20 => screenHeight / 45.75;
  double get height30 => screenHeight / 30.5;
  double get height45 => screenHeight / 20.33;
  double get height50 => screenHeight / 18.3;
  double get height129 => screenHeight / 6.901439650055372;
  double get height200 => screenHeight / 4.451428571428572;
  double get padding8 => screenHeight/ 111.2857142857142875;


//dynamic width padding and margin
  double get width10 => screenHeight / 91.5;
  double get width15 => screenHeight / 61;
  double get width20 => screenHeight / 45.75;
  double get width30 => screenHeight / 30.5;
  double get width90 => screenWidth / 4.571428571428571;
  double get width200 => screenHeight / 4.575;
  double get width350 => screenWidth / 1.175510204081633;

// font size
  double get font16 => screenHeight / 57.1875;
  double get font20 => screenHeight / 45.75;
  double get font26 => screenHeight / 35.1923;

//radius
  double get radius8 => screenHeight / 114.375;
  double get radius15 => screenHeight / 61;
  double get radius20 => screenHeight / 45.75;
  double get radius30 => screenHeight / 30.5;

  // icon size
  double get iconSize24 => screenHeight / 38.125;
  double get iconsSize16 => screenHeight / 57.1875;
  double get iconSize50 => screenHeight/ 17.805714285714286;


}