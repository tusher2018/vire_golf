import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/auth/signin.dart';
import 'package:vire_glof/colors.dart';
import '../res/commonWidgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  void dispose() {
    newPasswordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(ImagePaths.resetPageImage),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: "Now Reset Your ",
                    style: TextStyle(color: Colors.black),
                  ),
                  WidgetSpan(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return AppColors.primaryGradient.createShader(bounds);
                      },
                      child: const Text(
                        'Password.',
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white, // required for ShaderMask
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            commonText("Password  must have 6-8 characters.", size: 14.0),
            const SizedBox(height: 30),

            // New Password TextField
            commonTextfieldWithTitle(
              "New Password",
              newPasswordController,
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

            // Confirm New Password TextField
            commonTextfieldWithTitle(
              "Confirm New Password",
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
            Spacer(),
            commonButton(
              "Reset Password",
              textColor: Colors.white,
              onTap: () {
                Get.to(SignInScreen());
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
