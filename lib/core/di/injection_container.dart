import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/prayer_tracker/data/datasources/prayer_local_datasource.dart';
import '../../features/prayer_tracker/data/datasources/prayer_local_datasource_impl.dart';
import '../../features/prayer_tracker/data/models/prayer_day_model.dart';
import '../../features/prayer_tracker/data/repos/prayer_repository_impl.dart';
import '../../features/prayer_tracker/domain/repos/prayer_repository.dart';
import '../../features/prayer_tracker/presentation/cubit/prayer_cubit.dart';
import '../../app/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('is_dark_mode') ?? true;
  final initialThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;

  // Cubits
  sl.registerFactory(() => PrayerCubit(sl()));
  sl.registerLazySingleton(() => ThemeCubit(initialThemeMode));

  // Repository
  sl.registerLazySingleton<PrayerRepository>(() => PrayerRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<PrayerLocalDataSource>(
    () => PrayerLocalDataSourceImpl(sl()),
  );

  // Isar
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([PrayerDayModelSchema], directory: dir.path);
  sl.registerLazySingleton(() => isar);
}
