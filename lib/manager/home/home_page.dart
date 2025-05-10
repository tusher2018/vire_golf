import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/home/announcement_page.dart';
import 'package:vire_glof/manager/home/create_leagues.dart';
import 'package:vire_glof/profile/notifications.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ManagerHomePage extends StatefulWidget {
  const ManagerHomePage({super.key});

  @override
  State<ManagerHomePage> createState() => _ManagerHomePageState();
}

class _ManagerHomePageState extends State<ManagerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://image.lexica.art/full_webp/9f8136dd-0fe5-4b22-b490-4c87e2722c5a",
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonText("Current Location", size: 14.0, color: AppColors.gray),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_pin, size: 16),
                commonText("Port Louis, Mauritius", isBold: true),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.to(NotificationPage());
            },
            child: Icon(Icons.notifications_active, color: Colors.orange),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("Overview", size: 16.0, isBold: true),
              Card(
                elevation: 2,

                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          commonText(
                            "Active Leagues: 1",
                            size: 14,
                            isBold: true,
                          ),

                          SizedBox(height: 8),
                          commonText("Total Participants: 4", size: 14),
                          SizedBox(height: 4),
                          commonText("Upcoming Matches: 1", size: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: commonText(
                      "New match scheduled for Spring League 2025! Check Schedule.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              commonText("League Leaderboard", size: 16.0, isBold: true),
              const SizedBox(height: 10),
              _leaderboard(),
              const SizedBox(height: 16),
              commonText("Quick Actions", size: 16.0, isBold: true),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: commonButton(
                      "Create\nLeague",
                      textalign: TextAlign.center,
                      color: AppColors.green,
                      textSize: 14,
                      onTap: () {
                        Get.to(CreateLeagueScreen());
                      },
                    ),
                  ),

                  SizedBox(width: 10),
                  Expanded(
                    child: commonButton(
                      "Send\nAnnouncement",
                      textalign: TextAlign.center,
                      color: AppColors.deepblue,
                      textSize: 14,
                      onTap: () {
                        Get.to(AnnouncementPage());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.blue,
                boxShadow: [BoxShadow(blurRadius: 1, offset: Offset(0, 0))],
                borderRadius: BorderRadius.circular(8),
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
            );
          }).toList(),
    );
  }
}
