import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'subtitle': 'You have a new message from John.',
      'time': '2 min ago',
    },
    {
      'title': 'Update Available',
      'subtitle': 'Version 2.0.1 is now available.',
      'time': '10 min ago',
    },
    {
      'title': 'Meeting Reminder',
      'subtitle': 'Your meeting starts in 30 minutes.',
      'time': '1 hour ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText('Notifications', size: 16, isBold: true),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [commonText(notification['time'] ?? '')],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_active,
                    color: AppColors.yellow,
                  ),
                  title: commonText(
                    notification['title'] ?? '',
                    size: 14,
                    isBold: true,
                  ),
                  subtitle: commonText(notification['subtitle'] ?? ''),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
