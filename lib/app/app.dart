import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raqiq/core/routing/routes.dart';
import '../core/routing/app_router.dart';
import '../features/prayer_tracker/presentation/cubit/theme_cubit.dart';
import '../features/prayer_tracker/presentation/cubit/theme_state.dart';
import 'theme/app_theme.dart';

class RaqiqApp extends StatelessWidget {
  const RaqiqApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Raqiq',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeState.themeMode,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.prayerTrackerScreen,
        );
      },
    );
  }
}
