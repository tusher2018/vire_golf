import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/controller/role_controller.dart';
import 'package:get/get.dart';
import 'package:vire_glof/manager/intro/manager_onboarding1.dart';
import 'package:vire_glof/player/intro/onboarding1.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class RoleSelectionPage extends StatelessWidget {
  RoleSelectionPage({super.key});

  final roleController = Get.find<RoleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/splash_screen_logo.png', width: 150),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Image.asset("assets/role_page.png"),
              ),
              commonText("Welcome!\nAre you a...", size: 21, isBold: true),
              SizedBox(height: 30),
              customImageButton(
                imagePath: 'assets/manager.png',
                label: 'Manager',
                onTap: () {
                  roleController.setRole(isPlayer: false);

                  Get.to(ManagerOnboardingScreen1());
                },
              ),

              customImageButton(
                imagePath: 'assets/player.png',
                label: 'Player',
                onTap: () {
                  roleController.setRole(isPlayer: true);

                  Get.to(PlayerOnboardingScreen1());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customImageButton({
  required String imagePath,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.yellow, // Button color
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 24, height: 24),
          const SizedBox(width: 12),
          commonText(
            label,

            color: AppColors.black,
            fontWeight: FontWeight.bold,
            size: 14,
          ),
        ],
      ),
    ),
  );
}
