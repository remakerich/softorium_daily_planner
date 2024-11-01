import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => ChangeNotifierProvider.value(
                value: context.read<DailyPlannerProvider>(),
                child: _NewTaskTitleDialog(),
              ),
            );
          },
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
                child: Text(
                  'Новая задача',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewTaskTitleDialog extends StatelessWidget {
  const _NewTaskTitleDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _NewTaskInputField(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: Navigator.of(context).pop,
                  child: Text('Отмена'),
                ),
                TextButton(
                  onPressed: () => context.read<DailyPlannerProvider>().addNewTask(context),
                  child: Text('Сохранить'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NewTaskInputField extends StatelessWidget {
  const _NewTaskInputField();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xffBEB7EB),
        ),
      ),
      child: TextField(
        controller: context.read<DailyPlannerProvider>().newTaskController,
        autofocus: true,
        onSubmitted: (_) => context.read<DailyPlannerProvider>().addNewTask(context),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'Название задачи',
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}
