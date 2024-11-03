import 'package:flutter/services.dart';
import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/task_indicator.dart';

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
              TaskIndicator(isDone: task.isDone),
              Expanded(child: _TaskTitle(task)),
              if (isTaskSelected) _DeleteTaskButton(task),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskTitle extends StatelessWidget {
  const _TaskTitle(this.task);
  final DailyTask task;

  @override
  Widget build(BuildContext context) {
    return Text(
      task.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: task.isDone ? Color(0xffCECECE) : null,
      ),
    );
  }
}

class _DeleteTaskButton extends StatelessWidget {
  const _DeleteTaskButton(this.task);

  final DailyTask task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DailyPlannerProvider>().deleteTask(task);
      },
      child: Container(
        key: Key(IntegrationTestConstants.deleteTaskButtonKey),
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
    );
  }
}
