import 'package:flutter/material.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/common_design.dart';

class LeagueInvitationsScreen extends StatelessWidget {
  const LeagueInvitationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("League Invitations", size: 16.0, isBold: true),
        centerTitle: true,
        leading: const BackButton(),
        elevation: 0.3,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 7, // for demo purposes
        itemBuilder: (context, index) {
          return buildLeagueInvitationCard(
            imageUrl:
                "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
            title: "Fall Championship",
            subtitle: "Invited by: Mike Brown",
          );
        },
      ),
    );
  }
}
