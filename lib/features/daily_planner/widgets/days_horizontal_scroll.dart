import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/providers/daily_planner_provider.dart';

class DaysHorizontalScroll extends StatefulWidget {
  const DaysHorizontalScroll({super.key});

  @override
  State<DaysHorizontalScroll> createState() => _DaysHorizontalScrollState();
}

class _DaysHorizontalScrollState extends State<DaysHorizontalScroll> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelectedMonth());
  }

  void _scrollToSelectedMonth() {
    Scrollable.ensureVisible(
      GlobalObjectKey(IntegrationTestConstants.currentDayButtonKey).currentContext!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysOfMonth = DateTime.now().getDaysOfMonth;

    return _DaysScrollDecoration(
      child: SingleChildScrollView(
        key: Key(IntegrationTestConstants.datesScrollKey),
        padding: EdgeInsets.symmetric(horizontal: 6),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...daysOfMonth.map(
              (day) {
                final key = IntegrationTestHelper.getScrollDayButtonKey(daysOfMonth, day);

                return SizedBox(
                  key: GlobalObjectKey(key),
                  child: _DayButton(key: Key(key), day),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DaysScrollDecoration extends StatelessWidget {
  const _DaysScrollDecoration({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 30, 18, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xffEDEBF9),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _DayButton extends StatelessWidget {
  const _DayButton(
    this.day, {
    super.key,
  });

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select<DailyPlannerProvider, bool>(
      (e) => day.isTheSameDayWith(e.selectedDay),
    );

    return GestureDetector(
      onTap: () {
        context.read<DailyPlannerProvider>().setSelectedDay(day);
        FocusScope.of(context).unfocus();
      },
      child: _DayButtonDecoration(
        isSelected: isSelected,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CurrentDayIndicator(day),
            _DayNumber(day: day, isSelected: isSelected),
            _DayName(day: day, isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _DayName extends StatelessWidget {
  const _DayName({
    required this.day,
    required this.isSelected,
  });

  final DateTime day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        day.dayOfWeekShort(context),
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xffAFABC6),
        ),
      ),
    );
  }
}

class _DayNumber extends StatelessWidget {
  const _DayNumber({
    required this.day,
    required this.isSelected,
  });

  final DateTime day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${day.day}',
      style: TextStyle(
        color: isSelected ? Colors.white : null,
      ),
    );
  }
}

class _CurrentDayIndicator extends StatelessWidget {
  const _CurrentDayIndicator(
    this.day,
  );

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final isToday = DateTime.now().isTheSameDayWith(day);

    return Container(
      width: 4,
      height: 4,
      margin: EdgeInsets.only(top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isToday ? Color(0xffD9D9D9) : Colors.transparent,
      ),
    );
  }
}

class _DayButtonDecoration extends StatelessWidget {
  const _DayButtonDecoration({
    required this.isSelected,
    required this.child,
  });

  final bool isSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: child,
      ),
    );
  }
}
