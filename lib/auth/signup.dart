import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/auth/signin.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/controller/role_controller.dart';
import 'package:vire_glof/player/root_screen.dart';

import '../res/commonWidgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final roleController = Get.find<RoleController>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isAgree = false;

  @override
  void dispose() {
    emailController.clear();
    fullNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(ImagePaths.logo, height: 80),

                const SizedBox(height: 20),

                // Full Name TextField
                commonTextfieldWithTitle(
                  "Full name",
                  fullNameController,
                  hintText: "Enter your email",
                  assetIconPath: ImagePaths.userIcon,
                ),
                const SizedBox(height: 15),

                // Email TextField
                commonTextfieldWithTitle(
                  "Email",
                  emailController,
                  hintText: "Enter your email",
                  assetIconPath: ImagePaths.emailIcon,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),

                // Password TextField
                commonTextfieldWithTitle(
                  "Password",
                  passwordController,
                  hintText: "Enter your password",
                  assetIconPath: ImagePaths.lockIcon,

                  isPasswordVisible: isPasswordVisible,
                  issuffixIconVisible: true,
                  changePasswordVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 15),

                // Confirm Password TextField
                commonTextfieldWithTitle(
                  "Confirm Password",
                  confirmPasswordController,
                  hintText: "Enter your password",
                  assetIconPath: ImagePaths.lockIcon,

                  isPasswordVisible: isConfirmPasswordVisible,
                  issuffixIconVisible: true,
                  changePasswordVisibility: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Checkbox(
                      value: isAgree,
                      onChanged: (value) {
                        setState(() {
                          isAgree = value!;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Agree with ",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms and Conditions",
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Sign Up Button
                commonButton(
                  "Sign Up",
                  onTap: () {
                    if (roleController.isplayer.value) {
                      Get.to(PlayerRootScreen());
                    } else {}
                  },
                ),
                const SizedBox(height: 20),

                // Or Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.black)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: commonText("Or", size: 16.0),
                    ),
                    Expanded(child: Divider(color: AppColors.black)),
                  ],
                ),
                const SizedBox(height: 20),

                // Sign Up with Google
                commonBorderButton(
                  "Sign Up With Google",
                  imagePath: ImagePaths.googleIcon,

                  onTap: () {},
                ),

                const SizedBox(height: 15),

                // Sign Up with Facebook
                commonBorderButton(
                  "Sign Up With Facebook",
                  imagePath: ImagePaths.facebookIcon,

                  onTap: () {
                    // Handle tap
                  },
                ),

                const SizedBox(height: 30),

                // Already have an account? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Already have an account? ", size: 14.0),
                    GestureDetector(
                      onTap: () {
                        navigateToPage(SignInScreen());
                      },
                      child: commonText(
                        "Sign In",
                        size: 14.0,
                        color: AppColors.black,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
