// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/intro/manager_onboarding3.dart';
import 'package:vire_glof/res/onboardingdots.dart';
import '../../res/commonWidgets.dart';

class ManagerOnboardingScreen2 extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedGender;

  ManagerOnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset("assets/manager_onboarding2.png"),
            Spacer(),
            commonText(
              "Create & Manage Leagues",
              size: 21,
              textAlign: TextAlign.center,
              isBold: true,
              color: AppColors.black,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: commonText(
                "Set up new leagues, invite participants, and keep everything organized with just a few taps.",
                size: 18,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                color: AppColors.black,
              ),
            ),
            Spacer(),

            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 3,
                  child: commonButton(
                    "Continue",

                    textColor: Colors.white,
                    onTap: () {
                      navigateToPage(ManagerOnboardingScreen3());
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
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
