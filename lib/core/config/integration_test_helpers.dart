import 'package:softorium_daily_planner/core/core.dart';

class IntegrationTestHelper {
  static String getScrollDayButtonKey(
    List<DateTime> daysOfMonth,
    DateTime day,
  ) {
    final index = daysOfMonth.indexOf(day);
    final isToday = DateTime.now().isTheSameDayWith(day);

    late final String key;

    if (index == 0) {
      key = IntegrationTestConstants.firstDayButtonKey;
    } else if (index == daysOfMonth.length - 1) {
      key = IntegrationTestConstants.lastDayButtonKey;
    } else if (isToday) {
      key = IntegrationTestConstants.currentDayButtonKey;
    } else {
      key = '$index';
    }

    return key;
  }
}
