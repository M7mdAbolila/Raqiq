import '../../../../core/usecases/usecase.dart';
import '../entities/prayer_day.dart';
import '../repos/prayer_repository.dart';

class GetYearDataUseCase implements UseCase<List<PrayerDay>, int> {
  final PrayerRepository repository;

  GetYearDataUseCase(this.repository);

  @override
  Future<List<PrayerDay>> call(int year) {
    return repository.getYearData(year);
  }
}
