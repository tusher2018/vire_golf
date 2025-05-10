// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailontroller = TextEditingController();
  TextEditingController massegeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Contact Us", size: 16.0, isBold: true),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              commonTextfieldWithTitle(
                "Name",
                nameController,
                hintText: "Enter your name",
              ),
              SizedBox(height: 16),
              commonTextfieldWithTitle(
                "Email",
                nameController,
                hintText: "Enter your email",
              ),
              SizedBox(height: 16),
              commonTextfieldWithTitle(
                "Message",
                nameController,
                maxLine: 3,
                hintText: "Write your message...",
              ),
              SizedBox(height: 50),
              commonButton("Send"),
            ],
          ),
        ),
      ),
    );
  }
}
