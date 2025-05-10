// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/controller/role_controller.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController golfHanicapController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  final roleController = Get.find<RoleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Edit Profile", size: 16, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(
                          "Change profile picture",
                          size: 14,
                          isBold: true,
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 30,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.upload),
                            label: commonText("Upload from gallery"),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  // Name
                  commonTextfieldWithTitle(
                    "Your Name",
                    nameController,
                    hintText: "Enter your name",
                  ),

                  const SizedBox(height: 16),

                  // Handicap
                  if (roleController.isplayer.value)
                    commonTextfieldWithTitle(
                      "Your Golf Handicap",
                      golfHanicapController,
                      hintText: "Enter your name",
                      optional: true,
                    ),

                  const SizedBox(height: 16),

                  commonTextfieldWithTitle(
                    "Bio",
                    bioController,
                    maxLine: 3,
                    hintText: "Write about yourself",
                    optional: true,
                  ),

                  const SizedBox(height: 20),

                  // Stats
                  (roleController.isplayer.value)
                      ? Card(
                        color: AppColors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStat(ImagePaths.winsIcon, "Wins", "15"),
                              _buildStat(
                                ImagePaths.totalRoundPlayedIcon,
                                "Total Rounds Played",
                                "25",
                              ),
                              _buildStat(
                                ImagePaths.avaragescoreIcon,
                                "Average Score",
                                "74",
                              ),
                            ],
                          ),
                        ),
                      )
                      : Card(
                        color: AppColors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStat(
                                ImagePaths.winsIcon,
                                "Leagues Created",
                                "15",
                              ),

                              _buildStat(
                                "assets/participants.png",
                                "Participants Managed",
                                "25",
                              ),
                              _buildStat(
                                "assets/matchOrganized.png",
                                "Matches Organized",
                                "74",
                              ),
                            ],
                          ),
                        ),
                      ),

                  const SizedBox(height: 30),

                  commonButton(
                    "Save",
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String iconPath, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(iconPath),
              const SizedBox(width: 10),
              commonText("$title:", size: 14, isBold: true),
            ],
          ),

          const SizedBox(height: 2),
          commonText(value, size: 14),
        ],
      ),
    );
  }
}
