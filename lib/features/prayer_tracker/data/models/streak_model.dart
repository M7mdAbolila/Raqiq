import 'package:isar_community/isar.dart';

part 'streak_model.g.dart';

@collection
class StreakModel {
  Id id = 0;

  int currentStreak = 0;

  int longestStreak = 0;

  DateTime? lastCompletedDate;
}
