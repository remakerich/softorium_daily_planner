import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:softorium_daily_planner/core/extensions/datetime_extension.dart';
import 'package:softorium_daily_planner/features/daily_planner/data/daily_tasks_storage.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

// unit тестирование на примере класса DailyPlannerProvider

void main() {
  late DailyPlannerProvider plannerProvider;
  late MockDailyTasksStorage mockDailyTasksStorage;

  setUp(() {
    mockDailyTasksStorage = MockDailyTasksStorage();

    registerFallbackValue(DailyTask(id: '', date: DateTime.now(), createdAt: DateTime.now()));
    when(() => mockDailyTasksStorage.getTasks()).thenReturn({});
    when(() => mockDailyTasksStorage.put(any())).thenAnswer((_) async {});
    when(() => mockDailyTasksStorage.delete(any())).thenAnswer((_) async {});

    plannerProvider = DailyPlannerProvider(mockDailyTasksStorage);
  });

  test('new task controller is empty', () {
    final text = plannerProvider.newTaskController.text;
    expect(text, '');
  });

  test('selected day is today', () {
    final today = DateTime.now().onlyDate;
    expect(plannerProvider.selectedDay.onlyDate, today.onlyDate);
  });

  test('selected task id is null', () {
    expect(plannerProvider.selectedTaskId, null);
  });

  test('task input enabled is false', () {
    expect(plannerProvider.taskInputEnabled, false);
  });

  test('set selected day method', () {
    final selectedDay = DateTime.now();
    plannerProvider.setSelectedDay(selectedDay);
    expect(plannerProvider.selectedDay, selectedDay);
  });

  test('tasks for selected day is 0', () {
    expect(plannerProvider.tasksForSelectedDay.length, 0);
  });

  test('trying to add with empty title', () {
    plannerProvider.newTaskController.text = '';
    plannerProvider.addNewTask();
    expect(plannerProvider.tasksForSelectedDay.length, 0);
  });

  test('add new task', () {
    final newTaskTitle = 'new task';
    plannerProvider.newTaskController.text = newTaskTitle;
    plannerProvider.addNewTask();
    expect(plannerProvider.tasksForSelectedDay.length, 1);

    // check new task properties
    final createdTask = plannerProvider.tasksForSelectedDay.first;
    expect(createdTask.title, newTaskTitle);
    expect(createdTask.date, plannerProvider.selectedDay.onlyDate);
    expect(createdTask.isDone, false);

    // check that controller is empty after creating new task
    expect(plannerProvider.newTaskController.text, '');
  });

  test('toggle task done', () {
    plannerProvider.newTaskController.text = 'new task';
    plannerProvider.addNewTask();
    final newTask = plannerProvider.tasksForSelectedDay.first;
    plannerProvider.toggleTaskDone(newTask);
    final newTaskDone = plannerProvider.tasksForSelectedDay.first;
    expect(newTaskDone.isDone, true);
    plannerProvider.toggleTaskDone(newTaskDone);
    final newTaskUndone = plannerProvider.tasksForSelectedDay.first;
    expect(newTaskUndone.isDone, false);
  });

  test('delete task', () {
    plannerProvider.newTaskController.text = 'new task';
    plannerProvider.addNewTask();
    final newTask = plannerProvider.tasksForSelectedDay.first;
    plannerProvider.deleteTask(newTask);
    expect(plannerProvider.tasksForSelectedDay.length, 0);
  });

  test('select task', () {
    plannerProvider.newTaskController.text = 'new task';
    plannerProvider.addNewTask();
    final newTask = plannerProvider.tasksForSelectedDay.first;
    plannerProvider.selectTask(newTask);
    expect(plannerProvider.selectedTaskId, newTask.id);
  });

  test('enable task input', () {
    plannerProvider.enableTaskInput();
    expect(plannerProvider.taskInputEnabled, true);
  });

  test('disable task input', () {
    plannerProvider.newTaskController.text = 'test text';
    plannerProvider.enableTaskInput();
    plannerProvider.disableTaskInput();
    expect(plannerProvider.taskInputEnabled, false);
    expect(plannerProvider.newTaskController.text, '');
  });
}

class MockDailyTasksStorage extends Mock implements DailyTasksStorage {}
