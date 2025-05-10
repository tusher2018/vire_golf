// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/home/create_leagues_2.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeagueScreen extends StatefulWidget {
  CreateLeagueScreen({super.key});

  @override
  State<CreateLeagueScreen> createState() => _CreateLeagueScreenState();
}

class _CreateLeagueScreenState extends State<CreateLeagueScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController teeTimeIntervalController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isManualTeeTime = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<String> timeZones = ["New York", "Chicago", "Los Angeles"];
  String selectedTimeZone = "New York";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: commonText("Create a New League", size: 16, isBold: true),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonTextfieldWithTitle(
              "League Name",
              nameController,
              hintText: "Enter league name",
            ),

            const SizedBox(height: 16),
            commonText("Start Date", size: 14, fontWeight: FontWeight.w500),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() => selectedDate = date);
                }
              },
              child: commonDateInputBox(
                selectedDate != null
                    ? "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                    : "Enter start date",
              ),
            ),

            const SizedBox(height: 16),
            commonText(
              "Start Time am/pm",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() => selectedTime = time);
                }
              },
              child: commonDateInputBox(
                selectedTime != null
                    ? selectedTime!.format(context)
                    : "Enter start time",
                icon: Icons.access_time,
              ),
            ),

            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Minutes Between Tee Times",
              teeTimeIntervalController,
              hintText: "Enter tee time",
            ),

            const SizedBox(height: 16),
            commonText(
              "Manually Set Tee Times",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            Row(
              children: [
                Checkbox(
                  value: isManualTeeTime,

                  onChanged: (val) {
                    setState(() => isManualTeeTime = val ?? false);
                  },
                ),
                commonText("Tee times will be set manually"),
              ],
            ),

            const SizedBox(height: 8),
            commonText("Time Zone", size: 14, fontWeight: FontWeight.w500),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: selectedTimeZone,
                decoration: const InputDecoration(border: InputBorder.none),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items:
                    timeZones.map((zone) {
                      return DropdownMenuItem(
                        value: zone,
                        child: commonText(zone),
                      );
                    }).toList(),
                onChanged:
                    (val) => setState(() => selectedTimeZone = val ?? ""),
              ),
            ),

            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Description",
              descriptionController,
              hintText: "Write a description",
              maxLine: 2,
            ),

            const SizedBox(height: 30),
            commonButton(
              "Next",
              haveNextIcon: true,
              onTap: () {
                Get.to(CreateLeague2ndScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget commonDateInputBox(
  String text, {
  IconData icon = Icons.calendar_month_outlined,
}) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(
            text,
            size: 14,
            color: text.contains("Enter") ? AppColors.gray : AppColors.black,
          ),
          Icon(icon, color: AppColors.yellow),
        ],
      ),
    ),
  );
}
