import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/player/play/input_score_page.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class ChallengeScoreboardPage extends StatefulWidget {
  const ChallengeScoreboardPage({super.key});

  @override
  State<ChallengeScoreboardPage> createState() =>
      _ChallengeScoreboardPageState();
}

class _ChallengeScoreboardPageState extends State<ChallengeScoreboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // This ensures the UI updates when tab selection changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: commonText('Challenge Scoreboard', isBold: true, size: 16),
        centerTitle: true,
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              labelColor: Colors.transparent,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),

              tabs: [
                commonButton(
                  "You",
                  color: (_tabController.index == 0) ? null : Colors.blueGrey,
                ),
                commonButton(
                  "Will Smith",
                  color: (_tabController.index == 1) ? null : Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          /// Tabs for players
          const Divider(),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [PlayerScoreList(), PlayerScoreList()],
            ),
          ),

          /// Score entries
        ],
      ),
    );
  }
}

Widget PlayerScoreList() {
  return ListView.separated(
    separatorBuilder: (context, index) {
      return const Divider();
    },

    itemCount: 4,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.NqY3rNMnx2NXYo3KJfg43gHaHa?rs=1&pid=ImgDetMain',
                  ),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText('Jhon Doe', size: 14),
                      const SizedBox(height: 4),
                      commonText('HDCP 4', isBold: true),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const ScoreRowWidget(
              parScores: ['3', '5', '5', '5', '3', '4', '6', '6', ''],
              playerScores: ['2', '4', '4', '5', '3', '4', '5', '6', '4'],
              greenDotIndices: [0, 2, 4, 6],
              rectangleBorderIndices: [2, 6, 8],
              circleBorderIndices: [3, 5, 7],
              filledGreenIndices: [0, 1],
            ),
          ],
        ),
      );
    },
  );
}

class ScoreRowWidget extends StatelessWidget {
  final List<String> parScores;
  final List<String> playerScores;
  final List<int> greenDotIndices;
  final List<int> rectangleBorderIndices;
  final List<int> circleBorderIndices;
  final List<int> filledGreenIndices;

  const ScoreRowWidget({
    super.key,
    required this.parScores,
    required this.playerScores,
    this.greenDotIndices = const [],
    this.rectangleBorderIndices = const [],
    this.circleBorderIndices = const [],
    this.filledGreenIndices = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGreenDotGrid(),
        _buildScoreGrid(scores: parScores, isPlayerRow: false),
        _buildScoreGrid(scores: playerScores, isPlayerRow: true),
      ],
    );
  }

  Widget _buildGreenDotGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: parScores.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: parScores.length,
      ),
      itemBuilder: (context, index) {
        return Center(
          child:
              greenDotIndices.contains(index)
                  ? const Icon(Icons.circle, size: 6, color: Colors.green)
                  : const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildScoreGrid({
    required List<String> scores,
    required bool isPlayerRow,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: scores.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: scores.length,
        mainAxisExtent: 50,
      ),
      padding: EdgeInsets.all(0),

      itemBuilder: (context, index) {
        final String score = scores[index];
        final bool isFilled = isPlayerRow && filledGreenIndices.contains(index);
        final bool isRect = rectangleBorderIndices.contains(index);
        final bool isCircle = circleBorderIndices.contains(index);

        return InkWell(
          onTap: () {
            Get.to(PlayerInputScorePage());
          },
          child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isFilled ? Colors.green : Colors.white,
              border:
                  score.isNotEmpty
                      ? Border.all(color: Colors.grey.shade500, width: 1)
                      : null,
            ),
            child: _buildInnerScoreContent(
              text: score,
              isFilled: isFilled,
              isRect: isRect,
              isCircle: isCircle,
              isPlayerRow: isPlayerRow,
            ),
          ),
        );
      },
    );
  }

  Widget _buildInnerScoreContent({
    required String text,
    required bool isFilled,
    required bool isRect,
    required bool isCircle,
    required bool isPlayerRow,
  }) {
    final textColor = isPlayerRow ? Colors.black : Colors.green;
    final fontWeight = isPlayerRow ? FontWeight.w600 : FontWeight.w500;

    if (text.isEmpty) return const SizedBox();

    if (isRect) {
      return Center(
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isPlayerRow ? Colors.white : Colors.green,
            ),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,

              child: commonText(
                text,
                size: 14,
                textAlign: TextAlign.center,
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      );
    }

    if (isCircle) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: isPlayerRow ? Colors.white : Colors.green,
            ),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: commonText(
                text,
                size: 14,
                textAlign: TextAlign.center,
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      );
    }

    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: commonText(
          text,
          size: 14,
          textAlign: TextAlign.center,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
