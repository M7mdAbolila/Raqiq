import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raqiq/features/prayer_tracker/presentation/cubit/prayer_cubit.dart';

import '../cubit/prayer_state.dart';
import 'day_detail_bottom_sheet.dart';
import 'heatmap_section.dart';
import 'prayer_toggle_section.dart';
import 'progress_ring_widget.dart';
import 'streak_widget.dart';

class LoadedContentWidget extends StatelessWidget {
  final PrayerLoaded state;
  const LoadedContentWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Column(
        children: [
          StreakWidget(streak: state.streak)
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: -0.1, end: 0, duration: 500.ms),
          const SizedBox(height: 24),

          ProgressRingWidget(completedCount: state.today.completedCount)
              .animate()
              .fadeIn(duration: 500.ms, delay: 100.ms)
              .scaleXY(begin: 0.9, end: 1, duration: 500.ms, delay: 100.ms),
          const SizedBox(height: 24),

          // Yearly Heatmap
          HeatmapSection(
                heatmapData: state.heatmapData,
                onDayTap: (date, value) =>
                    DayDetailBottomSheet.showDayDetailsBottomSheet(
                      context,
                      state,
                      date,
                    ),
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 200.ms)
              .slideY(begin: 0.1, end: 0, duration: 500.ms, delay: 200.ms),
          const SizedBox(height: 24),

          PrayerToggleSection(
            fajr: state.today.fajr,
            dhuhr: state.today.dhuhr,
            asr: state.today.asr,
            maghrib: state.today.maghrib,
            isha: state.today.isha,
            onToggle: (name) => context.read<PrayerCubit>().togglePrayer(name),
          ),
        ],
      ),
    );
  }
}
