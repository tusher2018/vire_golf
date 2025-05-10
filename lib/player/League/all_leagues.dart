import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/League/leagues_details.dart';
import 'package:vire_glof/res/commonWidgets.dart'; // For navigation

class AllLeaguesScreen extends StatelessWidget {
  // Dummy data
  final List<Map<String, String>> leagueData = [
    {
      'title': 'Pro Championship 2025',
      'subtitle': 'Sponsored by GolfPro',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Summer Open League',
      'subtitle': 'Rank: 16/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Winter Cup 2025',
      'subtitle': 'Rank: 5/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro Championship 2025',
      'subtitle': 'Sponsored by GolfPro',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Summer Open League',
      'subtitle': 'Rank: 16/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Winter Cup 2025',
      'subtitle': 'Rank: 5/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro Championship 2025',
      'subtitle': 'Sponsored by GolfPro',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Summer Open League',
      'subtitle': 'Rank: 16/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Winter Cup 2025',
      'subtitle': 'Rank: 5/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro Championship 2025',
      'subtitle': 'Sponsored by GolfPro',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Summer Open League',
      'subtitle': 'Rank: 16/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Winter Cup 2025',
      'subtitle': 'Rank: 5/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: commonText('All Leagues', size: 16, isBold: true),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 1.5, // Aspect ratio of each grid item
            crossAxisSpacing: 12, // Spacing between items horizontally
            mainAxisSpacing: 12, // Spacing between items vertically
          ),
          itemCount: leagueData.length,
          itemBuilder: (context, index) {
            return _leagueCard(
              title: leagueData[index]['title']!,
              subtitle: leagueData[index]['subtitle']!,
              buttonText: 'Explore',
              imageUrl: leagueData[index]['imageUrl']!,
              ontap: () {
                // Navigate to League Details Screen
                Get.to(PlayerLeagueDetailsScreen());
              },
            );
          },
        ),
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
}
