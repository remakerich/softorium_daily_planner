import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';

class DailyTasksStorage {
  static final _box = Hive.box(HiveBoxes.dailyTasks);

  Map<DateTime, List<DailyTask>> getTasks() {
    final allTasks = _box.values.map((json) => DailyTask.fromJson(Map.from(json)));

    final Map<DateTime, List<DailyTask>> tasksByDate = {};

    for (final task in allTasks) {
      tasksByDate[task.date] == null ? tasksByDate[task.date] = [task] : tasksByDate[task.date]!.add(task);
    }

    for (final key in tasksByDate.keys) {
      final tasks = tasksByDate[key]!;
      tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }

    return tasksByDate;
  }

  Future<void> put(DailyTask task) async {
    await _box.put(task.id, task.toJson());
  }

  Future<void> delete(DailyTask task) async {
    await _box.delete(task.id);
  }
}
