import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class AllParticipantsScreen extends StatefulWidget {
  const AllParticipantsScreen({super.key});

  @override
  State<AllParticipantsScreen> createState() => _AllParticipantsScreenState();
}

class _AllParticipantsScreenState extends State<AllParticipantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: commonText("All Participants", size: 16, isBold: true),
        centerTitle: true,
        leading: BackButton(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: _searchBar(),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return participatesCardDesign(
            name: "John Doe",
            email: "Email: john@example.com",
            handicap: "Handicap: Undefined",
            avgScore: "Average Score: Undefined",
            wins: "Wins: Undefined",
            leagues: "leagues",
          );
        },
      ),
    );
  }
}

Widget _searchBar() {
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
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

Widget participatesCardDesign({
  required String name,

  required String email,
  required String handicap,
  required String avgScore,
  required String wins,
  required String leagues,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.white,
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
      ),
      SizedBox(height: 20),
    ],
  );
}
