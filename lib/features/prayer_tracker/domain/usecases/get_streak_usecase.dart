import '../../../../core/usecases/usecase.dart';
import '../entities/streak_info.dart';
import '../repos/prayer_repository.dart';

class GetStreakUseCase implements UseCaseNoParams<StreakInfo> {
  final PrayerRepository repository;

  GetStreakUseCase(this.repository);

  @override
  Future<StreakInfo> call() {
    return repository.getStreak();
  }
}
