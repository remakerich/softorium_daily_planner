import 'package:intl/intl.dart';
import 'package:softorium_daily_planner/core/core.dart';

extension DateTimeExtension on DateTime {
  String dayOfWeekShort(BuildContext context) {
    final day = DateFormat('E', AppLocalizations.of(context).localeName).format(this);
    return '${day[0].toUpperCase()}${day.substring(1, day.length)}';
  }

  String get dateReadable {
    return DateFormat('dd.MM.yyyy').format(this);
  }

  bool isTheSameDayWith(DateTime another) {
    final thisFormatted = DateTime(year, month, day);
    final anotherFormatted = DateTime(another.year, another.month, another.day);
    return thisFormatted.isAtSameMomentAs(anotherFormatted);
  }

  List<DateTime> get getDaysOfMonth {
    final daysOfMonth = <DateTime>[];
    final firstDayOfMonth = DateTime(year, month, 1);

    for (int i = 0; i < numberOfDaysInMonth; i++) {
      final day = firstDayOfMonth.add(Duration(days: i));
      daysOfMonth.add(day);
    }

    return daysOfMonth;
  }

  int get numberOfDaysInMonth {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }
}
