import 'package:flutter/material.dart';
import 'package:contribution_heatmap/contribution_heatmap.dart';
import '../../domain/entities/prayer_day.dart';
import '../../../../app/theme/app_colors.dart';

class HeatmapSection extends StatelessWidget {
  final Map<DateTime, PrayerDay> heatmapData;
  final void Function(DateTime date, int value)? onDayTap;

  const HeatmapSection({super.key, required this.heatmapData, this.onDayTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final now = DateTime.now();

    final entries = heatmapData.entries
        .map((e) => ContributionEntry(e.key, e.value.completedCount))
        .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 4),
            child: Text(
              '${now.year} Prayer Map',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.darkText : AppColors.lightText,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ContributionHeatmap(
              entries: entries,
              minDate: DateTime(now.year, 1, 1),
              maxDate: DateTime(now.year, 12, 31),
              cellSize: 18,
              cellSpacing: 3,
              cellRadius: 3,
              heatmapColor: HeatmapColor.green,
              showMonthLabels: true,
              weekdayLabel: WeekdayLabel.full,
              monthTextStyle: TextStyle(
                fontSize: 10,
                color: isDark ? AppColors.darkSubtext : AppColors.lightSubtext,
              ),
              weekdayTextStyle: TextStyle(
                fontSize: 10,
                color: isDark ? AppColors.darkSubtext : AppColors.lightSubtext,
              ),
              onCellTap: onDayTap,
            ),
          ),
        ],
      ),
    );
  }
}
