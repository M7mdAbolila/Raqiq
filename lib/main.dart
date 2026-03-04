import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'features/prayer_tracker/presentation/cubit/prayer_cubit.dart';
import 'features/prayer_tracker/presentation/cubit/theme_cubit.dart';

import 'core/di/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  final prayerCubit = di.sl<PrayerCubit>();
  final themeCubit = di.sl<ThemeCubit>();

  await themeCubit.loadTheme();
  prayerCubit.loadData();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: prayerCubit),
        BlocProvider.value(value: themeCubit),
      ],
      child: const RaqiqApp(),
    ),
  );
}
