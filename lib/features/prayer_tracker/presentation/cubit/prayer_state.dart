import 'package:equatable/equatable.dart';
import '../../domain/entities/prayer_day.dart';

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

  final Map<DateTime, int> heatmapData;

  final int streak;

  final bool showConfetti;

  const PrayerLoaded({
    required this.today,
    required this.heatmapData,
    required this.streak,
    this.showConfetti = false,
  });

  PrayerLoaded copyWith({
    PrayerDay? today,
    Map<DateTime, int>? heatmapData,
    int? streak,
    bool? showConfetti,
  }) {
    return PrayerLoaded(
      today: today ?? this.today,
      heatmapData: heatmapData ?? this.heatmapData,
      streak: streak ?? this.streak,
      showConfetti: showConfetti ?? this.showConfetti,
    );
  }

  @override
  List<Object?> get props => [today, heatmapData, streak, showConfetti];
}

class PrayerError extends PrayerState {
  final String message;

  const PrayerError(this.message);

  @override
  List<Object?> get props => [message];
}
