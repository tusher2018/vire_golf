import 'package:flutter/material.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/auth/verification.dart';
import '../res/commonWidgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
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
            const SizedBox(height: 10),
            Image.asset(ImagePaths.forgetPageImage),

            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: "Forget Your ",
                    style: TextStyle(color: Colors.black),
                  ),
                  WidgetSpan(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return AppColors.primaryGradient.createShader(bounds);
                      },
                      child: const Text(
                        'Password?',
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
            commonText(
              "Enter your email address to reset your password.",
              size: 14.0,
            ),
            const SizedBox(height: 30),

            // Email TextField
            commonTextfieldWithTitle(
              "Email",
              emailController,
              hintText: "Enter your email",
              assetIconPath: ImagePaths.emailIcon,
              keyboardType: TextInputType.emailAddress,
            ),
            Spacer(),

            commonButton(
              "Get Verification Code",
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
