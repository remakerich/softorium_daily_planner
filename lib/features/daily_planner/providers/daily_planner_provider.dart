import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/data/daily_tasks_storage.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';
import 'package:uuid/v4.dart';

class DailyPlannerProvider extends ProviderBase {
  DailyPlannerProvider() {
    init();
  }

  DateTime get selectedDay => _selectedDay;
  DateTime _selectedDay = DateTime.now();

  late final Map<DateTime, List<DailyTask>> _tasksByDate;

  final newTaskController = TextEditingController();

  String? get selectedTaskId => _selectedTaskId;
  String? _selectedTaskId;

  final _dailyTasksStorage = DailyTasksStorage();

  init() {
    _tasksByDate = _dailyTasksStorage.getTasks();
  }

  setSelectedDay(DateTime day) {
    _selectedDay = day;
    emit();
  }

  List<DailyTask> get tasksForSelectedDay {
    final dateKey = selectedDay.onlyDate;
    return (_tasksByDate[dateKey] ?? []).toList();
  }

  addNewTask() {
    final title = newTaskController.text.trim();

    if (title.isEmpty) {
      return;
    }

    final newTask = DailyTask(
      id: const UuidV4().generate(),
      date: _selectedDay.onlyDate,
      createdAt: DateTime.now(),
      title: title,
    );

    final dateKey = selectedDay.onlyDate;
    _tasksByDate[dateKey] == null ? _tasksByDate[dateKey] = [newTask] : _tasksByDate[dateKey]!.add(newTask);

    emit();
    newTaskController.clear();
    _dailyTasksStorage.put(newTask);
  }

  toggleTaskDone(DailyTask task) {
    final updatedTasks = tasksForSelectedDay;
    final taskIndex = updatedTasks.indexOf(task);
    final newTask = task.copyWith(isDone: !task.isDone);
    updatedTasks[taskIndex] = newTask;
    _tasksByDate[selectedDay.onlyDate] = updatedTasks;
    emit();
    _dailyTasksStorage.put(newTask);
  }

  deleteTask(DailyTask task) {
    final updatedTasks = tasksForSelectedDay;
    updatedTasks.remove(task);
    _tasksByDate[selectedDay.onlyDate] = updatedTasks;
    emit();
    _dailyTasksStorage.delete(task);
  }

  selectTask(DailyTask task) {
    if (_selectedTaskId == task.id) {
      _selectedTaskId = null;
      emit();
      return;
    }

    _selectedTaskId = task.id;
    emit();
  }
}
