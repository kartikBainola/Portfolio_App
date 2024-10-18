import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_llp/Screens/input/inputpage.dart';
import 'package:yoliday_llp/Screens/portfoilo/portfoliopage.dart';
import 'package:yoliday_llp/Screens/profile/ProfilePage.dart';

import 'CustomBottomNavi.dart';
import 'homepage/Homepage.dart';

class Initscreen extends StatefulWidget {
  const Initscreen({super.key});

  @override
  State<Initscreen> createState() => _InitscreenState();
}

class _InitscreenState extends State<Initscreen> {
  int currentSelectedIndex = 1;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const Homepage(),
    PortfolioPage(),
    const InputPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentSelectedIndex,
        onTap: updateCurrentIndex,
        items: <CustomBottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
              svgPath: 'assets/SVG/Home svg.svg', label: "Home"),
          CustomBottomNavigationBarItem(
              svgPath: 'assets/SVG/Portfolia svg.svg', label: "Portfolio"),
          CustomBottomNavigationBarItem(
              svgPath: 'assets/SVG/Input svg.svg', label: "Input"),
          CustomBottomNavigationBarItem(
              svgPath: 'assets/SVG/Profile svg.svg', label: "Profile"),
        ],
      ),
    );
  }
}
