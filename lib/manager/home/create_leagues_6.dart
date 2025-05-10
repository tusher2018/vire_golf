import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/manager/home/create_leagues_7.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeague6thScreen extends StatefulWidget {
  @override
  State<CreateLeague6thScreen> createState() => _CreateLeague6thScreenState();
}

class _CreateLeague6thScreenState extends State<CreateLeague6thScreen> {
  String selectedIndividualOption = '';
  String selectedBlindsCanEarn = 'Yes';
  String selectedMatchOption = '';
  String selectedTeamScoreOption = '';
  String selectedTeamForfeitOption = 'Forfeit all';
  String selectedByeIndividual = '';
  String selectedByeTeam = '';

  bool allowScoreForPrize = false;

  TextEditingController maxForfeitPoints = TextEditingController();
  TextEditingController strokesBlind = TextEditingController();
  TextEditingController maxBlindPoints = TextEditingController();
  TextEditingController bothTeamsForfeitPoints = TextEditingController();
  TextEditingController strokesBye = TextEditingController();
  TextEditingController maxForfeitPointsController = TextEditingController();
  TextEditingController strokeAdjustmentController = TextEditingController();

  @override
  void dispose() {
    maxForfeitPoints.dispose();
    strokesBlind.dispose();
    maxBlindPoints.dispose();
    bothTeamsForfeitPoints.dispose();
    strokesBye.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Create a New League", size: 18, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: commonText("No Shows (Blinds)", size: 16, isBold: true),
            ),
            const SizedBox(height: 16),

            commonText(
              "Individual Points when competing against a blind",
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),
            commonRadioGroup(
              "Individual Points when competing against a blind",
              [
                "Forfeit individual player points to the present player",
                "Split all player points between the present and absent player",

                "No player points are awarded to either player",
                "The blind is given a user-defined score",
                "The blind is given a net bogey score",
                "The blind is given a net par score",
              ],
              selectedIndividualOption,

              crossAxisCount: 1,

              (val) => setState(() => selectedIndividualOption = val),
              conditionalWidgets: {
                "Forfeit individual player points to the present player":
                    commonRadioGroup(
                      "Forfeit individual player points to the present player",
                      ["Forfeit all", "Forfeit partial"],
                      selectedTeamForfeitOption,
                      crossAxisCount: 1,
                      conditionalWidgets: {
                        "Forfeit partial": rowWithNumberInput(
                          'Maximum Forfeit Points',
                          maxForfeitPointsController,
                        ),
                      },

                      (val) => setState(() => selectedTeamForfeitOption = val),
                    ),
              },
            ),

            rowWithNumberInput(
              "Strokes to add to present player handicap when competing against a net par or net bogey blind score",
              strokeAdjustmentController,
            ),

            const SizedBox(height: 24),
            commonText("Blinds can earn points", size: 16, isBold: true),
            const SizedBox(height: 8),
            commonRadioGroup(
              'blindsCanEarn',
              ["No", "Yes"],
              selectedBlindsCanEarn,
              (val) => setState(() => selectedBlindsCanEarn = val),
            ),
            if (selectedBlindsCanEarn == "Yes")
              rowWithNumberInput(
                "If yes, maximum points for blinds",
                maxBlindPoints,
              ),

            const SizedBox(height: 24),
            commonText(
              "Individual Matches with forfeits, splits or no points",
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),
            commonCheckbox(
              value: allowScoreForPrize,
              onChanged:
                  (val) => setState(() => allowScoreForPrize = val ?? false),
              label:
                  "Present players may post a score for prize holes, skins, etc",
            ),
            if (allowScoreForPrize == true)
              rowWithNumberInput(
                "Points to award each team if both teams forfeit",
                bothTeamsForfeitPoints,
              ),

            const SizedBox(height: 24),
            commonText(
              "Team Scores and Points when blinds are present",
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),
            commonRadioGroupWithWidgetsOnly(
              selectedValue: selectedTeamScoreOption,
              onChanged: (val) => setState(() => selectedTeamScoreOption = val),
              widgets: [
                commonText("Team with blind forfeits team points"),
                commonText("Team points are split between each team"),
                commonText(
                  "No team points are awarded to either team if one or both teams have a blind",
                ),
                commonText(
                  "Blind scores are used as defined above for the team score",
                ),
              ],
            ),

            const SizedBox(height: 24),
            commonText(
              "Total player and team points when a team forfeits",
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 8),
            commonRadioGroup(
              "Total player and team points when a team forfeits",
              [
                "Forfeit all player and team points to the opponent team",
                "Forfeit partial player and team points to the opponent team",
              ],
              selectedTeamForfeitOption,

              crossAxisCount: 1,
              (val) => setState(() => selectedTeamForfeitOption = val),
              conditionalWidgets: {
                "Forfeit partial player and team points to the opponent team":
                    rowWithNumberInput(
                      "Partial Team Forfeit Points",
                      bothTeamsForfeitPoints,
                    ),
              },
            ),

            const SizedBox(height: 24),
            Center(child: commonText("Byes", size: 18, isBold: true)),
            const SizedBox(height: 8),
            commonText("Individual Points", isBold: true, size: 16),
            const SizedBox(height: 8),
            commonRadioGroupWithWidgetsOnly(
              selectedValue: selectedByeIndividual,
              onChanged: (val) => setState(() => selectedByeIndividual = val),
              widgets: [
                commonText(
                  "All individual points awarded to team playing against the Bye",
                ),
                commonText("Team receives one half of all individual points"),
                commonText("Team receives no individual points"),
                commonText("The Bye is given a user-defined gross score"),
                commonText("The Bye is given a net bogey score"),
                commonText("The Bye is given a net par score"),
              ],
            ),
            rowWithNumberInput(
              "Strokes to add to player handicap when competing against a net par or net bogey Bye score",

              strokesBye,
            ),

            const SizedBox(height: 24),
            commonText("Team Points", isBold: true, size: 16),
            const SizedBox(height: 8),
            commonRadioGroup(
              crossAxisCount: 1,
              "Team Points",
              [
                "All team points awarded to team",
                "Team receives one half of team points",
                "Team receives no team points",
                "Bye scores selected above are used in team points calculation",
                "The bye total net score is determined by course par + strokes",
              ],
              selectedByeTeam,
              (val) => setState(() => selectedByeTeam = val),
              conditionalWidgets: {
                "The bye total net score is determined by course par + strokes":
                    rowWithNumberInput(
                      "Strokes to add to bye score",
                      strokesBye,
                    ),
              },
            ),

            const SizedBox(height: 32),
            commonButton(
              "Next",
              haveNextIcon: true,
              onTap: () {
                Get.to(CreateLeague7thScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget rowWithNumberInput(String label, TextEditingController controller) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: commonText(label, size: 14)),
            const SizedBox(width: 8),
            SizedBox(
              width: 80,

              child: commonNumberInputField(
                hintText: '',
                value: 0,
                controller: controller,
                onChanged: (val) {},
              ),
            ),
          ],
        ),
      );
}
