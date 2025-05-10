import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/manager/home/create_leagues_4.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeague3rdScreen extends StatefulWidget {
  const CreateLeague3rdScreen({super.key});

  @override
  State<CreateLeague3rdScreen> createState() => _CreateLeague3rdScreenState();
}

class _CreateLeague3rdScreenState extends State<CreateLeague3rdScreen> {
  String selectedNineHoleOption = "Front and back nines alternate each week";
  String selected18HoleOption = "Different courses are played each week";
  bool alternateMatchCheckbox = false;

  final List<String> nineHoleOptions = [
    "Same nine used each week",
    "Front and back nines alternate each week",
    "Three nines alternate each week",
    "Four nines alternate each week",
    "Two of Three nines alternate each week",
    "Two of Four nines alternate each week",
    "Different nines are played each week",
    "Flights 1 and 2 alternate front and back nines each week",
    "Flights 1,2 and 3,4 alternate front and back nines each week",
    "Flights 1,2 and 3 alternate 3 nines each week",
    "Flights 1,2,3,4 and 5,6,7,8 alternate 2 sides each week",
    "Front and back nines are played each week",
  ];

  int? frist9, secound9;
  TextEditingController frist239Controller = TextEditingController();
  TextEditingController secound239Controller = TextEditingController();
  TextEditingController frist249Controller = TextEditingController();
  TextEditingController secound249Controller = TextEditingController();
  TextEditingController fristFontBackController = TextEditingController();
  TextEditingController secoundFontBackController = TextEditingController();

  Widget extraWidgets(
    TextEditingController fristController,
    TextEditingController secoundController,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        commonNumberInputField(
          hintText: "Matches on First Nine",
          value: frist9 ?? 0,
          controller: fristController,
          onChanged: (val) => setState(() => frist9 = val),
        ),
        SizedBox(height: 8),
        commonNumberInputField(
          hintText: "Matches on Second Nine",
          value: frist9 ?? 0,
          controller: secoundController,
          onChanged: (val) => setState(() => frist9 = val),
        ),
      ],
    );
  }

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
            _sectionTitle("9–Hole Leagues"),
            commonRadioGroup(
              "9-Hole",
              nineHoleOptions,
              conditionalWidgets: {
                "Two of Three nines alternate each week": extraWidgets(
                  frist239Controller,
                  secound239Controller,
                ),
                "Two of Four nines alternate each week": extraWidgets(
                  frist249Controller,
                  secound249Controller,
                ),
                "Front and back nines are played each week": extraWidgets(
                  fristFontBackController,
                  secoundFontBackController,
                ),
              },
              selectedNineHoleOption,
              crossAxisCount: 1,
              (val) => setState(() => selectedNineHoleOption = val),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: alternateMatchCheckbox,
                  onChanged:
                      (val) =>
                          setState(() => alternateMatchCheckbox = val ?? false),
                  activeColor: AppColors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Flexible(
                  child: commonText(
                    "The number of matches on each nine alternate each week",
                    size: 14,
                  ),
                ),
              ],
            ),

            _sectionTitle("18–Hole Leagues"),

            commonRadioGroup(
              "18-Hole",
              [
                "Same course is played each week",
                "Different courses are played each week",
              ],
              selected18HoleOption,
              crossAxisCount: 1,
              (val) => setState(() => selected18HoleOption = val),
            ),

            const SizedBox(height: 20),
            commonButton(
              "Next",
              haveNextIcon: true,
              onTap: () {
                Get.to(CreateLeague4thScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: commonText(title, isBold: true, size: 16),
    );
  }
}
