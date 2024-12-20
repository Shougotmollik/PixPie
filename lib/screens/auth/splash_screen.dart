import 'package:flutter/material.dart';
import 'package:pixpie/screens/main_nav_bar_screen.dart';
import 'package:pixpie/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _moveToMainNavBar();
    super.initState();
  }

  Future<void> _moveToMainNavBar() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainNavBarScreen(),
              ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                AppStrings.appName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                AppStrings.appVersion,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
