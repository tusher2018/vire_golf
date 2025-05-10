import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ManagerEditLeaguePage extends StatefulWidget {
  @override
  State<ManagerEditLeaguePage> createState() => _ManagerEditLeaguePageState();
}

class _ManagerEditLeaguePageState extends State<ManagerEditLeaguePage> {
  final TextEditingController leagueNameController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController maxPlayersController = TextEditingController();

  final TextEditingController startDateController = TextEditingController();

  final TextEditingController keyMatchDateController = TextEditingController();

  final TextEditingController finalMatchDateController =
      TextEditingController();

  final TextEditingController aboutLeagueController = TextEditingController();

  int? maxplayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: commonText("Edit League", size: 16, isBold: true),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonTextfieldWithTitle(
              "League Name",
              leagueNameController,
              hintText: "Enter league name",
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Location",
              locationController,
              hintText: "Enter location",
            ),
            const SizedBox(height: 16),
            // commonNumberInputField(
            //   "",
            //   controller: maxPlayersController,
            //   hintText: "",
            // ),
            commonText("Max Players", fontWeight: FontWeight.w500),
            const SizedBox(height: 8),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: commonNumberInputField(
                hintText: "Enter max players",
                value: maxplayer ?? 0,
                controller: maxPlayersController,
                onChanged: (val) => setState(() => maxplayer = val),
              ),
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Start Date",
              startDateController,
              hintText: "Enter start date",
              suffixIcon: Icon(
                Icons.calendar_month_outlined,
                color: AppColors.yellow,
              ),
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Key Match Date",
              keyMatchDateController,
              hintText: "Enter key match date",
              suffixIcon: Icon(
                Icons.calendar_month_outlined,
                color: AppColors.yellow,
              ),
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "Final Match Date",
              finalMatchDateController,
              hintText: "Enter final match date",
              suffixIcon: Icon(
                Icons.calendar_month_outlined,
                color: AppColors.yellow,
              ),
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle(
              "About the League",
              aboutLeagueController,
              hintText: "Write something about league",
              maxLine: 3,
            ),
            const SizedBox(height: 20),
            commonText("Upload Poster/Flyer", isBold: true, size: 14),
            const SizedBox(height: 8),

            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              dashPattern: [6, 3],
              color: Colors.black26,
              strokeWidth: 1.5,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    // TODO: Implement file picker
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/Upload.png"),
                      SizedBox(height: 8),
                      commonText("Upload your poster/flyer"),
                    ],
                  ),
                ),
              ),
            ), // Custom widget we'll define below
            const SizedBox(height: 24),
            commonButton("Save"),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
