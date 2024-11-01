import 'package:softorium_daily_planner/app.dart';
import 'package:softorium_daily_planner/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDatabase.init();
  runApp(const App());
}
