import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/data/daily_tasks_storage.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/new_task_tile.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/tasks_list.dart';

class MockDailyTasksStorage extends Mock implements DailyTasksStorage {}

// widget тестирование на примере виджета TasksList

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

  testWidgets('create, toggle and delete task', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => plannerProvider,
            ),
          ],
          child: Scaffold(
            body: TasksList(),
          ),
        ),
      ),
    );

    final newTaskTileFinder = find.byType(NewTaskTile);
    expect(newTaskTileFinder, findsOneWidget);
    await tester.tap(newTaskTileFinder);
    await tester.pump();

    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'new task');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(textFieldFinder, findsNothing);

    final newTaskTitleFinder = find.text('new task');
    expect(newTaskTitleFinder, findsOneWidget);

    Text newTaskTitle = tester.firstWidget<Text>(newTaskTitleFinder);
    expect(newTaskTitle.style!.color, null);

    await tester.longPress(newTaskTitleFinder);
    await tester.pumpAndSettle();
    newTaskTitle = tester.firstWidget<Text>(newTaskTitleFinder);
    expect(newTaskTitle.style!.color, AppColors.taskDone);

    await tester.tap(newTaskTitleFinder);
    await tester.pump();
    final deleteButtonFinder = find.byKey(Key(IntegrationTestConstants.deleteTaskButtonKey));
    expect(deleteButtonFinder, findsOneWidget);

    await tester.tap(deleteButtonFinder);
    await tester.pump();
    expect(newTaskTitleFinder, findsNothing);
  });
}
