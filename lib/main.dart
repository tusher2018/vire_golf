import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/controller/role_controller.dart';
import 'package:vire_glof/splash_page.dart';

void main() {
  Get.put(RoleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signup App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundWhite,
          elevation: 0,
        ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: AppColors.backgroundWhite,
      ),
      home: SplashScreen(),
    );
  }
}
