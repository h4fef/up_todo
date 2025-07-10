//flutter
import 'package:flutter/material.dart';

class NavigationHome extends StatefulWidget {
  NavigationHome({super.key, required this.currentIndex});
  int currentIndex;

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // padding: EdgeInsets.only(top: 12, bottom: 25, left: 20, right: 20),
      color: Color.fromRGBO(54, 54, 54, 1),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavItem(Icons.home_outlined, Icons.home_filled, "Home", 0),
            buildNavItem(
              Icons.calendar_month_outlined,
              Icons.calendar_month,
              "Calendario",
              1,
            ),
            buildNavItem(
              Icons.watch_later_outlined,
              Icons.watch_later,
              "Focus",
              2,
            ),
            buildNavItem(Icons.person_4_outlined, Icons.person_4, "Profilo", 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    final isSelected = widget.currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          widget.currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            size: 28,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
