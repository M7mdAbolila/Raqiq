import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/streak_info.dart';

class StreakWidget extends StatelessWidget {
  final StreakInfo streakInfo;

  const StreakWidget({super.key, required this.streakInfo});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [AppColors.darkCard, AppColors.darkSurface]
              : [AppColors.lightCard, AppColors.lightSurface],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.emerald.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('🔥', style: const TextStyle(fontSize: 40))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleXY(
                begin: 0.9,
                end: 1.1,
                duration: 800.ms,
                curve: Curves.easeInOut,
              )
              .shimmer(
                duration: 1200.ms,
                color: AppColors.emerald.withValues(alpha: 0.3),
              ),
          const SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  '${streakInfo.currentStreak}',
                  key: ValueKey(streakInfo.currentStreak),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
                ),
              ),
              Text(
                'day streak',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.darkSubtext
                      : AppColors.lightSubtext,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Container(
            width: 1,
            height: 50,
            color: (isDark ? AppColors.darkSubtext : AppColors.lightSubtext)
                .withValues(alpha: 0.3),
          ),
          const SizedBox(width: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${streakInfo.longestStreak}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.emerald,
                ),
              ),
              Text(
                'best',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.darkSubtext
                      : AppColors.lightSubtext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
