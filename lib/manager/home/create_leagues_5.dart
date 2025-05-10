import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/manager/home/create_leagues_6.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class CreateLeague5thScreen extends StatefulWidget {
  @override
  _CreateLeague5thScreenState createState() => _CreateLeague5thScreenState();
}

class _CreateLeague5thScreenState extends State<CreateLeague5thScreen> {
  bool allowPlusPoints = false;
  bool maxTotalPoints = true;

  String scrambleOption = 'USGA Recommended';
  String scramblePointsOption =
      'Include points for scramble play as specified above';

  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  TextEditingController getController(String key) {
    if (!_controllers.containsKey(key)) {
      _controllers[key] = TextEditingController();
    }
    return _controllers[key]!;
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
            sectionTitle('Points for Individual Play'),
            columnWithNumberInput('Points per Hole Match Play'),
            columnWithNumberInput(
              'Points per Player Match Play Total Holes Won',
            ),
            columnWithNumberInput('Points per Player Net Total Score'),
            columnWithNumberInput('Points per Player Gross Total Score'),

            sectionTitle('Points for Team Play'),
            rowWithNumberInput('Points per Team Total Net Score'),
            sectionTitle("Points for Team Best Ball"),
            rowWithNumberInput('Points per Hole Team Match Play'),
            rowWithNumberInput('Points per Team Match Play Total'),
            rowWithNumberInput('Points per Team Net Total Score'),
            rowWithNumberInput('Points per Team Gross Total Score'),

            sectionTitle('Points for Team Combined Score'),
            rowWithNumberInput('Points per Hole Team Match Play'),
            rowWithNumberInput('Points per Team Match Play Total'),
            rowWithNumberInput('Points per Team Net Total Score'),
            rowWithNumberInput('Points per Team Gross Total Score'),

            sectionTitle('Stableford Scoring Points'),
            rowWithNumberInput('Double Eagle'),
            rowWithNumberInput('Eagle'),
            rowWithNumberInput('Birdie'),
            rowWithNumberInput('Par'),
            rowWithNumberInput('Bogey'),
            rowWithNumberInput('Double Bogey'),

            sectionTitle('Points for Quota Scoring'),
            rowWithNumberInput('Double Eagle'),
            rowWithNumberInput('Eagle'),
            rowWithNumberInput('Birdie'),
            rowWithNumberInput('Par'),
            rowWithNumberInput('Bogey'),
            rowWithNumberInput('Double Bogey'),

            sectionTitle('Points for Scramble Play'),
            commonRadioGroupWithWidgetsOnly(
              selectedValue: scramblePointsOption,
              onChanged: (val) => setState(() => scramblePointsOption = val),
              widgets: [
                commonText('Do not include points for scramble play'),
                commonText(
                  'Include points for scramble play as specified above for Individual Play and/or Stableford',
                ),
              ],
            ),

            sectionTitle('Scramble Team Handicaps'),
            commonRadioGroup(
              "Live Scoring",
              ["No Handicaps", "USGA Recommended", "Manual"],
              scrambleOption,
              alignCenter: true,
              (val) {
                setState(() => scrambleOption = val);
              },
              crossAxisCount: 2,
            ),

            sectionTitle('Plus Points'),
            commonCheckbox(
              value: allowPlusPoints,
              label: 'Allow Plus Points',
              onChanged:
                  (val) => setState(() => allowPlusPoints = val ?? false),
            ),
            if (allowPlusPoints) columnWithNumberInput('Default Plus Points'),

            sectionTitle('Maximum Points'),
            commonCheckbox(
              value: maxTotalPoints,
              label: 'Maximum Total Points',
              onChanged: (val) => setState(() => maxTotalPoints = val ?? false),
            ),
            if (maxTotalPoints)
              commonNumberInputField(
                hintText: '',
                value: 0,
                controller: getController("maximumPoints"),
                onChanged: (val) {},
              ),

            const SizedBox(height: 24),
            commonButton(
              'Next',
              onTap: () {
                Get.to(CreateLeague6thScreen());
              },
              haveNextIcon: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(top: 24.0, bottom: 12),
    child: commonText(title, fontWeight: FontWeight.bold, size: 16),
  );

  Widget rowWithNumberInput(String label) => Padding(
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
            controller: getController(label),
            onChanged: (val) {},
          ),
        ),
      ],
    ),
  );
  Widget columnWithNumberInput(String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        commonText(label, size: 14),
        const SizedBox(height: 5),
        commonNumberInputField(
          hintText: '',
          value: 0,
          controller: getController(label),
          onChanged: (val) {},
        ),
      ],
    ),
  );
}
