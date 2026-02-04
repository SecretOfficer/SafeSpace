class AppUsageData {
  final String appName;
  final String iconPath;
  final int minutes;
  final String timeRange;
  final List<String> warnings;
  final bool isPositive;

  AppUsageData({
    required this.appName,
    required this.iconPath,
    required this.minutes,
    required this.timeRange,
    this.warnings = const [],
    this.isPositive = false,
  });
}

class SleepData {
  final String day;
  final double hours;
  final String status;
  final String? note;

  SleepData({
    required this.day,
    required this.hours,
    required this.status,
    this.note,
  });

  Color get statusColor {
    switch (status) {
      case 'Great':
        return const Color(0xFF4CAF50);
      case 'Good':
        return const Color(0xFF8BC34A);
      case 'Below':
        return const Color(0xFFFFC107);
      case 'Poor':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  int get starCount {
    if (status == 'Great') return 2;
    if (status == 'Good') return 1;
    return 0;
  }
}

class MoodEntry {
  final DateTime date;
  final String mood;
  final String? note;
  final bool isShared;
  final String time;

  MoodEntry({
    required this.date,
    required this.mood,
    this.note,
    this.isShared = false,
    required this.time,
  });

  String get moodEmoji {
    switch (mood) {
      case 'happy':
        return '😊';
      case 'excited':
        return '😄';
      case 'neutral':
        return '😐';
      case 'sad':
        return '😢';
      case 'worried':
        return '😟';
      default:
        return '😐';
    }
  }
}

class HabitData {
  final String name;
  final String icon;
  final int current;
  final int target;
  final String unit;

  HabitData({
    required this.name,
    required this.icon,
    required this.current,
    required this.target,
    required this.unit,
  });

  double get progress => current / target;
}
