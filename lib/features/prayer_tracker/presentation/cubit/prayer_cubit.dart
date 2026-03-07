import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/usecases/get_or_create_day_usecase.dart';
import '../../domain/usecases/get_streak_usecase.dart';
import '../../domain/usecases/get_year_data_usecase.dart';
import '../../domain/usecases/update_day_usecase.dart';
import 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final GetOrCreateDayUseCase _getOrCreateDayUseCase;
  final GetYearDataUseCase _getYearDataUseCase;
  final GetStreakUseCase _getStreakUseCase;
  final UpdateDayUseCase _updateDayUseCase;

  PrayerCubit({
    required GetOrCreateDayUseCase getOrCreateDayUseCase,
    required GetYearDataUseCase getYearDataUseCase,
    required GetStreakUseCase getStreakUseCase,
    required UpdateDayUseCase updateDayUseCase,
  }) : _getOrCreateDayUseCase = getOrCreateDayUseCase,
       _getYearDataUseCase = getYearDataUseCase,
       _getStreakUseCase = getStreakUseCase,
       _updateDayUseCase = updateDayUseCase,
       super(const PrayerInitial());

  Future<void> loadData() async {
    emit(const PrayerLoading());
    try {
      final today = await _getOrCreateDayUseCase(AppDateUtils.today());
      final year = DateTime.now().year;
      final yearData = await _getYearDataUseCase(year);
      final streak = await _getStreakUseCase();

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
      final updated = await _updateDayUseCase(toggled);
      final streak = await _getStreakUseCase();

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
