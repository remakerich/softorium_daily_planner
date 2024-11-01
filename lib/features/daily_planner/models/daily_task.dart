import 'package:softorium_daily_planner/core/core.dart';

part 'daily_task.freezed.dart';
part 'daily_task.g.dart';

@freezed
class DailyTask with _$DailyTask {
  factory DailyTask({
    required String id,
    required DateTime date,
    required DateTime createdAt,
    @Default(false) bool isDone,
    @Default('') String title,
  }) = _DailyTask;

  factory DailyTask.fromJson(Map<String, dynamic> json) => _$DailyTaskFromJson(json);
}
