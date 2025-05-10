import 'package:flutter/material.dart';
import 'package:vire_glof/manager/Analytics/analytics.dart';
import 'package:vire_glof/manager/League/League_page.dart';
import 'package:vire_glof/manager/Participants/participants.dart';
import 'package:vire_glof/manager/home/home_page.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/profile/profile_page.dart';

class ManagerRootScreen extends StatefulWidget {
  const ManagerRootScreen({Key? key}) : super(key: key);

  @override
  State<ManagerRootScreen> createState() => _ManagerRootScreenState();
}

class _ManagerRootScreenState extends State<ManagerRootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ManagerHomePage(),
    ManagerLeaguePage(),
    ParticipantsPage(),
    AnalyticesPage(),
    ProfileScreen(),
  ];

  final List<String> _iconPaths = [
    'assets/navigationIcons/deshboard.png',
    'assets/navigationIcons/League.png',
    'assets/participants (2).png',
    'assets/navigationIcons/analityces.png',
    'assets/navigationIcons/Profile.png',
  ];

  final List<String> _labels = [
    "Dashboard",
    "League",
    "Participants",
    "Analytics",
    "Profile",
  ];

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
