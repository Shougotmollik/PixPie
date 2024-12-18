import 'package:flutter/material.dart';
import 'package:pixpie/screens/auth/splash_screen.dart';
import 'package:pixpie/screens/main_nav_bar_screen.dart';

class PixpieApp extends StatelessWidget {
  const PixpieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainNavBarScreen(),
    );
  }
}
