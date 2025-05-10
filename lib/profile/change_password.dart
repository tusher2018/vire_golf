import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/auth/forget_pass.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: commonText("Change Password", size: 18, isBold: true),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: double.infinity,
        child: Column(
          children: [
            commonText("Password  must have 6-8 characters."),
            const SizedBox(height: 20),

            // Current Password Field
            commonTextfieldWithTitle(
              "Current Password",
              currentPasswordController,
              hintText: "Enter your password",
              assetIconPath: ImagePaths.lockIcon,

              isPasswordVisible: isCurrentPasswordVisible,
              issuffixIconVisible: true,
              changePasswordVisibility: () {
                setState(() {
                  isCurrentPasswordVisible = !isCurrentPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 15),

            // New Password Field
            commonTextfieldWithTitle(
              "New Password",
              newPasswordController,
              hintText: "Enter your password",
              assetIconPath: ImagePaths.lockIcon,

              isPasswordVisible: isNewPasswordVisible,
              issuffixIconVisible: true,
              changePasswordVisibility: () {
                setState(() {
                  isNewPasswordVisible = !isNewPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 15),

            // Confirm New Password Field
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                InkWell(
                  onTap: () {
                    Get.to(ForgotPasswordScreen());
                  },
                  child: commonText("Forgot Password", isBold: true),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Change Password Button
            commonButton(
              "Change Password",

              textColor: AppColors.white,
              onTap: () {
                // Handle change password logic here
                print("Password changed!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
