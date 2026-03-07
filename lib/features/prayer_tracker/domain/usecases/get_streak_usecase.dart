import '../../../../core/usecases/usecase.dart';
import '../repos/prayer_repository.dart';

class GetStreakUseCase implements UseCaseNoParams<int> {
  final PrayerRepository repository;

  GetStreakUseCase(this.repository);

  @override
  Future<int> call() {
    return repository.calculateStreak();
  }
}
