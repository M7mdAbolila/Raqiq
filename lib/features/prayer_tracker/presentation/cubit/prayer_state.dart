import 'package:equatable/equatable.dart';
import '../../domain/entities/prayer_day.dart';
import '../../domain/entities/streak_info.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object?> get props => [];
}

class PrayerInitial extends PrayerState {
  const PrayerInitial();
}

class PrayerLoading extends PrayerState {
  const PrayerLoading();
}

class PrayerLoaded extends PrayerState {
  final PrayerDay today;

  final Map<DateTime, PrayerDay> heatmapData;

  final StreakInfo streakInfo;

  final bool showConfetti;

  const PrayerLoaded({
    required this.today,
    required this.heatmapData,
    required this.streakInfo,
    this.showConfetti = false,
  });

  PrayerLoaded copyWith({
    PrayerDay? today,
    Map<DateTime, PrayerDay>? heatmapData,
    StreakInfo? streakInfo,
    bool? showConfetti,
  }) {
    return PrayerLoaded(
      today: today ?? this.today,
      heatmapData: heatmapData ?? this.heatmapData,
      streakInfo: streakInfo ?? this.streakInfo,
      showConfetti: showConfetti ?? this.showConfetti,
    );
  }

  @override
  List<Object?> get props => [today, heatmapData, streakInfo, showConfetti];
}

class PrayerError extends PrayerState {
  final String message;

  const PrayerError(this.message);

  @override
  List<Object?> get props => [message];
}
