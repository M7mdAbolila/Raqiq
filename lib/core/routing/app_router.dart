import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/prayer_tracker/presentation/cubit/prayer_cubit.dart';
import '../../features/prayer_tracker/presentation/screens/prayer_home_screen.dart';
import '../di/injection_container.dart' as di;
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.prayerTrackerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di.sl<PrayerCubit>()..loadData(),
            child: const PrayerTrakerScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
