import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/auth/signin.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/onboardingdots.dart';

class PlayerOnboardingScreen3 extends StatelessWidget {
  const PlayerOnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // Icons Row (top)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/league.png", height: 40),
                  const SizedBox(width: 16),
                  Image.asset("assets/images/score.png", height: 40),
                  const SizedBox(width: 16),
                  Image.asset("assets/images/stats.png", height: 40),
                ],
              ),

              const SizedBox(height: 24),

              // Title
              commonText(
                "Discover What You Can Do!",
                size: 22,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              commonText(
                "Here’s how you can make the most of\nVIRE Golf.",
                size: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Feature Cards
              const FeatureCard(
                iconPath: "assets/images/league.png",
                title: "Join Golf Leagues",
                subtitle: "Compete in leagues with fellow golfers.",
              ),
              const SizedBox(height: 12),
              const FeatureCard(
                iconPath: "assets/images/score.png",
                title: "Live Score Tracking",
                subtitle: "Track your scores on the course in real time.",
              ),
              const SizedBox(height: 12),
              const FeatureCard(
                iconPath: "assets/images/stats.png",
                title: "Handicap & Stats",
                subtitle: "Monitor your progress and improve your game.",
              ),

              const Spacer(),

              // CTA Button
              commonButton(
                "Start Exploring",
                onTap: () {
                  // Navigate to main/home screen
                  Get.to(SignInScreen());
                },
              ),

              const SizedBox(height: 16),

              // Page Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildDot(false), buildDot(false), buildDot(true)],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4FBD6), // Light green background
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Image.asset(iconPath, height: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  title,
                  size: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                const SizedBox(height: 4),
                commonText(
                  subtitle,
                  size: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
