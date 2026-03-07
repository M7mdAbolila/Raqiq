import '../../domain/entities/prayer_day.dart';
import '../../domain/entities/streak_info.dart';
import '../../domain/repos/prayer_repository.dart';
import '../datasources/prayer_local_datasource.dart';
import '../models/prayer_day_model.dart';
import '../models/streak_model.dart';

class PrayerRepositoryImpl implements PrayerRepository {
  final PrayerLocalDataSource _localDataSource;

  PrayerRepositoryImpl(this._localDataSource);

  @override
  Future<PrayerDay> getOrCreateDay(DateTime date) async {
    final model = await _localDataSource.getOrCreateDay(date);
    return _modelToEntity(model);
  }

  @override
  Future<PrayerDay> updateDay(PrayerDay prayerDay) async {
    final model = _entityToModel(prayerDay);
    final updated = await _localDataSource.updateDay(model);
    return _modelToEntity(updated);
  }

  @override
  Future<List<PrayerDay>> getYearData(int year) async {
    final models = await _localDataSource.getYearData(year);
    return models.map(_modelToEntity).toList();
  }

  @override
  Future<StreakInfo> getStreak() async {
    final model = await _localDataSource.getStreak();
    return _streakModelToEntity(model);
  }

  @override
  Future<StreakInfo> updateStreak(DateTime date) async {
    final model = await _localDataSource.updateStreak(date);
    return _streakModelToEntity(model);
  }

  @override
  Future<StreakInfo> decreaseStreak(DateTime date) async {
    final model = await _localDataSource.decreaseStreak(date);
    return _streakModelToEntity(model);
  }

  PrayerDay _modelToEntity(PrayerDayModel model) {
    return PrayerDay(
      id: model.id,
      date: model.date,
      fajr: model.fajr,
      dhuhr: model.dhuhr,
      asr: model.asr,
      maghrib: model.maghrib,
      isha: model.isha,
    );
  }

  PrayerDayModel _entityToModel(PrayerDay entity) {
    return PrayerDayModel()
      ..id = entity.id
      ..date = entity.date
      ..fajr = entity.fajr
      ..dhuhr = entity.dhuhr
      ..asr = entity.asr
      ..maghrib = entity.maghrib
      ..isha = entity.isha;
  }

  StreakInfo _streakModelToEntity(StreakModel model) {
    return StreakInfo(
      currentStreak: model.currentStreak,
      longestStreak: model.longestStreak,
      lastCompletedDate: model.lastCompletedDate,
    );
  }
}
