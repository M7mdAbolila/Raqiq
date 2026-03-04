import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/prayer_tracker/data/datasources/prayer_local_datasource.dart';
import '../../features/prayer_tracker/data/datasources/prayer_local_datasource_impl.dart';
import '../../features/prayer_tracker/data/models/prayer_day_model.dart';
import '../../features/prayer_tracker/data/repos/prayer_repository_impl.dart';
import '../../features/prayer_tracker/domain/repos/prayer_repository.dart';
import '../../features/prayer_tracker/presentation/cubit/prayer_cubit.dart';
import '../../features/prayer_tracker/presentation/cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => PrayerCubit(sl()));
  sl.registerFactory(() => ThemeCubit());

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
