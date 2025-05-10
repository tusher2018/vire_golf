import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/Battle/leader_board.dart';
import 'package:vire_glof/player/play/scoreboard_for_chalenges.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class PlayerMapScreen extends StatelessWidget {
  const PlayerMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/map.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),

          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),

          // Distance Marker Box
          Positioned(
            top: 100,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  commonText("Back", color: AppColors.deepblue, isBold: true),
                  commonText("100 YDS", isBold: true),
                  SizedBox(height: 2),
                  Container(width: 50, color: AppColors.black, height: 2),
                  SizedBox(height: 2),
                  commonText("Middle", color: AppColors.deepblue, isBold: true),
                  commonText("80 YDS", isBold: true),
                  SizedBox(height: 2),
                  Container(width: 50, color: AppColors.black, height: 2),
                  SizedBox(height: 2),
                  commonText("Front", color: AppColors.deepblue, isBold: true),
                  commonText("80 YDS"),
                ],
              ),
            ),
          ),

          // Bottom Controls
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Leaderboard
                    _bottomButton(
                      icon: "assets/scoreBoard.png",
                      label: "Leaderboard",
                      onTap: () {
                        Get.to(PlayerLeaderBoardPage());
                      },
                    ),
                    // Hole Selector
                    Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_left),
                          SizedBox(width: 4),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              commonText("HOLE", isBold: true),
                              commonText("1", size: 16, isBold: true),
                            ],
                          ),

                          SizedBox(width: 4),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                    // Scorecard
                    _bottomButton(
                      icon: "assets/images/Edit_Pencil.png",
                      label: "Scorecard",
                      onTap: () {
                        Get.to(ChallengeScoreboardPage());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Hole Info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: commonButton(
                    "36 YDS • PAR 4 • HCP 9",
                    color: AppColors.white,
                    textColor: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(icon, color: AppColors.black),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
