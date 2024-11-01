import 'package:flutter/services.dart';
import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
    this.task, {
    super.key,
  });

  final DailyTask task;

  @override
  Widget build(BuildContext context) {
    final isTaskSelected = context.select<DailyPlannerProvider, bool>(
      (e) => e.selectedTaskId == task.id,
    );

    return SizedBox(
      height: 40,
      child: Material(
        color: isTaskSelected ? Color(0xffBEB7EB).withOpacity(.2) : Colors.white,
        child: InkWell(
          onLongPress: () {
            HapticFeedback.mediumImpact();
            context.read<DailyPlannerProvider>().toggleTaskDone(task);
          },
          onTap: () {
            context.read<DailyPlannerProvider>().selectTask(task);
          },
          child: Row(
            children: [
              const SizedBox(width: 20),
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: task.isDone ? Color(0xffCECECE) : Color(0xffEDEBF9),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: task.isDone ? Color(0xffCECECE) : null,
                  ),
                ),
              ),
              if (isTaskSelected)
                GestureDetector(
                  onTap: () {
                    context.read<DailyPlannerProvider>().deleteTask(task);
                  },
                  child: Container(
                    height: 40,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    child: Text(
                      'Удалить',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
