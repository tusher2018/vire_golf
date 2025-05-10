import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/player/League/all_leagues.dart';
import 'package:vire_glof/player/League/all_your_leagues.dart';
import 'package:vire_glof/player/League/join_league.dart';
import 'package:vire_glof/player/League/league_invitations_screen.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/League/leagues_details.dart';
import 'package:vire_glof/player/League/your_leagues_details.dart';
import 'package:vire_glof/profile/notifications.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/common_design.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: _searchBar(),
        ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _sectionHeader("Your Leagues", () {
                Get.to(YourLeaguesScreen());
              }),
              const SizedBox(height: 12),
              _leagueCards(),
              const SizedBox(height: 24),
              _sectionHeader("Featured Leagues", () {
                Get.to(AllLeaguesScreen());
              }),
              const SizedBox(height: 12),
              _featuredLeagues(),
              const SizedBox(height: 24),
              _sectionHeader("League Invitations", () {
                navigateToPage(LeagueInvitationsScreen());
              }),
              const SizedBox(height: 12),
              _leagueInvitations(),
              const SizedBox(height: 24),
              _sectionHeader("Join a League", () {
                navigateToPage(JoinLeagueScreen());
              }),
              const SizedBox(height: 12),
              _joinLeagues(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
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
    return Row(
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
    );
  }

  Widget _leagueCards() {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _leagueCard(
            title: "Summer Open League",
            subtitle: "rank: 16/20",
            buttonText: "View",
            ontap: () {
              Get.to(YourLeagueDetailsScreen());
            },
            imageUrl:
                "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
          );
        },
      ),
    );
  }

  Widget _leagueCard({
    required String title,
    required String subtitle,
    required String buttonText,
    required String imageUrl,
    ontap,
    double width = 200.0,
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
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: commonText(
                    title,
                    size: 16.0,
                    isBold: true,
                    color: AppColors.white,
                  ),
                ),
                commonText(
                  subtitle,
                  size: 12.0,
                  color: AppColors.white,
                  isBold: true,
                ),

                commonSmallButton(text: buttonText, padding: 30, ontap: ontap),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featuredLeagues() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return _leagueCard(
          title: "Pro Championship 2025",
          subtitle: "Sponsored by GolfPro",
          buttonText: "Explore",
          ontap: () {
            Get.to(PlayerLeagueDetailsScreen());
          },
          imageUrl:
              "https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996",
        );
      },
    );
  }

  Widget _leagueInvitations() {
    return Column(
      children: [
        buildLeagueInvitationCard(
          imageUrl:
              "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
          title: "Fall Championship",
          subtitle: "Invited by: Mike Brown",
        ),
        buildLeagueInvitationCard(
          imageUrl:
              "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
          title: "Fall Championship",
          subtitle: "Invited by: Mike Brown",
        ),
      ],
    );
  }

  Widget _joinLeagues() {
    return Column(
      children: [
        buildLeagueCard(
          imageUrl:
              "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
          title: "Summer Open League",
          subtitle_1: "Location: Pine Hills",
          subtitle_2: "Players: 15/20",
          buttonText: "Join",
        ),
        buildLeagueCard(
          imageUrl:
              "https://img.freepik.com/free-photo/portrait-smiling-businessman_171337-5564.jpg",
          title: "Summer Open League",
          subtitle_1: "Location: Pine Hills",
          subtitle_2: "Players: 15/20",
          buttonText: "Join",
        ),
      ],
    );
  }
}
