import 'package:softorium_daily_planner/core/core.dart';
import 'package:softorium_daily_planner/features/daily_planner/widgets/daily_planner_page.dart';
import 'package:softorium_daily_planner/features/home/widgets/default_page.dart';

part 'app_page.freezed.dart';

@freezed
class AppPage with _$AppPage {
  const AppPage._();

  const factory AppPage.dailyPlanner() = AppPageDailyPlanner;
  const factory AppPage.cards() = AppPageCards;
  const factory AppPage.chart() = AppPageChart;
  const factory AppPage.notifications() = AppPageNotifications;

  static List<AppPage> get all => [
        const AppPage.dailyPlanner(),
        const AppPage.cards(),
        const AppPage.chart(),
        const AppPage.notifications(),
      ];

  int get index => all.indexOf(this);

  Widget get page => when(
        dailyPlanner: () => DailyPlannerPage(),
        cards: () => DefaultPage(page: this),
        chart: () => DefaultPage(page: this),
        notifications: () => DefaultPage(page: this),
      );

  String get name => when(
        dailyPlanner: () => 'План на день',
        cards: () => 'Карточки',
        chart: () => 'Диаграмма',
        notifications: () => 'Уведомления',
      );

  static const _assetsPath = 'assets/icons/';

  String get svgIcon => when(
        dailyPlanner: () => '${_assetsPath}daily_planner.svg',
        cards: () => '${_assetsPath}cards.svg',
        chart: () => '${_assetsPath}chart.svg',
        notifications: () => '${_assetsPath}notification.svg',
      );
}
