import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.r,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: items.map((item) {
          int index = items.indexOf(item);
          return BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  height: 2.r,
                  width: 30.r,
                  color: index == currentIndex
                      ? Colors.orange
                      : Colors.transparent,
                ),
                SizedBox(height: 5),
                SvgPicture.asset(
                  item.svgPath,
                  height: 24,
                  width: 24,
                  color: index == currentIndex ? Colors.orange : Colors.grey,
                ),
              ],
            ),
            label: item.label,
          );
        }).toList(),
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final String svgPath;
  final String label;

  const CustomBottomNavigationBarItem({
    required this.svgPath,
    required this.label,
  });
}
