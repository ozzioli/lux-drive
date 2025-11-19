import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LuxDrive',
      theme: ThemeData(
        fontFamily: 'CenturyGothic',
        primaryColor: const Color(0xFFBEA264),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'CenturyGothic'),
          bodyMedium: TextStyle(fontFamily: 'CenturyGothic'),
          titleLarge: TextStyle(fontFamily: 'CenturyGothic'),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}