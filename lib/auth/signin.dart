import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/assets.dart';
import 'package:vire_glof/auth/signup.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/auth/forget_pass.dart';
import 'package:vire_glof/controller/role_controller.dart';
import 'package:vire_glof/manager/manager_root_screen.dart';
import 'package:vire_glof/player/root_screen.dart';
import '../res/commonWidgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final roleController = Get.find<RoleController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool isPasswordVisible = false;
  int selectedPlayerType = 0; // 0: Player, 1: Coach

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(ImagePaths.logo, height: 80),

                const SizedBox(height: 20),

                // Email TextField
                commonTextfieldWithTitle(
                  "Email",
                  emailController,
                  hintText: "Enter your email",
                  assetIconPath: ImagePaths.emailIcon,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),

                // Password TextField with Visibility Toggle
                commonTextfieldWithTitle(
                  "Password",
                  passwordController,
                  hintText: "Enter your password",
                  assetIconPath: ImagePaths.lockIcon,

                  isPasswordVisible: isPasswordVisible,
                  issuffixIconVisible: true,
                  changePasswordVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 15),

                // Remember Me and Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        commonText("Remember me", size: 12.0),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: commonText(
                        "Forgot Password",
                        size: 12.0,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     PlayerSelector(
                //       label: "Player",
                //       isSelected: selectedPlayerType == 0,
                //       onTap: () {
                //         setState(() {
                //           selectedPlayerType = 0;
                //         });
                //       },
                //     ),
                //     const SizedBox(width: 20),
                //     PlayerSelector(
                //       label: "Coach",
                //       isSelected: selectedPlayerType == 1,
                //       onTap: () {
                //         setState(() {
                //           selectedPlayerType = 1;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                const SizedBox(height: 20),
                // Sign In Button
                commonButton(
                  "Sign In",
                  onTap: () {
                    if (roleController.isplayer.value) {
                      Get.to(PlayerRootScreen());
                    } else {
                      Get.to(ManagerRootScreen());
                    }
                  },
                ),
                SizedBox(height: 20),

                const SizedBox(height: 20),

                // Or Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.black.withOpacity(0.3)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: commonText("Or", size: 16.0),
                    ),
                    Expanded(
                      child: Divider(color: Colors.black.withOpacity(0.3)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Sign In with Google
                commonBorderButton(
                  "Sign In With Google",
                  imagePath: ImagePaths.googleIcon,

                  onTap: () {
                    // Handle Google Sign In
                  },
                ),
                const SizedBox(height: 16),

                // Sign In with Facebook
                commonBorderButton(
                  "Sign In With Facebook",
                  imagePath: ImagePaths.facebookIcon,

                  onTap: () {
                    // Handle Facebook Sign In
                  },
                ),
                const SizedBox(height: 30),

                // Already have an account? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Don't have an account? ", size: 12.0),
                    GestureDetector(
                      onTap: () {
                        navigateToPage(SignUpScreen());
                      },
                      child: commonText(
                        "Sign Up",
                        size: 12.0,
                        color: AppColors.black,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerSelector extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;

  const PlayerSelector({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isSelected ? AppColors.primaryGradient : null,
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey,
                width: 2,
              ),
            ),
            child:
                isSelected
                    ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                    : null,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
