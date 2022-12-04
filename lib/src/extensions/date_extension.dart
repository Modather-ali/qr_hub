class DateUtil {
  static final Map<int, String> _weekDayFull = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday'
  };

  String get currantDate {
    DateTime date = DateTime.now();
    return "${_weekDayFull[date.weekday]}, ${date.day}/${date.month}/${date.year}";
  }
}
