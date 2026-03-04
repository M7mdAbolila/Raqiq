import 'package:flutter/material.dart';
import '../../features/prayer_tracker/presentation/screens/prayer_home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.prayerTrackerScreen:
        return MaterialPageRoute(builder: (_) => const PrayerTrakerScreen());

      default:
        return null;
    }
  }
}
