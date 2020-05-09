import 'package:flutter/material.dart';

import './models/bottom_nav_item.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  final List<BottomNavItem> bottomNavItems;
  final Duration animationDuration;
  final Color secondaryColor;
  final Color backgroundColor;
  final Function selectedIndex;
  final bool iconsOnly;

  AnimatedBottomNavBar({
    @required this.bottomNavItems,
    this.animationDuration = const Duration(milliseconds: 150),
    this.secondaryColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.iconsOnly = false,
    @required this.selectedIndex,
  });

  @override
  _AnimatedBottomNavBarState createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  List<Widget> _buildNavItem(List<BottomNavItem> bottomNavItems) {
    List<Widget> _list = [];
    int _listLength = bottomNavItems.length;

    if (_listLength > 5 && widget.iconsOnly)
      _listLength = 5;
    else if (_listLength > 4 && !widget.iconsOnly) _listLength = 4;

    for (int i = 0; i < _listLength; i++) {
      bool isActive = _selectedIndex == i;
      _list.add(
        GestureDetector(
          child: AnimatedContainer(
            duration: widget.animationDuration,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: isActive
                  ? bottomNavItems[i].color.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  bottomNavItems[i].icon,
                  color: isActive
                      ? bottomNavItems[i].color
                      : widget.secondaryColor,
                  size: 28,
                ),
                if (!widget.iconsOnly)
                  const SizedBox(
                    width: 10,
                  ),
                if (!widget.iconsOnly)
                  AnimatedSize(
                    vsync: this,
                    duration: widget.animationDuration,
                    child: Text(
                      isActive ? bottomNavItems[i].title : "",
                      style: TextStyle(
                        color: bottomNavItems[i].color,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              _selectedIndex = i;
              widget.selectedIndex(i);
            });
          },
        ),
      );
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      color: widget.backgroundColor,
      animationDuration: widget.animationDuration,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildNavItem(widget.bottomNavItems),
        ),
      ),
    );
  }
}
