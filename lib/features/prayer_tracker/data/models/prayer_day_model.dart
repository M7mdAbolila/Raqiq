import 'package:isar_community/isar.dart';

part 'prayer_day_model.g.dart';

@collection
class PrayerDayModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late DateTime date;

  bool fajr = false;
  bool dhuhr = false;
  bool asr = false;
  bool maghrib = false;
  bool isha = false;

  @ignore
  int get completedCount =>
      [fajr, dhuhr, asr, maghrib, isha].where((p) => p).length;
}
