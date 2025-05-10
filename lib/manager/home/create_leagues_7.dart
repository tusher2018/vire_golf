import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeague7thScreen extends StatefulWidget {
  @override
  _CreateLeague7thScreenState createState() => _CreateLeague7thScreenState();
}

class _CreateLeague7thScreenState extends State<CreateLeague7thScreen> {
  String selectedSkinsOption = 'Display gross and net skins';
  String selectedSkinsGroup = 'Display Skins by All Participants';
  String selectedSkinsStrokeRule =
      'All Handicap Strokes Allowed for Skins Purposes';
  String selectedNetGameOption = 'Display Net Game by Participating Players';
  String selectedBirdieGameOption = 'Display Gross Birdies';
  String selectedBirdieGroup = 'Display Birdie Game by Participating Players';
  String includeLeagueReport = 'Display gross and net skins';

  bool includeSkinsGame = false;
  bool includeNetGame = false;
  bool includeBirdieGame = false;
  bool grossMustBirdie = false;
  bool netMustBirdie = false;
  bool includeLowestGross = false;
  bool includeLowestNet = false;
  bool includeClosestPin = false;
  bool includeLongDrive = false;
  bool includeLongPutt = false;

  int percentHandicapNetSkins = 100;
  final TextEditingController percentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    percentController.text = percentHandicapNetSkins.toString();
  }

  @override
  void dispose() {
    percentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText('Create a New League', size: 16, isBold: true),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText('Skins Game Options', isBold: true, size: 16),
            commonCheckbox(
              label: 'Include skins game on League Report',
              value: includeSkinsGame,
              onChanged: (val) => setState(() => includeSkinsGame = val!),
            ),
            if (includeSkinsGame)
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: commonRadioGroup(
                  'skins_players',
                  [
                    'All players are included in the skins game',
                    'Selected players are included in the skins game',
                  ],
                  includeLeagueReport,
                  (val) => setState(() => includeLeagueReport = val),
                  crossAxisCount: 1,
                ),
              ),

            commonText('Skins Display Options', isBold: true, size: 16),
            commonRadioGroup(
              'skins_display',
              [
                'Display gross and net skins',
                'Display gross skins only',
                'Display net skins only',
                'Display gross or net skins by player preference',
              ],
              selectedSkinsOption,
              (val) => setState(() => selectedSkinsOption = val),
              crossAxisCount: 1,
            ),

            commonText('Skins Display Grouping', isBold: true, size: 16),
            commonRadioGroup(
              'skins_group',
              [
                'Display Skins by All Participants',
                'Display Skins by Flight',
                'Display Skins by Group A/B',
              ],
              selectedSkinsGroup,
              (val) => setState(() => selectedSkinsGroup = val),
              crossAxisCount: 1,
            ),

            commonCheckbox(
              label: 'Gross skins must be birdie or better',
              value: grossMustBirdie,
              onChanged: (val) => setState(() => grossMustBirdie = val!),
            ),
            commonCheckbox(
              label: 'Net skins must be net birdie or better',
              value: netMustBirdie,
              onChanged: (val) => setState(() => netMustBirdie = val!),
            ),

            rowWithNumberInput(
              'Percent of Handicap for Net Skins',

              percentController,
            ),

            commonText('Skins Handicap Stroke Rules', isBold: true, size: 16),
            commonRadioGroup(
              'skins_stroke_rule',

              [
                'All Handicap Strokes Allowed for Skins Purposes',
                'No Strokes on Par 3’s for Skins Purposes',
                'One Stroke Maximum on Par 3’s for Skins Purposes',
                'One Stroke Maximum per Hole for Skins Purposes',
              ],
              selectedSkinsStrokeRule,
              (val) => setState(() => selectedSkinsStrokeRule = val),
              crossAxisCount: 1,
            ),

            commonText('Birdie Game Options', isBold: true, size: 16),
            commonCheckbox(
              label: 'Include net game on League Report',
              value: includeNetGame,
              onChanged: (val) => setState(() => includeNetGame = val!),
            ),
            if (includeNetGame)
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: commonRadioGroup(
                  'net_game',
                  [
                    'All players are included in the net game',
                    'Selected players are included in the net game',
                  ],
                  '',
                  (_) {},
                  crossAxisCount: 1,
                ),
              ),

            commonText('Net Game Display Options', isBold: true, size: 16),
            commonRadioGroup(
              'net_display',
              [
                'Display Net Game by Participating Players',
                'Display Net Game by Participating Players by Flight',
                'Display Net Game by Participating Players by Group A/B',
              ],
              selectedNetGameOption,
              (val) => setState(() => selectedNetGameOption = val),
              crossAxisCount: 1,
            ),
            SizedBox(height: 8),
            commonText("Birdie Game Display Options", size: 16, isBold: true),
            commonCheckbox(
              label: 'Include birdie game on League Report',
              value: includeBirdieGame,
              onChanged: (val) => setState(() => includeBirdieGame = val!),
            ),
            if (includeBirdieGame)
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: commonRadioGroup(
                  'birdie_game',
                  [
                    'All players are included in the birdie game',
                    'Selected players are included in the birdie game',
                  ],
                  '',
                  (_) {},
                  crossAxisCount: 1,
                ),
              ),

            commonText('Birdie Game Display Grouping', isBold: true, size: 16),
            commonRadioGroup(
              'birdie_group',
              [
                'Display Birdie Game by Participating Players',
                'Display Birdie Game by Participating Players by Flight',
                'Display Birdie Game by Participating Players by Group A/B',
              ],
              selectedBirdieGroup,
              (val) => setState(() => selectedBirdieGroup = val),
              crossAxisCount: 1,
            ),

            commonText('Birdie Display Option', isBold: true, size: 16),
            commonRadioGroup(
              'birdie_display',
              [
                'Display Gross Birdies',
                'Display Net Birdies',
                'Display Gross and Net Birdies',
              ],
              selectedBirdieGameOption,

              (val) => setState(() => selectedBirdieGameOption = val),
              crossAxisCount: 1,
            ),

            commonText('League Report Display Options', isBold: true, size: 16),
            commonCheckbox(
              label: 'Include Lowest Gross Score Display',
              value: includeLowestGross,
              onChanged: (val) => setState(() => includeLowestGross = val!),
            ),
            commonCheckbox(
              label: 'Include Lowest Net Display',
              value: includeLowestNet,
              onChanged: (val) => setState(() => includeLowestNet = val!),
            ),
            commonCheckbox(
              label: 'Include Closest to Pin Display',
              value: includeClosestPin,
              onChanged: (val) => setState(() => includeClosestPin = val!),
            ),
            commonCheckbox(
              label: 'Include Long Drive Display',
              value: includeLongDrive,
              onChanged: (val) => setState(() => includeLongDrive = val!),
            ),
            commonCheckbox(
              label: 'Include Long Putt Display',
              value: includeLongPutt,
              onChanged: (val) => setState(() => includeLongPutt = val!),
            ),

            const SizedBox(height: 20),
            commonButton(
              'Create League',
              onTap: () {
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();
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
