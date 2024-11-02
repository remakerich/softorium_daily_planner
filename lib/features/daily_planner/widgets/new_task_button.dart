import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

class NewTaskButton extends StatefulWidget {
  const NewTaskButton({super.key});

  @override
  State<NewTaskButton> createState() => _NewTaskButtonState();
}

class _NewTaskButtonState extends State<NewTaskButton> {
  bool textFieldEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          textFieldEnabled = true;
        });
      },
      child: Container(
        height: 45,
        color: Colors.transparent,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Color(0xffEDEBF9),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: textFieldEnabled
                  ? _NewTaskInputField(
                      onTaskAdded: () {
                        setState(() {
                          textFieldEnabled = false;
                        });
                      },
                    )
                  : _NewTaskLine(),
            ),
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
      key: Key('new task line'),
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
      key: Key('new task input'),
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
