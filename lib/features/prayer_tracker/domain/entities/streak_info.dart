import 'package:equatable/equatable.dart';

class StreakInfo extends Equatable {
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastCompletedDate;

  const StreakInfo({
    required this.currentStreak,
    required this.longestStreak,
    this.lastCompletedDate,
  });

  @override
  List<Object?> get props => [currentStreak, longestStreak, lastCompletedDate];
}
