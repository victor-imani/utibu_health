import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:utibu_health/controllers/auth_controller.dart';
import 'package:utibu_health/utils/app_style.dart';
import 'package:utibu_health/utils/colors.dart';
import 'package:utibu_health/utils/dimensions.dart';
import 'package:utibu_health/utils/strings.dart';
import 'package:utibu_health/views/home_page.dart';
import 'package:utibu_health/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    bool obscureText = true;
   bool isAuthenticating = false;

  String? errorTextEmail;
   String? errorTextPassword;
final AuthController _authController = Get.find<AuthController>(); // Get the AuthController instance

   @override
  void initState() {
    super.initState();
    _emailController.text.toString();
    _passwordController.text.toString();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 
 Future<void> _login() async {
    setState(() {
      isAuthenticating = true;
    });

    try {
      bool isAuthenticated = await _authController.signIn(
        _emailController.text,
        _passwordController.text
      );

      if (isAuthenticated) {
        Navigator.push(context, MaterialPageRoute(
                              builder: ((context) => const HomePage())));
                    } // Navigate to HomePage
      else {
        // Handle authentication failure (show error message, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication failed. Please check your credentials.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle other errors (network error, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error signing in. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isAuthenticating = false;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
     Dimensions dimensions = Dimensions(MediaQuery.of(context));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                      SizedBox(height: dimensions.height20.h,),
                       Container(
                        margin: const EdgeInsets.all(16.0),
                           child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: double.maxFinite,
                                    height: dimensions.height50 *3.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.kijaniColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(dimensions.radius15),
                                        // bottomLeft: Radius.circular(dimensions.radius15),
                                        // bottomRight: Radius.circular(dimensions.radius15),
                                      ),
                                      image: const DecorationImage(image: AssetImage("assets/images/utibu_logo.png"))
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(dimensions.padding8),
                                  margin:EdgeInsets.all(dimensions.padding8),
                                  child: Text("Hello, \nSign In to Continue", style: appStyle(dimensions.font16*2.sp, AppColors.kijaniColor, FontWeight.bold),)),
                               
                                SizedBox(height: dimensions.height20.h),
              //Form Fields
              
                            TextFormField(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0.r), 
                                borderSide: BorderSide(
                                  width: 2.0.w,
                                  color: Colors.white,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: AppColors.kijaniColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Your Email Address",
                              hintStyle: appStyle(dimensions.font20, AppColors.kijaniColor, FontWeight.normal,)
                            ),
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  errorTextEmail = kEmailNullError;
                                });
                              } else if (!emailValidatorRegExp.hasMatch(value)) {
                                setState(() {
                                  errorTextEmail = kInvalidEmailError;
                                });
                              } else {
                                setState(() {
                                  errorTextEmail = null;
                                });
                              }
                            },
                                ),
                                if (errorTextEmail != null)
                                             Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              errorTextEmail!,
                              style: appStyle(12.sp, Colors.red, FontWeight.normal),
                              ),
                            ),
                              SizedBox(height: dimensions.height15,),
                                // Password Text Field
                              
                             TextFormField(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r), 
                                borderSide: BorderSide(
                                  width: 2.w,
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;                                  
                                  });
                                },
                                child: Icon(
                                   obscureText ? Icons.visibility_off : Icons.visibility,
                                  color: AppColors.kijaniColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Your Password",
                              hintStyle: appStyle(dimensions.font20, AppColors.kijaniColor, FontWeight.normal,)
                            ),
                            textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                if (value.isNotEmpty && value.length >= 8) {
                                  setState(() {
                                    errorTextPassword = null;
                                  });
                                } else if (value.isNotEmpty && value.length < 8) {
                                  setState(() {
                                    errorTextPassword = kShortPasswordError;
                                  });
                                } else {
                                  setState(() {
                                    errorTextPassword = kPasswordNullError;
                                  });
                                }
                              }
                                             ),
                           if (errorTextPassword != null)
                                             Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              errorTextPassword!,
                              style: appStyle(12.sp, Colors.red, FontWeight.normal),
                              ),
                            ),
                           SizedBox(height: dimensions.height45.h), 
                          if (isAuthenticating)
                        const Center(child: CircularProgressIndicator()),
                      if (!isAuthenticating)
                           Center(
                child: TextButton(
                  onPressed: _login,
                  child: Container(
                width: dimensions.width200 * 1.05.w,
                height: dimensions.height50 *1.05.h,
                decoration: BoxDecoration(
                  color: AppColors.kijaniColor,
                  borderRadius: BorderRadius.circular(dimensions.radius8.r),
                ),
                
                child: Padding(
                  padding: EdgeInsets.only(left: 40.w, top: 8.h, right: 40.w, bottom: 8.h),
                  child: Text("LOG IN", style: appStyle(dimensions.font26-2, Colors.white, FontWeight.w700), textAlign: TextAlign.center,),
                ),
                          ),
                          ),
              ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.08.h,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => const RegisterPage())));
                          },
                          child: Text(
                            'Sign Up',
                            style: appStyle(dimensions.font20, AppColors.kijaniColor, FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                              ]
                           ),
                       ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  
}

 