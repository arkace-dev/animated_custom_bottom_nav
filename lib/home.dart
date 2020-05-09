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
      body: Container(
        color: _bottomNavItems[_selectedIndex].color,
      ),
      bottomNavigationBar: AnimatedBottomNavBar(
        bottomNavItems: _bottomNavItems,
        animationDuration: const Duration(milliseconds: 150),
        selectedIndex: _getSelectedIndex,
      ),
    );
  }
}
