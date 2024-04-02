import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:utibu_health/controllers/auth_controller.dart';
import 'package:utibu_health/utils/app_style.dart';
import 'package:utibu_health/utils/colors.dart';
import 'package:utibu_health/utils/dimensions.dart';
import 'package:utibu_health/utils/strings.dart';
import 'package:utibu_health/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // defining the input controllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool obscureText = true;

  String? errorTextEmail;
  String? errorTextName;
  String? errorTextPassword;
  String? errorTextPhone;

  String? errorTextConfirmPass;

   bool isRegistering = false;
  final AuthController _authController = Get.find<AuthController>(); // Get the AuthController instance
  @override
  void initState() {
    super.initState();
    _emailController.text.toString();
    _passwordController.text.toString();
    _phoneController.text.toString();
    _nameController.text.toString();
    _passConfirmController.toString();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passConfirmController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

 Future<void> _register() async {
    setState(() {
      isRegistering = true;
    });

    try {
      bool isRegistered = await _authController.signUp(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _passConfirmController.text,
        _phoneController.text
      );

      if (isRegistered) {
        // Registration successful, navigate to login page or perform other actions
        // For example, you can navigate to the login page after successful registration
         Navigator.push(context, MaterialPageRoute(
                              builder: ((context) => const LoginPage())));
      } else {
        // Handle registration failure (show error message, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle other errors (network error, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error registering. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isRegistering = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(MediaQuery.of(context));
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                SizedBox(
                  height: dimensions.height10 / 2.h,
                ),
                Container(
                  margin: EdgeInsets.all(dimensions.padding8*2),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: dimensions.width200.w,
                          height: dimensions.height50 * 3.h,
                          decoration: BoxDecoration(
                              color: AppColors.kijaniColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(dimensions.radius15.r),
                                bottomRight:
                                    Radius.circular(dimensions.radius15.r),
                              ),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/utibu_logo.png"))),
                        ),
                        Text(
                          "Create Account",
                          style: appStyle(dimensions.font16 * 2.sp,
                              AppColors.kijaniColor, FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: dimensions.height10 / 2.h,
                        ),

                        // Form Fields

                        // Name Field
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5, // Number of input fields
                            itemBuilder: (context, index) {
                              switch (index) {
                                case 0:
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          controller: _nameController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.r),
                                                borderSide: BorderSide(
                                                  width: 2.0.r,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: AppColors.kijaniColor,
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                                  "What do people call you?",
                                              hintStyle: appStyle(
                                                dimensions.font20.sp,
                                                AppColors.kijaniColor,
                                                FontWeight.normal,
                                              )),
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              setState(() {
                                                errorTextName = null;
                                              });
                                            } else {
                                              setState(() {
                                                errorTextName = kNameNullError;
                                              });
                                            }
                                          },
                                        ),
                                        if (errorTextName != null)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              errorTextName!,
                                              style: appStyle(12.sp, Colors.red,
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        SizedBox(
                                            height: dimensions.height15 / 3.h),
                                      ],
                                    ),
                                  );
                                case 1:
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Email Field

                                        TextFormField(
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          controller: _emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.r),
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
                                              hintText: "Email",
                                              hintStyle: appStyle(
                                                dimensions.font20.sp,
                                                AppColors.kijaniColor,
                                                FontWeight.normal,
                                              )),
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              setState(() {
                                                errorTextEmail =
                                                    kEmailNullError;
                                              });
                                            } else if (!emailValidatorRegExp
                                                .hasMatch(value)) {
                                              setState(() {
                                                errorTextEmail =
                                                    kInvalidEmailError;
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
                                              style: appStyle(12.sp, Colors.red,
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        SizedBox(
                                          height: dimensions.height15 / 3.h,
                                        ),
                                      ],
                                    ),
                                  );
                                case 2:
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Phone Form Field

                                        TextFormField(
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          controller: _phoneController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.r),
                                                borderSide: BorderSide(
                                                  width: 2.0.w,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.phone,
                                                color: AppColors.kijaniColor,
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "Phone Number",
                                              hintStyle: appStyle(
                                                dimensions.font20.sp,
                                                AppColors.kijaniColor,
                                                FontWeight.normal,
                                              )),
                                          textInputAction: TextInputAction.next,
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              setState(() {
                                                errorTextPhone =
                                                    kPhoneNullError;
                                              });
                                            } else if (!phoneNumberValidatorRegExp
                                                .hasMatch(value)) {
                                              setState(() {
                                                errorTextPhone =
                                                    kInvalidPhoneError;
                                              });
                                            } else {
                                              setState(() {
                                                errorTextPhone = null;
                                              });
                                            }
                                          },
                                        ),
                                        if (errorTextPhone != null)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              errorTextPhone!,
                                              style: appStyle(12.sp, Colors.red,
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        SizedBox(
                                          height: dimensions.height15 / 3.h,
                                        ),
                                      ],
                                    ),
                                  );
                                case 3:
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Password Text Field

                                        TextFormField(
                                            onTapOutside: (event) {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            controller: _passwordController,
                                            keyboardType: TextInputType.text,
                                            obscureText: obscureText,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0.r),
                                                  borderSide: BorderSide(
                                                    width: 2.0.w,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      obscureText =
                                                          !obscureText;
                                                    });
                                                  },
                                                  child: Icon(
                                                    obscureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color:
                                                        AppColors.kijaniColor,
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: "Preffered Password",
                                                hintStyle: appStyle(
                                                  dimensions.font20.sp,
                                                  AppColors.kijaniColor,
                                                  FontWeight.normal,
                                                )),
                                            textInputAction:
                                                TextInputAction.next,
                                            onChanged: (value) {
                                              if (value.isNotEmpty &&
                                                  value.length >= 8) {
                                                setState(() {
                                                  errorTextPassword = null;
                                                });
                                              } else if (value.isNotEmpty &&
                                                  value.length < 8) {
                                                setState(() {
                                                  errorTextPassword =
                                                      kShortPasswordError;
                                                });
                                              } else {
                                                setState(() {
                                                  errorTextPassword =
                                                      kPasswordNullError;
                                                });
                                              }
                                            }),
                                        if (errorTextPassword != null)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              errorTextPassword!,
                                              style: appStyle(12.sp, Colors.red,
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        SizedBox(
                                          height: dimensions.height15 / 3.h,
                                        ),
                                      ],
                                    ),
                                  );
                                case 4:
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Confirm Password

                                        TextFormField(
                                            onTapOutside: (event) {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            controller: _passConfirmController,
                                            keyboardType: TextInputType.text,
                                            obscureText: obscureText,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0.r),
                                                  borderSide: BorderSide(
                                                    width: 2.0.r,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      obscureText =
                                                          !obscureText;
                                                    });
                                                  },
                                                  child: Icon(
                                                    obscureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color:
                                                        AppColors.kijaniColor,
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: "Confirm Password",
                                                hintStyle: appStyle(
                                                  dimensions.font20,
                                                  AppColors.kijaniColor,
                                                  FontWeight.normal,
                                                )),
                                            textInputAction:
                                                TextInputAction.next,
                                            onChanged: (value) {
                                              if (value.isNotEmpty &&
                                                  value.length >= 8 &&
                                                  _passConfirmController.text ==
                                                      _passwordController
                                                          .text) {
                                                setState(() {
                                                  errorTextConfirmPass = null;
                                                });
                                              } else if (value.isNotEmpty &&
                                                  value.length < 8) {
                                                setState(() {
                                                  errorTextConfirmPass =
                                                      kShortPasswordError;
                                                });
                                              } else if (value.isEmpty) {
                                                setState(() {
                                                  errorTextConfirmPass =
                                                      kPasswordNullError;
                                                });
                                              } else {
                                                setState(() {
                                                  errorTextConfirmPass =
                                                      kPasswordConfirmError;
                                                });
                                              }
                                            }),
                                        if (errorTextConfirmPass != null)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              errorTextConfirmPass!,
                                              style: appStyle(12.sp, Colors.red,
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        SizedBox(
                                          height: dimensions.height15 / 3.h,
                                        ),
                                      ],
                                    ),
                                  );
                                default:
                                  return const SizedBox();
                              }
                            })
                      ],
                    ),
                  ),
                ),
                if (isRegistering)
                        const Center(child: CircularProgressIndicator()),
                      if (!isRegistering)
                Center(
                  child: TextButton(
                    onPressed: () {
                    _register();
                    },
                    child: Container(
                      width: dimensions.width200 * 1.05.w,
                      height: dimensions.height50 * 1.05.h,
                      decoration: BoxDecoration(
                        color: AppColors.kijaniColor,
                        borderRadius: BorderRadius.circular(dimensions.radius8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 40.w, top: 8.h, right: 40.w, bottom: 8.h),
                        child: Text(
                          "REGISTER",
                          style: appStyle(dimensions.font26 - 2, Colors.white,
                              FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.08.h,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const LoginPage())));
                      },
                      child: Text(
                        'Log In',
                        style: appStyle(dimensions.font20.sp,
                            AppColors.kijaniColor, FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
