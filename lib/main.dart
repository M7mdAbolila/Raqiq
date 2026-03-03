import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'features/prayer_tracker/data/datasources/prayer_local_datasource.dart';
import 'features/prayer_tracker/data/models/prayer_day_model.dart';
import 'features/prayer_tracker/data/repos/prayer_repository_impl.dart';
import 'features/prayer_tracker/presentation/cubit/prayer_cubit.dart';
import 'features/prayer_tracker/presentation/cubit/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([PrayerDayModelSchema], directory: dir.path);

  // Create data layer
  final localDataSource = PrayerLocalDataSource(isar);
  final repository = PrayerRepositoryImpl(localDataSource);

  // Create cubits
  final prayerCubit = PrayerCubit(repository);
  final themeCubit = ThemeCubit();

  // Load initial data
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
