class AppDateUtils {
  AppDateUtils._();

  static DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime today() => normalizeDate(DateTime.now());

  static DateTime startOfYear(int year) => DateTime(year, 1, 1);

  static DateTime endOfYear(int year) => DateTime(year, 12, 31);

  static String formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
