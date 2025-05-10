import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ManagerInputScorePage extends StatefulWidget {
  const ManagerInputScorePage({super.key});

  @override
  State<ManagerInputScorePage> createState() => _ManagerInputScorePageState();
}

class _ManagerInputScorePageState extends State<ManagerInputScorePage> {
  bool isExpanded1 = true;
  bool isExpanded2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: commonText('Input Score', size: 16, isBold: true),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _holeInfoWithLeaderboard(),
            const SizedBox(height: 12),
            _playerCard(
              full: isExpanded1,
              ontap: () {
                isExpanded1 = !isExpanded1;
                setState(() {});
              },
            ),
            const SizedBox(height: 12),
            _playerCard(
              full: isExpanded2,
              ontap: () {
                isExpanded2 = !isExpanded2;
                setState(() {});
              },
            ),
            const SizedBox(height: 24),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.green,
                    ),
                    label: commonText(
                      'Previous Hole',
                      size: 14,
                      color: AppColors.green,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.white,
                    ),
                    iconAlignment: IconAlignment.end,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    label: commonText(
                      'Save Hole 5',
                      color: AppColors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _holeInfoWithLeaderboard() {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      commonText('#16', size: 16, isBold: true),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 1,
                    color: Colors.grey.shade300,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  _InfoColumn(title: 'YDS', value: '36'),
                  _InfoColumn(title: 'PAR', value: '4'),
                  _InfoColumn(title: 'HCP', value: '9'),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonText('Leaderboard', size: 14, isBold: true),
                  Divider(color: AppColors.black),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ['-2', 'E', '+1', '+4'][index],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerCard({bool full = true, ontap}) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _playerHeader(),
              if (full) ...[
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText("Putts", size: 14),
                    scoreControl(
                      topic: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: commonText("0"),
                      ),
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _directionRow(label: 'GIR', missLabel: 'Missed Green'),
                const SizedBox(height: 10),
                _directionRow(label: 'Fairway', missLabel: 'Missed Fairway'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText("Penalty", size: 14),
                    scoreControl(
                      topic: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: commonText("0"),
                      ),
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

        Positioned(
          right: 10,
          top: 0,
          child: InkWell(
            onTap: ontap,
            child: Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ),
      ],
    );
  }

  Widget _playerHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
            'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
          ),
        ),
        const SizedBox(width: 8),
        const Text('Jhon Doe', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        const Icon(Icons.flag, color: AppColors.green, size: 16),
        const SizedBox(width: 8),
        Column(
          children: [
            _badge('STROKE HOLE', Colors.blue.shade50, Colors.blue),
            SizedBox(height: 4),
            _badge('7. GAME HCP', Colors.yellow.shade100, Colors.red),
          ],
        ),
        scoreControl(
          topic: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Colors.black),
              children: [
                TextSpan(
                  text: '4',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const TextSpan(text: ' / '),
                TextSpan(
                  text: 'NET 4',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          onIncrement: () {
            // increment logic
          },
          onDecrement: () {
            // decrement logic
          },
        ),
      ],
    );
  }

  Widget scoreControl({
    required Widget topic,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.red, width: 2),
            ),
            child: const Icon(Icons.add, size: 16, color: AppColors.red),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: topic,
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.green, width: 2),
            ),
            child: const Icon(Icons.remove, size: 16, color: AppColors.green),
          ),
        ),
      ],
    );
  }

  Widget _directionRow({required String label, required String missLabel}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(label),
            const SizedBox(height: 4),
            const Icon(
              Icons.check_circle_outline_outlined,
              size: 24,
              color: Colors.black,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            commonText(missLabel, size: 14),
            const SizedBox(height: 4),
            Row(
              children: [
                ...[
                  Icons.arrow_back,
                  Icons.arrow_forward,
                  Icons.arrow_downward,
                  Icons.arrow_upward,
                ].map(
                  (icon) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.black, width: 2),
                      ),
                      child: Icon(icon, size: 18, color: AppColors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _badge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: commonText(text, size: 10, color: textColor, isBold: true),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  const _InfoColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        commonText(title),
        const SizedBox(height: 4),
        commonText(value, size: 16, isBold: true),
      ],
    );
  }
}
