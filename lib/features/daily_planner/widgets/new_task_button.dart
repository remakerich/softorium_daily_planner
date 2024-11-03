import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/task_indicator.dart';

class NewTaskButton extends StatefulWidget {
  const NewTaskButton({super.key});

  @override
  State<NewTaskButton> createState() => _NewTaskButtonState();
}

class _NewTaskButtonState extends State<NewTaskButton> {
  bool textFieldEnabled = false;

  @override
  Widget build(BuildContext context) {
    final inputField = _NewTaskInputField(
      onTaskAdded: () {
        setState(() {
          textFieldEnabled = false;
        });
      },
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          textFieldEnabled = true;
        });
      },
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            TaskIndicator(isDone: false),
            Expanded(child: textFieldEnabled ? inputField : _NewTaskLine()),
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

class _NewTaskInputField extends StatelessWidget {
  const _NewTaskInputField({
    required this.onTaskAdded,
  });

  final VoidCallback onTaskAdded;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<DailyPlannerProvider>().newTaskController,
      autofocus: true,
      onSubmitted: (_) {
        onTaskAdded();
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
