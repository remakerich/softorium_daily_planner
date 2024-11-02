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

    return Material(
      color: isTaskSelected ? Color(0xffBEB7EB).withOpacity(.2) : Colors.white,
      child: InkWell(
        splashColor: Color(0xffBEB7EB).withOpacity(.2),
        highlightColor: Color(0xffBEB7EB).withOpacity(.2),
        onLongPress: () {
          HapticFeedback.mediumImpact();
          context.read<DailyPlannerProvider>().toggleTaskDone(task);
        },
        onTap: () {
          context.read<DailyPlannerProvider>().selectTask(task);
        },
        child: SizedBox(
          height: 45,
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Удалить',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
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
