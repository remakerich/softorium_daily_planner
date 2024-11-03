import 'package:softorium_daily_planner/core/core.dart';

class TaskIndicator extends StatelessWidget {
  const TaskIndicator({
    super.key,
    required this.isDone,
  });

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: isDone ? Color(0xffCECECE) : Color(0xffEDEBF9),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
