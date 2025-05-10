import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/controller/role_controller.dart';
import 'package:vire_glof/profile/about_us.dart';
import 'package:vire_glof/profile/contact_us.dart';
import 'package:vire_glof/profile/edit_profile.dart';
import 'package:vire_glof/profile/privacy_policy.dart';
import 'package:vire_glof/profile/settings.dart';
import 'package:vire_glof/profile/terms_and_condition.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final roleController = Get.find<RoleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Card(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
                      ),
                    ),
                    const SizedBox(height: 10),
                    commonText("Muhammad Zidane", size: 18.0, isBold: true),
                    const SizedBox(height: 4),
                    Obx(() {
                      return commonText(
                        (roleController.isplayer.value)
                            ? "Handicap: 12.5"
                            : "League Manager",
                        size: 14.0,
                        fontWeight: FontWeight.w500,
                      );
                    }),
                    const SizedBox(height: 4),
                    Obx(() {
                      return commonText(
                        (roleController.isplayer.value)
                            ? "Avid golfer looking to improve my game!"
                            : "Experienced league Manager with a passion for golf.",
                        size: 12.0,
                        color: Colors.grey,
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuItem(
                    "Edit Profile",
                    ImagePaths.profileEditIcon,
                    ontap: () {
                      Get.to(EditProfileScreen());
                    },
                  ),
                  _buildMenuItem(
                    "General Settings",
                    ImagePaths.profileSettingsIcon,
                    ontap: () {
                      Get.to(SettingsScreen());
                    },
                  ),
                  _buildMenuItem(
                    "Privacy Policy",
                    ImagePaths.profilePrivacypolicyIcon,
                    ontap: () {
                      Get.to(PrivacyPolicyScreen());
                    },
                  ),
                  _buildMenuItem(
                    "Terms and Condition",
                    ontap: () {
                      Get.to(TermsAndConditonScreen());
                    },
                    ImagePaths.profiletreamsAndAboutUsIcon,
                  ),
                  _buildMenuItem(
                    "About Us",
                    ontap: () {
                      Get.to(AboutUsScreen());
                    },
                    ImagePaths.profiletreamsAndAboutUsIcon,
                  ),
                  _buildMenuItem(
                    "Contact Us",
                    ImagePaths.profileContactUsIcon,
                    ontap: () {
                      Get.to(ContactUsScreen());
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(-6, 0),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(6, 0),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.logout, color: AppColors.yellow),
                title: commonText("Log Out", size: 16.0),
                onTap: () {
                  showLogoutDialog(context, () {});
                },
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
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
            "Do you want to logout your profile?",
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

  Widget _buildMenuItem(String title, String path, {required ontap}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Image.asset(path, color: AppColors.yellow),
          title: commonText(title, size: 14.0, isBold: true),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: ontap,
        ),
        const Divider(),
      ],
    );
  }
}
