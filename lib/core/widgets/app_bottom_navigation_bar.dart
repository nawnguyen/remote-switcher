import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_cloudy),
          label: 'Weather',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_sharp),
          label: 'Lights',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: 'Timer',
        ),
      ],
    );
  }
}
