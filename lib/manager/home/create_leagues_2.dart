import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/manager/home/create_leagues_3.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeague2ndScreen extends StatefulWidget {
  const CreateLeague2ndScreen({super.key});

  @override
  State<CreateLeague2ndScreen> createState() => _CreateLeague2ndScreenState();
}

class _CreateLeague2ndScreenState extends State<CreateLeague2ndScreen> {
  String leagueType = "18-Hole League";
  String teamComposition = "Two Person Teams";
  String scorecardFormat = "Display by Team Players";
  String leagueRules = "League plays halves";
  String leagueMatchups = "Set Position/Championship Matches Manually";
  String scoringPreference = "Total Scoring";
  String liveScoring = "Inactive";

  int selectedFlights = 0;
  int selectedTeams = 0;
  int selectedRounds = 0;
  TextEditingController numberOfFightsControler = TextEditingController();
  TextEditingController numberOfTeamsControler = TextEditingController();
  TextEditingController numberOfRoundsControler = TextEditingController();
    @override
  void dispose() {
    numberOfFightsControler.clear();
    numberOfRoundsControler.clear();
    numberOfTeamsControler.clear();
    super.dispose();
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
            _sectionTitle("League Type"),
            commonRadioGroup(
              "League Type",
              ["9-Hole League", "18-Hole League"],
              leagueType,
              (val) {
                setState(() => leagueType = val);
              },
            ),

            _sectionTitle("Flights in League"),
            commonNumberInputField(
              hintText: "Enter the number of flights your league will use",
              value: selectedFlights,
              controller: numberOfFightsControler,
              onChanged: (val) => setState(() => selectedFlights = val),
            ),

            _sectionTitle("Team Composition"),
            commonRadioGroup(
              "Team Composition",
              ["One Person Teams", "Two Person Teams", "Four Person Teams"],
              teamComposition,
              crossAxisCount: 2,
              alignCenter: true,
              (val) {
                setState(() => teamComposition = val);
              },
            ),

            _sectionTitle("Scorecard Format Preference"),
            commonRadioGroup(
              "Scorecard Format",
              ["Display by\nOpposing Players", "Display by\nTeam Players"],
              scorecardFormat,
              (val) {
                setState(() => scorecardFormat = val);
              },
            ),

            _sectionTitle("How many teams in league?"),
            commonNumberInputField(
              hintText: "Enter the number of teams in your league",
              controller: numberOfTeamsControler,
              value: selectedTeams,
              onChanged: (val) => setState(() => selectedTeams = val),
            ),

            _sectionTitle("How many rounds will you play?"),
            commonNumberInputField(
              hintText: "Enter the number of rounds in your league",
              controller: numberOfRoundsControler,
              value: selectedRounds,
              onChanged: (val) => setState(() => selectedRounds = val),
            ),

            _sectionTitle("League Rules"),
            commonRadioGroup(
              "League Rules",
              ["League does not play halves", "League plays halves"],
              leagueRules,
              crossAxisCount: 1,

              (val) {
                setState(() => leagueRules = val);
              },
            ),

            _sectionTitle("League Matchups"),
            commonRadioGroup(
              "Matchups",
              [
                "Automatically Calculate Position/Championship Matches",
                "Set Position/Championship Matches Manually",
              ],
              crossAxisCount: 1,
              leagueMatchups,
              (val) {
                setState(() => leagueMatchups = val);
              },
            ),

            _sectionTitle("Scoring Preferences"),
            commonRadioGroup(
              "Scoring",
              ["Hole Scoring", "Total Scoring"],
              scoringPreference,
              (val) {
                setState(() => scoringPreference = val);
              },
            ),

            _sectionTitle("Live Scoring"),
            commonRadioGroup(
              "Live Scoring",
              ["Active", "Inactive"],
              liveScoring,
              (val) {
                setState(() => liveScoring = val);
              },
            ),

            const SizedBox(height: 20),
            commonButton(
              "Next",
              haveNextIcon: true,
              onTap: () {
                Get.to(CreateLeague3rdScreen());
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
