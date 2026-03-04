import '../models/prayer_day_model.dart';

abstract class PrayerLocalDataSource {
  Future<PrayerDayModel> getOrCreateDay(DateTime date);
  Future<PrayerDayModel> updateDay(PrayerDayModel day);
  Future<List<PrayerDayModel>> getYearData(int year);
  Future<int> calculateStreak();
}
