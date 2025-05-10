import 'package:flutter/material.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  String? selectedLeague;
  TextEditingController announcementController = TextEditingController();
  @override
  void dispose() {
    announcementController.clear();
    selectedLeague = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: commonText("Announcement", size: 16, isBold: true),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            commonText("League", size: 14, isBold: true),
            const SizedBox(height: 8),
            commonDropdown<String>(
              items: ["Pine Hills", "Spring League 2025", "Summer Classic"],
              value: selectedLeague,
              hint: "Select a league",
              onChanged: (val) {
                setState(() {
                  selectedLeague = val;
                });
              },
            ),
            SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Announcement",
              maxLine: 3,
              announcementController,
              hintText: "Write your announcement here",
            ),
            SizedBox(height: 30),
            commonButton("Send to Players"),
          ],
        ),
      ),
    );
  }
}
