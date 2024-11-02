import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

class DaysHorizontalScroll extends StatelessWidget {
  const DaysHorizontalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final daysOfMonth = DateTime.now().getDaysOfMonth;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xffEDEBF9),
      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6),
        scrollDirection: Axis.horizontal,
        itemCount: daysOfMonth.length,
        itemBuilder: (context, index) {
          final day = daysOfMonth[index];
          return _DayButton(day);
        },
      ),
    );
  }
}

class _DayButton extends StatelessWidget {
  const _DayButton(this.day);

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final isToday = DateTime.now().isTheSameDayWith(day);

    final selectedDay = context.select<DailyPlannerProvider, DateTime>(
      (e) => e.selectedDay,
    );

    final isSelected = day.isTheSameDayWith(selectedDay);

    return GestureDetector(
      onTap: () {
        context.read<DailyPlannerProvider>().setSelectedDay(day);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          width: 40,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xffBEB7EB) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 4,
                height: 4,
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isToday ? Color(0xffD9D9D9) : Colors.transparent,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${day.day}',
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                ),
              ),
              Text(
                day.dayOfWeekShort(context),
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xffAFABC6),
                ),
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
