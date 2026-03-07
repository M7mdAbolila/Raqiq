import '../models/prayer_day_model.dart';
import '../models/streak_model.dart';

abstract class PrayerLocalDataSource {
  Future<PrayerDayModel> getOrCreateDay(DateTime date);
  Future<PrayerDayModel> updateDay(PrayerDayModel day);
  Future<List<PrayerDayModel>> getYearData(int year);
  Future<StreakModel> getStreak();
  Future<StreakModel> updateStreak(DateTime date);
  Future<StreakModel> decreaseStreak(DateTime date);
}
