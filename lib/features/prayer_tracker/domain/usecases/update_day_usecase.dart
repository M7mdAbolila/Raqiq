import '../../../../core/usecases/usecase.dart';
import '../entities/prayer_day.dart';
import '../repos/prayer_repository.dart';

class UpdateDayUseCase implements UseCase<PrayerDay, PrayerDay> {
  final PrayerRepository repository;

  UpdateDayUseCase(this.repository);

  @override
  Future<PrayerDay> call(PrayerDay prayerDay) {
    return repository.updateDay(prayerDay);
  }
}
