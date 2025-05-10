// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/intro/manager_onboarding2.dart';

import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/onboardingdots.dart';

class ManagerOnboardingScreen1 extends StatelessWidget {
  ManagerOnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths.onboardingbackground),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(flex: 2),
            commonText(
              "Welcome to",
              size: 24,
              isBold: true,

              color: AppColors.white,
            ),
            Image.asset(ImagePaths.splashScreenLogo, height: 100),
            SizedBox(height: 32),
            commonText(
              "Manage Leagues with Ease..",
              size: 21,
              textAlign: TextAlign.center,
              isBold: true,
              color: AppColors.black,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: commonText(
                "CREATE AND MANAGE LEAGUES EFFORTLESSLY—EMPOWER PLAYERS AND KEEP THE COMPETITION STRONG.",
                size: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                color: AppColors.black,
              ),
            ),
            Spacer(flex: 3),
            commonButton(
              "Get Started",
              onTap: () {
                navigateToPage(ManagerOnboardingScreen2());
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildDot(true), buildDot(false), buildDot(false)],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
