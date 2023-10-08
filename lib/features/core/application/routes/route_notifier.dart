import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:light_switch_app/features/switch/presentation/light_switch.dart';

import '../../../switch/presentation/timer_page.dart';
import '../../../weather/presentation/weather_page.dart';
import '../../presentation/widgets/bottom_navigator.dart';
import 'route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class RouterNotifier extends ChangeNotifier {
  static List<GoRoute> get routes {
    return [
      GoRoute(
        name: RouteNames.lightNameRoute,
        path: RouteNames.lightRoute,
        builder: (context, state) => const SwitchPage(),
        parentNavigatorKey: _shellNavigatorKey,
      ),
      GoRoute(
        name: RouteNames.timerNameRoute,
        path: RouteNames.timerRoute,
        builder: (context, state) => const TimerPage(),
        parentNavigatorKey: _shellNavigatorKey,
      ),
      GoRoute(
        name: RouteNames.weatherNameRoute,
        path: RouteNames.weatherRoute,
        builder: (context, state) => const WeatherPage(),
        parentNavigatorKey: _shellNavigatorKey,
      ),
      GoRoute(
        name: RouteNames.weatherSettingsNameRoute,
        path: RouteNames.weatherSettingsRoute,
        builder: (context, state) => const TimerPage(),
        parentNavigatorKey: _shellNavigatorKey,
      ),
    ];
  }

  static init() {
    return GoRouter(
      // refreshListenable: router,
      initialLocation: RouteNames.weatherRoute,
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          routes: routes,
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => BottomNavigationContainer(
            location: state.matchedLocation,
            child: child,
          ),
        )
      ],
    );
  }
}
