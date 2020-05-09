import 'package:flutter/material.dart';

import './animated_bottom_nav_bar.dart';

// Models
import './models/bottom_nav_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  Duration _duration = const Duration(milliseconds: 150);

  List<BottomNavItem> _bottomNavItems = [
    BottomNavItem(
      color: Colors.indigo,
      icon: Icons.home,
      title: "Home",
    ),
    BottomNavItem(
      color: Colors.pinkAccent,
      icon: Icons.favorite_border,
      title: "Likes",
    ),
    BottomNavItem(
      color: Colors.yellow[900],
      icon: Icons.search,
      title: "Search",
    ),
    BottomNavItem(
      color: Colors.teal,
      icon: Icons.person_outline,
      title: "Profile",
    ),
  ];

  void _getSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        child: Center(
          child: Icon(
            _bottomNavItems[_selectedIndex].icon,
            color: Colors.white24,
            size: 200,
          ),
        ),
        color: _bottomNavItems[_selectedIndex].color,
        duration: _duration,
      ),
      bottomNavigationBar: AnimatedBottomNavBar(
        bottomNavItems: _bottomNavItems,
        animationDuration: _duration,
        selectedIndex: _getSelectedIndex,
      ),
    );
  }
}
