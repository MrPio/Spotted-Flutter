import 'package:flutter/material.dart';
import 'package:spotted_flutter/view/partials/bottom_bar_icon.dart';

import '../enums/colors.dart';
import 'fragments/account_fragment.dart';
import 'fragments/add_post_fragment.dart';
import 'fragments/home_fragment.dart';
import 'fragments/settings_fragment.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeFragment(),
    AddPostFragment(),
    AccountFragment(),
    SettingsFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Current fragment
          _pages[_currentIndex],

          // Navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Palette.red.color,
                borderRadius: BorderRadius.circular(999),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 6),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 11.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomBarIcon(
                      icon: Icons.home_outlined,
                      active: _currentIndex == 0,
                      onTap: () => setState(() => _currentIndex = 0),
                    ),
                    BottomBarIcon(
                      icon: Icons.add_circle_outline,
                      active: _currentIndex == 1,
                      onTap: () => setState(() => _currentIndex = 1),
                    ),
                    BottomBarIcon(
                      icon: Icons.person_outline,
                      active: _currentIndex == 2,
                      onTap: () => setState(() => _currentIndex = 2),
                    ),
                    BottomBarIcon(
                      icon: Icons.settings_outlined,
                      active: _currentIndex == 3,
                      onTap: () => setState(() => _currentIndex = 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
