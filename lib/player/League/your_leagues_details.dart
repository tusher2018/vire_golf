import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class YourLeagueDetailsScreen extends StatelessWidget {
  const YourLeagueDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: commonText("Your League Details", size: 16.0, isBold: true),

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
                        "Spring League 2025",
                        size: 20.0,
                        isBold: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _scheduleSection(),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              _userStats(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    commonText("Upcoming Matches", size: 16.0, isBold: true),
                    const SizedBox(height: 8),
                    _upcomingMatches(),
                    const SizedBox(height: 24),
                    commonText("League Leaderboard", size: 16.0, isBold: true),
                    const SizedBox(height: 8),
                    _leaderboard(),
                    const SizedBox(height: 24),
                    commonText("Recent Activity", size: 16.0, isBold: true),
                    const SizedBox(height: 8),
                    _recentActivity(),
                    const SizedBox(height: 24),
                    commonText("Participants (20)", size: 16.0, isBold: true),
                    const SizedBox(height: 8),
                    _participants(),
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

  Widget _userStats() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.blue),
      child: Column(
        children: [
          commonText("Sarah Green", isBold: true, size: 16),
          const SizedBox(height: 4),
          commonText("3rd", size: 20.0, isBold: true, color: AppColors.yellow),
          const SizedBox(height: 4),
          commonText("Points: 120   |   Matches Played: 5", size: 12.0),
        ],
      ),
    );
  }

  Widget _upcomingMatches() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _matchCard("You vs. Mike Brown", "March 17, 9:00 AM"),
          Divider(color: AppColors.white, height: 2),
          _matchCard("You vs. Jane Smith", "March 20, 10:00 AM"),
        ],
      ),
    );
  }

  Widget _matchCard(String title, String time) {
    return Container(
      padding: const EdgeInsets.all(12),

      child: Row(
        children: [
          SizedBox(width: 8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.apple.com/newsroom/images/2024/05/apple-watch-is-the-perfect-golfing-companion/article/Apple-Watch-golf-companion-hero_big.jpg.large.jpg",
                ),
                radius: 18,
              ),
              Positioned(
                left: 30, // shift second avatar slightly right
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
                  ),
                  radius: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ), // add spacing to compensate for Stack width
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(title, isBold: true, size: 14),
                commonText(time, size: 12.0),
              ],
            ),
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

  Widget _recentActivity() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText("You won a match against Jane Smith", isBold: true),
          commonText("2 hours ago", size: 12.0),
          const Divider(height: 16),
          commonText("Mike Brown joined the league", isBold: true),
          commonText("Yesterday", size: 12.0),
        ],
      ),
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
}
