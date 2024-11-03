import 'package:flutter/services.dart';
import 'package:softorium_daily_planner/app.dart';
import 'package:softorium_daily_planner/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await HiveDatabase.init();
  runApp(const App());
}
