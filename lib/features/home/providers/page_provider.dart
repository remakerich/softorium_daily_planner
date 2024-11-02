import 'package:softorium_daily_planner/core/core.dart';

class PageProvider extends ProviderBase {
  final pageController = PageController();

  int _currentTab = 0;
  int get currentTab => _currentTab;

  onPageChanged(int index) {
    _currentTab = index;
    emit();
  }

  onNavBarButtonTap(int index) {
    final duration = (currentTab - index).abs() * 200;

    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: duration),
      curve: Curves.ease,
    );
  }
}
