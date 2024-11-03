import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/days_horizontal_scroll.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/tasks_list.dart';

class DailyPlannerPage extends StatelessWidget {
  const DailyPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DailyPlannerProvider(),
        ),
      ],
      child: Stack(
        children: [
          _TasksList(),
          DaysHorizontalScroll(),
        ],
      ),
    );
  }
}

class _TasksList extends StatelessWidget {
  const _TasksList();

  @override
  Widget build(BuildContext context) {
    return _TaskListDecoration(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80),
          _PlanDateHeader(),
          Flexible(child: TasksList()),
        ],
      ),
    );
  }
}

class _TaskListDecoration extends StatelessWidget {
  const _TaskListDecoration({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.fromLTRB(18, 30, 18, 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              color: Color(0xff260347).withOpacity(.08),
              blurRadius: 8,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: child,
        ),
      ),
    );
  }
}

class _PlanDateHeader extends StatelessWidget {
  const _PlanDateHeader();

  @override
  Widget build(BuildContext context) {
    final selectedDay = context.select<DailyPlannerProvider, DateTime>(
      (e) => e.selectedDay,
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text('План на день ${selectedDay.dateReadable}'),
    );
  }
}
