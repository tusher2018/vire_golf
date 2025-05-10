import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class PlayerChallengeFriendScreen extends StatefulWidget {
  @override
  State<PlayerChallengeFriendScreen> createState() => _PlayerChallengeFriendScreenState();
}

class _PlayerChallengeFriendScreenState extends State<PlayerChallengeFriendScreen> {
  String selectedCourse = 'Oak Grove';
  DateTime selectedDate = DateTime(2025, 6, 3);
  String selectedFormat = 'Stroke Play';

  final List<String> courses = ['Oak Grove', 'River View', 'Highland'];
  final List<String> formats = ['Stroke Play', 'Match Play'];

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Challenge a Friend", isBold: true, size: 16),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _opponentCard(),

            const SizedBox(height: 20),
            _sectionTitle('Challenge Details'),
            const SizedBox(height: 16),
            _dropdownField('Select Course', selectedCourse, courses, (val) {
              setState(() => selectedCourse = val!);
            }),

            const SizedBox(height: 16),
            _dateField(),

            const SizedBox(height: 16),
            _dropdownField('Select Format', selectedFormat, formats, (val) {
              setState(() => selectedFormat = val!);
            }),

            const SizedBox(height: 24),
            _sectionTitle('Summary'),
            SizedBox(height: 12),
            _infoRow("Opponent:", "Emily K"),
            Divider(color: AppColors.black),
            _infoRow("Course:", "Oak Grove"),
            Divider(color: AppColors.black),
            _infoRow("Date:", "March 21, 2025"),
            Divider(color: AppColors.black),
            _infoRow("Format::", "Stroke Play"),
            Divider(color: AppColors.black),

            const SizedBox(height: 24),
            commonButton("Send Challenge"),
          ],
        ),
      ),
    );
  }

  Widget _opponentCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
            ), // Replace with your image
          ),
          SizedBox(width: 12),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: commonText('Challenge Emily K.', isBold: true),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return commonText(title, isBold: true, size: 18, haveUnderline: true);
  }

  Widget _dropdownField(
    String label,
    String value,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(label, size: 14, isBold: true),
        const SizedBox(height: 6),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: SizedBox(),
              items:
                  options.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText('Select Date'),
        const SizedBox(height: 6),
        InkWell(
          onTap: _selectDate,
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(DateFormat('MM/dd/yyyy').format(selectedDate)),
                  ),
                  Icon(Icons.calendar_today, color: Colors.green),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: commonText(label, isBold: true, size: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
