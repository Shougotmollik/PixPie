import 'package:flutter/material.dart';
import 'package:pixpie/screens/explorer_screen.dart';
import 'package:pixpie/screens/home_screen.dart';
import 'package:pixpie/screens/profile_screen.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  bool _isVisible = true;
  List<Widget> _screens = [];

  afterScrollResult(bool visibility) {
    _isVisible = visibility;
    setState(() {});
  }

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(
        afterScrollResult: afterScrollResult,
      ),
      const ExplorerScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ? 80 : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                fixedColor: Colors.black,
                unselectedItemColor: Colors.grey,
                iconSize: 32,
                selectedFontSize: 12,
                unselectedFontSize: 10,
                currentIndex: _currentIndex,
                onTap: (value) {
                  setState(() {});
                  _currentIndex = value;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard), label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_box_outlined), label: "Account"),
                ]),
          ],
        ),
      ),
    );
  }
}
