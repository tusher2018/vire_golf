import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/League/leagues_details.dart';
import 'package:vire_glof/manager/League/past_leagues_details.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ManagerLeaguePage extends StatefulWidget {
  const ManagerLeaguePage({super.key});

  @override
  State<ManagerLeaguePage> createState() => _ManagerLeaguePageState();
}

class _ManagerLeaguePageState extends State<ManagerLeaguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            commonText("Active Leagues", size: 16, isBold: true),
            _activeLeaguesCards(),
            SizedBox(height: 20),
            commonText("Past Leagues", size: 16, isBold: true),
            _pastLeaguesCards(),
          ],
        ),
      ),
    );
  }
}

Widget _activeLeaguesCards() {
  return ListView.separated(
    itemCount: 2,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (context, index) {
      return _leaguesCard(
        title: "Spring League 2025",
        daterange: "March 10, 2025 - March 20, 2025",
        player: "16/20",
        location: "Pine Hills",
        buttonText: "Manage",
        onButtonTap: () {
          Get.to(ManagerLeagueDetailsScreen());
        },
        imageUrl:
            "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
      );
    },
  );
}

Widget _pastLeaguesCards() {
  return ListView.separated(
    itemCount: 4,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (context, index) {
      return _leaguesCard(
        title: "Spring League 2025",
        daterange: "March 10, 2025 - March 20, 2025",
        player: "16/20",
        location: "Pine Hills",
        ontap: () {
          Get.to(ManagerPastLeagueDetailsScreen());
        },
        imageUrl:
            "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
      );
    },
  );
}

Widget _leaguesCard({
  required String title,
  required String location,
  required String daterange,
  required String player,
  String? buttonText,
  onButtonTap,
  ontap,
  required String imageUrl,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  title,
                  size: 16.0,
                  maxline: 1,
                  isBold: true,
                  color: AppColors.white,
                ),
                SizedBox(height: 2),
                commonText(
                  "Location: $location",
                  color: AppColors.white,
                  size: 14,
                  isBold: true,
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Flexible(
                      child: commonText(
                        daterange,
                        color: AppColors.white,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Image.asset(
                      "assets/participants (2).png",
                      color: AppColors.white,
                      width: 20,
                    ),
                    SizedBox(width: 2),
                    Flexible(
                      child: commonText(
                        player,
                        color: AppColors.white,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                if (buttonText != null)
                  Center(
                    child: commonButton(
                      buttonText,
                      height: 40,
                      color: AppColors.yellow,
                      textColor: AppColors.black,
                      onTap: onButtonTap,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
