import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

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
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.fromLTRB(18, 31, 18, 18),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DaysHorizontalScroll(),
            _PlanDateHeader(),
            Flexible(
              child: _TasksList(),
            ),
          ],
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
      child: Text(
        'План на день ${selectedDay.dateReadable}',
      ),
    );
  }
}

class _TasksList extends StatelessWidget {
  const _TasksList();

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      padding: const EdgeInsets.fromLTRB(0, 18, 5, 30),
      radius: const Radius.circular(4),
      thickness: 4,
      thumbVisibility: true,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(18, 18, 18, 30),
        itemCount: 10,
        itemBuilder: (context, index) => Text('asd asd '),
      ),
    );
  }
}

class _DaysHorizontalScroll extends StatelessWidget {
  const _DaysHorizontalScroll();

  @override
  Widget build(BuildContext context) {
    final daysOfMonth = DateTime.now().getDaysOfMonth;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xffEDEBF9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ListView.separated(
          padding: EdgeInsets.all(12),
          scrollDirection: Axis.horizontal,
          itemCount: daysOfMonth.length,
          separatorBuilder: (context, index) => SizedBox(width: 12),
          itemBuilder: (context, index) {
            final day = daysOfMonth[index];
            return _DayButton(day);
          },
        ),
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
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffBEB7EB) : Colors.white,
          borderRadius: BorderRadius.circular(24),
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
    );
  }
}
