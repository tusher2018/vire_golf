import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/Battle/challenge_friend_screen.dart';
import 'package:vire_glof/player/play/map_page.dart';
import 'package:vire_glof/player/play/recent_round_details.dart';
import 'package:vire_glof/player/play/scoreboard_for_chalenges.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/common_design.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({super.key});

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  TextEditingController courseControler = TextEditingController();
  TextEditingController locationControler = TextEditingController();
  DateTime? selectedDateTime;
  List<String> players = ["John Doe", "Jane Smith", "Tiger Woods"];
  String? selectedPlayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              commonBorderButton(
                "Start a New Battle",
                onTap: () {
                  showStartGameDialog(context);
                  // showGameSummaryDialog(context);
                },
                icon: Image.asset(
                  "assets/navigationIcons/Battle.png",
                  color: Colors.blue,
                ),
                color: Colors.blue,
                textColor: Colors.blue,
              ),

              const SizedBox(height: 24),

              commonText("Upcoming Matches", size: 18.0, isBold: true),
              const SizedBox(height: 12),
              _upcomingCards(),
              const SizedBox(height: 24),
              commonText("Recent Rounds", size: 18.0, isBold: true),
              const SizedBox(height: 12),
              _recentRounds(),
              const SizedBox(height: 24),
              commonText("Active Battles", size: 18.0, isBold: true),
              const SizedBox(height: 12),
              _activeRounds(),

              const SizedBox(height: 24),
              commonText("Challenge a Friend", size: 16.0, isBold: true),
              const SizedBox(height: 8),

              _challengeFriends(),
              const SizedBox(height: 24),
              commonText("Past Battles", size: 18.0, isBold: true),
              const SizedBox(height: 12),
              _pastRounds(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _upcomingCards() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showGameSummaryDialog(
                context,
                location: locationControler.text,
                oponentName: selectedPlayer ?? "Player",
                selectedDateTime: selectedDateTime ?? DateTime.now(),
              );
            },
            child: _upcomingCard(
              title: "Jane Smith vs. Mike Brown",
              date: "March 10",
              time: "09:00 AM",
              location: "Pine Hills",
              buttonText: "Prepare",

              imageUrl:
                  "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
            ),
          );
        },
      ),
    );
  }

  Widget _upcomingCard({
    required String title,
    required String date,
    required String time,
    required String location,
    required String buttonText,
    required String imageUrl,
    double width = 210.0,
  }) {
    return Container(
      width: width,
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
            width: width,
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
                  size: 14.0,
                  maxline: 2,
                  isBold: true,
                  color: AppColors.white,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.white,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          commonText(
                            date,
                            color: AppColors.white,
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.white,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: commonText(
                              time,
                              color: AppColors.white,
                              isBold: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    commonText(location, color: AppColors.white, isBold: true),
                  ],
                ),

                Center(child: commonSmallButton(text: buttonText, padding: 40)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _activeRounds() {
    return Column(
      children: [
        buildLeagueCard(
          imageUrl2:
              "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
          imageUrl:
              "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
          title: "You vs. Mike Brown",
          subtitle_1: "Result: You won (72 vs. 70)",
          subtitle_2: "Date: March 1",
          buttonText: "Continue",
          onbuttontap: () {
            Get.to(ChallengeScoreboardPage());
          },
          color: AppColors.blue.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _pastRounds() {
    return Column(
      children: [
        buildLeagueCard(
          imageUrl2:
              "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
          imageUrl:
              "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
          title: "You vs. Mike Brown",
          subtitle_1: "Result: You won (72 vs. 70)",
          subtitle_2: "Date: March 1",
          buttonText: "View",
          onbuttontap: () {
            Get.to(PlayerRecentRoundDetailsScreen());
          },
        ),
      ],
    );
  }

  Widget _recentRounds() {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildLeagueCard(
          imageUrl:
              "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
          title: "Round at Pine Hills",
          subtitle_1: "Score: 76",
          subtitle_2: "Date: March 1",
          onbuttontap: () {
            Get.to(PlayerRecentRoundDetailsScreen());
          },
          buttonText: "View\nDetails",
          color: AppColors.blue.withOpacity(0.5),
        );
      },
    );
  }

  void showStartGameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context2) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: const Color(0xFFEFF5FF),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonTextfieldWithTitle(
                      "Golf Course",
                      courseControler,
                      hintText: "Enter golf course",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonText(
                          "Date",
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        // Date Picker
                        final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );

                        if (date != null) {
                          // Time Picker
                          final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (time != null) {
                            setState(() {
                              selectedDateTime = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                time.hour,
                                time.minute,
                              );
                            });
                          }
                        }
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonText(
                                (selectedDateTime != null)
                                    ? "${selectedDateTime!.toLocal()}".split(
                                      '.',
                                    )[0]
                                    : "Enter date",
                                size: 14,
                                color:
                                    (selectedDateTime != null)
                                        ? AppColors.black
                                        : AppColors.gray,
                              ),
                              Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors.yellow,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText("Choose Player", size: 14),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            value:
                                (selectedPlayer != null &&
                                        selectedPlayer!.isEmpty)
                                    ? null
                                    : selectedPlayer,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            hint: commonText(
                              "Enter player name",
                              color: AppColors.gray,
                              size: 14,
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            items:
                                players.map((String player) {
                                  return DropdownMenuItem<String>(
                                    value: player,
                                    child: commonText(player, size: 14),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedPlayer = newValue ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    commonTextfieldWithTitle(
                      "Location",
                      locationControler,
                      hintText: "Enter Location",
                    ),
                    const SizedBox(height: 24),
                    commonButton(
                      "Start",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).then((value) {
      if (selectedDateTime != null &&
          courseControler.text.isNotEmpty &&
          locationControler.text.isNotEmpty &&
          selectedPlayer != null) {
        showGameSummaryDialog(
          context,
          location: locationControler.text,
          oponentName: selectedPlayer!,
          selectedDateTime: selectedDateTime!,
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: "Missing Info",
            message: "Please fill out all fields.",
            margin: const EdgeInsets.all(16),
            borderRadius: 12,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2),
          ),
        );
      }

      courseControler.clear();
      locationControler.clear();
      selectedDateTime = null;
      selectedPlayer = null;
      setState(() {});
    });
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

  Widget _challengeFriends() {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 16),

        itemBuilder:
            (_, index) => InkWell(
              onTap: () {
                Get.to(PlayerChallengeFriendScreen());
              },
              child: Column(
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
      ),
    );
  }
}
