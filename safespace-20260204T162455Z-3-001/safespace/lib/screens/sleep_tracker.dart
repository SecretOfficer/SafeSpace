import 'package:flutter/material.dart';

class SleepTracker extends StatelessWidget {
  const SleepTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final sleepData = [
      {'day': 'Monday', 'hours': 7.5, 'status': 'Good'},
      {'day': 'Tuesday', 'hours': 6.2, 'status': 'Below'},
      {'day': 'Wednesday', 'hours': 8.0, 'status': 'Great'},
      {'day': 'Thursday', 'hours': 6.5, 'status': 'Below'},
      {'day': 'Friday', 'hours': 5.8, 'status': 'Poor'},
      {'day': 'Saturday', 'hours': 9.0, 'status': 'Great'},
      {'day': 'Sunday', 'hours': 7.0, 'status': 'Good'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sleep Pattern Tracker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "This Week's Sleep",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...sleepData.map((data) => _buildSleepRow(
                          data['day'] as String,
                          data['hours'] as double,
                          data['status'] as String,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.purple[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Target: 8-10 hours',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Screen time affects score',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 12),
                    const Text('Current Score: 7.1/10'),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.71,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.deepPurple,
                      ),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
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

  Widget _buildSleepRow(String day, double hours, String status) {
    Color statusColor;
    int stars = 0;

    switch (status) {
      case 'Great':
        statusColor = Colors.green;
        stars = 2;
        break;
      case 'Good':
        statusColor = Colors.lightGreen;
        stars = 1;
        break;
      case 'Below':
        statusColor = Colors.orange;
        break;
      case 'Poor':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$day : ${hours}h',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              if (stars > 0) ...[
                ...List.generate(
                  stars,
                  (_) => const Icon(Icons.star, color: Colors.amber, size: 16),
                ),
                const SizedBox(width: 4),
              ],
              if (status == 'Below' || status == 'Poor')
                const Icon(Icons.warning, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              Text(
                status,
                style: TextStyle(color: statusColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: LinearProgressIndicator(
                  value: hours / 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
