import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/models/daily_task.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/new_task_button.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final dayTasks = context.select<DailyPlannerProvider, List<DailyTask>>(
      (e) => e.tasksForSelectedDay,
    );

    final height = ((dayTasks.length + 1) * 45) + 15;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      height: height.toDouble(),
      child: RawScrollbar(
        padding: const EdgeInsets.fromLTRB(0, 18, 5, 14),
        radius: const Radius.circular(4),
        thickness: 4,
        thumbVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 15),
          itemCount: dayTasks.length + 1,
          itemBuilder: (context, index) {
            if (index == dayTasks.length) {
              return NewTaskButton();
            }

            return TaskTile(dayTasks[index]);
          },
        ),
      ),
    );
  }
}
