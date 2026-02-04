import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AppUsageReport extends StatelessWidget {
  const AppUsageReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('App Usage Report'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPieChart(),
            const SizedBox(height: 16),
            _buildCategoryCard(
              title: 'Social Media',
              totalTime: '2h 45m',
              color: const Color(0xFFF5A962),
              apps: [
                {'name': 'Instagram', 'time': '1h 15m', 'progress': 0.7},
                {'name': 'TikTok', 'time': '1h 00m', 'progress': 0.5},
                {'name': 'Snapchat', 'time': '30m', 'progress': 0.3},
              ],
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              title: 'Games',
              totalTime: '2h 45m',
              color: const Color(0xFF6C9BCF),
              apps: [
                {'name': 'CODM', 'time': '45m', 'progress': 0.6},
                {'name': 'Subway Surf', 'time': '30m', 'progress': 0.4},
              ],
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              title: 'Educational',
              totalTime: '2h 45m',
              color: const Color(0xFF81C784),
              apps: [
                {'name': 'Khan academy', 'time': '20m', 'progress': 0.5},
                {'name': 'Duolingo', 'time': '10m', 'progress': 0.25},
              ],
            ),
            const SizedBox(height: 80),
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

  Widget _buildPieChart() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 60,
                  sections: [
                    PieChartSectionData(
                      value: 45,
                      color: const Color(0xFFF5A962),
                      title: '',
                      radius: 30,
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: const Color(0xFF6C9BCF),
                      title: '',
                      radius: 30,
                    ),
                    PieChartSectionData(
                      value: 25,
                      color: const Color(0xFF81C784),
                      title: '',
                      radius: 30,
                    ),
                  ],
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '6 h 20 m',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Total time',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String totalTime,
    required Color color,
    required List<Map<String, dynamic>> apps,
  }) {
    return Card(
      color: color.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  title == 'Social Media'
                      ? Icons.people
                      : title == 'Games'
                          ? Icons.sports_esports
                          : Icons.school,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              totalTime,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            ...apps.map((app) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('${app['name']}: ${app['time']}'),
                      ),
                      Expanded(
                        flex: 3,
                        child: LinearProgressIndicator(
                          value: app['progress'] as double,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green[600]!,
                          ),
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
