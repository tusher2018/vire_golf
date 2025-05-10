// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/intro/onboarding2.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/onboardingdots.dart';

class PlayerOnboardingScreen1 extends StatelessWidget {
  PlayerOnboardingScreen1({super.key});

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
              "Your Ultimate Golf Companion.",
              size: 21,
              textAlign: TextAlign.center,
              isBold: true,
              color: AppColors.black,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: commonText(
                "JOIN LEAGUES, TRACK YOUR SCORES, AND COMPETE WITH FRIENDS—ALL IN ONE PLACE.",
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
                navigateToPage(PlayerOnboardingScreen2());
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
