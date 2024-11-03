import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/task_indicator.dart';

class NewTaskTile extends StatefulWidget {
  const NewTaskTile({super.key});

  @override
  State<NewTaskTile> createState() => _NewTaskTileState();
}

class _NewTaskTileState extends State<NewTaskTile> {
  @override
  Widget build(BuildContext context) {
    final taskInputEnabled = context.select<DailyPlannerProvider, bool>(
      (e) => e.taskInputEnabled,
    );

    return GestureDetector(
      onTap: context.read<DailyPlannerProvider>().enableTaskInput,
      child: Container(
        color: Colors.transparent,
        height: 45,
        child: Row(
          children: [
            TaskIndicator(isDone: false),
            Expanded(child: taskInputEnabled ? _NewTaskInputField() : _NewTaskLine()),
          ],
        ),
      ),
    );
  }
}

class _NewTaskLine extends StatelessWidget {
  const _NewTaskLine();

  @override
  Widget build(BuildContext context) {
    return Text(
      key: Key(IntegrationTestConstants.newTaskLineKey),
      'Новая задача',
      style: TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _NewTaskInputField extends StatefulWidget {
  const _NewTaskInputField();

  @override
  State<_NewTaskInputField> createState() => _NewTaskInputFieldState();
}

class _NewTaskInputFieldState extends State<_NewTaskInputField> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(removeTextFieldOnUnfocus);
  }

  removeTextFieldOnUnfocus() {
    if (!focusNode.hasFocus) {
      context.read<DailyPlannerProvider>().disableTaskInput();
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: context.read<DailyPlannerProvider>().newTaskController,
      autofocus: true,
      onSubmitted: (_) {
        context.read<DailyPlannerProvider>().addNewTask();
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        isDense: true,
      ),
    );
  }
}
