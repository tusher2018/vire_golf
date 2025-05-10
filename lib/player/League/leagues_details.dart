// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/play/map_page.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class PlayerLeagueDetailsScreen extends StatelessWidget {
  bool onlyView;
  PlayerLeagueDetailsScreen({super.key, this.onlyView = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: commonText("League Details", size: 16.0, isBold: true),

        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: commonText(
                        "Pro Championship 2025",
                        size: 20.0,
                        isBold: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    commonText("About the League", size: 16, isBold: true),
                    commonText(
                      "The Pro Championship 2025 is a premier golf league bringing together the best players from around the world to compete for the ultimate title. This year’s event will feature 18 challenging holes across some of the most iconic courses.",
                    ),
                    commonText("Sponsored by: GolfPro", isBold: true),
                    SizedBox(height: 16),
                    _scheduleSection(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    commonText("League Leaderboard", size: 16.0, isBold: true),
                    const SizedBox(height: 8),
                    _leaderboard(),
                    const SizedBox(height: 24),

                    commonText("Participants (20)", size: 16.0, isBold: true),
                    const SizedBox(height: 8),

                    _participants(),
                    const SizedBox(height: 24),
                    if (!onlyView)
                      commonButton(
                        "Join League",
                        onTap: () {
                          Get.back();
                        },
                      ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText("Schedule", size: 16.0, isBold: true),
        const SizedBox(height: 12),
        _scheduleRow("assets/start_date.png", "Start Date", "10th Dec 2025"),
        _scheduleRow("assets/key_match.png", "Key Match", "20th Dec 2025"),
        _scheduleRow("assets/location.png", "Finals", "30th Dec 2025"),
        _scheduleRow(
          "assets/carbon_location.png",
          "Location",
          "Pine Hills Golf Club.",
        ),
      ],
    );
  }

  Widget _scheduleRow(String icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7E9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(icon),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(title, size: 14.0, isBold: true),
              commonText(value, size: 13.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _leaderboard() {
    final players = [
      {
        "name": "Charles",
        "hcp": "12",
        "score": "-4",
        "rank": "1",
        "imageUrl":
            "https://www.apple.com/newsroom/images/2024/05/apple-watch-is-the-perfect-golfing-companion/article/Apple-Watch-golf-companion-hero_big.jpg.large.jpg",
      },
      {
        "name": "David",
        "hcp": "7",
        "score": "-3",
        "rank": "2",
        "imageUrl":
            "https://www.apple.com/newsroom/images/2024/05/apple-watch-is-the-perfect-golfing-companion/article/Apple-Watch-golf-companion-hero_big.jpg.large.jpg",
      },
      {
        "name": "Smith",
        "hcp": "9",
        "score": "-1",
        "rank": "3",
        "imageUrl":
            "https://www.apple.com/newsroom/images/2024/05/apple-watch-is-the-perfect-golfing-companion/article/Apple-Watch-golf-companion-hero_big.jpg.large.jpg",
      },
      {
        "name": "Kane",
        "hcp": "2",
        "score": "4",
        "rank": "4",
        "imageUrl":
            "https://www.apple.com/newsroom/images/2024/05/apple-watch-is-the-perfect-golfing-companion/article/Apple-Watch-golf-companion-hero_big.jpg.large.jpg",
      },
    ];

    return Column(
      children:
          players.map((player) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.0),

              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.blue.withOpacity(0.3),

                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      commonText(player["rank"]!, isBold: true, size: 16),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        backgroundImage: NetworkImage(player["imageUrl"]!),
                        radius: 18,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(player["name"]!, isBold: true, size: 14),
                            commonText("After 10 holes", size: 12.0),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          commonText(
                            "${player["hcp"]}",
                            textAlign: TextAlign.center,
                            isBold: true,
                          ),
                          commonText(
                            "HCP",
                            isBold: true,
                            textAlign: TextAlign.center,
                            color: AppColors.gray,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        children: [
                          commonText(
                            "${player["score"]}",
                            isBold: true,
                            textAlign: TextAlign.center,
                          ),
                          commonText(
                            "Round",
                            isBold: true,
                            color: AppColors.gray,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _participants() {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder:
            (_, index) => Column(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.apple.com/newsroom/images/2024/05/apple-watch-is-the-perfect-golfing-companion/article/Apple-Watch-golf-companion-hero_big.jpg.large.jpg",
                  ),
                ),
                const SizedBox(height: 8),
                commonText("Emily K.", size: 10.0),
              ],
            ),
      ),
    );
  }



  void showGameSummaryDialog(
    BuildContext context, {
    required String oponentName,
    required String location,
    required DateTime selectedDateTime,
  }) {
    // Format date and time
    final String dateStr = DateFormat('MMMM d').format(selectedDateTime);
    final String timeStr = DateFormat('h:mm a').format(selectedDateTime);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: const Color(
            0xFFF9FBE7,
          ), // Light yellow-ish background
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDEAFF), // Light blue container
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      summaryRow("Opponent:", oponentName),
                      summaryRow("Date:", dateStr),
                      summaryRow("Time:", timeStr),
                      summaryRow("Location:", location),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                commonButton(
                  "Confirm Preparing",
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(PlayerMapScreen());
                    // Proceed further if needed
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [commonText(title, isBold: true), commonText(value)],
      ),
    );
  }



}
