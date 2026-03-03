import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/theme/app_colors.dart';
import 'prayer_toggle_section.dart';

class PrayerToggleCard extends StatelessWidget {
  final PrayerInfo prayer;
  final VoidCallback onToggle;

  const PrayerToggleCard({
    super.key,
    required this.prayer,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isCompleted = prayer.isCompleted;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onToggle();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColors.emerald.withValues(alpha: isDark ? 0.2 : 0.12)
                : isDark
                ? AppColors.darkCard
                : AppColors.lightSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isCompleted
                  ? AppColors.emerald.withValues(alpha: 0.5)
                  : isDark
                  ? AppColors.darkCard
                  : AppColors.emerald.withValues(alpha: 0.1),
              width: 2,
            ),
            boxShadow: [
              if (isCompleted)
                BoxShadow(
                  color: AppColors.emerald.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Row(
            children: [
              Text(prayer.icon, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  prayer.label,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: isCompleted
                        ? AppColors.emerald
                        : isDark
                        ? AppColors.darkText
                        : AppColors.lightText,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: isCompleted
                    ? Icon(
                        Icons.check_circle_rounded,
                        key: const ValueKey('checked'),
                        color: AppColors.emerald,
                        size: 28,
                      )
                    : Icon(
                        Icons.radio_button_unchecked_rounded,
                        key: const ValueKey('unchecked'),
                        color: isDark
                            ? AppColors.darkSubtext
                            : AppColors.lightSubtext,
                        size: 28,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
