import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ScreenTimeDetails extends StatelessWidget {
  const ScreenTimeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Screen Time Sessions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSessionCard(
              icon: '📷',
              appName: 'Instagram',
              duration: '45mins',
              timeRange: '6:30 PM-7:15 PM',
              warnings: ['No breaks taken', 'Continuous scrolling'],
              isPositive: false,
            ),
            const SizedBox(height: 12),
            _buildSessionCard(
              icon: '🎵',
              appName: 'Tiktok',
              duration: '45mins',
              timeRange: '9:00 PM-9:32 PM',
              warnings: ['Used before bedtime'],
              isPositive: false,
            ),
            const SizedBox(height: 12),
            _buildSessionCard(
              icon: '▶️',
              appName: 'Youtube',
              duration: '45mins',
              timeRange: '4:15 PM-5:00 PM',
              warnings: ['Took 2 breaks'],
              isPositive: true,
            ),
            const SizedBox(height: 24),
            _buildWeeklyChart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildSessionCard({
    required String icon,
    required String appName,
    required String duration,
    required String timeRange,
    required List<String> warnings,
    required bool isPositive,
  }) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(icon, style: const TextStyle(fontSize: 24)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        duration,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(timeRange, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            ...warnings.map((warning) => Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Icon(
                        isPositive ? Icons.check_circle : Icons.warning,
                        size: 16,
                        color: isPositive ? Colors.green : Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      Text(warning),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyChart() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 8,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}h',
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                        reservedSize: 28,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                          return Text(
                            days[value.toInt()],
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    horizontalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey[200]!,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _makeBarData(0, 2),
                    _makeBarData(1, 3),
                    _makeBarData(2, 4),
                    _makeBarData(3, 3.5),
                    _makeBarData(4, 5, highlight: true),
                    _makeBarData(5, 4),
                    _makeBarData(6, 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeBarData(int x, double y, {bool highlight = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: highlight ? Colors.deepPurple : Colors.deepPurple.withOpacity(0.6),
          width: 20,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }
}
