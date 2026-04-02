import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Life Manager',

      // 🌞 Light Mode
      theme: AppTheme.lightTheme,

      // 🌙 Dark Mode
      darkTheme: AppTheme.darkTheme,

      // ⚡ تغيير تلقائي حسب النظام
      themeMode: ThemeMode.system,

      home: const HomeScreen(),
    );
  }
}