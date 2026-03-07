import '../../../../core/usecases/usecase.dart';
import '../entities/streak_info.dart';
import '../repos/prayer_repository.dart';

class UpdateStreakUseCase implements UseCase<StreakInfo, DateTime> {
  final PrayerRepository repository;

  UpdateStreakUseCase(this.repository);

  @override
  Future<StreakInfo> call(DateTime date) {
    return repository.updateStreak(date);
  }
}
