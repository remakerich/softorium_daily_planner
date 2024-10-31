import 'package:softorium_daily_planner/core/core.dart';

class ProviderBase extends ChangeNotifier {
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void emit() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
