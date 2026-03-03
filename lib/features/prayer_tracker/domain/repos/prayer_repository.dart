import '../entities/prayer_day.dart';

abstract class PrayerRepository {
  Future<PrayerDay> getOrCreateDay(DateTime date);

  Future<PrayerDay> updateDay(PrayerDay prayerDay);

  Future<List<PrayerDay>> getYearData(int year);

  Future<int> calculateStreak();
}
