// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/intro/onboarding3.dart';
import 'package:vire_glof/res/onboardingdots.dart';
import '../../res/commonWidgets.dart';

class PlayerOnboardingScreen2 extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedGender;

  PlayerOnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            commonText("Let’s Get to Know You!", size: 24.0, isBold: true),
            const SizedBox(height: 10),
            commonText("Set up your golf profile to get started..", size: 14.0),

            const SizedBox(height: 40),

            // Profile Image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                  ),

                  child: Image.asset(ImagePaths.compleateProfileIcon),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(width: 1, color: AppColors.green),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(ImagePaths.editIcon),
                ),
              ],
            ),
            const SizedBox(height: 8),
            commonText("Upload a photo"),
            const SizedBox(height: 30),

            // Full Name TextField
            commonTextfieldWithTitle(
              "Your Name",
              fullNameController,
              hintText: "Full Name",
            ),
            const SizedBox(height: 15),

            // Phone TextField
            commonTextfieldWithTitle(
              "Your Golf Handicap",
              optional: true,
              phoneController,
              hintText: "Phone",
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 100),

            // Continue Button
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 3,
                  child: commonButton(
                    "Continue",

                    textColor: Colors.white,
                    onTap: () {
                      navigateToPage(PlayerOnboardingScreen3());
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 16),

            // Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildDot(false), buildDot(true), buildDot(false)],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
