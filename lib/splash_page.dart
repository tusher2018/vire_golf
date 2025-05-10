import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/role_selection_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to onboarding after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      navigateToPage(RoleSelectionPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Image.asset(
              'assets/images/splash_screen_logo.png',
              width: 350,
              height: 127,
            ),
          ),
        ),
      ),
    );
  }
}
