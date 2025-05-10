import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class PlayerRecentRoundDetailsScreen extends StatefulWidget {
  const PlayerRecentRoundDetailsScreen({super.key});

  @override
  State<PlayerRecentRoundDetailsScreen> createState() =>
      _PlayerRecentRoundDetailsScreenState();
}

class _PlayerRecentRoundDetailsScreenState
    extends State<PlayerRecentRoundDetailsScreen>
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
      appBar: AppBar(
        leading: const BackButton(),
        title: commonText(
          'Pine Hills - Battle Details',
          size: 16,
          isBold: true,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("Battle Information"),

            _infoRow("Opponent:", "Emily K"),
            Divider(color: AppColors.black.withOpacity(0.3)),
            _infoRow("Course:", "Oak Grove"),
            Divider(color: AppColors.black.withOpacity(0.3)),
            _infoRow("Date:", "March 21, 2025"),
            Divider(color: AppColors.black.withOpacity(0.3)),
            _infoRow("Result:", "You won (72 vs. 70)"),
            Divider(color: AppColors.black.withOpacity(0.3)),
            const SizedBox(height: 12),
            SizedBox(
              height: 80,
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
            const SizedBox(height: 24),
            _sectionTitle("Scores"),
            SizedBox(
              height: 180,
              child: TabBarView(
                controller: _tabController,
                children: [_scoreTable(), _scoreTable()],
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle("Performance Stats"),
            _performanceStats(),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: commonText(
        title,
        fontWeight: FontWeight.bold,
        size: 16,
        haveUnderline: true,
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: commonText(label, isBold: true, size: 14)),
          commonText(value, fontWeight: FontWeight.w400, size: 14),
        ],
      ),
    );
  }

  Widget _scoreTable() {
    final List<Map<String, String>> scoreData = [
      {"hole": "1", "par": "4", "yards": "530", "score": "4", "vsPar": "0"},
      {"hole": "2", "par": "3", "yards": "150", "score": "3", "vsPar": "0"},
      {"hole": "3", "par": "5", "yards": "520", "score": "6", "vsPar": "+1"},
      {"hole": "4", "par": "4", "yards": "400", "score": "5", "vsPar": "+1"},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1.5),
            },
            border: TableBorder.all(color: Colors.grey.shade300),
            children: [
              _tableHeader(["Hole", "Par", "Yards", "Score", "vs Par"]),
              ...scoreData.map(
                (row) => _tableRow([
                  row["hole"]!,
                  row["par"]!,
                  row["yards"]!,
                  row["score"]!,
                  row["vsPar"]!,
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  TableRow _tableHeader(List<String> titles) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      children: titles.map((title) => _tableCell(title, isBold: true)).toList(),
    );
  }

  TableRow _tableRow(List<String> values) {
    return TableRow(
      children:
          values
              .map(
                (val) => _tableCell(
                  val,
                  color: val.contains('+') ? Colors.green : Colors.black,
                ),
              )
              .toList(),
    );
  }

  Widget _tableCell(
    String text, {
    bool isBold = false,
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
    );
  }

  Widget _performanceStats() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _statColumn("Putts", "7"),
              _statColumn("Fairways Hit", "3"),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _statColumn("GIR", "2"),
              _statColumn("Penalties", "1"),
            ],
          ),

          commonText("Total Score", isBold: true, size: 14),
          const SizedBox(height: 6),
          commonText("18", size: 20, isBold: true, color: AppColors.yellow),
        ],
      ),
    );
  }
}

class _statColumn extends StatelessWidget {
  final String label;
  final String value;

  const _statColumn(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commonText(label, isBold: true, size: 14),
        const SizedBox(height: 6),
        commonText(value, size: 20, isBold: true, color: AppColors.yellow),
      ],
    );
  }
}
