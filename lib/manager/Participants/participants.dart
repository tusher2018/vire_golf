import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/Participants/all_participants_page.dart';
import 'package:vire_glof/manager/Participants/pending_invitations.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/common_design.dart';

class ParticipantsPage extends StatefulWidget {
  const ParticipantsPage({super.key});

  @override
  State<ParticipantsPage> createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: commonBorderButton(
                "Invite Participant",
                onTap: () {
                  showStartRoundDialog(context);
                },
                icon: Image.asset("assets/personadd.png", color: Colors.blue),
                color: Colors.blue,
                textColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            _sectionHeader("All Participants", () {
              Get.to(AllParticipantsScreen());
            }),
            const SizedBox(height: 8),
            _searchBar(),

            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showParticipantProfileDialog(context);
                  },
                  child: participatesCardDesign(
                    name: "John Doe",
                    email: "Email: john@example.com",
                    handicap: "Handicap: Undefined",
                    avgScore: "Average Score: Undefined",
                    wins: "Wins: Undefined",
                    leagues: "leagues",
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _sectionHeader("Pending Invitations", () {
              Get.to(PendingInvitationsScreen());
            }),
            const SizedBox(height: 8),
            ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 7, // for demo purposes
              itemBuilder: (context, index) {
                return buildLeagueInvitationCard(
                  title: "tom@example.com",
                  subtitle: "Invited to: Spring League 2025",
                  yesButtonText: "Resend",
                  noButtonText: "Cancel",
                  noOnTap: () {
                    showLogoutDialog(context, () {
                      Get.back();
                    });
                  },
                  yesOnTap: () {},
                  color: AppColors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _searchBar() {
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16),
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF1FF),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for leagues...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _sectionHeader(String title, Function() ontap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        commonText(title, size: 18.0, isBold: true),
        InkWell(
          onTap: ontap,
          child: commonText(
            "See All",
            size: 14.0,
            isBold: true,
            haveUnderline: true,
          ),
        ),
      ],
    ),
  );
}

Widget participatesCardDesign({
  required String name,

  required String email,
  required String handicap,
  required String avgScore,
  required String wins,
  required String leagues,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.blue.withOpacity(0.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://image.lexica.art/full_webp/9f8136dd-0fe5-4b22-b490-4c87e2722c5a",
              ),
              radius: 24,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonText(name, size: 16, isBold: true),
                  commonText(email, size: 14),
                  commonText(handicap, size: 14),
                  commonText(avgScore, size: 14),
                  commonText(wins, size: 14),
                  commonText(leagues, size: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showLogoutDialog(
  BuildContext context,
  VoidCallback onDelete,
) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: commonText(
          "Do you want to cancel the invitation?",
          size: 18,
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: AppColors.gray.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: commonButton(
                    "No",
                    color: Colors.transparent,
                    textColor: Colors.black,

                    height: 40,
                    width: 100,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: commonButton(
                  "Yes",
                  color: AppColors.red,
                  textColor: Colors.white,
                  height: 40,
                  width: 100,
                  onTap: () {
                    onDelete(); // Perform the delete action
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<void> showStartRoundDialog(BuildContext context) async {
  final TextEditingController emailController = TextEditingController();
  String? selectedLeague;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, // Set width here
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  commonTextfieldWithTitle(
                    "Email",
                    hintText: "Enter participant’s email",
                    emailController,
                  ),
                  const SizedBox(height: 16),
                  commonText("Select League", size: 14, isBold: true),
                  const SizedBox(height: 8),
                  commonDropdown<String>(
                    items: [
                      "Pine Hills",
                      "Spring League 2025",
                      "Summer Classic",
                    ],
                    value: selectedLeague,
                    hint: "Select a league",
                    onChanged: (val) {
                      setState(() {
                        selectedLeague = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  commonButton(
                    "Send Invitation",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Future<void> showParticipantProfileDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header Row with Avatar and Close
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "https://image.lexica.art/full_webp/9f8136dd-0fe5-4b22-b490-4c87e2722c5a",
                        ),
                      ),
                      const SizedBox(width: 8),
                      commonText("John Doe", size: 16, isBold: true),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Profile Title
              Align(
                alignment: Alignment.centerLeft,
                child: commonText("Profile", isBold: true),
              ),

              const SizedBox(height: 8),

              /// Info Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F7FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText("Email: john@example.com", size: 14),
                    commonText("Phone: 123 456 789", size: 14),
                    commonText("Handicap: Undefined", size: 14),
                    commonText("Average Score: Undefined", size: 14),
                    commonText("Wins: Undefined", size: 14),
                    commonText("Match Played: 23", size: 14),
                    commonText("Leagues: Pine Hills", size: 14),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Remove Button
              commonButton(
                "Remove from League",
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
