import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/prayer_tracker/presentation/cubit/theme_cubit.dart';
import '../features/prayer_tracker/presentation/cubit/theme_state.dart';
import 'theme/app_theme.dart';
import '../features/prayer_tracker/presentation/screens/prayer_home_screen.dart';

class RaqiqApp extends StatelessWidget {
  const RaqiqApp({super.key});

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
          home: const PrayerHomeScreen(),
        );
      },
    );
  }
}
