class DatetimeFormatter {
  static String formattedDateTime(DateTime dateTime) {
    DateTime localDateTime = dateTime.toLocal();

    return '${_formatTwoDigits(localDateTime.day)}/'
        '${_formatTwoDigits(localDateTime.month)}/'
        '${localDateTime.year} '
        '${_formatTwoDigits(localDateTime.hour)}:'
        '${_formatTwoDigits(localDateTime.minute)}';
  }

  static String _formatTwoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }
}
