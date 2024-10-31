import 'package:softorium_daily_planner/core/core.dart';

class DailyPlannerProvider extends ProviderBase {
  DateTime get selectedDay => _selectedDay;
  DateTime _selectedDay = DateTime.now();

  setSelectedDay(DateTime day) {
    _selectedDay = day;
    emit();
  }
}
