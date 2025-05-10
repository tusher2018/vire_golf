import 'package:flutter/material.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/common_design.dart';

class JoinLeagueScreen extends StatelessWidget {
  const JoinLeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Join a League", size: 16.0, isBold: true),
        centerTitle: true,
        leading: const BackButton(),
        elevation: 0.3,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 7, // for demo purposes
        itemBuilder: (context, index) {
          return buildLeagueCard(
            imageUrl:
                "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
            title: "Summer Open League",
            subtitle_1: "Location: Pine Hills",
            subtitle_2: "Players: 15/20",
            buttonText: "Join",
          );
        },
      ),
    );
  }
}
