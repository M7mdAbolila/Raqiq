import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:raqiq/features/prayer_tracker/presentation/widgets/prayer_toggole_card.dart';
import '../../../../app/theme/app_colors.dart';

class PrayerInfo {
  final String key;
  final String label;
  final String icon;
  final bool isCompleted;

  PrayerInfo(this.key, this.label, this.icon, this.isCompleted);
}

class PrayerToggleSection extends StatelessWidget {
  final bool fajr;
  final bool dhuhr;
  final bool asr;
  final bool maghrib;
  final bool isha;
  final void Function(String prayerName) onToggle;

  const PrayerToggleSection({
    super.key,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final prayers = [
      PrayerInfo('fajr', 'Fajr', '🌅', fajr),
      PrayerInfo('dhuhr', 'Dhuhr', '🌞', dhuhr),
      PrayerInfo('asr', 'Asr', '🌤️', asr),
      PrayerInfo('maghrib', 'Maghrib', '🌇', maghrib),
      PrayerInfo('isha', 'Isha', '🌙', isha),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            "Today's Prayers",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkText
                  : AppColors.lightText,
            ),
          ),
        ),
        ...prayers.asMap().entries.map((entry) {
          final index = entry.key;
          final prayer = entry.value;
          return PrayerToggleCard(
                prayer: prayer,
                onToggle: () => onToggle(prayer.key),
              )
              .animate()
              .fadeIn(
                delay: Duration(milliseconds: 80 * index),
                duration: 400.ms,
              )
              .slideX(
                begin: 0.1,
                end: 0,
                delay: Duration(milliseconds: 80 * index),
                duration: 400.ms,
                curve: Curves.easeOutCubic,
              );
        }),
      ],
    );
  }
}
