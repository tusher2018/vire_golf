import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';
import 'package:vire_glof/res/common_design.dart';

class PendingInvitationsScreen extends StatelessWidget {
  const PendingInvitationsScreen({super.key});

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
            title: "tom@example.com",
            subtitle: "Invited to: Spring League 2025",
            yesButtonText: "Resend",
            noButtonText: "Cancel",
            noOnTap: () {
              showLogoutDialog(context, () {
                Get.back();
              });
            },
            color: AppColors.blue,
          );
        },
      ),
    );
  }

  Future<void> showLogoutDialog(
    BuildContext context,
    VoidCallback onDelete,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: commonText(
            "Do you want to cancel the invitation?",
            size: 18,
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: commonButton(
                      "No",
                      color: Colors.transparent,
                      textColor: Colors.black,

                      height: 40,
                      width: 100,
                      onTap: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: commonButton(
                    "Yes",
                    color: AppColors.red,
                    textColor: Colors.white,
                    height: 40,
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                      onDelete(); // Perform the delete action
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
