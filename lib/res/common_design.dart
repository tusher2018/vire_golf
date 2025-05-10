import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

Widget buildLeagueCard({
  required String imageUrl,
  required String title,
  required String subtitle_1,
  required String subtitle_2,
  required buttonText,
  onbuttontap,
  Color color = AppColors.white,
  String? imageUrl2,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            (imageUrl2 == null)
                ? CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(imageUrl),
                )
                : SizedBox(
                  width: 72,
                  height: 48,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      Positioned(
                        left: 30,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(imageUrl2),
                        ),
                      ),
                    ],
                  ),
                ),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(title, size: 14.0, isBold: true),
                  const SizedBox(height: 4),
                  commonText(subtitle_1, size: 12.0),
                  const SizedBox(height: 4),
                  commonText(subtitle_2, size: 12.0),
                ],
              ),
            ),
            const SizedBox(width: 12),
            commonSmallButton(
              text: buttonText,
              padding: 24,
              radious: 10,
              ontap: onbuttontap,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildLeagueInvitationCard({
  String? imageUrl,
  String? title,
  String? subtitle,
  String yesButtonText = "Accept",
  String noButtonText = "Decline",
  Color color = AppColors.white,
  yesOnTap,
  noOnTap,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        if (imageUrl != null)
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              imageUrl,
            ), // Replace with actual image path
          ),
        const SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) commonText(title, size: 14.0, isBold: true),
              const SizedBox(height: 4),
              commonText("$subtitle", size: 12.0),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: FittedBox(
            child: Row(
              children: [
                commonSmallButton(text: yesButtonText, ontap: yesOnTap),
                const SizedBox(width: 8),
                commonSmallButton(
                  text: noButtonText,
                  color: AppColors.red,
                  textColor: AppColors.white,
                  ontap: noOnTap,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
