import '../entities/prayer_day.dart';
import '../entities/streak_info.dart';

abstract class PrayerRepository {
  Future<PrayerDay> getOrCreateDay(DateTime date);

  Future<PrayerDay> updateDay(PrayerDay prayerDay);

  Future<List<PrayerDay>> getYearData(int year);

  Future<StreakInfo> getStreak();

  Future<StreakInfo> updateStreak(DateTime date);

  Future<StreakInfo> decreaseStreak(DateTime date);
}
