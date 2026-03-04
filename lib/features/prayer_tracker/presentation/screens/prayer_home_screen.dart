import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/theme/app_colors.dart';
import '../cubit/prayer_cubit.dart';
import '../cubit/prayer_state.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/loaded_content_widget.dart';

class PrayerTrakerScreen extends StatefulWidget {
  const PrayerTrakerScreen({super.key});

  @override
  State<PrayerTrakerScreen> createState() => _PrayerTrakerScreenState();
}

class _PrayerTrakerScreenState extends State<PrayerTrakerScreen> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          BlocConsumer<PrayerCubit, PrayerState>(
            listener: (context, state) {
              if (state is PrayerLoaded && state.showConfetti) {
                _confettiController.play();
              }
            },
            builder: (context, state) {
              if (state is PrayerLoading || state is PrayerInitial) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.emerald),
                );
              }

              if (state is PrayerError) {
                return _buildErrorWidget(state, context);
              }

              final loaded = state as PrayerLoaded;
              return LoadedContentWidget(state: loaded);
            },
          ),
          // Confetti overlay
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            numberOfParticles: 25,
            maxBlastForce: 15,
            minBlastForce: 5,
            emissionFrequency: 0.06,
            gravity: 0.2,
            colors: const [
              AppColors.emerald,
              AppColors.emeraldLight,
              AppColors.emeraldDark,
              Colors.white,
            ],
          ),
        ],
      ),
    );
  }

  Center _buildErrorWidget(PrayerError state, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(state.message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<PrayerCubit>().loadData(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
