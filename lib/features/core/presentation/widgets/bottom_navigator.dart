import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:light_switch_app/features/core/application/routes/route_names.dart';

class BottomNavigationContainer extends StatefulWidget {
  final Widget child;
  final String location;
  static const List<BottomNavigationBarItem> navItems = [
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
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_rounded),
      label: 'Settings',
    ),
  ];

  const BottomNavigationContainer({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  State<BottomNavigationContainer> createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex(widget.location),
        onTap: (index) => context.goNamed(fromIndex(index)),
        items: BottomNavigationContainer.navItems,
      ),
    );
  }

  String fromIndex(int index) {
    switch(index) {
      case 0:
        return RouteNames.weatherNameRoute;
      case 1:
        return RouteNames.lightNameRoute;
      case 2:
        return RouteNames.timerNameRoute;
      case 3:
        return RouteNames.settingsNameRoute;
    }
    return RouteNames.weatherNameRoute;
  }

  int currentIndex (String location) {
    switch(location) {
      case RouteNames.weatherRoute:
        return 0;
      case RouteNames.lightRoute:
        return 1;
      case RouteNames.timerRoute:
        return 2;
      case RouteNames.settingsRoute:
        return 3;
    }
    return 0;
  }
}
