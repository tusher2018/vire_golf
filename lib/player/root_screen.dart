import 'package:flutter/material.dart';
import 'package:vire_glof/player/Battle/battile_screen.dart';
import 'package:vire_glof/player/Feed/feed_page.dart';
import 'package:vire_glof/player/League/home_page.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/play/play.dart';
import 'package:vire_glof/profile/profile_page.dart';

class PlayerRootScreen extends StatefulWidget {
  const PlayerRootScreen({Key? key}) : super(key: key);

  @override
  State<PlayerRootScreen> createState() => _PlayerRootScreenState();
}

class _PlayerRootScreenState extends State<PlayerRootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    FeedScreen(),
    PlayPage(),
    BattlePage(),
    ProfileScreen(),
  ];

  final List<String> _iconPaths = [
    'assets/navigationIcons/League.png',
    'assets/navigationIcons/Feed.png',
    'assets/navigationIcons/Play.png',
    'assets/navigationIcons/Battle.png',
    'assets/navigationIcons/Profile.png',
  ];

  final List<String> _labels = ["Leagues", "Feed", "Play", "Battle", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: Colors.grey,
        items: List.generate(_iconPaths.length, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              _iconPaths[index],
              height: 24,
              width: 24,
              color:
                  _currentIndex == index ? AppColors.yellow : AppColors.black,
            ),
            label: _labels[index],
          );
        }),
      ),
    );
  }
}
