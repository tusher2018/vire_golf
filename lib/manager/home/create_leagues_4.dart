import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/manager/home/create_leagues_5.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeague4thScreen extends StatefulWidget {
  const CreateLeague4thScreen({super.key});

  @override
  State<CreateLeague4thScreen> createState() => _CreateLeague4thScreenState();
}

class _CreateLeague4thScreenState extends State<CreateLeague4thScreen> {
  String handicapOption = "Handicap Entry";
  String roundingPreference = "All handicaps are rounded down";
  String teamRanking = "Manually Rank Team Members by Player Position";
  String scorecardDisplay =
      "Display Scorecard Tick Marks for Subtracted Handicaps";

  String selectedOption = '1';

  final TextEditingController bestOfController = TextEditingController();
  final TextEditingController lastOfController = TextEditingController();
  final TextEditingController avgLastController = TextEditingController();
  final TextEditingController minusHiLoController = TextEditingController();
  final TextEditingController minScoresController = TextEditingController();
  int selectedBestof = 0;
  int selectedLastof = 0;
  int selectedavgLast = 0;
  int selectedminusHiLo = 0;
  int selectedminScores = 0;

  int? maxHandicap, minHandicap, maxIndex, matchPlayMax, matchPlayMin;
  final TextEditingController maxHandiCapController = TextEditingController();
  final TextEditingController minHandiCapController = TextEditingController();
  final TextEditingController maxIndexController = TextEditingController();
  final TextEditingController matchPlayMaxController = TextEditingController();
  final TextEditingController matchPlayMinController = TextEditingController();

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: commonText(title, isBold: true, size: 16),
  );

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
            _sectionTitle("Handicap Calculation Options"),

            commonRadioGroupWithWidgetsOnly(
              selectedValue: selectedOption,
              onChanged: (val) => setState(() => selectedOption = val),
              widgets: [
                commonText('None', size: 14),
                commonText('Handicap Entry', size: 14),
                commonText('Index Entry', size: 14),
                commonText('Index, Best 8 of Last 20 Grad', size: 14),
                commonText('Average of All Scores', size: 14),
                Row(
                  children: [
                    commonText('Average, Best', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('of Last', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('Scores', size: 14),
                  ],
                ),
                Row(
                  children: [
                    commonText('Average, Last', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('Scores', size: 14),
                  ],
                ),
                Row(
                  children: [
                    commonText('Average, Last', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('Scores Minus Hi/Lo', size: 14),
                  ],
                ),
                Row(
                  children: [
                    commonText('Index, Best', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('of Last', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('Scores', size: 14),
                  ],
                ),
                Row(
                  children: [
                    commonText('Index, Last', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('Scores', size: 14),
                  ],
                ),
                Row(
                  children: [
                    commonText('Index, Last', size: 14),
                    SizedBox(width: 8),
                    commonTextField(),
                    SizedBox(width: 8),
                    commonText('Scores Minus Hi/Lo', size: 14),
                  ],
                ),
                commonText('Index, Best 5 of Last 10 Grad.', size: 14),
              ],
            ),

            _sectionTitle("Percent of Handicap"),
            SizedBox(height: 10),
            commonText("Maximum Handicap", size: 14),
            SizedBox(height: 4),
            commonNumberInputField(
              hintText: "",
              controller: maxHandiCapController,
              value: maxHandicap ?? 0,
              onChanged: (val) => setState(() => maxHandicap = val),
            ),

            SizedBox(height: 10),
            commonText("Minimum Handicap", size: 14),
            SizedBox(height: 4),
            commonNumberInputField(
              hintText: "",
              value: minHandicap ?? 0,
              controller: minHandiCapController,
              onChanged: (val) => setState(() => minHandicap = val),
            ),
            SizedBox(height: 10),
            commonText("Maximum Index", size: 14),
            SizedBox(height: 4),
            commonNumberInputField(
              hintText: "",
              controller: maxIndexController,
              value: maxIndex ?? 0,
              onChanged: (val) => setState(() => maxIndex = val),
            ),
            SizedBox(height: 10),
            commonText("Maximum Handicap For Match Play Only", size: 14),
            SizedBox(height: 4),
            commonNumberInputField(
              hintText: "",
              controller: matchPlayMaxController,
              value: matchPlayMax ?? 0,
              onChanged: (val) => setState(() => matchPlayMax = val),
            ),
            SizedBox(height: 10),
            _sectionTitle("Minimum Scores for Handicap Calculation"),
            commonNumberInputField(
              hintText: "Enter minimum scores",
              controller: minScoresController,
              value: matchPlayMin ?? 0,
              onChanged: (val) => setState(() => matchPlayMin = val),
            ),

            _sectionTitle("Handicap Rounding Preferences"),
            commonRadioGroup(
              "Rounding Preferences",
              [
                "All handicaps are rounded to the nearest whole number",
                "All handicaps are rounded down",
                "Display handicaps to 1 decimal place",
              ],
              roundingPreference,
              crossAxisCount: 1,
              (val) => setState(() => roundingPreference = val),
            ),

            _sectionTitle("Team Ranking Options"),
            commonRadioGroup(
              "Ranking",
              [
                "Automatically Rank Team Members by Handicap",
                "Manually Rank Team Members by Player Position",
              ],
              teamRanking,
              crossAxisCount: 1,
              (val) => setState(() => teamRanking = val),
            ),

            _sectionTitle("Scorecard Display Options"),
            commonRadioGroup(
              "Scorecard",
              [
                "Display Scorecard Tick Marks for Full Handicaps",
                "Display Scorecard Tick Marks for Subtracted Handicaps",
                "Do Not Display Scorecard Tick Marks",
              ],
              scorecardDisplay,
              (val) => setState(() => scorecardDisplay = val),
              crossAxisCount: 1,
            ),

            const SizedBox(height: 20),
            commonButton(
              "Next",
              haveNextIcon: true,
              onTap: () {
                Get.to(CreateLeague5thScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
