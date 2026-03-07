import 'package:isar_community/isar.dart';
import '../../../../core/utils/date_utils.dart';
import '../models/prayer_day_model.dart';
import '../models/streak_model.dart';
import 'prayer_local_datasource.dart';

class PrayerLocalDataSourceImpl implements PrayerLocalDataSource {
  final Isar _isar;

  PrayerLocalDataSourceImpl(this._isar);

  @override
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

  @override
  Future<PrayerDayModel> updateDay(PrayerDayModel day) async {
    await _isar.writeTxn(() async {
      await _isar.prayerDayModels.put(day);
    });
    return day;
  }

  @override
  Future<List<PrayerDayModel>> getYearData(int year) async {
    final start = AppDateUtils.startOfYear(year);
    final end = AppDateUtils.endOfYear(year);

    return _isar.prayerDayModels
        .filter()
        .dateBetween(start, end)
        .sortByDate()
        .findAll();
  }

  @override
  Future<StreakModel> getStreak() async {
    final existing = await _isar.streakModels.get(0);
    if (existing != null) return existing;

    final newStreak = StreakModel();
    await _isar.writeTxn(() async {
      await _isar.streakModels.put(newStreak);
    });
    return newStreak;
  }

  @override
  Future<StreakModel> updateStreak(DateTime date) async {
    final normalizedDate = AppDateUtils.normalizeDate(date);
    final streak = await getStreak();

    if (streak.lastCompletedDate == null) {
      streak.currentStreak = 1;
    } else {
      final lastDate = AppDateUtils.normalizeDate(streak.lastCompletedDate!);
      final diff = normalizedDate.difference(lastDate).inDays;

      if (diff == 0) {
        return streak;
      } else if (diff == 1) {
        streak.currentStreak += 1;
      } else if (diff > 1) {
        streak.currentStreak = 1;
      }
    }

    if (streak.currentStreak > streak.longestStreak) {
      streak.longestStreak = streak.currentStreak;
    }

    streak.lastCompletedDate = normalizedDate;

    await _isar.writeTxn(() async {
      await _isar.streakModels.put(streak);
    });

    return streak;
  }

  @override
  Future<StreakModel> decreaseStreak(DateTime date) async {
    final normalizedDate = AppDateUtils.normalizeDate(date);
    final streak = await getStreak();

    if (streak.lastCompletedDate == null) {
      return streak;
    }

    final lastDate = AppDateUtils.normalizeDate(streak.lastCompletedDate!);
    final diff = normalizedDate.difference(lastDate).inDays;

    if (diff == 0) {
      if (streak.currentStreak > 0) {
        streak.currentStreak -= 1;
      }

      if (streak.currentStreak == 0) {
        streak.lastCompletedDate = null;
      } else {
        streak.lastCompletedDate = normalizedDate.subtract(
          const Duration(days: 1),
        );
      }

      if (streak.longestStreak > 0 &&
          streak.longestStreak == streak.currentStreak + 1) {
        streak.longestStreak -= 1;
      }

      await _isar.writeTxn(() async {
        await _isar.streakModels.put(streak);
      });
    }
    // else if (diff < 0) {
    // streak.currentStreak = 0;
    // streak.lastCompletedDate = null;
    // await _isar.writeTxn(() async {
    //   await _isar.streakModels.put(streak);
    // });
    // }

    return streak;
  }
}
