
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/app_colors.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      title: Text(
        'Raqiq',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: isDark ? AppColors.darkText : AppColors.lightText,
        ),
      ),
      actions: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.75, end: 1.0).animate(animation),
                    child: ScaleTransition(scale: animation, child: child),
                  );
                },
                child: Icon(
                  themeState.isDark
                      ? Icons.wb_sunny_rounded
                      : Icons.nightlight_round,
                  key: ValueKey(themeState.isDark),
                  color: AppColors.emerald,
                ),
              ),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
