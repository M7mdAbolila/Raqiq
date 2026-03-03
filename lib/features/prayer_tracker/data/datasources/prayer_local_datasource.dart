import 'package:isar_community/isar.dart';
import '../../../../core/utils/date_utils.dart';
import '../models/prayer_day_model.dart';

class PrayerLocalDataSource {
  final Isar _isar;

  PrayerLocalDataSource(this._isar);

  Future<PrayerDayModel> getOrCreateDay(DateTime date) async {
    final normalizedDate = AppDateUtils.normalizeDate(date);

    final existing = await _isar.prayerDayModels
        .filter()
        .dateEqualTo(normalizedDate)
        .findFirst();

    if (existing != null) return existing;

    final newDay = PrayerDayModel()..date = normalizedDate;
    await _isar.writeTxn(() async {
      await _isar.prayerDayModels.put(newDay);
    });

    return newDay;
  }

  Future<PrayerDayModel> updateDay(PrayerDayModel day) async {
    await _isar.writeTxn(() async {
      await _isar.prayerDayModels.put(day);
    });
    return day;
  }

  Future<List<PrayerDayModel>> getYearData(int year) async {
    final start = AppDateUtils.startOfYear(year);
    final end = AppDateUtils.endOfYear(year);

    return _isar.prayerDayModels
        .filter()
        .dateBetween(start, end)
        .sortByDate()
        .findAll();
  }

  /// Calculates the current streak of consecutive 5/5 days
  /// starting from today going backwards.
  Future<int> calculateStreak() async {
    final today = AppDateUtils.today();
    int streak = 0;

    for (int i = 0; i < 365; i++) {
      final date = today.subtract(Duration(days: i));
      final day = await _isar.prayerDayModels
          .filter()
          .dateEqualTo(date)
          .findFirst();

      if (day == null || day.completedCount != 5) break;
      streak++;
    }

    return streak;
  }
}
