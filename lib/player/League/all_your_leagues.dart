import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/League/your_leagues_details.dart';
import 'package:vire_glof/res/commonWidgets.dart'; // For navigation

class YourLeaguesScreen extends StatelessWidget {
  // Dummy data for the leagues
  final List<Map<String, String>> leagueData = [
    {
      'title': 'Summer Open League',
      'subtitle': 'Rank: 16/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Winter Cup 2025',
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 12/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Golf Masters 2025',
      'subtitle': 'Rank: 3/20',
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
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 12/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Golf Masters 2025',
      'subtitle': 'Rank: 3/20',
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
      'subtitle': 'Rank: 8/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Pro League Championship',
      'subtitle': 'Rank: 12/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
    {
      'title': 'Golf Masters 2025',
      'subtitle': 'Rank: 3/20',
      'imageUrl':
          'https://img.freepik.com/free-photo/man-playing-golf_1286-128.jpg?t=st=1744793063~exp=1744796663~hmac=98846de5bd2e21db48d3ecad1a78667355e1b599901497a43ee03c560d818ae4&w=996',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: commonText('Your Leagues', size: 16, isBold: true),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: leagueData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns
            crossAxisSpacing: 12, // Space between columns
            mainAxisSpacing: 12, // Space between rows
            childAspectRatio: 1.5, // Adjust the aspect ratio of each grid item
          ),
          itemBuilder: (context, index) {
            return _leagueCard(
              title: leagueData[index]['title']!,
              subtitle: leagueData[index]['subtitle']!,
              buttonText: 'View',
              imageUrl: leagueData[index]['imageUrl']!,
              ontap: () {
                // Navigate to League Details Screen
                Get.to(YourLeagueDetailsScreen());
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
  }) {
    return GestureDetector(
      onTap: () => ontap(),
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
              width: double.infinity,
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
                  SizedBox(height: 8.0), // Add space before the button
                  commonSmallButton(
                    text: buttonText,
                    padding: 50,
                    ontap: ontap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
