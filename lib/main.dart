import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:utibu_health/views/login_page.dart';
import 'helper/dependencies.dart' as dep; 

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42857142857144, 890.2857142857143),
      builder: (BuildContext context, Widget? widget) {
      
        
        return GetMaterialApp(
          title: 'Utibu Health',
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        );
      },
    );
  }
}
