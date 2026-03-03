import '../../domain/entities/prayer_day.dart';
import '../../domain/repos/prayer_repository.dart';
import '../datasources/prayer_local_datasource.dart';
import '../models/prayer_day_model.dart';

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
  Future<int> calculateStreak() async {
    return _localDataSource.calculateStreak();
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
}
