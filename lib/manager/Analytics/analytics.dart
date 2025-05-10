import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/res/commonWidgets.dart';

class AnalyticesPage extends StatefulWidget {
  const AnalyticesPage({super.key});

  @override
  State<AnalyticesPage> createState() => _AnalyticesPageState();
}

class _AnalyticesPageState extends State<AnalyticesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        elevation: 0,
        title: commonText("League Statistics", isBold: true, size: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _leagueOverviewCard(),
              const SizedBox(height: 16),
              _scoreTrendCard(),
              const SizedBox(height: 24),
              commonText("Participant Performance", size: 18, isBold: true),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  showPlayerStatsDialog(context);
                },
                child: _participantCard("John Doe", 10, 72),
              ),
              _participantCard("Will Smith", 9, 74),
              _participantCard("Alice Johnson", 11, 70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leagueOverviewCard() {
    return _styledCard(
      child: Row(
        children: [
          Icon(Icons.bar_chart, color: AppColors.yellow, size: 60),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText("Total Rounds Played: 45", size: 16, isBold: true),
                SizedBox(height: 8),
                commonText("Average Score: 73.5"),
                commonText("Top Scorer: John Doe"),
                commonText("Current Leader: Will Smith"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreTrendCard() {
    return _styledCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Colors.transparent,
              unselectedLabelColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: [
                _TabItem("Score Trend", _tabController.index == 0),
                _TabItem("Top Scorers", _tabController.index == 1),
                _TabItem("Win Distribution", _tabController.index == 2),
              ],
            ),
            const SizedBox(height: 12),
            if (_tabController.index != 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    commonText("Average Score", size: 14),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: TabBarView(
                controller: _tabController,
                children: [
                  linerChart(),
                  SimpleBarChart(
                    xAxisList: [
                      "Jhon",
                      "Sarah",
                      "Mike",
                      "Emily",
                      "Tom",
                      "Mike",
                    ],
                    yAxisList: [72, 80, 75, 82, 82, 80],

                    interval: 10,
                  ),
                  PieChartSample2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget linerChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 5,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: AppColors.white, strokeWidth: 1);
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (value, _) {
                final labels = [
                  "Round 1",
                  "Round 2",
                  "Round 3",
                  "Round 4",
                  "Round 5",
                  "Round 6",
                ];
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: commonText(labels[value.toInt()], size: 10),
                );
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 10,
              getTitlesWidget:
                  (value, _) => commonText(value.toInt().toString()),
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 5.9,
        minY: 60,
        maxY: 90,

        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: AppColors.yellow,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, bar, index) {
                if (index == 5) {
                  return FlDotCirclePainter(
                    radius: 5,
                    color: AppColors.white,
                    strokeColor: AppColors.yellow,
                    strokeWidth: 2,
                  );
                }
                return FlDotCirclePainter(color: Colors.transparent);
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [AppColors.yellow, AppColors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            spots: const [
              FlSpot(0, 78),
              FlSpot(1, 75),
              FlSpot(2, 76),
              FlSpot(3, 74),
              FlSpot(4, 80),
              FlSpot(5, 75),
            ],
          ),
        ],
      ),
    );
  }

  Widget _participantCard(String name, int rounds, double avgScore) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
              'https://image.lexica.art/full_webp/9f8136dd-0fe5-4b22-b490-4c87e2722c5a',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: commonText(
              "$name\nRounds: $rounds | Avg. Score: $avgScore",
              size: 14,
            ),
          ),
          Icon(Icons.remove_red_eye, color: AppColors.yellow),
        ],
      ),
    );
  }

  Widget _styledCard({required Widget child}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }

  void showPlayerStatsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.close, size: 20),
                      ),
                    ],
                  ),
                  commonText("John Doe's Performance", isBold: true, size: 14),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _statRow("Rounds Played", "10"),
                        _statRow("Average Score", "72"),
                        _statRow("Best Round", "68"),
                        _statRow("Avg. Strokes per Hole", "4.0"),
                        _statRow("Wins", "7"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _statRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: commonText("$label: $value", size: 14),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const _TabItem(this.title, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: 30, minHeight: 30),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: isActive ? AppColors.yellow : AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.yellow),
      ),
      child: FittedBox(
        child: commonText(
          title,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SimpleBarChart extends StatefulWidget {
  final List<String> xAxisList;
  final List<double> yAxisList;
  final double interval;

  const SimpleBarChart({
    super.key,
    required this.xAxisList,
    required this.yAxisList,
    required this.interval,
  });

  @override
  State<SimpleBarChart> createState() => _SimpleBarChartState();
}

class _SimpleBarChartState extends State<SimpleBarChart> {
  late List<String> xAxisList;
  late List<double> yAxisList;
  late double interval;

  @override
  void initState() {
    super.initState();
    xAxisList = widget.xAxisList;
    yAxisList = widget.yAxisList;
    interval = widget.interval;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        minY: 65,
        maxY: 85,

        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide.none,
            bottom: BorderSide.none,
          ),
        ),
        gridData: FlGridData(show: true, drawVerticalLine: false),
        barGroups:
            List.generate(
              xAxisList.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: yAxisList[index],
                    width: 30,

                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ).toList(),
      ),
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 18),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex =
                            pieTouchResponse
                                .touchedSection!
                                .touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Indicator(color: AppColors.blue, text: 'First'),
                      SizedBox(width: 16),
                      Indicator(color: AppColors.yellow, text: 'Second'),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Indicator(color: AppColors.yellow, text: 'Third'),
                      SizedBox(width: 16),
                      Indicator(color: AppColors.green, text: 'Fourth'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 90.0 : 80.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.blue,
            value: 40,
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.yellow,
            value: 30,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.red,
            value: 15,
            title: '',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.green,
            value: 15,
            title: '',
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,

    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;

  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size * 3,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        commonText(text, size: 16),
      ],
    );
  }
}
