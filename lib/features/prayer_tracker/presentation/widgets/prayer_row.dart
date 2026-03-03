import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class PrayerRow extends StatelessWidget {
  final String icon;
  final String label;
  final bool done;
  final bool isDark;

  const PrayerRow({
    super.key,
    required this.icon,
    required this.label,
    required this.done,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.darkText : AppColors.lightText,
              ),
            ),
          ),
          Icon(
            done ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: done
                ? AppColors.emerald
                : (isDark ? AppColors.darkSubtext : AppColors.lightSubtext),
            size: 24,
          ),
        ],
      ),
    );
  }
}
