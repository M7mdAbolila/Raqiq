import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/repos/prayer_repository.dart';
import 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final PrayerRepository _repository;

  PrayerCubit(this._repository) : super(const PrayerInitial());

  Future<void> loadData() async {
    emit(const PrayerLoading());
    try {
      final today = await _repository.getOrCreateDay(AppDateUtils.today());
      final year = DateTime.now().year;
      final yearData = await _repository.getYearData(year);
      final streak = await _repository.calculateStreak();

      final heatmapData = <DateTime, int>{};
      for (final day in yearData) {
        heatmapData[AppDateUtils.normalizeDate(day.date)] = day.completedCount;
      }

      emit(
        PrayerLoaded(today: today, heatmapData: heatmapData, streak: streak),
      );
    } catch (e) {
      emit(PrayerError(e.toString()));
    }
  }

  Future<void> togglePrayer(String prayerName) async {
    final current = state;
    if (current is! PrayerLoaded) return;

    try {
      final wasFullBefore = current.today.isFullDay;
      final toggled = current.today.togglePrayer(prayerName);
      final updated = await _repository.updateDay(toggled);
      final streak = await _repository.calculateStreak();

      final heatmapData = Map<DateTime, int>.from(current.heatmapData);
      heatmapData[AppDateUtils.normalizeDate(updated.date)] =
          updated.completedCount;

      final showConfetti = !wasFullBefore && updated.isFullDay;

      emit(
        current.copyWith(
          today: updated,
          heatmapData: heatmapData,
          streak: streak,
          showConfetti: showConfetti,
        ),
      );

      if (showConfetti) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (state is PrayerLoaded) {
          emit((state as PrayerLoaded).copyWith(showConfetti: false));
        }
      }
    } catch (e) {
      emit(PrayerError(e.toString()));
    }
  }
}
