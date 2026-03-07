import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/prayer_tracker/data/datasources/prayer_local_datasource.dart';
import '../../features/prayer_tracker/data/datasources/prayer_local_datasource_impl.dart';
import '../../features/prayer_tracker/data/models/prayer_day_model.dart';
import '../../features/prayer_tracker/data/models/streak_model.dart';
import '../../features/prayer_tracker/data/repos/prayer_repository_impl.dart';
import '../../features/prayer_tracker/domain/repos/prayer_repository.dart';
import '../../features/prayer_tracker/domain/usecases/get_or_create_day_usecase.dart';
import '../../features/prayer_tracker/domain/usecases/get_streak_usecase.dart';
import '../../features/prayer_tracker/domain/usecases/get_year_data_usecase.dart';
import '../../features/prayer_tracker/domain/usecases/update_day_usecase.dart';
import '../../features/prayer_tracker/domain/usecases/update_streak_usecase.dart';
import '../../features/prayer_tracker/domain/usecases/decrease_streak_usecase.dart';
import '../../features/prayer_tracker/presentation/cubit/prayer_cubit.dart';
import '../../app/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ── External ──
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('is_dark_mode') ?? true;
  final initialThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    PrayerDayModelSchema,
    StreakModelSchema,
  ], directory: dir.path);
  sl.registerLazySingleton(() => isar);

  // ── Data sources ──
  sl.registerLazySingleton<PrayerLocalDataSource>(
    () => PrayerLocalDataSourceImpl(sl()),
  );

  // ── Repository ──
  sl.registerLazySingleton<PrayerRepository>(() => PrayerRepositoryImpl(sl()));

  // ── Use Cases ──
  sl.registerLazySingleton(() => GetOrCreateDayUseCase(sl()));
  sl.registerLazySingleton(() => GetYearDataUseCase(sl()));
  sl.registerLazySingleton(() => GetStreakUseCase(sl()));
  sl.registerLazySingleton(() => UpdateDayUseCase(sl()));
  sl.registerLazySingleton(() => UpdateStreakUseCase(sl()));
  sl.registerLazySingleton(() => DecreaseStreakUseCase(sl()));

  // ── Cubits ──
  sl.registerFactory(
    () => PrayerCubit(
      getOrCreateDayUseCase: sl(),
      getYearDataUseCase: sl(),
      getStreakUseCase: sl(),
      updateDayUseCase: sl(),
      updateStreakUseCase: sl(),
      decreaseStreakUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(() => ThemeCubit(initialThemeMode));
}
