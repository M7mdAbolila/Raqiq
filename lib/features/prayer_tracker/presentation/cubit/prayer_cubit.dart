import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/usecases/get_or_create_day_usecase.dart';
import '../../domain/usecases/get_streak_usecase.dart';
import '../../domain/usecases/get_year_data_usecase.dart';
import '../../domain/usecases/update_day_usecase.dart';
import '../../domain/usecases/update_streak_usecase.dart';
import '../../domain/usecases/decrease_streak_usecase.dart';
import '../../domain/entities/prayer_day.dart';
import 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final GetOrCreateDayUseCase _getOrCreateDayUseCase;
  final GetYearDataUseCase _getYearDataUseCase;
  final GetStreakUseCase _getStreakUseCase;
  final UpdateDayUseCase _updateDayUseCase;
  final UpdateStreakUseCase _updateStreakUseCase;
  final DecreaseStreakUseCase _decreaseStreakUseCase;

  PrayerCubit({
    required GetOrCreateDayUseCase getOrCreateDayUseCase,
    required GetYearDataUseCase getYearDataUseCase,
    required GetStreakUseCase getStreakUseCase,
    required UpdateDayUseCase updateDayUseCase,
    required UpdateStreakUseCase updateStreakUseCase,
    required DecreaseStreakUseCase decreaseStreakUseCase,
  }) : _getOrCreateDayUseCase = getOrCreateDayUseCase,
       _getYearDataUseCase = getYearDataUseCase,
       _getStreakUseCase = getStreakUseCase,
       _updateDayUseCase = updateDayUseCase,
       _updateStreakUseCase = updateStreakUseCase,
       _decreaseStreakUseCase = decreaseStreakUseCase,
       super(const PrayerInitial());

  Future<void> loadData() async {
    emit(const PrayerLoading());
    try {
      final today = await _getOrCreateDayUseCase(AppDateUtils.today());
      final year = DateTime.now().year;
      final yearData = await _getYearDataUseCase(year);
      final streakInfo = await _getStreakUseCase();

      final heatmapData = <DateTime, PrayerDay>{};
      for (final day in yearData) {
        heatmapData[AppDateUtils.normalizeDate(day.date)] = day;
      }

      emit(
        PrayerLoaded(
          today: today,
          heatmapData: heatmapData,
          streakInfo: streakInfo,
        ),
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
      final updated = await _updateDayUseCase(toggled);

      final heatmapData = Map<DateTime, PrayerDay>.from(current.heatmapData);
      heatmapData[AppDateUtils.normalizeDate(updated.date)] = updated;

      final showConfetti = !wasFullBefore && updated.isFullDay;

      var streakInfo = current.streakInfo;
      if (!wasFullBefore && updated.isFullDay) {
        streakInfo = await _updateStreakUseCase(updated.date);
      } else if (wasFullBefore && !updated.isFullDay) {
        streakInfo = await _decreaseStreakUseCase(updated.date);
      }

      emit(
        current.copyWith(
          today: updated,
          heatmapData: heatmapData,
          streakInfo: streakInfo,
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
