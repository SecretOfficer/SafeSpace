import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/parent_dashboard.dart';
import 'screens/child_dashboard.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const SafeSpaceApp());
}

class SafeSpaceApp extends StatelessWidget {
  const SafeSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'SafeSpace',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/parent': (context) => const ParentDashboard(),
          '/child': (context) => const ChildDashboard(),
        },
      ),
    );
  }
}

class UserProvider extends ChangeNotifier {
  bool _isParent = true;
  String _childName = 'Aarav';

  bool get isParent => _isParent;
  String get childName => _childName;

  void setUserType(bool isParent) {
    _isParent = isParent;
    notifyListeners();
  }

  void setChildName(String name) {
    _childName = name;
    notifyListeners();
  }
}
