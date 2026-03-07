import '../../../../core/usecases/usecase.dart';
import '../entities/streak_info.dart';
import '../repos/prayer_repository.dart';

class DecreaseStreakUseCase implements UseCase<StreakInfo, DateTime> {
  final PrayerRepository repository;

  DecreaseStreakUseCase(this.repository);

  @override
  Future<StreakInfo> call(DateTime date) {
    return repository.decreaseStreak(date);
  }
}
