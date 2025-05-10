import 'package:flutter/material.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/auth/reset_pass.dart';
import '../res/commonWidgets.dart';

class VerificationScreen extends StatefulWidget {

  VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Image.asset(ImagePaths.verificationPageImage),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: "Enter ",
                    style: TextStyle(color: Colors.black),
                  ),
                  WidgetSpan(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return AppColors.primaryGradient.createShader(bounds);
                      },
                      child: const Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white, // required for ShaderMask
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const TextSpan(
                    text: " Code.",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            commonText(
              "Enter the code that was sent to your email.",
              size: 14.0,
            ),
            const SizedBox(height: 20),

            // OTP Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buildOTPTextField(
                    otpControllers[index],
                    index,
                    context,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Resend Code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText(
                  "Didn't receive the code? ",
                  size: 14.0,
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: () {},
                  child: commonText(
                    "Resend",
                    size: 14.0,
                    color: Colors.black,
                    isBold: true,
                  ),
                ),
              ],
            ),
            Spacer(),

            // Verify Button
            commonButton(
              "Verify",

              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
