import 'package:equatable/equatable.dart';

class PrayerDay extends Equatable {
  final int id;
  final DateTime date;
  final bool fajr;
  final bool dhuhr;
  final bool asr;
  final bool maghrib;
  final bool isha;

  const PrayerDay({
    required this.id,
    required this.date,
    this.fajr = false,
    this.dhuhr = false,
    this.asr = false,
    this.maghrib = false,
    this.isha = false,
  });

  int get completedCount =>
      [fajr, dhuhr, asr, maghrib, isha].where((p) => p).length;

  bool get isFullDay => completedCount == 5;

  PrayerDay togglePrayer(String name) {
    return PrayerDay(
      id: id,
      date: date,
      fajr: name == 'fajr' ? !fajr : fajr,
      dhuhr: name == 'dhuhr' ? !dhuhr : dhuhr,
      asr: name == 'asr' ? !asr : asr,
      maghrib: name == 'maghrib' ? !maghrib : maghrib,
      isha: name == 'isha' ? !isha : isha,
    );
  }

  @override
  List<Object?> get props => [id, date, fajr, dhuhr, asr, maghrib, isha];
}
