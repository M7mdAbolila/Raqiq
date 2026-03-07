import 'package:flutter_test/flutter_test.dart';

/// Pure function version of the Duolingo streak algorithm for testability.
/// Mirrors the logic in PrayerLocalDataSourceImpl.updateStreak().
({int currentStreak, int longestStreak, DateTime? lastCompletedDate})
applyStreakAlgorithm({
  required int currentStreak,
  required int longestStreak,
  required DateTime? lastCompletedDate,
  required DateTime date,
}) {
  final normalizedDate = DateTime(date.year, date.month, date.day);

  if (lastCompletedDate == null) {
    // Case 1: First ever completion
    currentStreak = 1;
  } else {
    final lastDate = DateTime(
      lastCompletedDate.year,
      lastCompletedDate.month,
      lastCompletedDate.day,
    );
    final diff = normalizedDate.difference(lastDate).inDays;

    if (diff == 0) {
      // Already counted today — no-op
      return (
        currentStreak: currentStreak,
        longestStreak: longestStreak,
        lastCompletedDate: lastCompletedDate,
      );
    } else if (diff == 1) {
      // Consecutive day
      currentStreak += 1;
    } else if (diff > 1) {
      // Streak broken
      currentStreak = 1;
    }
  }

  // Update longest streak
  if (currentStreak > longestStreak) {
    longestStreak = currentStreak;
  }

  return (
    currentStreak: currentStreak,
    longestStreak: longestStreak,
    lastCompletedDate: normalizedDate,
  );
}

/// Pure function version of the decrease algorithm for testability.
/// Mirrors the logic in PrayerLocalDataSourceImpl.decreaseStreak().
({int currentStreak, int longestStreak, DateTime? lastCompletedDate})
applyDecreaseAlgorithm({
  required int currentStreak,
  required int longestStreak,
  required DateTime? lastCompletedDate,
  required DateTime date,
}) {
  final normalizedDate = DateTime(date.year, date.month, date.day);

  if (lastCompletedDate == null) {
    return (
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      lastCompletedDate: lastCompletedDate,
    );
  }

  final lastDate = DateTime(
    lastCompletedDate.year,
    lastCompletedDate.month,
    lastCompletedDate.day,
  );
  final diff = normalizedDate.difference(lastDate).inDays;

  if (diff == 0) {
    if (currentStreak > 0) {
      currentStreak -= 1;
    }

    if (currentStreak == 0) {
      lastCompletedDate = null;
    } else {
      lastCompletedDate = normalizedDate.subtract(const Duration(days: 1));
    }

    if (longestStreak > 0 && longestStreak == currentStreak + 1) {
      longestStreak -= 1;
    }
  }

  return (
    currentStreak: currentStreak,
    longestStreak: longestStreak,
    lastCompletedDate: lastCompletedDate,
  );
}

void main() {
  group('Streak Algorithm - Increase', () {
    test('First ever completion sets currentStreak to 1', () {
      final result = applyStreakAlgorithm(
        currentStreak: 0,
        longestStreak: 0,
        lastCompletedDate: null,
        date: DateTime(2026, 3, 7),
      );

      expect(result.currentStreak, 1);
      expect(result.longestStreak, 1);
      expect(result.lastCompletedDate, DateTime(2026, 3, 7));
    });

    test('Same day duplicate does nothing', () {
      final result = applyStreakAlgorithm(
        currentStreak: 3,
        longestStreak: 5,
        lastCompletedDate: DateTime(2026, 3, 7),
        date: DateTime(2026, 3, 7),
      );

      expect(result.currentStreak, 3);
      expect(result.longestStreak, 5);
      expect(result.lastCompletedDate, DateTime(2026, 3, 7));
    });

    test('Consecutive day increments currentStreak', () {
      final result = applyStreakAlgorithm(
        currentStreak: 3,
        longestStreak: 5,
        lastCompletedDate: DateTime(2026, 3, 6),
        date: DateTime(2026, 3, 7),
      );

      expect(result.currentStreak, 4);
      expect(result.longestStreak, 5);
      expect(result.lastCompletedDate, DateTime(2026, 3, 7));
    });

    test('Gap of 2+ days resets currentStreak to 1', () {
      final result = applyStreakAlgorithm(
        currentStreak: 10,
        longestStreak: 10,
        lastCompletedDate: DateTime(2026, 3, 4),
        date: DateTime(2026, 3, 7),
      );

      expect(result.currentStreak, 1);
      expect(result.longestStreak, 10);
      expect(result.lastCompletedDate, DateTime(2026, 3, 7));
    });
  });

  group('Streak Algorithm - Decrease', () {
    test('Decreasing streak from 1 goes to 0 and clears date', () {
      final result = applyDecreaseAlgorithm(
        currentStreak: 1,
        longestStreak: 1,
        lastCompletedDate: DateTime(2026, 3, 7),
        date: DateTime(2026, 3, 7),
      );

      expect(result.currentStreak, 0);
      expect(result.longestStreak, 0); // Longest is rolled back
      expect(result.lastCompletedDate, null);
    });

    test('Decreasing multi-day streak rolls back date and currentStreak', () {
      final result = applyDecreaseAlgorithm(
        currentStreak: 5,
        longestStreak: 5,
        lastCompletedDate: DateTime(2026, 3, 7),
        date: DateTime(2026, 3, 7),
      );

      expect(result.currentStreak, 4);
      expect(
        result.longestStreak,
        4,
      ); // Longest is rolled back because they were equal
      expect(result.lastCompletedDate, DateTime(2026, 3, 6)); // Yesterday
    });

    test(
      'Decreasing keeps longestStreak if it was higher from a previous streak',
      () {
        final result = applyDecreaseAlgorithm(
          currentStreak: 2,
          longestStreak: 10, // record set in the past
          lastCompletedDate: DateTime(2026, 3, 7),
          date: DateTime(2026, 3, 7),
        );

        expect(result.currentStreak, 1);
        expect(result.longestStreak, 10); // remains 10
        expect(result.lastCompletedDate, DateTime(2026, 3, 6));
      },
    );

    test('Decreasing different day does nothing', () {
      // e.g. unchecking a prayer from 3 days ago, shouldn't affect current streak of today
      final result = applyDecreaseAlgorithm(
        currentStreak: 5,
        longestStreak: 5,
        lastCompletedDate: DateTime(2026, 3, 7),
        date: DateTime(2026, 3, 4),
      );

      expect(result.currentStreak, 5);
      expect(result.longestStreak, 5);
      expect(result.lastCompletedDate, DateTime(2026, 3, 7));
    });
  });
}
