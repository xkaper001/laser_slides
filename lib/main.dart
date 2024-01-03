import 'package:flutter/material.dart';
import 'package:laser_slides/features/homeScreen/home.dart';
import 'package:laser_slides/utils/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const HomeScreen()
    );
  }
}
