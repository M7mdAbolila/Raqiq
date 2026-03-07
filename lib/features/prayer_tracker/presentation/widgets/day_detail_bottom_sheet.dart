import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/entities/prayer_day.dart';
import '../cubit/prayer_state.dart';
import 'prayer_row.dart';

class DayDetailBottomSheet extends StatelessWidget {
  final DateTime date;
  final PrayerDay? prayerDay;

  const DayDetailBottomSheet({super.key, required this.date, this.prayerDay});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final day = prayerDay;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSubtext : AppColors.lightSubtext,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            AppDateUtils.formatDate(date),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            day != null
                ? '${day.completedCount}/5 prayers completed'
                : 'No data recorded',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.darkSubtext : AppColors.lightSubtext,
            ),
          ),
          const SizedBox(height: 24),

          if (day != null) ...[
            PrayerRow(
              icon: '🌅',
              label: 'Fajr',
              done: day.fajr,
              isDark: isDark,
            ),
            PrayerRow(
              icon: '🌞',
              label: 'Dhuhr',
              done: day.dhuhr,
              isDark: isDark,
            ),
            PrayerRow(icon: '🌤️', label: 'Asr', done: day.asr, isDark: isDark),
            PrayerRow(
              icon: '🌇',
              label: 'Maghrib',
              done: day.maghrib,
              isDark: isDark,
            ),
            PrayerRow(
              icon: '🌙',
              label: 'Isha',
              done: day.isha,
              isDark: isDark,
            ),
          ] else
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No prayers tracked on this day.',
                style: TextStyle(
                  color: isDark
                      ? AppColors.darkSubtext
                      : AppColors.lightSubtext,
                ),
              ),
            ),
        ],
      ),
    );
  }

  static void showDayDetailsBottomSheet(
    BuildContext context,
    PrayerLoaded state,
    DateTime date,
  ) {
    final normalized = AppDateUtils.normalizeDate(date);
    final dayData = state.heatmapData[normalized];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          DayDetailBottomSheet(date: normalized, prayerDay: dayData),
    );
  }
}
