import '../../../../core/usecases/usecase.dart';
import '../entities/prayer_day.dart';
import '../repos/prayer_repository.dart';

class GetOrCreateDayUseCase implements UseCase<PrayerDay, DateTime> {
  final PrayerRepository repository;

  GetOrCreateDayUseCase(this.repository);

  @override
  Future<PrayerDay> call(DateTime date) {
    return repository.getOrCreateDay(date);
  }
}
